/* Academicos: Alexis Dezanet &  Cristiane Cesconetto 

1. Resumo da descricao do problema: Porblema_03_B
*/

%Dominio das variáveis
var 0..8 : x;
var 0..7 : y;

%Restrições para delimitar a área que faz parte da solução
constraint
x <= 4 /\ 
y <= 3 \/ 
x >= 4 /\ 
y >= 3 /\
y <= 6;

solve satisfy ;

% Coordenadas (x,y) de cada ponto que faz parte da solução
output["("++show(x)++", "++show(y)++")\n"];

/*
5. Resultados ESPERADOS
--> Coordenadas dos pontos que fazem parte do dominio na imagem. (39 pontos na imagem B)

Obtido:
(0, 0)
(1, 0)
(2, 0)
(3, 0)
(0, 1)
(1, 1)
(2, 1)
(3, 1)
(4, 0)
(4, 1)
(0, 2)
(1, 2)
(2, 2)
(3, 2)
(4, 2)
(5, 3)
(6, 3)
(7, 3)
(8, 3)
(0, 3)
(1, 3)
(2, 3)
(3, 3)
(4, 3)
(5, 4)
(6, 4)
(7, 4)
(8, 4)
(5, 5)
(6, 5)
(7, 5)
(8, 5)
(5, 6)
(6, 6)
(7, 6)
(8, 6)
(4, 4)
(4, 5)
(4, 6)
*/