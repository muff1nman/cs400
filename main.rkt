#!/usr/bin/racket
#lang racket

(require "Player.rkt")

; test for end game
(define (isEndGame? board )
  (ormap isValidRow? board ))

(define (isValidRow? row )
  (> (length row) 0))

; a valid row is one that has at least one stick 
(define (isValidRowIndex? board row_index )
  (and 
    (< row_index (length board)) 
    (positive? row_index) 
    (isValidRow? (list-ref board row_index))))

; a valid number of sticks is when the number of sticks is equal to or less than
; the number of sticks in the given row 
(define (isValidNumSticks? board row_index sticks)
  #f)

(define (displayGameBoard board )
  (printf "Displaying game board\n" ))

(define (removeFromBoard board row sticks )
  (printf "Removed stuff\n"))

(define (getRow board player )
  (define row_i (send player getRow ))
  (if (isValidRowIndex? board row_i ) 
    row_i 
    ((printf "Not valid row\n" )(getRow board player))))

(define (getSticks board player row_i)
  (define num_sticks (send player getSticks ))
  (if (isValidNumSticks? board row_i num_sticks) 
    num_sticks 
    ((printf "Not a valid number of sticks\n")(getSticks board player row_i ))))


(define (NIM board players )
  (define row_i (getRow board (first players)))
  (define n_sticks (getSticks board (first players) row_i))
  (define newBoard (removeFromBoard board row_i n_sticks))
  (if (isEndGame? newBoard ) 
    (printf "Done!\n")  
    ((printf "Not Done..\n") (NIM newBoard (reverse players)))))

(define some_board (list '(x x x) '(x) '(x x) ) )
(define players (list (new HumanPlayer% [id 1] [name "Player 1"]) 
                      (new AIPlayer% [id 2] [name "Player 2"] )))

(NIM some_board players)
