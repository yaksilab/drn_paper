function [mea, ci] = com_mea_ci(mat)
% PURPOSE: function purpose
%---------------------------------------------------
% USAGE: [mea, sem] = com_mea_sem(mat)
% where: varargin = vector of input variables
%---------------------------------------------------
% RETURNS: a vector of output arguments composed of:
% x = 1.2
% --------------------------------------------------
% SEE ALSO: f(results)
%---------------------------------------------------
% REFERENCES: 
%---------------------------------------------------
% REMARKS: each column is one response data
%---------------------------------------------------

% Written by: Kadir Mutlu

[mea, sem, n_rep] = com_mea_sem(mat);

ts = tinv(0.975, n_rep - 1);      % T-Score
ci = ts*sem;