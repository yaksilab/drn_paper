function dat_dir = ext_dat_dir(ani)
%EXT_DAT_DIR - One line description of what the function or script performs (H1 line)
%   Optional file header info (to give more details about the function than in the H1 line)
%   Optional file header info (to give more details about the function than in the H1 line)
%   Optional file header info (to give more details about the function than in the H1 line)
%
%   Syntax:
%       output = EXT_DAT_DIR(input1, input2)
%       output = EXT_DAT_DIR(input1, input2, input3)
%
%   Description:
%       EXT_DAT_DIR() - description
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
%   Date: 21-May-2019; Last revision: 21-May-2019
%
%   Copyright (c) 2019, Kadir Mutlu
%   All rights reserved.
sta_dir = 3;
n_dir_rec = 5;
addpath \\home.ansatt.ntnu.no\kadiram\Documents\MATLAB\Tools
ani_dir = ['G:\Kadir\' ani];
% con_ani_dir = dir(ani_dir);
% n_rec = lenth(con_ani_dir) - 2;
% dat_dir = cell(n_rec, 1);
% for i = 1:n_rec
%     rec_i = con_ani_dir(i + 2).name;
%     con_rec_i = dir([ani_dir '\' rec_i]);
% end
all_dir = ext_dir(ani_dir);
all_dir(1) = [];
n_dir = length(all_dir);
n_dat_dir = n_dir/n_dir_rec;
dat_dir = cell(n_dat_dir, 1);
for i = 1:n_dat_dir
    dat_dir(i) = all_dir((i - 1)*n_dir_rec + sta_dir);
end