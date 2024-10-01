function max_asp_rat = com_max_asp_rat(n_row, gap_ver, gap_hor_col, ...
    mar_bot, mar_top, mar_lef, mar_rig, fig_wid, fig_hei)
%COM_MAX_ASP_RAT - One line description of what the function or script performs (H1 line)
%   Optional file header info (to give more details about the function than in the H1 line)
%   Optional file header info (to give more details about the function than in the H1 line)
%   Optional file header info (to give more details about the function than in the H1 line)
%
%   Syntax:
%       output = COM_MAX_ASP_RAT(input1, input2)
%       output = COM_MAX_ASP_RAT(input1, input2, input3)
%
%   Description:
%       COM_MAX_ASP_RAT() - description
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
%   Date: 02-Feb-2022; Last revision: 02-Feb-2022
%
%   Copyright (c) 2022, Kadir Mutlu
%   All rights reserved.
mar_pol = [mar_bot mar_top];
mar_sid = [mar_lef mar_rig];
hei = (1 - sum(mar_pol) - (n_row - 1)*gap_ver)/n_row;
dis_asp_rat = fig_wid/fig_hei;
wid = (1 - sum(mar_sid) - sum(gap_hor_col))*dis_asp_rat;
max_asp_rat = wid/hei;
end
