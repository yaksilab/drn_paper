function plo_cro_res_thr(res_thr_cro_typ_cel_sti, cor_coe_thr_cro, ind_cro_con, tit)
n_thr = 3;

mar = 'o';
siz = 10;
nor_x = 0.7;
nor_y = 0.99;
fon_siz = 24;
n_dig = 2;
col = 'bgk';
sti = {'Light (\Delta(\DeltaF/F))', 'Shock (\Delta(\DeltaF/F))', 'Tap (\Delta(\DeltaF/F))'};
n_cro = 3;
n_plo = n_thr*n_cro;
hax = [];
fig
for i = 1:n_plo
    h = subplot(n_thr, n_cro, i);
    thr_num_i = ceil(i/n_cro);
    cro_i = mod(i, n_cro);
    if cro_i == 0
        cro_i = n_cro;
    end
    
    sti_i = ind_cro_con(cro_i, :);
    %
    con_one = sti_i(1);
    con_two = sti_i(2);
    res_cro_typ_cel_sti_i = res_thr_cro_typ_cel_sti{thr_num_i};
    if ~isempty(res_cro_typ_cel_sti_i{cro_i, 1})
        col_i = col(con_one);
        col_fac = col_i;
        plo_sca_plo(res_cro_typ_cel_sti_i{cro_i, 1}(:, 1), res_cro_typ_cel_sti_i{cro_i, 1}(:, 2), mar, col_i, siz, col_fac);
        hold on
        col_i = col(con_two);
        col_fac = col_i;
        plo_sca_plo(res_cro_typ_cel_sti_i{cro_i, 2}(:, 1), res_cro_typ_cel_sti_i{cro_i, 2}(:, 2), mar, col_i, siz, col_fac);
        hold on
        col_i = 'm';
        col_fac = col_i;
        plo_sca_plo(res_cro_typ_cel_sti_i{cro_i, 3}(:, 1), res_cro_typ_cel_sti_i{cro_i, 3}(:, 2), mar, col_i, siz, col_fac);
        lim = axis;
        min_lim = min(lim);
        max_lim = max(lim);
        axis([min_lim max_lim min_lim max_lim])
        axis square
    end
    hax = [hax h];
    pre_for_exp_lab(sti{con_one}, sti{con_two}, fon_siz)
    tx = wri(strcat("corr: ", string(round(cor_coe_thr_cro{thr_num_i}(cro_i), n_dig))), nor_x, nor_y, 'k', fon_siz);
end
linkaxes(hax, 'xy')
[~, h] = suplabel(tit, 't', [.08 .08 .87 .9]);
set(h, 'FontSize', fon_siz + 3)
end