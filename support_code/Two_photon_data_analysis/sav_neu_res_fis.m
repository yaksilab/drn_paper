function sav_neu_res_fis(ani, sti_ons, sti_dur, bas_dur, pos_sti_dur, sti)
%SAV_NEU_RES_FIS - One line description of what the function or script performs (H1 line)
%   Optional file header info (to give more details about the function than in the H1 line)
%   Optional file header info (to give more details about the function than in the H1 line)
%   Optional file header info (to give more details about the function than in the H1 line)
%
%   Syntax:
%       output = SAV_NEU_RES_FIS(input1, input2)
%       output = SAV_NEU_RES_FIS(input1, input2, input3)
%
%   Description:
%       SAV_NEU_RES_FIS() - description
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
%   Date: 22-May-2019; Last revision: 22-May-2019
%
%   Copyright (c) 2019, Kadir Mutlu
%   All rights reserved.
dat_dir = ext_dat_dir(ani);
n_dat_dir = length(dat_dir);
for i = 1:n_dat_dir
    dat_dir_i = dat_dir{i};
    sti_dur_i = sti_dur(i);
    sti_i = sti{i};
    sav_neu_res(dat_dir_i, sti_ons, sti_dur_i, bas_dur, pos_sti_dur, sti_i)
end
end
