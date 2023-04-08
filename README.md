# Prolog Workshop

## Prerequisites

If you are using VSCode, I recommend the prolog extension by searching the following id `rebornix.prolog`

### MacOS Installation

1. Install `swi-prolog` using homebrew

```bash
$ brew install swi-prolog
```

2. Test the installation was successful
```bash
$ swipl
```

### Windows Installation

1. Navigate to https://www.swi-prolog.org/download/stable and download the relevant 64 or 32 bit installation file listed under **Binaries**

2. Test the installation was successful
```bash
$ swipl
```

## Useful Prolog commands

### Loading a knowledge base
Given a file name `movies.pl` and you are in the same directory, you can load the file by using the following command:
```prolog
?- [movies].
true.
```

**Note:** If the file name starts with a capital letter, you will need to wrap it as a string when using the command. For example, given a file name `Movies.pl`, use:
```prolog
?- ['Movies'].
true.
```

### Trace
You can run the trace command which will show the steps Prolog takes when running a query:
```prolog
?- trace.
true.
```

You can tell `swi-prolog` is using `trace` mode as the query lines will now look like this:
```prolog
[trace]?-
```

To turn the trace off, run `notrace`. This may put `swi-prolog` into debug mode. You can run `nodebug` to turn this off.
# Exercises

## Exploring a knowledge base
We have provided a `movies.pl` knowledge base with some existing facts.
### Current facts


```prolog
movie(M, Y) % movie M came out in year Y
director(M, D) % movie M was directed by director D
actor(M, A, R) % actor A played role R in movie M
actress(M, A, R) % actress A played role R in movie M
```
### Part 1: Queries
Write queries to answer the following questions below. You can run these directly in the `swipl` terminal after loading the knowledge base.

1. In which year was the movie American Beauty released?
2. Find the movies released in the year 2000.
3. Find the movies released before 2000.
4. Find the movies released after 1990.
5. Find an actor who has appeared in more than one movie.
6. Find a director of a movie in which Scarlett Johansson appeared.
7. Find an actor who has also directed a movie.
8. Find an actor or actress who has also directed a movie.
9. Find the movie in which John Goodman and Jeff Bridges were co-stars.

### Part 2: Simple rules
Add rules to the knowledge base file to do the following:

1. `released_after(M, Y)` - the movie was released after the given year.
2. `released_before(M, Y)` - the movie was released before the given year.
3. `same_year(M1, M2)` - the movies are released in the same year.
4. `co_star(A1, A2)` - the actor/actress are in the same movie.

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