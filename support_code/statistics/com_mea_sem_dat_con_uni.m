function [mea_con, sem_con] = com_mea_sem_dat_con_uni(dat_con_uni)
%COM_MEA_SEM_DAT_UNI_CON - One line description of what the function or script performs (H1 line)
%   Optional file header info (to give more details about the function than in the H1 line)
%   Optional file header info (to give more details about the function than in the H1 line)
%   Optional file header info (to give more details about the function than in the H1 line)
%
%   Syntax:
%       output = COM_MEA_SEM_DAT_UNI_CON(input1, input2)
%       output = COM_MEA_SEM_DAT_UNI_CON(input1, input2, input3)
%
%   Description:
%       COM_MEA_SEM_DAT_UNI_CON() - description
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
%   Date: 09-Jun-2021; Last revision: 09-Jun-2021
%
%   Copyright (c) 2021, Kadir Mutlu
%   All rights reserved.
[n_con, ~] = size(dat_con_uni);
mea_con = nan(n_con, 1);
sem_con = nan(n_con, 1);
for i = 1:n_con
    [mea_con(i), ~, sem_con(i)] = com_sta(dat_con_uni(i, :), 2);
end
end
