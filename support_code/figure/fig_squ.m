function [h_fig, wid_mon, hei_mon] = fig_squ
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

hei_mon = 1080;
wid_mon = hei_mon;
h_fig = figure('Color', 'white', 'Position', [0 0 wid_mon hei_mon]);