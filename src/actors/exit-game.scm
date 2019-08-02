



(define (create-exit-game!)
  (<- exit-game (make <actor>))
  (<- exit-game-selected-texture (load-inscription "Exit Game" "/home/vag/Documents/Games/FantasyGame/artworks/Fonts/missaali.otf" '(255 0 0 255) 48))
  (<- exit-game-not-selected-texture (load-inscription "Exit Game" "/home/vag/Documents/Games/FantasyGame/artworks/Fonts/missaali.otf" '(0 0 0 255) 48))
  (add-animation exit-game exit-game-selected-texture 'selected)
  (add-animation exit-game exit-game-not-selected-texture 'not-selected)
  (change-animation exit-game 'not-selected)
  (define (action-when-chosen) (<- *quit* #t))
  (<- (hash-table-ref (slot-value exit-game 'local-varibles) 'action-when-chosen) action-when-chosen)
  (<- (slot-value exit-game 'x) 150)
  (<- (slot-value exit-game 'y) 220)
  exit-game
)
