#!/usr/bin/env racket
#lang racket

(define (c1 x)
  (let* [ (y 5) (z 20) (fn (lambda (y) (* x y z)))]
    (let [ (y 10) (z (+ x y z)) ]
      (fn z))))

(define (c1_1 x_1)
  (let* [ (y_2 5) (z_2 20) (fn (lambda (y_3) (* x_1 y_3 z_2)))]
    (let [ (y_4 10) (z_3 (+ x_1 y_2 z_2))]
      (fn z_3))))

(display (c1 5))
(display "\n")
