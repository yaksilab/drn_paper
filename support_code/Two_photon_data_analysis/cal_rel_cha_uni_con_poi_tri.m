function [rel_cha_uni_con_poi_tri, rel_cha_rox_con_poi_uni] = cal_rel_cha_uni_con_poi_tri(sam_poi_uni, ...
    win_len, sti_ons_tri_con, sam_rat, isi)
%CAL_REL_CHA_UNI_CON_POI_TRI - One line description of what the function or script performs (H1 line)
%   Optional file header info (to give more details about the function than in the H1 line)
%   Optional file header info (to give more details about the function than in the H1 line)
%   Optional file header info (to give more details about the function than in the H1 line)
%
%   Syntax:
%       output = CAL_REL_CHA_UNI_CON_POI_TRI(input1, input2)
%       output = CAL_REL_CHA_UNI_CON_POI_TRI(input1, input2, input3)
%
%   Description:
%       CAL_REL_CHA_UNI_CON_POI_TRI() - description
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

%   Author: Aytac Kadir Mutlu
%   Address: Olav Kyrres gate 9, 7030 Trondheim, Norway
%   email: kadir.a.mutlu@ntnu.no
%   Website: https://www.ntnu.edu/kavli
%   Date: 12-Jun-2023; Last revision: 12-Jun-2023
%
%   Copyright (c) 2023, Aytac Kadir Mutlu
%   All rights reserved.
[~, n_uni] = size(sam_poi_uni);
[~, n_con] = size(sti_ons_tri_con.fra);
rel_cha_uni_con_poi_tri = cell(n_uni, n_con);
rel_cha_rox_con_poi_uni = cell(1, n_con);
for con = 1:n_con
    sti_ons_tri.fra = sti_ons_tri_con.fra(:, con);
    [~, ~, rel_cha_uni_con_poi_tri(:, con), rel_cha_rox_con_poi_uni{1, con}, ~] = ...
        cal_rel_cha_uni_poi_tri(sam_poi_uni, win_len, sti_ons_tri, sam_rat, isi);
end
end
