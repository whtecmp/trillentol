


(define (create-new-game!)
  (<- new-game (make <actor>))
  (<- new-game-selected-texture (load-inscription "New Game" "/home/vag/Documents/Games/FantasyGame/artworks/Fonts/missaali.otf" '(255 0 0 255) 48))
  (<- new-game-not-selected-texture (load-inscription "New Game" "/home/vag/Documents/Games/FantasyGame/artworks/Fonts/missaali.otf" '(0 0 0 255) 48))
  (add-animation new-game new-game-selected-texture 'selected)
  (add-animation new-game new-game-not-selected-texture 'not-selected)
  (change-animation new-game 'selected)

  (define (action-when-chosen)
    (destroy-actor! menu-chooser)
    ; (create-menu! class-menu 'right 'left 'a `("Knight" x y on-choice) `("Mage" x y on-choice))
    ; (create-actor! (create-knight-choice-option!))
    ; (create-actor! (create-mage-choice-option!))
    ; (create-actor! (create-menu-chooser! 'right 'left 'a `(,knight-choice-option ,mage-choice-option)))
  )
  
  (<- (hash-table-ref (slot-value new-game 'local-varibles) 'action-when-chosen) action-when-chosen)
  (<- (slot-value new-game 'x) 150)
  (<- (slot-value new-game 'y) 120)
  new-game
)
