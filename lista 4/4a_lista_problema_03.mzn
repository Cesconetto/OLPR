/* Academicos: Alexis Dezanet &  Cristiane Cesconetto 

>>>>> Guarda-Chuvaville <<<<<

A cidade tem um formato quadrado, porém suas dimensões ainda não foram calculadas devido ao seu constante crescimento. O governo da cidade sabe que a população não aguenta mais as constantes chuvas e como as eleições estão próximas eles pensaram em fazer uma cobertura para a cidade.

Para cobrir a cidade está sendo projetada uma estrutura retangular (repare que um quadrado é um retângulo de lados iguais), todavia, nem toda a população gostaria de ter suas residências cobertas, pois algumas pessoas cultivam jardins em suas casas ou pequenas plantações, e de certa forma gostam das chuvas e querem continuar com elas.
Pensando nisto, o governo realizou uma pesquisa com toda a cidade e para cada quadrante descobriram quantas pessoas gostariam da cobertura e quantas pessoas não gostariam, atribuindo numeros positivos para quem é a favor, e negativos para quem é contra.

Assim, um quadrante com o valor 5 mostra que lá existem 5 pessoas a favor da cobertura a mais do que o numero de pessoas que são contra a cobertura.
Escreva um programa para ajudar o governo de Chuvaville a construir a cobertura que agrade o maior numero de pessoas. Note que é possivel que nenhuma pessoa queira a cobertura, logo esta não seria construida (área igual a 0).

Entrada:
Tem-se n linhas com n colunas, as quais descrevem o quadrante ou matriz que representa a cidade.

Saída:
A saida será um unico inteiro por linha. Este valor representa uma soma de valores que estão dentro de uma área da cobertura, que maximize a satisfação da população, dada na matriz original. Quando n = 0 não escreva nada.

*/


include "globals.mzn";
int: digs = ceil(log(10.0,int2float(N))); % digits for output

int: N = 4;              %tamanho do vetor
var 1..N: x_begin ;      %Começo da janela hotizontal
var 1..N: x_end;         %Fim da janela
var 1..N: y_begin ;      %Começo da janela vertical
var 1..N: y_end;         %Fim da janela
var 1..N: x_size_window;     %tamanho max. da janela (variavel)
var 1..N: y_size_window;

array[1..N, 1..N] of var 0..1 : decision; %vetor de decisão

/*
array[1..N, 1..N] of int: Q =  [|-77, -44,  26, -69,  61, -26, -37, -23
                                |-100, 96,  23, -60, -54, -50,  66, -70
                                | 18, -59, -97, -10,  -2,  36, -25,  51
                                | 60,  72,  45,  73,  84,  11,  98,  60
                                | 67,  25,  91, -20,  99, -46,  10,  51
                                |-50,  85,  43, -52, -65,   9, -69,  53
                                |  2, -66, -56, -100, 22, -29,   4, -18
                                |-57, -51, -93,  79,  60, -94,  39, -21|]; */
/*
array[1..N, 1..N] of int: Q =  [|-12, -50
                                | 75,  25|];
*/

array[1..N, 1..N] of int: Q =  [|-68, -32, -25, -80
                                | 72,   5,  33,  84
                                |-47, -29,  -3, -59
                                |-87, -88,  66, -27|];


var int: total = sum(i, j in 1..N)(decision[i,j] * Q[i,j]);

% Garante que todas as linhas que devem ser cobertas terão exatamente a mesma quantidade de 1s
constraint
  forall(i in 1..N)(
    (sum(j in 1..N)(decision[i,j]) = (y_size_window))\/ (sum(j in 1..N)(decision[i,j]) = 0)
  );

% Garante que todas as colunas que devem ser cobertas terão exatamente a mesma quantidade de 1s
constraint
  forall(j in 1..N)(
    (sum(i in 1..N)(decision[i,j]) = (x_size_window)) \/ (sum(i in 1..N)(decision[i,j]) = 0)
  );

% Garante q o final das janelas serão maiores que o inicio
constraint
  (x_end >= x_begin) /\
  (y_end >= y_begin);

% Garante que enquanto estiver dentro da janela a variavel de decisão será 1
constraint
forall(i,j in 1..N)(
      (y_begin <= i /\ y_end >= i /\ x_begin <= j /\ x_end >= j) <-> decision[i,j] = 1
  );


solve maximize total;


%saida:

output["Total: " ++ show(total) ++ "\n \n"]++
      ["Array de Decisão: \n"] ++ [show_int(digs, decision[i,j]) ++ " " ++
        if j == N then "\n" else "" endif | i in 1..N, j in 1..N]++
      ["\nArray de entrada: \n"] ++ [show_int(digs, Q[i,j]) ++ " " ++
        if j == N then "\n" else "" endif | i in 1..N, j in 1..N];

/* Resultados obtidos:

>>> para n=2:

Total: 100
Array de Decisão:
0 0
1 1

Array de entrada:
-12 -50
75 25
----------


>>> para n=4:

Total: 194
Array de Decisão:
0 0 0 0
1 1 1 1
0 0 0 0
0 0 0 0

Array de entrada:
-68 -32 -25 -80
72 5 33 84
-47 -29 -3 -59
-87 -88 66 -27
----------


>>> para n=8:

Total: 780
Array de Decisão:
0 0 0 0 0 0 0 0
0 0 0 0 0 0 0 0
0 0 0 0 0 0 0 0
1 1 1 1 1 1 1 1
1 1 1 1 1 1 1 1
0 0 0 0 0 0 0 0
0 0 0 0 0 0 0 0
0 0 0 0 0 0 0 0

Array de entrada:
-77 -44 26 -69 61 -26 -37 -23
-100 96 23 -60 -54 -50 66 -70
18 -59 -97 -10 -2 36 -25 51
60 72 45 73 84 11 98 60
67 25 91 -20 99 -46 10 51
-50 85 43 -52 -65 9 -69 53
2 -66 -56 -100 22 -29 4 -18
-57 -51 -93 79 60 -94 39 -21
----------
*/
