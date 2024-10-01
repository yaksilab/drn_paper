function piv_row_col_pcx = ext_piv_row_col_pcx(var_row_col, var_lim, col_map)
%EXT_PIV_ROW_COL_PCX - One line description of what the function or script performs (H1 line)
%   primary color
%   Optional file header info (to give more details about the function than in the H1 line)
%   Optional file header info (to give more details about the function than in the H1 line)
%
%   Syntax:
%       output = EXT_PIV_ROW_COL_PCX(input1, input2)
%       output = EXT_PIV_ROW_COL_PCX(input1, input2, input3)
%
%   Description:
%       EXT_PIV_ROW_COL_PCX() - description
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
%   Date: 16-Dec-2022; Last revision: 16-Dec-2022
%
%   Copyright (c) 2022, Aytac Kadir Mutlu
%   All rights reserved.
piv_row_col.abs = mat2gray(var_row_col, var_lim);
ind_row_col = gray2ind(piv_row_col.abs, size(col_map, 1));
piv_row_col_pcx.abs = ind2rgb(ind_row_col, col_map);
con_fil = matfile('\\home.ansatt.ntnu.no\kadiram\Documents\MATLAB\con_esp.mat');
log_row_col.nan = isnan(var_row_col);
piv_row_col_pcx.abs(repmat(log_row_col.nan, 1, 1, con_fil.n_pcx)) = 1;
end
