%! estructura(Padre, Madre, [Hijos]).
familia(persona(abraham, hombre), persona(mona, mujer), [persona(herbert, hombre), persona(homero, hombre)]).
familia(persona(clancy, hombre), persona(jacqueline, mujer), [persona(marge, mujer), persona(patty, mujer), persona(selma, mujer)]).
familia(persona(homero, hombre), persona(marge, mujer), [persona(bart, hombre), persona(lisa, mujer), persona(maggie, mujer)]).
familia(_,persona(selma, mujer),[persona(ling, mujer)]).

padre(P, H):-
    familia(persona(P, hombre), _, Hijos),
    member(persona(H, _), Hijos).

madre(M, H):-
    familia(_, persona(M, mujer), Hijos), 
    member(persona(H, _), Hijos).

progenitor(P, H):-
    madre(P, H) , padre(P, H).

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

abuelo(A , N):-
    (padre(A, P), padre(P, N) ; padre(A, M), madre(M, N)).

abuela(A, N):-
    (madre(M, P), madre(P, N) ; madre(M, P), padre(P, N)).

%! OJO CORREGIR !!
tio(T, S):-
    (abuelo(A, P), padre(P, S), hermanos(P, T)).



