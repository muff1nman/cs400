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

                            (define/public (getRow board)
                                           (printf "Please enter a row: ")
                                           (define inputted_num (string->number (read-line
                                                                  (current-input-port))))
                                           (if (not(number? inputted_num))
                                             ( (lambda (board) 
                                                 (printf "Not a number\n")
                                                 (getRow board))
                                              board)
                                             inputted_num))

                            (define/public (getSticks board)
                                           (printf "Please the number of sticks to take: ")
                                           (define inputted_num (string->number (read-line
                                                                  (current-input-port))))
                                           (if (not(number? inputted_num))
                                             ( (lambda (board) 
                                                 (printf "Not a number\n")
                                                 (getSticks board))
                                              board )
                                             inputted_num))))

(provide RandomPlayer%)
(define RandomPlayer% (class* Identifier% (Player)
                            (init id name)
                            (super-new [id id] [name name])

                            (define/public (getRow board)
                                             1)

                            (define/public (getSticks board)
                                             1)))

(provide AIPlayer%)
(define AIPlayer% (class* Identifier% (Player)
                            (init id name)
                            (super-new [id id] [name name])

                            (define/public (getRow board)
                                             1)

                            (define/public (getSticks board)
                                             1)))
