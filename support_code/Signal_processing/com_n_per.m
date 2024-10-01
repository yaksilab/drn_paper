function [n_per, n_hal_per] = com_n_per(zer_cro)
% PURPOSE: compute number of periods
%---------------------------------------------------
% USAGE: [n_per, n_hal_per] = com_n_per(zer_cro)
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

n_hal_per = com_n_hal_cyc(zer_cro);
n_per = fix(n_hal_per/2);