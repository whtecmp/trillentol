


(define (create-background!)
  (<- background (make <actor>))
  (<- background-texture (load-animation '("/home/vag/Documents/Games/FantasyGame/artworks/UI/background.png") renderer 1 800 600))
  (add-animation background background-texture 'only)
  (change-animation background 'only)
  background
)
