# Prolog Workshop

## Exercise 1

Part 1: Write queries to answer the following questions below.

  - [ ] In which year was the movie American Beauty released?
 ```prolog

 ```

  - [ ] Find the movies released in the year 2000.
 ```prolog

 ```

  - [ ] Find the movies released before 2000.
 ```prolog

 ```

    c. Find the movies released before 2000.
    d. Find the movies released after 1990.
    e. Find an actor who has appeared in more than one movie.
    f. Find a director of a movie in which Scarlett Johansson appeared.
    g. Find an actor who has also directed a movie.
    h. Find an actor or actress who has also directed a movie.
    i. Find the movie in which John Goodman and Jeff Bridges were co-stars.

Part 2: Add rules to the database to do the following,

    a. released_after(M, Y) <- the movie was released after the given year.
    b. released_before(M, Y) <- the movie was released before the given year.
    c. same_year(M1, M2) <- the movies are released in the same year.
    d. co_star(A1, A2) <- the actor/actress are in the same movie.

/* DATABASE

    movie(M, Y) <- movie M came out in year Y
    director(M, D) <- movie M was directed by director D
    actor(M, A, R) <- actor A played role R in movie M
    actress(M, A, R) <- actress A played role R in movie M

*/