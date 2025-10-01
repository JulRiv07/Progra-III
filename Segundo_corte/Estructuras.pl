
conectados(S1,S2):-
    S1=..[segmento,_,P2S1],
    S2=..[segmento, P2S1,_].

%? El operador =.. convierte una estructura en una lista y viceversa
%? conectados(segmento(,P2S1), segmento(P2S1,)).
%? Obligamos mediante validacion implicita que:
%? conectados recibe una estructura llamada "segmento" donde el segundo punto del segmento 1 sea igual
%? al primer punto del sefmento 2

%! Paso base
poligono([S1|S2]):- %! Validacion: recibe una lista de dos segmentos
    conectados(S1,S2).

poligono([S1|[S2|Tai]]):-
    %? Descompone cabeza y cola, cabeza: S2 y cola es otra lista donde: [Cabeza|Cola], Cabeza: S2
    conectados(S1,S2),
    append([S2], Tail, Laux),  %? Concatena dos listas en una tercera
    %! S2 es un elemento, no una lista. con [Sn] mandamos al termino como una lista de un elemento.
    poligono(Laux).





