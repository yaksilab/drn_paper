function plo_kad_plo_mat(mat, mar, mar_siz)
% PURPOSE: plot kadir plot
%---------------------------------------------------
% USAGE: plo_kad_plo(obs, res, col, mar)
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
% mar_siz = 5;
%---------------------------------------------------

% Written by: Kadir Mutlu

plot(mat, [mar '-'], 'MarkerFaceColor', 'auto', 'MarkerSize', mar_siz)