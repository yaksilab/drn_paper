function sam_poi_var = smo_sam_poi_var(sam_poi_var, n_poi_bas, n_poi_smo)
%SMO_SAM_POI - One line description of what the function or script performs (H1 line)
%   n_poi.smo should be odd number
%   % var - dependent var
%   Optional file header info (to give more details about the function than in the H1 line)
%
%   Syntax:
%       output = SMO_SAM_POI(input1, input2)
%       output = SMO_SAM_POI(input1, input2, input3)
%
%   Description:
%       SMO_SAM_POI() - description
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
%   Date: 11-May-2022; Last revision: 11-May-2022
%
%   Copyright (c) 2022, Kadir Mutlu
%   All rights reserved.
met = 'sgolay';
sam_smo_poi_var = smoothdata(sam_poi_var, met, n_poi_smo);
sam_poi_var(1:n_poi_bas, :) = smoothdata(sam_poi_var(1:n_poi_bas, :), met, n_poi_smo);
% sam_poi_var(n_poi_bas + 1:end, :) = smoothdata(sam_poi_var(n_poi_bas + 1:end, :), met, n_poi_smo);
sam_poi_var(n_poi_bas + 1:end, :) = sam_smo_poi_var(n_poi_bas + 1:end, :);
end
