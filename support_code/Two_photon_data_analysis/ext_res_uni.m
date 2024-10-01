function res_uni = ext_res_uni(log_uni)
%EXT_RES_UNI - One line description of what the function or script performs (H1 line)
%   Optional file header info (to give more details about the function than in the H1 line)
%   Optional file header info (to give more details about the function than in the H1 line)
%   Optional file header info (to give more details about the function than in the H1 line)
%
%   Syntax:
%       output = EXT_RES_UNI(input1, input2)
%       output = EXT_RES_UNI(input1, input2, input3)
%
%   Description:
%       EXT_RES_UNI() - description
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
%   Date: 20-Nov-2023; Last revision: 20-Nov-2023
%
%   Copyright (c) 2023, Aytac Kadir Mutlu
%   All rights reserved.
% 1: inhibition, 2: unresponsive, 3: excitation
res_uni = double(log_uni.inh);
res_uni = res_uni + 3*double(log_uni.exc);
res_uni(res_uni == 0) = 2;
end
