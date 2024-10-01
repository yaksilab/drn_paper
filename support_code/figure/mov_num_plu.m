function num_mov = mov_num_plu(vec)
per = 20;

num = vec(1);
ran = diff(vec);
mov = ran*(per/100);
num_mov = num + mov;
end