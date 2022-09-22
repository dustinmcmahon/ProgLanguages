#lang racket
( require 2htdp/image )

;create a random color 'object'
( define ( random-color ) ( color ( rgb-value ) ( rgb-value ) ( rgb-value ) ) )

;create a random number in the rgb value range
( define ( rgb-value ) ( random 256 ) )

;house function
;
;create a house 3 stories high with a roof(equalateral triangle grey)
;takes 5 param
;width,height/floor,floor-1-color,floor-2-color,floor-3-color
( define ( house width floor-height floor-1-color floor-2-color floor-3-color )
   ( above ( triangle width 'solid 'grey )
           ( rectangle width floor-height 'solid floor-3-color )
           ( rectangle width floor-height 'solid floor-2-color )
           ( rectangle width floor-height 'solid floor-1-color ) ) )

;track function
;
;creates 6 houses side by side, with the 6 different ways you can put 3 colors in order(permutation)
;takes 2 param
;width of the entire tract, height or 3 floors
( define ( tract width height )
   ( define floor-height ( / height 3 ) )
   ( define house-width ( / width 11 ) )
   ( define color-1 ( random-color ) )
   ( define color-2 ( random-color ) )
   ( define color-3 ( random-color ) )
   ( beside
     ( house house-width floor-height color-1 color-2 color-3 )
     ( rectangle 10 floor-height 'solid 'white )
     ( house house-width floor-height color-1 color-3 color-2 )
     ( rectangle 10 floor-height 'solid 'white )
     ( house house-width floor-height color-2 color-1 color-3 )
     ( rectangle 10 floor-height 'solid 'white )
     ( house house-width floor-height color-2 color-3 color-1 )
     ( rectangle 10 floor-height 'solid 'white )
     ( house house-width floor-height color-3 color-1 color-2 )
     ( rectangle 10 floor-height 'solid 'white )
     ( house house-width floor-height color-3 color-2 color-1 )
   )
)