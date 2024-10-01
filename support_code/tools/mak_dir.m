function new_dir = mak_dir(par_dir, new_dir)
% PURPOSE: function purpose
%---------------------------------------------------
% USAGE: new_dir = mak_dir(par_dir, new_dir)
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

mkdir(par_dir, new_dir)
new_dir = [par_dir '/' new_dir];