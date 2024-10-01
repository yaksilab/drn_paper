function [mea_dep_var_poi, sem_dep_var_poi] = smo_mea_sem(mea_dep_var_poi, sem_dep_var_poi, n_poi)
%SMO_MEA_SEM - One line description of what the function or script performs (H1 line)
%   Optional file header info (to give more details about the function than in the H1 line)
%   Optional file header info (to give more details about the function than in the H1 line)
%   Optional file header info (to give more details about the function than in the H1 line)
%
%   Syntax:
%       output = SMO_MEA_SEM(input1, input2)
%       output = SMO_MEA_SEM(input1, input2, input3)
%
%   Description:
%       SMO_MEA_SEM() - description
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
%   Date: 06-Jan-2023; Last revision: 06-Jan-2023
%
%   Copyright (c) 2023, Aytac Kadir Mutlu
%   All rights reserved.
[~, n_con] = size(mea_dep_var_poi);
for i = 1:n_con
    mea_dep_var_poi(:, i) = smo_sam_poi_var(mea_dep_var_poi(:, i), n_poi.bas, n_poi.smo);
    sem_dep_var_poi(:, i) = smo_sam_poi_var(sem_dep_var_poi(:, i), n_poi.bas, n_poi.smo);
end
end
