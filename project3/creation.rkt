#lang racket
( require 2htdp/image )
( define height 800 )
( define width 1000 )
( define black-background ( rectangle ( + 10 width ) ( + 10 height ) 'solid 'black ) )
;colors
( define star-color-1 ( color ( random 50 ) ( random 50 ) ( random 50 ) ) )
( define star-color-2 ( color ( random 50 ) ( random 50 ) ( random 50 ) ) )
( define star-color-3 ( color ( random 50 ) ( random 50 ) ( random 50 ) ) )
( define star-color-4 ( color ( random 50 ) ( random 50 ) ( random 50 ) ) )
( define star-color-5 ( color ( random 50 ) ( random 50 ) ( random 50 ) ) )
( define ( get-star-color x)
   ( cond
      ( ( = x 0 ) star-color-1 )
      ( ( = x 1 ) star-color-2 )
      ( ( = x 2 ) star-color-3 )
      ( ( = x 3 ) star-color-4 )
      ( ( = x 4 ) star-color-5 )
   )
)

;sizes
( define star-size-1 ( + 1 ( random 15 ) ) )
( define star-size-2 ( + 1 ( random 15 ) ) )
( define star-size-3 ( + 1 ( random 15 ) ) )
( define star-size-4 ( + 1 ( random 15 ) ) )
( define star-size-5 ( + 1 ( random 15 ) ) )
( define ( get-star-size x)
   ( cond
      ( ( = x 0 ) star-size-1 )
      ( ( = x 1 ) star-size-2 )
      ( ( = x 2 ) star-size-3 )
      ( ( = x 3 ) star-size-4 )
      ( ( = x 4 ) star-size-5 )
   )
)


( define ( star )
   ;( circle ( random 15 ) 'solid ( color ( random 50 ) ( random 50 ) ( random 50 ) ) )
   ( define star-color ( get-star-color ( random 5 ) ) )
   ( define star-size ( get-star-size ( random 5 ) ) )
   ( overlay ( ellipse star-size ( / star-size 5 ) 'solid star-color )
             ( ellipse ( / star-size 2 ) ( / star-size 4 ) 'solid star-color )
             ( ellipse ( / star-size 3 ) ( / star-size 3 ) 'solid star-color )
             ( ellipse ( / star-size 4 ) ( / star-size 2 ) 'solid star-color )
             ( ellipse ( / star-size 5 ) star-size 'solid star-color ) )
)

( define ( place-star i total)
   ( cond
      ( ( = i total ) black-background )
      ( else
        ( define loc ( random 4 ) )
        ( cond
           ( ( = loc 0 ) ( overlay/offset ( star ) ( random ( / width 2 ) ) ( random ( / height 2 ) ) ( place-star ( + 1 i ) total ) ) )
           ( ( = loc 1 ) ( overlay/offset ( star ) ( * -1 ( random ( / width 2 ) ) ) ( random ( / height 2 ) ) ( place-star ( + 1 i ) total ) ) )
           ( ( = loc 2 ) ( overlay/offset ( star ) ( random ( / width 2 ) ) ( * -1 ( random ( / height 2 ) ) ) ( place-star ( + 1 i ) total ) ) )
           ( ( = loc 3 ) ( overlay/offset ( star ) ( * -1 ( random ( / width 2 ) ) ) ( * -1 ( random ( / height 2 ) ) ) ( place-star ( + 1 i ) total ) ) )
        )
      )
   )
)

( define ( my-image ) ( place-star 0 ( * ( random 1000 ) 10 ) ) )