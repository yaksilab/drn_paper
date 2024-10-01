function h_plo = plo_err_win(dat_sam_con_uni_win, ind_sam, ind_win)
% PURPOSE: function purpose
%---------------------------------------------------
% USAGE: hax = plo_bar_dat(res_mat, col_con, siz)
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
[~, n_con] = size(dat_sam_con_uni_win);
mea_con = nan(n_con, 1);
sem_con = nan(n_con, 1);
for i = 1:n_con
    [mea_con(i), ~, sem_con(i)] = com_sta(dat_sam_con_uni_win{ind_sam, i}(:, ind_win), 1);
end
mar_err = 'x';
global mar_siz_mea
global lin_wid
h_plo = errorbar(mea_con, sem_con, mar_err, 'MarkerSize', mar_siz_mea, ...
    'Color', 'k', 'LineStyle', '-', 'LineWidth', lin_wid);
box off
end
