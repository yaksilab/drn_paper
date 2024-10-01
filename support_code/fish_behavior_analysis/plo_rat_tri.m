function plo_rat_tri(tim, rat_tim_sta_par, fon_siz, col_rat, col_lin, y_lab, ind_par, hax)
plo_sha(tim, rat_tim_sta_par(:, 1, ind_par), rat_tim_sta_par(:, 2, ind_par), col_rat);
global lin_wid
plo_ver_lin(0, hax, col_lin, lin_wid)
pre_for_exp(fon_siz)
ylabel(y_lab{ind_par})
end