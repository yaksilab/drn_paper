% Fig5_S7 - population analysis and figures for Fig. 5 and Fig. S7
%   Runs the full analysis pipeline and generates
%   the population-level panels used in Figure 5 and Supplementary Figure S7.
%
%   Outputs:
%       - A large set of analysis results saved to disk (MAT-file).
%       - A comprehensive collection of figures saved to disk.

%   Author: Kadir Mutlu
%   Address: Olav Kyrres gate 9, 7030 Trondheim, Norway
%   email: kadir.a.mutlu@ntnu.no
%   Website: https://www.ntnu.edu/kavli
%
%   Copyright (c) 2019, Kadir Mutlu

%%% Generate the object used throughout the analysis pipeline.
nuc_axo = sam_fun.nuc_axo_fun();
%%% Save animal-level data
beg_ani = 1;
sav_rec_all(nuc_axo, beg_ani)
%
sav_ima_gfa_all(nuc_axo)
%
app_axo_all(nuc_axo, beg_ani)
%
sta_ani = 1;
app_syn_all(nuc_axo, sta_ani)
%
app_tai_all(nuc_axo, sta_ani)
%%% Save sample-level data
sav_dat_sam(nuc_axo)
%
app_tai_dat(nuc_axo)
%
app_roi_r(nuc_axo)
%%% Save figures
sav_fig_inh_exc_sig_roi(nuc_axo)
%
sav_fig_cor_map_ove_all(nuc_axo)
%
sav_fig_edf(nuc_axo)
%
sav_fig_cor_dis_all(nuc_axo)
%
sav_fig_tai_ang(nuc_axo)
%
sav_fig_nuc_axo_bou_non(nuc_axo)
%
sav_fig_cor_dis_tog(nuc_axo)
%
sav_fig_inh_exc_sig_sid(nuc_axo)




%%% Generate the object used throughout the analysis pipeline.
axo = sam_fun.axo_fun();
%%% Save animal-level data
beg_ani = 1;
sav_rec_all(axo, beg_ani)
%
sav_ima_cal_all(axo)
%
app_axo_all(axo, beg_ani)
%%% Save sample-level data
sav_dat_sam(axo)
%
app_roi_r(nuc_axo)
%%% Save figures
sav_fig_cor_map_exc_inh_all(axo)
%
sav_fig_edf(axo)
%
sav_fig_inh_exc_sig_roi(axo)
%
sav_fig_cor_dis_all(axo)
