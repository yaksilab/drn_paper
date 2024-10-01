classdef sho_ima
    %SHO_IMA - One line description of what the class performs (H1 line)
    %   Optional file header info (to give more details about the function than in the H1 line)
    %   Optional file header info (to give more details about the function than in the H1 line)
    %   Optional file header info (to give more details about the function than in the H1 line)
    %
    %   SHO_IMA constructor syntax:
    %       SHO_IMA_OBJ = SHO_IMA()
    %
    %   SHO_IMA properties/attributes:
    %       Property 1 - description
    %       Property 2 - description
    %
    %   SHO_IMA methods/functions:
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
    %   Date: 16-Dec-2022; Last revision: 16-Dec-2022
    %
    %   Copyright (c) 2022, Aytac Kadir Mutlu
    %   All rights reserved.


    properties
    end
    
    methods(Static)
        function ima = raw(hax, piv_row_col)
            ima = imshow(piv_row_col, 'Parent', hax, 'InitialMagnification', "fit");
        end
        function ima = gra(hax, piv_row_col)% normalizes
            ima = imshow(piv_row_col, [], 'Parent', hax, 'InitialMagnification', "fit");
        end
        function ima = gra_ran(hax, piv_row_col, dis_lim)
            ima = imshow(piv_row_col, dis_lim, 'Parent', hax);
        end
        function ima = rgb(hax, piv_row_col_pcx)
            ima = imshow(piv_row_col_pcx.abs, 'Parent', hax);
        end
        function ima = ind(hax, ind_row_col, piv_col_pcx)
            ima = imshow(ind_row_col, piv_col_pcx, 'Parent', hax);
        end
    end

end
