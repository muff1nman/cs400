#!/usr/bin/env racket
#lang racket

(display "The list:\n")
(display '((Alicia Brenda Charles)(100 Main Street)(Golden CO 80401)))

(display "cddar\n")
(display (cddar '((Alicia Brenda Charles)(100 Main Street)(Golden CO 80401))))
(display "\n")

(display "caar\n")
(display (caar '((Alicia Brenda Charles)(100 Main Street)(Golden CO 80401))))
(display "\n")

(display "cadr\n")
(display (cadr '((Alicia Brenda Charles)(100 Main Street)(Golden CO 80401))))
(display "\n")

(display "caddr\n")
(display (caddr '((Alicia Brenda Charles)(100 Main Street)(Golden CO 80401))))
(display "\n")
