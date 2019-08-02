
(load "/home/vag/Documents/Games/FantasyGame/src/graphics-management/actor.scm")
(load "/home/vag/Documents/Games/FantasyGame/src/graphics-management/animation.scm")
(load "/home/vag/Documents/Games/FantasyGame/src/graphics-management/inscription.scm")
(load "/home/vag/Documents/Games/FantasyGame/src/graphics-management/utils.scm")
(load "/home/vag/Documents/Games/FantasyGame/src/graphics-management/xtexture.scm")


(define (create-knight-choice-option!)
  (<- knight-choice-option (make <actor>))
  (<- knight-choice-option-selected-texture (load-inscription "Knight" "/home/vag/Documents/Games/FantasyGame/artworks/Fonts/missaali.otf" '(255 0 0 255) 48))
  (<- knight-choice-option-not-selected-texture (load-inscription "Knight" "/home/vag/Documents/Games/FantasyGame/artworks/Fonts/missaali.otf" '(0 0 0 255) 48))
  (add-animation knight-choice-option knight-choice-option-selected-texture 'selected)
  (add-animation knight-choice-option knight-choice-option-not-selected-texture 'not-selected)
  (change-animation knight-choice-option 'not-selected)
  (<- (slot-value knight-choice-option 'x) 50)
  (<- (slot-value knight-choice-option 'y) 120)
  knight-choice-option
)
