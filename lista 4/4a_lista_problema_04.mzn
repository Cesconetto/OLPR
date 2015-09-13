/* Academicos: Alexis Dezanet &  Cristiane Cesconetto

>>>>> As Cadeiras no Cinema <<<<<

No cinema, todos sabem como é desagradavel sentar atras de uma pessoa mais alta que voce. Ou seja, ou voce tem que entortar a cabeça ou se levantar para assistir o filme. O primeiro cinema de Quixeramobim tinha apenas 20 lugares, em duas fileiras de 10. Contudo, o pessoal esperto pensou: vamos colocar as duas leiras desencontradas.
Assim, o pessoal da fileira X vai ver o filme entre duas pessoas da fileira Y.

Mesmo assim, alguns problemas vão permanecer. Caso o pessoal da fileira Y tenha um ombro muito alto, alguns baixinhos da fileira X, continuariam a ver ombros e não mais cabeças.

A ideia de por baixinhos na fileira Y numa sequencia, é imediata, mas não é boa; pois varios são pares de namorados. Em geral, um alto, em geral o homem, um baixo, a mulher. Logo, os bancos serão ocupados por um alto e um baixo alternadamente.
Tarefas:
1. Faça um programa que resolva este problema para essas duas fileiras de 10 pessoas em cada uma. As alturas das pessoas seguem do dominio de 150 a 200, medida em centimetros.
2. Procure otimizar de tal modo que os casais baixinhos, fiquem na frente (fileira Y).
3. Num segundo momento, reduza o dominio, digamos de 150 a 170. Teremos soluções boas?
4. A saida s~ao estes dois vetores de tamanho 10 cada um, instanciados no dominio acima.

*/


include "alldifferent.mzn";

int : n = 10;
int : altura_max = 170;

array[1..10] of var 150..altura_max : X;
array[1..10] of var 150..altura_max : Y;

%todas devem ter alturas diferentes
constraint
  alldifferent(X) /\
  alldifferent(Y) /\
  forall(i in 1..10, j in 1..10)(
    X[i] != Y[j]
);
% O homem deve ser mais alto e senta na cadeira i, enquanto a mulher senta na i+1
% Considerando que o homem deve ser pelo menos 5 cm mais alto do que a mulher
constraint

  forall(i in 1..10 where (i mod 2 == 1))(
    (X[i] >= (X[i+1])+5) /\
    (Y[i] >= (Y[i+1])+5)
);

% As pessoas da fileira X devem ser ao menos 25 cm mais altas do que as pessoas da fileira Y (para que o ombro não atrapalhe)
% A altura da cabeça em media é 21 cm... mais a altura do pescoço consideramos 25
constraint
  (X[1] - Y[1] > 25) /\
  forall(i in 2..10)(
    (X[i] - Y[i-1] > 25) /\
    (X[i] - Y[i] > 25)
);

solve satisfy;

output[ "   " ++ show(X)++
        "\n" ++ show(Y)
];

/* Resultados obtidos:

>>> Para a altura variando de 150 a 200 cm:
   [190, 185, 189, 184, 188, 183, 187, 182, 186, 181]
[159, 154, 158, 153, 157, 152, 156, 151, 155, 150]
----------
   [191, 185, 189, 184, 188, 183, 187, 182, 186, 181]
[159, 154, 158, 153, 157, 152, 156, 151, 155, 150]
----------
   [192, 185, 189, 184, 188, 183, 187, 182, 186, 181]
[159, 154, 158, 153, 157, 152, 156, 151, 155, 150]
----------
   [194, 185, 189, 184, 188, 183, 187, 182, 186, 181]
[159, 154, 158, 153, 157, 152, 156, 151, 155, 150]
----------
   [198, 185, 189, 184, 188, 183, 187, 182, 186, 181]
[159, 154, 158, 153, 157, 152, 156, 151, 155, 150]
----------
...
----------
   [193, 185, 194, 184, 188, 183, 187, 182, 186, 181]
[159, 154, 158, 153, 157, 152, 156, 151, 155, 150]
----------
   [195, 185, 194, 184, 188, 183, 187, 182, 186, 181]
[159, 154, 158, 153, 157, 152, 156, 151, 155, 150]
----------


>>> Para a altura variando de 150 a 190 cm:

   [190, 185, 189, 184, 188, 183, 187, 182, 186, 181]
[159, 154, 158, 153, 157, 152, 156, 151, 155, 150]
----------
   [189, 184, 190, 185, 188, 183, 187, 182, 186, 181]
[158, 153, 159, 154, 157, 152, 156, 151, 155, 150]
----------
   [190, 185, 188, 183, 189, 184, 187, 182, 186, 181]
[159, 154, 157, 152, 158, 153, 156, 151, 155, 150]
----------
   [188, 183, 190, 185, 189, 184, 187, 182, 186, 181]
[157, 152, 159, 154, 158, 153, 156, 151, 155, 150]
----------
...
----------
   [187, 182, 188, 183, 186, 181, 189, 184, 190, 185]
[156, 151, 157, 152, 155, 150, 158, 153, 159, 154]
----------
   [189, 184, 188, 183, 186, 181, 187, 182, 190, 185]
[158, 153, 157, 152, 155, 150, 156, 151, 159, 154]
----------


>>> Para a altura variando de 150 a 170 cm:
=====UNSATISFIABLE=====

Não é possivel satisfazer a condição que as alturas de x devem ser em media 25 cm maiores do que as alturas em Y.
Esses valores foram assumidos pela dupla... É possivel alterar os parametros e obter respostas nesse dominio.

*/
