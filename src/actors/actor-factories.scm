
(load "/home/vag/Documents/Games/FantasyGame/src/actors/background.scm")
(load "/home/vag/Documents/Games/FantasyGame/src/actors/heading.scm")
(load "/home/vag/Documents/Games/FantasyGame/src/actors/menu-chooser.scm")
(load "/home/vag/Documents/Games/FantasyGame/src/actors/new-game.scm")
(load "/home/vag/Documents/Games/FantasyGame/src/actors/load-game.scm")


(define (get-actor-factories)
  `(,create-background! ,create-heading! ,create-menu-chooser! ,create-new-game! ,create-load-game!)
  )
