/* Academicos: Alexis Dezanet &  Cristiane Cesconetto

>>>>> A Colheita do Casal <<<<<

Quando Rachel e seu namorado (na época), Ian, trabalharam num kibutz em Israel colhendo laranjas, era dado para cada um, um balaio vazio. Eles deveriam escolher uma fileira de pés de laranja, e quando começassem em um ponto, teriam que continuar dali para frente. Contudo, para evitar as tentações das laranjas sua porção na fileira dos laranjais tinha que ser afastado de no mínimo duas laranjeiras.
Assim, voce deverá alocar duas áreas contínuas de laranjais para eles colherem o maior número de laranjas. Sabe-se que cada balaio tem a capacidade de k = 100.
Seu problema é definir onde começam os pes de laranja que Rachel e Ian devem escolher contíguamente, tal que o balaio de cada um não exceda 100. Pes de laranja com valores
negativos representam laranjas podres, não necessariamente precisam ser computados.
Veja o exemplo abaixo:

Pes de laranja: 1 2 3 4 5 6 7 8 9
Qtidade de laranja: 10 30 30 40 105 60 17 80 9

Repita o experimento para k = 10 na sequencia abaixo:
0 -2 6 5 4 9 8 10 2 -1 1 3 7 -5 -3 -4

*/

include "globals.mzn";

int: PL = 9; %%%Pes de laranja
var 1..PL: begin_ian ; %%%Começo da janela do Ian
var 1..PL: end_ian; %%%Fim da janela do Ian
var 1..PL: begin_rachel;
var 1..PL: end_rachel;
var 1..PL: size_window_ian; %%% tamanho max. da janela de Ian
var 1..PL: size_window_rachel; %%% tamanho max. da janela de Rachel

%vetor com a quantidade de laranja em cada pe
array[1 .. PL] of int: Q = [10, 30, 30, 40, 105, 60, 17, 80, 9];

array[1..PL] of var 0..1 : r_decision;
array[1..PL] of var 0..1 : i_decision;

var int: total_ian = sum( i in 1..PL ) ( i_decision[i]  *  Q[i] );
var int: total_rachel = sum( i in 1..PL ) ( r_decision[i]  *  Q[i] );

constraint
   sum(j in 1..PL) (i_decision[j]) = (size_window_ian);
constraint
   sum(j in 1..PL) (r_decision[j]) = (size_window_rachel);


constraint
    (end_ian >= begin_ian) /\
    (end_rachel >= begin_rachel) /\
    (begin_rachel > (end_ian + 2)) /\
    (end_ian - begin_ian = size_window_ian -1) /\
    (end_rachel - begin_rachel = size_window_rachel -1)
;

constraint
    forall(j, i  in 1..PL) (
      ((begin_ian <= j /\ end_ian >= j) <-> i_decision[j]  = 1)
);

constraint
    forall(j, i  in 1..PL) (
      ((begin_rachel <= i /\ end_rachel >= i) <-> r_decision[i] = 1)
);

constraint total_ian <=100 /\ total_rachel <=100;

constraint size_window_ian + size_window_rachel < PL;

solve maximize (total_ian + total_rachel);


%saida:
output [
  "Total de laranjas colhidas:     " ++ show(total_ian + total_rachel) ++"\n"++
  "Laranjas no balaio do Ian:      " ++ show(total_ian) ++ "\n" ++
  "Laranjas no balaio da Rachel:   " ++ show(total_rachel) ++ "\n" ++ "\n" ++

  "Ian colhe      " ++ show(size_window_ian ) ++
  " pés de laranja, começando em " ++ show(begin_ian) ++ " até " ++ show(end_ian) ++
  ", colhendo a sequencia: " ++ show([Q[i] | i in 1..PL where fix(i_decision[i]) = 1]) ++ "\n" ++

  "Rachel colhe   " ++ show(size_window_rachel ) ++
  " pés de laranja, começando em " ++ show(begin_rachel) ++ " até " ++ show(end_rachel) ++
  ", colhendo a sequencia: " ++ show([Q[i] | i in 1..PL where fix(r_decision[i]) = 1]) ++ "\n" ++ "\n" ++

  "Vetor com as quantidade de Laranjas: " ++ show(Q) ++ "\n" ++
  "Vetor de decisão de Ian:             " ++ show( i_decision ) ++ "\n" ++
  "Vetor de decisão de Rachel:          " ++ show( r_decision ) ++ "\n"
];

/* Resultados obtidos:

>>> 1º caso:

Total de laranjas colhidas:     197
Laranjas no balaio do Ian:      100
Laranjas no balaio da Rachel:   97

Ian colhe      3 pés de laranja, começando em 2 até 4, colhendo a sequencia: [30, 30, 40]
Rachel colhe   2 pés de laranja, começando em 7 até 8, colhendo a sequencia: [17, 80]

Vetor com as quantidade de Laranjas: [10, 30, 30, 40, 105, 60, 17, 80, 9]
Vetor de decisão de Ian:             [0, 1, 1, 1, 0, 0, 0, 0, 0]
Vetor de decisão de Rachel:          [0, 0, 0, 0, 0, 0, 1, 1, 0]
----------
==========

>>> 2º caso:

Total de laranjas colhidas:     54
Laranjas no balaio do Ian:      44
Laranjas no balaio da Rachel:   10

Ian colhe      7 pés de laranja, começando em 3 até 9, colhendo a sequencia: [6, 5, 4, 9, 8, 10, 2]
Rachel colhe   2 pés de laranja, começando em 12 até 13, colhendo a sequencia: [3, 7]

Vetor com as quantidade de Laranjas: [0, -2, 6, 5, 4, 9, 8, 10, 2, -1, 1, 3, 7, -5, -3, -4]
Vetor de decisão de Ian:             [0, 0, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0]
Vetor de decisão de Rachel:          [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0]
----------
==========
*/
