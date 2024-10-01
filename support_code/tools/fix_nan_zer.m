function mat_fix = fix_nan_zer(mat)
% PURPOSE: function purpose
%---------------------------------------------------
% USAGE: mat_fix = fix_nan_zer(mat)
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

log_nan = isnan(mat);
mat(log_nan) = 0;
mat_fix = mat;