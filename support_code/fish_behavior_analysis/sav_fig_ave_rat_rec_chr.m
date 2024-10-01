%SAV_FIG_AVE_RAT_CHR - One line description of what the script performs (H1 line)
%   Optional file header info (to give more details about the function than in the H1 line)
%   Optional file header info (to give more details about the function than in the H1 line)
%   Optional file header info (to give more details about the function than in the H1 line)
%
%   Description:
%       SAV_FIG_AVE_RAT_CHR description
%
%   Output:
%       SAV_FIG_AVE_RAT_CHR output
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
dat_dir = '\\forskning.it.ntnu.no\ntnu\mh-kin\yaksi4\kadiram\Data\Processed\Chris_data\';
sav_dir = [dat_dir 'Pooled\'];
n_par = 5;
x_lab = 'Time (min)';
fon_siz = 24;
col = 'k';
col_dru = 'b';
col_sti = 'r';
con_typ = 'Control';
bus_typ = 'Buspirone';
for_typ = 'Forskolin';
con_fil_nam = 'con_fis';
bus_fil_nam = 'bus_fis';
for_fil_nam = 'for_fis';
bas_win = [3 8];
dru_win = [15 20];
tap_win = [20 25];
for_bas_win = [3 8];
for_dru_win = [35 40];
for_tap_win = [40 45];
col_bas_win = 'y';
col_dru_win = 'c';
col_tap_win = 'm';

addpath(genpath('\\home.ansatt.ntnu.no\kadiram\Documents\MATLAB\figure'))
load('\\home.ansatt.ntnu.no\kadiram\Documents\MATLAB\chr_dat.mat')

n_con = size(con_tim_fis_par, 2);
n_bus = size(bus_tim_fis_par, 2);
n_for = size(for_tim_fis_par, 2);

sav_ave_rat(con_sta_tim, con_end_tim, con_rat_tim, con_dru_ons, con_sti_ons, con_tim_par_sta, con_typ, con_fil_nam, n_par, col, fon_siz, col_dru, ...
    col_sti, sav_dir, bas_win, dru_win, tap_win, col_bas_win, col_dru_win, col_tap_win, n_con)
sav_ave_rat(bus_sta_tim, bus_end_tim, bus_rat_tim, bus_dru_ons, bus_sti_ons, bus_tim_par_sta, bus_typ, bus_fil_nam, n_par, col, fon_siz, col_dru, ...
    col_sti, sav_dir, bas_win, dru_win, tap_win, col_bas_win, col_dru_win, col_tap_win, n_bus)
sav_ave_rat(for_sta_tim, for_end_tim, for_rat_tim, for_dru_ons, for_sti_ons, for_tim_par_sta, for_typ, for_fil_nam, n_par, col, fon_siz, col_dru, ...
    col_sti, sav_dir, for_bas_win, for_dru_win, for_tap_win, col_bas_win, col_dru_win, col_tap_win, n_for)