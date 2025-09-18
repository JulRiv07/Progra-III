% Repaso parcial I, Progra III (Prolog)

%1. descompone(+N,-X,-Y) (cubos que suman N, con X =< Y)

gen(Min, Max, Min):-
    Min =< Max.

gen(Min, Max, X):-
    Min < Max,
    Newmin is Min + 1,
    gen(Newmin, Max, X).

descompone(N, X, Y):-
    Lim is integer(floor(N ** (1/3))),
    gen(0, Lim, A), 
    X is A ** 3,
    gen(A, Lim, B),
    Y is B ** 3,
    X + Y =:= N.

% 2. MCD(X, Y, Z)

mcd(X, 0, X) :- X > 0, !.
mcd(X, Y, Z):-
    X >= Y, !, 
    X1 is X - Y,
    mcd(X1, Y, Z).

mcd(X, Y, Z):-
    Y >= X,
    Y1 is Y - X,
    mcd(Y1, X, Z).

% 3. Sumar los N primeros cubos suma(N, S).

suma(0,0).
suma(N, S):-
    N > 0,
    N1 is N - 1,
    suma(N1, S1),
    S is S1 + N ** 3.



