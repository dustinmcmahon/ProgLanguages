#lang racket

(require 2htdp/image)

( define ( color-thing )
   ( display "(?): " )
   ( define cmd-list ( read ) )
   ( define the-cmd ( car cmd-list ))
   ( define params ( car ( cdr cmd-list ) ) )
   ( cond
      ( ( equal? the-cmd 'random )
        ( draw-random params )
      )
      ( ( equal? the-cmd 'all )
        ( draw-all params )
      )
      ( else
        ( draw-line ( list-ref params ( - the-cmd 1 ) ) )
      )
   )
   ( color-thing )
)

;; Draw a line for each color in the list (recursive)
( define ( draw-all color-list )
   ( cond
      ( ( empty? ( cdr color-list ) ) ( draw-line ( car color-list ) ) )
      ( else
        ( draw-line ( car color-list ) )
        ( draw-all ( cdr color-list ) )
      )
   )
)

;; Draw a line of a random color
( define ( draw-random color-list )
   ( draw-line ( list-ref color-list ( random ( length color-list ) ) ) )
)

;; Draw a line of a given color (BASE FUNCTION)
( define ( draw-line line-color )
   ( display ( rectangle 1000 20 'solid line-color ) ) ( display "\n" )
)

;; test call
;( random ( olivedrab dodgerblue indigo cyan teal firebrick ) )
;( all ( olivedrab dodgerblue indigo cyan teal firebrick ) )
;( 2 ( olivedrab dodgerblue indigo cyan teal firebrick ) )
;( 3 ( olivedrab dodgerblue indigo cyan teal firebrick ) )
;( 5 ( olivedrab dodgerblue indigo cyan teal firebrick ) )