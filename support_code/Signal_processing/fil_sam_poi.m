function sam_poi = fil_sam_poi(sam_poi, win_len)
%SMO_SAM_POI - One line description of what the function or script performs (H1 line)
%   Optional file header info (to give more details about the function than in the H1 line)
%   Optional file header info (to give more details about the function than in the H1 line)
%   Optional file header info (to give more details about the function than in the H1 line)
%
%   Syntax:
%       output = SMO_SAM_POI(input1, input2)
%       output = SMO_SAM_POI(input1, input2, input3)
%
%   Description:
%       SMO_SAM_POI() - description
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
%   Date: 11-May-2022; Last revision: 11-May-2022
%
%   Copyright (c) 2022, Kadir Mutlu
%   All rights reserved.
n_fra.win = 1 + win_len.int;
n_seg = ceil(length(sam_poi)/n_fra.win);
sam_seg_poi = cell(n_seg, 1);
min_n_poi = 13;
for i = 1:n_seg
    if i == 1
        sam_seg_poi{i} = fil_yak(sam_poi(1:n_fra.win));
    elseif i < n_seg
        sam_seg_poi{i} = fil_yak(sam_poi((i - 1)*n_fra.win:i*n_fra.win));
    else
        val_poi = sam_poi((i - 1)*n_fra.win:end);
        n_poi = length(val_poi);
        if n_poi < min_n_poi
            val_poi = [val_poi; val_poi(end)*ones(min_n_poi - n_poi, 1)];
        end
        sam_seg_poi{i} = fil_yak(val_poi);
    end
end
% stich
for i = 1:n_seg
    poi_num = i*n_fra.win;
    if i == 1
        sam_poi(1:poi_num - 1) = sam_seg_poi{i}(1:end - 1);
        sam_poi(poi_num) = mean([sam_seg_poi{i}(end) sam_seg_poi{i + 1}(1)]);
    elseif i < n_seg
        sam_poi((i - 1)*n_fra.win + 1:poi_num - 1) = sam_seg_poi{i}(2:end - 1);
        sam_poi(poi_num) = mean([sam_seg_poi{i}(end) sam_seg_poi{i + 1}(1)]);
    else
        %sam_poi((i - 1)*n_fra.win + 1:end) = sam_seg_poi{i}(2:end);
        sam_poi((i - 1)*n_fra.win + 1:end) = sam_seg_poi{i}(2:n_poi);
    end
end
end
