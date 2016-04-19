;HW #6
;Mr. Konstantinovich
;Alexander Zilbersher
;10/29/12

;6.1: Countlists
(define (countlists x) 
  (cond ((not(list? x)) 0)
        ((null? x) 0) 
        ((list? (car x)) 
         (+ 1 (+ (countlists (car x)) 
                 (countlists (cdr x))))) 
        (else (countlists (cdr x)))))

(countlists '((2 3) (3 (5) 2)))
(countlists '(5 2 9 (9 8 (83 2 (8 9))) (3)))

;6.2: Stripzeros
(define (stripzeros x) 
  (cond ((null? x) '())
        ((list?(car x)) 
         (append (list (stripzeros (car x)))
                 (stripzeros (cdr x)))) 
        (else 
         (if (= (car x) 0) 
             (stripzeros (cdr x)) 
             (cons (car x) (stripzeros (cdr x)))))))

(stripzeros '(0 2 (3 0 (0)) 5))
(stripzeros '(4 0 0 (0 0 5 ( 4 3 0) 9 (0 3)) (3) (0)))

;6.3: AddOne
(define (addone x) 
  (cond 
    ((null? x) '()) 
    ((list? (car x)) 
     (append (list (addone (car x))) 
             (addone (cdr x)))) 
    (else (cons (+ 1 (car x)) 
                (addone (cdr x))))))

(addone '(9 9 (4 3) (2 (1))))
(addone '(24 12 (52 35 (35) 9 (24 (2) 3)) (2)))

;6.4: Contains
(define (contains L x) 
  (cond ((null? L)#f) 
        ((= (car L)x)#t) 
        (else (contains (cdr L) x))))

(contains '(1 2 3) 4)
(contains '(1 2 3) 2)
(contains '(35 242 49 28 0) 242)

;6.5: ContainsSub
(define (containsSub L x) 
  (cond ((null? L)#f) 
        ((not(list? x)) 
         (if (=(car L) x) #t 
             (containsSub (cdr L) x)))
        (else 
         (if (equal? (car L) x) #t 
             (containsSub (cdr L) x)))))

(containsSub '(1 2 3) 4)
(containsSub '(1 2 3) 2)
(containsSub '(1 (2) 3) '(1))
(containsSub '(1 (2) 3) '(2))
(containsSub '(1 (2 3) (4 5)) '(3 4))
(containsSub '(1 (2 3) (4 5)) '(2 3))
(containsSub '(1 (2 3) (4 5 6)) '(4 5))

;Is there a better way to say (not(list? x) ?  
;Feels sort of awkward...