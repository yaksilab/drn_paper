function pos = add_hor_sca_bar_bel(hax, len, col, nor_y)
pos = hax.Position;
x_lim = hax.XLim;
x = x_lim(1);
pos = [pos(1) nor_y pos(3) 0.01];
h = axes('Position', pos);
plot([x x + len], [0 0], 'LineWidth', 2, 'Color', col)
h.XLim = x_lim;
set(h, 'visible', 'off')
end