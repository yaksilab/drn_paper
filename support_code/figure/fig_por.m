function [h_fig, fig_wid, fig_hei] = fig_por
% PURPOSE: To generate a fullscreen figure
%---------------------------------------------------
% USAGE: fig
% --------------------------------------------------
% SEE ALSO: f(results)
%---------------------------------------------------
% REFERENCES: 
%---------------------------------------------------
% REMARKS: 
%---------------------------------------------------

% Written by: Kadir Mutlu
lef = 0;
bot = 0;
fig_wid = 1080;
fig_hei = 1844;% apparently max
h_fig = figure('Color', 'white', 'Position', [lef bot fig_wid fig_hei]);
h_fig.PaperUnits = 'centimeters';
h_fig.PaperSize = [29.16 (51.84/1920)*1844];% real size of the fig.
h_fig.Renderer = 'painters';
end
