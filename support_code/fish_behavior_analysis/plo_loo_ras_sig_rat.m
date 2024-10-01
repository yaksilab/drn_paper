function plo_loo_ras_sig_rat(tai_bea, tai_sig, rat_tim, tai_rat, sta_tim, end_tim, col_tai, col_tai_sig, fon_siz, fra_tim)
%PLO_BEH_RAS - One line description of what the function or script performs (H1 line)
%   Optional file header info (to give more details about the function than in the H1 line)
%   Optional file header info (to give more details about the function than in the H1 line)
%   Optional file header info (to give more details about the function than in the H1 line)
%
%   Syntax:
%       output = PLO_BEH_RAS(input1, input2)
%       output = PLO_BEH_RAS(input1, input2, input3)
%
%   Description:
%       PLO_BEH_RAS() - description
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
%   Date: 06-Mar-2019; Last revision: 06-Mar-2019
%
%   Copyright (c) 2019, Kadir Mutlu
%   All rights reserved.
n_row = 2;
y_axi = 0.5;
x_lab = 'Time (s)';
%
min_tai_rat = min(tai_rat);
max_tai_rat = max(tai_rat);
mid_tai_rat = mean([min_tai_rat, max_tai_rat]);

par_lab = {num2str(min_tai_rat), num2str(mid_tai_rat), num2str(max_tai_rat), 'Tail'};
n_par_lab = length(par_lab);

%
y_axi = plo_rat(y_axi, rat_tim, tai_rat, col_tai);
hold on
y_axi = plo_beh_ras_sig({tai_bea}, y_axi, col_tai, fra_tim, tai_sig, col_tai_sig);

xlim([sta_tim end_tim])
ylim([0.5 n_row + 0.5])

y_tic = 0.5:0.5:n_par_lab + 0.5;
yticks(y_tic)
yticklabels(par_lab)

%
%lab_x_axi(x_lab, fon_siz);
pre_for_exp(fon_siz)
end
