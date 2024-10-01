function plo_ave_rat(con_sta_tim, con_end_tim, con_rat_tim, dru_ons, sti_ons, con_tim_par_sta, con_typ, n_par, col, fon_siz, col_dru, col_sti, bas_win, ...
    dru_win, tap_win, col_bas_win, col_dru_win, col_tap_win, n)
%PLO_AVE_RAT - One line description of what the function or script performs (H1 line)
%   Optional file header info (to give more details about the function than in the H1 line)
%   Optional file header info (to give more details about the function than in the H1 line)
%   Optional file header info (to give more details about the function than in the H1 line)
%
%   Syntax:
%       output = PLO_AVE_RAT(input1, input2)
%       output = PLO_AVE_RAT(input1, input2, input3)
%
%   Description:
%       PLO_AVE_RAT() - description
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
%   Date: 20-Jun-2019; Last revision: 20-Jun-2019
%
%   Copyright (c) 2019, Kadir Mutlu
%   All rights reserved.
min_sec = 60;
addpath(genpath('\\home.ansatt.ntnu.no\kadiram\Documents\MATLAB\figure'))
bas_win = bas_win*min_sec;
dru_win = dru_win*min_sec;
tap_win = tap_win*min_sec;
for i = 1:n_par
    subplot(5, 1, i)
    plo_sha(con_rat_tim, con_tim_par_sta(:, i, 1), con_tim_par_sta(:, i, 2), col)
    xlim([con_sta_tim con_end_tim])
    %if i ~= n_par
        x_tic = [dru_ons; sti_ons];
        xticks(x_tic)
        xticklabels({[]})
    %end
    hax = gca;
    pre_for_exp(fon_siz)
%     plo_sti_sub(bas_win, hax, col_bas_win)
%     plo_sti_sub(dru_win, hax, col_dru_win)
%     plo_sti_sub(tap_win, hax, col_tap_win)
    plo_sti_sub_tri(bas_win, dru_win, tap_win, hax, col_bas_win, col_dru_win, col_tap_win)
    plo_ver_lin(dru_ons, hax, col_dru)
    plo_ver_lin(sti_ons, hax, col_sti)
    if i == 1
        title('Tail')
    elseif i == 2
        title('Heart')
    elseif i == 3
        title('Operculum')
    elseif i == 4
        title('Mouth')
    elseif i == 5
        title('Eye')
        pre_for_exp(fon_siz)
    end
end

[ax,h]=suplabel('Rate (Hz)','y');
set(h,'FontSize',fon_siz)
[ax,h]=suplabel([con_typ ' fish n = ' sprintf('%d', n)],'t', [.08 .08 .87 .9]);
set(h,'FontSize',fon_siz + 3)
end
