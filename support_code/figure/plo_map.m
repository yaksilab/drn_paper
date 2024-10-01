function [map_mat, ima] = plo_map(mat)
ima = imagesc(mat);
yticks([])
map_mat = colormap(cool);
end