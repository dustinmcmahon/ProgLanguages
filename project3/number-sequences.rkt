#lang racket

( define ( square n )
   ( * n n )
)

( define ( cube n )
   ( * n n n )
)

( define ( sequence name n )
   ( cond
      ( ( = n 1 )
        ( display ( name 1 ) ) ( display " " )
      )
      ( else
        ( sequence name ( - n 1 ) )
        ( display ( name n ) ) ( display " " )
      )
   )
)

( define ( triangular n )
   ( cond
      ( ( = n 1 ) 1 )
      ( else ( + ( triangular ( - n 1 ) ) n ) )
   )
)

( define ( sum-factor n y )
   ( cond
      ( ( = n y ) n )
      ( ( = ( modulo n y ) 0 ) ( + ( sum-factor n ( + y 1 ) ) y ) )
      ( else ( sum-factor n ( + y 1 ) ) )
   )
)

( define ( sigma n )
   ( cond
      ( ( < n 1 ) ( display "Error: non negative only" ) )
      ( else ( sum-factor n 1 ) )
   )
)