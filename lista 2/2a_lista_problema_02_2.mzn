/*  Academicos: Alexis Dezanet  &  Cristiane Cesconetto

--> Dada uma variável X do tipo conjunto (set) com, domínio de inteiros de 1 a 10. Imprima os sub-conjuntos X com cardinalidade 3. A função cardinalidade e restrição é dada por card(X) = 3.
Saída esperada:{{1,2,3},{1,2,4},...}
*/

include "alldifferent.mzn";

% definição do dominio do conjunto
var set of 1..10: x;

%garantia que todos os elementos do conjunto serão diferentes
constraint alldifferent([x]);

%definição do numero de elementos dos subconjuntos
constraint card(x)==3;

solve satisfy;

%saída
output ["X: " ++ show(x) ++ "\n" ];

/*
Resultados ESPERADOS:
--> Todos os sub-conjuntos de X.

Obtido:
X: 1..3
----------
X: {1,2,4}
----------
X: {1,2,5}
----------
X: {1,2,6}
----------
X: {1,2,7}
----------
X: {1,2,8}
----------
X: {1,2,9}
----------
X: {1,2,10}
----------
X: {1,3,4}
----------
X: {1,3,5}
----------
X: {1,3,6}
----------
X: {1,3,7}
----------
X: {1,3,8}
----------
X: {1,3,9}
----------
X: {1,3,10}
----------
X: {1,4,5}
----------
X: {1,4,6}
----------
X: {1,4,7}
----------
X: {1,4,8}
----------
X: {1,4,9}
----------
X: {1,4,10}
----------
X: {1,5,6}
----------
X: {1,5,7}
----------
X: {1,5,8}
----------
X: {1,5,9}
----------
X: {1,5,10}
----------
X: {1,6,7}
----------
X: {1,6,8}
----------
X: {1,6,9}
----------
X: {1,6,10}
----------
X: {1,7,8}
----------
X: {1,7,9}
----------
X: {1,7,10}
----------
X: {1,8,9}
----------
X: {1,8,10}
----------
X: {1,9,10}
----------
X: 2..4
----------
X: {2,3,5}
----------
X: {2,3,6}
----------
X: {2,3,7}
----------
X: {2,3,8}
----------
X: {2,3,9}
----------
X: {2,3,10}
----------
X: {2,4,5}
----------
X: {2,4,6}
----------
X: {2,4,7}
----------
X: {2,4,8}
----------
X: {2,4,9}
----------
X: {2,4,10}
----------
X: {2,5,6}
----------
X: {2,5,7}
----------
X: {2,5,8}
----------
X: {2,5,9}
----------
X: {2,5,10}
----------
X: {2,6,7}
----------
X: {2,6,8}
----------
X: {2,6,9}
----------
X: {2,6,10}
----------
X: {2,7,8}
----------
X: {2,7,9}
----------
X: {2,7,10}
----------
X: {2,8,9}
----------
X: {2,8,10}
----------
X: {2,9,10}
----------
X: 3..5
----------
X: {3,4,6}
----------
X: {3,4,7}
----------
X: {3,4,8}
----------
X: {3,4,9}
----------
X: {3,4,10}
----------
X: {3,5,6}
----------
X: {3,5,7}
----------
X: {3,5,8}
----------
X: {3,5,9}
----------
X: {3,5,10}
----------
X: {3,6,7}
----------
X: {3,6,8}
----------
X: {3,6,9}
----------
X: {3,6,10}
----------
X: {3,7,8}
----------
X: {3,7,9}
----------
X: {3,7,10}
----------
X: {3,8,9}
----------
X: {3,8,10}
----------
X: {3,9,10}
----------
X: 4..6
----------
X: {4,5,7}
----------
X: {4,5,8}
----------
X: {4,5,9}
----------
X: {4,5,10}
----------
X: {4,6,7}
----------
X: {4,6,8}
----------
X: {4,6,9}
----------
X: {4,6,10}
----------
X: {4,7,8}
----------
X: {4,7,9}
----------
X: {4,7,10}
----------
X: {4,8,9}
----------
X: {4,8,10}
----------
X: {4,9,10}
----------
X: 5..7
----------
X: {5,6,8}
----------
X: {5,6,9}
----------
X: {5,6,10}
----------
X: {5,7,8}
----------
X: {5,7,9}
----------
X: {5,7,10}
----------
X: {5,8,9}
----------
X: {5,8,10}
----------
X: {5,9,10}
----------
X: 6..8
----------
X: {6,7,9}
----------
X: {6,7,10}
----------
X: {6,8,9}
----------
X: {6,8,10}
----------
X: {6,9,10}
----------
X: 7..9
----------
X: {7,8,10}
----------
X: {7,9,10}
----------
X: 8..10
----------
==========
*/
