function ent_gen(pos_axe, tit)
hax = axes('Units', 'Normal', 'Position', [0 0 1 1],'Visible', 'off');

mar_lef = pos_axe{1}(1);
mar_rig = 1 - pos_axe{end}(1) - pos_axe{end}(3);

mid_poi = ext_mid_poi_fig(mar_lef, mar_rig);
text(hax, mid_poi, 0.99, tit, 'Units', 'normalized', 'HorizontalAlignment', 'center')
end
