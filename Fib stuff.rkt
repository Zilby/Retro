;Hw: Write a fib function, test on things calculate largest fib #, 
;"How large a n will the function work on?" "How long did it take?"

;Fib 38 took about 2 minutes to load. This number should grow exponentially with
;Fib 39 taking around 4 minutes and Fib 40 taking close to 8 (a little less because
;the number doesn't completely double but comes very close)
;I would try to do this until my computer crashed but I currently do not have time to 
;reboot my failing computer as I have other homework to complete on it. 

(define (fib n) (cond ((= n 0) 0) ((= n 1) 1) ((> n 1) (+ (fib (- n 1)) (fib (- n 2))))))
(fib 4)
(fib 5)
(fib 6)
(fib 20)
(fib 30)
(fib 38)