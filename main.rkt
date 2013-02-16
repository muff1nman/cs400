#!/usr/bin/racket
#lang racket

(require "Player.rkt")

(define (NIM board players )
  (printf "Playing Game\n"))

(define some_board "")
(define players (list (new HumanPlayer% [id 1]) (new HumanPlayer% [id 2] )))
(NIM some_board players)
