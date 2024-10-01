%SAV_FIG_ACC_CON_CHR - save figure across conditions chris
%   Optional file header info (to give more details about the function than in the H1 line)
%   Optional file header info (to give more details about the function than in the H1 line)
%   Optional file header info (to give more details about the function than in the H1 line)
%
%   Description:
%       SAV_FIG_ACC_CON_CHR description
%
%   Output:
%       SAV_FIG_ACC_CON_CHR output
%
%   Other m-files required: none
%   MAT-files required: none
%
%   See also: OTHER_SCRIPT_NAME,  OTHER_FUNCTION_NAME

%   Author: Kadir Mutlu
%   Address: Olav Kyrres gate 9, 7030 Trondheim, Norway
%   email: kadir.a.mutlu@ntnu.no
%   Website: https://www.ntnu.edu/kavli
%   Date: 23-Jun-2019; Last revision: 23-Jun-2019
%
%   Copyright (c) 2019, Kadir Mutlu
bas_dur = 59; % 2s bin size, rate time starts from 1s. ... -1, 1, ...
res_dur = bas_dur;
fon_siz = 24;
y_lab = {'Tail response (Hz)', 'Heart response (Hz)', 'Operculum response (Hz)', 'Mouth response (Hz)', 'Eye response (Hz)'};
fil_pat_sav = '\\forskning.it.ntnu.no\ntnu\mh-kin\yaksi4\kadiram\Data\Processed\Chris_data\Pooled\acc.png';
load('\\home.ansatt.ntnu.no\kadiram\Documents\MATLAB\chr_dat.mat')
sav_fig_acc(con_rat_tim, con_tim_fis_par, con_sti_ons, bus_rat_tim, bus_tim_fis_par, bus_sti_ons, ...
    for_rat_tim, for_tim_fis_par, for_sti_ons, bas_dur, res_dur, fon_siz, y_lab, fil_pat_sav)
function sav_fig_acc(con_rat_tim, con_tim_fis_par, con_sti_ons, bus_rat_tim, bus_tim_fis_par, bus_sti_ons, ...
    for_rat_tim, for_tim_fis_par, for_sti_ons, bas_dur, res_dur, fon_siz, y_lab, fil_pat_sav)
addpath(genpath('\\home.ansatt.ntnu.no\kadiram\Documents\MATLAB\figure'))
[sta_par_con_sta, n, n_par] = com_sta_par_con_sta(con_rat_tim, con_tim_fis_par, con_sti_ons, bus_rat_tim, bus_tim_fis_par, bus_sti_ons, ...
    for_rat_tim, for_tim_fis_par, for_sti_ons, bas_dur, res_dur);
p_com_par = tes(con_rat_tim, con_tim_fis_par, con_sti_ons, bus_rat_tim, bus_tim_fis_par, bus_sti_ons, ...
    for_rat_tim, for_tim_fis_par, for_sti_ons, bas_dur, res_dur);
fig
for i = 1:n_par
    subplot(1, n_par, i)
    errorbar(sta_par_con_sta(i, :, 1), sta_par_con_sta(i, :, 2), 'LineWidth', 2)
    sigstar({[1,2], [1,3], [2,3]}, fon_siz, p_com_par(:, i));
    pre_for_exp(fon_siz)
    xticklabels({'Con', 'Bus', 'For'})
    lab_y_axi(y_lab{i}, fon_siz)
end
[ax,h]=suplabel(['Control n = ' sprintf('%d', n(1)) ' Buspirone n = ' sprintf('%d', n(2)) ' Forskolin n = ' sprintf('%d', n(3))],'t', [.08 .08 .87 .9]);
set(h,'FontSize',fon_siz + 3)
export_fig(fil_pat_sav)
end
function p_com_par = tes(con_rat_tim, con_tim_fis_par, con_sti_ons, bus_rat_tim, bus_tim_fis_par, bus_sti_ons, ...
    for_rat_tim, for_tim_fis_par, for_sti_ons, bas_dur, res_dur)
n_com = 3;
[res_con_fis_par, n_par] = com_res_fis_par_con(con_rat_tim, con_tim_fis_par, con_sti_ons, bus_rat_tim, bus_tim_fis_par, bus_sti_ons, ...
    for_rat_tim, for_tim_fis_par, for_sti_ons, bas_dur, res_dur);
