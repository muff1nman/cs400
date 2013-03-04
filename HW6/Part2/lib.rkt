#!/usr/bin/env racket
#lang racket

(provide getTitle)
(define (getTitle lst)
  (first lst))

(provide getAuthors)
(define (getAuthors lst)
  (first (rest lst)))

(provide getKeywords)
(define (getKeywords lst)
  1)
