/* Academicos: Aléxis Dezanet  &  Cristiane Cesconetto  

--> Criar um vetor de tamanho 20, com domínio de 1 a 100. Faça uma (ou mais) restrição tal que a soma de dois elementos adjacentes no vetor forneça o elemento seguinte. Nenhum elemento do domínio pode ser repetido mais que 3 vezes. Exemplo de uma atribuição inicial válida ao vetor:
1 2 3 5 8 13 ....
*/

%definição do vetor e do dominio do mesmo
%o dominio não pode ser definido como 100 pois os valores de um vetor de tamanho 20 são maiores que tal
array [0..19] of var 0..10000: fibo;

constraint fibo[0] = 1 /\ %atribui o valor 0 à primeira posição do vetor
           fibo[1] = 1 /\ %atribui o valor 1 à segunda posição do vetor
forall(i in 2..19)
      (fibo[i] = fibo[i-1] + fibo[i-2]); %realiza a operação de soma das 2 posições anteriores e coloca na atual posição

solve satisfy;

%saída
output [show(fibo)];

/*
Resultados ESPERADOS:
--> Vetor com a Sequência de Fibonacci

Obtido:
[1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, 144, 233, 377, 610, 987, 1597, 2584, 4181, 6765]
----------
*/
