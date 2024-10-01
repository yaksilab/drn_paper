classdef chr_pri_cla
    properties
        fil_pat_sam
        shi
        bas_dur
        res_dur
        bas_win_siz
        res_win_siz
        col_rat
        col_lin
        fon_siz
        x_lab
        y_lab
        y_lab_com
        con_typ
        bus_typ
        for_typ
        con_fil_pat_sav
        bus_fil_pat_sav
        for_fil_pat_sav
        fil_pat_fig_com
    end
    methods
        function app_tri_dat(obj)
            addpath('\\home.ansatt.ntnu.no\kadiram\Documents\MATLAB\Fish_behavior_analysis')
            load(obj.fil_pat_sam)
            [rat_tim_sta_par, tri_tim, n, n_par, con_tri_rat_tim_fis_par] = com_rat_tim_sta_par_sam(con_rat_tim, con_tim_fis_par, con_sti_ons, ...
                obj.bas_dur, obj.res_dur);
            [rat_tim_sta_par, tri_tim, n, n_par, bus_tri_rat_tim_fis_par] = com_rat_tim_sta_par_sam(bus_rat_tim, bus_tim_fis_par, bus_sti_ons, ...
                obj.bas_dur, obj.res_dur);
            [rat_tim_sta_par, tri_tim, n, n_par, for_tri_rat_tim_fis_par] = com_rat_tim_sta_par_sam(for_rat_tim, for_tim_fis_par, for_sti_ons, ...
                obj.bas_dur, obj.res_dur);
            save(obj.fil_pat_sam, 'tri_tim', 'con_tri_rat_tim_fis_par', 'bus_tri_rat_tim_fis_par', 'for_tri_rat_tim_fis_par', '-append')
        end
        function app_res_dat(obj)
            addpath('\\home.ansatt.ntnu.no\kadiram\Documents\MATLAB\Fish_behavior_analysis')
            load(obj.fil_pat_sam)
            n_con = 3;
            res_mag_con_ani_par = cell(n_con, 1);
            res_mag_con_ani_par{1} = com_res_mag_ani_par(tri_tim, con_tri_rat_tim_fis_par, obj.bas_win_siz, obj.res_win_siz);
            res_mag_con_ani_par{2} = com_res_mag_ani_par(tri_tim, bus_tri_rat_tim_fis_par, obj.bas_win_siz, obj.res_win_siz);
            res_mag_con_ani_par{3} = com_res_mag_ani_par(tri_tim, for_tri_rat_tim_fis_par, obj.bas_win_siz, obj.res_win_siz);
            save(obj.fil_pat_sam, 'res_mag_con_ani_par', '-append')
        end
        function sav_fig_rat_tri_all(obj)
            load(obj.fil_pat_sam)
            sav_fig_rat_tri(con_rat_tim, con_tim_fis_par, con_sti_ons, obj.bas_dur, obj.res_dur, obj.fon_siz, obj.col_rat, obj.col_lin, obj.con_typ, ...
                obj.con_fil_pat_sav, obj.x_lab, obj.y_lab, obj.shi)
            sav_fig_rat_tri(bus_rat_tim, bus_tim_fis_par, bus_sti_ons, obj.bas_dur, obj.res_dur, obj.fon_siz, obj.col_rat, obj.col_lin, obj.bus_typ, ...
                obj.bus_fil_pat_sav, obj.x_lab, obj.y_lab, obj.shi)
            sav_fig_rat_tri(for_rat_tim, for_tim_fis_par, for_sti_ons, obj.bas_dur, obj.res_dur, obj.fon_siz, obj.col_rat, obj.col_lin, obj.for_typ, ...
                obj.for_fil_pat_sav, obj.x_lab, obj.y_lab, obj.shi)
        end
        function sav_fig_com(obj)
            addpath(genpath('\\home.ansatt.ntnu.no\kadiram\Documents\MATLAB\figure'))
            n_par = 5;
            load(obj.fil_pat_sam, 'res_mag_con_ani_par')
            fon_siz = 22;
            p_com_par = tes(res_mag_con_ani_par);
            n_con = length(res_mag_con_ani_par);
            n = nan(n_con, 1);
            fig
            for i = 1:n_par
                subplot(1, n_par, i)
                for j = 1:n_con
                    n_ani = size(res_mag_con_ani_par{j}, 1);
                    n(j) = n_ani;
                    con = j*ones(n_ani, 1);
                    scatter(con, res_mag_con_ani_par{j}(:, i))
                    hold on
                end
                xlim([0 n_con])
                xticks(1:n_con)
                sigstar({[1,2], [1,3], [2,3]}, fon_siz, p_com_par(:, i));
                pre_for_exp(fon_siz)
                xticklabels({'Con', 'Bus', 'For'})
                lab_y_axi(obj.y_lab_com{i}, fon_siz)
            end
            [~, h] = suplabel(['Control n = ' sprintf('%d', n(1)) ' Buspirone n = ' sprintf('%d', n(2)) ' Forskolin n = ' sprintf('%d', n(3))],'t', ...
                [.08 .08 .87 .9]);
            set(h, 'FontSize', fon_siz + 3)
            export_fig(obj.fil_pat_fig_com)
        end
    end
