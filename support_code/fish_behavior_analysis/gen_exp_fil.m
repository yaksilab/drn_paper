function gen_exp_fil(fil_pat_ima, fil_pat_tai, fil_pat_exp)
%GEN_EXP_FIL - One line description of what the function or script performs (H1 line)
%   Optional file header info (to give more details about the function than in the H1 line)
%   Optional file header info (to give more details about the function than in the H1 line)
%   Optional file header info (to give more details about the function than in the H1 line)
%
%   Syntax:
%       output = GEN_EXP_FIL(input1, input2)
%       output = GEN_EXP_FIL(input1, input2, input3)
%
%   Description:
%       GEN_EXP_FIL() - description
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
%   Date: 19-Jul-2019; Last revision: 19-Jul-2019
%
%   Copyright (c) 2019, Kadir Mutlu
%   All rights reserved.

dru_ons = 0;
sta_tim = 10;
end_tim = com_end_tim(fil_pat_ima);
sti_ons = ext_sti_ons(fil_pat_ima, fil_pat_tai);

save(fil_pat_exp, 'dru_ons', 'sti_ons', 'sta_tim', 'end_tim', '-v7.3')
end

function end_tim = com_end_tim(fil_pat_ima)
load(fil_pat_ima, 'time')
man_ext = 300;
syn_per = 10;
end_tim = time - man_ext - syn_per;
end

function sti_ons = ext_sti_ons(fil_pat_ima, fil_pat_tai)
[fra_tim, n_fra] = ext_fra_tim(fil_pat_ima);
load(fil_pat_tai, 'cube_positions')
dis = cube_positions(1:n_fra);
dif_dis = diff(dis);
dif_dis_aft = [dif_dis; 0];
dif_dis_bef = [0; dif_dis];
dif_dis_sum = dif_dis_aft + dif_dis_bef;
log_sti_ons = dif_dis_sum == min(dif_dis);
sti_ons = fra_tim(log_sti_ons);
end

function [fra_tim, n_fra] = ext_fra_tim(fil_pat_ima)
load(fil_pat_ima, 'timestamps')
fra_tim = com_fra_tim(timestamps);
n_fra = length(timestamps);
end
