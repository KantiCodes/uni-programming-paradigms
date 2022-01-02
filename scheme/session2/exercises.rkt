#lang scheme

;Example of using define and let
(define (doubles n)
  (let ((a 2)) (* n a)))

; Doubles the numbers
(map (lambda (input) (* 2 input)) '(1 2 3)) ; (2 4 6)


;Recursive fibbonacci
(define (fib n)
  (cond ((equal? n 0) 1)
        ((equal? n 1) 1)
        (else (+ (fak (- n 1)) (fak (- n 2))))))

;Recursive factorial
(define (fak n)
  (cond ((equal? n 0) 1)
        (else (* (fak (- n 1)) n))))

;Iterative tail recrusion factorial
(define (iterfakbody n r)
  (if (= n 0)
      r
      (fak (- n 1) (* n r))))

(define (iterfak n)
  (iterfakbody n 1))

;Currying
(define (curry2 f)
  (lambda (x)
    (lambda (y)
      (f x y))))

(define (curry3 f)
  (lambda (x)
    (lambda (y)
      (lambda (z)
        (f x y z)))))

(define (uncurry2 f)
  (lambda (x y)
    ((f x) y)))

(define (uncurry3 f)
  (lambda (x y z)
    (((f x) y)z)))

;Higher order functions examples
(define (compose f g)
  (lambda (x)
    (f (g x))))

(define (negate p)
  (lambda (x) 
    (if (p x) #f #t)))

(define (flip f)
  (lambda (x y)
    (f y x)))


;EXERCISES
;Exercise 2.21  Deriviate of a function
(define (deriviate f)
  (lambda (x)
   (let ((dx 0.00001))
     (/(- (f (+ x dx)) (f x)) dx))))


(define (compare-2-funcs f1 f2 input-list)
  (map (lambda (input)
         (- (f1 input) (f2 input))) input-list))

(define f-3x-squared (lambda (x) (* 3 x x)))
(define derf-3x-squared (deriviate (lambda (x) (* x x x))))


;Exercise 2.11 C-style comparison

(define (make-comparison lt)
  (lambda (e1 e2)
    (cond ((lt e1 e2) -1)
          ((lt e2 e1)1)
          (else 0))))

(define numcmp (make-comparison <))
(define strcmp (make-comparison string<?))

;Exercise 2.2

(define (get-n-from-cycle lst index)
  (get-el-from-lst lst lst index))

(define (get-el-from-lst lst current_lst index)
  (let ((steps-left (- (modulo index (length lst)) 1))) 
  (if (equal? steps-left 0)
      (car current_lst)
      (get-el-from-lst lst (cdr current_lst) steps-left))))

(define (cyclic-list lst n-elements current-index)
  (if (equal? n-elements current-index)
      '()
      (cons (get-n-from-cycle lst(+ current-index 1)) (cyclic-list lst n-elements (+ current-index 1)))))

(define (replicate-to-length lst n)
  (cyclic-list lst n 0))

(define listabc '(a b c))
;(replicate-to-length listabc 6) ; '(a b c a b c)
;(replicate-to-length listabc 4) ; '(a b c a)

;From solution


;Exercise 2.16
;For all
(define (for-all lst predicate)
  (if (not (predicate (car lst)))
      #f
      (if (equal? (cdr lst) null)
          #t
          (for-all (cdr lst) predicate))))


;There exists
(define (there-exists lst predicate)
  (if (predicate (car lst))
      #t
      (if (equal? (cdr lst) null)
          #f
          (there-exists (cdr lst) predicate))))

(define (only-1 lst predicate)
  (cond ((null? lst) #f)
        ((predicate (car lst)) (not (there-exists (cdr lst) predicate)))
        (else (only-1 (cdr lst) predicate))))
        

(define (smaller-than-n n)
  (lambda (element)
    (< element n)))

(define less-5 (smaller-than-n 5))


;(for-all '(1 2 7) less-5) ;#f
;(for-all '(1 2 3) less-5) ;#t
;(there-exists '(7 7 2) less-5) ;#t
;(there-exists '(7 7 7) less-5) ;#f
;(only-1 '(1 2 7) less-5) ;#f
;(only-1 '(7 2 7) less-5) ;#t
;(only-1 '(7 7 7) less-5) ;#f


;Exercise 2.20


(define (self-compose-2 f)
  (lambda (x)
    (f (f x))))

(define (self-compose* f n)
  (cond ((= n 1) f)
        ((> n 1) (compose f (self-compose* f (- n 1))))))


(define (compose-flist flist)
  (cond ((= (length flist) 1) (car flist))
        ((> (length flist) 1) (compose (car flist) (compose-flist (cdr flist))))))

(define just-plus '(+))
(define h (self-compose* (lambda (x) (/ x 2)) 4))
(define plus4 (lambda (x) (+ x 4)))
(define times2 (lambda (x) (* x 2)))
(define times3 (lambda (x) (* x 3)))

(define p4-t2-t3 (list plus4 times2 times3))
;(equal? (car just-plus) (compose-flist just-plus)) ;#t
;(h 16) ;1
(define (reduce-right f lst)
  (if (null? (cdr lst))
      (car lst)
      (f (car lst) (reduce-right f (cdr lst)))))