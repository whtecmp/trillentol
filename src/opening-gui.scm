
(load "/home/vag/Documents/Games/FantasyGame/src/actors/actor-factories.scm")


(define (create-opening-gui! renderer)
  (map (lambda (factory) (factory)) (get-actor-factories))  
)
