#!/usr/bin/env racket
#lang racket

(require rackunit)
(require "even_odd.rkt")

(define empty_list (list) )
(define single_element (list 3))
(define two_elements (list 3 4))
(define nested_list (list 2 (list 3) -4))
(define long (list 2 5 2 35 23 2 -3 4))

; filter-odd tests
(check-equal? 
  (filter-odd long)
  (list 2 2 23 -3)
  "filter-odd failed for a long list of numbers")

(check-equal?
  (filter-odd empty_list)
  (list)
  "filter-odd failed for an empty list")

(check-equal?
  (filter-odd single_element)
  single_element
  "filter-odd failed for a single element")

(check-equal?
  (filter-odd two_elements)
  (list 3)
  "filter-odd failed for two elements")

(check-equal?
  (filter-odd nested_list)
  (list 2 -4)
  "filter-odd failed for a nested list")


; filter-even tests

(check-equal?
  (filter-even long)
  (list 5 35 2 4)
  "filter-even failed for a long list of numbers")

(check-equal?
  (filter-even empty_list)
  (list)
  "filter-even failed for an empty list")

(check-equal?
  (filter-even single_element)
  empty_list
  "filter-even failed for a single element")

(check-equal?
  (filter-even two_elements)
  (list 4)
  "filter-even failed for two elements")

(check-equal?
  (filter-even nested_list)
  (list (list 3))
  "filter-even failed for a nested list")
