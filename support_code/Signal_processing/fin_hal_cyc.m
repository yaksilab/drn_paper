function [hal_cyc_ind, n_hal_cyc] = fin_hal_cyc(sig_rem_non)
% PURPOSE: function purpose
%---------------------------------------------------
% USAGE: [hal_cyc_ind, n_hal_cyc] = fin_hal_cyc(sig_rem_non)
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
%---------------------------------------------------

% Written by: Kadir Mutlu

log_pos = sig_rem_non > 0;
dif_log_pos = diff(log_pos);
ind_raw = find(dif_log_pos);
ind_raw(2:2:end) = ind_raw(2:2:end) + 1;
ind = ind_raw;
hal_cyc_ind = [ind(1:2:end - 1) ind(2:2:end)];

n_hal_cyc = size(hal_cyc_ind, 1);