function h_fig = plo_pie(res_cel)
n_row = 1;
n_col = 1;
gap_ver = 0.000;
gap_ver_row = gap_ver*ones(n_row, 1);
gap_hor_ave = 0.000;
gap_hor_col = gap_hor_ave*ones(1, n_col);
gap_hor_row_col = repmat(gap_hor_col, n_row, n_col);
%hei = 1.5;% ewelina
%hei = 2;% with quantification
hei = 1;
mar_top = cal_mar_top(hei);
mar_bot = 0.000;
mar_lef = 0.000;
mar_rig = 0.000;
asp_rat_bar = 1;
asp_rat_axe = asp_rat_bar;
[h_fig, wid_mon, hei_mon] = fig;
%[h_fig, wid_mon, hei_mon] = fig_mac;
wid = false;
sca_axe = ones(1, n_row*n_col);
n_pix_ext = 100;
[hax_sub, pos_axe, axh, dis_asp_rat, las_pix, rat_wid] = tight_subplot_gen...
    (n_row, n_col, ...
    gap_ver_row, gap_hor_row_col, mar_bot, mar_top, mar_lef, mar_rig, asp_rat_axe, wid_mon, ...
    hei_mon, wid, sca_axe, n_pix_ext);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
hax = hax_sub(1);
h_plo = piechart(h_fig, categorical(res_cel));

% pro_cat = (h_plo.Proportions)*100;
% h_plo.Labels = [sprintf("I (%d%%)", round(pro_cat(1))), sprintf("U (%d%%)", round(pro_cat(2))), ...
%     sprintf("E (%d%%)", round(pro_cat(3)))];
% hax = gca;
% hax.FontName = 'Arial';
% hax.FontSize = 7;
h_plo.Labels = [];
con_fil = matfile('\\home.ansatt.ntnu.no\kadiram\Documents\MATLAB\con_esp.mat');
piv_col_pcx = con_fil.piv_col_pcx;
piv_col_pcx = piv_col_pcx.div;
piv_col_pcx(2, :) = [0.5 0.5 0.5];
h_plo.ColorOrder = piv_col_pcx;
rat_wid = 1;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
set(h_fig.Children, 'Units', 'pixels')
h_fig.PaperSize(1) = rat_wid*h_fig.PaperSize(1);
h_fig.PaperUnits = 'normalized';
h_fig.PaperPosition = [0 0 1 1];
end