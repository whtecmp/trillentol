
;; Imports 
(import (prefix sdl2 "sdl2:"))
(import (prefix sdl2-image "sdl2-image:"))


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


;; Name: load-animation
;; Input: pathes: A list of strings of pathes to image files constructiung an animation.
;;        renderer: A sdl-renderer object that will render the animation later.
;;        timeout-per-frame:
;;        width:
;;        hight: 
;; Output: A list of 3-tuple (sdl-textures, 0, number) constructing the animation with the correct frame rate.
(define (load-animation pathes renderer timeout-per-frame width hight)
			 (make-circular! (map (lambda (frame) ; The function that adds 0 and a number to the sdl texture and the width and hight
						(cons (cons 0 timeout-per-frame) (cons (cons width hight) frame))) 
					      (map (lambda (surface) ; The function that loads a texture from the surface
								      (let [(texture (sdl2:create-texture-from-surface renderer surface))] ; Load the texture
									(sdl2:free-surface! surface) ; Free the surface
									texture ; Return the textur
									)) 
						   (map sdl2-image:load* pathes) ; Get the list of surfaces
						   ))))


;; Name: render-frame!
;; Input: renderer:
;;        x:
;;        y: 
;;        animation: 
;; Output: 
(define (render-frame! renderer x y animation)
  (let [(width {car (cadr (car (cdr animation)))})
	(hight {cdr (cadr (car (cdr animation)))})
	(time-on-this-frame {+ 1 (car (car (car animation)))})
	(timeout-per-frame {cdr (car (car animation))})]
    
    (sdl2:render-copy! renderer (cddr (car animation))
		    #f
		    (sdl2:make-rect (round x) (round y) width hight))
    
    (if (= timeout-per-frame time-on-this-frame)
	(begin (set! (car (car (car animation))) 0)
	       (cdr animation)
	       )
	(begin (set! (car (car (car animation))) time-on-this-frame)
	       animation)
	)
  )
)
