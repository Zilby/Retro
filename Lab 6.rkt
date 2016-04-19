
;********************************
;********************************
;LAB 6
;********************************
;********************************

;If you saw the long introduction and thought "tldr" then you should
;rethink your work ethic. I guarantee lazy makes you lose points in 
;my class. 


;Lets work with lists of numbers for now:

;DO NOW: (You can work with others but should try at least one on your own)

;****************************************
;Part 1 Function traces:

;For EACH of the 2 mystery functions:
;1. Trace through them both on paper using any list of numbers
;2. Then see if the result you got is the same as the function
;3. If not trace again, you can compare with others... 
;4. What is this function supposed to be named?

;MYSTERY FUNCTION 1:
(define (MST3K L)
  (cond
    ((null? L) 0)
    (else (+ (car L) (MST3K (cdr L))))))

(MST3K '(9 7 3 4 6 8))

;SUM OF ALL

;MYSTERY FUNCTION 2:
(define (MSTRE L)
  (cond
    ((null? L) 0)
    ((even? (car L))(MSTRE (cdr L)))
    (else (+ (car L) (MSTRE (cdr L))))))

(MSTRE '(9 7 3 4 6 8))

;SUM OF ODDS

;****************************************
;Part 2: evaluation with car and cdr

;Evaluate each of these without running them in racket:
(car (cdr (cdr '( a b c d e f))))
(cadddr '( a b c d e f))
;(caddddr '( a b c d e f))
;Check your answers in drRacket.

;Notice that c____r shortcuts (cddr L) or (caddr L) 
;only works with up to 4 a/d's inside. This is still 
;a useful shortcut however!!!
;cdr   
;cddr  
;cdddr  
;cddddr  
;next....
;(cdr (cddddr 
;(cddr (cddddr ... etc. 

;OK! Now try 4
;4. (car (car (cdr '( a b c d e f))))
;a. What must car and cdr be used on? 
;b. Can you use car on the results of a car?
;c. When would it be possible to use car twice? (hint: listCeption)


;****************************************
;Part 3: NEW COMMANDS

;I promise I will briefly go over these commands, but I strongly 
;urge you to copy these into drRacket and see what they do.
;You should modify them, and experiment to confirm/contradict your
;assumptions. Test them a little and you will learn more I promise. 

;(cons value list) -> list with value added as the 1st element.
;(cons 3 '(2 6)) -> (3 2 6)
;(cons 1 '()) -> (1)

;Semi strange:
;(define x 1)
;Compare the next two carefully:
;(cons x '( 2 3)) -> (1 2 3)
;(cons 'x '( 2 3)) -> (x 2 3)
;Explain to your neighbor why that happened. Confirm with a different neighbor. 

(cons 1 '(2 3))
(cons 1 '+)
(cons '+ '(3 5 2))
(cons '(3 5 2) '(4 6 8))

;Now is where the weird things happen:
;(cons '(1 2) '(3 4) ) -> ((1 2) 3 4)  
;the list got put at the start of the 2nd list

;(append list1 list2) -> the combination of both lists in order
;(append '(4 5 6) '(1 2 3)) -> (4 5 6 1 2 3) 
;the numbers stay in order , they don't change to the order you 
;may have expected. 

(append '(3 4 7 4 2) '(+))
(append '(3) '(3 5 6 4 3))
;append NEEDS to be in a list: 
;3 = DX  
;while 
;'(3) = :D


;Play with cons and append.
;Your goal should be to beable to verbalize to me how they are different/similar.
;You can try writing a function that tries to cons a bunch of numbers to a list
;then try the same thing with append, and realize that append requires two lists...
;so you cant (append 3 L), you need to (append '(3) L)


;LAST NEW THING:
;how would you cons an integer x to a list?
;(cons '(x) L)  would put the LETTER x in the list.
;We can use the (list x) command
;(list 3) -> (3)
;(define x 3)
;(list x) -> ( THEVALUEOFX )  ;so if x was 3, that would be (3)

(define x 3)
(list x)
;^^^^ fucking whoosh. 
;I AM THE MASTER COMMANDER