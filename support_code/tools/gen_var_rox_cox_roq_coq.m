function var_rox_cox_roq_coq = gen_var_rox_cox_roq_coq(n_rox, n_cox, n_roq, n_coq)
%INI_CEL_ARR - One line description of what the function or script performs (H1 line)
%   Optional file header info (to give more details about the function than in the H1 line)
%   Optional file header info (to give more details about the function than in the H1 line)
%   Optional file header info (to give more details about the function than in the H1 line)
%
%   Syntax:
%       output = INI_CEL_ARR(input1, input2)
%       output = INI_CEL_ARR(input1, input2, input3)
%
%   Description:
%       INI_CEL_ARR() - description
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
%   Date: 03-Jul-2022; Last revision: 03-Jul-2022
%
%   Copyright (c) 2022, Kadir Mutlu
%   All rights reserved.
var_rox_cox_roq_coq = cellfun(@(x) cell(n_roq, n_coq), cell(n_rox, n_cox), 'UniformOutput', false);
end
