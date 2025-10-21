/*
================================
    Bicicleta básica en Prolog
================================ 
*/

% Hojas 
pieza_basica(rueda_delantera).
pieza_basica(rueda_trasera).
pieza_basica(cuadro).
pieza_basica(sillin).
pieza_basica(manubrio).
pieza_basica(cadena).
pieza_basica(pedal).
pieza_basica(freno_delantero).
pieza_basica(freno_trasero).

% Piezas compuestas 
pieza_compuesta(transmision, [cadena, pedal]).
pieza_compuesta(sistema_frenos, [freno_delantero, freno_trasero]).
pieza_compuesta(bicicleta, [rueda_delantera, rueda_trasera, cuadro, sillin, manubrio, transmision, sistema_frenos]).


% Reglas 

% componentes
componentes(Pieza, ListaFinal) :-
    buscar_componentes(Pieza, ListaTemporal),
    eliminar_repetidos(ListaTemporal, ListaFinal).

% Piezas basicas 
buscar_componentes(Pieza, [Pieza]) :-
    pieza_basica(Pieza), !.

% Piezas compuestas 
buscar_componentes(Pieza, Lista) :-
    pieza_compuesta(Pieza, Partes), !,
    buscar_en_lista(Partes, Lista).

% Regla por si no esta definida 
buscar_componentes(Pieza, [Pieza]) :-
    \+ pieza_basica(Pieza),
    \+ pieza_compuesta(Pieza, _).

% Recorrer subpiezas
buscar_en_lista([], []).
buscar_en_lista([Primera|Resto], Todo) :-
    buscar_componentes(Primera, L1),
    buscar_en_lista(Resto, L2),
    append(L1, L2, Todo).

% Eliminar repetidos y ordenar 
eliminar_repetidos(Lista, ListaLimpia) :-
    sort(Lista, ListaLimpia).