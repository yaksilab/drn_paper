%spo - One line description of what the script performs (H1 line)
%   Optional file header info (to give more details about the function than in the H1 line)
%   Optional file header info (to give more details about the function than in the H1 line)
%   Optional file header info (to give more details about the function than in the H1 line)
%
%   Description:
%       esp031 description
%
%   Output:
%       esp031 output
%
%   Other m-files required: none
%   MAT-files required: none
%
%   See also: OTHER_SCRIPT_NAME,  OTHER_FUNCTION_NAME

%   Author: Kadir Mutlu
%   Address: Olav Kyrres gate 9, 7030 Trondheim, Norway
%   email: kadir.a.mutlu@ntnu.no
%   Website: https://www.ntnu.edu/kavli
%   Date: 23-Jul-2019; Last revision: 23-Jul-2019
%
%   Copyright (c) 2019, Kadir Mutlu
spo = sam_fun.spo_fun();
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 2025 w22
beg_ani = 1;
sav_rec_all(spo, beg_ani)
%
sav_dat_sam(spo)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 2025 w24
sav_rec_all(spo, beg_ani)
%
app_syn_all(spo, beg_ani)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 2025 w26
sta_ani = 1;
app_tai_all(spo, sta_ani)
%
beg_ani = 3;
sav_ima_spo_all(spo, beg_ani)
%
beg_ani = 1;
sav_roi_all(spo, beg_ani)
app_spo_all(spo, beg_ani)
%
sav_fig_spo_all(spo)
%
sav_fig_pcc_dis_cel(spo, 'ong')
%
app_par_tai_all(spo)
%
sav_fig_tai_qui_all(spo)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 2025 w32
sav_fig_cor_cor_den(spo)
r = ext_var_met(spo, 'r')
%
app_spo(spo)
sav_fig_ofr(spo)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 2025 w44
sav_fig_pcc_dis(spo)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 2025 w48
sav_fig_ccd_spl(spo)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 2026 w02
app_par_som(spo)
%
sav_fig_clu_fid(spo)
%
app_par_spo_all(spo)
%
app_par_spo(spo)
%
sav_fig_clu_fid_bin(spo)