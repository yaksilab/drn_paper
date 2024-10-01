function res = mea_cen(res)
% PURPOSE: mean center
%---------------------------------------------------
% USAGE: res = mea_cen(res)
% where:
% sig = signal
%---------------------------------------------------
% RETURNS: a vector of output arguments composed of:
% sig_mea_cen = signal mean centered
% --------------------------------------------------
% SEE ALSO: f(results)
%---------------------------------------------------
% REFERENCES: 
%---------------------------------------------------
% REMARKS: 
%---------------------------------------------------

% Written by: Kadir Mutlu

n_sam = size(res, 1);
sig_mea = mean(res);
res = res - sig_mea(ones(n_sam, 1), :, :);