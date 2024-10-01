function [clo_val, ind] = fin_clo_val_exc(vec, tar)
% PURPOSE: find closest value excluding the same value
%---------------------------------------------------
% USAGE: [clo_val, num] = fin_clo_val(vec, tar)
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
vec(vec == tar) = [];

dif = vec - tar;
dif_abs = abs(dif);
[~, ind] = min(dif_abs);
clo_val = vec(ind);