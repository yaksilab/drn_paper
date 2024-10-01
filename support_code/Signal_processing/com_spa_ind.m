function spa_ind = com_spa_ind(sig)
% PURPOSE: sparseness index for each column
%---------------------------------------------------
% USAGE: spa_ind = com_spa_ind(sig)
% where: varargin = vector of input variables
%---------------------------------------------------
% RETURNS: a vector of output arguments composed of:
% x = 1.2
% --------------------------------------------------
% SEE ALSO: f(results)
%---------------------------------------------------
% REFERENCES: 
%---------------------------------------------------
% REMARKS: sum
%---------------------------------------------------

% Written by: Kadir Mutlu

n_sam = size(sig, 1);
squ_roo_n_fre = sqrt(n_sam);
sig_abs = abs(sig);
spa_ind = (squ_roo_n_fre - sum(sig_abs)./sqrt(sum(sig_abs.^2)))/(squ_roo_n_fre - 1);