function [x, y] = ext_coo(fil_pat)
%EXT_COO - One line description of what the function or script performs (H1 line)
%   Optional file header info (to give more details about the function than in the H1 line)
%   Optional file header info (to give more details about the function than in the H1 line)
%   Optional file header info (to give more details about the function than in the H1 line)
%
%   Syntax:
%       output = EXT_COO(input1, input2)
%       output = EXT_COO(input1, input2, input3)
%
%   Description:
%       EXT_COO() - description
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
%   Date: 14-Jun-2022; Last revision: 14-Jun-2022
%
%   Copyright (c) 2022, Kadir Mutlu
%   All rights reserved.
int_row_col = imread(fil_pat);
int_row_col = im2gray(int_row_col);
int_row_col = imbinarize(flipud(int_row_col));
[y, x] = find(~int_row_col);
end
