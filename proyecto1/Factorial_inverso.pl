factorial(0, 1).
factorial(N, F) :-
    N > 0,
    N1 is N - 1,
    factorial(N1, F1),
    F is N * F1.

factorial_inverso(F, X):-
    between(1, F, X),
    factorial(X, C),
    F =:= C, !.