function cor_coe = com_cor_coe(mat)
% Omit any rows of the input containing NaN values before computing the
% correlation coefficients. option below. better than inputting two
% variables cos we can omit nan s.
cor_mat = corrcoef(mat, 'Rows', 'complete');
if ~isnan(cor_mat)
    cor_coe = cor_mat(1, 2);
else
    cor_coe = nan;
end
end