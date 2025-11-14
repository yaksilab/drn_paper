%sha_abl - One line description of what the script performs (H1 line)
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
global xtl_abl
sha_abl = mul_sam;
sha_abl.fil_pat_exp = "X:\kadiram\Data\Raw\esp090\tap.mat";
sha_abl.mul_sam_idx = "sha_abl";
sha_abl.sam = ["tph_sha"; "tph"];
sha_abl.tit_sam = ["Control"; "Ablated"];
%sha_abl.tit_sam_cha = {'Control'; ['\color[rgb]{1, 0, 0} ', 'Ablated']};
sha_abl.tit_sam_cha = {'Sham'; ['\color[rgb]{0.50196, 0, 0.149} ', 'Ablated']};
sha_abl.tit_sho_sam = ["Con"; "Abl"];
sha_abl.tit_sho_sam_cha = {'Con'; xtl_abl};
sha_abl.tit_sup_sho_sam = ["C"; "A"];
%sha_abl.tit_sup_sho_sam_cha = {['\color[rgb]{0, 0, 0} ', 'C']; ['\color[rgb]{1, 0, 0} ', 'A']};
sha_abl.tit_sup_sho_sam_cha = {['\color[rgb]{0, 0, 0} ', 'C']; ...
    ['\color[rgb]{0.50196, 0, 0.149} ', 'A']};
sha_abl.tit_lon_sam = ["tph2 sham animals"; "tph2 MTZ animals"];
%sha_abl.ani_ind_sam = [39; 30];%[esp193; esp188]
sha_abl.ani_ind_sam = [39; 37];%[esp193; esp203]
sha_abl.ind_sam = [1 2];
%sha_abl.col_sam = {'k'; 'r'};
sha_abl.col_sam_con = cellfun(@(x) x/255, {[217,217,217] [115,115,115] [0,0,0]; ...
    [254,217,118] [252,78,42] [128,0,38]}, 'UniformOutput', false);
sha_abl = spe(sha_abl);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
sav_dat_mul_sam(sha_abl)
%
app_all_sam(sha_abl)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
app_tai_dat(sha_abl)
%
sav_fig_ave_cor_dis(sha_abl)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
app_mul_par_tai_all(sha_abl)
app_par_tai_all(sha_abl)
app_par_tai(sha_abl)
%
sav_fig_ave_tai_ang_xsa(sha_abl)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
sav_fig_neu_met(sha_abl)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
app_mul_par_tai_cel_all(sha_abl)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% w44
sav_fig_tai_tri_spo_com(sha_abl)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 2024 w08
app_mul_par_roi_all(sha_abl)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 2024 w14
sav_fig_inh_exc_hig(sha_abl)
%
sav_fig_hig_com(sha_abl)
%
sav_fig_ave_xcc_dis(sha_abl)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 2024 w16
app_mul_par_tai_cel_all(sha_abl)
%
app_par_neu_beh_all(sha_abl)
%
app_par_neu_beh(sha_abl)
%
sav_fig_spa_den_bou_spo(sha_abl)
%
sav_fig_spa_den(sha_abl)
%
app_mul_par_all(sha_abl)
app_par_all(sha_abl)
app_par(sha_abl)
%
sav_fig_cor_dis_ent(sha_abl)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 2024 w18
sav_fig_act_tac(sha_abl)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 2024 28
epo_num = 6;
sav_fig_dia_acc(sha_abl, epo_num)
%
epo_num = 1;
sav_fig_dia_acc(sha_abl, epo_num)
%
sav_fig_abs(sha_abl)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 2024 w42
sav_fig_res(sha_abl)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 2025 w32
sav_fig_cor_dis_ent_thr(sha_abl)
%
epo_num = 6;
fie = 'thr_cel';
sav_fig_dia_acc(sha_abl, epo_num, fie)
%
fie = 'thr_cel';
sav_fig_cor_dis_epo(sha_abl, epo_num, fie)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 2025 w34
sav_fig_thr(sha_abl)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 2025 w36
[p_xsa_one, p_xsa_two] = sav_fig_thr_com(sha_abl);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 2025 w38
epo_num = 1;
fie = 'lon_spo';
sav_fig_cor_dis_epo(sha_abl, epo_num, fie)
%
app_par_fms_all(sha_abl)
%
app_par_fro_sam_all_all(sha_abl)
%
sav_fig_cor_dis_ent_thr(sha_abl)
%
sav_fig_bal(sha_abl)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 2025 w44
h_fig = plo_slo_lin_ove_met(sha_abl);
%
exp_fig(h_fig, [char(sha_abl.poo_dir) '\slo_lin_ove.png'])
%
epo_num = 1;
fie = 'lon_spo';
h_fig = plo_cor_dis_epo_met(sha_abl, epo_num, fie);
%
exp_fig(h_fig, [char(sha_abl.poo_dir) '\cor_dis_epo_' fie '.png'])
%
sav_fig_cor_dis_epo(sha_abl, epo_num, fie)