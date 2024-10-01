function [rel_cha_uni_tri_win, log_uni, fra, res_uni] = ext_log_uni(pha_win_len, log_uni, fie_num, ...
    rel_cha_uni_poi_tri)
con_fil = matfile('\\home.ansatt.ntnu.no\kadiram\Documents\MATLAB\con_esp.mat');
tim_fra = con_fil.tim_fra;
tim_fra = tim_fra.cal.eig.tri.dff;
n_win = 3;
log_fie_uni = getfield(log_uni, fie_num{:});
n_uni = length(log_fie_uni);
rel_cha_uni_tri_win = cell(n_uni, 1);

fie_one = fie_num{1};
log_uni.(fie_num{1}).res = false(n_uni, 1);
log_uni.(fie_num{1}).inh = false(n_uni, 1);
log_uni.(fie_num{1}).exc = false(n_uni, 1);
win_num_bas = con_fil.win_num_bas;
win_num_ear = con_fil.win_num_ear;
parfor uni = 1:n_uni
%for uni = 1:n_uni
    if log_fie_uni(uni)
        rel_cha_poi_tri = rel_cha_uni_poi_tri{uni};
        n_tri = size(rel_cha_poi_tri, 2);
        rel_cha_uni_tri_win{uni} = nan(n_tri, n_win);
        for tri = 1:n_tri
            rel_cha_uni_tri_win{uni}(tri, :) = com_ave_amp_uni_win(tim_fra, rel_cha_poi_tri(:, tri), ...
                pha_win_len);
        end
    end
end
disp('done parfor')
for uni = 1:n_uni
    if log_fie_uni(uni)
        [~, log_uni.(fie_one).res(uni)] = signrank(rel_cha_uni_tri_win{uni}(:, win_num_bas), ...
            rel_cha_uni_tri_win{uni}(:, win_num_ear));
        [~, log_uni.(fie_one).inh(uni)] = signrank(rel_cha_uni_tri_win{uni}(:, win_num_bas), ...
            rel_cha_uni_tri_win{uni}(:, win_num_ear),  'tail', 'right');
        [~, log_uni.(fie_one).exc(uni)] = signrank(rel_cha_uni_tri_win{uni}(:, win_num_bas), ...
            rel_cha_uni_tri_win{uni}(:, win_num_ear),  'tail', 'left');
    end
end
disp('almost done')
log_uni.(fie_num{1}).res = logical(log_uni.(fie_num{1}).res);
log_uni.(fie_num{1}).inh = logical(log_uni.(fie_num{1}).inh);
log_uni.(fie_num{1}).exc = logical(log_uni.(fie_num{1}).exc);
fra.inh = (sum(log_uni.(fie_num{1}).inh)/sum(log_uni.(fie_num{1}).all))*100;
fra.exc = (sum(log_uni.(fie_num{1}).exc)/sum(log_uni.(fie_num{1}).all))*100;
res_uni = ext_res_uni(log_uni.(fie_num{1}));% vector
end
