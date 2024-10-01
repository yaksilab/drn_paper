function [high_in, low_in] = ext_hig_low_old(piv_row_col, per_bin_edg)
%EXT_HIG_LOW - One line description of what the function or script performs (H1 line)
%   Optional file header info (to give more details about the function than in the H1 line)
%   Optional file header info (to give more details about the function than in the H1 line)
%   Optional file header info (to give more details about the function than in the H1 line)
%
%   Syntax:
%       output = EXT_HIG_LOW(input1, input2)
%       output = EXT_HIG_LOW(input1, input2, input3)
%
%   Description:
%       EXT_HIG_LOW() - description
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
%   Date: 24-Dec-2022; Last revision: 24-Dec-2022
%
%   Copyright (c) 2022, Aytac Kadir Mutlu
%   All rights reserved.
con_fil = matfile('\\home.ansatt.ntnu.no\kadiram\Documents\MATLAB\con_esp.mat');
[high_in.abs, low_in.abs] = com_thr(piv_row_col(:), per_bin_edg);
high_in.rel = high_in.abs/con_fil.max_int;
low_in.rel = low_in.abs/con_fil.max_int;
end
