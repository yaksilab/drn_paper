function sav_dat_tai_loo(fun)
%SAV_FIG_LOO - One line description of what the function or script performs (H1 line)
%   Optional file header info (to give more details about the function than in the H1 line)
%   Optional file header info (to give more details about the function than in the H1 line)
%   Optional file header info (to give more details about the function than in the H1 line)
%
%   Syntax:
%       output = SAV_FIG_LOO(input1, input2)
%       output = SAV_FIG_LOO(input1, input2, input3)
%
%   Description:
%       SAV_FIG_LOO() - description
%    
%   Inputs:
%       input1 - Description
%       input2 - Description
%       input3 - Description
%
%   Outputs:
%       output1 - Description
%       output2 - Description
%
%   Examples: 
%       Line 1 of example
%       Line 2 of example
%       Line 3 of example
%
%   Other m-files required: none
%   Subfunctions: none
%   MAT-files required: none
%
%   See also: OTHER_FUNCTION_NAME1,  OTHER_FUNCTION_NAME2

%   Author: Kadir Mutlu
%   Address: Olav Kyrres gate 9, 7030 Trondheim, Norway
%   email: kadir.a.mutlu@ntnu.no
%   Website: https://www.ntnu.edu/kavli
%   Date: 02-Jul-2019; Last revision: 02-Jul-2019
%
%   Copyright (c) 2019, Kadir Mutlu
%   All rights reserved.
addpath('\\home.ansatt.ntnu.no\kadiram\Documents\MATLAB\Fish_video_analysis', '\\home.ansatt.ntnu.no\kadiram\Documents\MATLAB\Recording_functions')
[n_con, fil_pat_exp, fil_pat_tai, fil_pat_dat, fra_rat, chr, mph_tai, fra_mpp, bin_siz, sta_dev, col_tai, col_tai_sig, col_dru, col, fon_siz, tit, fil_pat_ima,...
    sub_tit] = fun();
tai_bea = cell(n_con, 1);
tai_sig = cell(n_con, 1);
rat_tim = cell(n_con, 1);
tai_rat = cell(n_con, 1);
dru_ons = cell(n_con, 1);
sti_ons = cell(n_con, 1);
sta_tim = cell(n_con, 1);
end_tim = cell(n_con, 1);
fra_tim = cell(n_con, 1);
for i = 1:n_con
    disp(i)
   [tai_bea{i}, tai_sig{i}, rat_tim{i}, tai_rat{i}, dru_ons{i}, sti_ons{i}, sta_tim{i}, end_tim{i}, fra_tim{i}] = ...
    ext_tai_dat(fil_pat_ima(i), fil_pat_tai(i), chr, fil_pat_exp{i}, fra_rat{i}, mph_tai, fra_mpp, bin_siz, sta_dev);
end
save(fil_pat_dat, 'tai_bea', 'tai_sig', 'rat_tim', 'tai_rat', 'dru_ons', 'sti_ons', 'sta_tim', 'end_tim', 'col_tai', 'col_tai_sig', 'col_dru', 'col', ...
    'fon_siz', 'tit', 'n_con', 'fra_tim', 'sub_tit')
end

function [tai_bea, tai_sig, rat_tim, tai_rat, dru_ons, sti_ons, sta_tim, end_tim, fra_tim] = ...
    ext_tai_dat(fil_pat_ima, fil_pat_tai, chr, fil_pat_exp, fra_rat, mph_tai, fra_mpp, bin_siz, sta_dev)
[fra_tim, ~, tai_ang, ~, dru_ons, sti_ons, sta_tim, end_tim] = ext_fis_dat(fil_pat_ima, fil_pat_tai, chr, fil_pat_exp);
% extract behavioral events
[tai_bea, tai_sig] = ext_tai_bea(fra_rat, fra_tim, tai_ang, mph_tai, fra_mpp);
% rate
[rat_tim, tai_rat] = com_rat(sta_tim, end_tim, tai_bea, bin_siz, sta_dev, fra_tim);
end
