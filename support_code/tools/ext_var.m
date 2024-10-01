function sav_var = ext_var(obj, fie, var_nam)
%EXT_VAR - One line description of what the function or script performs (H1 line)
%   Optional file header info (to give more details about the function than in the H1 line)
%   Optional file header info (to give more details about the function than in the H1 line)
%   Optional file header info (to give more details about the function than in the H1 line)
%
%   Syntax:
%       output = EXT_VAR(input1, input2)
%       output = EXT_VAR(input1, input2, input3)
%
%   Description:
%       EXT_VAR() - description
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
%       fil_pat_rec
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
%   Date: 24-Jun-2021; Last revision: 24-Jun-2021
%
%   Copyright (c) 2021, Kadir Mutlu
%   All rights reserved.
mat_fil_obj = matfile(obj.(fie));
sav_var = mat_fil_obj.(var_nam);
end
