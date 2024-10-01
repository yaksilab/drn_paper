function n_row_ima = plo_cor_sin(hax, pcc_xri_xri)
%PLO_COR_SIN - One line description of what the function or script performs (H1 line)
%   Optional file header info (to give more details about the function than in the H1 line)
%   Optional file header info (to give more details about the function than in the H1 line)
%   Optional file header info (to give more details about the function than in the H1 line)
%
%   Syntax:
%       output = PLO_COR_SIN(input1, input2)
%       output = PLO_COR_SIN(input1, input2, input3)
%
%   Description:
%       PLO_COR_SIN() - description
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
%   Date: 15-Oct-2020; Last revision: 15-Oct-2020
%
%   Copyright (c) 2020, Kadir Mutlu
%   All rights reserved.

ind_var_col = nan;
ima(hax, ind_var_col, pcc_xri_xri)
caxis([0 1])
colormap(jet)
n_row_ima = size(pcc_xri_xri, 1);
hax.XTick = 1:n_row_ima;
hax.XAxis.TickLength = [0 0];
hax.XTickLabels = [];
hax.YTickLabels = [];
end
