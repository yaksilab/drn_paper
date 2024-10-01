function plo_fig_loo(fun)
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
y_lab = 'Time (s)';
addpath(genpath('\\home.ansatt.ntnu.no\kadiram\Documents\MATLAB\figure'))
[fil_pat_dat, fil_pat_eth] = fun();
load(fil_pat_dat)
%fig
for i = 1:n_con
    dru_ons_i = dru_ons{i};
    sti_ons_i = sti_ons{i};
    hax = subplot(n_con, 1, i);
    plo_loo_ras_sig_rat(tai_bea{i}, tai_sig{i}, rat_tim{i}, tai_rat{i}, sta_tim{i}, end_tim{i}, col_tai, col_tai_sig, fon_siz, fra_tim{i})
    if dru_ons_i > 0
        plo_ver_lin(dru_ons_i, hax, col_dru)
    end
    plo_ver_lin(sti_ons_i, hax, col)
    wri_tit(sub_tit(i), fon_siz)
    if i == n_con
        lab_x_axi(y_lab, fon_siz)
    end
end
[~, h3]=suplabel(tit, 't');
set(h3,'FontSize',fon_siz)
end
