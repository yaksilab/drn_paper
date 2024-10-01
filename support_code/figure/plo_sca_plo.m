function h = plo_sca_plo(obs, res, mar, col, siz, col_fac)
% PURPOSE: plot scatter plot
%---------------------------------------------------
% USAGE: h = plo_sca_plo(obs, res, mar, col, siz)
% where: 
% obs = observations
% res = responses
% mar = marker
% col = color
% siz = size
% --------------------------------------------------
% SEE ALSO:
%---------------------------------------------------
% REFERENCES: 
%---------------------------------------------------
% REMARKS: 
%mar = 'x';
%col = 'k';
%siz = 10;
%---------------------------------------------------

% Written by: Kadir Mutlu

h = plot(obs, res, 'LineStyle', 'none', 'Marker', mar, 'MarkerEdgeColor', col, 'MarkerFaceColor', col_fac, 'MarkerSize', siz);