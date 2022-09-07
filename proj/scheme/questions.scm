(define (caar x) (car (car x)))
(define (cadr x) (car (cdr x)))
(define (cdar x) (cdr (car x)))
(define (cddr x) (cdr (cdr x)))

;; Problem 15
;; Returns a list of two-element lists
(define (enumerate s)
; BEGIN PROBLEM 15
    ; ================= Version 1: O(n^2) =================
    ; Tail Recursion by append, O(n^2)
    ; (define (enum-tail s n lst)
    ;     (if (null? s) lst
    ;         (enum-tail (cdr s) (+ n 1)
    ;             (append lst (cons (cons n (cons (car s) nil)) nil)))))
    ; (if (null? s) nil
    ;     (enum-tail (cdr s) 1 (cons (cons 0 (cons (car s) nil)) nil))))

    ; ================= Version 2: O(n) =================
    ; Tail Recursion then reverse
    (define (reverse s)
        (define (reverse-tail s res)
            (if (null? s) res
                (reverse-tail (cdr s) (cons (car s) res))))
            (reverse-tail s nil))
    (define (rev-enum s n lst)
        (if (null? s) lst
            (rev-enum (cdr s) (+ n 1) (cons (cons n (cons (car s) nil)) lst))))
    (reverse (rev-enum s 0 nil)))
; END PROBLEM 15

;; Problem 16

;; Merge two lists LIST1 and LIST2 according to ORDERED? and return
;; the merged lists.
(define (merge ordered? list1 list2)
; BEGIN PROBLEM 16
    ; ============= Version 1: Non-Tail Recursion =============
    ; (if (null? list1) list2
    ;     (if (null? list2) list1
    ;         (if (ordered? (car list1) (car list2))
    ;             (cons (car list1) (merge ordered? (cdr list1) list2))
    ;             (cons (car list2) (merge ordered? list1 (cdr list2)))))))

    ; =============== Version 2: Tail Recursion ===============
    ; Trade time complexity with space complexity
    (define (merge-mem ordered? l1 l2 mem)
        (if (null? l1) (append mem l2)
            (if (null? l2) (append mem l1)
                (if (ordered? (car l1) (car l2))
                    (merge-mem ordered? (cdr l1) l2 (append mem (cons (car l1) nil)))
                    (merge-mem ordered? l1 (cdr l2) (append mem (cons (car l2) nil)))))))
    (merge-mem ordered? list1 list2 nil))
; END PROBLEM 16

