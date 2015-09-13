/* Academicos: Alexis Dezanet &  Cristiane Cesconetto 

>>>>> Escolhendo K-quadrados <<<<<

O prof Claudio quando anda de cabeça baixa, está olhando para os quadrados das calçadas, placas de concreto, cerâmicas, etc, e imaginando que problema interessante daria para formular para seus alunos.
Recentemente, pensou que sobre que cada placa na calçada, tivesse associado um numero, algo como sua área, peso, etc. Assim, de um longo caminho linear se passa por N-quadrados;
A ideia seria escolher um K quadrados, que totalizassem a maior soma (ou a menor) a partir destes N. Assim, K <= N.
Faça um programa que a partir de uma lista de N valores, escolha K valores contiguos que deêm a maior soma. Claro, um problema de sub-seqUÊncia de tamanho FIxo atÉ o momento.
*/

include "globals.mzn";

int: N = 7;            %tamanho do vetor
var 1..N: begin ;      %Começo da janela
var 1..N: end;         %Fim da janela
int: size_window = 2;   % tamanho max. da janela


array[1 .. N] of int: Q = [3, 4, 5, -9, -6, -2, 0];   %vetor de entrada
array[1..N] of var 0..1 : x_decision;                 %vetor de decisão

var int: total = sum( i in 1..N ) ( x_decision[i]  *  Q[i] );

constraint
   sum(j in 1..N) (x_decision[j]) = (size_window);


constraint
    (end >= begin)
;

constraint
    forall(j, i  in 1..N) (
      ((begin <= j /\ end >= j) <-> x_decision[j]  = 1)
);

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

>>>
Sequencia: [4, 5]
Inicio: 2      Fim: 3      Soma: 9
Tamanho da janela: 2
Vetor de entrada: [3, 4, 5, -9, -6, -2, 0]
Vetor de decisão: [0, 1, 1, 0, 0, 0, 0]
----------
==========
*/
