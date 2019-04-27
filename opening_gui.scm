
(load "/home/vag/Documents/Games/FantasyGame/actor.scm")
(load "/home/vag/Documents/Games/FantasyGame/actor.scm")


(define (create-opening-gui renderer)
  (<- background (make <actor>))
  (<- background-texture (load-animation '("/home/vag/Documents/Games/FantasyGame/data/UI/background.png") renderer 1 800 600))
  (add-animation background background-texture 'only)
  (change-animation background 'only)
  background
)
