%! Estructura (Padre, Madre, [Lista de hijos])
familia(persona(abraham, hombre), persona(mona, mujer), [persona(herbert, hombre), persona(homero, hombre)]).
familia(persona(clancy, hombre), persona(jacqueline, mujer), [persona(patty, mujer), persona(selma, mujer), persona(marge, mujer)]).
familia(persona(homero, hombre), persona(marge, mujer), [persona(bart, hombre), persona(lisa, mujer), persona(maggie, mujer)]).
familia(_, persona(selma, mujer), [persona(ling, mujer)]).

%! Padre, Madre, Progenitor
padre(P, H):-
    familia(persona(P, hombre), _, Hijos),
    member(persona(H, _), Hijos).

madre(M, H):-
    familia(_, persona(M, mujer), Hijos),
    member(persona(H, _), Hijos).

progenitor(P, H):-
    padre(P, H) ; madre(P, H).

abuelo(A, H):-
    (padre(A, Z), padre(Z, H)) ; (padre(A,Z), madre(Z, H)).

abuela(A, H):-
    (madre(A, Z), madre(Z, H)) ; (madre(A, Z), padre(Z, H)).

hijo_genero(H, Genero):-
    familia(_,_,Hijos),
    member(persona(H, Genero), Hijos).

hermano(X, Y):-
    progenitor(Z, X), progenitor(Z, Y),
    X \= Y, hijo_genero(X, hombre).

hermana(X, Y):-
    familia(_,_,Hijos),
    member(persona(X, mujer), Hijos),
    member(persona(Y,_), Hijos),
    X \= Y.
