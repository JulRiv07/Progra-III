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

% 4. Factorial inverso
inv(F, _, A, _) :-
    A > F, !, fail.

inv(F, I, A, N) :-
    A =:= F, !,
    N = I.

inv(F, I, A, N) :-
    A < F,
    I1  is I + 1,
    A1 is A * I1,
    inv(F, I1, A1, N).

factorial_inverso(F, N) :-
    F > 0,
    inv(F, 1, 1, N).    

% Practica...

%Factorial
fac(0,1).
fac(1,1).
fac(N, F):-
    N > 0,
    N1 is N - 1,
    fac(N1, F1),
    F is F1 * N.

%Factorial inverso modo facil

fact_inv(X,R):- 
    gen(1,X,R), fac(R,Z), X =:= Z.

%Fibonacci.
fibo(0,0).
fibo(1,1).

fibo(X,F):-
    X > 1,
    X1 is X-1,
    fibo(X1, F1),
    X2 is X-2,
    fibo(X2,F2),
    F is F1 + F2, !.

%Suma de los primeros N naturales:
suma_naturales(0,0).
suma_naturales(N, S):-
    N > 0,
    N1 is N - 1,
    suma_naturales(N1, S1),
    S is S1 + N.

%Producto de los primeros N naturales:
producto_naturales(1,1).
producto_naturales(N, P):-
    N > 1,
    N1 is N - 1,
    producto_naturales(N1, P1),
    P is N * P1.

%Potencia Recursiva:
potencia(_, 0, R):- R is 1.
potencia(Base, Exp, R):-
    Exp > 0, Exp1 is Exp - 1, potencia(Base,Exp1,R1), R is R1 * Base.

%Raiz de un numero:
sqrt(N,R):-
    gen(1,N,R),
    F is R ** 2,
    N =:= F.