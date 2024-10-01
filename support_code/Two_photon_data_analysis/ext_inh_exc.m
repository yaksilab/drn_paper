function [log_uni, fra, res_uni] = ext_inh_exc(rel_cha_uni_tri_win, log_tri)
% log_uni.all = , !!!! only
n_uni = length(rel_cha_uni_tri_win);
con_fil = matfile('\\home.ansatt.ntnu.no\kadiram\Documents\MATLAB\con_esp.mat');
win_num_bas = con_fil.win_num_bas;
win_num_ear = con_fil.win_num_ear;

log_uni.srt.inh = false(n_uni, 1);
log_uni.srt.exc = false(n_uni, 1);
log_uni.srt.non = false(n_uni, 1);
% parfor not possible
if sum(log_tri) > 0
    for uni = 1:n_uni
        rel_cha_tri_win = rel_cha_uni_tri_win{uni};
        %
        [~, log_uni.srt.inh(uni, 1)] = signrank(rel_cha_tri_win(log_tri, win_num_bas), ...
            rel_cha_tri_win(log_tri, win_num_ear),  'tail', 'right');
        [~, log_uni.srt.exc(uni, 1)] = signrank(rel_cha_tri_win(log_tri, win_num_bas), ...
            rel_cha_tri_win(log_tri, win_num_ear),  'tail', 'left');
        log_uni.srt.non(uni, 1) = ~log_uni.srt.inh(uni, 1) & ...
            ~log_uni.srt.exc(uni, 1);
    end
end
log_uni.srt.inh = logical(log_uni.srt.inh);
log_uni.srt.exc = logical(log_uni.srt.exc);
log_uni.srt.non = logical(log_uni.srt.non);
fra.srt.inh = (sum(log_uni.srt.inh)/n_uni)*100;
fra.srt.exc = (sum(log_uni.srt.exc)/n_uni)*100;
fra.srt.non = (sum(log_uni.srt.non)/n_uni)*100;
res_uni.srt = ext_res_uni(log_uni.srt);% vector output, takes all units (not only gaba),
% assigns 2 (unresponsive) as 'default'.
end
