function [fra_tim, tai_ang, tai_ang_spe, dru_ons, sti_ons, sta_tim, end_tim] = ext_tai_dat(fil_pat_ima, fil_pat_tai, fil_pat_exp)
load(fil_pat_exp, 'dru_ons', 'sti_ons', 'sta_tim', 'end_tim');

ord = 1;

addpath('\\home.ansatt.ntnu.no\kadiram\Documents\MATLAB\Signal_processing', '\\home.ansatt.ntnu.no\kadiram\Documents\MATLAB\figure', ...
    '\\home.ansatt.ntnu.no\kadiram\Documents\MATLAB\statistics', '\\home.ansatt.ntnu.no\kadiram\Documents\MATLAB\Experiments')
fra_tim = ext_fra(fil_pat_ima);
load(fil_pat_tai)

%
n_fra = length(fra_tim);
tai_ang_one = fish_angle1(1:n_fra);
tai_ang_two = fish_angle2(1:n_fra);
tai_ang_sum = tai_ang_one + tai_ang_two;

% cutting
fra_ind = fra_tim > sta_tim & fra_tim <= end_tim;
fra_tim = fra_tim(fra_ind);
tai_ang_raw = tai_ang_sum(fra_ind);
%
tai_ang = smo(tai_ang_raw);
% speed
tai_ang_spe = dif_sig(tai_ang_raw, ord)./dif_sig(fra_tim, ord);
end

function fra_tim = ext_fra(fil_pat_ima)
load(fil_pat_ima, 'timestamps')
fra_tim = com_fra_tim(timestamps);    
end
