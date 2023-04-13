%% Taken mostly from https://www.metalevel.at/queens/
%% Need to work this into the worksheet as a stretch-goal, maybe give the outline of the predicates with comments/pseudo-code to guide

%% Need this library to use "ins"
:- use_module(library(clpfd)).

n_queens(N, Qs) :-
    n_queens_logic(N, Qs),
    labeling([ff], Qs).

%% ins can be written as either
%%   ins(List, Domain) or
%%   List ins Domain
n_queens_logic(N, Qs) :-
    length(Qs, N),
    ins(Qs, 1..N),
    safe_queens(Qs).

safe_queens([]).
safe_queens([Q|RestOfQueens]) :-
    %% Why does the order of these matter?
    safe_queens(Q, RestOfQueens, 1), %% Current queen doesn't break safety with rest of queens
    safe_queens(RestOfQueens). %% Rest of the queens are safe


%% How to determine which are safe
%% What is this for? - Think it's saying a queen is safe if it's the only queen
safe_queens(_, [], _).
safe_queens(Q, [NextQueen|RestOfQueens], DiagonalRowDifference) :-
    %% Not in same row
    Q #\= NextQueen,
    %% Not in the same diagnoal
    abs(Q - NextQueen) #\= DiagonalRowDifference,
    %% Next diagonal row difference
    NewDiagonalRowDifference #= DiagonalRowDifference + 1,
    safe_queens(Q, RestOfQueens, NewDiagonalRowDifference). %% Need to check with 2

%% Full code + animation code here: https://www.metalevel.at/queens/

%% Needs to be queried like `?- n_queens(8, Qs), labeling([ff], Qs) for example
%% See https://www.swi-prolog.org/pldoc/man?predicate=labeling/2 for other options


%% See https://www.swi-prolog.org/pldoc/man?section=clpfd-integer-arith for why we use #\= instead of \= and #= instead of "is" of =:=
%% Note, it fails if we use "is" for NewDiagnoalRowDifference is DiagonalRowDifference + 1

