/* Academicos: Alexis Dezanet &  Cristiane Cesconetto 

1. Resumo da descricao do problema: Porblema_03_C
*/

%Dominio das variáveis
var 0..8 : x;
var 0..7 : y;

%Restrições para delimitar a área que faz parte da solução
constraint
(x <= 2 /\ (y <= 2 \/ y >= 4 /\ y <= 6)) \/  % primeira coluna
(x <= 6  /\ x >= 4 /\ (y <= 2 \/ y >= 4 /\ y <= 6)) \/  %terceira coluna:
(x <= 4 /\ x >= 2 /\ y >= 2 /\ y <= 4);  %segunda coluna:

solve satisfy ;
% Coordenadas (x,y) de cada ponto que faz parte da solução
output["("++show(x)++", "++show(y)++")\n"];

/*
5. Resultados ESPERADOS
--> Coordenadas dos pontos que fazem parte do dominio na imagem. (41 pontos na imagem C)

Obtido:
(2, 3)
(3, 3)
(4, 3)
(0, 0)
(1, 0)
(0, 1)
(1, 1)
(2, 0)
(2, 1)
(4, 0)
(4, 1)
(5, 0)
(6, 0)
(5, 1)
(6, 1)
(0, 2)
(1, 2)
(2, 2)
(3, 2)
(4, 2)
(5, 2)
(6, 2)
(0, 4)
(1, 4)
(2, 4)
(3, 4)
(4, 4)
(5, 4)
(6, 4)
(0, 5)
(1, 5)
(2, 5)
(4, 5)
(5, 5)
(6, 5)
(0, 6)
(1, 6)
(2, 6)
(4, 6)
(5, 6)
(6, 6)
*/