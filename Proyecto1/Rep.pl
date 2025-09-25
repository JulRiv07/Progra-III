%1. Descompone

gen(Min, Max, Min):- 
    Min =< Max.

gen(Min, Max, I):-
    Min < Max,
    Newmin is Min + 1,
    gen(Newmin, Max, I).

descompone(N, X, Y):-
    N > 0,
    Lim is integer(floor(N * (1/3))),
    gen(0, Lim, A),
    X is A ** 2,
    gen(A, Lim, B),
    Y is B ** 2,
    X + Y =:= N.

% 2. MCD

mcd(X, 0, X):- !.
mcd(X, Y, Z):-
    X >= Y,
    X1 is X - Y,
    mcd(X1, Y, Z).
mcd(X, Y, Z):-
    Y >= X, 
    Y1 is Y - X,
    mcd(Y1, X, Z).

% 3. Suma de cubos
suma(0,0).
suma(X, Y):-
    X > 0,
    X1 is X - 1,
    suma(X1, Y1),
    Y is Y1 + X ** 3.

% 4. Factorial inverso..

fac(0, 1).
fac(1, 1).
fac(X, Y):-
    X > 1,
    X1 is X - 1,
    fac(X1, Y1),
    Y is Y1 * X.

invFac(X, Y):-
    gen(1, X, Y), 
    fac(Y, Z),
    X =:= Z.

% 5. Fibonacci
fibo(0,0).
fibo(1,1).
fibo(N, F):-
    N > 1,
    N1 is N - 1,
    fibo(N1, F1),
    N2 is N - 2,
    fibo(N2, F2),
    F is F1 + F2.

% 6. Suma de los N naturales
sumaN(0,0).
sumaN(N, S):-
    N > 0,
    N1 is N - 1,
    sumaN(N1, S1),
    S is S1 + N.

% 7. Potencia inversa

pot_inver(X, Y):-
    gen(1, X, Y), 2 ** Y =:= X.

% 8. Suma impares
sumaI(0,0).
sumaI(1,1).
sumaI(N, S):-
    N > 0,
    N1 is N - 1,
    sumaI(N1, S1),
    Impar is (2 * N) - 1,
    S is Impar + S1.

% mcm (minimo comun mutiplo)
mcd2(X, 0, X) :- X > 0, !.
mcd2(X, Y, R) :-
    Y > 0,
    R1 is X mod Y,
    mcd2(Y, R1, R).

mcm(A, B, M) :-
    A > 0, B > 0,
    mcd2(A, B, D),
    M is (A * B) // D.

