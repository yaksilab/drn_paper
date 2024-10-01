function pos = add_ver_sca_bar(hax, len, col)
pos = hax.Position;
y_lim = hax.YLim;
pos = [pos(1) - 0.007 pos(2) 0.01 pos(4)];
h = axes('Position', pos);
y = 0;
plot([0 0], [y y + len], 'LineWidth', 2, 'Color', col)
h.YLim = y_lim;
set(h, 'visible', 'off')
end