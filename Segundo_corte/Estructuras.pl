% !===========================
% !Conectividad de segmentos
% !===========================
% ?Dos segmentos están conectados si el punto final del primero
% ?es el punto inicial del segundo.

conectados(segmento(_, P2S1), segmento(P2S1, _)).

% !===========================
% !Polígono (cadena abierta)
% !===========================
%? Caso base: hay dos segmentos y están conectados.

poligono([S1, S2]) :-
    conectados(S1, S2).

%? Caso recursivo: S1->S2 conectados y el resto también forma polígono.

poligono([S1, S2 | Tail]) :-
    conectados(S1, S2),
    poligono([S2 | Tail]).

% !===========================
% !Polígono cerrado
% !===========================
% ? Debe tener al menos 3 segmentos, ser polígono (cadena interna bien)
% ? y además último conectado con primero.

poligono_cerrado(Lsegs) :-
    proper_length(Lsegs, Tam),
    Tam > 2,
    poligono(Lsegs),
    Lsegs = [S1 | _],
    last(Lsegs, SL),
    conectados(SL, S1).

% !===========================
% !Triángulo
% !===========================
triangulo(Lsegs) :-
    proper_length(Lsegs, 3),
    poligono_cerrado(Lsegs).
    % (Opcional anti-degenerado)
    % no_colineal_triangulo(Lsegs).

% ? (Opcional) Verifica que las 3 esquinas no sean colineales (área != 0).
% ? Toma los 3 vértices: P1 = inicio de S1, P2 = inicio de S2, P3 = inicio de S3.
no_colineal_triangulo([segmento(P1,_), segmento(P2,_), segmento(P3,_)]):-
    P1 = (X1,Y1), P2 = (X2,Y2), P3 = (X3,Y3),
    A2 is X1*(Y2-Y3) + X2*(Y3-Y1) + X3*(Y1-Y2),
    A2 =\= 0.

% !===========================
% !Geometría de segmentos
% !===========================
% ?Longitud al cuadrado (evitamos sqrt y errores de coma flotante).

longitud2(segmento((X1,Y1),(X2,Y2)), L2) :-
    DX is X2 - X1,
    DY is Y2 - Y1,
    L2 is DX*DX + DY*DY.

segmento_horizontal(segmento((_,Y1),(_,Y2))) :- Y1 =:= Y2.
segmento_vertical(  segmento((X1,_),(X2,_))) :- X1 =:= X2.

% !Todas las distancias (al cuadrado) iguales
dist_iguales([_]).
dist_iguales([S1 | Resto]) :-
    longitud2(S1, Lref),
    dist_iguales_aux(Resto, Lref).

dist_iguales_aux([], _).
dist_iguales_aux([S | R], Lref) :-
    longitud2(S, L2),
    L2 =:= Lref,
    dist_iguales_aux(R, Lref).

% Todos horizontales o verticales
horizontal_o_vertical([_]).
horizontal_o_vertical([S | Resto]) :-
    (segmento_horizontal(S) ; segmento_vertical(S)),
    horizontal_o_vertical(Resto).

% !Orientación simple: h o v (para alternancia)
orientacion(S, h) :- segmento_horizontal(S).
orientacion(S, v) :- segmento_vertical(S).

% !Alternan orientaciones: h-v-h-v ... o v-h-v-h ...
alternan([_]).
alternan([S1, S2 | R]) :-
    orientacion(S1, O1),
    orientacion(S2, O2),
    O1 \= O2,
    alternan([S2 | R]).

% !Conteo de H y V (exactamente 2 y 2 para cuadrado)
conteo_hv([], 0, 0).
conteo_hv([S | R], H, V) :-
    (   segmento_horizontal(S) -> H1 = 1, V1 = 0
    ;   segmento_vertical(S)   -> H1 = 0, V1 = 1
    ;   H1 = 0, V1 = 0  
    ),
    conteo_hv(R, Ht, Vt),
    H is H1 + Ht,
    V is V1 + Vt.

% !===========================
% !Cuadrado (alineado a ejes)
% !===========================
% *Criterios:
% *1) 4 segmentos
% *2) polígono cerrado (incluye cadena interna OK)
% *3) todos horizontales o verticales
% *4) exactamente 2 horizontales y 2 verticales
% *5) longitudes iguales
% *6) alternancia h-v-h-v (o v-h-v-h) para evitar "L" dobles raras
cuadrado(Lsegs) :-
    proper_length(Lsegs, 4),
    poligono_cerrado(Lsegs),
    horizontal_o_vertical(Lsegs),
    conteo_hv(Lsegs, H, V),
    H =:= 2, V =:= 2,
    alternan(Lsegs),
    dist_iguales(Lsegs).
