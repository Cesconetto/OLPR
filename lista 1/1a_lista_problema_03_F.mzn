/* Academicos: Alexis Dezanet &  Cristiane Cesconetto 

1. Resumo da descricao do problema: Porblema_03_F
*/

%Dominio das variáveis
var 0..8 : x;
var 0..7 : y;

%Restrições para delimitar a área que faz parte da solução
constraint
x + y >= 9 /\
x + y <= 4 \/
abs(x-y) >= 3 /\
y <= 6;
% abs(x-(3*y/2)) >= 3; o certo seria está, porém tivemos dificuldades com variaveis float

solve satisfy ;
% Coordenadas (x,y) de cada ponto que faz parte da solução
output["("++show(x)++", "++show(y)++")\n"];

/*
5. Resultados ESPERADOS
--> Coordenadas dos pontos que fazem parte do dominio na imagem. (31 pontos na imagem F)
Nem todos os pontos estão de acordo com a imagem pois utilizamos abs(x-y) >= 3 
quando deveria ser abs(x-(3*y/2)) >= 3

Obtido:
(3, 0)
(4, 0)
(5, 0)
(6, 0)
(7, 0)
(8, 0)
(4, 1)
(5, 1)
(6, 1)
(7, 1)
(8, 1)
(5, 2)
(6, 2)
(7, 2)
(8, 2)
(0, 3)
(6, 3)
(7, 3)
(8, 3)
(1, 4)
(7, 4)
(0, 4)
(8, 4)
(0, 5)
(1, 5)
(2, 5)
(8, 5)
(0, 6)
(1, 6)
(2, 6)
(3, 6)
*/