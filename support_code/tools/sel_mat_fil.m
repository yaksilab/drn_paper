function [mat_fil, n_mat_fil] = sel_mat_fil
% PURPOSE: function purpose
%---------------------------------------------------
% USAGE: [mat_fil, n_mat_fil] = sel_mat_fil
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

wor_dir = pwd;
mat_fil = dir([wor_dir '/*.mat']);
n_mat_fil = length(mat_fil);