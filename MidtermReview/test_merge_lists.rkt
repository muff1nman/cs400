#!/usr/bin/env racket
#lang racket

(require "merge_lists.rkt")
(require rackunit)

(check-equal?
  (mergelists '(1 5 9) '(2 3 8 11))
  '(1 2 3 5 8 9 11)
  "Failed for online provided example")

(check-equal?
  (mergelists '(1 5 9) '(1 3))
  '(1 1 3 5 9)
  "Failed for online provided example with duplicate")

(check-equal?
  (mergelists '(1 2 32) (list))
  '(1 2 32)
  "Failed for left empty list")

(check-equal?
  (mergelists (list) '(1 2 32) )
  '(1 2 32)
  "Failed for right empty list")

(check-equal?
  (mergesort (list))
  (list)
  "Failed to sort empty list")

(check-equal?
  (mergesort (list 2))
  (list 2)
  "Failed to sort a single element")

(check-equal?
  (mergesort (list 2 4 5))
  (list 2 4 5)
  "Failed to sort a sorted list")

(check-equal?
  (mergesort (list 3 1 -8 2 5))
  (list -8 1 2 3 5)
  "Failed to sort an odd-sized human-random list")

(check-equal?
  (mergesort (list 6 4 2 1))
  (list 1 2 4 6)
  "Failed to sort an even-sized reverse-sorted list")



