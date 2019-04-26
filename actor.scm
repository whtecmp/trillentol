
(require-extension "coops")
(require-extension "coops-utils")
(import srfi-69)
(load "/home/vag/Documents/Games/FantasyGame/xtexture.scm")

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


(define-class <actor> ()
  [(animations '())
   (cur-anim '())
   (x 0)
   (y 0)
   (xvelocity 0)
   (yvelocity 0)
   (when-rendering (lambda () '()))
   (keydown-symbol->function (make-hash-table))
   (keyup-symbol->function (make-hash-table))]
)

(define-method (render-actor! renderer (actor <actor>))
  (begin
    (render-frame! renderer (slot@ actor cur-anim) (slot@ actor x) (slot@ actor y))
    (<- (slot@ actor x) (+ x xvelocity))
    (<- (slot@ actor y) (+ y yvelocity))
    ((slot@ actor when-rendering))
  )
)
