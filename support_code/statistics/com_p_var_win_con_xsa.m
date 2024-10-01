function p_var_win_con_xsa = com_p_var_win_con_xsa(var_win_con_sam_uni)
[n_win, n_con] = size(var_win_con_sam_uni);
p_var_win_con_xsa.rst = cell(n_win, n_con);
p_var_win_con_xsa.lme = cell(n_win, n_con);
for k = 1:n_win
    for i = 1:n_con
        p_xsa = com_p_xsa(var_win_con_sam_uni{k, i});% for 2 groups !!!
        p_var_win_con_xsa.rst{k, i} = p_xsa.rst;
        p_var_win_con_xsa.lme{k, i} = p_xsa.lme;
    end
end
end
