%SAV_FIG_TRI_AVE_CHR - One line description of what the script performs (H1 line)
%   Optional file header info (to give more details about the function than in the H1 line)
%   Optional file header info (to give more details about the function than in the H1 line)
%   Optional file header info (to give more details about the function than in the H1 line)
%
%   Description:
%       SAV_FIG_TRI_AVE_CHR description
%
%   Output:
%       SAV_FIG_TRI_AVE_CHR output
%
%   Other m-files required: none
%   MAT-files required: none
%
%   See also: OTHER_SCRIPT_NAME,  OTHER_FUNCTION_NAME

%   Author: Kadir Mutlu
%   Address: Olav Kyrres gate 9, 7030 Trondheim, Norway
%   email: kadir.a.mutlu@ntnu.no
%   Website: https://www.ntnu.edu/kavli
%   Date: 22-Jun-2019; Last revision: 22-Jun-2019
%
%   Copyright (c) 2019, Kadir Mutlu
bas_dur = 59; % 2s bin size, rate time starts from 1s. ... -1, 1, ...
res_dur = bas_dur;
col_rat = 'b';
col_lin = 'r';
fon_siz = 24;
x_lab = 'Time (s)';
y_lab = {'Tail rate (Hz)', 'Heart rate (Hz)', 'Operculum rate (Hz)', 'Mouth rate (Hz)', 'Eye rate (Hz)'};
con_typ = 'Control';
bus_typ = 'Buspirone';
for_typ = 'Forskolin';
con_fil_pat_sav = '\\forskning.it.ntnu.no\ntnu\mh-kin\yaksi4\kadiram\Data\Processed\Chris_data\Pooled\con_tri.png';
bus_fil_pat_sav = '\\forskning.it.ntnu.no\ntnu\mh-kin\yaksi4\kadiram\Data\Processed\Chris_data\Pooled\bus_tri.png';
for_fil_pat_sav = '\\forskning.it.ntnu.no\ntnu\mh-kin\yaksi4\kadiram\Data\Processed\Chris_data\Pooled\for_tri.png';
load('\\home.ansatt.ntnu.no\kadiram\Documents\MATLAB\chr_dat.mat')
sav_fig_rat_tri(con_rat_tim, con_tim_fis_par, con_sti_ons, bas_dur, res_dur, fon_siz, col_rat, col_lin, con_typ, con_fil_pat_sav, x_lab, y_lab)
sav_fig_rat_tri(bus_rat_tim, bus_tim_fis_par, bus_sti_ons, bas_dur, res_dur, fon_siz, col_rat, col_lin, bus_typ, bus_fil_pat_sav, x_lab, y_lab)
sav_fig_rat_tri(for_rat_tim, for_tim_fis_par, for_sti_ons, bas_dur, res_dur, fon_siz, col_rat, col_lin, for_typ, for_fil_pat_sav, x_lab, y_lab)

function sav_fig_rat_tri(rat_tim, rat_tim_fis_par, sti_ons, bas_dur, res_dur, fon_siz, col_rat, col_lin, typ, fil_pat_sav, x_lab, y_lab)
addpath(genpath('\\home.ansatt.ntnu.no\kadiram\Documents\MATLAB\figure'))
[rat_tim_sta_par, tim, n, n_par] = com_rat_tim_sta_par(rat_tim, rat_tim_fis_par, sti_ons, bas_dur, res_dur);
fig
for i = 1:n_par
    hax = subplot(1, n_par, i);
    h = plo_sha(tim, rat_tim_sta_par(:, 1, i), rat_tim_sta_par(:, 2, i), col_rat);
    plo_ver_lin(0, hax, col_lin)
    pre_for_exp_lab(x_lab, y_lab{i}, fon_siz)
end
[ax,h]=suplabel([typ ' fish n = ' sprintf('%d', n)],'t', [.08 .08 .87 .9]);
set(h,'FontSize',fon_siz + 3)
export_fig(fil_pat_sav)
end

function [rat_tim_sta_par, tim, n, n_par] = com_rat_tim_sta_par(rat_tim, rat_tim_fis_par, sti_ons, bas_dur, res_dur)
addpath \\home.ansatt.ntnu.no\kadiram\Documents\MATLAB\statistics
[tri_rat_tim_fis_par, n_tim, n_par, tim] = com_tri_rat_tim_fis_par(rat_tim, rat_tim_fis_par, sti_ons, bas_dur, res_dur);
rat_tim_sta_par = nan(n_tim, 2, n_par);
[rat_tim_sta_par(:, 1, :), ~, rat_tim_sta_par(:, 2, :), n] = com_sta(tri_rat_tim_fis_par, 2);
end