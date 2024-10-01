function h_plo = plo_err_mul_win(var_sam_con_uni_win, ind_con, ind_win, col_sam)
% PURPOSE: function purpose
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
[n_sam, ~] = size(var_sam_con_uni_win);
mea_sam = nan(n_sam, 1);
sem_sam = nan(n_sam, 1);
for i = 1:n_sam
    [mea_sam(i), ~, sem_sam(i)] = com_sta(var_sam_con_uni_win{i, ind_con}(:, ind_win), 1);
end
mar_err = 'x';
global mar_siz_mea
global lin_wid
h_plo = nan(n_sam, 1);
sam_num = 1:n_sam;
for i = 1:n_sam
    h_plo(i) = errorbar(sam_num(i), mea_sam(i), sem_sam(i), mar_err, ...
        'MarkerSize', mar_siz_mea, 'Color', col_sam{i}, 'LineWidth', lin_wid);
    hold on
end
box off
end
