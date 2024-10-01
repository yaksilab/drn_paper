function y_lab_sup(mar_bot, mar_top, y_lab)
hax = axes('Units', 'Normal', 'Position', [0 0 1 1],'Visible', 'off');
mid_poi = ext_mid_poi(mar_bot, mar_top);
text(hax, 0.01, mid_poi, y_lab, 'Units', 'normalized', 'Rotation', 90, ...
    'VerticalAlignment', 'middle', 'HorizontalAlignment', 'center')
end
function mid_poi = ext_mid_poi(mar_lef, mar_rig)
mid_poi = mar_lef + (1 - mar_lef - mar_rig)/2;
end