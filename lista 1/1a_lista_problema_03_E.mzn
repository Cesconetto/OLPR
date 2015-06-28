/* Academicos: Alexis Dezanet &  Cristiane Cesconetto 

1. Resumo da descricao do problema: Porblema_03_E
*/

%Dominio das variáveis
var 0..8 : x;
var 0..7 : y;

%Restrições para delimitar a área que faz parte da solução
constraint
x + y >= 5 /\
x + y <= 11 /\
abs(x-y) <= 3;

solve satisfy ;
% Coordenadas (x,y) de cada ponto que faz parte da solução
output["("++show(x)++", "++show(y)++")\n"];

/*
5. Resultados ESPERADOS
--> Coordenadas dos pontos que fazem parte do dominio na imagem. (25 pontos na imagem E)

Obtido:
(4, 1)
(3, 2)
(4, 2)
(5, 2)
(2, 3)
(3, 3)
(4, 3)
(5, 3)
(6, 3)
(1, 4)
(2, 4)
(3, 4)
(4, 4)
(5, 4)
(6, 4)
(7, 4)
(2, 5)
(3, 5)
(4, 5)
(5, 5)
(6, 5)
(3, 6)
(4, 6)
(5, 6)
(4, 7)
*/