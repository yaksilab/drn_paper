function plo_lat_map(bea_lat_ani_tri, tit)
hax = gca;
sim = false;
plo_lat_map_sim(bea_lat_ani_tri, hax, sim);
y_lab = 'Animal';
global fon_siz
pre_for_exp_y_lab(y_lab, fon_siz)
h_tit = title(tit);
col_han = colorbar;
col_han.Label.String = 'Latency (ms)';
h_tit.Units = 'normalized';
h_tit.Position(2) = 1.06;
end