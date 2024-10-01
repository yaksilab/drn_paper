function mea_dif = com_mea_dif(mea_1, mea_2)
% PURPOSE: function purpose
%---------------------------------------------------
% USAGE: varargout = com_mea_dif(varargin)
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

mea_dif = mean(mea_2) - mean(mea_1);