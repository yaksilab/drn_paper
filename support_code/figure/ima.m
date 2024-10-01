function ima_obj = ima(hax, ind_var_col, dep_var_row_col)
% for maps, not for images!
% rows are the units
[n_row, n_col] = size(dep_var_row_col);
if isnan(ind_var_col)
    ind_var_col = 1:n_col;
end
ima_obj = imagesc(hax, ind_var_col, 1:n_row, dep_var_row_col);
if n_row == 1
    yticks(hax, n_row)
else
    yticks(hax, [1 n_row])
end
hax.TickLength = [0 0];
box(hax, 'off')
end
