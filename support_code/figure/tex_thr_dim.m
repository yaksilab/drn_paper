function tex_thr_dim(cor_coe_cro, fon_siz, lim_axi_dir, varargin)

%%%%%%%%%
cor_coe_cro = cor_coe_cro([3; 2; 1]);
%%%%%%%%%%%

n_cro = 3;
n_dig = 2;

if ~isempty(varargin)
    cor_coe_sem_cro = varargin{1};
    str_cro = [strcat("corr: ", string(round(cor_coe_cro(1), n_dig)), " (±", string(round(cor_coe_sem_cro(1), n_dig)), ")"); ...
        strcat("corr: ", string(round(cor_coe_cro(2), n_dig)), " (±", string(round(cor_coe_sem_cro(2), n_dig)), ")"); ...
    strcat("corr: ", string(round(cor_coe_cro(3), n_dig)), " (±", string(round(cor_coe_sem_cro(3), n_dig)), ")")];
else
    str_cro = [strcat("corr: ", string(round(cor_coe_cro(1), n_dig))); strcat("corr: ", string(round(cor_coe_cro(2), n_dig))); ...
    strcat("corr: ", string(round(cor_coe_cro(3), n_dig)))];
end

%per_one = 70;
per = 20;

x_cro = [mov_num_neg(lim_axi_dir(1, :), per); mean(lim_axi_dir(1, :)); lim_axi_dir(1, 1) + 1];
y_cro = [mov_num_neg(lim_axi_dir(2, :), per); lim_axi_dir(2, 1); ...
    mov_num_neg(lim_axi_dir(2, :), per)];
z_cro = [lim_axi_dir(3, 1) + 1; mov_num_neg(lim_axi_dir(3, :), per); ...
    mov_num_neg(lim_axi_dir(3, :), per)];

for i = 1:n_cro
    textscatter3(x_cro(i), y_cro(i), z_cro(i), str_cro(i), 'FontSize', fon_siz)
end

end