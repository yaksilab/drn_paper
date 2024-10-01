classdef ext_hig_low
    %EXT_HIG_LOW - One line description of what the class performs (H1 line)
    %   Optional file header info (to give more details about the function than in the H1 line)
    %   Optional file header info (to give more details about the function than in the H1 line)
    %   Optional file header info (to give more details about the function than in the H1 line)
    %
    %   EXT_HIG_LOW constructor syntax:
    %       EXT_HIG_LOW_OBJ = EXT_HIG_LOW()
    %
    %   EXT_HIG_LOW properties/attributes:
    %       Property 1 - description
    %       Property 2 - description
    %
    %   EXT_HIG_LOW methods/functions:
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
    %   Date: 07-Jan-2023; Last revision: 07-Jan-2023
    %
    %   Copyright (c) 2023, Aytac Kadir Mutlu
    %   All rights reserved.


    properties
    end
    
    methods(Static)
        function [high_in, low_in] = pea(piv_row_col, per_bin_edg)
            con_fil = matfile('\\home.ansatt.ntnu.no\kadiram\Documents\MATLAB\con_esp.mat');
            [high_in.abs, low_in.abs] = com_thr(piv_row_col(:), per_bin_edg);
            high_in.rel = high_in.abs/con_fil.max_int;
            low_in.rel = low_in.abs/con_fil.max_int;
        end
        
        function [high_in, low_in] = lim(piv_row_col, per_bin_edg_lim)
            con_fil = matfile('\\home.ansatt.ntnu.no\kadiram\Documents\MATLAB\con_esp.mat');
            thr_lim = com_thr_lim(piv_row_col(:), per_bin_edg_lim);
    
            low_in.abs = thr_lim(1);
            high_in.abs = thr_lim(2);
    
            high_in.rel = high_in.abs/con_fil.max_int;
            low_in.rel = low_in.abs/con_fil.max_int;
        end
    end

end
