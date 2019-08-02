
(load "/home/vag/Documents/Games/FantasyGame/src/actors/background.scm")
(load "/home/vag/Documents/Games/FantasyGame/src/actors/heading.scm")
(load "/home/vag/Documents/Games/FantasyGame/src/actors/menu-chooser.scm")
(load "/home/vag/Documents/Games/FantasyGame/src/actors/new-game.scm")
(load "/home/vag/Documents/Games/FantasyGame/src/actors/load-game.scm")
(load "/home/vag/Documents/Games/FantasyGame/src/actors/exit-game.scm")


(define (get-actor-factories)
  (<- new-game create-new-game!)
  (<- load-game create-load-game!)
  (<- exit-game create-exit-game!)
  `(,create-background! ,create-heading! ,new-game ,load-game ,exit-game ,(lambda () (create-menu-chooser! 'down 'up 'a `(,new-game ,load-game ,exit-game))))
  )
