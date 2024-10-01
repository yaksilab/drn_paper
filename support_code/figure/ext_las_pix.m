function [las_pix, rat_wid] = ext_las_pix(pos_axe, fig_wid, n_pix_ext)
%function [las_pix, rat_wid, fir_pix, rat_hei] = ext_las_pix(pos_axe, fig_wid, n_pix_ext, fig_hei, ...
%    n_pix_ext_hei)
%EXT_LAS_PIX - One line description of what the function or script performs (H1 line)
%   Optional file header info (to give more details about the function than in the H1 line)
%   Optional file header info (to give more details about the function than in the H1 line)
%   Optional file header info (to give more details about the function than in the H1 line)
%
%   Syntax:
%       output = EXT_LAS_PIX(input1, input2)
%       output = EXT_LAS_PIX(input1, input2, input3)
%
%   Description:
%       EXT_LAS_PIX() - description
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
%   Date: 29-Jun-2022; Last revision: 29-Jun-2022
%
%   Copyright (c) 2022, Kadir Mutlu
%   All rights reserved.
las_rat_axe = cellfun(@(pos_ind) pos_ind(1) + pos_ind(3), pos_axe);% should be normalized
rat_wid = max(las_rat_axe);
las_pix = round(rat_wid*fig_wid) + n_pix_ext;
rat_wid = las_pix/fig_wid;
end
