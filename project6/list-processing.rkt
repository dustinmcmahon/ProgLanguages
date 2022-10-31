#lang racket
( require 2htdp/image )
( require racket/trace )
( define ( generate-uniform-list count item )
   ( cond
      ( ( = count 0 ) '() )
      ( else
        ( append ( list item ) ( generate-uniform-list ( - count 1 ) item ) )
      )
   )
)

( define ( a-list list-1 list-2 )
   ( cond
      ( ( = ( length list-1 ) 0 ) null )
      ( else
        ( cons ( cons ( car list-1 ) ( car list-2 ) ) ( a-list ( cdr list-1 ) ( cdr list-2 ) ) )
      )
   )
)

; i is an item in the list
; l is the list object
( define ( assoc i l )
   ( cond
      ( ( = ( length l ) 0 ) null )
      ( ( eq? ( car ( car l ) ) i ) ( car l ) )
      ( else
        ( assoc i ( cdr l ) )
      )
   )
)

; i is an item in the list
; l is the list object
( define ( rassoc i l )
   ( cond
      ( ( = ( length l ) 0 ) null )
      ( ( equal? ( cdr ( car l ) ) i ) ( car l ) )
      ( else
        ( rassoc i ( cdr l ) )
      )
   )
)

; l is the list object
( define ( los->s l )
   ( cond
      ( ( eq? ( length l ) 0 ) "" )
      ( ( eq? ( length l ) 1 ) ( car l ) )
      ( else
        ( string-append ( car l ) " " ( los->s ( cdr l ) ) )
      )
   )
)

( define ( generate-list i list-func )
   ( cond
      ( ( eq? i 0 ) '() )
      ( else
        ( append ( list ( list-func ) ) ( generate-list ( - i 1 ) list-func ) )
      )
   )
)

; GIVEN CODE \/
( define ( roll-die ) ( + ( random 6 ) 1 ) )
( define ( dot )
   ( circle ( + 10 ( random 41 ) ) "solid" ( random-color ) )
)
( define ( big-dot )
   ( circle ( + 10 ( random 141 ) ) "solid" ( random-color ) )
)
( define ( random-color )
   ( color ( rgb-value ) ( rgb-value ) ( rgb-value ) )
)
( define ( rgb-value )
   ( random 256 )
)
( define ( sort-dots loc )
   ( sort loc #:key image-width < )
)
; GIVEN CODE /\

; HELPER FUNCTIONS
; uses given random-color
( define ( diamond )
   ( define side ( + 20 ( random 380 ) ) )
   ( define color ( random-color ) )
   ( rotate 45 ( square side 'solid color ) )
)
( define ( sort-diamond loc )
   ( sort loc #:key image-width < )
)

; uses generate-list /\ (ln.57)
( define ( diamond-design i )
   ( foldr overlay empty-image ( sort-diamond ( generate-list i diamond ) ) )
)

; GIVEN CODE \/
( define pitch-classes '( c d e f g a b ) )
( define color-names '( blue green brown purple red yellow orange ) )
( define ( box color )
   ( overlay
     ( square 30 "solid" color )
     ( square 35 "solid" "black" )
   )
)
( define boxes
   ( list
     ( box "blue" )
     ( box "green" )
     ( box "brown" )
     ( box "purple" )
     ( box "red" )
     ( box "gold" )
     ( box "orange" )
)
)
( define pc-a-list ( a-list pitch-classes color-names ) )
( define cb-a-list ( a-list color-names boxes ) )
( define ( pc->color pc )
   ( cdr ( assoc pc pc-a-list ) )
)
( define ( color->box color )
   ( cdr ( assoc color cb-a-list ) )
)
; GIVEN CODE /\

( define ( play pitch-lst )
   ( define color-lst ( map pc->color pitch-lst ) )
   ( define box-lst ( map color->box color-lst ) )
   ( foldr beside empty-image box-lst )
)
;test cases:
; ( play '( c d e f g a b c c c b g f e d c ) )
; ( play '( c c g g a a g g f f e e d d c c ) )
; ( play '( c d e c c d e c e f g g e f g g ) )
;( trace play )


; MENU CODE \/
( define menu '((fish . 8.5)
                (steak . 12.75)
                (burger . 5.48)
                (fries . 1)
                (salad . 1)
                (soup . 2.5)) )
( define sales '( burger fries salad burger salad fish soup fries burger soup steak fries
                         burger salad steak soup salad steak salad fish soup burger salad fish
                         salad fish soup burger fries steak salad fish fries steak salad steak
                         fries fish fries fish fries fries steak soup fish fries salad ) )
; MENU CODE /\

( define ( price item )
  ( cdar ( filter ( lambda ( menu-item ) ( equal? ( car menu-item ) item ) ) menu ) )
)
;( trace price )

( define ( total sold-items item )
   ( foldr + 0 ( map ( lambda ( sold-item )
                        ( cond
                           ( ( equal? sold-item item ) ( price sold-item ) )
                           ( else 0 )) )
                     sold-items ) )
)
;( trace total )
; TEST CASES
;; ( total sales 'hamburger )

( define AI (text "A" 36 "orange") )
( define BI (text "B" 36 "red") )
( define CI (text "C" 36 "blue") )
( define DI (text "D" 36 "Crimson") )
( define EI (text "E" 36 "Maroon") )
( define FI (text "F" 36 "Pink") )
( define GI (text "G" 36 "Orchid") )
( define HI (text "H" 36 "Brown") )
( define II (text "I" 36 "Coral") )
( define JI (text "J" 36 "Orange") )
( define KI (text "K" 36 "Goldenrod") )
( define LI (text "L" 36 "Olive") )
( define MI (text "M" 36 "Lime") )
( define NI (text "N" 36 "Cyan") )
( define OI (text "O" 36 "Teal") )
( define PI (text "P" 36 "Navy") )
( define QI (text "Q" 36 "Indigo") )
( define RI (text "R" 36 "Purple") )
( define SI (text "S" 36 "Magenta") )
( define TI (text "T" 36 "Black") )
( define UI (text "U" 36 "Turquoise") )
( define VI (text "V" 36 "Wheat") )
( define WI (text "W" 36 "Salmon") )
( define XI (text "X" 36 "Orange Red") )
( define YI (text "Y" 36 "Aquamarine") )
( define ZI (text "Z" 36 "CornflowerBlue") )

( define alphabet '(A B C D E F G H I J K L M N O P Q R S T U V W X Y Z) )
( define alphapic ( list AI BI CI DI EI FI GI HI II JI KI LI MI
                         NI OI PI QI RI SI TI UI VI WI XI YI ZI) )

( define a->i ( a-list alphabet alphapic ) )

( define ( letter->image letter )
   ( cdr ( assoc letter a->i ) )
)

( define ( gcs letter-list )
   ( foldr beside empty-image ( map letter->image letter-list ) )
)






























