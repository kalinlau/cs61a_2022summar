; Disc 08
; Jialin Liu. 2022.9.2

; Q1. Virahanka-Fibonacci
(define (vir-fib n)(if (> n 2) n (+ (vir-fib (- n 1)) (vir-fib (- n 2)))))

; Q2. List Making
; list
(define with-list (list (list 'a 'b) 'c 'd (list 'e)))
(draw with-list)
; quote
(define with-quote '((a b) c d (e)))
(draw with-quote)
; cons and cars
(define with-cons (cons (cons 'a (cons 'b nil)) (cons 'c (cons 'd (cons (cons 'e nil) nil)))))
(draw with-cons)

; Q3. List Concatenation
; Annotation: this question cannot be accomplished by 'list' syntactic sugar
(define (list-concat a b)
    (if (null? a)
        b
        (cons (car a)
              (list-concat (cdr a) b)))
)

; Q4. Map
; Not Tail Calls
(define (map-fn fn lst)
    (if (null? lst)
        nil
        (cons (fn (car lst))
              (map-fn fn (cdr lst))))
)

; Q5. Remove
; Tail calls
(define (remove item lst)
    (if (null? lst)
        nil
        (if (eq? (car lst) item)
            (remove item (cdr lst))
            (cons (car lst)
                  (remove item (cdr lst)))))
)