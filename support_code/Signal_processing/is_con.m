function con = is_con(sig)
% PURPOSE: is convex
%---------------------------------------------------
% USAGE: con = is_con(sig)
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

dif = diff(sig);
con = ismonotonic(dif, [], 'INCREASING');