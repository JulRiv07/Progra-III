/* ==================================
    Árboles binarios y generaciones 
    ================================= 
*/

% Caso base: generación 0 -> raíces actuales 
generacion(0, [], []).
generacion(0, [nil|Resto], ListaNodos) :-           % nuevo caso: árbol vacío
    generacion(0, Resto, ListaNodos).
generacion(0, [t(_, Raiz, _)|Resto], [Raiz|ListaNodos]) :-
    generacion(0, Resto, ListaNodos).

% Caso recursivo: N > 0 -> bajar una generación 
generacion(_, [], []).
generacion(N, [nil|Resto], ListaFinal) :-           % nuevo caso: árbol vacío
    N > 0,
    generacion(N, Resto, ListaFinal).
generacion(N, [t(Izq, _, Der)|Resto], ListaFinal) :-
    N > 0,
    N1 is N - 1,
    agregar_subarboles(Izq, Der, SubArboles),
    generacion(N1, SubArboles, ListaHijos),
    generacion(N, Resto, ListaResto),
    append(ListaHijos, ListaResto, ListaFinal).

% Agrega los hijos que existan (evita nil) 
agregar_subarboles(nil, nil, []).
agregar_subarboles(Izq, nil, [Izq]) :- Izq \= nil.
agregar_subarboles(nil, Der, [Der]) :- Der \= nil.
agregar_subarboles(Izq, Der, [Izq, Der]) :-
    Izq \= nil, Der \= nil.

