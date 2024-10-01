function [bas_amp_tri_uni, cha_uni_poi_tri, rel_cha_uni_poi_tri, rel_cha_poi_uni, sam_uni_poi_tri, ...
    rel_cha_uni_poi, rel_cha_uni_tri_win, rel_cha_tri_win, log_uni, fra, rel_cha_uni_win, ...
    res_uni] = cal_rel_cha_uni_poi_tri(sam_poi_uni, bas_win_len, sti_ons_tri, sam_rat, isi, ...
    pha_win_len)
[n_poi.ses, n_uni] = size(sam_poi_uni);
[~, ~, tim_fra, ~, n_poi.tri, ~, ~, poi_ind_tri, ~, n_tri, poi_bas_ind_tri] = ext_poi_tri_lim(...
    bas_win_len, sti_ons_tri, sam_rat, n_poi.ses, isi);
bas_amp_tri_uni = nan(n_tri, n_uni);

rel_cha_uni_tri_win = cell(n_uni, 1);
n_win = 3;

sam_uni_poi_tri = cell(n_uni, 1);
cha_uni_poi_tri = cell(n_uni, 1);
rel_cha_uni_poi_tri = cell(n_uni, 1);
rel_cha_poi_uni = nan(n_poi.tri, n_uni);
n_fra = n_poi.tri;

parfor uni = 1:n_uni
%for uni = 1:n_uni
    sam_uni_poi_tri{uni} = nan(n_fra, n_tri);
    cha_uni_poi_tri{uni} = nan(n_fra, n_tri);
    rel_cha_uni_poi_tri{uni} = nan(n_fra, n_tri);

    rel_cha_uni_tri_win{uni} = nan(n_tri, n_win);

    for tri = 1:n_tri
        bas_amp = mean(sam_poi_uni(poi_bas_ind_tri(:, tri), uni));
        bas_amp_tri_uni(tri, uni) = bas_amp;

        sam_uni_poi_tri{uni}(:, tri) = sam_poi_uni(poi_ind_tri(:, tri), uni);
        cha_uni_poi_tri{uni}(:, tri) = sam_uni_poi_tri{uni}(:, tri) - bas_amp;
        rel_cha_uni_poi_tri{uni}(:, tri) = (cha_uni_poi_tri{uni}(:, tri)/bas_amp)*100;
        if bas_amp == 0 && sum(isnan(cha_uni_poi_tri{uni}(:, tri))) == 0
            rel_cha_uni_poi_tri{uni}(isnan(rel_cha_uni_poi_tri{uni}(:, tri)), tri) = 0;
        end

        rel_cha_uni_tri_win{uni}(tri, :) = com_ave_amp_uni_win(tim_fra, rel_cha_uni_poi_tri{uni}(:, ...
            tri), pha_win_len);% both borders not taken !!!
    end
    
    % tri ave !!!!!!!!!!!!!!
    rel_cha_poi_uni(:, uni) = mean(rel_cha_uni_poi_tri{uni}, 2);
end
rel_cha_uni_win = com_ave_amp_uni_win(tim_fra, rel_cha_poi_uni, pha_win_len);

rel_cha_uni_poi = rel_cha_poi_uni';

rel_cha_tri_win = mean(cat(3, rel_cha_uni_tri_win{:}), 3);

% inh exc
log_tri = true(n_tri, 1);
[log_uni, fra, res_uni] = ext_inh_exc(rel_cha_uni_tri_win, log_tri);
% res_fie_uni - .srt, .zsc etc.
end
