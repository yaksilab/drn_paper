classdef shu_var_row
    %SHU_VAR_ROW - One line description of what the class performs (H1 line)
    %   Optional file header info (to give more details about the function than in the H1 line)
    %   Optional file header info (to give more details about the function than in the H1 line)
    %   Optional file header info (to give more details about the function than in the H1 line)
    %
    %   SHU_VAR_ROW constructor syntax:
    %       SHU_VAR_ROW_OBJ = SHU_VAR_ROW()
    %
    %   SHU_VAR_ROW properties/attributes:
    %       Property 1 - description
    %       Property 2 - description
    %
    %   SHU_VAR_ROW methods/functions:
    %       Method 1 - description
    %       Method 2 - description
    %
    %   Examples: 
    %       Line 1 of example
    %       Line 2 of example
    %       Line 3 of example
    %
    %   Other m-files required: none
    %   MAT-files required: none
    %
    %   See also: OTHER_CLASS_NAME1,  OTHER_CLASS_NAME2

    %   Author: Aytac Kadir Mutlu
    %   Address: Olav Kyrres gate 9, 7030 Trondheim, Norway
    %   email: kadir.a.mutlu@ntnu.no
    %   Website: https://www.ntnu.edu/kavli
    %   Date: 06-Feb-2024; Last revision: 06-Feb-2024
    %
    %   Copyright (c) 2024, Aytac Kadir Mutlu
    %   All rights reserved.


    properties
    end
    
    methods(Static)
        function var_row = ent(var_row)
        var_row = shu(var_row);
        end

        function var_row = par(var_row, lim_row)
        var_row(1:lim_row) = shu(var_row(1:lim_row));
        var_row(lim_row + 1:end) = nan;
        end
    end

end

function var_row = shu(var_row)
n_row = length(var_row);
for ite = 1:10
    var_row = var_row(randperm(n_row)');
end
end
