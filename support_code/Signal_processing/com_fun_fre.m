function [fun_fre, max_amp] = com_fun_fre(fre, amp)
% PURPOSE: function purpose
%---------------------------------------------------
% USAGE: varargout = com_fun_fre(varargin)
% where: varargin = vector of input variables
%---------------------------------------------------
% RETURNS: a vector of output arguments composed of:
% x = 1.2
% --------------------------------------------------
% SEE ALSO: f(results)
%---------------------------------------------------
% REFERENCES: 
%---------------------------------------------------
% REMARKS: get rid of if fun_fre is not in the range
%---------------------------------------------------

% Written by: Kadir Mutlu

[max_amp, ind] = max(amp);
fun_fre = fre(ind);