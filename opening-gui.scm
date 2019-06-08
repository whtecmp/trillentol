
(load "/home/vag/Documents/Games/FantasyGame/animation.scm")
(load "/home/vag/Documents/Games/FantasyGame/actor.scm")
(load "/home/vag/Documents/Games/FantasyGame/inscription.scm")


(define (create-opening-gui! renderer)
  (<- background (make <actor>))
  (<- background-texture (load-animation '("/home/vag/Documents/Games/FantasyGame/data/UI/background.png") renderer 1 800 600))
  (add-animation background background-texture 'only)
  (change-animation background 'only)

  (<- heading (make <actor>))
  (<- heading-texture (load-inscription "A Quest to Trillentol" "/home/vag/Documents/Games/FantasyGame/data/Fonts/missaali.otf" '(0 0 0 255) 54))
  (add-animation heading heading-texture 'only)
  (change-animation heading 'only)
  (<- (slot-value heading 'x) 150)
  (<- (slot-value heading 'y) 50)

  (<- menu-chooser (make <actor>))
  (<- (hash-table-ref (slot-value menu-chooser 'local-varibles) 'current-option) 0)
 ;(bind-keydown-symbol->function! menu-chooser 's PLACE_HERE_FUNCTION_THAT_INCREASES_CURRENT_OPTION_LOCAL_VARIBLE_MODULU) ; We want the red option to be moveable down cyclicly

  (<- new-game (make <actor>))
  (<- new-game-selected-texture (load-inscription "New Game" "/home/vag/Documents/Games/FantasyGame/data/Fonts/missaali.otf" '(255 0 0 255) 48))
  (<- new-game-not-selected-texture (load-inscription "New Game" "/home/vag/Documents/Games/FantasyGame/data/Fonts/missaali.otf" '(0 0 0 255) 48))
  (add-animation new-game new-game-selected-texture 'selected)
  (add-animation new-game new-game-not-selected-texture 'not-selected)
  (change-animation new-game 'selected)
  (<- (slot-value new-game 'x) 150)
  (<- (slot-value new-game 'y) 120)
  
  (<- load-game (make <actor>))
  (<- load-game-selected-texture (load-inscription "Load Game" "/home/vag/Documents/Games/FantasyGame/data/Fonts/missaali.otf" '(255 0 0 255) 48))
  (<- load-game-not-selected-texture (load-inscription "Load Game" "/home/vag/Documents/Games/FantasyGame/data/Fonts/missaali.otf" '(0 0 0 255) 48))
  (add-animation load-game load-game-selected-texture 'selected)
  (add-animation load-game load-game-not-selected-texture 'not-selected)
  (change-animation load-game 'not-selected)
  (<- (slot-value load-game 'x) 150)
  (<- (slot-value load-game 'y) 170)
  
  `(,background ,heading ,menu-chooser ,new-game, load-game)
)
