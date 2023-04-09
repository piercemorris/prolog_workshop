# Prolog Workshop - Part 2

## Exploring predicates for common list functions

### 1. Length
Define a predicate `list_length/2` which can be used to find the length of a list.

Should be able to query like this:
```prolog
?- list_length([a, b, c, d], N).
N = 4
```
or
```prolog
?- list_length([a, b, c, d], 4).
true.
```
### 2. List membership
Define a predicate `list_member/2` which can be used to check if an element is a member of a list.

Should be able to query like this:
```prolog
?- list_member([a, b, c, d], a).
true.
```

### 3. Sum
Define a predicate `list_sum/2` which can be used to calculate the sum of all elements in a list.

Should be able to query like this:
```prolog
?- list_sum([1, 2, 3], S).
S = 6
```

### 4. Append

### 5. Reverse

### 6. Flatten

### Extra
If the above predicates are too easy, take a look at the [Accumators](#accumulators) section and see if you can implement any of the above predicates using an accumulator.
## Complex problems
- Depth-first search
- Sudoku?
- N-queens or some simpler variation

## Further reading

### Accumulators
Simple predicates are not always efficient. For example, take the following predicate which calculates the maximum element in a list:

```prolog
%% Clause 1
max([Max], Max).

%% Clause 2
max([H|T], Max) :-
    max(T, MaxTail),
    H > MaxTail,
    Max = H.

%% Clause 3
max([H|T], Max) :-
    max(T, MaxTail),
    H =< MaxTail,
    Max = T.
```

If we ran `max([1, 2, 3], M)`, Prolog would first try **Clause 2**. This would first find the maximum of the tail of the list, `[2, 3]`, which would yield `3`. Then the head of original list, `1`, would be compared to this value, and as `1 > 3` returns **false**, this clause would fail. Prolog would then back-track and try **Clause 3**, which will re-calculate the maximum of the tail, `[2, 3]`. For a small list this isn't a problem, but you can imagine as the size of the list increased, this inefficiency would be noticeable.

**Accumulators** can solve this problem. The idea is to keep track of the answer through the recursion so the answer is found on the way down the decision tree rather than on the way back up. An example of using an accumulator for calculating the maximum value in a list is shown here:

```prolog
max([H|T], Max) :-
    max(T, H, Max).

max([], Max, Max).

max([H|T], Acc, Max) :-
    H > Acc,
    max(T, H, Max).

max([H|T], Acc, Max) :-
    H =< Acc,
    max(T, Acc, Max).

```

See [this](https://lpn.swi-prolog.org/lpnpage.php?pagetype=html&pageid=lpn-htmlse20) for more information.