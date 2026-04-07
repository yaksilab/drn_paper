%Fig3_S5 - Main batch analysis and panels for Fig. 3 and Fig. S5
%   Runs the full analysis pipeline and generates the
%   population-level panels used in Figure 3 and Supplementary Figure S5.
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
gab = sam_fun.gab_fun();
%%% Save animal-level data
beg_ani = 1;
sav_rec_all(gab, beg_ani)
%
sta_ani = 1;
app_syn_all(gab, sta_ani)
app_tai_all(gab, sta_ani)
%%% Save sample-level data
sav_dat_sam(gab)
%
app_tai_dat(gab)
%%% Preprocess calcium imaging data
beg_ani = 1;
sav_ima_gab_all(gab, beg_ani)
%
sav_roi_all(gab, beg_ani)
%
app_par_roi_all(gab, beg_ani);
%%% Append processed data
thr = 0.4;
app_gab_omn(gab, thr)
%%% Save figures
sav_fig_gab_clu(gab)
%
sav_fig_inh_exc_sig_sid(gab)
%
sav_fig_clu_sel(gab)
%
sav_fig_pai_cor(gab)
%
sav_fig_inh_exc(gab)
%
sav_fig_pie_gab(gab)
%
sav_fig_num_gab(gab)
%
sav_fig_clu_sel_pai_cor(gab)
%
sav_fig_gab_clu(gab)
%
sav_fig_z_sco_cel_all(gab)
%
sav_fig_z_sco_cel(gab)
%
sav_fig_gab_mod(gab)
%
sav_fig_gab_clu_onl(gab)