function h_fig = plo_icx_res(tim_fra, dff_icx_con_fra_tri, ani)
[h_fig, fig_wid, fig_hei] = fig;
n_row = 1;
n_col = 3;
gap_ver_row = [0.070 0.070 0.070];
gap_hor_row_col = 0.030*ones(n_row, n_col);
mar_bot = 0.070;
mar_top = 0.100;
mar_lef = 0.070;
mar_rig = 0.001;
asp_rat_axe = [1 1 1];
wid = false;
sca_axe = 0.6;
n_pix_ext = 50;
[hax_sub, pos_axe, hei_axe, dis_asp_rat, las_pix, rat_wid] = tight_subplot_gen(n_row, n_col, ...
    gap_ver_row, gap_hor_row_col, mar_bot, mar_top, mar_lef, mar_rig, asp_rat_axe, fig_wid, ...
    fig_hei, wid, sca_axe, n_pix_ext);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[n_icx, n_con] = size(dff_icx_con_fra_tri);
icx_num = 1;
col_con = 'kkk';
lin_wid = 1;
con_fil = matfile('\\home.ansatt.ntnu.no\kadiram\Documents\MATLAB\con_esp.mat');
n_fra = con_fil.n_fra;
log_smo = true;
for i = 1:n_con
    hax = hax_sub(i);
    [h_plo, ind_var_pea] = plo_sha_gen(hax, tim_fra, ...
            dff_icx_con_fra_tri{icx_num, i}, col_con(i), log_smo, n_fra.dff.eig);
end
linkaxes(hax_sub)
con_sti = con_fil.con_sti;
y_lab = con_fil.y_lab;
for i = 1:n_con
    hax = hax_sub(i);
    h = plo_ver_lin(hax, 0, 'k', lin_wid, '-');
    xlabel(hax, 'Time (s)')
    if i == 1
        ylabel(hax, y_lab.dff)
    else
        hax.YAxis.Visible = 'off';
    end
    if i == 2
        title(hax, ani)
    end
    subtitle(hax, con_sti{i})
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
set(h_fig.Children, 'Units', 'pixels')
h_fig.Position(3) = las_pix;
h_fig.Renderer = 'painters';
h_fig.PaperSize(1) = rat_wid*h_fig.PaperSize(1);
h_fig.PaperUnits = 'normalized';
h_fig.PaperPosition = [0 0 1 1];
end
