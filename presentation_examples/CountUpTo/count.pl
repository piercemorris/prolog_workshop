countUpToCut(Value, Value) :- writeln(Value), !.

countUpToCut(Value, Limit) :-
    Value \= Limit,
    writeln(Value),
    NextValue is Value+1,
    countUpToCut(NextValue, Limit).
