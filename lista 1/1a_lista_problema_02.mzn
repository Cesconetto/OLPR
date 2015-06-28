/*  Academicos: Alexis Dezanet &  Cristiane Cesconetto 

1. Resumo da descricao do problema: 
--> O Quartel
  Seja um quartel no formato de um quadrado, onde há torres de vigias nas extremidades de cada canto e no meio de cada quadra. O coronel que recentemente assumiu este comando está com uma dificuldade. Ele quer saber se é possível vigiar cada face inteira do quartel com 5 soldados por face/lado. Contudo, ele dispõe de um contingente de apenas 12 soldados.
  Ordenar e configurar o numero de soldados necessários em cada torre/base de vigia. Outra restrição é que em cada torre/base de vigia, pode ter no máximo 3 soldados. Cada base de vigia encontram-se nos 8 pontos cardeais.
*/

var 0..12 : sold;
var 0..3 : no; %torres x soldados
var 0..3 : n;
var 0..3 : ne;
var 0..3 : o;
var 0..3 : l;
var 0..3 : so;
var 0..3 : s;
var 0..3 : se;

%Restrições para delimitar a solução
%Cada lado deve ter 5 soldados e existem 4 lados
constraint
no + n + ne = 5 /\
so + s + se = 5 /\
no + o + so = 5 /\
ne + l + se = 5;

%função objetivo à ser minimizada
constraint
sold = no + n + ne + o + l + so + s + se;

solve minimize sold ;
% Soldados em cada Torre
output["Soldados: \nNO:"++show(no)++", N:"++show(n)++", NE:"++show(ne)++"\nO:"++show(o)++", L:"++show(l)++"\nSO:"++show(so)++", S:"++show(s)++", SE:"++show(se)++"\n"];


/* 
2. Descricao da estratégia de solucão: 
--> Descrito nos comentarios do codigo.

3. Possíveis outras estratégias de solucão. Quais alternativas de solução? 
--> Determinar o minimo de soldados por torre.
  
4.  Modelagem e analise de complexidade
--> Simples

5. Resultados ESPERADOS
--> Assumindo que não existe um minimo de soldados por torre, podemos minimizar a função e utilizar menos soldados. No caso, nas melhores respostas seriam utilizados apenas 10 soldados.
Como existem difersas formas de distribuir os soldados podemos ter diversas soluções.

Obtido:

Soldados: 
NO:3, N:0, NE:2
O:2, L:0
SO:0, S:2, SE:3
----------
Soldados: 
NO:3, N:0, NE:2
O:1, L:0
SO:1, S:1, SE:3
----------
Soldados: 
NO:3, N:0, NE:2
O:0, L:0
SO:2, S:0, SE:3
----------

6. O código comentado a cada restrição ... tornando-o LEGIVEL
--> ~~~

7. Saída de VÁRIOS casos testes de I/O
--> Problema com unica entrada, porém com várias possibilidades de resposta.
  Todas elas são mostradas

8. Faça uma rápida análise sobre os valores de saída. Era esperado? Sim? Não? PORQUÊ?
--> Sim, porque são possiveis diversas soluções para as variáveis.

9. Possível melhorar esta implementação?
--> ND.

10.  Sugestões.
--> NA.
*/