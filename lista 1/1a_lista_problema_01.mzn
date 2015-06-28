/*  Academicos: Alexis Dezanet &  Cristiane Cesconetto 

1. Resumo da descricao do problema: 
--> As Garrafas de Vinho do prof Claudio
  Em um semestre no passado, na disciplina de OLPR, sobraram 3 alunos para contar história do curso. Para recompensar os 3 alunos que restaram, o professor Claudio foi a sua adega de vinho e constatou que:
1. Haviam 7 garrafas de vinho cheias;
2. Outras 7 garrafas de vinho pela metade;
3. Outras 7 garrafas de vinho vazias.
Como o prof Claudio resolveu dar estas 21 garrafas aos 3 alunos, mas iria distribuı-las com restrições tais que:
1. Todos os 3 alunos receberiam 7 garrafas cada um;
2. Todos os 3 alunos receberiam a mesma quantidade de vinho ao final.
Com quais 7 garrafas cada aluno ficou?
*/

%Dominio (Cada variável está representado a relação aluno x garrafa)
var 0..7 : x1 ;
var 0..7 : x2 ;
var 0..7 : x3 ;

var 0..7 : y1 ;
var 0..7 : y2 ;
var 0..7 : y3 ;

var 0..7 : z1 ;
var 0..7 : z2 ;
var 0..7 : z3 ;

%Atribuição dos pesos de cada garrafa, (2-> cheia, 1->metade, 0->vazia)
%garantindo que todos os alunos receberão 7 litros
constraint
2*x1 + y1 + 0*z1 = 7 /\
2*x2 + y2 + 0*z2 = 7 /\
2*x3 + y3 + 0*z3 = 7 ;

%Garante a distribuição de Garrafas
%Cada linha representa um aluno, ou seja, cada aluno receberá x garrafas 
% cheias, y pela metade e z vazias, totalizando 7 garrafas para cada aluno
constraint
x1 + y1 + z1 = 7 /\
x2 + y2 + z2 = 7 /\
x3 + y3 + z3 = 7 ;

%Garantia que todas as garrafas serão distribuidas
constraint 
x1 + x2 + x3 = 7 /\
y1 + y2 + y3 = 7 /\
z1 + z2 + z3 = 7 ;

%Saída
solve satisfy ;
output["Aluno 1 receberá:"++show(x1)++" garrafas cheias, "++show(y1)++" pela metade, e "++show(z1)++" vazias\n" ++
       "Aluno 2 receberá:"++show(x2)++" garrafas cheias, "++show(y2)++" pela metade, e "++show(z2)++" vazias\n" ++
       "Aluno 3 receberá:"++show(x3)++" garrafas cheias, "++show(y3)++" pela metade, e "++show(z3)++" vazias\n"];

/* 
2. Descricao da estratégia de solucão: 
--> Descrito nos comentarios do codigo.

3. Possíveis outras estratégias de solucão. Quais alternativas de solução? 
--> Simplex
  
4.  Modelagem e analise de complexidade
--> Facil

5. Resultados ESPERADOS
--> Quantidade de cada tipo de garrafas por aluno.

Obtido:
Aluno 1 receberá:3 garrafas cheias, 1 pela metade, e 3 vazias
Aluno 2 receberá:3 garrafas cheias, 1 pela metade, e 3 vazias
Aluno 3 receberá:1 garrafas cheias, 5 pela metade, e 1 vazias
----------
Aluno 1 receberá:3 garrafas cheias, 1 pela metade, e 3 vazias
Aluno 2 receberá:2 garrafas cheias, 3 pela metade, e 2 vazias
Aluno 3 receberá:2 garrafas cheias, 3 pela metade, e 2 vazias
----------
Aluno 1 receberá:2 garrafas cheias, 3 pela metade, e 2 vazias
Aluno 2 receberá:3 garrafas cheias, 1 pela metade, e 3 vazias
Aluno 3 receberá:2 garrafas cheias, 3 pela metade, e 2 vazias
----------
Aluno 1 receberá:3 garrafas cheias, 1 pela metade, e 3 vazias
Aluno 2 receberá:1 garrafas cheias, 5 pela metade, e 1 vazias
Aluno 3 receberá:3 garrafas cheias, 1 pela metade, e 3 vazias
----------
Aluno 1 receberá:2 garrafas cheias, 3 pela metade, e 2 vazias
Aluno 2 receberá:2 garrafas cheias, 3 pela metade, e 2 vazias
Aluno 3 receberá:3 garrafas cheias, 1 pela metade, e 3 vazias
----------
Aluno 1 receberá:1 garrafas cheias, 5 pela metade, e 1 vazias
Aluno 2 receberá:3 garrafas cheias, 1 pela metade, e 3 vazias
Aluno 3 receberá:3 garrafas cheias, 1 pela metade, e 3 vazias

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
--> Presentear os alunos de 2015/01 também.
*/