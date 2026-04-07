%Fig4_S6 - population analysis and panels for Fig. 4 and Fig. S6
%   Runs the full analysis pipeline and generates the
%   population-level figures used in Figure 4 and Supplementary Figure S6.
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
axo_onl = sam_fun.axo_onl_fun();
%%% Save animal-level data
sav_axo_onl_all(axo_onl)
%
app_syn_axo_all(axo_onl)
%
app_tai_all(axo_onl)
%%% Save sample-level data
sav_dat_sam(axo_onl)
%
app_tai_dat(axo_onl)
%%% Preprocess calcium imaging data
beg_ani = 1;
app_log_pla_icx_row_col_all(axo_onl, beg_ani)
%%% Append processed data
app_dff_row_con_fra_ani(axo_onl)
%
app_con_axo_onl(axo_onl)
%%% Save figures
sav_fig_pcc_dis_tai(axo_onl)
%
sav_fig_bin_sig_all(axo_onl)
%
sav_fig_pcc_dis(axo_onl)
%
sav_fig_pie_axo(axo_onl)
%
sav_fig_inh_exc_spl(axo_onl)
%
sav_fig_pcc_dis_cel(axo_onl, 'ong')
%
sav_fig_spa_den_dor_ven(axo_onl)
%
sav_fig_dif_spa_den(axo_onl)
%
sav_fig_dsd(axo_onl)
%
sav_fig_spa_den_ave(axo_onl)
%
sav_fig_spa_den_sid(axo_onl)
%
sav_fig_dsd_sid(axo_onl)
