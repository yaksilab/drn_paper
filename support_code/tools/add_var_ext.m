function add_var_ext(fil_pat, var_ext, var_new)
%ADD_VAR_EXT - One line description of what the function or script performs (H1 line)
%   Optional file header info (to give more details about the function than in the H1 line)
%   Optional file header info (to give more details about the function than in the H1 line)
%   Optional file header info (to give more details about the function than in the H1 line)
%
%   Syntax:
%       output = ADD_VAR_EXT(input1, input2)
%       output = ADD_VAR_EXT(input1, input2, input3)
%
%   Description:
%       ADD_VAR_EXT() - description
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
%   Date: 16-Jul-2020; Last revision: 16-Jul-2020
%
%   Copyright (c) 2020, Kadir Mutlu
%   All rights reserved.

mat_fil = matfile(fil_pat, 'Writable', true);
n_var = length(var_ext);
for i = 1:n_var
    mat_fil.(var_new{i}) = mat_fil.(var_ext{i});
end
end
