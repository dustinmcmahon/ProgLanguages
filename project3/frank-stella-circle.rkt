#lang racket
( require 2htdp/image )

;create a random color 'object'
( define ( random-color ) ( color ( rgb-value ) ( rgb-value ) ( rgb-value ) ) )

;create a random number in the rgb value range
( define ( rgb-value ) ( random 256 ) )

;draw the outlined circle
( define ( outlined-circle radius color )
   ( overlay ( circle radius 'outline 'black ) ( circle radius 'solid color ) )
)

;recursive paint function for circle (monotone)
( define ( paint-nested-circle-one from to unit color )
   ( define diameter ( * from unit ) )
   ( define radius ( / diameter 2 ) )
   ( cond
      ( ( = from to ) ( outlined-circle radius color ) )
      ( else
        ( overlay ( outlined-circle radius color ) ( paint-nested-circle-one ( + from 1 ) to unit color ) )
      )
   )
)

;create a monotoned circle image
( define ( nested-circle-one side count color )
   ( define unit ( / side count ) )
   ( paint-nested-circle-one 1 count unit color )
)

;recursive paint function for circle (random)
( define ( paint-nested-circle-random from to unit )
   ( define diameter ( * from unit ) )
   ( define radius ( / diameter 2 ) )
   ( cond
      ( ( = from to ) ( outlined-circle radius ( random-color ) ) )
      ( else
        ( overlay
          ( outlined-circle radius ( random-color ) )
          ( paint-nested-circle-random ( + from 1 ) to unit ) )
      )
   )
)

;create a random circle image
( define ( nested-circle-random side count )
   ( define unit ( / side count ) )
   ( paint-nested-circle-random 1 count unit )
)