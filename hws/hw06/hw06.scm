(define (cddr s) (cdr (cdr s)))

(define (cadr s)
    (car (cdr s)))

(define (caddr s)
    (car (cddr s)))

; TODO: Tail Recursion
;; adding auxillary lst to memorize.
;; (define (interleave-aux lst1 lst2 mem))
;; do the assembling in mem then call interleave-aux as the last step.
(define (interleave lst1 lst2)
    (if (null? lst1) lst2
        (if (null? lst2) lst1
            (cons (car lst1) (interleave lst2 (cdr lst1))))))

(define (my-filter pred lst)
    (if (null? lst) nil
        (if (pred (car lst)) (cons (car lst) (my-filter pred (cdr lst)))
            (my-filter pred (cdr lst)))))

(define (concatenate s)
    (define (concat-aux s mem)
        (if (null? s) mem
            (concat-aux (cdr s) (append mem (car s)))))
    (concat-aux s nil))
