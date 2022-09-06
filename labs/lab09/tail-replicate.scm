(define (tail-replicate x n)
    ; BEGIN
    (define (add-to-first lst x n)
    ; Helper function, store list in lst and update each turn
        (if (= n 0) lst
            (add-to-first (cons x lst) x (- n 1))))
    (add-to-first nil x n)
    ; END
)