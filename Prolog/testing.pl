%remove_element(+LIST,+ELEMENT,-NEWLIST).
remove_element([] , _ , []).
remove_element([E|T] , E , R) :- remove_element(T, E ,R),!.
remove_element([H|T] , E , [H|R]) :- H \= E ,
remove_element(T, E ,R).

%remove_pattern(+LIST,+PATTERN,-NEWLIST).
remove_pattern([], _ ,[]).
remove_pattern(L, [] , L).
remove_pattern(L, [CAR|CDR] , R) :- remove_element(L,CAR,P) ,
remove_pattern(P,CDR,R),!.

%contains(+LIST,+ELEMENT).
contains([E|_],E) :- !.
contains([H|T],E) :- H \= E , contains(T,E),!.

%dosentcontain(+LIST,+ELEMENT).
dosentcontain([],_) :- !.
dosentcontain([H|T],E) :- H \= E , dosentcontain(T,E),!.

%keep_pattern(+LIST,+PATTERN,-NEWLIST).
keep_pattern([],_,[]).
keep_pattern(_,[],[]).
keep_pattern([H|T], PATTERN , [H|R]) :- contains(PATTERN,H) ,
keep_pattern(T, PATTERN , R).
keep_pattern([H|T], PATTERN , R) :- dosentcontain(PATTERN,H) ,
keep_pattern(T, PATTERN , R).

%symmetric(+LIST).
symmetric(L) :- symmetric(L,L,_).

%symmetric(+LIST1,+LIST2,-REMAINDER).
symmetric(L,[],L) :- !.
symmetric([_|T], [_] ,T) :- !.
symmetric([H|CDR], [_,_|REM] ,T) :- symmetric(CDR,REM,[H|T]).

%factorial(+NO,-RESULT).
factorial(0,1).
factorial(N,X) :- N \= 0 , N1 is N-1 , factorial(N1,X1) ,
X is N * X1.

%listlength(+LIST,-LENGTH).
listlength([],0).
listlength([_|T],R) :- listlength(T,X) , R is X+1.

%listsum(+LIST,-SUM).
listsum([],0).
listsum([H|T],S) :- listsum(T,R) , S is H + R.

%prepend(+LIST,+ELEMENT,-NEWLIST).
prepend(LIST,E,[E|LIST]).

%moiappend(+LIST,+ELEMENT,-NEWLIST).
moiappend([],E,[E]).
moiappend([H|T],E,[H|X]) :- moiappend(T,E,X).

%moireverse(+LIST,-REVERSE).
moireverse(L,R) :- moireverse(L,[],R).

%moireverse(+LIST,+ACC,-REVERSE).
moireverse([],A,A).
moireverse([H|T],A,R) :- moireverse(T, [H|A] , R).

%moisym(+LIST).
moisym(L) :- reverse(L,R) , listlength(L,X) , moisym(L,R,X).

%moisym(+LIST,+REVERSE,+LEN).
moisym([],[],0) :- !.
moisym(L,L,1) :- !.
moisym([H|T],[H|T],_) :- !.

%insert_sort(+LIST,+ELEMENT,-NEWLIST).
insert_sort(L,[],L).
insert_sort([],E,[E]).
insert_sort([E|T],E,R) :- insert_sort(T,E,R).
insert_sort([H|T],E,[H|R]) :- E > H , insert_sort(T,E,R).
insert_sort([H|T],E,[E|[H|T]]) :- E < H.

