;   Alexander Zilbersher
;   Mr.Konstantinovich
;   Hw#5  10/3/12

;1a
(define (xor a b) (not(equal? a b)))

(xor (< 9 0) (> 9 0))
(xor (= 5 (- 6 1))(> 7 3))

;1b
(define (leapyear x) 
  (cond((= 0 (modulo x 400)) #t) 
       ((= 0 (modulo x 100)) #f) 
       ((= 0 (modulo x 4)) #t) 
       (else #f)))

(leapyear 1600)
(leapyear 40)
(leapyear 100)
(leapyear 2004)
(leapyear 2007)

;2
(define (militarytime hour ampm) 
  (cond ((and(equal? ampm "PM")(equal? hour 12)) 12) 
        ((and(equal? ampm "AM")(= hour 12)) 0) 
        ((equal? ampm "PM") (+ hour 12)) 
        (else hour)))

(militarytime 12 "PM")
(militarytime 12 "AM")
(militarytime 7 "PM")
(militarytime 3 "AM")

;3
(define (sumfromAtoB a b) 
  (if (< a b) 
      (+ a (sumfromAtoB (+ a 1) b)) b))

(sumfromAtoB 10 12)
(sumfromAtoB 5 8)

;4
(define (Prime? n) (prime2 n 2))
(define (prime2 n x) 
  (cond ((= n 2) #t)
    ((= 0 (modulo n x))#f) 
       ((>= x (sqrt n))#t) 
        (else (prime2 n (+ x 1)))))

(Prime? 7)
(Prime? 16)
(Prime? 2)


(define (sumOfPrimeDigits x) 
  (cond ((Prime? (modulo x 10)) 
         (cond((< x 10) x) 
              (else (+(modulo x 10)
                      (sumOfPrimeDigits(quotient x 10)))))) 
        ((< x 10) 0) 
        ((= 0(modulo x 10) 
            (sumOfPrimeDigits (quotient x 10)))) 
        ((not(Prime? (modulo x 10))) 
         (sumOfPrimeDigits (quotient x 10)))))

(sumOfPrimeDigits 623)
(sumOfPrimeDigits 1426842)
(sumOfPrimeDigits 123456789)
(sumOfPrimeDigits 666666)
(sumOfPrimeDigits 777777)

;I think #4 could be shorter but considering I spent 3 hours 
;uncovering the secret of what I was doing wrong, I no longer
;have the will-power to discover how to do this. 

;Peace Mr. K
;.
;..│▒│ /▒/
;..│▒│/▒/
;..│▒ /▒/─┬─┐
;..│▒│▒▒▒│▒▒│
; ┌┴─┴─┐-┘──┘
; │▒┌──┘▒▒▒▒│
; └┐▒▒▒▒▒▒┌┘
; ..└┐▒▒▒▒