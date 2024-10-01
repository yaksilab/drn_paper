function [spr, spr_mea] = com_sig_spr(sig)
% PURPOSE: compute signal spread
%---------------------------------------------------
% USAGE: [spr, spr_mea] = com_sig_spr(sig)
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

n_sam = size(sig, 1);
spr = zeros(n_sam, 1);
for i = 1:n_sam
    sig_max = max(sig(i, :));
    sig_min = min(sig(i, :));
    spr(i) = sig_max - sig_min;
end
spr_mea = mean(spr);