function dff_fra_uni = com_dff_fra_uni(piv_fra_uni, fra_rat, win_len)
%%%%%%%%%%%%%%%%% sliding window
[n_fra, n_cel] = size(piv_fra_uni);
wdw = round(fra_rat*win_len);
bas_sli_fra_cel = nan(n_fra, n_cel);
parfor i = 1:n_cel
    bas_sli_fra_i = bas_sli_fra_cel(:, i);
    f_fra_i = piv_fra_uni(:, i);
    for j = wdw + 1:n_fra - wdw % sliding wdw. Start at i = wdw+1 and compute before.
        bas_sli_fra_i(j) = mean(f_fra_i(j - wdw:j + wdw));
    end
    bas_sli_fra_i(1:wdw) = bas_sli_fra_i(wdw + 1);
    bas_sli_fra_i(n_fra - wdw + 1:n_fra) = bas_sli_fra_i(n_fra - wdw);
    % fill up
    % the gap left by removing the 2 windows, with first and last elements
    bas_sli_fra_cel(:, i) = runline(bas_sli_fra_i, wdw, 1); % linear regression
    % to smooth
end
dff_fra_uni = com_dff_fra_cel(piv_fra_uni, bas_sli_fra_cel);
end
