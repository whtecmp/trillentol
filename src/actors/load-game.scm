
(load "/home/vag/Documents/Games/FantasyGame/src/graphics-management/actor.scm")
(load "/home/vag/Documents/Games/FantasyGame/src/graphics-management/animation.scm")
(load "/home/vag/Documents/Games/FantasyGame/src/graphics-management/inscription.scm")
(load "/home/vag/Documents/Games/FantasyGame/src/graphics-management/utils.scm")
(load "/home/vag/Documents/Games/FantasyGame/src/graphics-management/xtexture.scm")


(define (create-background!)
  (<- load-game (make <actor>))
  (<- load-game-selected-texture (load-inscription "Load Game" "/home/vag/Documents/Games/FantasyGame/artworks/Fonts/missaali.otf" '(255 0 0 255) 48))
  (<- load-game-not-selected-texture (load-inscription "Load Game" "/home/vag/Documents/Games/FantasyGame/artworks/Fonts/missaali.otf" '(0 0 0 255) 48))
  (add-animation load-game load-game-selected-texture 'selected)
  (add-animation load-game load-game-not-selected-texture 'not-selected)
  (change-animation load-game 'not-selected)
  (<- (slot-value load-game 'x) 150)
  (<- (slot-value load-game 'y) 170)
)
