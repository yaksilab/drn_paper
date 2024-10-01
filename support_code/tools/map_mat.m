function ele_row_col = map_mat(ele_row_col, str_met)
%MAP_ARR - One line description of what the function or script performs (H1 line)
%   Optional file header info (to give more details about the function than in the H1 line)
%   Optional file header info (to give more details about the function than in the H1 line)
%   Optional file header info (to give more details about the function than in the H1 line)
%
%   Syntax:
%       output = MAP_ARR(input1, input2)
%       output = MAP_ARR(input1, input2, input3)
%
%   Description:
%       MAP_ARR() - description
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
%   Date: 12-Jul-2023; Last revision: 12-Jul-2023
%
%   Copyright (c) 2023, Aytac Kadir Mutlu
%   All rights reserved.
ele_row_col = arrayfun(@(ele) map_vec.(str_met)(ele), ele_row_col);
end
