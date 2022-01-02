#lang scheme



(define (point1 x y)
  (letrec ((getx    (lambda () x))
           (gety    (lambda () y))
           (add     (lambda (p) 
                      (point1 
                       (+ x (send 'getx p))
                       (+ y (send 'gety p)))))
           (type-of (lambda () 'point1))
          )
    (lambda (message)
      (cond ((eq? message 'getx) getx)
            ((eq? message 'gety) gety)
            ((eq? message 'add)  add)
            ((eq? message 'type-of) type-of)
            (else  (error "Message not understood"))))))

(define (point x y)
  (let ((x x)
        (y y)
        )
    (define (getx) x)

    (define (gety) y)

    (define (add p)
      (point
       (+ x (send 'getx p))
       (+ y (send 'gety p))))

    (define (type-of) 'point)

    (define (move dx dy)
      (point
       (+ x dx)
       (+ y dy)))

    (define (self message)
      (cond ((eq? message 'getx) getx)
            ((eq? message 'gety) gety)
            ((eq? message 'add)  add)
            ((eq? message 'move)  move)
            ((eq? message 'type-of) type-of)
            (else  (error "Message not understood"))))
      self))


(define (method-lookup object selector)
        (cond ((procedure? object)
               (let ((result (object selector)))
                 (if (procedure? result)
                     result
                     (error "did not find any method"))))))

(define (send message obj . par)
  (let ((method (obj message)))
    (apply method par)))

;(define (send message obj . par)
 ; (let ((method (method-lookup obj message)))
  ;  (apply method par)))

(define (new-instance class . parameters)
  (apply class parameters))


(define (rectangle p1 p2)
  (let ((x1 (send 'getx p1))
        (x2 (send 'getx p2))
        (y1 (send 'gety p1))
        (y2 (send 'gety p2))
        )
        
    (define (get-inits)
      (list (cons x1 y1 ) (cons x2 y2)))


    (define (type-of) rectangle)

    (define (move dx dy)
      (rectangle
       (point
        (+ x1 dx)
        (+ y1 dy))
       (point
        (+ x2 dx)
        (+ y2 dy))
       ))

    (define (area)
       (let ((width (- (send 'getx p2) (send 'getx p1)))
                            (height  (- (send 'gety p2) (send 'gety p1))))
                        (abs (* width height))))


    (define (self message)
      (cond ((eq? message 'get-inits) get-inits)
            ((eq? message 'area) area)
            ((eq? message 'move)  move)
            ((eq? message 'type-of) type-of)
            (else  (error "Message not understood"))))
      self))

(define p (point 3 4))
(define k (point -5 10))
(define ap (send 'add p k))
(list (send 'getx ap) (send 'gety ap))

(define recPK (new-instance rectangle p k))
(send 'get-inits recPK)
(send 'area recPK)

; Call with current continuation call/cc



(cons 1 (cons 2 (cons 3 ( call/cc (lambda (e) (e (list 4 5)))))))
(+ 5 (call/cc (lambda (e) (* 140 *(e 7))) ))

;In this case we have (remainder (* 3 4) 5) which gives 2 as the value of the 1st parenthesis got replaced with 3
(let ((x 5))
  (if (= 0 x)
      'undefined
      (remainder (* (call/cc (lambda (e) (+ x 1 (e 3)))) (- x 1)) x)))

;Outputs (cons 1 6) as the value of second cons is replaced by (e (+ v 1) Christ sake I got it!
(let ((x 1)
      (y 2)
      (z 3)
      (v 5))
  (cons x 
        (call/cc (lambda (e) 
                   (cons y  
                         (cons z 
                              (if (even? v) v (e (+ v 1)))))))))
; Outputs (+ 1 6) ## EZZZZZ
(let ((x 1)
      (y 2)
      (z 3)
      (v 5))
  (+ x 
     (call/cc
       (lambda (e) 
         (+ y 
            (+ z
               (if (even? v) v (e (+ v 1)))))))))