%gab - One line description of what the script performs (H1 line)
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
gab = sam_fun.gab_fun();
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
sav_rec_all(gab)
%
sta_ani = 1;
app_syn_all(gab, sta_ani)
%
sav_dat_sam(gab)
%
app_bou_all(gab)
%
app_par_tai(gab)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 2023 50
beg_ani = 1;
sav_rec_all(gab, beg_ani)
%
sav_ima_gab_all(gab, beg_ani)
%
sav_roi_all(gab, beg_ani)
%
app_syn_all(gab, beg_ani)
%
sta_ani = 1;
app_tai_all(gab, sta_ani)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 2024 02
app_par_roi_all(gab, beg_ani);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 2024 14
thr = 0.4;
app_gab_omn(gab, thr)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 2024 16
app_par_gab_all(gab)
%
app_par_gab(gab)
%
sav_fig_gab_clu(gab)
%
sav_fig_inh_exc_sig_sid(gab)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 2024 36
sav_fig_clu_sel(gab)
%
sav_fig_pai_cor(gab)
%
sav_fig_inh_exc(gab)