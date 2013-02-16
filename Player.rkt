#lang racket

(provide Identifier%)
(define Identifier% (class object%
                            (init-field id name)
                            (super-new)))

(provide Player)
(define Player (interface () getRow getSticks ))

(provide HumanPlayer%)
(define HumanPlayer% (class* Identifier% (Player)
                            (init id name)
                            (super-new [id id] [name name])

                            (define/public (getRow)
                                             1)

                            (define/public (getSticks)
                                             1)))

