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

                            (define/public (getSticks board)
                                           (printf "Please the number of sticks to take: ")
                                           (define inputted_num (string->number (read-line
                                                                  (current-input-port))))
                                           (if (not(number? inputted_num))
                                             ( (lambda (board) 
                                                 (printf "Not a number\n")
                                                 (getSticks board))
                                              board )
                                             inputted_num))))

(provide RandomPlayer%)
(define RandomPlayer% (class* Identifier% (Player)
                            (init id name)
                            (super-new [id id] [name name])

                            (define/public (getRow board)
                                           (+ 1 (random (length board) )))

                            (define/public (getSticks board)
                                             1)))

(define (rowBitSum arrayInts )
  (foldr 
    (lambda (x sum )
      (bitwise-xor sum x ))
    0
    arrayInts))

(define (nimSum board)
  (rowBitSum (map length board )))

(define (isHeapDecrease? row sum)
  (< (bitwise-xor sum (length row)) (length row)))

(define (heapDifference row sum)
  (- (length row) (bitwise-xor sum (length row)) ))

; returns an index to the row. current can be either zero or one for indexing
(define (findHeap board current nimSum)
  (if (= 0 (length board )) (- current 1)
    (if (isHeapDecrease? (first board) nimSum) 
      current 
      (findHeap (rest board) (+ 1 current) nimSum))))

; returns the number of sticks to remove
(provide findNumberSticks)
(define (findNumberSticks board)
  (define optimal (heapDifference (list-ref board (- (findHeap board 0 (nimSum board)) 0)) (nimSum board)))
  (if (positive? optimal) optimal 1))

(provide AIPlayer%)
(define AIPlayer% (class* Identifier% (Player)
                            (init id name)
                            (super-new [id id] [name name])

                            (define/public (getRow board)
                                           (findHeap board 1 (nimSum board)))

                            (define/public (getSticks board)
                                             (findNumberSticks board))))
