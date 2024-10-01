function [thr, vec] = com_thr_out(vec, per_bin_edg)
% PURPOSE: compute the threshold for varying (maybe not), outlier
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
% REMARKS: data in the bins with one count are considered as outliers.
%---------------------------------------------------

% Written by: Kadir Mutlu

n_ele = length(vec);
[cou, edg, bin_ind] = histcounts(vec);
cou = cou';
edg = edg';

ind_one = find(cou == 1);
n_one = length(ind_one);
log_vec = false(n_ele, n_one);
for i = 1:n_one
    ind_one_i = ind_one(i);
    log_vec(:, i) = bin_ind == ind_one_i;
end
log_vec = logical(sum(log_vec, 2));

vec(log_vec) = [];

thr = com_thr(vec, per_bin_edg);