function [thr, thr_max] = com_thr(vec, per_bin_edg)
% PURPOSE: compute the threshold for varying (maybe not)
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

[cou_bin, bin_edg] = histcounts(vec);
[~, bin_num] = max(cou_bin);
thr_max = bin_edg(bin_num + 1);

n_edg = length(bin_edg);
if per_bin_edg == 0
    thr = bin_edg(1);
else
    ind = round(n_edg*(per_bin_edg/100));
    if ind == 0
        thr = 0;
    else
        thr = bin_edg(ind);
    end
end
