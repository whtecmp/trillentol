
(import (prefix sdl2 "sdl2:"))

(sdl2:set-main-ready!)
(sdl2:init!)

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

(<- *window* (sdl2:create-window!
		  "Fantasy Game"
		  0
		  0
		  800
		  600))

(<- *renderer* (sdl2:create-renderer! *window*))
(sdl2:render-draw-color-set! *renderer*
			     (sdl2:make-color 0 0 0 0))

(<- *animation* (load-animation '(
			       "/home/vag/Documents/Games/FantasyGame/data/Knight/Spear Knight/_WALK/_WALK_000.png"
			       "/home/vag/Documents/Games/FantasyGame/data/Knight/Spear Knight/_WALK/_WALK_001.png"
			       "/home/vag/Documents/Games/FantasyGame/data/Knight/Spear Knight/_WALK/_WALK_002.png"
			       "/home/vag/Documents/Games/FantasyGame/data/Knight/Spear Knight/_WALK/_WALK_003.png"
			       "/home/vag/Documents/Games/FantasyGame/data/Knight/Spear Knight/_WALK/_WALK_004.png"
			       "/home/vag/Documents/Games/FantasyGame/data/Knight/Spear Knight/_WALK/_WALK_005.png"
			       "/home/vag/Documents/Games/FantasyGame/data/Knight/Spear Knight/_WALK/_WALK_006.png"
			       ) *renderer* 100 300 200))


(define game-repl (lambda (animation x y xvelocity) (begin
		    (sdl2:pump-events!)
		    (if (sdl2:has-events?)
			(begin
			  (<- event (sdl2:poll-event!))
			  (case (sdl2:event-type event)
			    ((quit) (begin (sdl2:destroy-window! *window*) (bug)))
			    ((key-down) (case (sdl2:keyboard-event-sym event)
					  ((right) (<- xvelocity 0.1))
					  ((left) (<- xvelocity -0.1))
					  ))
			    ((key-up) (case (sdl2:keyboard-event-sym event)
					  ((right) (<- xvelocity 0))
					  ((left) (<- xvelocity 0))
					  )))
			  
			))
		    (begin
		      (sdl2:render-clear! *renderer*)
		      (<- animation (render-frame! *renderer* x y animation))
		      (sdl2:render-present! *renderer*)
		      (game-repl animation (+ x xvelocity) y xvelocity)
		      ))))
		    
(game-repl *animation* 200 200 0)
