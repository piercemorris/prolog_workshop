movie(american_beauty, Y).
movie(M, 2000).
movie(M, Y), Y < 2000.
movie(M, Y), Y > 1999.
actor(M1, A, _), actor(M2, A, _), M1 @> M2.
actress(M, scarlett_johansson, _), director(M, D).
actor(_, A, _), director(_, A).
(actor(_, A, _) ; actress(_, A, _)), director(_, A).
actor(M, john_goodman, _), actor(M, jeff_bridges, _).