


(define (get-actor-factories)
  (<- new-game create-new-game!)
  (<- load-game create-load-game!)
  (<- exit-game create-exit-game!)
  `(,create-background! ,create-heading! ,new-game ,load-game ,exit-game ,(lambda () (create-menu-chooser! 'down 'up 'a `(,new-game ,load-game ,exit-game))))
  )
