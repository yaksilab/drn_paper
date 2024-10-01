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