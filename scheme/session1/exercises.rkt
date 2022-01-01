#lang scheme

;Examples of code

(null? '()) ;t

(null? (list 1 2 3))  ;f

(null? 5) ;f

(pair? (cons 1 1)) ;t

(pair? 5) ;f

(pair? '()) ;f

;List tail, list prefix
;http://people.cs.aau.dk/~normark/pp/fp-intro-scheme-mini-proj-1-slide-exercise-2.html

;Different examples of lambda input parameters
;http://people.cs.aau.dk/~normark/pp/fp-intro-scheme-lambda-expr-scheme-slide-exercise-1.html

;(lambda (x y z) expr);  accepts exactly three parameters
;(lambda (x y z . r) expr); accepts three or more parameters
;(lambda r expr); accepts an arbitrary number of parameters

;end of examples

(define a (list 1 2 3))
(define b (cons 1 (cons 2 (cons 3 '()))))
(define c (cons 1 (cons 2 (cons 3 4))))

;Exercises   1.3, 1.5, 1.7, 1.8, and 1.11.

(define (iterate-over-list lst)
  (if (null? lst)
      lst
      (cons (car lst) (iterate-over-list (cdr lst)))))

(define (list-prefix lst n)
  (if (= n 0)
      '()
      (cons (car lst) (list-prefix (cdr lst) (- n 1)))))

(define (my-list-tail lst n)
  (if (= n 0)
      lst
      (my-list-tail (cdr lst) (- n 1))))

;Exercise 1.3 Proper list

(define (my-proper-list? x)
  (if (null? x)
      #t
      (if (pair? x)
          (my-proper-list? (cdr x))
          #f)
   )
)

(define (proper-list? x)
  (or (null? x)
      (and (pair? x) (proper-list? (cdr x)))))

;Exercise 1.5 Every 2nd and every nth element

(define (five a) 5)
;(define (every-nth lst n))
  

(define (doubles n)
  (let ((a 2)) (* n a)))


; Return every second element of list, starting with the first element.
(define (every-second-element lst)
  (if (null? lst)
      lst
      (if (null? (cdr lst))
                 (list (car lst))
                 (cons (car lst) (every-second-element (cddr lst))))))

(define (every-second-elemnt1 lst)
  (cond ((null? lst) lst)
        ((null? (cdr lst)) (list (car lst)))
        (else  (cons (car lst) (every-second-element (cddr lst))))))



(define (shorter-than? lst n)
  (< (length lst) n))

; Return every n-th element of lst. Assume as a pre-condition that n >= 1.
;(define (every-nth-element n lst)
(define (every-nth-element lst n)
  (cond ((null? lst) '())
        ((shorter-than? (cdr lst) n) (list (car lst)))
        (else (cons (car lst) (every-nth-element (my-list-tail lst n) n)))))
        

;Ex 1.6 Creation of association lists
;Assuming same length of lst1 lst2
(define (pair-up lst1 lst2)
  (cond ((null? lst1) '() )
        (else (cons (cons (car lst1) (car lst2)) (pair-up (cdr lst1) (cdr lst2) )))

             ))

;Assuming different length of lst1 lst2
(define (pair-up-smart lst1 lst2)
  (cond ((or (null? lst1) (null? lst2)) '() )
        (else (cons
               (cons (car lst1) (car lst2))
               (pair-up-smart (cdr lst1) (cdr lst2) )))

             ))

;Exercise 1.7 Prop to asso, asso to prop

(define (prop-to-asso lst)
  (cond ((or (null? lst) (null? (car lst))) '())
        (else(cons( cons (car lst) (cadr lst)) (prop-to-asso (cddr lst))))))
(prop-to-asso '(a 1 b 2 c 3))

(define (asso-to-prop lst)
  (if (null? lst)
      '()
      (cons (caar lst) (cons (cdar lst) (asso-to-prop (cdr lst))))
      ))

(asso-to-prop '((a . 1) (b . 2)  (c . 3)))


;Exercise 1.8
(define weekday-plist (list 'monday 1 'tuesday 2 'wednesday 3 'thursday 4 'friday 5 'saturday 6 'sunday 7))

(define (get-prop lst prop)
  (cond ((null? lst) #f)
        ((equal? (car lst) prop) (cadr lst))
        (else (get-prop (cdr lst) prop))))

;Exercise 1.11
(define (counter-part-to-tail lst n)
  (cond ((< n 0) (error "Cannot use negative tail"))
        ((or(equal? n 0) (null? lst)) lst)
        (else (counter-part-to-tail (cdr lst) (- n 1)))))
      