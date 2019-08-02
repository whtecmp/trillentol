
(import coops)
(import (prefix sdl2-ttf "ttf:"))
(import (prefix sdl2 "sdl2:"))


(define-class <inscription> (<xtexture>)
  [text
   font
   color
   ])


(define (load-inscription text path color psize)
  (make <inscription> 'text text 'font (ttf:open-font path psize) 'color color)
  )

(define-method (render-frame! (inscription <inscription>) renderer x y)
  (let-values [((w h) (ttf:size-text (slot-value inscription 'font) (slot-value inscription 'text)))]
    {
    sdl2:render-copy! renderer
		       (sdl2:create-texture-from-surface renderer ; Get texture
							 (ttf:render-text-solid ; Get surface
							  (slot-value inscription 'font) (slot-value inscription 'text)
							  (apply sdl2:make-color (slot-value inscription 'color))
							  )
							 )
		       #f
		       (sdl2:make-rect x y w h)
		       
   }
  ))
