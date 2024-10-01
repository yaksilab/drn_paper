function plo_pea(sig, pea_ind)
% PURPOSE: function purpose
%---------------------------------------------------
% USAGE: varargout = plo_pea(varargin)
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

n_sig = size(sig, 2);
plot(sig)
for i = 1:n_sig
    hold on
    plo_mar(pea_ind(:, i), sig(pea_ind(:, i), i))
end