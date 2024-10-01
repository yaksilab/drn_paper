function pre_for_exp_yy(h, x_lab, y_lab_lef, y_lab_rig)
% PURPOSE: prepare for export
%---------------------------------------------------
% USAGE: pre_for_exp_yy(h, x_lab, y_lab_lef, y_lab_rig)
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

% Written by:

fon_siz = 24;

set(h, 'FontSize', fon_siz, 'FontWeight', 'Bold')

lab_x_axi(x_lab, fon_siz)
lab_yy_axi(h, y_lab_lef, y_lab_rig, fon_siz)