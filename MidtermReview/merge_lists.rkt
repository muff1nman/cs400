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

(provide mergesort)
(define (mergesort unsorted)
  (cond
    [(<= (length unsorted) 1) unsorted]
    [else 
      (mergelists
        (mergesort (take unsorted (floor (/ (length unsorted) 2))))
        (mergesort (drop unsorted (floor (/ (length unsorted) 2)))))]))

