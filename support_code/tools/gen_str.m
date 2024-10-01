function [str_fie, str_met] = gen_str(fie_num)
%GEN_STR - One line description of what the function or script performs (H1 line)
%   Optional file header info (to give more details about the function than in the H1 line)
%   Optional file header info (to give more details about the function than in the H1 line)
%   Optional file header info (to give more details about the function than in the H1 line)
%
%   Syntax:
%       output = GEN_STR(input1, input2)
%       output = GEN_STR(input1, input2, input3)
%
%   Description:
%       GEN_STR() - description
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

%   Author: Aytac Kadir Mutlu
%   Address: Olav Kyrres gate 9, 7030 Trondheim, Norway
%   email: kadir.a.mutlu@ntnu.no
%   Website: https://www.ntnu.edu/kavli
%   Date: 11-Jul-2023; Last revision: 11-Jul-2023
%
%   Copyright (c) 2023, Aytac Kadir Mutlu
%   All rights reserved.
str_fie = '';
n_fie = length(fie_num);
for fie = 1:n_fie
    str_fie = [str_fie '_' fie_num{fie}];
end
str_met = str_fie(2:end);
end
