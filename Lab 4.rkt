;The goal today is to learn about the begin and display commands. 
;Used together they can show us how a recursive function progresses!

;The begin statement executes each command one after another
;the whole statement evaluates to the last part
;so in the case of countTo2, the last part is a display
;which has no numerical value, 
;CountTo1 has a countTo1 call last, which ultimately becomes 0. 
;notice that depending when you display the result, the numbers 
;appear in opposite order!

(define (countTo1 x)
  (if (> x 0)
      (begin
        (display x)
        (countTo1 (- x 1)))
      (begin 
        (display x)
        0)))
       
(define (countTo2 x)
  (if (> x 0)
      (begin
        (countTo2 (- x 1))
        (display x))
      (begin 
        (display x)
        0)))

(display "countTo1(4)=")
(countTo1 4)
(newline)
(display "countTo2(4)=")
(countTo2 4)
       
;Why is this useful to you?
;Haven't you wanted a way to see what values it finds as 
;it goes through the recursion? Haven't you wanted a way to 
;make it print the values along the way to the end result?
;Now you can! We don't normally print the values in scheme, but
;we can (display value) if we wanted to. 


;Lab4:
;Part 1: Sample sequence:
(define (sequence n)
  (if
   (= n 0)
   0;terminal value
   (begin
     ;instead of adding 1/n to the sum
     ;I just display it. 
     (display (/ 1 n))
     (display ",")
     (sequence (- n 1)))))

(display "\nSequence(8)=")
(sequence 8)

;Hailstone series
;Hailstone of n is defined as:
;n/2 for even values of n.
;3n+1 for odd values of n.
;Stop when n=1. 
;Since there are 3 possibilities... that should SCREAM: cond

;lets say n=5
;3(5)+ 1 -> 16
;(16)/2 -> 8
;(8)/2 -> 4
;(4)/2 -> 2
;(2)/2 -> 1
;OR:  5,16,8,4,2,1
;Lets say n=3
;3,10,5,16,8,4,2,1
;simple enough... if not google hailstone sequence and read more!

;So the final number in the sequence is always one. 
;This means that knowing the final value is not very interesting, 
;seeing the entire sequence is FAR more interesting. 

;PROBLEM 1:
;Your goal is to write a function that DISPLAYs the sequence
;(hailstone 32) would show:
;32,16,8,4,2,1
;This is similar to the sample sequence except you don't change n by
;subtracting 1 every time.

(define (hailstone n)
  (cond((= n 1) 1)
       ((and(> n 1)(even? n))
       (begin (display n)
               (display ",")
               (hailstone (/ n 2))))
       (else (begin (display n)
                    (display ",")
                    (hailstone (+ 1(* n 3)))))))
(hailstone 32)
(hailstone 33)
(hailstone 3)

;PROBLEM 2:
;Once you get the working sequence, write a function that tells you
;how long the hailstone of a number is.
;(hailLength 1) should be 1
;(hailLength 32) should be 6
;(hailLength 3) should be 8  ... see the sequences above

(define (hailstone2 n)
  (cond((= n 1)1)
       ((and(> n 1)(even? n)) 
        (+ 1 (hailstone2 (/ n 2)))) 
       (else (+ 1 (hailstone2 (+ 1(* n 3)))))))

(hailstone2 1)
(hailstone2 32)
(hailstone2 3)

;PROBLEM 3:
;Write a function that tells you the maximum hailstone value of the sequence. 
;(maxHail 32) -> 32
;(maxHail 3) -> 16
;(maxHail 5) -> 16

(define (maxhail n)
  (cond((= n 1) 1)
       ((and(> n 1)(even? n))
       (max n (maxhail (/ n 2))))
       (else (max n (maxhail (+ 1(* n 3)))))))

(maxhail 33)
(maxhail 35)
(hailstone 35)