%rap - ntt
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
rap_fre = mul_sam;
rap_fre.mul_sam_idx = "rap_fre";
rap_fre.tit_sam = ["Control"; "Ablated"];
rap_fre.tit_sho_sam = ["Con"; "Abl"];
rap_fre.tit_lon_sam = ["Control animals"; "Ablated animals"];
rap_fre = spe(rap_fre);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
sav_dat_mul_sam(rap_fre)
%
app_fre_dat(rap_fre)
%
sav_fig_tap_fre(rap_fre)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
app_tra(rap_fre)
%
sav_fig_ntt(rap_fre)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% w24
sav_fig_sig_fre(rap_fre)
%
sav_fig_dis_fre(rap_fre)
%
sav_fig_foc_fre(rap_fre)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 2024 w42
app_par_fre(rap_fre)
%
sav_fig_tax(rap_fre)
%
sav_fig_dis_foc_sca(rap_fre)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 2025 w06
sav_fig_tax_spe(rap_fre)
%
sav_fig_spe_sca_ric(rap_fre)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 2025 w26
sav_fig_nta_fre(rap_fre)
%
sav_fig_nta_sca(rap_fre)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 2025 w32
sav_fig_hab_ric(rap_fre)
%
sav_fig_tau_com(rap_fre)
%
sav_fig_nor_ypc_ric(rap_fre)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 2025 w34
sav_fig_p_win(rap_fre)
%
sav_fig_hab_dyn_ric(rap_fre)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 2025 w36
sav_fig_tax_hea(rap_fre)
%
sav_fig_ypc(rap_fre)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 2025 w38
sav_fig_ypc_hea(rap_fre)

%rap - nov
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
two = mul_sam;
two.mul_sam_idx = "two";
two.tit_sam = ["Sham"; "Ablated"; "MTZ"];
two.tit_sho_sam = ["Sha"; "Abl"; "MTZ"];
two.tit_lon_sam = ["Sham animals"; "Ablated animals"; "MTZ animals"];
two.ind_sam = 1:3;
two = spe(two);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
sav_dat_mul_sam(two)
%
app_two_dat(two)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 2024 w18
app_par_two_dat(two)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 2024 w22
sav_fig_ntt_occ_hea(two)
%
sav_fig_ntt_tim(two)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 2024 w30
sav_fig_ntt_sca_ear(two)
%
sav_fig_ntt_occ_sca(two)
%
sav_fig_bas_spe(two)