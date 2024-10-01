%esp216 - One line description of what the script performs (H1 line)
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
tap = rec_fun.esp216();
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
sav_rec(tap)
%
sav_ima_cal(tap)
%
app_pix_dat_axo(tap)
%
app_piv_pla_row_col(tap)
%
det_per_bin_edg(tap)
%
app_log_pla_row_col(tap)
%
app_log_pla_row_col_for(tap)
%
app_axo(tap)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 2024 w14
sav_fig_cor_map_ove(tap)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 2024 w22
sav_fig_axo_cel_sin(tap)