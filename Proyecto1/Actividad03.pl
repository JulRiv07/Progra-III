
%Hechos

conexion(vancouver, edmonton, 16).
conexion(vancouver, calgary, 13).
conexion(calgary, edmonton, 4).
conexion(edmonton, saskatoon, 12).
conexion(saskatoon, calgary, 9).
conexion(calgary, regina, 14).
conexion(regina, saskatoon, 7).
conexion(regina, winnipeg, 4).
conexion(saskatoon, winnipeg, 20).

%Reglas

hay_conexion(X, Y):-
    conexion(X, Y, _).

tiene_aristas(X):-
    conexion(X, _, _).

cuales_aristas(X, Y):-
    conexion(X, Y, _).

costo(X, Z, C):-
    conexion(X, Y, A), conexion(Y, Z, B), C is A + B.

costo_recursivo(X, Z, C):-
    conexion(X, Z, C).

costo_recursivo(X, Z, C):-
    conexion(X, Y, C1), costo_recursivo(Y, Z, C2), C is C1 + C2.