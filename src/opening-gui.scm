
;(load "/home/vag/Documents/Games/FantasyGame/actors/actor-factories.scm")

(load "/home/vag/Documents/Games/FantasyGame/src/graphics-management/actor.scm")
(load "/home/vag/Documents/Games/FantasyGame/src/graphics-management/animation.scm")
(load "/home/vag/Documents/Games/FantasyGame/src/graphics-management/inscription.scm")
(load "/home/vag/Documents/Games/FantasyGame/src/graphics-management/utils.scm")
(load "/home/vag/Documents/Games/FantasyGame/src/graphics-management/xtexture.scm")

(define (create-opening-gui! renderer)

  ; (map (lambda (factory) (factory)) actor-factories) ; NEED TO CHANGE SO THAT ACTOR-FACTORIES ISNT GLOBAL!
  
  ;; 
  ;; WE WANT TO SPLIT THIS FUNCTION AND MAKE IT SO THAT EVERY ACTOR HAS ITS OWN FILE, AND WE JUST GIVE A LIST OF ACTOR FACTORIES FOR THIS FUNCTION!
  ;;
  
  (<- background (make <actor>))
  (<- background-texture (load-animation '("/home/vag/Documents/Games/FantasyGame/artworks/UI/background.png") renderer 1 800 600))
  (add-animation background background-texture 'only)
  (change-animation background 'only)

  (<- heading (make <actor>))
  (<- heading-texture (load-inscription "A Quest to Trillentol" "/home/vag/Documents/Games/FantasyGame/artworks/Fonts/missaali.otf" '(0 0 0 255) 54))
  (add-animation heading heading-texture 'only)
  (change-animation heading 'only)
  (<- (slot-value heading 'x) 150)
  (<- (slot-value heading 'y) 50)

  (<- menu-chooser (make <actor>))
  (<- (hash-table-ref (slot-value menu-chooser 'local-varibles) 'options) (make-circular! '(new-game load-game)))
  (bind-keydown-symbol->function! menu-chooser 'down (lambda (menue-chooser) 
									   (begin
									     (change-animation
									      (eval (car
										     (hash-table-ref
										      (slot-value menue-chooser 'local-varibles)
										      'options
										      )
									      ))
									      'not-selected
									     ) ; Change the current option to not selected,
									     
									     (<-
									      (hash-table-ref (slot-value menu-chooser 'local-varibles) 'options)
									      (cdr (hash-table-ref
										    (slot-value menu-chooser 'local-varibles)
										    'options
										   )
									      )
									     ) ; Move the list foward.

									     (change-animation
									      (eval (car
										     (hash-table-ref
										      (slot-value menue-chooser 'local-varibles)
										      'options
										      )
									      ))
									      'selected
									      ) ; Change the new option to selected.

									   )
									   )
				  ) ; We want the red option to be moveable down cyclicly

  (bind-keydown-symbol->function! menu-chooser 'up (lambda (menue-chooser) 
									   (begin
									     (change-animation
									      (eval (car
										     (hash-table-ref
										      (slot-value menue-chooser 'local-varibles)
										      'options
										      )
									      ))
									      'not-selected
									     ) ; Change the current option to not selected,
									     
									     (<-
									      (hash-table-ref (slot-value menu-chooser 'local-varibles) 'options)
									      (go-back (hash-table-ref
										    (slot-value menu-chooser 'local-varibles)
										    'options
										   )
									      )
									     ) ; Move the list foward.

									     (change-animation
									      (eval (car
										     (hash-table-ref
										      (slot-value menue-chooser 'local-varibles)
										      'options
										      )
									      ))
									      'selected
									      ) ; Change the new option to selected.

									   )
									   )
				  ) ; We want the red option to be moveable up cyclicly
  
  (<- new-game (make <actor>))
  (<- new-game-selected-texture (load-inscription "New Game" "/home/vag/Documents/Games/FantasyGame/artworks/Fonts/missaali.otf" '(255 0 0 255) 48))
  (<- new-game-not-selected-texture (load-inscription "New Game" "/home/vag/Documents/Games/FantasyGame/artworks/Fonts/missaali.otf" '(0 0 0 255) 48))
  (add-animation new-game new-game-selected-texture 'selected)
  (add-animation new-game new-game-not-selected-texture 'not-selected)
  (change-animation new-game 'selected)
  (<- (slot-value new-game 'x) 150)
  (<- (slot-value new-game 'y) 120)
  
  (<- load-game (make <actor>))
  (<- load-game-selected-texture (load-inscription "Load Game" "/home/vag/Documents/Games/FantasyGame/artworks/Fonts/missaali.otf" '(255 0 0 255) 48))
  (<- load-game-not-selected-texture (load-inscription "Load Game" "/home/vag/Documents/Games/FantasyGame/artworks/Fonts/missaali.otf" '(0 0 0 255) 48))
  (add-animation load-game load-game-selected-texture 'selected)
  (add-animation load-game load-game-not-selected-texture 'not-selected)
  (change-animation load-game 'not-selected)
  (<- (slot-value load-game 'x) 150)
  (<- (slot-value load-game 'y) 170)
  
  `(,background ,heading ,menu-chooser ,new-game, load-game)
)
