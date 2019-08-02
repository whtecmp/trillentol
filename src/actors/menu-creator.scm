

(define-syntax create-menu! (ir-macro-transformer (lambda expr inject compare)
						  (let [
							(menu-name (cadr expr))
							(forward-key (caddr expr))
							(backward-key (cadddr expr))
							(choose-key (nth 5 expr))
							(options (cdr (cddddr expr)))
							]
							(create-menu-chooser! menu-name forward-key backward-key choose-key

							    (map (lambda (vars)
								   (let [
										 (text (car vars))
										 (x (cadr vars))
										 (y (caddr vars))
										 (action-when-chosen (cadddr vars))
									 ]
									 (begin
								       (<- name (make <actor>))
								       (<- selected-texture (load-inscription text "/home/vag/Documents/Games/FantasyGame/artworks/Fonts/missaali.otf" '(255 0 0 255) 48))
								       (<- not-selected-texture (load-inscription text "/home/vag/Documents/Games/FantasyGame/artworks/Fonts/missaali.otf" '(0 0 0 255) 48))
								       (add-animation name selected-texture 'selected)
								       (add-animation name not-selected-texture 'not-selected)
								       (change-animation name 'not-selected)
											 (<- (hash-table-ref (slot-value name 'local-varibles) 'action-when-chosen) action-when-chosen)
											 (<- (slot-value new-game 'x) x)
											 (<- (slot-value new-game 'y) y)
											 name
											 )
								     )
								   )
								 options
								 )
							)
				)
		)
)
