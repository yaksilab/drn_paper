function [h_lin, pos, h] = add_ver_sca_bar_top(hax, len, col)
pos = hax.Position;
y_lim = hax.YLim;
y = y_lim(2);
pos = [pos(1) - 0.007 pos(2) 0.01 pos(4)];
h = axes('Position', pos);
h_lin = plot([0 0], [y y - len], 'Color', col);
h.YLim = y_lim;
set(h, 'visible', 'off')
end