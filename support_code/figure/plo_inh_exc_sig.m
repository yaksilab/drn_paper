function h_fig = plo_inh_exc_sig(dff_uni_poi, log_uni, pha_win_len, tim_fra)
col_lim = [-20 40];
col_cod = '\DeltaF/F (%)';
[h_fig, fig_wid, fig_hei] = fig;
n_row = 4;
n_col = 1;
mar_bot = 0.070;
mar_top = 0.010;
mar_lef = 0.040;
mar_rig = 0.000;
asp_rat_axe = ones(n_row*n_col, 1);
gap_ver_row = 0.040*ones(1, n_row);
gap_hor_row_col = 0.040*ones(n_row, n_col);
wid = false;
sca_axe = ones(n_row*n_col, 1);
n_pix_ext = 0;
[hax_sub, pos_axe, hei_axe, dis_asp_rat, las_pix, rat_wid] = tight_subplot_gen(n_row, n_col, ...
    gap_ver_row, gap_hor_row_col, mar_bot, mar_top, mar_lef, mar_rig, asp_rat_axe, fig_wid, ...
    fig_hei, wid, sca_axe, n_pix_ext);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
col_han_pos = [0.2 0.380 0.005 0.150];
con_fil = matfile('\\home.ansatt.ntnu.no\kadiram\Documents\MATLAB\con_esp.mat');
tim_fra = con_fil.tim_fra;
n_fra = con_fil.n_fra;
col = 'k';
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% signals
hax = hax_sub(1);
inh_pix_fra = dff_uni_poi(log_uni.inh, :);
inh_pix_fra(isinf(inh_pix_fra)) = 0;

% [h_plo, ind_var_pea] = plo_sha.smo_tri(hax, tim_fra.cal.eig.tri.dff, inh_pix_fra', ...
%     col, n_fra.dff.eig.bas, n_fra.dff.eig.smo);

[h_plo, ind_var_pea] = plo_sha.raw(hax, tim_fra.cal.eig.tri.dff, inh_pix_fra', ...
    col);

lin_wid = con_fil.lin_wid;

h = yline(hax, 0, 'LineWidth', lin_wid.two);
h = xline(hax, 0, 'Color', 'g', 'LineWidth', lin_wid.two);
h = xline(hax, pha_win_len, 'Color', 'r', 'LineWidth', lin_wid.two);

hax = hax_sub(3);
exc_pix_fra = dff_uni_poi(log_uni.exc, :);
[h_plo, ind_var_pea] = plo_sha.smo_tri(hax, tim_fra.cal.eig.tri.dff, exc_pix_fra', ...
    col, n_fra.dff.eig.bas, n_fra.dff.eig.smo);
h = yline(hax, 0, 'LineWidth', lin_wid.two);
h = xline(hax, 0, 'Color', 'g', 'LineWidth', lin_wid.two);
h = xline(hax, pha_win_len, 'Color', 'r', 'LineWidth', lin_wid.two);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% images
dff_uni_win = com_ave_amp_uni_win(tim_fra.cal.eig.tri.dff, dff_uni_poi', pha_win_len);

hax = hax_sub(2);
win = 2;
[~, ind_pix] = sort(dff_uni_win(log_uni.inh, win), 'ascend');

dff_fra_pix = smo_sam_poi_var(inh_pix_fra(ind_pix, :)', n_fra.dff.eig.bas, n_fra.dff.eig.smo);

ima(hax, tim_fra.cal.eig.tri.dff, dff_fra_pix')
caxis(hax, col_lim)
colormap(hax, hot)
hax.YAxis.Visible = "off";
hax = hax_sub(4);
[~, ind_pix] = sort(dff_uni_win(log_uni.exc, win), 'descend');

dff_fra_pix = smo_sam_poi_var(exc_pix_fra(ind_pix, :)', n_fra.dff.eig.bas, n_fra.dff.eig.smo);

ima(hax, tim_fra.cal.eig.tri.dff, dff_fra_pix')
caxis(hax, col_lim)
colormap(hax, hot)
hax.YAxis.Visible = "off";
col_han = colorbar('Ticks', col_lim);
col_han.Position = col_han_pos;
col_han.Label.String = col_cod;
col_han.Label.Units = 'normalized';
col_han.Label.Position(1) = 1.5;
end
