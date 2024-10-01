function plo_err_col(hax, mea_con, sem_con, mar_siz, col_sam_con, ind_sin_sam)
%PLO_ERR_COL - One line description of what the function or script performs (H1 line)
%   Optional file header info (to give more details about the function than in the H1 line)
%   Optional file header info (to give more details about the function than in the H1 line)
%   Optional file header info (to give more details about the function than in the H1 line)
%
%   Syntax:
%       output = PLO_ERR_COL(input1, input2)
%       output = PLO_ERR_COL(input1, input2, input3)
%
%   Description:
%       PLO_ERR_COL() - description
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
%   Date: 13-Sep-2024; Last revision: 13-Sep-2024
%
%   Copyright (c) 2024, Aytac Kadir Mutlu
%   All rights reserved.
% Plot the error bars only
mar_err = '.';
con_fil = matfile('\\home.ansatt.ntnu.no\kadiram\Documents\MATLAB\con_esp.mat');
lin_wid = con_fil.lin_wid;
n_con = length(mea_con);
for con = 1:n_con
    errorbar(hax, con, mea_con(con), sem_con(con), mar_err, 'MarkerSize', mar_siz, 'LineStyle', 'none', ...
        'LineWidth', lin_wid.two, 'Color', col_sam_con{ind_sin_sam, con});
end
hold(hax, 'on')
% Plot the line without error bars
plot(hax, mea_con, 'Color', 'k', 'LineWidth', lin_wid.two);
end
