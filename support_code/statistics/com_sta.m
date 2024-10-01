function [mea, sta_dev, sem, n] = com_sta(ele_row_col_pag, dim)
% PURPOSE: function purpose
%---------------------------------------------------
% USAGE: [mea, sta_dev, sem, n] = com_sta(mat, dim)
% where: varargin = vector of input variables
%---------------------------------------------------
% RETURNS: a vector of output arguments composed of:
% x = 1.2
% --------------------------------------------------
% SEE ALSO: f(results)
%---------------------------------------------------
% REFERENCES: 
%---------------------------------------------------
% REMARKS: if mat is a vector, should be row vector.
%---------------------------------------------------

% Written by: Kadir Mutlu

mea = mean(ele_row_col_pag, dim, 'omitnan');
sta_dev = std(ele_row_col_pag, 0, dim, 'omitnan');
%
n_row_one_pag = size(ele_row_col_pag, dim) - matlab.internal.math.countnan(ele_row_col_pag, dim);
n = max(n_row_one_pag, [], 'all');
if range(n_row_one_pag, 'all') ~= 0
    warning('nan issue')
end
sem = sta_dev./sqrt(n_row_one_pag);
end
