function lim = fin_glo_ext(var_cel_row_col)
%FIN_GLO_EXT - One line description of what the function or script performs (H1 line)
%   Optional file header info (to give more details about the function than in the H1 line)
%   Optional file header info (to give more details about the function than in the H1 line)
%   Optional file header info (to give more details about the function than in the H1 line)
%
%   Syntax:
%       output = FIN_GLO_EXT(input1, input2)
%       output = FIN_GLO_EXT(input1, input2, input3)
%
%   Description:
%       FIN_GLO_EXT() - description
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
%   Date: 11-Dec-2021; Last revision: 11-Dec-2021
%
%   Copyright (c) 2021, Kadir Mutlu
%   All rights reserved.
min_var_cel = cellfun(@fin_glo_min, var_cel_row_col);
max_var_cel = cellfun(@fin_glo_max, var_cel_row_col);
lim = [min(min_var_cel) max(max_var_cel)];
end

function min_var = fin_glo_min(var_row_col)
min_var = min(var_row_col, [], 'all');
end

function max_var = fin_glo_max(var_row_col)
max_var = max(var_row_col, [], 'all');
end
