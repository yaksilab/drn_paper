function plo_fig_rat_tri(tim, rat_tim_sta_par, n, n_par, fon_siz, col_rat, col_lin, tit, x_lab, y_lab)
addpath(genpath('\\home.ansatt.ntnu.no\kadiram\Documents\MATLAB\figure'))
fig
for i = 1:n_par
    hax = subplot(1, n_par, i);
    plo_sha(tim, rat_tim_sta_par(:, 1, i), rat_tim_sta_par(:, 2, i), col_rat);
    plo_ver_lin(0, hax, col_lin)
    pre_for_exp_lab(x_lab, y_lab{i}, fon_siz)
end
[~, h] = suplabel([char(tit) ' n = ' sprintf('%d', n)],'t', [.08 .08 .87 .9]);
set(h,'FontSize',fon_siz + 3)
end