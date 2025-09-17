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
