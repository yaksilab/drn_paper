function [h_plo, n_uni_sam, tic_sam] = plo_dat_err_xsa(hax, var_win_con_sam_uni, ind_win, ind_con, ...
    siz, col_sam_con, ind_sam, dat)
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
n_sam = length(var_win_con_sam_uni{1, 1});
h_plo = nan(n_sam, 1);
[~, n_col] = size(col_sam_con);
if n_col == 1
    ind_col = 1;
else
    ind_col = ind_con;
end
mea_sam = nan(n_sam, 1);
sem_sam = nan(n_sam, 1);
n_uni_sam = nan(n_sam, 1);
mar = '.';
lin_wid = 2.25;
shi = 0.2;
tic_sam = nan(1, n_sam);
for i = 1:n_sam
    ind = ind_sam(i);
    var_uni = var_win_con_sam_uni{ind_win, ind_con}{ind};
    [mea_sam(i), ~, sem_sam(i), n_uni_sam(i)] = com_sta(var_uni, 1);
    if dat
        log_nan_i = isnan(var_uni);
        var_uni(log_nan_i) = [];
        gro = i*ones(n_uni_sam(i), 1);
        obs_i = beeswarm(hax, gro, var_uni, 'use_current_axes', true);
        rgb.raw = col_sam_con{ind, ind_col};
        rgb.lig = rgb.raw + 127/255;
        rgb.lig(rgb.lig > 255/255) = 1;
        tot_shi = (i - 1)*shi;
        h_plo(i) = scatter(hax, obs_i + tot_shi, var_uni, siz, rgb.lig, "filled");
        hold(hax, 'on')
        %
        errorbar(hax, i + tot_shi, mea_sam(i), sem_sam(i), mar, 'MarkerSize', 0.5*siz, 'Color', ...
            rgb.raw, 'LineWidth', lin_wid, 'MarkerFaceColor', 'k')
        tic_sam(i) = i + tot_shi;
    end
end
box(hax, 'off')
xticks(hax, tic_sam)
end
