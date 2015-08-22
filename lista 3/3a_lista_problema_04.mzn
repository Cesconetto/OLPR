/* Academicos: Alexis Dezanet &  Cristiane Cesconetto 

>>>>> Jantar Confuso <<<<<

Dizem num recanto remoto que Quixeramobim/CE, que objetos com 6 vértices trazem sorte, prosperidade e paz.
Neste intuito o prof. Sá comprou uma mesa hexagonal para sua casa e convidou para o jantar de inauguração dois outros casais: Sr. e Sra. Xavier e Sr. e Sra. Yukow.
Após alguns goles iniciais no coktail entrada, algumas afinidades se reforçaram e outros ficaram exaltados quanto há uma repulsa. O ponto é descobrir quem está sentado em cada lugar da mesa sabendo que:
1. A Sra. Sá sentou à direita do Sr. Sá
2. Com exceção dos anfitriões, nenhuma esposa sentou ao lado do marido
3. O Sr. Xavier gostou muito do Sr. Yukow, e estes sentaram lado a lado
4. O Sr. Yukow sentou no lugar mais afastado do Sr. Sá (lado oposto)
5. A Sra. Xavier não sentou ao lado da Sr. Sá
Faça um programa que descubra em qual posição está cada uma das pessoas.*/

/* Considere a mesa com as seguintes posições:

  _1_
6/   \2
5\___/3
   4

*/
include "globals.mzn";

var 1 .. 6 : S; % Sr.  Sá
var 1 .. 6 : Sa; % Sra. Sá
var 1 .. 6 : X; % Sr.  Xavier
var 1 .. 6 : Xa; % Sra. Xavier
var 1 .. 6 : Y; % Sr.  Yukow
var 1 .. 6 : Ya; % Sra. Yukow

%Garante que a Sra. Sá estará a direita do Sr. Sá
constraint
	Sa mod 6 == (S + 1) mod 6;

%Garante que sra. Xavier e sra. Yukow não sentaram ao lado dos maridos
constraint
	Xa mod 6 != (X + 1) mod 6 /\
	X mod 6 != (Xa + 1) mod 6 /\
	Ya mod 6 != (Y + 1) mod 6 /\
	Y mod 6 != (Ya + 1) mod 6;

%Garante que o Sr. Xavier e Sr. Yukow sentaram lado a lado
constraint
	(Y mod 6 == (X + 1) mod 6) \/
	(X mod 6 == (Y + 1) mod 6);

%Garante que Sr. Yukow sentou no lugar mais afastado do Sr. Sá (lado oposto)
constraint
	abs(Y - S) == 3;

%Garante que a Sra. Xavier não sentou ao lado da Sra. Sá
constraint
	Sa mod 6 != (Xa + 1) mod 6 /\
  Xa mod 6 != (Sa + 1) mod 6;

% Garante que duas pessoas não podem sentar no mesmo lugar
constraint
	alldifferent([S,Sa,X,Xa,Y,Ya]);

solve satisfy;

output[
	"Sr. Sá:      " ++ show(S) ++ "\n",
	"Sra. Sá:     " ++ show(Sa) ++ "\n",
	"Sr. Xavier:  " ++ show(X) ++ "\n",
	"Sr. Yukow:   " ++ show(Y) ++ "\n",
	"Sra. Xavier: " ++ show(Xa) ++ "\n",
	"Sra. Yukow:  " ++ show(Ya) ++ "\n",
];

/* Resultados ESPERADOS:
>>> A mesa deverá ter a seguinte configuração ao final:

   _S_
Ya/   \Sa
Xa\___/X
    Y

Resultados obtidos:
Sr. Sá:      4
Sra. Sá:     5
Sr. Xavier:  6
Sr. Yukow:   1
Sra. Xavier: 2
Sra. Yukow:  3
----------
Sr. Sá:      5
Sra. Sá:     6
Sr. Xavier:  1
Sr. Yukow:   2
Sra. Xavier: 3
Sra. Yukow:  4
----------
Sr. Sá:      6
Sra. Sá:     1
Sr. Xavier:  2
Sr. Yukow:   3
Sra. Xavier: 4
Sra. Yukow:  5
----------
Sr. Sá:      1
Sra. Sá:     2
Sr. Xavier:  3
Sr. Yukow:   4
Sra. Xavier: 5
Sra. Yukow:  6
----------
Sr. Sá:      2
Sra. Sá:     3
Sr. Xavier:  4
Sr. Yukow:   5
Sra. Xavier: 6
Sra. Yukow:  1
----------
Sr. Sá:      3
Sra. Sá:     4
Sr. Xavier:  5
Sr. Yukow:   6
Sra. Xavier: 1
Sra. Yukow:  2
----------
==========
*/
