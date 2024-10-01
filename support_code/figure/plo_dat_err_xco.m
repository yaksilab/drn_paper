function h_plo = plo_dat_err_xco(hax, var_win_con_sam_uni, ind_win, ind_sin_sam, siz, col_sam_con)
% PURPOSE: for plotting across the groups
%---------------------------------------------------
% USAGE: h_plo = plo_bar_dat_mul_win(dat_sam_con_uni_win, ind_con, ind_win, siz)
% where: varargin = vector of input variables
%---------------------------------------------------
% RETURNS: a vector of output arguments composed of:
% x = 1.2
% --------------------------------------------------
% SEE ALSO: f(results)
%---------------------------------------------------
% REFERENCES: 
%---------------------------------------------------
% REMARKS: 
% n_conditions
%---------------------------------------------------

% Written by: Kadir Mutlu
% Username: SUPINFO\kadir
% Display Name: kadir
% Computer Name: SYSKRUNCH
% Windows: Microsoft Windows NT 6.2.9200.0
% Date: 11-Jan-2019 11:38:40

mar = 'o';
[~, n_con] = size(var_win_con_sam_uni);
n_uni = length(var_win_con_sam_uni{ind_win, 1}{ind_sin_sam});
ind_var_con_uni = nan(n_con, n_uni);
for i = 1:n_con
    ind_var_con_uni(i, :) = i;
end

for i = 1:n_con
    dat_i = var_win_con_sam_uni{ind_win, i}{ind_sin_sam};
    log_nan_i = isnan(dat_i);
    dat_i(log_nan_i) = [];
    
    n_poi = length(dat_i);
    gro = i*ones(n_poi, 1);
    obs_i = beeswarm(hax, gro, dat_i, 'use_current_axes', true);

    rgb.raw = col_sam_con{ind_sin_sam, i};
    rgb.lig = cal_rgb(rgb.raw);

    h_plo(i) = scatter(hax, obs_i, dat_i, siz, rgb.lig, 'Marker', mar, 'MarkerFaceColor', rgb.lig);
    hold(hax, 'on')
    
    ind_j = 0;
    for j = 1:n_uni
        if ~log_nan_i(j)
            ind_j = ind_j + 1;
            ind_var_con_uni(i, j) = obs_i(ind_j);
        end
    end
end

% connecting dashed lines in grey
dep_var_con_uni = nan(n_con, n_uni);
for i = 1:n_con
    dep_var_con_uni(i, :) = var_win_con_sam_uni{ind_win, i}{ind_sin_sam}';
end
con_fil = matfile('\\home.ansatt.ntnu.no\kadiram\Documents\MATLAB\con_esp.mat');
lin_wid = con_fil.lin_wid;
for i = 1:n_uni
    dep_sam = dep_var_con_uni(:, i);
    log_i = ~isnan(dep_sam);
    dep_sam = dep_sam(log_i);
    ind_sam = ind_var_con_uni(:, i);
    ind_sam = ind_sam(log_i);
    plot(hax, ind_sam, dep_sam, 'Color', [0.5 0.5 0.5], 'LineStyle', '--', 'LineWidth', lin_wid.two);
    hold(hax, 'on')
end

mea_con = nan(n_con, 1);
sem_con = nan(n_con, 1);
for i = 1:n_con
    [mea_con(i), ~, sem_con(i)] = com_sta(var_win_con_sam_uni{ind_win, i}{ind_sin_sam}, 1);
end
plo_err_col(hax, mea_con, sem_con, 0.5*siz, col_sam_con, ind_sin_sam)
box off
hax.XLim(1) = hax.XLim(1) - (hax.XLim(2) - n_con);
end
