
(load "/home/vag/Documents/Games/FantasyGame/src/graphics-management/actor.scm")
(load "/home/vag/Documents/Games/FantasyGame/src/graphics-management/animation.scm")
(load "/home/vag/Documents/Games/FantasyGame/src/graphics-management/inscription.scm")
(load "/home/vag/Documents/Games/FantasyGame/src/graphics-management/utils.scm")
(load "/home/vag/Documents/Games/FantasyGame/src/graphics-management/xtexture.scm")


(define (create-new-game!)
  (<- new-game (make <actor>))
  (<- new-game-selected-texture (load-inscription "New Game" "/home/vag/Documents/Games/FantasyGame/artworks/Fonts/missaali.otf" '(255 0 0 255) 48))
  (<- new-game-not-selected-texture (load-inscription "New Game" "/home/vag/Documents/Games/FantasyGame/artworks/Fonts/missaali.otf" '(0 0 0 255) 48))
  (add-animation new-game new-game-selected-texture 'selected)
  (add-animation new-game new-game-not-selected-texture 'not-selected)
  (change-animation new-game 'selected)
  (<- (slot-value new-game 'x) 150)
  (<- (slot-value new-game 'y) 120)
  new-game
)
