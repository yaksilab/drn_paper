function sav_fig_dff(fil_pat_exp, fil_pat_roi_t, fil_pat_fig, tit)
%SAV_FIG_DFF - One line description of what the function or script performs (H1 line)
%   Optional file header info (to give more details about the function than in the H1 line)
%   Optional file header info (to give more details about the function than in the H1 line)
%   Optional file header info (to give more details about the function than in the H1 line)
%
%   Syntax:
%       output = SAV_FIG_DFF(input1, input2)
%       output = SAV_FIG_DFF(input1, input2, input3)
%
%   Description:
%       SAV_FIG_DFF() - description
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
lim = [-20 50];
fon_siz = 24;
col_sti = 'k';
x_lab = 'Time (s)';
y_lab = 'Neuron';

addpath(genpath('\\home.ansatt.ntnu.no\kadiram\Documents\MATLAB\figure'))
load(fil_pat_exp, 'sti_ons')
load(fil_pat_roi_t)

n_neu = size(dff, 1);

fig
hax = axes;
imagesc(tim, 1:n_neu, dff, lim)
colormap(jet)
col_bar = colorbar;
col_bar.Label.String = '\DeltaF/F (%)';
plo_ver_lin(sti_ons, hax, col_sti)
set(gca,'ytick',[])
set(gca,'yticklabel',[])
pre_for_exp_lab(x_lab, y_lab, fon_siz)
title(tit)
export_fig(fil_pat_fig)
end
