% =========================================
% Project.pl - Árbol genealógico en Prolog
% =========================================

% Se declaran los hechos...

% Hombres de la familia
hombre(julian).
hombre(nicolax).
hombre(ricardo).
hombre(javier).
hombre(anuar).

% Mujeres de la familia
mujer(juliana).
mujer(stephanie).
mujer(sara).
mujer(martha).

% Parejas en la familia
son_pareja(ricardo, juliana).
son_pareja(anuar, sara).

% Padres de cada persona ya antes declarada
es_padre_de(ricardo, julian).
es_padre_de(ricardo, nicolax).
es_padre_de(ricardo, stephanie).
es_padre_de(anuar, juliana).
es_padre_de(javier, ricardo).
% Madres de cada persona ya antes declarada
es_madre_de(juliana, julian).
es_madre_de(juliana, stephanie).
es_madre_de(juliana, nicolax).
es_madre_de(sara, juliana).
es_madre_de(martha, ricardo).

% Se declaran las reglas 

% Si X u Y son pareja entonces X y Y son padres
son_padres(X, Y) :- son_pareja(X, Y). 
son_padres(X, Y) :- son_pareja(Y, X).

% Si se cumple que P es padre o madre de H entonces P será el progenitor de H
progenitor(P, H) :- es_padre_de(P, H).
progenitor(P, H) :- es_madre_de(P, H).

% Si se cumple que H es hombre o mujer (depende el caso) y el progenitor de H es P entonces H es hijo de P 
es_hijo_de(H, P) :- hombre(H), progenitor(P, H).
es_hija_de(H, P) :- mujer(H),  progenitor(P, H).

% Si se cumple que A y B son distintos y que el progenitor de A es el mismo que el de B entonces A y B son hermanos
hermanos(A, B) :-
    A \= B,
    progenitor(P, A),
    progenitor(P, B).

es_hermano_de(A, B) :- hermanos(A,B), hombre(A).
es_hermana_de(A, B) :- hermanos(A,B), mujer(A).

% Si A es progenitor de P y P es progenitor de N entoces A es abuel@ de N
es_abuelo_de(A, N) :- hombre(A), progenitor(A, P), progenitor(P, N).
es_abuela_de(A, N) :- mujer(A),  progenitor(A, P), progenitor(P, N).
