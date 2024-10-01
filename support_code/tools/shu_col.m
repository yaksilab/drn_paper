function var_row_col = shu_col(var_row_col)
% for upper part!
[n_row, n_col] = size(var_row_col);
for row = 1:n_row
    for ite = 1:7
        var_row_col(row, row + 1:end) = var_row_col(row, row + randperm(n_col - row));
    end
end
end

% [~, n_col] = size(var_row_col);
% for ite = 1:7
%     var_row_col = var_row_col(:, randperm(n_col));
% end