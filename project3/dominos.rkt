#lang racket

;----------------------------------------------------------
;----------------   GIVEN CODE   ---------csc344 fall22----
;----------------------------------------------------------
( require 2htdp/image )

;----------------------------------------------------------
;----------------   VARIABLES   ---------------------------

;tile size variables
( define side-of-tile 100 )
( define diameter-of-pip ( * side-of-tile 0.2 ) )
( define radius-of-pip ( / diameter-of-pip 2 ) )
;offsets
( define d ( * diameter-of-pip 1.4 ) )
( define nd ( * -1 d ) )

;----------------------------------------------------------
;blank tile and a pip builder
( define blank-tile ( square side-of-tile 'solid 'black ) )
( define ( pip ) ( circle radius-of-pip 'solid 'white ) )

;----------------------------------------------------------
;---------------  TILE CODE  ------------------------------
;----------------------------------------------------------

;tile 1 ( tile with a single pip )
( define basic-tile1 ( overlay ( pip ) blank-tile ) )

;tile 2 ( tile with 2 pips )
( define basic-tile2
   ( overlay/offset ( pip ) d d
     ( overlay/offset ( pip ) nd nd blank-tile ) )
)

;tile 3 ( tile with 3 pips )
( define basic-tile3 ( overlay ( pip ) basic-tile2 ) )

;tile 4 ( tile with 4 pips )
( define basic-tile4 ( overlay/offset ( pip ) nd d ( overlay/offset ( pip ) d nd basic-tile2 ) ) )

;tile 5 ( tile with 5 pips )
( define basic-tile5 ( overlay ( pip ) basic-tile4 ) )

;tile 6 ( tile with 6 pips )
( define basic-tile6 ( overlay/offset ( pip ) 0 nd ( overlay/offset ( pip ) 0 d basic-tile4 ) ) )

;----------------------------------------------------------
;tile frames
( define frame ( square side-of-tile 'outline 'grey ) )

( define tile0 ( overlay frame blank-tile ) )
( define tile1 ( overlay frame basic-tile1 ) )
( define tile2 ( overlay frame basic-tile2 ) )
( define tile3 ( overlay frame basic-tile3 ) )
( define tile4 ( overlay frame basic-tile4 ) )
( define tile5 ( overlay frame basic-tile5 ) )
( define tile6 ( overlay frame basic-tile6 ) )

;----------------------------------------------------------
;---------------  DOMINO GENERATOR  -----------------------
;----------------------------------------------------------

( define ( domino a b ) ( beside ( tile a ) ( tile b ) ) )
( define ( tile x )
   ( cond
      ( ( = x 0 ) tile0 )
      ( ( = x 1 ) tile1 )
      ( ( = x 2 ) tile2 )
      ( ( = x 3 ) tile3 )
      ( ( = x 4 ) tile4 )
      ( ( = x 5 ) tile5 )
      ( ( = x 6 ) tile6 )
   )
)