
(define-syntax <- (ir-macro-transformer (lambda (expr inject compare)
						  (let ((var (cadr expr))
							(val (caddr expr)))
						    `(set! ,var ,val)))
					))

(define-syntax -> (ir-macro-transformer (lambda (expr inject compare)
						  (let ((val (cadr expr))
							(var (caddr expr)))
						    `(set! ,var ,val)))
						))

(define (nth n l)
  (if (or (> n (length l)) (< n 0))
    (error "Index out of bounds.")
    (if (eq? n 0)
      (car l)
      (nth (- n 1) (cdr l)))))


;; Name: make-circular!
;; Input: lst: A list we want to make circular.
;; Output: The same list but circular.
(define (make-circular! lst)
  (define (last-pair lst) ; helper for finding the last pair in a list
    (if (null? (cdr lst))
        lst
        (last-pair (cdr lst))))
  (cond ((null? lst) '()) ; special case: if the list is empty
        (else
         (set-cdr! (last-pair lst) lst) ; set the last pair to point to the head of the list
         lst)))


;; Name: go-back
;; Input: lst: A circular list
;; Output: The same list, but when the car of the list is one element back
(define (go-back lst)
  (let [(first (car lst))]
    (define (find-before-element lst)
      (if (eq? (cadr lst) first)
	  lst
	  (find-before-element (cdr lst))
	  )
      )
    (find-before-element lst)
    )
  )

(define (map-circular func lst)
  (let [(first (car lst))]
    (define (call-on-all lst)
      (if (eq? (cadr lst) first)
	  `(,(func (car lst)))
	  (cons (func (car lst)) (call-on-all (cdr lst)))
	  )
    )
    (make-circular! (call-on-all lst))
  )
)
