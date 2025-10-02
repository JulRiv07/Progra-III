%! Cada lado del poligono es un segmento entre dos puntos 
segmento((X1,Y1), (X2,Y2)). 
%! Dos segmentos estan conectados si el ultimo punto de uno es el inicio de otro
conectados(segmento(_, P), segmento(P,_)).

%? Poligono cerrado
%* Caso base: Dos segmentos y conectados
poligono([S1,S2]):-
    conectados(S1, S2).

%* Caso recursivo: Primero conectado al segundo, y el resto tambien es poligono 
poligono([S1,S2| Tail]):-
    conectados(S1,S2),
    poligono([S2|Tail]).

%?Poligono cerrado
%* Debe tener > 2 lados
%* Debe ser poligono abierto
%* Ultimo conectado con el primero
poligono_cerrado(L):-
    length(L, Int), Tam > 2,
    poligono(L),
    L = [S1| _], 
    last(L, SL),
    conectados(SL, S1).

%? Triangulo
%* Un poligono cerrado con 3 segmentos
triangulo(L):-
    length(L, 3),
    poligono_cerrado(L).

%! Propiedades geometricas
%? Calcular longitud
longitud2(segmento((X1, Y1), (X2,Y2)), L2):-
    DX is X2-X1, DY is Y2-Y1,
    L2 is DX*DX + DY*DY.

%! Horizontales/Verticales
segmento_horizontal(segmento((_, Y1),(_,Y2))):-
    Y1 =:= Y2.

segmento_vertical(segmento((X1,_), (X2,_))):-
    X1 =:= X2.

%? Cuadrado
%* Un poligono cerrado con 4 segmentos

cuadrado(L):-
    length(L, 4),
    poligono_cerrado(L),
    maplist(horizontal_o_vertical, L),
    dist_iguales(L),
    conteo_hv(L, 2, 2),
    alternan(L).

    
    


