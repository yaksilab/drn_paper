function [h_fig, wid_mon, hei_mon] = fig_wid(fra_wid)
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

%figure('Color', 'white', 'Units', 'points', 'Position', [0 0 595.28 841.89]);
%figure('Color', 'white', 'Units', 'centimeters');
%figure('Color', 'white', 'Units', 'points');
wid_mon = 1920*fra_wid;
hei_mon = 1080;
h_fig = figure('Color', 'white', 'Position', [0 0 wid_mon hei_mon]);
%MaximizeFigureWindow()