end

function sav_fig_rat_tri(rat_tim, rat_tim_ani_par, sti_ons, bas_dur, res_dur, fon_siz, col_rat, col_lin, typ, fil_pat_sav, x_lab, y_lab, shi)
addpath(genpath('\\home.ansatt.ntnu.no\kadiram\Documents\MATLAB\figure'), '\\home.ansatt.ntnu.no\kadiram\Documents\MATLAB\Fish_behavior_analysis')
sti_ons = sti_ons + shi;
[rat_tim_sta_par, tim, n, n_par, tri_rat_tim_fis_par] = com_rat_tim_sta_par_sam(rat_tim, rat_tim_ani_par, sti_ons, bas_dur, res_dur);
fig
for i = 1:n_par
    hax = subplot(1, n_par, i);
    h = plo_sha(tim, rat_tim_sta_par(:, 1, i), rat_tim_sta_par(:, 2, i), col_rat);
    plo_ver_lin(0, hax, col_lin)
    pre_for_exp_lab(x_lab, y_lab{i}, fon_siz)
end
[ax,h]=suplabel([typ ' animals n = ' sprintf('%d', n)],'t', [.08 .08 .87 .9]);
set(h,'FontSize',fon_siz + 3)
export_fig(fil_pat_sav)
end

function res_mag = com_res_mag(tim, sig, bas_win_siz, res_win_siz)
bas_rat = mean(sig(tim > -bas_win_siz & tim < 0));
res_rat = mean(sig(tim > 0 & tim < res_win_siz));
res_mag = res_rat - bas_rat;
end

function [res_mag_ani_par, n_par] = com_res_mag_ani_par(tri_tim, tri_rat_tim_fis_par, bas_win_siz, res_win_siz)
[~, n_ani, n_par] = size(tri_rat_tim_fis_par);
res_mag_ani_par = nan(n_ani, n_par);
for i = 1:n_ani
    for j = 1:n_par
        res_mag_ani_par(i, j) = com_res_mag(tri_tim, tri_rat_tim_fis_par(:, i, j), bas_win_siz, res_win_siz);
    end
end
end

function p_com_par = tes(res_mag_con_ani_par)
n_com = 3;
n_par = 5;
p_com_par = nan(n_com, n_par);
for i = 1:n_par
    for j = 1:n_com
        if j == 1
            p_com_par(j, i) = ranksum(res_mag_con_ani_par{1}(:, i), res_mag_con_ani_par{2}(:, i));
        elseif j ==2
            p_com_par(j, i) = ranksum(res_mag_con_ani_par{1}(:, i), res_mag_con_ani_par{3}(:, i));
        else
            p_com_par(j, i) = ranksum(res_mag_con_ani_par{2}(:, i), res_mag_con_ani_par{3}(:, i));
        end
    end
end
end