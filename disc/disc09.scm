; Disc 9, Taill Call and Interpreters
; Jialin Liu

; Q1 To Scheme An Environment Diagram
(define q1 "global frame")
(define q2 "f1")
(define q3 "f1")
(define q4 "lambda procedure, use lexical scope rule")
(define q5 "f2")
(define q6 "mu procedure, use dynamic scope rule")
(define q7 "f3")
(define q8 "f4")
(define q9 "7 and 25")
(define q10 "yes, it will return 7")

; Q2 Is Tail Call
(define q1 "yes, not tail call")
(define q2 "yes, tail call")
(define q3 "yes, tail call")
(define q4 "no, not tail call")

; Q3 Sum
(define (sum lst)
    (define (sum_iter lst x)
        (if (null? lst) x
            (sum_iter (cdr lst) (+ (car lst) x))))
    (sum_iter lst 0))

; Q4 Reverse
; Take a list and return an reversed copy
; Use tail recursion
(define (reverse lst)
    (define (reverse_iter lst1 lst2)
        (if (null? lst1) lst2
            (reverse_iter (cdr lst1) (cons (car lst1) lst2))))
    (reverse_iter lst nil))