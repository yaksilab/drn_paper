function plo_pea_rea(tim, sig, pea_tim, pea_amp, lin_wid)
% PURPOSE: plot peaks ready
%---------------------------------------------------
% USAGE: plo_pea_rea(sig, pea_tim, pea_amp)
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

addpath('\\home.ansatt.ntnu.no\kadiram\Documents\MATLAB\figure')
%
n_sig = size(sig, 2);
%
plot(tim, sig, 'LineWidth', lin_wid)
for i = 1:n_sig
    hold on
    plo_mar(pea_tim(:, i), pea_amp(:, i))
end