classdef ext_upp_lim
    %EXT_UPP_LIM - One line description of what the class performs (H1 line)
    %   Optional file header info (to give more details about the function than in the H1 line)
    %   Optional file header info (to give more details about the function than in the H1 line)
    %   Optional file header info (to give more details about the function than in the H1 line)
    %
    %   EXT_UPP_LIM constructor syntax:
    %       EXT_UPP_LIM_OBJ = EXT_UPP_LIM()
    %
    %   EXT_UPP_LIM properties/attributes:
    %       Property 1 - description
    %       Property 2 - description
    %
    %   EXT_UPP_LIM methods/functions:
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
    %   Date: 16-Jan-2023; Last revision: 16-Jan-2023
    %
    %   Copyright (c) 2023, Aytac Kadir Mutlu
    %   All rights reserved.


    properties
    end
    
    methods(Static)
        function upp_lim = sig(y, p, y_lim_pre, sep, mou, ext_hei)
            if p <= 0.05
                offset = 0.01;
            else
                offset = 0;
            end
            starY = y + myRange(y_lim_pre)*offset;
            Y = ylim;
            if Y(2) < starY
                upp_lim = starY + myRange(Y)*(sep + mou + ext_hei);
            else
                upp_lim = Y(2);
            end
        end
    
        function upp_lim = duo(y, p, y_lim_pre, off_non, sep, mou, ext_hei)
            if p <= 0.05
                offset = 0.01;
            else
                offset = off_non;
            end
            starY = y + myRange(y_lim_pre)*offset;
            Y = ylim;
            if Y(2) < starY
                upp_lim = starY + myRange(Y)*(sep + mou + ext_hei);
            else
                upp_lim = Y(2);
            end
        end
    end
end
