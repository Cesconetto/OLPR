/* Academicos: Alexis Dezanet &  Cristiane Cesconetto 

>>>>> Escolhendo K de M-quadrados <<<<<

Escolher um K quadrados, que totalizassem a maior soma a partir destes N. Assim, K <= N.
Faça um programa que a partir de uma lista de N valores, escolha K valores contiguos que deêm a maior soma.
O valor K é desconhecido. Ou seja, K variável. Assim, 1 <= K <= N.
*/

include "globals.mzn";

int: N = 7;            %tamanho do vetor
var 1..N: begin ;      %Começo da janela
var 1..N: end;         %Fim da janela
var 1..N: size_window;     %tamanho max. da janela (variavel)

array[1 .. N] of int: Q = [3, 4, 5, -9, -6, -42, 100];   %vetor de entrada
array[1..N] of var 0..1 : x_decision;                 %vetor de entrada

var int: total = sum( i in 1..N ) ( x_decision[i]  *  Q[i] );

constraint
   sum(j in 1..N) (x_decision[j]) = (size_window);

constraint
   (end >= begin);

constraint
    forall(j, i  in 1..N) (
      ((begin <= j /\ end >= j) <-> x_decision[j]  = 1));


constraint size_window < N;

solve maximize (total);


%saida:
output [
  "Sequencia: " ++ show([Q[i] | i in 1..N where fix(x_decision[i]) = 1]) ++ "\n" ++
  "Inicio: " ++ show(begin) ++ "      Fim: " ++ show(end) ++ "      Soma: " ++ show(total) ++"\n"++
  "Tamanho da janela: " ++ show(size_window) ++ "\n" ++
  "Vetor de entrada: " ++ show(Q) ++ "\n" ++
  "Vetor de decisão: " ++ show( x_decision ) ++ "\n"
];

/* Resultados obtidos:

>>> 1º caso:
Sequencia: [100]
Inicio: 7      Fim: 7      Soma: 100
Tamanho da janela: 1
Vetor de entrada: [3, 4, 5, -9, -6, -42, 100]
Vetor de decisão: [0, 0, 0, 0, 0, 0, 1]
----------
==========

>>> 2º caso:
Sequencia: [3, 4, 5]
Inicio: 1      Fim: 3      Soma: 12
Tamanho da janela: 3
Vetor de entrada: [3, 4, 5, -9, -6, -2, 0]
Vetor de decisão: [1, 1, 1, 0, 0, 0, 0]
----------
==========

*/
