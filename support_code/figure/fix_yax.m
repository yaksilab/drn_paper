function [y_min, y_max] = fix_yax(hax, y_min, y_max)
%FIX_YAX - One line description of what the function or script performs (H1 line)
%   MUST USE LINKAXES
%   Optional file header info (to give more details about the function than in the H1 line)
%   Optional file header info (to give more details about the function than in the H1 line)
%
%   Syntax:
%       output = FIX_YAX(input1, input2)
%       output = FIX_YAX(input1, input2, input3)
%
%   Description:
%       FIX_YAX() - description
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
%   Date: 14-Jun-2020; Last revision: 14-Jun-2020
%
%   Copyright (c) 2020, Kadir Mutlu
%   All rights reserved.
y_lim_i = hax.YLim;
y_lim_i_min = min(y_lim_i);
y_lim_i_max = max(y_lim_i);
if y_lim_i_min > y_min
    hax.YLim(1) = y_min;
else
    y_min = y_lim_i_min;
end
if y_lim_i_max < y_max
    hax.YLim(2) = y_max;
else
    y_max = y_lim_i_max;
end
end
