function [h_plo, n_uni_sam] = plo_dat_err_xsa_vio(hax, var_win_con_sam_uni, ind_win, ind_con, siz, ...
    col_sam_con, ind_sam, dat)
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
[~, n_con] = size(var_win_con_sam_uni);
if n_con == 1
    [~, n_col] = size(col_sam_con);
    ind_col = n_col;
else
    ind_col = ind_con;
end
dat = true;

dat_uni = [];
n_uni_sam = nan(n_sam, 1);
if dat
    %axes(hax)
    mar = 'o';
    for i = 1:n_sam
        ind = ind_sam(i);
        dat_i = var_win_con_sam_uni{ind_win, ind_con}{ind};
        log_nan_i = isnan(dat_i);
        dat_i(log_nan_i) = [];


        dat_uni = [dat_uni; dat_i];
        n_uni_sam(i) = length(dat_i);
        %
        n_poi = length(dat_i);
        gro = i*ones(n_poi, 1);
        obs_i = beeswarm(hax, gro, dat_i, 'use_current_axes', true);
        %h_plo(i) = scatter(hax, obs_i, dat_i, siz, col_sam_con{ind, ind_col}, ...
        %    'Marker', mar, 'MarkerFaceColor', col_sam_con{ind, ind_col});

        %violins = violinplot(var_win_con_sam_uni{ind_win, ind_con});

        %hold(hax, 'on')
    end
    %sam_uni = [repmat('Con', n_uni_sam(1), 1); repmat('Abl', n_uni_sam(2), 1)];
    %sam_uni = cellstr(sam_uni);
    %violins = violinplot(hax, dat_uni, sam_uni, 'ShowMedian', false);

    [h,L,MX,MED,bw] = violin(hax, var_win_con_sam_uni{ind_win, ind_con});
end

%  'ShowMean', true
%, 'ShowMedian', false

mea_sam = nan(n_sam, 1);
sem_sam = nan(n_sam, 1);
n_uni_sam = nan(n_sam, 1);
for i = 1:n_sam
    ind = ind_sam(i);
    [mea_sam(i), ~, sem_sam(i), n_uni_sam(i)] = ...
        com_sta(var_win_con_sam_uni{ind_win, ind_con}{ind}, 1);
end
mar_err = 'x';
global mar_siz_mea lin_wid
if dat
    for i = 1:n_sam
        hold(hax, 'on')
        errorbar(hax, i, mea_sam(i), sem_sam(i), mar_err, ...
            'MarkerSize', mar_siz_mea, 'Color', col_sam_con{i, ind_col}, 'LineWidth', lin_wid)
    end
else
    for i = 1:n_sam
        errorbar(hax, i, mea_sam(i), sem_sam(i), mar_err, ...
            'MarkerSize', mar_siz_mea, 'Color', col_sam_con{i, ind_col}, 'LineWidth', lin_wid)
        hold(hax, 'on')
    end
end

box(hax, 'off')
xlim([1 - 0.3 n_sam + 0.3])
xticks(hax, 1:n_sam)
end
