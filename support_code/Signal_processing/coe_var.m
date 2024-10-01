function coe_var_sig = coe_var(sig)
% PURPOSE: coefficient of variation
%---------------------------------------------------
% USAGE: varargout = com_coe_var(varargin)
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

mea_sig = mean(sig);
std_sig = std(sig);
coe_var_sig = std_sig./mea_sig;