#!/usr/bin/racket
#lang racket

(require "Player.rkt")

; test that row still has pieces left
(define (isValidRow? row )
  (> (length row) 0))

; test for end game
(define (isEndGame? board )
  (not(ormap isValidRow? board )))

; a valid row is one that has at least one stick 
(define (isValidRowIndex? board row_index )
  (and 
    (<= row_index (length board)) 
    (positive? row_index) 
    (isValidRow? (list-ref board (- row_index 1)))))

; a valid number of sticks is when the number of sticks is equal to or less than
; the number of sticks in the given row  and positive
(define (isValidNumSticks? board row_index sticks)
  (and 
    (positive? sticks) 
    (<= sticks (length (list-ref board (- row_index 1))))))

(define (displayRow row label )
  (printf "Row ~a: ~a\n" label (string-join (map symbol->string row) " "))
  (+ label 1))

(define (displayGameBoard board )
  (foldl displayRow 1 board ))

(define (displayPlayerNext player )
  ; possible security issue here.. but not really sure how rackets printf works
  (printf "~a is next.\n" (get-field name player)))

(define (displayChoices player_name row sticks )
  (printf "~a is removing ~a stick~a from row ~a!\n" 
          player_name 
          sticks 
          (if (> sticks 1) "s" "")
          row ))

(define (removeFromBoard board row_index sticks )
  (if (= (length board) 0) board 
    (if (eq? row_index 1) 
      (cons 
        (removeFromRow (first board) sticks ) 
        (removeFromBoard (rest board) (- row_index 1) sticks))
      (cons 
        (first board) 
        (removeFromBoard (rest board) (- row_index 1) sticks)))))

(define (removeFromRow row sticks)
  (if (<  (length row) 1) row 
    (if (<= sticks 0 ) row (removeFromRow (rest row ) (- sticks 1) ))))

(define (getRow board player )
  (validateRow board player (send player getRow board)))

(define (validateRow board player row_i)
  (if (isValidRowIndex? board row_i)
    row_i
    ((lambda (board player bad_row)
       (printf "~a is an invalid row index\n" bad_row) 
       (getRow board player))
     board player row_i)))

(define (getSticks board player row_i)
  (validateSticks board player row_i (send player getSticks board row_i)))

(define (validateSticks board player row_i sticks)
  (if (isValidNumSticks? board row_i sticks) 
    sticks 
    ( (lambda (board player row_i bad_sticks) 
        (printf "~a is not a valid number of sticks\n" bad_sticks)
        (getSticks board player row_i )) 
     board player row_i sticks)))

; assumes there is only two players (see reverse)
(define (NIM board players )
  (printf "\n======================\n")
  (displayPlayerNext (first players ))
  (displayGameBoard board )
  (define row_i (getRow board (first players)))
  (define n_sticks (getSticks board (first players) row_i))
  (displayChoices (get-field name (first players)) row_i n_sticks )
  (define newBoard (removeFromBoard board row_i n_sticks))
  (if (isEndGame? newBoard ) 
    ((lambda (board) 
       (printf "\n======================\n")
       (printf "Game Over!\n") 
       (displayGameBoard board) 
       (printf "~a Won!\n" (get-field name (first players)))
       (get-field id (first players))) newBoard )
    (NIM newBoard (reverse players))))

(define some_board (list '(x x x) '(x x x) '(x x) ) )
(define players (list (new RandomPlayer% [id 1] [name "Spontaneous"]) 
                      (new AIPlayer% [id 2] [name "Robot"] )))

(NIM some_board players)