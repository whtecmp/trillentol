
(load "~/Downloads/quicklisp.lisp")
(quicklisp-quickstart:install)

(ql:quickload "sdl2")
(ql:quickload "sdl2-image")

(defmacro <- (var val) `(setq ,var ,val))
(defmacro -> (val var) `(setq ,var ,val))

(<- *window* (sdl2:create-window
	      :title "Fantasy Game"))

(<- *renderer* (sdl2:create-renderer *window*))
(sdl2:set-render-draw-color *renderer* 0 0 0 0)

(<- *surface* (sdl2-image:load-image "/home/vag/Documents/Games/DarkLimbo/data/Hero.png"))

(<- *texture* (sdl2:create-texture-from-surface *renderer* *surface*))

(sdl2:free-surface *surface*)


(defun game-repl ()
  (<- x (read))
  (<- y (read))
  (sdl2:render-clear *renderer*)
  (sdl2:render-copy *renderer* *texture*
		    :source-rect nil
		    :dest-rect (sdl2:make-rect x y 30 45)
		    )
  (sdl2:render-present *renderer*)
  (game-repl)
  )

(game-repl)
