function piv_row_col = adj_con(piv_row_col, per_bin_edg)
%ADJ_CON - One line description of what the function or script performs (H1 line)
%   Optional file header info (to give more details about the function than in the H1 line)
%   Optional file header info (to give more details about the function than in the H1 line)
%   Optional file header info (to give more details about the function than in the H1 line)
%
%   Syntax:
%       output = ADJ_CON(input1, input2)
%       output = ADJ_CON(input1, input2, input3)
%
%   Description:
%       ADJ_CON() - description
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
%   Date: 25-Mar-2024; Last revision: 25-Mar-2024
%
%   Copyright (c) 2024, Aytac Kadir Mutlu
%   All rights reserved.
[high_in, low_in] = ext_hig_low.pea(piv_row_col, per_bin_edg);
%piv_row_col uint16, max eg 2214
piv_row_col = imadjust(piv_row_col, [low_in.rel high_in.rel]);% contrast limits, 
% output % uint16, max 65535 - grayscale
end
