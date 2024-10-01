function h_plo = plo_err_reg(var_reg_con_win_uni, ind_con, ind_win)
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
n_reg = length(var_reg_con_win_uni);
mea_sam = nan(n_reg, 1);
sem_sam = nan(n_reg, 1);
for i = 1:n_reg
    [mea_sam(i), ~, sem_sam(i)] = com_sta(var_reg_con_win_uni{i}{ind_con, ind_win}, 1);
end
mar_err = 'x';
global mar_siz_mea
global lin_wid
h_plo = nan(n_reg, 1);
sam_num = 1:n_reg;
for i = 1:n_reg
    h_plo(i) = errorbar(sam_num(i), mea_sam(i), sem_sam(i), mar_err, ...
        'MarkerSize', mar_siz_mea, 'Color', 'k', 'LineWidth', lin_wid);
    hold on
end
box off
end
