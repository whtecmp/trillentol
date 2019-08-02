


(define (get-actor-factories)
  (<- new-game create-new-game!)
  (<- load-game create-load-game!)
  (<- exit-game create-exit-game!) 
  (create-menu! opening-menu 'down 'up 'a '("New Game" ) '() '())
  `(,create-background! ,create-heading!)
  )
