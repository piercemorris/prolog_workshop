# Prolog Workshop - Part 1
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

### Exiting SWIPL
```prolog
?- halt.
```
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