function [y_min, y_max, hax] = adj_y(hax, y_min, y_max)
y_min_zer = y_min;
y_max_zer = y_max;
%
y_lim = hax.YLim;
if y_lim(1) < y_min
    y_min = y_lim(1);
end
if y_lim(2) > y_max
    y_max = y_lim(2);
end
hax.YLim = [y_min y_max];
%
if y_min == -1 && y_max == 1
    y_min = y_min_zer;
    y_max = y_max_zer;
    if y_min ~= inf
        hax.YLim = [y_min y_max];
    end
end
end