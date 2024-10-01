function obs = sca_dat(res, tar)
ext = 0.5/3;
n_res = length(res);
obs = ones(n_res, 1)*tar;
[row, n_ocu_row] = cou_n_ocu(res);
thr = 3;
for i = 1:n_res
    res_i = res(i);
    log_i = row == res(i);
    clo_val = fin_clo_val_exc(res, res_i);
    if ~isempty(clo_val)
        per_dif = abs(com_per_cha(clo_val, res_i));
        if n_ocu_row(log_i) > 1 || per_dif < thr
            obs(i) = gen_ran_num(tar, ext);
        end
    end
end
end