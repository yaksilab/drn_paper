classdef cal_r_pai
    %CAL_R_PAI - One line description of what the class performs (H1 line)
    %   Optional file header info (to give more details about the function than in the H1 line)
    %   Optional file header info (to give more details about the function than in the H1 line)
    %   Optional file header info (to give more details about the function than in the H1 line)
    %
    %   CAL_R_PAI constructor syntax:
    %       CAL_R_PAI_OBJ = CAL_R_PAI()
    %
    %   CAL_R_PAI properties/attributes:
    %       Property 1 - description
    %       Property 2 - description
    %
    %   CAL_R_PAI methods/functions:
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
    %   Date: 01-Mar-2024; Last revision: 01-Mar-2024
    %
    %   Copyright (c) 2024, Aytac Kadir Mutlu
    %   All rights reserved.


    properties
    end
    
    methods(Static)
        function r_pai = tog(dff_fra_uni)
            r_uni_uni = corr(dff_fra_uni);
            r_pai = ext_upp(r_uni_uni);
        end

        function r_pai = sep(dff_fra_uni, log_uni)
            r_uni_uni.all = corr(dff_fra_uni);
            r_uni_uni.lef = r_uni_uni.all(log_uni.lef.all, log_uni.lef.all);
            r_pai_lef = ext_upp(r_uni_uni.lef);
            r_uni_uni.rig = r_uni_uni.all(log_uni.rig.all, log_uni.rig.all);
            r_pai_rig = ext_upp(r_uni_uni.rig);
            r_pai = [r_pai_lef; r_pai_rig];
        end
    end

end
