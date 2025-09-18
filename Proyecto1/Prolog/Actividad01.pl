
%============Taller #1================
% Julian Rivera Sanchez 1094049087
% Juan Rojas Muñoz 1114151514
% Luis Ospina Monje 1086634708
% Juan Gallego Bolivar 1085717895
%=====================================

% 1. Arbol genealogico

hombre(abraham).
hombre(herbert).
hombre(homero).
hombre(bart).
hombre(clancy).

mujer(mona).
mujer(marge).
mujer(lisa).
mujer(maggie).
mujer(jacqueline).
mujer(patty).
mujer(selma).
mujer(ling).

madre_de(mona, herbert).
madre_de(mona, homero).
madre_de(marge, bart).
madre_de(marge, maggie).
madre_de(marge, lisa).

madre_de(jacqueline, marge).
madre_de(jacqueline, patty).
madre_de(jacqueline, selma).
madre_de(selma, ling).

padre_de(abraham, herbert).
padre_de(abraham, homero).
padre_de(homero, bart).
padre_de(homero, lisa).
padre_de(homero, maggie).

padre_de(clancy, marge).
padre_de(clancy, patty).
padre_de(clancy, selma).

% Reglas
progenitor(P, H) :- padre_de(P, H).
progenitor(P, H) :- madre_de(P, H).

hijo_de(H, P) :- hombre(H), progenitor(P, H).
hija_de(H, P) :- mujer(H),  progenitor(P, H).

hermano_de(A, B) :-
    A \= B,
    progenitor(P, A),
    progenitor(P, B).

abuelo_de(A, N):-
    hombre(A), progenitor(A, P), progenitor(P, N).

abuela_de(A, N):-
    mujer(A), progenitor(A, M), progenitor(M, N).

tio_de(T, S):-
    hombre(T), 
    progenitor(P, S), hermano_de(P, T).

tia_de(T, S):-
    mujer(T), 
    progenitor(P, S), hermano_de(P, T).

tix(T, S):-
    progenitor(P, S), hermano_de(P, T).

primx_de(A, B):-
    progenitor(P, A), tix(P, B).

% 2. Comprobar crimen

pais(usa).
pais(corea_del_sur).
es_estadounidense(west).

enemigo_de(corea_del_sur, usa).
es_hostil(P) :- enemigo_de(P, usa).

misil(kinzhal).
posee(corea_del_sur, kinzhal).

arma(X) :- misil(X).

vende(west, M, corea_del_sur):-
    misil(M),
    posee(corea_del_sur, M).

criminal(X):-
    es_estadounidense(X),
    vende(X, Misil, Pais),
    arma(Misil),
    es_hostil(Pais).







