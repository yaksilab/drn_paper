function add_x_tic(x_tic)
xticks(x_tic)
x_tic_min = x_tic/60;
n_tic = length(x_tic_min);
x_tic_str = string(x_tic_min);
x_tic_cha = cell(n_tic, 1);
for i = 1:n_tic
    x_tic_cha{i} = char(x_tic_str(i));
end
xticklabels(x_tic_cha)
end