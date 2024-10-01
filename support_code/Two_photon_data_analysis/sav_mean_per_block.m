classdef sav_mean_per_block
    %SAV_MEAN_PER_BLOCK - One line description of what the class performs (H1 line)
    %   Optional file header info (to give more details about the function than in the H1 line)
    %   Optional file header info (to give more details about the function than in the H1 line)
    %   Optional file header info (to give more details about the function than in the H1 line)
    %
    %   SAV_MEAN_PER_BLOCK constructor syntax:
    %       SAV_MEAN_PER_BLOCK_OBJ = SAV_MEAN_PER_BLOCK()
    %
    %   SAV_MEAN_PER_BLOCK properties/attributes:
    %       Property 1 - description
    %       Property 2 - description
    %
    %   SAV_MEAN_PER_BLOCK methods/functions:
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
    %   Date: 21-Dec-2022; Last revision: 21-Dec-2022
    %
    %   Copyright (c) 2022, Aytac Kadir Mutlu
    %   All rights reserved.


    properties
    end
    
    methods(Static)
        function raw(mean_per_block, workingDir, planeIndex)
            imwrite(mean_per_block(:,:,1),[workingDir, '/mean_per_block_plane',num2str(planeIndex),...
                '.tiff'],'tiff')
            for i = 2:size(mean_per_block, 3)
                imwrite(mean_per_block(:,:,i),[workingDir, '/mean_per_block_plane',num2str(planeIndex), ...
                    '.tiff'],'tiff','WriteMode','Append')
            end
        end
        function red(mean_per_block, workingDir, planeIndex)
            imwrite(mean_per_block(:,:,1),[workingDir, '/mean_per_block_red_plane',num2str(planeIndex),...
                '.tiff'],'tiff')
            for i = 2:size(mean_per_block, 3)
                imwrite(mean_per_block(:,:,i),[workingDir, '/mean_per_block_red_plane',num2str(...
                    planeIndex), '.tiff'],'tiff','WriteMode','Append')
            end
        end
        function blu(mean_per_block, workingDir, planeIndex)
            imwrite(mean_per_block(:,:,1),[workingDir, '/mean_per_block_blu_plane',num2str(planeIndex),...
                '.tiff'],'tiff')
            for i = 2:size(mean_per_block, 3)
                imwrite(mean_per_block(:,:,i),[workingDir, '/mean_per_block_blu_plane',num2str(...
                    planeIndex), '.tiff'],'tiff','WriteMode','Append')
            end
        end
        function glu(mean_per_block, workingDir, planeIndex)
            imwrite(mean_per_block(:,:,1),[workingDir, '/mean_per_block_glu_plane',num2str(planeIndex),...
                '.tiff'],'tiff')
            for i = 2:size(mean_per_block, 3)
                imwrite(mean_per_block(:,:,i),[workingDir, '/mean_per_block_glu_plane',num2str(...
                    planeIndex), '.tiff'],'tiff','WriteMode','Append')
            end
        end
    end

end
