#lang scheme
;Examples from lecture

(define delayed-11 (delay (+ 5 6)))

(define-syntax cons-stream
  (syntax-rules ()
    ((cons-stream x y)
     (cons x (delay y)))))

(define head car)
(define tail (compose force cdr))

(define empty-stream? null?)

(define the-empty-stream '())

(define str (cons-stream 'a (cons-stream 'b the-empty-stream)))

(head str)
(head (tail str))
;(head (tail (tail str))) error

(define (stream-section n stream)
  (cond ((= n 0) '())
        (else (cons (head stream)
                    (stream-section 
                      (- n 1)
                      (tail stream))))))


(define (add-streams s1 s2)
  (let ((h1 (head s1))
        (h2 (head s2)))
    (cons-stream (+ h1 h2) (add-streams (tail s1) (tail s2)))))

(define ones (cons-stream 1 ones))
;(stream-section 50 ones)

(define (integers-starting-from n)
  (cons-stream n (integers-starting-from (+ n 1))))

(integers-starting-from 5)
;(stream-section 50 (integers-starting-from 5))

(define nat-nums (integers-starting-from 1))
;(stream-section 50 nat-nums)

;Fibonacci numbers
(define fibs
  (cons-stream 0
               (cons-stream 1
                            (add-streams (tail fibs) fibs))))

;Prime numbers
(define (divisible? x y)
  (equal? 0 (modulo x y)))

(define (filter-stream p lst)
  (cond ((empty-stream? lst) the-empty-stream)
        ((p (head lst)) (cons-stream (head lst) (filter-stream p (tail lst))))
        (else (filter-stream p (tail lst)))))

(define (sieve stream)
   (cons-stream
    (head stream)
    (sieve
     (filter-stream
      (lambda (x) (not (divisible? x (head stream))))
      (tail stream)))))

(define primes (sieve (integers-starting-from 2)))
;(stream-section 50 primes)


;EXERCISES
;Exercise 4.1
(define (stream . element-list)
  (if (null? element-list)
      the-empty-stream
      (cons-stream (car element-list)
                   (apply stream (cdr element-list)))))
;Exercise 4.2
(define (fak n)
  (cond ((equal? n 0) 1)
        (else (* (fak (- n 1)) n))))

;Iterative tail recrusion factorial
(define (integers-starting-from1 n)
  (cons-stream n (integers-starting-from (+ n 1))))

(define (iterfakbody n r)
  (if (= n 0)
      r
      (fak (- n 1) (* n r))))

(define (combine-streams f s1 s2)
  (let ((h1 (head s1))
        (h2 (head s2)))
    (cons-stream (f h1 h2) (combine-streams f (tail s1) (tail s2)))))


(define fac-stream
  (cons-stream 1 (combine-streams * (tail nat-nums) fac-stream)))

(define ones-ns (combine-streams * nat-nums (integers-starting-from 10)))

;(stream-section 7 fac-stream)

;Exercise 4.3

;Stream append
(define (my-append lst1 lst2)
  (cond ((null? lst1) lst2)
        (else (cons (car lst1) (my-append (cdr lst1) lst2)))))

(define (append-streams s1 s2)
  (cond ((empty-stream? s1) s2)
        ((empty-stream? s2) s1)
        (else (cons-stream (head s1) (append-streams (tail s1) s2)))))

;Finite streams
(define fin1 (stream 1 2 3 4))
(define fin2 (stream "a" "b" "c"))

(define appended-fin1-fin2 (stream-section 7 (append-streams fin1 fin2)))

;Stream merge we have to cons 2 times to append first one of them then the other one
(define (stream-merge s1 s2)
  (cond ((empty-stream? s1) s2)
        ((empty-stream? s2) s1)
        (else (let (
                    (h1 (head s1))
                    (h2 (head s2)))
                (cons h1 (cons h2 (stream-merge (tail s1) (tail s2))))))))

(define merged-fin1-fin2 (stream-section 7 (stream-merge fin1 fin2)))
