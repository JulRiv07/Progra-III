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

ciudades([ conexion(vancouver, edmonton, 16),
            conexion(vancouver, calgary, 13),
            conexion(calgary, edmonton, 4),
            conexion(calgary, regina, 14),
            conexion(regina, winnipeg, 4),
            conexion(regina, saskatoon, 7),
            conexion(saskatoon, calgary, 9),
            conexion(edmonton, saskatoon, 12)]).

hay_conexion_directa(Ciudad1,Ciudad2):-
    ciudades(ListaConexiones),
    (
    member(conexion(Ciudad1,Ciudad2,_), ListaConexiones)
    ;
    member(conexion(Ciudad1,Ciudad2,_), ListaConexiones)
    ), !.

tiene_aristas(Ciudad):-
    ciudades(ListaConexiones),
    (   
    member(conexion(Ciudad,_,_), ListaConexiones)
    ;   
    member(conexion(_,Ciudad,_), ListaConexiones)
    ), !.

cuales_aristas_tiene(Ciudad, Arista):-
    ciudades(ListaConexiones),
    (
    member(conexion(Ciudad,Arista,_), ListaConexiones)
    ;
    member(conexion(Ciudad,Arista,_), ListaConexiones)
    ).

%Costo Recursivo.
arista(Ciudad1,Ciudad2,Costo):-
    ciudades(L),
    (   
    member(conexion(Ciudad1,Ciudad2,Costo),L)
    ;   
    member(conexion(Ciudad2,Ciudad1,Costo),L)
    ).

costo_camino(Ciudad1,Ciudad2,CostoTotal):-
    costo_recursivo(Ciudad1,Ciudad2,CostoTotal, [Ciudad1]).

costo_recursivo(Ciudad1,Ciudad2,Costo,_):-
	arista(Ciudad1,Ciudad2,Costo).

costo_recursivo(Ciudad1,Ciudad2,CostoTotal,Visitadas):-
    arista(Ciudad1,NextCity,Costo_C1),
    \+ member(NextCity, Visitadas),
    costo_recursivo(NextCity,Ciudad2,Costo_C2,[NextCity|Visitadas]),
    CostoTotal is Costo_C1 + Costo_C2, !.
    



