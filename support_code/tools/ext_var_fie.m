function var = ext_var_fie(var, fie_num)
%EXT_VAR_FIE - One line description of what the function or script performs (H1 line)
%   Optional file header info (to give more details about the function than in the H1 line)
%   Optional file header info (to give more details about the function than in the H1 line)
%   Optional file header info (to give more details about the function than in the H1 line)
%
%   Syntax:
%       output = EXT_VAR_FIE(input1, input2)
%       output = EXT_VAR_FIE(input1, input2, input3)
%
%   Description:
%       EXT_VAR_FIE() - description
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
%   Date: 18-Mar-2022; Last revision: 18-Mar-2022
%
%   Copyright (c) 2022, Kadir Mutlu
%   All rights reserved.

n_fie = length(fie_num);
i = 1;
while i <= n_fie
    var = var.(fie_num{i});
    i = i + 1;
end
end
