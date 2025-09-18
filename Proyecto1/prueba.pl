% ===========================
% curso.pl - Curso básico Prolog
% ===========================

% --- Hechos ---
color(rojo).
color(verde).
color(azul).

vive_en(juan, bogota).
vive_en(ana, medellin).
vive_en(carlos, bogota).
vive_en(luisa, cali).

gusta(juan, pizza).
gusta(ana, pasta).
gusta(carlos, helado).
gusta(luisa, pizza).

% --- Reglas ---

% Mismo lugar: dos personas viven en la misma ciudad
mismo_lugar(X, Y) :-
    vive_en(X, Ciudad),
    vive_en(Y, Ciudad).

% Le gusta la misma comida
mismo_gusto(X, Y) :-
    gusta(X, Comida),
    gusta(Y, Comida).

% Suma de elementos de una listañ
suma_lista([], 0).
suma_lista([H|T], Suma) :-
    suma_lista(T, Resto),
    Suma is H + Resto.

% Factorial (ejemplo de recursión)
factorial(0, 1).
factorial(N, F) :-
    N > 0,
    N1 is N - 1,
    factorial(N1, F1),
    F is N * F1.

% Miembro de una lista
miembro(X, [X|_]).
miembro(X, [_|T]) :- miembro(X, T).

% ===========================
% Fin del archivo
% ===========================

