function h_fig = plo_spa_den_dor_ven(x_ani_uni, y_ani_uni, log_uni, vie_ang_dir, fie_num)
[h_fig, fig_wid, fig_hei] = fig;
con_fil = matfile('\\home.ansatt.ntnu.no\kadiram\Documents\MATLAB\con_esp.mat');
n_row = 2;
n_col = 2;
gap_ver_row = 0.005*ones(n_row, 1);
gap_hor = 0.000;
gap_hor_row_col = gap_hor*ones(n_row, n_col);
mar_bot = 0.000;
mar_top = 0.000;
mar_lef = 0.000;
mar_rig = 0.000;
asp_rat = con_fil.asp_rat;
n_sub = n_row*n_col;
asp_rat_axe = ones(n_sub, 1);% make acc image, and set gap_hor!
wid = false;
sca_axe = ones(n_sub, 1);
n_pix_ext = 0;
[hax_sub, pos_axe, hei_axe, dis_asp_rat, las_pix, rat_wid] = tight_subplot_gen(n_row, ...
    n_col, gap_ver_row, gap_hor_row_col, mar_bot, mar_top, mar_lef, mar_rig, ...
    asp_rat_axe, fig_wid, fig_hei, wid, sca_axe, n_pix_ext);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
x_uni.all = vertcat(x_ani_uni{:});
y_uni.all = vertcat(y_ani_uni{:});
x_lim = [min(x_uni.all) max(x_uni.all)];
y_lim = [min(y_uni.all) max(y_uni.all)];
boo_uni = getfield(log_uni, fie_num{3:end});
log_uni.ven = ~log_uni.dor;
min_den = 0;
max_den = 0.0001;
mar_siz = 7*(200/50);
for row = 1:n_row
    if row == 1
        fie = 'exc';
    elseif row == 2
        fie = 'inh';
    end
    for col = 1:n_col
        if col == 1
            bin_uni.exc = boo_uni.exc & log_uni.dor;
            bin_uni.inh = boo_uni.inh & log_uni.dor;
            loc = 'dor';
        elseif col == 2
            bin_uni.exc = boo_uni.exc & ~log_uni.dor;
            bin_uni.inh = boo_uni.inh & ~log_uni.dor;
            loc = 'ven';
        end
        x_uni.(loc).(fie) = x_uni.all(bin_uni.(fie));
        y_uni.(loc).(fie) = y_uni.all(bin_uni.(fie));
        pro_den_uni.(loc).(fie) = ksdensity([x_uni.(loc).(fie) y_uni.(loc).(fie)], [...
            x_uni.(loc).(fie) y_uni.(loc).(fie)]);
        
        hax = hax_sub(n_col*(row - 1) + col);
        h = scatter(hax, x_uni.(loc).(fie), y_uni.(loc).(fie), mar_siz, pro_den_uni.(loc).(fie), ...
            'filled');
        hax.CLim = [min_den max_den];
        hax.PlotBoxAspectRatio = [1 asp_rat.cal.ori 1];
        view(hax, vie_ang_dir(1), vie_ang_dir(2))
        axis(hax, 'equal')
    
        hax.XAxis.Visible = 'off';
        hax.YAxis.Visible = 'off';
        hax.XLim = x_lim;
        hax.YLim = y_lim;

        grid(hax, 'on')
        hax.GridLineWidth = 0.5;
    end
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
h_fig = opt_h_fig(h_fig, las_pix, rat_wid);
end
