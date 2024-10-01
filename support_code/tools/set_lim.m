function mat = set_lim(mat, lim)
%SET_LIM - One line description of what the function or script performs (H1 line)
%   Optional file header info (to give more details about the function than in the H1 line)
%   Optional file header info (to give more details about the function than in the H1 line)
%   Optional file header info (to give more details about the function than in the H1 line)
%
%   Syntax:
%       output = SET_LIM(input1, input2)
%       output = SET_LIM(input1, input2, input3)
%
%   Description:
%       SET_LIM() - description
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
%   Date: 17-Aug-2020; Last revision: 17-Aug-2020
%
%   Copyright (c) 2020, Kadir Mutlu
%   All rights reserved.
log_low = mat < lim(1);
mat(log_low) = lim(1);
log_hig = mat > lim(2);
mat(log_hig) = lim(2);
end
