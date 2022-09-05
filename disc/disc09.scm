; Disc 9, Taill Call and Interpreters
; Jialin Liu

;; Q1 To Scheme An Environment Diagram
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

;; Q2 Is Tail Call
(define q1 "yes, not tail call")
(define q2 "yes, tail call")
(define q3 "yes, tail call")
(define q4 "no, not tail call")

;; Q3 Sum
(define (sum lst)
    (define (sum_iter lst x)
        (if (null? lst) x
            (sum_iter (cdr lst) (+ (car lst) x))))
    (sum_iter lst 0))

;; Q4 Reverse
; Take a list and return an reversed copy
; Use tail recursion
(define (reverse lst)
    (define (reverse_iter lst1 lst2)
        (if (null? lst1) lst2
            (reverse_iter (cdr lst1) (cons (car lst1) lst2))))
    (reverse_iter lst nil))

; Interpreter
;; Q5
; Pair('+', Pair(Pair('-', Pair(2, Pair(4, nil))), Pair(6, Pair(8, nil))))
; + -
; p.first
; 2 4 6 8
; p.rest
; p.rest.first.rest.first

;; Q6: New Procedure
;; This really takes me some time to understand what's going on.
;; Question in the statement: we don't need call `calc_eval` because it
;; has yet returned a list of operands, besides calling it will cause a
;; infinite recursive loop.
;
; def floor_div(expr):
;     """
;     >>> calc_eval(Pair("//", Pair(10, Pair(10, nil))))
;     1
;     >>> calc_eval(Pair("//", Pair(20, Pair(2, Pair(5, nil)))))
;     2
;     >>> calc_eval(Pair("//", Pair(6, Pair(2, nil))))
;     3
;     """
;     "*** YOUR CODE HERE ***"
;     def helper(expr, total):
;         if expr is nil:
;             return 1
;         elif expr.rest is nil:
;             return expr.first
;         return helper(expr.rest, total // expr.rest.first)
;     return helper(expr.rest, expr.first)

;; Q7: New Form
; i. Yes. Regisiter representing string in dictionary OPERATORS,
; from operator import gt
; OPERATORS['>'] = gt
;
; ii. No. Due to shortcut effect.
;
; def calc_eval(exp):
;     if isinstance(exp, Pair):
;         if exp.first is 'and': # and expressions
;             return eval_and(exp.rest)
;         else:                   # Call expressions
;             return calc_apply(calc_eval(exp.first), exp.rest.map(calc_eval))
;     elif exp in OPERATORS:      # Names
;         return OPERATORS[exp]
;     else:                       # Numbers
;         return exp

; def eval_and(operands):
;     """
;     >>> calc_eval(Pair("and", Pair(1, nil)))
;     1
;     >>> calc_eval(Pair("and", Pair(False, Pair("1", nil))))
;     False
;     """
;     "*** YOUR CODE HERE ***"
;     if operands.rest is nil:
;         return operands.first
;     elif operands.first is False:
;         return False
;     else:
;         return eval_and(operands.rest)

;; Q8 Saving Values
;; Lazily computation of `define` form
; def calc_eval(exp):
;     if isinstance(exp, Pair):
;         if exp.first is 'and': # and expressions[paste your answer from the earlier]
;             return eval_and(exp.rest)
;         elif exp.first is 'define': # define expressions
;             return eval_define(exp.rest)

;         else:                   # Call expressions
;             return calc_apply(calc_eval(exp.first), exp.rest.map(calc_eval))
;     elif exp in bindings: # Looking up variables
;         "*** YOUR CODE HERE ***"
;         p = bindings[exp]
;         if isinstance(p.first, (int, float)):
;             return p.first
;         else:
;             return calc_eval(p)
;     elif exp in OPERATORS:      # Looking up procedures
;         return OPERATORS[exp]
;     else:                       # Numbers
;         return exp

; def eval_define(expr):
;     """
;     >>> calc_eval(Pair("define", Pair("a", Pair(1, nil))))
;     'a'
;     >>> calc_eval("a")
;     1
;     """
;     "*** YOUR CODE HERE ***"
;     bindings[expr.first] = expr.rest
;     return expr.first

;; Q9: Counting Eval and Apply
; 5 calc_eval (exp, +, 1, 2, nil), 1 calc_apply for +
; 7 calc_eval (exp, +, 2, 4, 6, 8, nil), 1 calc_apply for +
; 9 calc_eval (exp, +, 2, *, 4, -, 6, 8, nil), 3 calc_apply for +, *, -
; 1 calc_eval (and), 0 calc_apply

;; Q10: From Pair to Calculator
(+ 1 2 3 4)
(+ 1 (* 2 3))