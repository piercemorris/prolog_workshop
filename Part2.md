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
Define a predicate `list_append/3` which can be used to append an element to the end of a list.

```prolog
?- list_append([a, b, c], d, L).
L = [a, b, c, d]
```
### 5. Reverse
Define a predicate `list_reverse/2` which can be used to reverse a list.

```prolog
?- list_reverse([a, b, c], L).
L = [c, b, a]
```
### 6. Flatten
Define a predicate `list_flatten` which can be used to flatten a list of lists.

```prolog
?- list_flatten([a, [b, c], [[d, e]]], L).
L = [a, b, c, d, e].
```

**Note:** For this, you may want to use the in-built [`append/3`](https://www.swi-prolog.org/pldoc/doc_for?object=append/3) operator, which can concatenate two lists.
### Extra
If the above predicates are too easy, take a look at the [Accumators](#accumulators) section and see if you can implement any of the above predicates using an accumulator.
## More Difficult Problems

### 1. N-Queens
The N-Queens problem is a generalization of the traditional 8-queens problem. You can find a good description [here](https://leetcode.com/problems/n-queens/).

For this exercise, assume that each possible solution to the n-queens problem will be represented by a list of numbers, where number `X` at index `i` indicates the queen in column `i` would be safe on row `X` of the board.

Write a predicate `n_queens/2` which will return all possible solutions for a given value of N. An example output of calling this is:

```prolog
?- n_queens(4, Qs).
Qs = [2, 4, 1, 3] ;
Qs = [3, 1, 4, 2] .
```

<details>
<summary>A starting guide for those who want it</summary>

As a starting point, use the following:
```prolog
:- use_module(library(clpfd)).
n_queens(N, Qs) :-
    n_queens_logic(N, Qs),
    labeling([ff], Qs).

n_queens_logic(N, Qs) :-
    length(Qs, N),
    ins(Qs, 1..N),
    safe_queens(Qs).
```

You will need to create and complete the logic for the `safe_queens` predicate. The `clpfd` library contains some useful predicates for constraint logic, including `ins` and `labeling`. The `ins` predicate ensures all values in the Qs list are within the given range `1..N`. The `labeling` predicate, with the `[ff]` option, will systematically try out values that are within this range. See [this library documentation](https://www.swi-prolog.org/man/clpfd.html) for more information.

For some of the arithmetic involved, you may also want to look at [this](https://www.swi-prolog.org/pldoc/man?section=clpfd-integer-arith).
</details>
<br/>

### 2. LBTT Tax Calculator (AKA Academy Pair Programming Task)
Buying a house in the UK incurs a tax which varies according to the price of the house. In Scotland this is called Land and Buildings Transaction Tax (LBTT) – you may know it as Stamp Duty, the equivalent tax in England.

Write a predicate `calculateTax/2` which will calculate the amount of LBTT to be paid for a specific value of house. An example of running this is:
```prolog
?- calculateTax(900000, Tax).
Tax = 66350.00 .
```

Use the following values for the percentage tax in each tax band:
| Range                | Percentage tax |
| -------------------- | -------------- |
| Up to £145,000       | 0%             |
| £145,001 to £250,000 | 2%             |
| £250,001 to £325,000 | 5%             |
| £325,001 to £750,000 | 10%            |
| Over £750,000	       | 12%            |

**Note:** You can use [this calculator](https://revenue.scot/calculate-tax/calculate-property-transactions) to check what tax should be paid for a given property value.

### 3. Extra problems
There are a set of 99 problems available [here](https://www.ic.unicamp.br/~meidanis/courses/mc336/2009s2/prolog/problemas/) if you want more exercises.

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