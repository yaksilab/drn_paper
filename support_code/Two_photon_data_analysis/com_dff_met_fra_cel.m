function [dff_fix_fra_cel, dff_sli_fra_cel] = com_dff_met_fra_cel(f_fra_cel, fra_rat, sta_tim, end_tim)
% sta end used for fixed
% fixed baseline
if sta_tim == 0
    F0_start = 1;
else
    F0_start = round(fra_rat*sta_tim);
end
if end_tim == inf
    F0_end = length(f_fra_cel);
else
    F0_end = round(fra_rat*end_tim);
end
bas_cel = mean(f_fra_cel(F0_start:F0_end, :), 1, "omitnan");
[n_fra, n_cel] = size(f_fra_cel);
bas_fix_fra_cel = repmat(bas_cel, n_fra, 1);
dff_fix_fra_cel = ((f_fra_cel - bas_fix_fra_cel)./bas_fix_fra_cel)*100;
%%%%%%%%%%%%%%%%% sliding window
MovingWdw = 80;
wdw = round(fra_rat*MovingWdw);
bas_sli_fra_cel = nan(n_fra, n_cel);
parfor i = 1:n_cel
    bas_sli_fra_i = bas_sli_fra_cel(:, i);
    f_fra_i = f_fra_cel(:, i);
    for j = wdw + 1:n_fra - wdw % sliding wdw. Start at i = wdw+1 and compute before.
        bas_sli_fra_i(j) = mean(f_fra_i(j - wdw:j + wdw), "omitnan");
    end
    bas_sli_fra_i(1:wdw) = bas_sli_fra_i(wdw + 1);
    bas_sli_fra_i(n_fra - wdw + 1:n_fra) = bas_sli_fra_i(n_fra - wdw);
    % fill up
    % the gap left by removing the 2 windows, with first and last elements
    bas_sli_fra_cel(:, i) = runline(bas_sli_fra_i, wdw, 1); % linear regression
    % to smooth
end
dff_sli_fra_cel = com_dff_fra_cel(f_fra_cel, bas_sli_fra_cel);
end
