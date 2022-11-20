% -------------------------------------------------------
% -------------------------------------------------------
% --- File: list_processors.pro
% --- Purpose: Process Lists with Prolog
% -------------------------------------------------------

% --- first ---
% --- takes 2 param(list, elem)
first([H|_],H).

% --- rest ---
% --- takes 2 param(list, tail)
rest([_|T],T).

% --- last ---
% --- takes 2 param(list, elem), returns last element in list
last([H|[]],H).
last([_|T],Result) :- last(T,Result).

% --- nth ---
% --- 3 param(index, list, elem), makes elem the index element in the list
nth(0,[H|_],H).
nth(N,[_|T],E) :- K is N - 1, nth(K,T,E).

% --- writelist ---
% --- 1 param(list), prints elements of list on new lines
writelist([]).
writelist([H|T]) :- write(H), nl, writelist(T).

% --- sum ---
% --- 2 param(list,total), sets total as the sum of all numbers in list
sum([],0).
sum([H|T],Sum) :-
    sum(T, SumOfTail),
    Sum is H + SumOfTail.

% --- add_first ---
% --- 3 param(element,list,result) :: result = element + list
add_first(X,L,[X|L]).

% --- add_last ---
% --- 3 param(element,list,result) :: result = list + element
add_last(X,[],[X]).
add_last(X,[H|T],[H|TX]) :- add_last(X,T,TX).

% --- iota ---
% --- 2 param(Num,List) :: list = [1..Num]
iota(0,[]).
iota(N,IotaN) :-
    K is N - 1,
    iota(K, IotaK),
    add_last(N,IotaK,IotaN).

% --- pick ---
% --- 2 param(list,item) :: item = random item in list
pick(L,Item) :-
    length(L,Length),
    random(0,Length,RN),
    nth(RN,L,Item).

% --- make_set ---
% --- 2 param(in-list, out-list) :: out-list = unique elements of in-list
make_set([],[]).
make_set([H|T],TS) :-
    member(H,T),
    make_set(T,TS).
make_set([H|T],[H|TS]) :-
    make_set(T,TS).

% --- product ---
% --- 2 params(list(nums),result) :: result = product of all nums in list
product([],1).
product([H|T],Total) :- product(T,Total2), Total is Total2 * H.

% --- factorial ---
% --- 2 param(+Num,Result) :: Result = Num!
factorial(1,1).
factorial(N,Result) :-
    K is N - 1,
    factorial(K,ResultK),
    Result is ResultK * N.

% --- make-list ---
% --- 3 params(count,item,result) :: result = list(item) where length = count
make_list(0,_,[]).
make_list(N,Elem,Result) :- 
    K is N - 1,
    make_list(K,Elem,ResultK),
    add_first(Elem,ResultK,Result).

% --- but_first ---
% --- 2 params(list,result) :: result = tail of list
but_first([_|T],T).

% --- but_last ---
% --- 2 params(list,result) :: result = list - last item
but_last([_|[]],[]).
but_last([H|T],Result) :-
    but_last(T,ResultT),
    add_first(H,ResultT,Result).

% --- is_palindrome ---
% --- 1 param(list) :: true if list reads the same forward as backward, false otherwise
is_palindrome([]) :- true.
is_palindrome([_|[]]) :- true.
is_palindrome([H|T]) :-
    last(T,TT),
    same_term(H, TT),
    but_last(T,Next),
    is_palindrome(Next).

% --- noun_phrase ---
% --- 1 param(list) :: list is a 3 word noun phrase
noun_phrase(Result) :- 
    pick([the],A),
    pick([hairy,slimey,sticky,quick,enormous,little],B),
    pick([teacher,customer,student,store,zoo,buffalo,pickle,elbow],C),
    add_first(C,[],L1),
    add_first(B,L1,L2),
    add_first(A,L2,Result).

% --- sentence ---
% --- 1 param(list) :: list is a noun phrase + verb + noun phrase
sentence(S) :-
    noun_phrase(A),
    pick([rode,beat,forgot,heard,lost,burned,struck],B),
    noun_phrase(L1),
    add_first(B,L1,L2),
    append(A,L2,S).