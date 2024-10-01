function sav_ave_rat(con_sta_tim, con_end_tim, con_rat_tim, dru_ons, sti_ons, con_tim_par_sta, con_typ, con_fil_nam, n_par, col, fon_siz, ...
    col_dru, col_sti, sav_dir, bas_win, dru_win, tap_win, col_bas_win, col_dru_win, col_tap_win, n)
%PLO_SAV_AVE_RAT - One line description of what the function or script performs (H1 line)
%   Optional file header info (to give more details about the function than in the H1 line)
%   Optional file header info (to give more details about the function than in the H1 line)
%   Optional file header info (to give more details about the function than in the H1 line)
%
%   Syntax:
%       output = PLO_SAV_AVE_RAT(input1, input2)
%       output = PLO_SAV_AVE_RAT(input1, input2, input3)
%
%   Description:
%       PLO_SAV_AVE_RAT() - description
%    
%   Inputs:
%       input1 - Description
%       input2 - Description
%       input3 - Description
%
%   Outputs:
%       output1 - Description
%       output2 - Description
%
%   Examples: 
%       Line 1 of example
%       Line 2 of example
%       Line 3 of example
%
%   Other m-files required: none
%   Subfunctions: none
%   MAT-files required: none
%
%   See also: OTHER_FUNCTION_NAME1,  OTHER_FUNCTION_NAME2

%   Author: Kadir Mutlu
%   Address: Olav Kyrres gate 9, 7030 Trondheim, Norway
%   email: kadir.a.mutlu@ntnu.no
%   Website: https://www.ntnu.edu/kavli
%   Date: 17-Jun-2019; Last revision: 17-Jun-2019
%
%   Copyright (c) 2019, Kadir Mutlu
%   All rights reserved.
fig
plo_ave_rat(con_sta_tim, con_end_tim, con_rat_tim, dru_ons, sti_ons, con_tim_par_sta, con_typ, n_par, col, fon_siz, col_dru, col_sti, bas_win, ...
    dru_win, tap_win, col_bas_win, col_dru_win, col_tap_win, n)

sec_tox_min(dru_ons, sti_ons)

export_fig([sav_dir con_fil_nam])
end
