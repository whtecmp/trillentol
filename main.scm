;; -*- geiser-scheme-implementation: chicken -*-
(define myvarname 3)

(import (prefix sdl2 "sdl2:"))
(import (prefix sdl2-image "sdl2-image:"))

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

(define *window* (sdl2:create-window!
		  "Fantasy Game"
		  0
		  0
		  800
		  600))

(define *renderer* (sdl2:create-renderer! *window*))
(sdl2:render-draw-color-set! *renderer*
			     (sdl2:make-color 0 0 0 0))

(define *surface* (sdl2-image:load "/home/vag/Documents/Games/FantasyGame/data/Knight/Spear Knight/_IDLE/_IDLE_000.png"))
(define *texture* (sdl2:create-texture-from-surface *renderer* *surface*))

(define game-repl (lambda () (
			      (sdl2:render-clear! *renderer*)
			      (sdl2:render-copy! *renderer* *texture*
						 #f
						 (sdl2:make-rect 0 0 150 107))
			      (sdl2:render-present! *renderer*)
			      (game-repl)
			      )))
(game-repl)
