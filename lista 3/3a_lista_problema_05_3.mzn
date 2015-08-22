array[1..3] of int: Dx = [2,3,4];
array[1..3] of int: Dy = [3,4,5];

var bool: var_of_return;

function var bool: dif_sim(array[1..3] of int: dx, array[1..3] of int: dy) = 
  let{
    var bool: var_return;
    constraint 
      forall (i,j in 1..3 where i < j) (dx[i] <= dy[j]);
  } in var_return;

constraint
  var_of_return = dif_sim(Dx, Dy);

solve satisfy;

output[show(var_of_return)];