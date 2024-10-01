function hax = gen_axe(wid, asp_rat, lef, bot, fig_wid, fig_hei)
%GEN_AXE - One line description of what the function or script performs (H1 line)
%   Optional file header info (to give more details about the function than in the H1 line)
%   Optional file header info (to give more details about the function than in the H1 line)
%   Optional file header info (to give more details about the function than in the H1 line)
%
%   Syntax:
%       output = GEN_AXE(input1, input2)
%       output = GEN_AXE(input1, input2, input3)
%
%   Description:
%       GEN_AXE() - description
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
%   Date: 16-Jul-2021; Last revision: 16-Jul-2021
%
%   Copyright (c) 2021, Kadir Mutlu
%   All rights reserved.
dis_asp_rat = fig_wid/fig_hei;
hei = (wid*dis_asp_rat)/asp_rat;
hax = axes('Units', 'normalized', 'Position', [lef bot wid hei], ...
    'XTickLabel', '', 'YTickLabel', '');
end
