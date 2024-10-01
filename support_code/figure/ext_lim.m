function lim = ext_lim(x_lim, y_lim, z_lim)
lim = [min([x_lim(1), y_lim(1), z_lim(1)]) max([x_lim(2), y_lim(2), z_lim(2)])];
end