; Disc 10: Scheme Data Abstractions
; Jialin, Liu

; Extra: Constructor and Selector
(define (make-city name lat lon)
    (cons name (cons lat (cons lon nil))))

(define (get-name city)
    (car city))

(define (get-lat city)
    (car (cdr city)))

(define (get-lon city)
    (car (cdr (cdr city))))

(define (tree label branches)
    (if (or (list? branches) (null? branches)) (cons label branches)
        'SyntaxError))

(define (label tree) (car tree))
(define (branches tree) (cdr tree))

;; Q1: Distance
(define (distance city-a city-b)
    (sqrt (+ (expt (- (get-lat city-a) (get-lat city-b)) 2)
            (expt (- (get-lon city-a) (get-lon city-b)) 2))))

;; Q2: Closer City
(define (closer lat lon city-a city-b)
    (let ((tmp (make-city "tmp" lat lon)))
        (if (< (distance city-a tmp) (distance city-b tmp))
            (get-name city-a)
            (get-name city-b))))

;; Q3: Is Leaf
(define (is_leaf? t) (or (null? t) (null? (cdr t))))

;; Q4: Sum Nodes
; TODO: sum-nodes is not tail recursion.
(define (sum-list lst)
    (define (sum-list-iter lst sum)
        (if (null? lst) sum (sum-list-iter (cdr lst) (+ sum (car lst)))))
    (sum-list-iter lst 0))

(define (sum-nodes t)
    (define branch-sums (map sum-nodes (branches t)))
    (if (is_leaf? t) (label t) (+ (label t) (sum-list branch-sums))))

;; Q5: Fun Tree <very interesting and strong sense of achievement>
; This took me a lot of time to figure out what's going on
; (define new-branches (map fun (branches t))) will give a list of fun(Tree)
; back, since fun works on label of the tree not the tree itself, thus
; it cannot work. Then to use the recursive nature of fun-tree, just
; decorate it a little bit.
(define (fun-tree fun t)
    (define new-label (fun (label t)))
    (define new-branches (map (lambda (t) (fun-tree fun t)) (branches t)))
    (tree new-label new-branches))