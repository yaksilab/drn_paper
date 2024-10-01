function sig = rem_bas_flu(sam_rat, sig)
%REM_BAS_FLU - One line description of what the function or script performs (H1 line)
%   Optional file header info (to give more details about the function than in the H1 line)
%   Optional file header info (to give more details about the function than in the H1 line)
%   Optional file header info (to give more details about the function than in the H1 line)
%
%   Syntax:
%       output = REM_BAS_FLU(input1, input2)
%       output = REM_BAS_FLU(input1, input2, input3)
%
%   Description:
%       REM_BAS_FLU() - description
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
%   Date: 08-Mar-2019; Last revision: 08-Mar-2019
%
%   Copyright (c) 2019, Kadir Mutlu
%   All rights reserved.
cut_fre = 0.1;
sig = hpf(sam_rat, sig, cut_fre);
end
