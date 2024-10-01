%tph_sha - One line description of what the script performs (H1 line)
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
cel_onl = sam_fun.cel_onl_fun();
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
sav_rec_all(cel_onl)
%
sav_ima_cal_all(cel_onl)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
sav_dat_sam(cel_onl)
%
app_par_axo_onl(cel_onl)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
sta_ani = 1;
app_syn_axo_all(cel_onl, sta_ani)
%
app_tai_all(cel_onl, sta_ani)
%
sta_ani = 5;
app_cel_log_pla_row_col_all(cel_onl, sta_ani)
%
det_per_bin_edg_all(cel_onl, sta_ani)
%
app_log_pla_icx_row_col_all(cel_onl, sta_ani)
%
app_som_log_pla_row_col_cel_all(cel_onl, sta_ani)
%
app_som(cel_onl)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% w44
app_gab_clu_cel_k_all(cel_onl)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% w48
app_par_tai_all(cel_onl)
%
app_par_tai(cel_onl)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 2024 w12
sav_fig_ong_cel_all(cel_onl)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 2024 w14
sav_fig_inh_exc_sig(cel_onl)
%
sav_fig_pcc_dis(cel_onl)
%
app_par_som_all(cel_onl)
%
sav_fig_clu_fid(cel_onl)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 2024 w16
sav_fig_cor_cor_den(cel_onl)
%
sav_fig_clu(cel_onl)
%
sav_fig_inh_exc_spa_all(cel_onl)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 2024 w18
sav_fig_res(cel_onl)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 2024 w20
app_par_som(cel_onl)
%
sav_fig_pie(cel_onl)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 2024 w36
sav_fig_clu_fid(cel_onl)