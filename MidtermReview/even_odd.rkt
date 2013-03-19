#!/usr/bin/env racket
#lang racket

(provide filter-even)
(define (filter-even given_list)
  (cond
    [(empty? given_list) (list)]
    [(equal? (length given_list) 1) (list) ]
    [(>= (length given_list) 2) 
     (list* (first (rest given_list)) (filter-even (rest (rest given_list))))]))

(provide filter-odd)
(define (filter-odd given_list)
  (cond
    [(empty? given_list) (list)]
    [(equal? (length given_list) 1) (list (first given_list))]
    [(>= (length given_list) 2) 
     (list* (first given_list) (filter-odd (rest (rest given_list))))]))
