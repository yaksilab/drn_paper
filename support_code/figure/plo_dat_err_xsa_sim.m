function [h_plo, n_uni_sam] = plo_dat_err_xsa_sim(hax, var_sam_uni, siz, col_sam, ind_sam, dat)
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

n_sam = length(var_sam_uni);
h_plo = nan(n_sam, 1);
if dat
    axes(hax)
    mar = 'o';
    for i = 1:n_sam
        ind = ind_sam(i);
        dat_i = var_sam_uni{ind};
        log_nan_i = isnan(dat_i);
        dat_i(log_nan_i) = [];
        
        n_poi = length(dat_i);
        gro = i*ones(n_poi, 1);
        obs_i = beeswarm(gro, dat_i, 'use_current_axes', true);
        
        h_plo(i) = scatter(hax, obs_i, dat_i, siz, col_sam{ind}, 'Marker', mar, 'MarkerFaceColor', ...
            col_sam{ind});
        hold(hax, 'on')
    end
end
mea_sam = nan(n_sam, 1);
sem_sam = nan(n_sam, 1);
n_uni_sam = nan(n_sam, 1);
for i = 1:n_sam
    ind = ind_sam(i);
    [mea_sam(i), ~, sem_sam(i), n_uni_sam(i)] = com_sta(var_sam_uni{ind}, 1);
end
mar_err = 'x';
global mar_siz_mea lin_wid
if dat
    errorbar(hax, mea_sam, sem_sam, mar_err, ...
        'MarkerSize', mar_siz_mea, 'Color', 'k', 'LineWidth', lin_wid)
else
    for i = 1:n_sam
        errorbar(hax, i, mea_sam(i), sem_sam(i), mar_err, ...
            'MarkerSize', mar_siz_mea, 'Color', col_sam{i}, 'LineWidth', lin_wid)
        hold(hax, 'on')
    end
end
box(hax, 'off')
xlim([1 - 0.3 n_sam + 0.3])
xticks(hax, 1:n_sam)
end
