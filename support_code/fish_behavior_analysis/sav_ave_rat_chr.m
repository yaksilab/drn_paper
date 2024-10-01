%SAV_AVE_RAT - One line description of what the script performs (H1 line)
%   Optional file header info (to give more details about the function than in the H1 line)
%   Optional file header info (to give more details about the function than in the H1 line)
%   Optional file header info (to give more details about the function than in the H1 line)
%
%   Description:
%       SAV_AVE_RAT description
%
%   Output:
%       SAV_AVE_RAT output
%
%   Other m-files required: none
%   MAT-files required: none
%
%   See also: OTHER_SCRIPT_NAME,  OTHER_FUNCTION_NAME

%   Author: Kadir Mutlu
%   Address: Olav Kyrres gate 9, 7030 Trondheim, Norway
%   email: kadir.a.mutlu@ntnu.no
%   Website: https://www.ntnu.edu/kavli
%   Date: 14-Jun-2019; Last revision: 14-Jun-2019
%
%   Copyright (c) 2019, Kadir Mutlu
dat_dir = '\\forskning.it.ntnu.no\ntnu\mh-kin\yaksi4\kadiram\Data\Processed\Chris_data\';
dat_dir_tai = '\\forskning.it.ntnu.no\ntnu\mh-kin\yaksi4\Laetitia\DATA\';
fis_fol = {'Fish156\', 'Fish183\', 'Fish184\', 'Fish187\', 'Fish188\', 'Fish189\', 'Fish190\', 'Fish191\', 'Fish192\', 'Fish194\', 'Fish209\', 'Fish210\', ...
    'Fish211\', 'Fish213\', 'Fish224\', 'Fish233\', 'Fish234\'};
dru = [0 0 0 1 1 1 1 1 1 2 0 2 2 2 1 2 2]';
fil_pat_exp = 'tap';
fil_pat_tai = 'rawData\Robbrecht_experiment';
fil_pat_ima = 'cro_ali';
fil_pat_mas = 'mas';
chr = 1;
pri_com_hea = 2;
pri_com_ope = 1;
pri_com_mou = 1;
pri_com_eye = 1;
fra_rat = 25;
% tail
mph_tai = 0.1;
fra_mpp = 0.5;
% heart
per_bin_edg_hea = 10;
% operculum
ope_dir = 0;
ope_per_hei = 40;
ope_per_pro = 15;
% mouth
per_bin_edg_mou = 25;
% eye
min_thr = 1000;
% rate
bin_siz = 2;
sta_dev = bin_siz;
sav_dir = [dat_dir 'Pooled\'];
n_fis = length(fis_fol);
n_con = 4;
n_bus = 7;
n_for = 6;
n_par = 5;
n_sta = 2;
dim = 2;
x_lab = 'Time (s)';
fon_siz = 24;
col = 'k';
col_dru = 'b';
col_sti = 'm';
con_fil_nam = 'con_fis';
bus_fil_nam = 'bus_fis';
for_fil_nam = 'for_fis';
con_typ = 'Control';
bus_typ = 'Buspirone';
for_typ = 'Forskolin';
addpath(genpath('\\home.ansatt.ntnu.no\kadiram\Documents\MATLAB\figure'), '\\home.ansatt.ntnu.no\kadiram\Documents\MATLAB\statistics', ...
    '\\home.ansatt.ntnu.no\kadiram\Documents\MATLAB\Fish_video_analysis')
con_tim_fis_par = [];
bus_tim_fis_par = [];
for_tim_fis_par = [];
for i = 1:n_fis
    disp(i)
    fil_pat_exp_i = [dat_dir fis_fol{i} fil_pat_exp];
    fil_pat_ima_i = [dat_dir fis_fol{i} fil_pat_ima];
    fil_pat_tai_i = [dat_dir_tai fis_fol{i} fil_pat_tai];
    fil_pat_mas_i = [dat_dir fis_fol{i} fil_pat_mas];
    [~, ~, ~, ~, ~, ~, ~, ~, ~, ~, ~, rat_tim_i, tai_rat_i, hea_rat_i, ope_rat_i, mou_rat_i, eye_rat_i, sta_tim_i, end_tim_i, dru_ons_i, sti_ons_i] = ...
        ext_fis_sig(fil_pat_exp_i, fil_pat_ima_i, fil_pat_tai_i, fil_pat_mas_i, chr, pri_com_hea, pri_com_ope, pri_com_mou, pri_com_eye, fra_rat, mph_tai, ...
        fra_mpp, per_bin_edg_hea, ope_dir, ope_per_hei, ope_per_pro, per_bin_edg_mou, min_thr, bin_siz, sta_dev);
    dru_i = dru(i);
    if dru_i == 0
        con_sta_tim = sta_tim_i;
        con_end_tim = end_tim_i;
        con_rat_tim = rat_tim_i;
        con_dru_ons = dru_ons_i;
        con_sti_ons = sti_ons_i;
        n_con_rat_tim = length(con_rat_tim);
        con_tim_fis_par = [con_tim_fis_par nan(n_con_rat_tim, 1, n_par)];
        con_tim_fis_par(:, end, 1) = tai_rat_i;
        con_tim_fis_par(:, end, 2) = hea_rat_i;
        con_tim_fis_par(:, end, 3) = ope_rat_i;
        con_tim_fis_par(:, end, 4) = mou_rat_i;
        con_tim_fis_par(:, end, 5) = eye_rat_i;
    elseif dru_i == 1
        bus_sta_tim = sta_tim_i;
        bus_end_tim = end_tim_i;
        bus_rat_tim = rat_tim_i;
        bus_dru_ons = dru_ons_i;
        bus_sti_ons = sti_ons_i;
        n_bus_rat_tim = length(bus_rat_tim);
        bus_tim_fis_par = [bus_tim_fis_par nan(n_bus_rat_tim, 1, n_par)];
        bus_tim_fis_par(:, end, 1) = tai_rat_i;
        bus_tim_fis_par(:, end, 2) = hea_rat_i;
        bus_tim_fis_par(:, end, 3) = ope_rat_i;
        bus_tim_fis_par(:, end, 4) = mou_rat_i;
        bus_tim_fis_par(:, end, 5) = eye_rat_i;
    else
        for_sta_tim = sta_tim_i;
        for_end_tim = end_tim_i;
        for_rat_tim = rat_tim_i;
        for_dru_ons = dru_ons_i;
        for_sti_ons = sti_ons_i;
        n_for_rat_tim = length(for_rat_tim);
        for_tim_fis_par = [for_tim_fis_par nan(n_for_rat_tim, 1, n_par)];
        for_tim_fis_par(:, end, 1) = tai_rat_i;
        for_tim_fis_par(:, end, 2) = hea_rat_i;
        for_tim_fis_par(:, end, 3) = ope_rat_i;
        for_tim_fis_par(:, end, 4) = mou_rat_i;
        for_tim_fis_par(:, end, 5) = eye_rat_i;
    end
end
%
con_tim_par_sta = nan(n_con_rat_tim, n_par, n_sta);
bus_tim_par_sta = nan(n_bus_rat_tim, n_par, n_sta);
for_tim_par_sta = nan(n_for_rat_tim, n_par, n_sta);
for i = 1:n_par
    [con_tim_par_sta(:, i, 1), ~, con_tim_par_sta(:, i, 2)] = com_sta(con_tim_fis_par(:, :, i), dim);
    [bus_tim_par_sta(:, i, 1), ~, bus_tim_par_sta(:, i, 2)] = com_sta(bus_tim_fis_par(:, :, i), dim);
    [for_tim_par_sta(:, i, 1), ~, for_tim_par_sta(:, i, 2)] = com_sta(for_tim_fis_par(:, :, i), dim);
end
save('chr_dat', 'con_sta_tim', 'con_end_tim', 'bus_sta_tim', 'bus_end_tim', 'for_sta_tim', 'for_end_tim', 'con_rat_tim', 'bus_rat_tim', 'for_rat_tim', ...
    'con_dru_ons', 'con_sti_ons', 'bus_dru_ons', 'bus_sti_ons', 'for_dru_ons', 'for_sti_ons', 'con_tim_par_sta', 'bus_tim_par_sta', 'for_tim_par_sta', ...
    'con_tim_fis_par', 'bus_tim_fis_par', 'for_tim_fis_par')
%
sav_ave_rat(con_sta_tim, con_end_tim, con_rat_tim, con_dru_ons, con_sti_ons, con_tim_par_sta, con_typ, con_fil_nam, n_par, col, fon_siz, x_lab, col_dru, ...
    col_sti, sav_dir)
sav_ave_rat(bus_sta_tim, bus_end_tim, bus_rat_tim, bus_dru_ons, bus_sti_ons, bus_tim_par_sta, bus_typ, bus_fil_nam, n_par, col, fon_siz, x_lab, col_dru, ...
    col_sti, sav_dir)
sav_ave_rat(for_sta_tim, for_end_tim, for_rat_tim, for_dru_ons, for_sti_ons, for_tim_par_sta, for_typ, for_fil_nam, n_par, col, fon_siz, x_lab, col_dru, ...
    col_sti, sav_dir)