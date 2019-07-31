

(load "/home/vag/Documents/Games/FantasyGame/src/graphics-management/actor.scm")
(load "/home/vag/Documents/Games/FantasyGame/src/graphics-management/animation.scm")
(load "/home/vag/Documents/Games/FantasyGame/src/graphics-management/inscription.scm")
(load "/home/vag/Documents/Games/FantasyGame/src/graphics-management/utils.scm")
(load "/home/vag/Documents/Games/FantasyGame/src/graphics-management/xtexture.scm")


(define (create-menu-chooser!)
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
  menu-chooser
)
