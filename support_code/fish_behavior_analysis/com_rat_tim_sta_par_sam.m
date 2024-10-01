function [rat_tim_sta_par, tim, n, n_par, tri_rat_tim_fis_par] = com_rat_tim_sta_par_sam(rat_tim, rat_tim_fis_par, sti_ons, bas_dur, res_dur)
addpath \\home.ansatt.ntnu.no\kadiram\Documents\MATLAB\statistics
[tri_rat_tim_fis_par, n_tim, n_par, tim] = com_tri_rat_tim_fis_par(rat_tim, rat_tim_fis_par, sti_ons, bas_dur, res_dur);
rat_tim_sta_par = nan(n_tim, 2, n_par);
[rat_tim_sta_par(:, 1, :), ~, rat_tim_sta_par(:, 2, :), n] = com_sta(tri_rat_tim_fis_par, 2);
end

function [tri_rat_tim_fis_par, n_tim, n_par, tim, n_fis] = com_tri_rat_tim_fis_par(rat_tim, rat_tim_fis_par, sti_ons, bas_dur, res_dur)
bin_siz = rat_tim(2) - rat_tim(1);
tim = -bas_dur:bin_siz:res_dur;
tim = tim';
n_tim = length(tim);
[~, n_fis, n_par] = size(rat_tim_fis_par);
n_tri = length(sti_ons);
tri_rat_tim_fis_par = nan(n_tim, n_fis, n_par);
for i = 1:n_fis
    for j = 1:n_tri
        sti_ons_j = sti_ons(j);
        tim_sta_j = sti_ons_j - bas_dur;
        tim_end_j = sti_ons_j + res_dur;
        log_tim_j = rat_tim >= tim_sta_j & rat_tim <= tim_end_j;
        rat_fis_tim_tri_par_i = rat_tim_fis_par(log_tim_j, i, :);
    end
    tri_rat_tim_fis_par(:, i, :) = mean(rat_fis_tim_tri_par_i, 2);
end
end