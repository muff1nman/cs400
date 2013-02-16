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
                                           (printf "Please enter a row: ")
                                           (define inputted_num (string->number (read-line
                                                                  (current-input-port))))
                                           (if (not(number? inputted_num))
                                             ((printf "Not a number\n")(getRow)) 
                                             inputted_num))

                            (define/public (getSticks)
                                           (printf "Please the number of sticks to take: ")
                                           (define inputted_num (string->number (read-line
                                                                  (current-input-port))))
                                           (if (not(number? inputted_num))
                                             ((printf "Not a number\n")(getSticks))
                                             inputted_num))))

(provide RandomPlayer%)
(define RandomPlayer% (class* Identifier% (Player)
                            (init id name)
                            (super-new [id id] [name name])

                            (define/public (getRow)
                                             1)

                            (define/public (getSticks)
                                             1)))

(provide AIPlayer%)
(define AIPlayer% (class* Identifier% (Player)
                            (init id name)
                            (super-new [id id] [name name])

                            (define/public (getRow)
                                             1)

                            (define/public (getSticks)
                                             1)))
