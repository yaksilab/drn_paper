function col_han = lab_col(col_han, col_cod)
%LAB_COL - One line description of what the function or script performs (H1 line)
%   Optional file header info (to give more details about the function than in the H1 line)
%   Optional file header info (to give more details about the function than in the H1 line)
%   Optional file header info (to give more details about the function than in the H1 line)
%
%   Syntax:
%       output = LAB_COL(input1, input2)
%       output = LAB_COL(input1, input2, input3)
%
%   Description:
%       LAB_COL() - description
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
%   Date: 05-Apr-2024; Last revision: 05-Apr-2024
%
%   Copyright (c) 2024, Aytac Kadir Mutlu
%   All rights reserved.
col_han.Label.String = col_cod;
col_han.Label.Units = 'normalized';
col_han.Label.Position(1) = 1.5;
end
