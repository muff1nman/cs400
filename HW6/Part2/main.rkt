#!/usr/bin/env racket
#lang racket

(require "lib.rkt" "original.rkt")

(define (getString prompt)
  (display prompt )
  (define input (read-line (current-input-port)))
  (if (not(string? input)) (getString prompt) input))


(keywordSearch (getString "Please enter a keyword: ") articles)
