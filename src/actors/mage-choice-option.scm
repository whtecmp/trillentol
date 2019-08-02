

(load "/home/vag/Documents/Games/FantasyGame/src/graphics-management/actor.scm")
(load "/home/vag/Documents/Games/FantasyGame/src/graphics-management/animation.scm")
(load "/home/vag/Documents/Games/FantasyGame/src/graphics-management/inscription.scm")
(load "/home/vag/Documents/Games/FantasyGame/src/graphics-management/utils.scm")
(load "/home/vag/Documents/Games/FantasyGame/src/graphics-management/xtexture.scm")


(define (create-mage-choice-option!)
  (<- mage-choice-option (make <actor>))
  (<- mage-choice-option-selected-texture (load-inscription "Mage" "/home/vag/Documents/Games/FantasyGame/artworks/Fonts/missaali.otf" '(255 0 0 255) 48))
  (<- mage-choice-option-not-selected-texture (load-inscription "Mage" "/home/vag/Documents/Games/FantasyGame/artworks/Fonts/missaali.otf" '(0 0 0 255) 48))
  (add-animation mage-choice-option mage-choice-option-selected-texture 'selected)
  (add-animation mage-choice-option mage-choice-option-not-selected-texture 'not-selected)
  (change-animation mage-choice-option 'not-selected)
  (<- (slot-value mage-choice-option 'x) 50)
  (<- (slot-value mage-choice-option 'y) 120)
  mage-choice-option
)
