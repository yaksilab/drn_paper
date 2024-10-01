function [h_fig, fig_wid, fig_hei] = fig_mac
% PURPOSE: To generate a fullscreen figure
%---------------------------------------------------
% USAGE: fig
% --------------------------------------------------
% SEE ALSO: f(results)
%---------------------------------------------------
% REFERENCES: 
%---------------------------------------------------
% REMARKS: 
% h.PaperUnits = 'centimeters';
% (32.4/1200)*1080
% h.PaperSize = [51.84 29.16];
% 51.84 cm x 32.4 cm
%---------------------------------------------------

% Written by: Kadir Mutlu

fig_wid = 1920;
fig_hei = 1080;

%h_fig = figure('Color', 'white', 'Position', [0 0 fig_wid fig_hei]);

%h_fig = figure('Color', 'white', 'Position', [1441 -179 fig_wid fig_hei]);
%h_fig = figure('Color', 'white', 'Position', [-250 901 fig_wid fig_hei]);
h_fig = figure('Color', 'white', 'Position', [-300 901 fig_wid fig_hei]);


h_fig.PaperUnits = 'centimeters';
h_fig.PaperSize = [51.84 29.16];% real size of the fig.
