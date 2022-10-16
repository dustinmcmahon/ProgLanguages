#lang racket
(require racket/trace)

;;GIVEN CODE BELOW HERE
( define ( ranks rank )
   ( list
     ( list rank 'C )
     ( list rank 'D )
     ( list rank 'H )
     ( list rank 'S )
   )
)

( define ( deck )
   ( append
     ( ranks 2 )
     ( ranks 3 )
     ( ranks 4 )
     ( ranks 5 )
     ( ranks 6 )
     ( ranks 7 )
     ( ranks 8 )
     ( ranks 9 )
     ( ranks 'X )
     ( ranks 'J )
     ( ranks 'Q )
     ( ranks 'K )
     ( ranks 'A )
   )
)

( define ( pick-a-card )
   ( define cards ( deck ) )
   ( list-ref cards ( random ( length cards ) ) )
)

( define ( show card )
   ( display ( rank card ) )
   ( display ( suit card ) )
)

( define ( rank card )
   ( car card )
)

( define ( suit card )
   ( cadr card )
)

( define ( red? card )
   ( or
     ( equal? ( suit card ) 'H )
     ( equal? ( suit card ) 'D )
   )
)

( define ( black? card )
   ( not ( red? card ) )
)

( define ( aces? card1 card2 )
   ( and
     ( equal? ( rank card1 ) 'A )
     ( equal? ( rank card2 ) 'A )
   )
)
;;GIVEN CODE ABOVE HERE

; Pick 2 different cards ( a hand )
( define ( pick-two-cards )
   ( define c1 ( pick-a-card ) )
   ( define c2 ( pick-a-card ) )
   ( cond
      ( ( and ( equal? ( rank c1 ) ( rank c2 ) ) ( equal? ( suit c1 ) ( suit c2 ) ) ) ( pick-two-cards ) )
      ( else ( list c1 c2 ) )
   )
)
;( trace pick-two-cards )

; HELPER-FUNCTION
; numeric value for card
( define ( card-value card )
   ( define the-rank ( rank card ) )
   ( cond
      ( ( equal? the-rank 'X ) 10 )
      ( ( equal? the-rank 'J ) 11 )
      ( ( equal? the-rank 'Q ) 12 )
      ( ( equal? the-rank 'K ) 13 )
      ( ( equal? the-rank 'A ) 14 )
      ( else ( + the-rank 0 ) )
   )
)
;( trace card-value )

; Higher rank of two cards
( define ( higher-rank card1 card2 )
   ( define val1 ( card-value card1 ) )
   ( define val2 ( card-value card2 ) )
   ( cond
      ( ( > val1 val2 ) ( rank card1 ) )
      ( else ( rank card2 ) )
   )
)
( trace higher-rank )

;; HELPER FUNCTIONS FOR CLASSIFY
; is pair takes two cards
( define ( pair? card1 card2 )
   ( equal? ( rank card1 ) ( rank card2 ) )
)
;( trace pair? )

; is straight
; card rankings 1 appart
( define ( straight? card1 card2 )
   ( or
     ( = ( + 1 ( card-value card1 ) ) ( card-value card2 ) ) 
     ( = ( - ( card-value card1 ) 1 ) ( card-value card2 ) ) )
)
;( trace straight? )

; is flush
( define ( flush? card1 card2 )
   ( equal? ( suit card1 ) ( suit card2 ) )
)
;( trace flush? )

; Type of hand
; *assumes* hand like '((card1) (card2))
( define ( classify-two-cards-ur hand )
   ( define card1 ( car hand  ) )
   ( define card2 ( car ( cdr hand  ) ) )
   ( display hand )( display ":  " )
   ( cond
      ( ( pair? card1 card2 ) ( display "Pair of " ) ( display ( rank card1 ) ) ( display "s" ) )
      ( else
        ( display ( higher-rank card1 card2 ) ) ( display " high" )
        ( cond ( ( straight? card1 card2 ) ( display " straight" ) ) )
        ( cond ( ( flush? card1 card2 ) ( display " flush" ) ) )
      )
   )
)
;( trace classify-two-cards-ur )