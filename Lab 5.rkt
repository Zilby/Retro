;The next topic you will learn about is lists
;this will show you how to write a list, and how to 
;access the data you put in the list

;in scheme the apostrophy ' tells the interpreter not to evaluate 
;the next item.

(display "SAMPLE OUTPUT 1:\n")
(define x 3)
x
(+ x 3)
'x
'(+ x 3)
(newline)

;notice how the 'x and '(+ x 3) didn't say 3 and 6?
;that is because of the '

;A list in scheme is just a set of parenthesis with some data
;inside it, except to prevent scheme from trying to evaluate the 
;parenthesis we use an '

(display "\n FIVE SAMPLE LISTS:\n")
'( this is a list)
'( 1 3 6 0 2)
'( + - * /)

;Oh and just in case you were wondering a list can be empty:
'()

;or have MORE LISTS inside it: 
;(This is more advanced we will talk about it later!)
'( (1 2) (3 9) 0)

(newline)


;NOW lets get stuff out of the list:
;we will use this list for testing purposes:
(define jenny '( 8 6 7 5 3 0 9))

;typing the variable name shows the value of the whole list:
(display "jenny=")
jenny

;Two functions that are critical for list processing are car and cdr
(display "(car jenny)=")
(car jenny)
(display "(cdr jenny)=")
(cdr jenny)

;car works on any list to get the 1st element
;cdr works on any list to get the whole list WITHOUT the 1st element. 
;Think of car as the 1st, and cdr as the rest. 
(newline)

(display "(cdr (cdr (cdr jenny)))=")
(cdr (cdr (cdr jenny)))
;we have a shortcut for that:
(display "(cdddr jenny)=")
(cdddr jenny)
(newline)

;Now the part where you start thinking... 
;You can only look at the first element of a list, so the only way to 
;look at the 2nd element is to make it the 1st element using cdr. 
(display "(car (cdr jenny))=")
(car (cdr jenny))

;When you want the 3rd element, you have to use cdr twice.
;When you want the 4th element, you have to use cdr three times.



;NOW YOU DO STUFF:
;NOW YOU DO STUFF:
;NOW YOU DO STUFF:
;NOW YOU DO STUFF:
;NOW YOU DO STUFF:


;PART 1
;Write a function that extracts the nth item from the list
;(getNth List Place)
;examples:
;(getNth jenny 0) -> 8
;(getNth jenny 1) -> 6
;(getNth jenny 2) -> 7
;(getNth jenny 6) -> 9
;If you havent noticed, the 0th element is the leftmost one.
;We index things starting at 0, not 1. 
;The 0th element is the "first".
;The 1st element is really the "second". 

;Almost all list functions need a special base case:
;Your base case should be when List is empty...
;(cond
;    ((null? list)  "List Is Empty or Index is too Large" )

; (null? list)  
;is the same as saying:
; (equal? list '() )

;Your recursion should use the REST of the list...
;Your stopping point should be when you get to the right place...

(define (getNth x y) 
  (if (= 0 y) 
      (car x) 
      (getNth (cdr x) (- y 1))))

(getNth jenny 1)
(getNth jenny 2)
(getNth jenny 6)

;PART 2
;Make a function myLength that counts how many elements a list has
;There is a built in function to do this called length
;(length jenny) is 7
;assume there are no lists inside the list.
;Test your function!
;Hint: How long is a list that is empty? That is your base case.

(define (myLength x) 
  (if (null? x) 0 
      (+ 1 (myLength (cdr x)))))

(myLength jenny)
(myLength '( 9 8 4 8 7 5 7 5))


;PART 3
;Make a function that counts how many 0's are in the list
;Test your function!

(define (0count x) 
  (cond ((null? x) 0) 
        ((= 0 (car x)) 
         (+ 1 (0count (cdr x)))) 
        (else (0count (cdr x)))))

(0count '(0 2 9 3 0 2 8))
(0count jenny)

;  :D  HUZZAH