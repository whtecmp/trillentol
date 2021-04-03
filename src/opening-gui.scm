

(define (create-opening-gui! renderer)
  (create-menu! opening-menu 'down 'up 'a
				'("New Game" 150 120 (lambda () #f))
				'("Load Game" 150 170 (lambda () #f))
				'("Exit Game" 150 220 (lambda () #f))
				)
  (create-actor! opening-menu)
  `(,(create-background!) ,(create-heading!))
)
