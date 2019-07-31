
(import (prefix sdl2 "sdl2:"))
(import (prefix sdl2-image "img:"))
(import (prefix sdl2-ttf "ttf:"))
(import coops)
(import coops-utils)

(sdl2:set-main-ready!)
(sdl2:init!)

(load "/home/vag/Documents/Games/FantasyGame/src/graphics-management/xtexture.scm")
(load "/home/vag/Documents/Games/FantasyGame/src/graphics-management/actor.scm")
(load "/home/vag/Documents/Games/FantasyGame/src/opening-gui.scm")


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


(define (init!)
  (sdl2:init!)
  (img:init!)
  (ttf:init!)

   (<- window (sdl2:create-window! 
		 "Fantasy Game"
		 0
		 0
		 800
		 600))
   (<- renderer (sdl2:create-renderer! window))
   (sdl2:render-draw-color-set! renderer
				(sdl2:make-color 0 0 0 0))
   (<- view (make <actor>))
   (<- opening-gui (create-opening-gui! renderer))
   (<- actors (cons view opening-gui))
   `(,window ,renderer ,view ,actors)
)


(define (handle-events! actors)
  (if (sdl2:has-events?)
      (begin
	(<- quit #f)
	(<- event (sdl2:poll-event!))
	(case (sdl2:event-type event)
	  [(quit) (<- quit #t)]
	  [(key-down) (map (lambda (actor)
			     (activate-keydown-symbol actor (sdl2:keyboard-event-sym event))
		           )
		           actors
		      )
	  ]
	  [(key-up) (map (lambda (actor)
			     (activate-keyup-symbol actor (sdl2:keyboard-event-sym event))
		         )
		         actors
		    )
	  ]

	 )
	(if quit #t (handle-events! actors))
      )
      #f
  )
)


(define (render-actors! renderer view actors)
  (if (null? actors) '()
    (let [{actor (car actors)}]
      (if (render-actor! actor renderer (- (slot@ actor x) (slot@ view x)) (- (slot@ actor y) (slot@ view y)))
	  (cons actor (render-actors! renderer view (cdr actors)))
	  (render-actors! renderer view (cdr actors))
      )
    )
  )
)


(define (game-prul! renderer view actors)

  ;; (P) oll events
  (sdl2:pump-events!)
  (<- x (handle-events! actors))
  (if x '()
      (begin
	;; (R) ender actors
	(sdl2:render-clear! renderer)
	(<- actors (render-actors! renderer view actors))
	(if (equal? actors '()) '()
	    (begin
	      (sdl2:render-present! renderer)

	      ;; (U) pdate and (L) oop
	      (game-prul! renderer view actors)
	    )
  )))
)


(define (cleanup! window renderer)
  (sdl2:destroy-window! window)
  (sdl2:destroy-renderer! renderer)
)


(define (main!)
  (<- initial-window-renderer-view-actors (init!))
  (apply game-prul! (cdr initial-window-renderer-view-actors))
  (cleanup! (car initial-window-renderer-view-actors) (cadr initial-window-renderer-view-actors))
)


(main!)
