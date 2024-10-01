function h_plo = plo_spa_den(hax, x_uni, y_uni, mar_siz)
%PLO_SPA_DEN - One line description of what the function or script performs (H1 line)
%   Optional file header info (to give more details about the function than in the H1 line)
%   Optional file header info (to give more details about the function than in the H1 line)
%   Optional file header info (to give more details about the function than in the H1 line)
%
%   Syntax:
%       output = PLO_SPA_DEN(input1, input2)
%       output = PLO_SPA_DEN(input1, input2, input3)
%
%   Description:
%       PLO_SPA_DEN() - description
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

%   Author: Aytac Kadir Mutlu
%   Address: Olav Kyrres gate 9, 7030 Trondheim, Norway
%   email: kadir.a.mutlu@ntnu.no
%   Website: https://www.ntnu.edu/kavli
%   Date: 19-Apr-2024; Last revision: 19-Apr-2024
%
%   Copyright (c) 2024, Aytac Kadir Mutlu
%   All rights reserved.
pro_den_uni = ksdensity([x_uni y_uni], [x_uni y_uni]);
h_plo = scatter(hax, x_uni, y_uni, mar_siz, pro_den_uni, 'filled');
end
