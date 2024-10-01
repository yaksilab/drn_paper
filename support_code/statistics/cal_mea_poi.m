function [mea_poi, sem_poi, ind_var_pea] = cal_mea_poi(sam_poi_uni)
%PLO_SHA_GEN - One line description of what the function or script performs (H1 line)
%   sample mean
%   s.e. of THE mean
%   Optional file header info (to give more details about the function than in the H1 line)
%
%   Syntax:
%       output = PLO_SHA_GEN(input1, input2)
%       output = PLO_SHA_GEN(input1, input2, input3)
%
%   Description:
%       PLO_SHA_GEN() - description
%    
%   Inputs:
%       ind_var_sam - independent variable sample
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
%   Date: 14-Aug-2021; Last revision: 14-Aug-2021
%
%   Copyright (c) 2021, Kadir Mutlu
%   All rights reserved.
dim = 2;
[mea_poi, ~, sem_poi, ~] = com_sta(sam_poi_uni, dim);
[~, ind_var_pea] = findpeaks(mea_poi, 'NPeaks', 1);
end
