function cor_coe = com_cor_coe_dif(var_one, var_two, bin_siz)
%COM_COR_COE - One line description of what the function or script performs (H1 line)
%   Optional file header info (to give more details about the function than in the H1 line)
%   Optional file header info (to give more details about the function than in the H1 line)
%   Optional file header info (to give more details about the function than in the H1 line)
%
%   Syntax:
%       output = COM_COR_COE(input1, input2)
%       output = COM_COR_COE(input1, input2, input3)
%
%   Description:
%       COM_COR_COE() - description
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
%   Date: 13-Mar-2019; Last revision: 13-Mar-2019
%
%   Copyright (c) 2019, Kadir Mutlu
%   All rights reserved.
n_bin = length(var_two);
edg_end = n_bin*bin_siz;
var_one = var_one(1:edg_end);
var_two = interp(var_two, bin_siz);
cor_coe = com_cor_coe(var_one, var_two);
end
