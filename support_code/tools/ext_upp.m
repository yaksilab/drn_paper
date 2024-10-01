function ele_row = ext_upp(ele_row_col)
%EXT_UPP - One line description of what the function or script performs (H1 line)
%   Optional file header info (to give more details about the function than in the H1 line)
%   Optional file header info (to give more details about the function than in the H1 line)
%   Optional file header info (to give more details about the function than in the H1 line)
%
%   Syntax:
%       output = EXT_UPP(input1, input2)
%       output = EXT_UPP(input1, input2, input3)
%
%   Description:
%       EXT_UPP() - description
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
%   Date: 03-Sep-2021; Last revision: 03-Sep-2021
%
%   Copyright (c) 2021, Kadir Mutlu
%   All rights reserved.
[n_row, n_col] = size(ele_row_col);
tru_row_col = true(n_row, n_col);
log_row_col = triu(tru_row_col, 1);
ele_row = ele_row_col(log_row_col);
end
