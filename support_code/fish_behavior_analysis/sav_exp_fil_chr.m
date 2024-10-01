%SAV_EXP_FIL_CHR - One line description of what the script performs (H1 line)
%   Optional file header info (to give more details about the function than in the H1 line)
%   Optional file header info (to give more details about the function than in the H1 line)
%   Optional file header info (to give more details about the function than in the H1 line)
%
%   Description:
%       SAV_EXP_FIL_CHR description
%
%   Output:
%       SAV_EXP_FIL_CHR output
%
%   Other m-files required: none
%   MAT-files required: none
%
%   See also: OTHER_SCRIPT_NAME,  OTHER_FUNCTION_NAME

%   Author: Kadir Mutlu
%   Address: Olav Kyrres gate 9, 7030 Trondheim, Norway
%   email: kadir.a.mutlu@ntnu.no
%   Website: https://www.ntnu.edu/kavli
%   Date: 13-Jun-2019; Last revision: 13-Jun-2019
%
%   Copyright (c) 2019, Kadir Mutlu
dat_dir = '\\forskning.it.ntnu.no\ntnu\mh-kin\yaksi4\kadiram\Data\Processed\Chris_data\';
fis_fol = {'Fish156\', 'Fish183\', 'Fish184\', 'Fish187\', 'Fish188\', 'Fish189\', 'Fish190\', 'Fish191\', 'Fish192\', 'Fish194\', 'Fish209\', 'Fish210\', ...
    'Fish211\', 'Fish213\', 'Fish224\', 'Fish233\', 'Fish234\'};
len_rec = [0 0 0 0 0 0 0 0 0 1 0 1 1 1 0 1 1];
fra_rat = 25;
min_sec = 60;
dru_ons = 8*min_sec;
sta_tim = 0;

n_fis = length(fis_fol);
for i = 1:n_fis
    disp(i)
    if len_rec(i) == 0
        sti_ons = [20 25 30 35 40]'*min_sec;
        end_tim = 45*min_sec;
    else
        sti_ons = [40 45 50 55 60]'*min_sec;
        end_tim = 65*min_sec;
    end
    exp_fil_i = [dat_dir fis_fol{i} 'tap'];
    save(exp_fil_i, 'dru_ons', 'sti_ons', 'sta_tim', 'end_tim');
end