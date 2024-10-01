function cla_tri = det_cla_tri(fil_pat_exp, fil_pat_ima, fil_pat_tai, fra_rat, mph_tai, fra_mpp, dur_pre_bea, dur_res, thr_ang, thr_ang_spe)
%CLA_TRI - One line description of what the function or script performs (H1 line)
%   Optional file header info (to give more details about the function than in the H1 line)
%   Optional file header info (to give more details about the function than in the H1 line)
%   Optional file header info (to give more details about the function than in the H1 line)
%
%   Syntax:
%       output = CLA_TRI(input1, input2)
%       output = CLA_TRI(input1, input2, input3)
%
%   Description:
%       CLA_TRI() - description
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
%   Date: 11-Jun-2019; Last revision: 11-Jun-2019
%
%   Copyright (c) 2019, Kadir Mutlu
%   All rights reserved.
[sti_ons, n_tri, sta_tim, end_tim] = ext_exp_dat(fil_pat_exp);
thr_ang = deg2rad(thr_ang);
thr_ang_spe = deg2rad(thr_ang_spe)*1000;
[fra_tim, ~, tai_ang, tai_ang_spe] = ext_fis_dat(fil_pat_ima, fil_pat_tai, sta_tim, end_tim);
[tai_bea, ~, tai_bea_ang] = ext_tai_bea(fra_rat, fra_tim, tai_ang, mph_tai, fra_mpp);
tai_bea_ang_spe = ext_tai_bea_ang_spe(fra_tim, tai_ang_spe, tai_bea);
cla_tri = zeros(n_tri, 1);
for i = 1:n_tri
    sti_ons_i = sti_ons(i);
    pre_ons_i = sti_ons_i - dur_pre_bea;
    pre_bea_i = tai_bea > pre_ons_i & tai_bea < sti_ons_i;
    n_pre_bea_i = sum(pre_bea_i);
    if n_pre_bea_i == 0
        res_lim_i = sti_ons_i + dur_res;
        res_bea_i = tai_bea > sti_ons_i & tai_bea < res_lim_i;
        n_res_bea_i = sum(res_bea_i);
        if n_res_bea_i > 0
            res_bea_ang_i = tai_bea_ang(res_bea_i);
            res_bea_ang_spe_i = tai_bea_ang_spe(res_bea_i);
            log_res_i = res_bea_ang_i > thr_ang & res_bea_ang_spe_i > thr_ang_spe;
            n_res_i = sum(log_res_i);
            if n_res_i > 0
                cla_tri(i) = 1;
            end
        end
    end
end
end
