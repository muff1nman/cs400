#lang racket

(provide Identifier%)
(define Identifier% (class object%
                            (init-field id name)
                            (super-new)))

(provide Player)
(define Player (interface () getRow getSticks ))

(provide HumanPlayer%)
(define HumanPlayer% (class Identifier%
                            (init id name)
                            (super-new [id id] [name name])))

