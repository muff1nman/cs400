#!/usr/bin/env racket
#lang racket

(provide mergelists)
(define (mergelists list1 list2)
  (cond
    [(null? list1) list2]
    [(null? list2) list1]
    [else (cond
            [(< (first list1) (first list2)) 
              (list* (first list1) (mergelists (rest list1) list2))]
            [else 
              (list* (first list2) (mergelists list1 (rest list2)))])]))

