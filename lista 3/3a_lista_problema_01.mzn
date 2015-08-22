/* Academicos: Alexis Dezanet &  Cristiane Cesconetto

>>>>> Belos Palíndromos Crescentes <<<<<

Gerar apenas palíndromos ímpares válidos segundo as seguintes regras:
1. Um tamanho fixo |wawr|= 7;
2. Nenhuma repetição entre vizinhos é permitida, isto é: (xi != xi+1) ou (xi != xi-1);
3. Nenhuma repetição entre quase-vizinhos é permitida, isto é: (xi != xi+2) ou (xi != xi-2);
4. A sequência deve ser crescente em w e decrescente em wr, tal que (xi < xi+1) e (xi > xi-1);
5. O termo central a é único e é o supremo no palíndromo;
6. Alfabeto dos números válidos em xi : 1..5
A tarefa é gerar belos palíndromos ímpares de tamanho fixo (7) segundo as regras acima. */

int: n = 7;

%definição do array e do domínio do mesmo (regra 1 e 6)
array[1..n] of var 1..5 : A;

%Restrição das posições para que sejam um palindromo
constraint
	forall(i in 1..(n div 2))(
		A[i] == A[n - i + 1]
	);

%Restrição dos vizinhos de cada posição para que sejam diferentes (regra 2)
constraint
	forall(i in 1..((n div 2) -1))(
		A[i] != A[i+1]
     );

%Restrição dos quase-vizinhos de cada posição para que sejam diferentes (regra 3)
constraint
	forall(i in 1..((n div 2) -2))(
		A[i] != A[i+2]
	);

%Restrição do w que deve ser crescente (regra 4 e 5)
%Neste caso o termo central deve ser supremo, por isso entra nessa a regra vai até o termo a
constraint
	forall(i in 1..(n div 2))(
		A[i] < A[i+1]
	);

solve satisfy;

output[show(A)];

/*
Resultados ESPERADOS:
>>> Palindromos contidos no alfabeto A, com tamanho igual a 7, aonde o termo central sempre será supremo, w é crescente e wr decrescente.

Resultados Obtidos:
[1, 2, 3, 4, 3, 2, 1]
----------
[1, 2, 3, 5, 3, 2, 1]
----------
[1, 2, 4, 5, 4, 2, 1]
----------
[1, 3, 4, 5, 4, 3, 1]
----------
[2, 3, 4, 5, 4, 3, 2]
----------
==========
*/
