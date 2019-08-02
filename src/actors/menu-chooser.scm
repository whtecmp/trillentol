



(define (create-menu-chooser! forward-key backward-key choose-key options)
  (set! menu-chooser (make <actor>))
  (<- (hash-table-ref (slot-value menu-chooser 'local-varibles) 'options) (make-circular! options))
  (define (get-current-option) (car
				      (hash-table-ref
				       (slot-value menu-chooser 'local-varibles)
				       'options
				       )
				      )
    )
  (bind-keydown-symbol->function! menu-chooser forward-key (lambda (menu-chooser) 
									   (begin
									     (change-animation
									      (get-current-option)
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
									      (get-current-option)
									      'selected
									      ) ; Change the new option to selected.

									   )
									   )
				  ) ; We want the red option to be moveable down cyclicly

  (bind-keydown-symbol->function! menu-chooser backward-key (lambda (menu-chooser) 
									   (begin
									     (change-animation
									      (get-current-option)
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
									      (get-current-option)
									      'selected
									      ) ; Change the new option to selected.

									   )
									   )
				  ) ; We want the red option to be moveable up cyclicly
  (bind-keydown-symbol->function! menu-chooser choose-key (lambda (menu-chooser)
							    (begin
							      ((hash-table-ref (slot-value (get-current-option) 'local-varibles) 'action-when-chosen))
							      )
							    ))
  

  (define (when-destroying!)
    (destroy-actor! new-game)
    (destroy-actor! load-game)
    (destroy-actor! exit-game)
  )
  (<- (slot-value menu-chooser 'when-destroying) when-destroying!)
  
  menu-chooser
)
