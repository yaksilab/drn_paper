function plo_his_bea_lat_con(bea_lat_con, fon_siz, con)
x_lab = 'Tailbeat latency (ms)';
y_lab = 'Frequency';
mil = 1000;
n_tri_con = size(bea_lat_con, 1);
n_sub_plo = length(con);
fig
for i = 1:n_sub_plo
    bea_lat_i = bea_lat_con(:, i)*mil;
    subplot(1, n_sub_plo, i)
    histogram(bea_lat_i)
    if i == 1
        pre_for_exp_lab(x_lab, y_lab, fon_siz)
    else
        pre_for_exp_x_lab(x_lab, fon_siz)
    end
    wri_tit([convertStringsToChars(con(i)) '; n = ' sprintf('%d', n_tri_con)], fon_siz)
end
end