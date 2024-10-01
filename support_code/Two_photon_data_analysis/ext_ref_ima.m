classdef ext_ref_ima
    %EXT_REF_IMA - One line description of what the class performs (H1 line)
    %   Optional file header info (to give more details about the function than in the H1 line)
    %   Optional file header info (to give more details about the function than in the H1 line)
    %   Optional file header info (to give more details about the function than in the H1 line)
    %
    %   EXT_REF_IMA constructor syntax:
    %       EXT_REF_IMA_OBJ = EXT_REF_IMA()
    %
    %   EXT_REF_IMA properties/attributes:
    %       Property 1 - description
    %       Property 2 - description
    %
    %   EXT_REF_IMA methods/functions:
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
        function piv_row_col = raw(workingDir, detectionTimepoint, windowSize, windowStep, ...
            planeIndex, metadata)
            end_ind = detectionTimepoint + windowSize - 1;
            filename = [workingDir 'mean_per_block_plane', num2str(planeIndex), '.tiff'];
            numimgs = size(imfinfo(filename), 1);
            while end_ind > numimgs
                end_ind = end_ind - windowStep;
            end
            meanPerBlockSeries = zeros(metadata.dim(1), metadata.dim(2), windowSize/windowStep, ...
                'uint16');
            for i = detectionTimepoint:windowStep:end_ind
                meanPerBlockSeries(:, :, i) = imread(filename, i);
            end
            piv_row_col = uint16(mean(meanPerBlockSeries, 3));
        end
        function piv_row_col = blu(workingDir, detectionTimepoint, windowSize, windowStep, ...
            planeIndex, metadata)
            end_ind = detectionTimepoint + windowSize - 1;
            filename = [workingDir 'mean_per_block_blu_plane', num2str(planeIndex), '.tiff'];
            numimgs = size(imfinfo(filename), 1);
            while end_ind > numimgs
                end_ind = end_ind - windowStep;
            end
            meanPerBlockSeries = zeros(metadata.dim(1), metadata.dim(2), windowSize/windowStep, ...
                'uint16');
            for i = detectionTimepoint:windowStep:end_ind
                meanPerBlockSeries(:, :, i) = imread(filename, i);
            end
            piv_row_col = uint16(mean(meanPerBlockSeries, 3));
        end
        function piv_row_col = glu(workingDir, detectionTimepoint, windowSize, windowStep, ...
            planeIndex, metadata)
            end_ind = detectionTimepoint + windowSize - 1;
            filename = [workingDir 'mean_per_block_glu_plane', num2str(planeIndex), '.tiff'];
            numimgs = size(imfinfo(filename), 1);
            while end_ind > numimgs
                end_ind = end_ind - windowStep;
            end
            meanPerBlockSeries = zeros(metadata.dim(1), metadata.dim(2), windowSize/windowStep, ...
                'uint16');
            for i = detectionTimepoint:windowStep:end_ind
                meanPerBlockSeries(:, :, i) = imread(filename, i);
            end
            piv_row_col = uint16(mean(meanPerBlockSeries, 3));
        end
    end

end
