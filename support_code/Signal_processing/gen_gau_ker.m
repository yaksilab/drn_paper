function gau_ker = gen_gau_ker(sta_dev)
%GEN_GAU_KER - the kernel is normalized at the end, therefore, just for
%smoothing.
%   mean should be 0.
%
%   *some* bins before the stimulus onset is also influenced by the bins
%   after the onset!
%
%   If we need to change the stimulus onset, then not ideal smoothing ...
%
%   Apply the kernel before and after the onset!
%   Syntax:
%       output = GEN_GAU_KER(input1, input2)
%       output = GEN_GAU_KER(input1, input2, input3)
%
%   Description:
%       GEN_GAU_KER() - description
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
%   Date: 12-Mar-2019; Last revision: 12-Mar-2019
%
%   Copyright (c) 2019, Kadir Mutlu
%   All rights reserved.

x = -sta_dev:sta_dev; % in units of bins, data points!
gau_ker = exp(-(x.^2/(2*sta_dev^2)));
gau_ker = gau_ker./sum(gau_ker);
end
