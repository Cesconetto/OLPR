/* Academicos: Alexis Dezanet &  Cristiane Cesconetto 

>>>>> Listando os Pares <<<<<

Escreva um programa que liste todas as duplas de inteiros (m, n), sendo que m é par, n é impar, a diferença absoluta entre m e n é menor do que 3 e 0 <= m <= 10. */

var 0..10 : M;
var int: N;

constraint
	M mod 2 == 0 /\ %Garante que M será par
	N mod 2 != 0 /\ %Garante que N será impar
	abs(N-M) < 3; %Garante que a diferetença nunca será maior que 3

solve satisfy;

output["(" ++ show(M) ++ ", " ++ show(N) ++")"];

/* Resultados ESPERADOS:
>>> Dica da resposta: são 12 duplas no total.
Como apenas M tem restrição de dominio, N pode assumir valores negativos

Resultados Obtidos:
(0, -1)
----------
(2, 1)
----------
(4, 3)
----------
(6, 5)
----------
(8, 7)
----------
(10, 9)
----------
(0, 1)
----------
(2, 3)
----------
(4, 5)
----------
(6, 7)
----------
(8, 9)
----------
(10, 11)
----------
==========
*/
