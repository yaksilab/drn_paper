function [len, n_poi, n_ipi] = ext_len(sam_rat, rou_len)
%EXT_TIM - One line description of what the function or script performs (H1 line)
%   Optional file header info (to give more details about the function than in the H1 line)
%   Optional file header info (to give more details about the function than in the H1 line)
%   Optional file header info (to give more details about the function than in the H1 line)
%
%   Syntax:
%       output = EXT_TIM(input1, input2)
%       output = EXT_TIM(input1, input2, input3)
%
%   Description:
%       EXT_TIM() - description
%    
%   Inputs:
%       rou_len: in sec
%       input2 - Description
%       input3 - Description
%
%   Outputs:
%       len: in sec
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
%   Date: 11-May-2022; Last revision: 11-May-2022
%
%   Copyright (c) 2022, Kadir Mutlu
%   All rights reserved.
n_ipi = floor(sam_rat*rou_len);
len = (1/sam_rat)*n_ipi;
n_poi = n_ipi + 1;
end
