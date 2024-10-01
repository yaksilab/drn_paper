function sec_tox_min(dru_ons, sti_ons)
%SEC_TOX_MIN - One line description of what the function or script performs (H1 line)
%   Optional file header info (to give more details about the function than in the H1 line)
%   Optional file header info (to give more details about the function than in the H1 line)
%   Optional file header info (to give more details about the function than in the H1 line)
%
%   Syntax:
%       output = SEC_TOX_MIN(input1, input2)
%       output = SEC_TOX_MIN(input1, input2, input3)
%
%   Description:
%       SEC_TOX_MIN() - description
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
%   Date: 20-Jun-2019; Last revision: 20-Jun-2019
%
%   Copyright (c) 2019, Kadir Mutlu
%   All rights reserved.
min_sec = 60;
x_lab = 'Time (min)';
fon_siz = 24;
addpath(genpath('\\home.ansatt.ntnu.no\kadiram\Documents\MATLAB\figure'))
x_tic = [dru_ons; sti_ons];
xticks(x_tic)
xtl = xticklabels;
n_xtl = length(xtl);
xtl_min = xtl;
for i = 1:n_xtl
    xtl_i = xtl{i};
    xtl_i_num = str2double(xtl_i);
    xtl_min_i = xtl_i_num/min_sec;
    xtl_min{i} = num2str(xtl_min_i);
end
xticklabels(xtl_min)
lab_x_axi(x_lab, fon_siz)
end
