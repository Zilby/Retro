;Alex Zilbersher
;Primes Homework
;Mr. Konstantinovich
;10/4/12

(define (prime? n) (prime2 n 2))
(define (prime2 n x) 
  (cond ((= 2 n) #t)
    ((= 0 (modulo n x))#f) 
    ((>= x (sqrt n)) #t) 
    (else (prime2 n (+ x 1))))) 
(prime? 7)
(prime? 16)
(prime? 53)
(prime? 64)