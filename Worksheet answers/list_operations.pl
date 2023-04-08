%% Don't include this in the repo

%% LENGTH
list_length([], 0).
list_length([_|T], L) :-
    list_length(T, LT),
    L is LT + 1.

%% LENGTH with Accumulator
list_length_acc(List, L) :-
    list_length_acc(List, 0, L).
list_length_acc([], L, L).
list_length_acc([_|T], Acc, L) :-
    NewAcc is Acc + 1,
    list_length_acc(T, NewAcc, L).

%% MEMBER
list_member([X|_], X) :- !.
list_member([_|TAIL], X) :- list_member(TAIL, X).

%% SUM
list_sum([], 0).
list_sum([H|T], S) :-
    list_sum(T, ST),
    S is ST + H.

%% SUM with accumulator
list_sum_acc(List, Sum) :-
    list_sum_acc(List, 0, Sum).

list_sum_acc([], Sum, Sum).
list_sum_acc([H|T], Acc, Sum) :-
    NewAcc is Acc + H,
    list_sum_acc(T, NewAcc, Sum).

%% APPEND

%% REVERSE

%% FLATTEN