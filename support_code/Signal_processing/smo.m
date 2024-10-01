function sam_poi = smo(sam_poi)
%SMO - One line description of what the function or script performs (H1 line)
%   Optional file header info (to give more details about the function than in the H1 line)
%   Optional file header info (to give more details about the function than in the H1 line)
%   Optional file header info (to give more details about the function than in the H1 line)
%
%   Syntax:
%       output = SMO(input1, input2)
%       output = SMO(input1, input2, input3)
%
%   Description:
%       SMO() - description
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
%   Date: 19-Mar-2019; Last revision: 19-Mar-2019
%
%   Copyright (c) 2019, Kadir Mutlu
%   All rights reserved.
n_sam = length(sam_poi);
poi_num = (1:n_sam)';
wei_poi = ones(n_sam, 1);
sam_poi = b_spline_smooth(poi_num, sam_poi, poi_num, wei_poi, 2, 0);
end
