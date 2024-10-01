function mid_poi = ext_mid_poi(vec)
%EXT_MID_POI - One line description of what the function or script performs (H1 line)
%   Optional file header info (to give more details about the function than in the H1 line)
%   Optional file header info (to give more details about the function than in the H1 line)
%   Optional file header info (to give more details about the function than in the H1 line)
%
%   Syntax:
%       output = EXT_MID_POI(input1, input2)
%       output = EXT_MID_POI(input1, input2, input3)
%
%   Description:
%       EXT_MID_POI() - description
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
%   Date: 25-Jun-2019; Last revision: 25-Jun-2019
%
%   Copyright (c) 2019, Kadir Mutlu
%   All rights reserved.
mid_poi = mean([vec(1:end - 1) vec(2:end)], 2);
end
