(define (c1 x)
  (let* [ (y 5) (z 20) (fn (lambda (y) (* x y z)))]
    (let [ (y 10) (z (+ x y z)) ]
      (fn z))))


