function z_sig_sam = com_z_sig_sam(sig_sam, log_bas)
% PURPOSE: 
%---------------------------------------------------
% USAGE: 
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

[mea_bef, sta_dev_bef] = com_sta(sig_sam(log_bas), 1);
if sta_dev_bef == 0
    fir_rat_bef_j = fir_rat_bef_cel_tri(i, :);
    [~, sta_dev_bef] = com_sta(fir_rat_bef_j, 2);
end
mea_aft = com_sta(fir_rat_aft_j, 2);
z_sco_cel_odo(i, j) = (mea_aft - mea_bef)/sta_dev_bef;