p_com_par = nan(n_com, n_par);
for i = 1:n_par
    for j = 1:n_com
        if j == 1
            p_com_par(j, i) = ranksum(res_con_fis_par{1}(:, i), res_con_fis_par{2}(:, i));
        elseif j ==2
            p_com_par(j, i) = ranksum(res_con_fis_par{1}(:, i), res_con_fis_par{3}(:, i));
        else
            p_com_par(j, i) = ranksum(res_con_fis_par{2}(:, i), res_con_fis_par{3}(:, i));
        end
    end
end
end
function [sta_par_con_sta, n, n_par] = com_sta_par_con_sta(con_rat_tim, con_tim_fis_par, con_sti_ons, bus_rat_tim, bus_tim_fis_par, bus_sti_ons, ...
    for_rat_tim, for_tim_fis_par, for_sti_ons, bas_dur, res_dur)
n_sta = 2;
addpath \\home.ansatt.ntnu.no\kadiram\Documents\MATLAB\statistics
[res_con_fis_par, n_par, n_con] = com_res_fis_par_con(con_rat_tim, con_tim_fis_par, con_sti_ons, bus_rat_tim, bus_tim_fis_par, bus_sti_ons, ...
    for_rat_tim, for_tim_fis_par, for_sti_ons, bas_dur, res_dur);
sta_par_con_sta = nan(n_par, n_con, n_sta);
n = nan(n_con, 1);
for i = 1:n_con
    res_con_fis_par_i = res_con_fis_par{i};
    [sta_par_con_sta(:, i, 1), ~, sta_par_con_sta(:, i, 2), n(i)] = com_sta(res_con_fis_par_i, 1);
end
end
function [res_con_fis_par, n_par, n_con] = com_res_fis_par_con(con_rat_tim, con_tim_fis_par, con_sti_ons, bus_rat_tim, bus_tim_fis_par, bus_sti_ons, ...
    for_rat_tim, for_tim_fis_par, for_sti_ons, bas_dur, res_dur)
n_con = 3;
res_con_fis_par = cell(n_con, 1);
[res_con_fis_par{1}, n_par] = com_res_fis_par(con_rat_tim, con_tim_fis_par, con_sti_ons, bas_dur, res_dur);
res_con_fis_par{2} = com_res_fis_par(bus_rat_tim, bus_tim_fis_par, bus_sti_ons, bas_dur, res_dur);
res_con_fis_par{3} = com_res_fis_par(for_rat_tim, for_tim_fis_par, for_sti_ons, bas_dur, res_dur);
end
function [res_fis_par, n_par] = com_res_fis_par(rat_tim, rat_tim_fis_par, sti_ons, bas_dur, res_dur)
[tri_rat_tim_fis_par, n_tim, n_par, tim, n_fis] = com_tri_rat_tim_fis_par(rat_tim, rat_tim_fis_par, sti_ons, bas_dur, res_dur);
res_fis_par = nan(n_fis, n_par);
for i = 1:n_fis
    for j = 1:n_par
        res_fis_par(i, j) = com_res_mag(tim, tri_rat_tim_fis_par(:, i, j));
    end
end
end
function res_mag = com_res_mag(tim, sig)
[bas_amp, bas_ind] = fin_bas(tim, sig);
[res_amp, res_ind] = fin_res(tim, sig);
res_mag = res_amp - bas_amp;
end
function [res_amp, res_ind] = fin_res(tim, sig)
[~, pea_ind] = findpeaks(sig);
cri_ind = find(tim > 0, 1);
log_pos_ind = pea_ind >= cri_ind;
pos_ind = pea_ind(log_pos_ind);
if isempty(pos_ind)
    res_ind = cri_ind;
else
    res_ind = pos_ind(1);
end
res_amp = sig(res_ind);
end
function [bas_amp, bas_ind] = fin_bas(tim, sig)
sig = -sig;
[~, pea_ind] = findpeaks(sig);
cri_ind = find(tim < 0, 1, 'last');
log_neg_ind = pea_ind <= cri_ind;
neg_ind = pea_ind(log_neg_ind);
if isempty(neg_ind)
    bas_ind = 1;
else
    bas_ind = neg_ind(end);
end
bas_amp = -sig(bas_ind);
end