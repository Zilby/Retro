;Alex Zilbersher
;Mr. Konstantinovich
;1/2/13
;Scheme Practice

;Shuffle

(define (shuffle a b) 
  (if (or (equal? a '()) (equal? b '())) (append a b)
    (append (cons (car a) (list (car b))) (shuffle (cdr a) (cdr b)))))

(shuffle '(4 6 3) '(s b c))
(shuffle '(4 6 5 3 5 2) '(s b c))
(shuffle '(4 6 3) '(s b c d e j))
(shuffle '(red foo) '(sky blue))
(shuffle '(hey yah) '())