countUpTo(Value, Value) :- writeln(Value), !.
countUpTo(Value, Limit) :- Value \= Limit, writeln(Value),
    NextValue is Value+1,
    countUpTo(NextValue, Limit).
