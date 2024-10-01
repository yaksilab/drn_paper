function plo_log_map(bea_par_ani_tri, hax)
col = 'red';
x_lab = 'Trial';
fon_siz = 20;
log_ani_tri = ~isnan(bea_par_ani_tri);
ima = imagesc(log_ani_tri);
yticks([])
map_mat = [0 0 0; 0 1 0];
colormap(map_mat);
lin_wid = 2.25;
plo_ver_lin(12.5, hax, col, lin_wid, '-')
plo_ver_lin(6.5, hax, col, lin_wid, '-')
hax.XTick = [];
pre_for_exp_x_lab(x_lab, fon_siz)
enl_num(fon_siz)
nor_y = 1 + 0.045;
text(gca, 0.14, nor_y, 'Low', 'Units', 'normalized');
text(gca, 0.45, nor_y, 'Moderate', 'Units', 'normalized');
text(gca, 0.80, nor_y, 'High', 'Units', 'normalized');
end