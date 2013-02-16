#lang racket

(provide Player)
(define Player "")

(provide Identifier%)
(define Identifier% (class object%
                            (init given_id given_name)
                            (define id given_id)
                            (define name given_name)

                            (super-new)

                            (define/public (get_id)
                                           id)

                            (define/public (get_name)
                                           name)))

(provide HumanPlayer%)
(define HumanPlayer% (class Identifier%
                            (super-new)))

