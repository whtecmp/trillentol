
(load "/home/vag/Documents/Games/FantasyGame/src/graphics-management/actor.scm")
(load "/home/vag/Documents/Games/FantasyGame/src/graphics-management/animation.scm")
(load "/home/vag/Documents/Games/FantasyGame/src/graphics-management/inscription.scm")
(load "/home/vag/Documents/Games/FantasyGame/src/graphics-management/utils.scm")
(load "/home/vag/Documents/Games/FantasyGame/src/graphics-management/xtexture.scm")


(define (create-background!)
  (<- background (make <actor>))
  (<- background-texture (load-animation '("/home/vag/Documents/Games/FantasyGame/artworks/UI/background.png") renderer 1 800 600))
  (add-animation background background-texture 'only)
  (change-animation background 'only)
  background
)
