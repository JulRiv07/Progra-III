%! 1 Familia Simpson...

familia(persona(abraham, hombre), persona(mona, mujer), [persona(herbert, hombre), persona(homero, hombre)]).
familia(persona(clancy, hombre), persona(jacqueline, mujer), [persona(marge, mujer), persona(patty, mujer), persona(selma, mujer)]).
familia(persona(homero, hombre), persona(marge, mujer), [persona(bart, hombre), persona(lisa, mujer), persona(maggie, mujer)]).
familia(_,persona(selma, mujer),[persona(ling, mujer)]).

genero(N, G):-
    (familia(persona(N,G), _,_)
    ; familia(_, persona(N, G), _)
    ; familia(_,_, Hijos), member(persona(N,G), Hijos)
    ), !.

padre(P, H):-
    familia(persona(P, hombre), _, Hijos),
    member(persona(H, _), Hijos).

madre(M, H):-
    familia(_, persona(M, mujer), Hijos), 
    member(persona(H, _), Hijos).

progenitor(P, H):-
    padre(P, H); madre(P, H).

hijo(H, P):-
    (familia(persona(P, hombre), _, Hijos) ; familia(_, persona(P, mujer), Hijos)),
    member(persona(H, hombre), Hijos).

hija(H, P):-
    (familia(persona(P, hombre), _, Hijos) ; familia(_, persona(P, mujer), Hijos)),
    member(persona(H, mujer), Hijos).

hermanos(A, B):-
    A \= B,
    progenitor(P, A), 
    progenitor(P, B).

hermano(A, B):-
    hermanos(A, B), genero(A, hombre).

hermana(A, B):-
    hermanos(A, B), genero(A, mujer).

abuelo(A , N):-
    (padre(A, P), padre(P, N) ; padre(A, P), madre(P, N)).

abuela(A, N):-
    (madre(A, P), madre(P, N) ; madre(A, P), padre(P, N)).

tix(T, S):-
    progenitor(P, S), hermanos(P, T).

tio(T, S):-
    progenitor(P, S), hermanos(P, T), genero(T, hombre).

tia(T, S):-
progenitor(P, S), hermanos(P, T), genero(T, mujer).

primos(X, Y):-
    tio(T, X), progenitor(T, Y).

%! 2. Ciudades de Canada...

%! 2. Ciudades de Canada...

ciudades([
    conexion(vancouver, edmonton, 16),
    conexion(vancouver, calgary, 13),
    conexion(calgary,   edmonton, 4),
    conexion(calgary,   regina,   14),
    conexion(regina,    winnipeg, 4),
    conexion(regina,    saskatoon,7),
    conexion(saskatoon, winnipeg, 20),
    conexion(saskatoon, calgary,  9),
    conexion(edmonton,  saskatoon,12)
]).

hay_conexion(C1, C2) :-
    ciudades(L),
    ( member(conexion(C1,C2,_), L)
    ; member(conexion(C2,C1,_), L)
    ), !.

tiene_aristas(C) :-
    ciudades(L),
    ( member(conexion(C,_,_), L)
    ; member(conexion(_,C,_), L)
    ), !.

cuales_aristas_tiene(C, A) :-
    ciudades(L),
    ( member(conexion(C,A,_), L)
    ; member(conexion(A,C,_), L)
    ).


    arista(C1, C2, Costo) :-
    ciudades(L),
    ( member(conexion(C1,C2,Costo), L)
    ; member(conexion(C2,C1,Costo), L)
    ).

costo_camino(Origen, Destino, CostoTotal) :-
    costo_recursivo(Origen, Destino, CostoTotal, [Origen]).

costo_recursivo(C1, C2, Costo, _) :-
    arista(C1, C2, Costo).

costo_recursivo(C1, C2, CostoTotal, Visitadas) :-
    arista(C1, Next, C1N),
    \+ member(Next, Visitadas),
    costo_recursivo(Next, C2, CN, [Next|Visitadas]),
    CostoTotal is C1N + CN, !.

camino(Origen, Destino) :-
    camino_recursivo(Origen, Destino, [Origen]).

camino_recursivo(C1, C2, _) :-
    arista(C1, C2, _).

camino_recursivo(C1, C2, Visitadas) :-
    arista(C1, Next, _),
    \+ member(Next, Visitadas),
    camino_recursivo(Next, C2, [Next|Visitadas]).