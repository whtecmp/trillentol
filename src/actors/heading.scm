
(load "/home/vag/Documents/Games/FantasyGame/src/graphics-management/actor.scm")
(load "/home/vag/Documents/Games/FantasyGame/src/graphics-management/animation.scm")
(load "/home/vag/Documents/Games/FantasyGame/src/graphics-management/inscription.scm")
(load "/home/vag/Documents/Games/FantasyGame/src/graphics-management/utils.scm")
(load "/home/vag/Documents/Games/FantasyGame/src/graphics-management/xtexture.scm")


(define (create-heading!)
  (<- heading (make <actor>))
  (<- heading-texture (load-inscription "A Quest to Trillentol" "/home/vag/Documents/Games/FantasyGame/artworks/Fonts/missaali.otf" '(0 0 0 255) 54))
  (add-animation heading heading-texture 'only)
  (change-animation heading 'only)
  (<- (slot-value heading 'x) 150)
  (<- (slot-value heading 'y) 50)
  heading
)
