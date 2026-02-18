classdef map_vec
    %MAP_VEC - One line description of what the class performs (H1 line)
    %   Optional file header info (to give more details about the function than in the H1 line)
    %   Optional file header info (to give more details about the function than in the H1 line)
    %   Optional file header info (to give more details about the function than in the H1 line)
    %
    %   MAP_VEC constructor syntax:
    %       MAP_VEC_OBJ = MAP_VEC()
    %
    %   MAP_VEC properties/attributes:
    %       Property 1 - description
    %       Property 2 - description
    %
    %   MAP_VEC methods/functions:
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
    %   Date: 06-Jul-2023; Last revision: 06-Jul-2023
    %
    %   Copyright (c) 2023, Aytac Kadir Mutlu
    %   All rights reserved.


    properties
    end
    
    methods(Static)
        % gab
        function clu = gab(clu)
            if clu == 5
                clu = 1;
            elseif clu == 3
                clu = 2;
            elseif clu == 1
                clu = 3;
            elseif clu == 4
                clu = 4;
            elseif clu == 2
                clu = 5;
            end
        end
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% soma
        function clu = bou_all(clu)
            if clu == 1
                clu = 1;
            elseif clu == 2
                clu = 2;
            elseif clu == 3
                clu = 3;
            elseif clu == 4
                clu = 4;
            end
        end
        function clu = lig(clu)
            if clu == 1
                clu = 1;
            elseif clu == 2
                clu = 2;
            elseif clu == 3
                clu = 3;
            elseif clu == 4
                clu = 4;
            end
        end
        function clu = tap(clu)
            if clu == 1
                clu = 1;
            elseif clu == 2
                clu = 2;
            elseif clu == 3
                clu = 3;
            elseif clu == 4
                clu = 4;
            end
        end
        %%%%%%%%%%%%%%%%%% axon in fb
        function clu = axo_bou_all(clu)
            if clu == 2
                clu = 1;
            elseif clu == 4
                clu = 2;
            elseif clu == 5
                clu = 3;
            elseif clu == 3
                clu = 4;
            elseif clu == 1
                clu = 5;
            end
        end
        %%%%%%%%%%%%%%%%% axo-cel in fb
        function clu = axo_cel(clu)
            if clu == 3
                clu = 1;
            elseif clu == 2
                clu = 2;
            elseif clu == 1
                clu = 3;
            elseif clu == 5
                clu = 4;
            elseif clu == 4
                clu = 5;
            end
        end
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% res
        function clu = res(clu)
            if clu == 1
                clu = 3;
            elseif clu == 3
                clu = 1;
            end
        end
    end

end
