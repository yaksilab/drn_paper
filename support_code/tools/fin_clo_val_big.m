function [clo_val, num] = fin_clo_val_big(vec, tar)
% PURPOSE: find closest value
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
% REMARKS: works for monotonically increasing
%---------------------------------------------------

% Written by: Kadir Mutlu

dif = vec - tar;
dif_abs = abs(dif);
[~, num] = min(dif_abs);
clo_val = vec(num);
%
if clo_val < tar && num < length(vec)
    num = num + 1;
    clo_val = vec(num);
end
thr = 0.1;
while clo_val - tar > thr && num > 1
    num = num - 1;
    clo_val = vec(num);
end
