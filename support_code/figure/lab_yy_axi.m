function lab_yy_axi(h, y_lab_lef, y_lab_rig, fon_siz)
% PURPOSE: To write the vertical label
%---------------------------------------------------
% USAGE: lab_yy_axi(h, y_lab_lef, y_lab_rig, fon_siz)
% where: yla = String specifying the x-label
% fon_siz = Font size
% --------------------------------------------------
% SEE ALSO: f(results)
%---------------------------------------------------
% REFERENCES: 
%---------------------------------------------------
% REMARKS: 
%---------------------------------------------------

% Written by: Kadir Mutlu

ylabel(h(1), y_lab_lef, 'FontSize', fon_siz, 'FontWeight', 'Bold')
ylabel(h(2), y_lab_rig, 'FontSize', fon_siz, 'FontWeight', 'Bold')