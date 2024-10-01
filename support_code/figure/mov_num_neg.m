%function num_mov = mov_num_neg(vec)
function num_mov = mov_num_neg(vec, per)
%per = 20;

num = vec(2);
ran = diff(vec);
mov = ran*(per/100);
num_mov = num - mov;
end