function dis_ran = ext_dis_ran(per)
global col_sca_six
n_lev = col_sca_six(2) + 1;
n_lev_del = round(n_lev.*(per/100));
dis_ran = [col_sca_six(1) col_sca_six(2) - n_lev_del];
end
