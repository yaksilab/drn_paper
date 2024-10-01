function thr_lim = com_thr_lim(vec, per_bin_edg_lim)
% PURPOSE: compute the threshold for varying (maybe not) BOTH
%---------------------------------------------------
% USAGE: thr_var = det_thr_var(var_sig, per_bin_eli)
% where: varargin = vector of input variables
%---------------------------------------------------
% RETURNS: a vector of output arguments composed of:
% x = 1.2
% --------------------------------------------------
% SEE ALSO: f(results)
%---------------------------------------------------
% REFERENCES: 
%---------------------------------------------------
% REMARKS: per_bin_eli = 10 - first 10% of the bins are eliminated -- based
% on bin edges and fix!
%---------------------------------------------------

% Written by: Kadir Mutlu

thr_lim(1) = com_thr(vec, per_bin_edg_lim(1));
thr_lim(2) = com_thr(vec, per_bin_edg_lim(2));
