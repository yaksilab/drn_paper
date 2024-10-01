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