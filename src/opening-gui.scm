


(define (create-opening-gui! renderer)
  (map (lambda (factory) (factory)) (get-actor-factories))  
)
