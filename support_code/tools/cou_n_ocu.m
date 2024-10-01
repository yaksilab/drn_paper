function [val_uni_row_col, n_ocu_row, mat_num] = cou_n_ocu(val_row_col)
% PURPOSE: count number of occurences
%---------------------------------------------------
% USAGE: [row, n_ocu, mat_num] = cou_n_ocu(mat)
% where: varargin = vector of input variables
%---------------------------------------------------
% RETURNS: a vector of output arguments composed of:
% x = 1.2
% --------------------------------------------------
% SEE ALSO: f(results)
%---------------------------------------------------
% REFERENCES: 
%---------------------------------------------------
% REMARKS: works because row/*val_uni_row_col* is sorted by unique.
% [row, n_ocu_row, mat_num] = cal_fre(val_row_col)
%---------------------------------------------------

% Written by: Kadir Mutlu

[val_uni_row_col, mat_num, row_num] = unique(val_row_col, 'rows');% each row is a single entity
n_ocu_row = accumarray(row_num, 1);
end
