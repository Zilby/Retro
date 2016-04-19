;  Alexander Zilbersher
;  Hw#4        9/24/12
;  Mr. Konstantinovich 
;  Pd. 6 Computer Science

; 1)
(define MyQuotient (lambda (a b) (/ (- a (modulo a b))b)))
(MyQuotient 21 5)

; 2)
(define getplace (lambda (x column) (modulo (quotient x column) 10)))
(define isTheNthPlaceEven? (lambda (x column) (= 0 (modulo (getplace x column) 2))))
(isTheNthPlaceEven? 154 10)
(isTheNthPlaceEven? 145 10)

; 3)
(define G 0.00000000006673)
(define gravity (lambda (m1 m2 D) (/ (* G m1 m2) (* D D))))
(gravity 100000 50000 2)