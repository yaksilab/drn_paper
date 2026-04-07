% Fig7_S9 - population analysis and figures for Fig. 7 and Fig. S9
%   Runs the full analysis pipeline and generates
%   the population-level panels used in Figure 7 and Supplementary Figure S9.
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
rap_fre = mul_sam;
rap_fre.mul_sam_idx = "rap_fre";
rap_fre.tit_sam = ["Control"; "Ablated"];
rap_fre.tit_sho_sam = ["Con"; "Abl"];
rap_fre.tit_lon_sam = ["Control animals"; "Ablated animals"];
rap_fre = spe(rap_fre);
%%% Save multi-sample-level data
sav_dat_mul_sam(rap_fre)
%%% Append processed data
app_fre_dat(rap_fre)
%
app_tra(rap_fre)
%%% Save figures
sav_fig_tap_fre(rap_fre)
%
sav_fig_sig_fre(rap_fre)
%
sav_fig_dis_fre(rap_fre)
%
sav_fig_foc_fre(rap_fre)
%
sav_fig_tax(rap_fre)
%
sav_fig_dis_foc_sca(rap_fre)
%
sav_fig_spe_sca_ric(rap_fre)
%
sav_fig_nta_fre(rap_fre)
%
sav_fig_nta_sca(rap_fre)
%
sav_fig_tau_com(rap_fre)
%
sav_fig_nor_ypc_ric(rap_fre)
%
sav_fig_p_win(rap_fre)
%
sav_fig_tax_hea(rap_fre)
%
sav_fig_ypc_hea(rap_fre)




%%% Generate the object used throughout the analysis pipeline.
two = mul_sam;
two.mul_sam_idx = "two";
two.tit_sam = ["Sham"; "Ablated"; "MTZ"];
two.tit_sho_sam = ["Sha"; "Abl"; "MTZ"];
two.tit_lon_sam = ["Sham animals"; "Ablated animals"; "MTZ animals"];
two.ind_sam = 1:3;
two = spe(two);
%%% Generate the object used throughout the analysis pipeline.
sav_dat_mul_sam(two)
%%% Append processed data
app_two_dat(two)
%%% Save figures
sav_fig_ntt_occ_hea(two)
%
sav_fig_ntt_tim(two)
%
sav_fig_ntt_sca_ear(two)
%
sav_fig_ntt_occ_sca(two)
%
sav_fig_bas_spe(two)
