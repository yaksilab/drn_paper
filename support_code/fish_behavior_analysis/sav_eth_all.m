%SAV_HEA_RAT - One line description of what the script performs (H1 line)
%   Optional file header info (to give more details about the function than in the H1 line)
%   Optional file header info (to give more details about the function than in the H1 line)
%   Optional file header info (to give more details about the function than in the H1 line)
%
%   Description:
%       SAV_HEA_RAT description
%
%   Output:
%       SAV_HEA_RAT output
%
%   Other m-files required: none
%   MAT-files required: none
%
%   See also: OTHER_SCRIPT_NAME,  OTHER_FUNCTION_NAME

%   Author: Kadir Mutlu
%   Address: Olav Kyrres gate 9, 7030 Trondheim, Norway
%   email: kadir.a.mutlu@ntnu.no
%   Website: https://www.ntnu.edu/kavli
%   Date: 15-Apr-2019; Last revision: 15-Apr-2019
%
%   Copyright (c) 2019, Kadir Mutlu
dat_dir_ima = '\\forskning.it.ntnu.no\ntnu\mh-kin\yaksi4\kadiram\Data\Processed\Chris_data\';
dat_dir_tai = '\\forskning.it.ntnu.no\ntnu\mh-kin\yaksi4\Laetitia\DATA\';
fis_fol = {'Fish156\', 'Fish183\', 'Fish184\', 'Fish187\', 'Fish188\', 'Fish189\', 'Fish190\', 'Fish191\', 'Fish192\', 'Fish194\', 'Fish209\', 'Fish210\', ...
    'Fish211\', 'Fish213\', 'Fish224\', 'Fish233\', 'Fish234\'};
dru = [0 0 0 1 1 1 1 1 1 2 0 2 2 2 1 2 2]';
fil_pat_exp = 'tap';
fil_pat_tai = 'rawData\Robbrecht_experiment';
fil_pat_ima = 'cro_ali';
fil_pat_mas = 'mas';
fra_rat = 25;
pri_com_hea = 2;
pri_com_ope = 1;
pri_com_mou = 1;
pri_com_eye = 1;
chr = 1;
ope_dir = 0;
n_fis = length(fis_fol);
parfor i = 1:n_fis
    disp(i)
    fil_pat_exp_i = [dat_dir_ima fis_fol{i} fil_pat_exp];
    fil_pat_tai_i = [dat_dir_tai fis_fol{i} fil_pat_tai];
    fil_pat_ima_i = [dat_dir_ima fis_fol{i} fil_pat_ima];
    fil_pat_mas_i = [dat_dir_ima fis_fol{i} fil_pat_mas];
    sav_dir_i = [dat_dir_ima fis_fol{i}(1:end - 1)];
    dru_i = dru(i);
    if dru_i == 0
        dru_str_i = 'Control';
    elseif dru_i == 1
        dru_str_i = 'Buspirone';
    else
        dru_str_i = 'Forskolin';
    end
    tit_i = [dru_str_i ' Fish ' fis_fol{i}(5:end - 1)];
    sav_eth(fil_pat_exp_i, fil_pat_tai_i, fil_pat_ima_i, sav_dir_i, fra_rat, pri_com_hea, pri_com_ope, pri_com_mou, pri_com_eye, chr, tit_i, ope_dir)
end