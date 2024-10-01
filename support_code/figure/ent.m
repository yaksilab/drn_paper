function ent(mar_lef, mar_rig, tit)
hax = axes('Units', 'Normal', 'Position', [0 0 1 1],'Visible', 'off');
mid_poi = ext_mid_poi(mar_lef, mar_rig);
text(hax, mid_poi, 0.98, tit, 'Units', 'normalized', 'HorizontalAlignment', 'center')
end
function mid_poi = ext_mid_poi(mar_lef, mar_rig)
mid_poi = mar_lef + (1 - mar_lef - mar_rig)/2;
end