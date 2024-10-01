function h_fig = opt_h_fig(h_fig, las_pix, rat_wid)
%function h_fig = opt_h_fig(h_fig, las_pix, rat_wid, fir_pix, rat_hei)
%OPT_H_FIG - One line description of what the function or script performs (H1 line)
%   Optional file header info (to give more details about the function than in the H1 line)
%   Optional file header info (to give more details about the function than in the H1 line)
%   Optional file header info (to give more details about the function than in the H1 line)
%
%   Syntax:
%       output = OPT_H_FIG(input1, input2)
%       output = OPT_H_FIG(input1, input2, input3)
%
%   Description:
%       OPT_H_FIG() - description
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
%   Date: 29-Jun-2022; Last revision: 29-Jun-2022
%
%   Copyright (c) 2022, Kadir Mutlu
%   All rights reserved.
set(h_fig.Children, 'Units', 'pixels')
h_fig.Position(3) = las_pix;
h_fig.PaperSize(1) = rat_wid*h_fig.PaperSize(1);
h_fig.Renderer = 'painters';
h_fig.PaperUnits = 'normalized';
h_fig.PaperPosition = [0 0 1 1];
end
