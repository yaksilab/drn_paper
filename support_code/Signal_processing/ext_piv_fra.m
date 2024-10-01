function [piv_fra, piv] = ext_piv_fra(piv_row_col_fra, log_row_col)
n_fra = size(piv_row_col_fra, 3);
mas = repmat(log_row_col, 1, 1, n_fra);

piv_row_col_fra = double(piv_row_col_fra);

piv_row_col_fra(~mas) = nan;
piv_fra = squeeze(mean(piv_row_col_fra, [1 2], 'omitnan'));
piv = mean(piv_fra);
end
