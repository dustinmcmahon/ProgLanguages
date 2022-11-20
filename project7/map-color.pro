% --------------------------
% Map Coloring
% - Given a map, render the map in 4 different colors
% - must not have ajacent sections of the map, the same color

% --------------------------
% - different( X, Y ) :: X and Y are different, this pertains to the colors

different( red, yellow ).
different( red, green ).
different( red, blue ).
different( yellow, red ).
different( yellow, green ).
different( yellow, blue ).
different( green, red ).
different( green, yellow ).
different( green, blue ).
different( blue, red ).
different( blue, yellow ).
different( blue, green ).

coloring( A, B, C, D, E, F, G, H, I, J, K, L, M, N, O, P, Q) :- 
    different( A, B),
    different( A, C),
    different( A, D),
    different( A, E),
    different( B, E),
    different( B, F),
    different( B, G),
    different( B, C),
    different( C, H),
    different( C, I),
    different( C, D),
    different( D, J),
    different( D, K),
    different( D, E),
    different( E, M),
    different( E, L),
    different( F, M),
    different( F, N),
    different( F, G),
    different( G, O),
    different( G, H),
    different( H, O),
    different( H, I),
    different( I, P),
    different( I, J),
    different( J, P),
    different( J, K),
    different( K, Q),
    different( K, L),
    different( L, Q),
    different( L, M),
    different( M, N),
    different( N, Q),
    different( N, O),
    different( O, P),
    different( P, Q).