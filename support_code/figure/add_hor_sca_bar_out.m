function pos = add_hor_sca_bar_out(hax, len, col, nor_y, lin_wid)
pos = hax.Position;
x_lim = hax.XLim;
x = 0;
pos = [pos(1) nor_y pos(3) 0.01];
h = axes('Position', pos);
plot([x x + len], [0 0], 'LineWidth', lin_wid, 'Color', col)
h.XLim = x_lim;
set(h, 'visible', 'off')
end