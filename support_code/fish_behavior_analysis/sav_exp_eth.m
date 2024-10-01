%SAV_EXP_ETH - One line description of what the script performs (H1 line)
%   Optional file header info (to give more details about the function than in the H1 line)
%   Optional file header info (to give more details about the function than in the H1 line)
%   Optional file header info (to give more details about the function than in the H1 line)
%
%   Description:
%       SAV_EXP_ETH description
%
%   Output:
%       SAV_EXP_ETH output
%
%   Other m-files required: none
%   MAT-files required: none
%
%   See also: OTHER_SCRIPT_NAME,  OTHER_FUNCTION_NAME

%   Author: Kadir Mutlu
%   Address: Olav Kyrres gate 9, 7030 Trondheim, Norway
%   email: kadir.a.mutlu@ntnu.no
%   Website: https://www.ntnu.edu/kavli
%   Date: 20-Jun-2019; Last revision: 20-Jun-2019
%
%   Copyright (c) 2019, Kadir Mutlu
dat_dir_ima = '\\forskning.it.ntnu.no\ntnu\mh-kin\yaksi4\kadiram\Data\Processed\Chris_data\';
dat_dir_tai = '\\forskning.it.ntnu.no\ntnu\mh-kin\yaksi4\Laetitia\DATA\';
fis_fol = {'Fish189\'};
dru = 1;
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
%
col_tai = 'c';
col_hea = 'r';
col_ope = [0.5843 0.8157 0.9882];
col_mou = 'g';
col_eye = 'k';
%
col_tai_sig = 'k';
col_hea_sig = 'b';
col_ope_sig = 'r';
col_mou_sig = 'k';
col_eye_sig = 'g';
%
col_dru = 'b';
col = 'm';
fon_siz = 24;

% tail
mph_tai = 0.1;
fra_mpp = 0.5;

% heart
per_bin_edg_hea = 10;
min_hea_rat = 0.5;
max_hea_rat = 5;

% operculum
ope_per_hei = 40;
ope_per_pro = 15;
max_obf = 2;
% don't help
ope_per_wid_min = 1;
ope_per_wid_max = 100;
ope_per_dec = 1;

% mouth
per_bin_edg_mou = 25;

% eye
max_ebf = 1;
min_thr = 1000;

%
bin_siz = 2;
sta_dev = bin_siz;

%
fil_pat_sav = '\\home.ansatt.ntnu.no\kadiram\Documents\Presentations\Data\2019_07_01_Lab_meeting\exa_eth.png';

n_fis = length(fis_fol);
for i = 1:n_fis
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
    [dru_ons, sti_ons] = plo_eth(fil_pat_exp_i, fil_pat_tai_i, fil_pat_ima_i, sav_dir_i, fra_rat, pri_com_hea, pri_com_ope, pri_com_mou, pri_com_eye, chr, ...
        tit_i, ope_dir, col_tai, col_hea, col_ope, col_mou, col_eye, col_tai_sig, col_hea_sig, col_ope_sig, col_mou_sig, col_eye_sig, col_dru, col, fon_siz, ...
        mph_tai, fra_mpp, per_bin_edg_hea, min_hea_rat, max_hea_rat, ope_per_hei, ope_per_pro, max_obf, ope_per_wid_min, ope_per_wid_max, ope_per_dec, ...
        per_bin_edg_mou, max_ebf, min_thr, bin_siz, sta_dev);
end
sec_tox_min(dru_ons, sti_ons)
% x_tic = [dru_ons; sti_ons];
% xticks(x_tic)
% xtl = xticklabels;
% n_xtl = length(xtl);
% xtl_min = xtl;
% for i = 1:n_xtl
%     xtl_i = xtl{i};
%     xtl_i_num = str2double(xtl_i);
%     xtl_min_i = xtl_i_num/min_sec;
%     xtl_min{i} = num2str(xtl_min_i);
% end
% xticklabels(xtl_min)
% lab_x_axi(x_lab, fon_siz)

export_fig(fil_pat_sav)