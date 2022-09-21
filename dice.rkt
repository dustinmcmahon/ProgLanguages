#lang racket

;base functon for dice
( define ( roll-die )  ( + 1 ( random 6 ) ) )

;roll for 1
( define ( roll-for-1 )
   ( define roll ( roll-die ) )
   ( display roll )
   ( display " " )
   ( cond ( ( not ( = roll 1 ) ) ( roll-for-1 ) ) )
)

;roll for 11
( define ( roll-for-11 )
   ( roll-for-1 )
   ( define roll ( roll-die ) )
   ( display roll )
   ( display " " )
   ( cond ( ( not ( = roll 1 ) ) ( roll-for-11 ) ) )
)

;roll an even then odd
;helper function
( define ( roll-even-odd )
   ( define roll ( roll-die ) )
   ( display roll )
   ( display " " )
   ( cond
      ( ( odd? roll ) ( roll-even-odd ) )
      ( ( even? roll )
        ( define roll ( roll-die ) )
        ( display roll )
        ( display " " )
        ( cond
           ( ( even? roll ) ( roll-for-odd-even-odd ) )
        )
      )
   )
)

;roll for odd-even-odd
( define ( roll-for-odd-even-odd )
   ( define roll ( roll-die ) )
   ( display roll )
   ( display " " )
   ( cond
      ( ( even? roll ) ( roll-for-odd-even-odd ) )
      ( ( odd? roll) ( roll-even-odd ) )
   )
)

;display pair
;helper function for simple display
( define ( display-pair a b )
   ( display a )( display "-" )( display b ) ( display " " )
)

;roll 7-11-doubles
( define ( roll-two-dice-for-a-lucky-pair )
   ( define roll-1 ( roll-die ) )
   ( define roll-2 ( roll-die ) )
   ( define total ( + roll-1 roll-2 ) )
   ( display-pair roll-1 roll-2 )
   ( cond
      ( ( not ( eq? roll-1 roll-2 ) )
       ( cond
          ( ( not ( eq? total 7 ) )
            ( cond
               ( ( not ( eq? total 11 ) ) ( roll-two-dice-for-a-lucky-pair ) )
            )
          )
       )
      )
   )
)
