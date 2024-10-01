%CLA_TRI - One line description of what the script performs (H1 line)
%   thr_ang_spe = 1.4; % deg/ms
%
%   Description:
%       0: non-response - excluded or no response
%
%   Output:
%       CLA_TRI output
%
%   Other m-files required: none
%   MAT-files required: none
%
%   See also: OTHER_SCRIPT_NAME,  OTHER_FUNCTION_NAME

%   Author: Kadir Mutlu
%   Address: Olav Kyrres gate 9, 7030 Trondheim, Norway
%   email: kadir.a.mutlu@ntnu.no
%   Website: https://www.ntnu.edu/kavli
%   Date: 03-Jun-2019; Last revision: 03-Jun-2019
%
%   Copyright (c) 2019, Kadir Mutlu
fil_pat_exp = 'X:\kadiram\Data\Raw\KM015\loo\loo.mat';
fil_pat_ima = 'X:\kadiram\Data\Raw\KM015\loo\29-05-2019_0_0.mat';
fil_pat_tai = 'X:\kadiram\Data\Raw\KM015\loo\Robbrecht_experiment0_trial0_TID8160.mat';
fra_rat = 120;
mph_tai = 0.1;
fra_mpp = 0.5;
dur_pre_bea = 0.5;
dur_res = 10;
thr_ang = 23;
thr_ang_spe = 1.4;
cla_tri = det_cla_tri(fil_pat_exp, fil_pat_ima, fil_pat_tai, fra_rat, mph_tai, fra_mpp, dur_pre_bea, dur_res, thr_ang, thr_ang_spe);

fil_pat_exp = 'X:\kadiram\Data\Raw\KM016\loo\loo.mat';
fil_pat_ima = 'X:\kadiram\Data\Raw\KM016\loo\09-06-2019_0_0.mat';
fil_pat_tai = 'X:\kadiram\Data\Raw\KM016\loo\Robbrecht_experiment0_trial0_TID584.mat';
fra_rat = 120;
mph_tai = 0.1;
fra_mpp = 0.5;
dur_pre_bea = 0.5;
dur_res = 10;
thr_ang = 23;
thr_ang_spe = 1.4;
cla_tri = det_cla_tri(fil_pat_exp, fil_pat_ima, fil_pat_tai, fra_rat, mph_tai, fra_mpp, dur_pre_bea, dur_res, thr_ang, thr_ang_spe);

fra_rat = 119.976;
fil_pat_exp = 'X:\kadiram\Data\Raw\KM017\loo\loo.mat';
fil_pat_ima = 'X:\kadiram\Data\Raw\KM017\loo\12-06-2019_0_0.mat';
fil_pat_tai = 'X:\kadiram\Data\Raw\KM017\loo\Robbrecht_experiment0_trial0_TID8604.mat';
mph_tai = 0.1;
fra_mpp = 0.5;
dur_pre_bea = 0.5;
dur_res = 10;
thr_ang = 23;
thr_ang_spe = 1.4;
cla_tri = det_cla_tri(fil_pat_exp, fil_pat_ima, fil_pat_tai, fra_rat, mph_tai, fra_mpp, dur_pre_bea, dur_res, thr_ang, thr_ang_spe);