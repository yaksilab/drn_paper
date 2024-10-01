%esp228 - One line description of what the script performs (H1 line)
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
%   Copyright (c) 2019, Kadir Mutlu
tap = rec_fun.esp228();
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
sav_rec(tap)
%
sav_ima_cal(tap)
%
app_piv_pla_row_col(tap)
%
app_pix_dat_axo(tap)
%
det_per_bin_edg(tap)
%
app_log_pla_row_col(tap)
%
app_log_pla_icx_row_col(tap)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[man_sec, ini_del] = app_syn(tap);
%
app_tai(tap)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 2024 w02
app_par_tai(tap)
%
app_par_tai_pix(tap)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 2024 w14
app_par_axo_onl(tap)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 2024 w24
sav_fig_axo_sin_pix(tap)