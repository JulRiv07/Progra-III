%Hechos.
nodo(vancouver).
nodo(edmonton).
nodo(saskatoon).
nodo(winnipeg).
nodo(regina).
nodo(calgary).

conexion(vancouver, edmonton, 16).
conexion(vancouver, calgary, 13).
conexion(calgary, edmonton, 4).
conexion(calgary, regina, 14).
conexion(regina, winnipeg, 4).
conexion(regina, saskatoon, 7).
conexion(saskatoon, winnipeg, 20).
conexion(saskatoon, calgary, 9).
conexion(edmonton, saskatoon, 12).

hay_conexion(X,Y):-
    conexion(X, Y, _).

tiene_aristas(X):-
    conexion(X, _, _).

cuales_aristas_tiene(X, A):-
    conexion(X, A, _).

%calculo de costo, solo sirve para nodos que esten a 2 conexiones de distancia.
costo(X, Z, C):-
    conexion(X, Y, A), conexion(Y, Z, B), C is A + B.

%caso base
costo_recursivo(X,Y,C):- conexion(X, Y, C). 

%caso recursivo
costo_recursivo(X,Y,C):- 
    conexion(X, Z, C1), costo_recursivo(Z, Y, C2), C is C1 + C2.