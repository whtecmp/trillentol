
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
