function sav_fig_res(fil_pat_exp, fil_pat_roi_t, sti, fil_pat_fig, tit)
%SAV_FIG_DEL_DFF - One line description of what the function or script performs (H1 line)
%   Optional file header info (to give more details about the function than in the H1 line)
%   Optional file header info (to give more details about the function than in the H1 line)
%   Optional file header info (to give more details about the function than in the H1 line)
%
%   Syntax:
%       output = SAV_FIG_DEL_DFF(input1, input2)
%       output = SAV_FIG_DEL_DFF(input1, input2, input3)
%
%   Description:
%       SAV_FIG_DEL_DFF() - description
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
%   Date: 19-Jun-2019; Last revision: 19-Jun-2019
%
%   Copyright (c) 2019, Kadir Mutlu
%   All rights reserved.
bas_dur = 5;
res_dur = 10;
fon_siz = 24;

addpath(genpath('\\home.ansatt.ntnu.no\kadiram\Documents\MATLAB\figure'))
load(fil_pat_exp, 'sti_ons')
load(fil_pat_roi_t)

if ~ischar(sti)
    sti_ons = sti_ons(sti);
end

[res_neu, n_neu] = com_res_neu(dff, sti_ons, bas_dur, res_dur, tim);

res_map = nan*lab;
for i = 1:n_neu
    log_lab_i = lab == i;
    res_map(log_lab_i) = res_neu(i);
end

fig
imagesc(res_map)
colormap(jet)
col_bar = colorbar;
col_bar.Label.String = 'Response (z-score)';
title(tit)
pre_for_exp(fon_siz)
export_fig(fil_pat_fig)
end

function [res_neu, n_neu] = com_res_neu(dff, sti_ons, bas_dur, res_dur, tim)
addpath(genpath('\\home.ansatt.ntnu.no\kadiram\Documents\MATLAB\statistics'))
n_tri = length(sti_ons);
n_neu = size(dff, 1);
bas_dff_neu_tri = nan(n_neu, n_tri);
res_dff_neu_tri = nan(n_neu, n_tri);
for i = 1:n_tri
    sti_ons_i = sti_ons(i);
    bas_ons_i = sti_ons_i - bas_dur;
    log_bas_i = tim > bas_ons_i & tim <= sti_ons_i;
    log_res_i = tim > sti_ons_i & tim <= sti_ons_i + res_dur;
    bas_dff_neu_tri(:, i) = mean(dff(:, log_bas_i), 2);
    res_dff_neu_tri(:, i) = mean(dff(:, log_res_i), 2);
end

[mea_bas_dff_neu, sta_dev_bas_dff_neu] = com_sta(bas_dff_neu_tri, 2);
[mea_res_dff_neu, sta_dev_res_dff_neu] = com_sta(res_dff_neu_tri, 2);
res_neu = (mea_res_dff_neu - mea_bas_dff_neu)./sta_dev_bas_dff_neu;
end
