

(define-syntax create-menu! (ir-macro-transformer (lambda (expr inject compare)
						  (let [
							(menu-name (cadr expr))
							(forward-key (caddr expr))
							(backward-key (cadddr expr))
							(choose-key (nth 5 expr))
							(options (cdr (cddddr expr)))
							
							(name (gensym))
							(selected-texture (gensym))
							(not-selected-texture (gensym))
							]
						    `(begin
						    (define (create-option! vars) (set! vars (cadr vars))
								   (let [
										 (text (car vars))
										 (x (cadr vars))
										 (y (caddr vars))
										 (action-when-chosen (cadddr vars))
										 
									 ]
									 (begin
								       (<- ,name (make <actor>))
								       (<- ,selected-texture (load-inscription text "/home/vag/Documents/Games/FantasyGame/artworks/Fonts/missaali.otf" '(255 0 0 255) 48))
								       (<- ,not-selected-texture (load-inscription text "/home/vag/Documents/Games/FantasyGame/artworks/Fonts/missaali.otf" '(0 0 0 255) 48))
								       (add-animation ,name ,selected-texture 'selected)
								       (add-animation ,name ,not-selected-texture 'not-selected)
								       (change-animation ,name 'not-selected)
											 (<- (hash-table-ref (slot-value ,name 'local-varibles) 'action-when-chosen) action-when-chosen)
											 (<- (slot-value ,name 'x) x)
											 (<- (slot-value ,name 'y) y)
											 ,name
											 )
								     )
								   )
						    
						    
						    (<- ,menu-name
							 (create-menu-chooser!
							  ,forward-key ,backward-key ,choose-key
							  (map create-option! ',options)))
)))))
