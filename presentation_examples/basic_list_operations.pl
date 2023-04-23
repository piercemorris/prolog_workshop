
head([Head | _], Head).

tail([_ | Tail], Tail).

loop([]).
loop([Head | Tail]) :-
  write(Head), nl,
  loop(Tail).