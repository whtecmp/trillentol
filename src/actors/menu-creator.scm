
(define-syntax create-menu! (ir-macro-transformer (lambda expr inject compare)
						  (let [(menu-name (cadr expr))]
						    (map create-actor!
							 (map )
							 )
						    )
						  ))
