classdef plo_var_var
    %PLO_VAR_VAR - One line description of what the class performs (H1 line)
    %   Optional file header info (to give more details about the function than in the H1 line)
    %   Optional file header info (to give more details about the function than in the H1 line)
    %   Optional file header info (to give more details about the function than in the H1 line)
    %
    %   PLO_VAR_VAR constructor syntax:
    %       PLO_VAR_VAR_OBJ = PLO_VAR_VAR()
    %
    %   PLO_VAR_VAR properties/attributes:
    %       Property 1 - description
    %       Property 2 - description
    %
    %   PLO_VAR_VAR methods/functions:
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
    %   Date: 08-Nov-2023; Last revision: 08-Nov-2023
    %
    %   Copyright (c) 2023, Aytac Kadir Mutlu
    %   All rights reserved.


    properties
    end
    
    methods(Static)
        function h_plo = one_sam(hax, tac_tri, act_tri, siz)
            [tac_poi, act_poi, r_squ] = com_dat_poi_slr(tac_tri, act_tri);
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            mar = 'o';
            y_sam = [0.950; 0.900];
            tex_pri = sprintf('r-squared = %0.2f', r_squ);
            
            h_plo = scatter(hax, tac_tri, act_tri, siz, 'Marker', mar);
            hold(hax, 'on')
            plot(hax, tac_poi, act_poi)
            text(hax, 0.010, y_sam(1), tex_pri, 'units', 'normalized');
            
            box(hax, 'off')
        end
    end

end
