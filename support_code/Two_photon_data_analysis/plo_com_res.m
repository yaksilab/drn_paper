function h_fig = plo_com_res(sco_com_con_fra_tri, pve_com)
[h_fig, fig_wid, fig_hei] = fig;
n_row = 3;
n_col = 3;
gap_ver_row = [0.070 0.070 0.070];
gap_hor_row_col = 0.030*ones(n_row, n_col);
mar_bot = 0.100;
mar_top = 0.050;
mar_lef = 0.070;
mar_rig = 0.001;
asp_rat_axe = ones(n_row*n_col, 1);
wid = false;
sca_axe = ones(n_row*n_col, 1);
n_pix_ext = 125;
[hax_sub, pos_axe, hei_axe, dis_asp_rat, las_pix, rat_wid] = tight_subplot_gen(n_row, n_col, ...
    gap_ver_row, gap_hor_row_col, mar_bot, mar_top, mar_lef, mar_rig, asp_rat_axe, fig_wid, ...
    fig_hei, wid, sca_axe, n_pix_ext);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[n_com, n_con] = size(sco_com_con_fra_tri);
col_con = 'kkk';
log_smo = true;
lin_wid = 1;
con_fil = matfile('\\home.ansatt.ntnu.no\kadiram\Documents\MATLAB\con_esp.mat');
n_fra = con_fil.n_fra;
tim_fra = con_fil.tim_fra;
for com_num = 1:n_row
    for i = 1:n_con
        hax = hax_sub((com_num - 1)*n_col + i);
        [h_plo, ind_var_pea] = plo_sha_gen(hax, tim_fra.cal.eig.tri.dff, ...
            sco_com_con_fra_tri{com_num, i}, col_con(i), log_smo, n_fra.dff.eig);
        if i == n_con
            text(hax, 1.1, 0.5, [sprintf('%.2f', pve_com(com_num)) '%'], 'units', 'normalized')
        end
    end
end
linkaxes(hax_sub)
con_sti = con_fil.con_sti;
y_lab = con_fil.y_lab;
for com_num = 1:n_row
    for i = 1:n_con
        hax = hax_sub((com_num - 1)*n_col + i);
        h = plo_ver_lin(hax, 0, 'k', lin_wid, '-');
        if i == 1
            ylabel(hax, y_lab.com(com_num))
        else
            hax.YAxis.Visible = 'off';
        end
        if com_num == 1
            title(hax, con_sti{i})
        elseif com_num == n_row
            xlabel(hax, 'Time (s)')
        end
    end
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
set(h_fig.Children, 'Units', 'pixels')
h_fig.Position(3) = las_pix;
h_fig.Renderer = 'painters';
h_fig.PaperSize(1) = rat_wid*h_fig.PaperSize(1);
h_fig.PaperUnits = 'normalized';
h_fig.PaperPosition = [0 0 1 1];
end
