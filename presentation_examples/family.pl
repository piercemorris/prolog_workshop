person(andrew).
person(brian).
person(charlie).
parent(charlie, andrew).
parent(charlie, brian).

sibling(X, Y) :-
    person(X),
    person(Y),
    parent(Z, X),
    parent(Z, Y).