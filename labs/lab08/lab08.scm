; Lab08: Scheme
; Jialin Liu

; Q3 Over or Under
(define (over-or-under num1 num2)
    (if (< num1 num2) -1
        (if (= num1 num2) 0
            1)))

; Q4 Compose
(define (composed f g)
    (lambda (x) (f (g x))))

; Q5 Pow
; Tail Calls
(define (square n) (* n n))

(define (pow base exp)
    (define (pow-iter base exp total)
        (if (or (= base 1) (= exp 0)) 1
            (if (= exp 1) total
                (if (even? exp) (pow-iter base (quotient exp 2) (* total (square base)))
                    (pow-iter base (quotient (- exp 1) 2) (* total (square base)))))))
    (pow-iter base exp base))

; Q6 Ascending
(define (ascending? lst)
    (if (null? (cdr lst)) #t
        (if (> (car lst) (car (cdr lst))) #f
            (ascending? (cdr lst)))))