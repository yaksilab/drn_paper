function obj = sho_fir_fra(fil_pat, var_nam)
% PURPOSE: Show first frame
%---------------------------------------------------
% USAGE: varargout = spe_cen(varargin)
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
addpath \\home.ansatt.ntnu.no\kadiram\Documents\MATLAB\figure
fig
obj = matfile(fil_pat);
%fir_fra = obj.data(:, :, 1);
%fir_fra = obj.fra_cro_ali(:, :, 1);

fir_fra = obj.(var_nam)(:, :, 1);

imshow(fir_fra)