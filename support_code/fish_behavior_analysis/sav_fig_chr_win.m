%SAV_FIG_CHR_WIN - save figure chris window statistics
%   Optional file header info (to give more details about the function than in the H1 line)
%   Optional file header info (to give more details about the function than in the H1 line)
%   Optional file header info (to give more details about the function than in the H1 line)
%
%   Description:
%       SAV_FIG_CHR_WIN description
%
%   Output:
%       SAV_FIG_CHR_WIN output
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
min_sec = 60;
n_win = 3;
%
bas_win = [3 8]*min_sec;
dru_win = [15 20]*min_sec;
tap_win = [20 25]*min_sec;
%
for_dru_win = [35 40]*min_sec;
for_tap_win = [40 45]*min_sec;
%
con_fil_pat_sav = '\\forskning.it.ntnu.no\ntnu\mh-kin\yaksi4\kadiram\Data\Processed\Chris_data\Pooled\con_sta.png';
bus_fil_pat_sav = '\\forskning.it.ntnu.no\ntnu\mh-kin\yaksi4\kadiram\Data\Processed\Chris_data\Pooled\bus_sta.png';
for_fil_pat_sav = '\\forskning.it.ntnu.no\ntnu\mh-kin\yaksi4\kadiram\Data\Processed\Chris_data\Pooled\for_sta.png';
fon_siz = 24;
y_lab = {'Tail rate (Hz)', 'Heart rate (Hz)', 'Operculum rate (Hz)', 'Mouth rate (Hz)', 'Eye rate (Hz)'};
con_typ = 'Control';
bus_typ = 'Buspirone';
for_typ = 'Forskolin';
%
load('\\home.ansatt.ntnu.no\kadiram\Documents\MATLAB\chr_dat.mat')
%
[con_sta_win_sta_par, con_ave_win_fis_par, con_n, ~, con_p_int_par] = com_sta_win_sta_par(con_rat_tim, con_tim_fis_par, bas_win, dru_win, tap_win, n_win);
[bus_sta_win_sta_par, bus_ave_win_fis_par, bus_n, ~, bus_p_int_par] = com_sta_win_sta_par(bus_rat_tim, bus_tim_fis_par, bas_win, dru_win, tap_win, n_win);
[for_sta_win_sta_par, for_ave_win_fis_par, for_n, n_par, for_p_int_par] = ...
    com_sta_win_sta_par(for_rat_tim, for_tim_fis_par, bas_win, for_dru_win, for_tap_win, n_win);

sav_par_sta(con_fil_pat_sav, con_sta_win_sta_par, n_par, fon_siz, y_lab, con_p_int_par, con_typ, con_n)
sav_par_sta(bus_fil_pat_sav, bus_sta_win_sta_par, n_par, fon_siz, y_lab, bus_p_int_par, bus_typ, bus_n)
sav_par_sta(for_fil_pat_sav, for_sta_win_sta_par, n_par, fon_siz, y_lab, for_p_int_par, for_typ, for_n)

function sav_par_sta(fil_pat_sav, sta_win_sta_par, n_par, fon_siz, y_lab, p_int_par, typ, n)
addpath(genpath('\\home.ansatt.ntnu.no\kadiram\Documents\MATLAB\figure'))
fig
for i = 1:n_par
    subplot(1, n_par, i)
    errorbar(sta_win_sta_par(:, 1, i), sta_win_sta_par(:, 2, i), 'LineWidth', 2)
    sigstar({[1,2], [2,3]}, fon_siz, p_int_par(:, i));
    pre_for_exp(fon_siz)
    xticklabels({'Base', 'Drug', 'Tap'})
    lab_y_axi(y_lab{i}, fon_siz)
end
[ax,h]=suplabel([typ ' fish n = ' sprintf('%d', n)],'t', [.08 .08 .87 .9]);
set(h,'FontSize',fon_siz + 3)
export_fig(fil_pat_sav)
end

function [sta_win_sta_par, ave_win_fis_par, n, n_par, p_int_par] = com_sta_win_sta_par(rat_tim, sig_tim_fis_par, bas_win, dru_win, tap_win, n_win)
addpath \\home.ansatt.ntnu.no\kadiram\Documents\MATLAB\statistics
[ave_win_fis_par, n_par] = com_ave_win_fis_par(rat_tim, sig_tim_fis_par, bas_win, dru_win, tap_win, n_win);
[sta_win_sta_par(:, 1, :), ~, sta_win_sta_par(:, 2, :), n] = com_sta(ave_win_fis_par, 2);
p_int_par = nan(2, n_par);
for i = 1:n_par
    ave_bas_fis_i = ave_win_fis_par(1, :, i);
    ave_dru_fis_i = ave_win_fis_par(2, :, i);
    ave_tap_fis_i = ave_win_fis_par(3, :, i);
    
    p_int_par(1, i) = signrank(ave_bas_fis_i, ave_dru_fis_i);
    p_int_par(2, i) = signrank(ave_dru_fis_i, ave_tap_fis_i);
end
end

function [ave_win_fis_par, n_par] = com_ave_win_fis_par(rat_tim, sig_tim_fis_par, bas_win, dru_win, tap_win, n_win)
[~, n_fis, n_par] = size(sig_tim_fis_par);
ave_win_fis_par = nan(n_win, n_fis, n_par);
sig_win_tim_fis_par = win_sig_mul(rat_tim, sig_tim_fis_par, bas_win, dru_win, tap_win, n_win);
for i = 1:n_win
    sig_win_tim_fis_par_i = sig_win_tim_fis_par{i};
    ave_win_fis_par(i, :, :) = mean(sig_win_tim_fis_par_i);
end
end

function sig_win_tim_fis_par = win_sig_mul(rat_tim, sig_tim_fis_par, bas_win, dru_win, tap_win, n_win)
sig_win_tim_fis_par = cell(n_win, 1);
sig_win_tim_fis_par{1} = win_sig_sin(rat_tim, sig_tim_fis_par, bas_win);
sig_win_tim_fis_par{2} = win_sig_sin(rat_tim, sig_tim_fis_par, dru_win);
sig_win_tim_fis_par{3} = win_sig_sin(rat_tim, sig_tim_fis_par, tap_win);
end

function sig_tim_fis_par = win_sig_sin(rat_tim, sig_tim_fis_par, win)
log_win = rat_tim >= win(1) & rat_tim < win(2);
sig_tim_fis_par = sig_tim_fis_par(log_win, :, :);
end