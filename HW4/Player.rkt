#lang racket

(provide Identifier%)
(define Identifier% (class object%
                            (init-field id name)
                            (super-new)))

(provide Player)
(define Player (interface () getRow getSticks ))

(provide HumanPlayer%)
(define HumanPlayer% (class* Identifier% (Player)
                            (init id name)
                            (super-new [id id] [name name])

                            (define/public (getRow board)
                                           (printf "Please enter a row: ")
                                           (define inputted_num (string->number (read-line
                                                                  (current-input-port))))
                                           (if (not(number? inputted_num))
                                             ( (lambda (board) 
                                                 (printf "Not a number\n")
                                                 (getRow board))
                                              board)
                                             inputted_num))

                            (define/public (getSticks board rowChosen)
                                           (printf "Please the number of sticks to take: ")
                                           (define inputted_num (string->number (read-line
                                                                  (current-input-port))))
                                           (if (not(number? inputted_num))
                                             ( (lambda (board) 
                                                 (printf "Not a number\n")
                                                 (getSticks board rowChosen))
                                              board )
                                             inputted_num))))
; BEGIN RANDOM HELPERS
(define (randomRow board [randgen (make-pseudo-random-generator)])
  (+ 1 (random (length board) randgen)))

; END RANDOM HELPERS

(provide RandomPlayer%)
(define RandomPlayer% (class* Identifier% (Player)
                            (init id name)
                            (define randGen (make-pseudo-random-generator))
                            (super-new [id id] [name name])

                            ; Note that the RandomPlayer does not know what rows
                            ; are empty so may choose an invalid row
                            (define/public (getRow board)
                                           (randomRow board randGen))

                            ; return a random number of sticks based on the
                            ; number of sticks in the row chosen
                            (define/public (getSticks board rowChosen)
                                             (+ 1 (random 
                                                    (length 
                                                      (list-ref board (- rowChosen 1)))
                                                    randGen)))))

; BEGIN AI HELPERS

(define (rowBitSum arrayInts )
  (foldr 
    (lambda (x sum )
      (bitwise-xor sum x ))
    0
    arrayInts))

(define (nimSum board)
  (rowBitSum (map length board )))

; has heap decreases after performing an xor operation with the nimSum
(define (isHeapDecrease? row sum)
  (< (bitwise-xor sum (length row)) (length row)))

(define (heapDifference row sum)
  (- (length row) (bitwise-xor sum (length row)) ))

; returns an index to the row. Current should be be initially supplied with 1
; for the intial index.  A random row will be chosen if there is no optimal
; heap to choose
(define (findHeap board sameboard current nimSum )
  (if (= 0 (length board )) (randomRow sameboard)
    (if (isHeapDecrease? (first board) nimSum) 
      current 
      (findHeap (rest board) sameboard (+ 1 current) nimSum))))

; returns the number of sticks to remove
(define (findNumberSticks board)
  ; so a little explaining for the following one liner:  The optimal number of
  ; sticks to remove is the difference between the original number of sticks in
  ; the optimal row and the nimSum for the entire board.  Note the discrepancy
  ; bewteween the 0 and 1 indexing given to findHeap and in the getRow method.
  ; This is because we would like to return a 1 based index in the getRow method
  ; like a human would but for dealing with the board functions such as list-ref
  ; require zero based indexing
  (define optimal (heapDifference (list-ref board (- (findHeap board board 1 (nimSum board)) 1)) (nimSum board)))
  ; ensure at least one stick was chosen
  (if (positive? optimal) optimal 1))

; END AI HELPERS

(provide AIPlayer%)
(define AIPlayer% (class* Identifier% (Player)
                            (init id name)
                            (super-new [id id] [name name])

                            (define/public (getRow board)
                                           (findHeap board board 1 (nimSum board)))

                            (define/public (getSticks board rowChosen)
                                             (findNumberSticks board))))


