function sav_fig_neu_thr(fil_pat_dat, fil_pat_fig, col_han_pos, tit, fon_siz)
%SAV_FIG_NEU - One line description of what the function or script performs (H1 line)
%   Optional file header info (to give more details about the function than in the H1 line)
%   Optional file header info (to give more details about the function than in the H1 line)
%   Optional file header info (to give more details about the function than in the H1 line)
%
%   Syntax:
%       output = SAV_FIG_NEU(input1, input2)
%       output = SAV_FIG_NEU(input1, input2, input3)
%
%   Description:
%       SAV_FIG_NEU() - description
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
%   Date: 26-Jun-2019; Last revision: 26-Jun-2019
%
%   Copyright (c) 2019, Kadir Mutlu
%   All rights reserved.
addpath(genpath('\\home.ansatt.ntnu.no\kadiram\Documents\MATLAB\figure'))
load(fil_pat_dat)
fig
ax2 = subplot(1, 3, 1); ima(ima_ref); caxis([0 5000]); colormap (ax2, bone)
title('Reference')
ax1 = subplot(1, 3, 2); ima(ima_fir); caxis([-10 40]); colormap (ax1, jet); col_han = colorbar;
title('First trial')
ax1 = subplot(1, 3, 3); ima(ima_ave); caxis([-10 40]); colormap (ax1, jet)
title('Average')
col_han.Position = col_han_pos;
colorTitleHandle = get(col_han,'Title');
titleString = '\DeltaF/F (%)';
set(colorTitleHandle ,'String',titleString);
[~, h] = suplabel(tit, 't', [.08 .08 .87 .9]);
set(h, 'FontSize', fon_siz + 3)
pre_for_exp(fon_siz)
export_fig(fil_pat_fig)
end
