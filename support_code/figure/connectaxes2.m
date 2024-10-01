function [lim_axi_dir, axList] = connectaxes2(axList)
% C:\Users\KEdwards\OneDrive - datacolor\matlab_programs\graphics\
% connectaxes2.m
%
% DESCRIPTION 
%   Set different 3D axes to the same limits and view angle as you zoom and pan
% INPUT
%     axList - List of handles to axes to connct

if nargin == 0 % Pick all open axes, if specific axes are not passed in
    axList = findobj('type', 'axes'); 
end

Link = linkprop(axList,{'CameraUpVector', 'CameraPosition', ...
    'CameraTarget', 'XLim', 'YLim', 'ZLim'});
setappdata(gcf, 'StoreTheLink', Link);

lim_axi_dir = nan(3, 2);
lim_axi_dir(1, :) = axList(1).XLim;
lim_axi_dir(2, :) = axList(1).YLim;
lim_axi_dir(3, :) = axList(1).ZLim;
end