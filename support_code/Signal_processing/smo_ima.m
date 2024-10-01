function ima = smo_ima(ima)
%SMO_IMA - One line description of what the function or script performs (H1 line)
%   Optional file header info (to give more details about the function than in the H1 line)
%   Optional file header info (to give more details about the function than in the H1 line)
%   Optional file header info (to give more details about the function than in the H1 line)
%
%   Syntax:
%       output = SMO_IMA(input1, input2)
%       output = SMO_IMA(input1, input2, input3)
%
%   Description:
%       SMO_IMA() - description
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
%   Date: 25-Feb-2020; Last revision: 25-Feb-2020
%
%   Copyright (c) 2020, Kadir Mutlu
%   All rights reserved.
n_row = size(ima, 1);
for i = 1:n_row
    ima(i, :) = smo(ima(i, :)');
end
end
