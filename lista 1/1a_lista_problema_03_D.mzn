/* Academicos: Alexis Dezanet  &  Cristiane Cesconetto 

1. Resumo da descricao do problema: Porblema_03_D
*/

%Dominio das variáveis
var 0..8 : x;
var 0..7 : y;

%Restrições para delimitar a área que faz parte da solução
constraint
y <= 6 /\
x mod 2 == 1 /\
y mod 2 == 1 \/
x mod 2 == 0 /\
y mod 2 == 0;

solve satisfy ;
% Coordenadas (x,y) de cada ponto que faz parte da solução
output["("++show(x)++", "++show(y)++")\n"];

/*
5. Resultados ESPERADOS
--> Coordenadas dos pontos que fazem parte do dominio na imagem. (Neste caso todos os pontos serão mostrados, pois são necessarios 4 pontos para limitar cada celula preta, sendo esses pontos em comum com os limitantes das brancas.

*/