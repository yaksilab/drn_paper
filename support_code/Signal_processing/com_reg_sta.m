function reg_sta = com_reg_sta(sig)
% PURPOSE: function purpose
%---------------------------------------------------
% USAGE: reg_sta = com_reg_sta(sig)
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

n_sam = length(sig);
max_lag = 3*n_sam;
sig_mea_cen = mea_cen(sig);
aut = xcorr(sig_mea_cen, max_lag);
aut_del = aut(max_lag + 1:end);        
zer_cro = fin_zer_cro(aut_del);
ind_int = diff(zer_cro);
ind_int_con = ind_int(1:18);
reg_sta = mean(ind_int_con)/(3*std(ind_int_con));