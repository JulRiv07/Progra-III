
% Corte "!"
nota(X, suspenso) :-
    X < 5, !.

nota(X, aprobado):-
    X < 7, !.

nota(X, notable) :-
    X < 9, !.

nota(X, sobresaliente) :-
    X >= 9.

%Bucle
persona(X):-
    madre(X,Y), persona(Y).
persona(ana).
madre(eva, ana).

