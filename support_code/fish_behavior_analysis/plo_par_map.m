function plo_par_map(bea_par_ani_tri, hax, y_lab, min_par, max_par)
col = 'red';
x_lab = 'Trial';
fon_siz = 20;
global mil
global y_lab_lat
if strcmp(y_lab, y_lab_lat)
    bea_par_ani_tri = bea_par_ani_tri/mil;
    min_par = min_par/mil;
    max_par = max_par/mil;
end
n_col_ori = 256;
n_col_tot = n_col_ori + 1;
bea_par_ani_tri(isnan(bea_par_ani_tri)) = max_par + (max_par - min_par)/(n_col_tot - 2);
ima = imagesc(bea_par_ani_tri);
yticks([])
map_mat = [cool(n_col_ori); [0 0 0]];
colormap(map_mat);
lin_wid = 2.25;
lin_sty = '-';
plo_ver_lin(12.5, hax, col, lin_wid, lin_sty)
plo_ver_lin(6.5, hax, col, lin_wid, lin_sty)
hax.XTick = [];
pre_for_exp_x_lab(x_lab, fon_siz)
enl_num(fon_siz)
[n_ani, n_tri] = size(bea_par_ani_tri);
x = 3.5;
global n_tri_con
nor_y = 1 + 0.060;
text(gca, x/n_tri, nor_y, 'Low', 'HorizontalAlignment', 'center', 'Units', 'normalized');
text(gca, (x + n_tri_con)/n_tri, nor_y, 'Moderate', 'HorizontalAlignment', 'center', 'Units', ...
    'normalized');
text(gca, (x + 2*n_tri_con)/n_tri, nor_y, 'High', 'HorizontalAlignment', 'center', 'Units', ...
    'normalized');
end