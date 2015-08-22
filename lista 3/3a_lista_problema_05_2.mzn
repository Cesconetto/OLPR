/* Academicos: Alexis Dezanet &  Cristiane Cesconetto 

>>>>> ... <<<<<

*/

int: c = 10;
int: d = 100;


var set of 1..d: A;
var set of 1..d: B;
var set of 1..d: final_result;

constraint
  card(A) == c /\
  card(B) == c;

function var set of 1..d: dif_sim(var set of 1..d: A, var set of 1..d: B) =
  let{
    var set of 1..d: diffsim = ((A union B) diff (A intersect B));
  } in diffsim;

constraint
  final_result = dif_sim(A,B);

solve satisfy;

output[show(final_result)];
