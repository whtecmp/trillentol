
(import srfi-69)
(import coops)
(import coops-utils)



(define-class <actor> ()
  [(animations (make-hash-table))
   (cur-anim #f)
   (x 0)
   (y 0)
   (xvelocity 0)
   (yvelocity 0)
   (when-rendering (lambda () #t))
   (when-destroying (lambda () #t))
   (when-creating (lambda () #t))
   (keydown-symbol->function (make-hash-table))
   (keyup-symbol->function (make-hash-table))
   (local-varibles (make-hash-table))]
)


(define-generic (render-actor! actor renderer x y))
(define-method (render-actor! (actor <actor>) renderer x y)
  (begin
    (if (slot-value actor 'cur-anim)
	(render-frame! (slot-value actor 'cur-anim) renderer x y)
    )
    (<- (slot-value actor 'x) (+ (slot-value actor 'x) (slot-value actor 'xvelocity)))
    (<- (slot-value actor 'y) (+ (slot-value actor 'y) (slot-value actor 'yvelocity)))
    ((slot-value actor 'when-rendering))
  ))


(define-method (activate-keydown-symbol (actor <actor>) sym)
  (let [(table (slot@ actor keydown-symbol->function))]
    (if (hash-table-exists? table sym) ((hash-table-ref table sym) actor))
  )
)


(define-method (activate-keyup-symbol (actor <actor>) sym)
  (let [(table (slot@ actor keyup-symbol->function))]
    (if (hash-table-exists? table sym) ((hash-table-ref table sym) actor))
  )
)


(define-method (bind-keydown-symbol->function! (actor <actor>) sym function)
  (<- (hash-table-ref (slot@ actor keydown-symbol->function) sym) function)
)


(define-method (bind-keyup-symbol->function! (actor <actor>) sym function)
  (<- (hash-table-ref (slot@ actor keyup-symbol->function) sym) function)
)


(define-method (add-animation (actor <actor>) xtexture name)
  (<- (hash-table-ref (slot-value actor 'animations) name) xtexture)
)


(define-method (change-animation (actor <actor>) name)
  (<- (slot-value actor 'cur-anim) (hash-table-ref (slot-value actor 'animations) name))
)

(define-method (destroy-actor! (actor <actor>))
  (<- (slot-value actor 'when-rendering) (lambda () #f))
  ((slot-value actor 'when-destroying))
)

(define-method (create-actor! (actor <actor>))
  (<- *new-actors* (append *new-actors* (cons actor '())))
  ((slot-value actor 'when-creating))
)
