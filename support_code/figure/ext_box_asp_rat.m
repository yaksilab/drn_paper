function box_asp_rat = ext_box_asp_rat(ind_sam, dep_sam)
%EXT_WID - One line description of what the function or script performs (H1 line)
%   Optional file header info (to give more details about the function than in the H1 line)
%   Optional file header info (to give more details about the function than in the H1 line)
%   Optional file header info (to give more details about the function than in the H1 line)
%
%   Syntax:
%       output = EXT_WID(input1, input2)
%       output = EXT_WID(input1, input2, input3)
%
%   Description:
%       EXT_WID() - description
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
ind_tox_dep = aspect45(ind_sam, dep_sam);
ind_ran = range(ind_sam);
dep_ran = range(dep_sam);
box_asp_rat = (ind_ran/dep_ran)/ind_tox_dep;
end
