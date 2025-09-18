
%---------------------------------------------Hechos---------------------------------------------

hombre(tomas).
hombre(jose).
hombre(jaime).

mujer(clara).
mujer(isabel).
mujer(ana).
mujer(patricia).

progenitor(clara, jose).
progenitor(tomas, jose).
progenitor(tomas, isabel).
progenitor(jose, ana).
progenitor(jose, patricia).
progenitor(patricia, jaime).

% ---------------------------------------------Reglas---------------------------------------------

dif(X, Y):- 
    X\=Y.

es_madre(X):-
    mujer(X), 
    progenitor(X, _).

es_padre(X):-
    hombre(X), 
    progenitor(X, _).

es_hijo(X):-
    progenitor(_, X).

hermana_de(X, Y):-
    mujer(X), 
    dif(X, Y), 
    progenitor(P, X), progenitor(P, Y).

abuelo_de(X, Y):-
    hombre(X),
    dif(X, Y),
    progenitor(P, Y), progenitor(_, P).

abuela_de(X, Y):-
    mujer(X),
    dif(X, Y),
    progenitor(P, Y), progenitor(_, P).

hermanos(X, Y):-
    dif(X, Y),
    progenitor(P, X), progenitor(P, Y).

tia(X, Y):-
    mujer(X),
    dif(X, Y),
    progenitor(P, Y), hermana_de(X, P).


%---------------------------------------------Consultas---------------------------------------------

% Ejercicio 1.2

% ¿Quien es el progenitor de patricia?
% ?- progenitor(X, patricia).

% ¿Tiene Isabel un hijo o una hija?
% ?- progenitor(isabel, X).

% ¿Quien es el abuelo de isabel?
% ?- progenitor(X, Y), progenitor(Y, isabel).

% ¿Cuales son los tios de patricia? (No excluir al padre)
% ?- progenitor(P, patricia), progenitor(A, P), progenitor(A, T).

% Ejercicio 1.3

% es_madre(X)
% ?- es_madre(clara).

% es_padre(X).
% ?- es_padre(tomas).

% es_hijo(x).
% ?- es_hijo(patricia).

% hermana_de(X, Y).
% ?- hermana_de(isabel, jose).

% abuelo_de(X, Y).
% ?- abuelo_de(tomas, jaime).

% abuela_de(X, Y).
% ?- abuela_de(clara, jaime).

% hermanos(X, Y).
% ?- hermanos(jose, isabel).

% tia(X, Y).
% ?- tia(isabel, patricia).
