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

%% APPEND - CHECK THIS ONLINE, MADE IT UP -> then add to worksheet
list_append([], X, [X]).
list_append([H|T], Element, [H|TailWithElement]) :-
    list_append(T, Element, TailWithElement).
%% Could this be done with accumulator?
%% Maybe look at inserting element into specific position?
%% Should we look at appending a list to another list, not just an element

%% REVERSE - Implement this better, don't think we NEED cut or to use list_append
list_reverse([X], [X]) :- !.
list_reverse([H|T], L) :-
    list_reverse(T, TReversed),
    list_append(TReversed, H, L).

%% could this be done with accumulator?

%% FLATTEN
list_flatten([], []).

list_flatten([H|T], Flat) :-
    list_flatten(H, HFlat),
    list_flatten(T, TFlat),
    !, %% Without this cut, get some weird side-effects
    append(HFlat, TFlat, Flat). %% In-built predicate that appends two lists, should get them to implement this earlier

list_flatten(X, [X]). %% If head element is not a list, put it in a list so it works with append
%%or
% list_flatten([H|T], [H|TFlat]) :-
%     H \= [],
%     H \= [_|_],
%     list_flatten(T, TFlat).