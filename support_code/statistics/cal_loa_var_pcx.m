function [loa_var_pcx, sco_poi_pcx, pve_pcx] = cal_loa_var_pcx(sam_poi_var, n_com)
%CAL_LOA_VAR_PCX - One line description of what the function or script performs (H1 line)
%   Optional file header info (to give more details about the function than in the H1 line)
%   Optional file header info (to give more details about the function than in the H1 line)
%   Optional file header info (to give more details about the function than in the H1 line)
%
%   Syntax:
%       output = CAL_LOA_VAR_PCX(input1, input2)
%       output = CAL_LOA_VAR_PCX(input1, input2, input3)
%
%   Description:
%       CAL_LOA_VAR_PCX() - description
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
%   Date: 15-Feb-2023; Last revision: 15-Feb-2023
%
%   Copyright (c) 2023, Aytac Kadir Mutlu
%   All rights reserved.
% z-score
z_con_var = zscore(sam_poi_var);% rows correspond to data points, columns - dimensions
% pca | per_var_exp
[loa_var_pcx, sco_poi_pcx, ~, ~, pve_pcx, ~] = pca(z_con_var, 'NumComponents', n_com);
end
