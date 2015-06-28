/* Academicos: Alexis Dezanet &  Cristiane Cesconetto 

1. Resumo da descricao do problema: Porblema_03_A
--> Para cada uma das ilustrações (A até F) da figura 2 deve-se retornar as áreas válidas de pesquisa. O domínio da variável x vai de 0 a 8 e y segue de 0 a 7. Ou seja, são 6 pequenos problemas a serem implementados.
  As áreas hachuriadas da figura são pontos válidos da solução, logo, extremidades são contabilizadas como soluções válidas. */

%Dominio das variáveis
var 0..8 : x;
var 0..7 : y;

%Restrições para delimitar a área que faz parte da solução
constraint
x + y <= 4 \/
x + y >= 9 /\
y <= 6;

% Coordenadas (x,y) de cada ponto que faz parte da solução
solve satisfy ;
output["("++show(x)++", "++show(y)++")\n"] ;

/*
OBS.: As respostas abaixo são validas para o problema_03 de A até F (exceto para 5. Resultados ESPERADOS)

2. Descricao da (SUA) estratégia de solucão: Usou variáveis simples? Usou arrays 1-d? Usou arrays 2-d?  Usou sets? etc. 
--> Descrito nos comentarios do codigo.

3. Possíveis outras estratégias de solucão. Quais alternativas de solução? 
--> ND
  
4.  Modelagem e analise de complexidade
--> ND

5. Resultados ESPERADOS
--> Coordenadas dos pontos que fazem parte do dominio na imagem. (36 pontos na imagem A)

Obtido:
(0, 0)
(1, 0)
(2, 0)
(3, 0)
(4, 0)
(0, 1)
(1, 1)
(2, 1)
(3, 1)
(8, 1)
(0, 2)
(1, 2)
(2, 2)
(7, 2)
(8, 2)
(0, 3)
(1, 3)
(6, 3)
(7, 3)
(8, 3)
(0, 4)
(5, 4)
(6, 4)
(7, 4)
(8, 4)
(4, 5)
(5, 5)
(6, 5)
(7, 5)
(8, 5)
(3, 6)
(4, 6)
(5, 6)
(6, 6)
(7, 6)
(8, 6)

6. O código comentado a cada restrição ... tornando-o LEGIVEL
--> ~~~

7. Saída de VÁRIOS casos testes de I/O 
--> Cada uma das 6 imagens tem sua entrada com suas saídas respectivas representando as coordenadas (x,y) de cada ponto que faz parte da solução.

8. Faça uma rápida análise sobre os valores de saída. Era esperado? Sim? Não? PORQUÊ?
--> Sim, pois com as devidas restrições os pontos de coordenadas apresentados fazem parte da resposta esperada.

9. Possível melhorar esta implementação?
--> ND.

10.  Sugestões.
--> NA.
*/