%% Taken mostly from https://www.metalevel.at/queens/

%% Need this library to use "ins" and "labeling"
:- use_module(library(clpfd)).

n_queens(N, Qs) :-
    n_queens_logic(N, Qs),
    labeling([ff], Qs).

n_queens_logic(N, Qs) :-
    length(Qs, N),
    ins(Qs, 1..N), %% can also be written as Qs ins 1..N
    safe_queens(Qs).

safe_queens([]).
safe_queens([CurrentQueen|RestOfQueens]) :-
    %% Current queen doesn't break safety with rest of queens
    safe_queens(CurrentQueen, RestOfQueens, 1),
    %% Rest of the queens are safe
    safe_queens(RestOfQueens).


%% If there is only one queen, it is safe
safe_queens(_, [], _).

%% See https://www.swi-prolog.org/pldoc/man?section=clpfd-integer-arith
%% for why we use #\= instead of \=
safe_queens(Q, [NextQueen|RestOfQueens], DiagonalRowDifference) :-
    %% Not in same row
    Q #\= NextQueen,
    %% Not in the same diagnoal
    abs(Q - NextQueen) #\= DiagonalRowDifference,
    %% Next diagonal row difference
    NewDiagonalRowDifference is DiagonalRowDifference + 1,
    safe_queens(Q, RestOfQueens, NewDiagonalRowDifference).

