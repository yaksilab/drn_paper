function plo_cro_res(res_cro_typ_cel_sti, cor_coe_cro, ind_cro_con, tit)
mar = 'o';
siz = 10;
nor_x = 0.7;
nor_y = 0.99;
fon_siz = 24;
n_dig = 2;
col = 'bgk';
sti = {'Light (\Delta(\DeltaF/F))', 'Shock (\Delta(\DeltaF/F))', 'Tap (\Delta(\DeltaF/F))'};
n_cro = length(cor_coe_cro);
fig
for i = 1:n_cro
    subplot(1, n_cro, i);
    sti_i = ind_cro_con(i, :);
    %
    con_one = sti_i(1);
    col_i = col(con_one);
    col_fac = col_i;
    con_two = sti_i(2);
    if ~isempty(res_cro_typ_cel_sti{i, 1})
        h = plo_sca_plo(res_cro_typ_cel_sti{i, 1}(:, 1), res_cro_typ_cel_sti{i, 1}(:, 2), mar, ...
            col_i, siz, col_fac);
        hold on
        col_i = col(con_two);
        col_fac = col_i;
        h = plo_sca_plo(res_cro_typ_cel_sti{i, 2}(:, 1), res_cro_typ_cel_sti{i, 2}(:, 2), mar, ...
            col_i, siz, col_fac);
    end
    pre_for_exp_lab(sti{con_one}, sti{con_two}, fon_siz)
    tx = wri(strcat("corr: ", string(round(cor_coe_cro(i), n_dig))), nor_x, nor_y, 'k', fon_siz);
end
[~, h] = suplabel(tit, 't', [.08 .08 .87 .9]);
set(h, 'FontSize', fon_siz + 3)
end