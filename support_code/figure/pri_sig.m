function pri_sig(hax, nor_x, nor_y, p_val, log_all)
%PRI_SIG - One line description of what the function or script performs (H1 line)
%   Optional file header info (to give more details about the function than in the H1 line)
%   Optional file header info (to give more details about the function than in the H1 line)
%   Optional file header info (to give more details about the function than in the H1 line)
%
%   Syntax:
%       output = PRI_SIG(input1, input2)
%       output = PRI_SIG(input1, input2, input3)
%
%   Description:
%       PRI_SIG() - description
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
%   Date: 01-Aug-2022; Last revision: 01-Aug-2022
%
%   Copyright (c) 2022, Kadir Mutlu
%   All rights reserved.
global n_dig
if p_val <= 0.001
    tex_pri = '***';
elseif p_val <= 0.01
    tex_pri = '**';
elseif p_val <= 0.05
    tex_pri = '*';
else
    tex_pri = string(round(p_val, n_dig));
end
if p_val <= 0.07 || log_all
    text(hax, nor_x, nor_y, tex_pri, 'Units', 'normalized')
end
end
