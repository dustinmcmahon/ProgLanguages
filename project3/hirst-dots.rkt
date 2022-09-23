#lang racket

( require 2htdp/image )

;create a random color 'object'
( define ( random-color ) ( color ( rgb-value ) ( rgb-value ) ( rgb-value ) ) )

;create a random number in the rgb value range
( define ( rgb-value ) ( random 256 ) )

;single hirst dot, of random color
( define ( hirst-dot )
   ( beside ( circle 15 'solid ( random-color ) ) ( square 20 'solid 'white ) )
)

;row of dots
( define ( hirst-row n )
   ( cond
      ( ( = n 1 ) ( hirst-dot ) )
      ( else
        ( beside ( hirst-dot ) ( hirst-row ( - n 1 ) ) )
      )
   )
)

;rectangle of hirst dots
( define ( hirst-rectangle row column )
   ( cond
      ( ( = row 1 ) ( hirst-row column ) )
      ( else ( above
               ( hirst-row column )
               ( square 20 'solid 'white )
               ( hirst-rectangle ( - row 1 ) column ) ) )
   )
)

;box of dots
( define ( hirst-dots n )
   ( cond
      ( ( > n 0 ) ( hirst-rectangle n n ) )
   )
)