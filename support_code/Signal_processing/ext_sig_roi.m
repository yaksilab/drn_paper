function [piv_fra_pix, row_num, col_num, piv_fra] = ext_sig_roi(piv_row_col_fra, log_row_col)
%EXT_SIG_ROI - One line description of what the function or script performs (H1 line)
%   no variance filter
%
%   Syntax:
%       output = EXT_SIG_ROI(input1, input2)
%       output = EXT_SIG_ROI(input1, input2, input3)
%
%   Description:
%       EXT_SIG_ROI() - description
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
%   Date: 05-Mar-2019; Last revision: 05-Mar-2019
%
%   Copyright (c) 2019, Kadir Mutlu
%   All rights reserved.

[n_row, n_col, n_fra] = size(piv_row_col_fra);
ind_pix = find(log_row_col);% going through columns
n_pix = length(ind_pix);
piv_fra_pix = zeros(n_fra, n_pix);

[row_num, col_num] = ind2sub([n_row, n_col], ind_pix);% going through columns

for i = 1:n_pix
    piv_fra_pix(:, i) = piv_row_col_fra(row_num(i), col_num(i), :);
end
piv_fra = mean(piv_fra_pix, 2);
end
