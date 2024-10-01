function [mea, sem, n] = com_mea_sem_cel_arr_bin(cel_arr)
% PURPOSE: function purpose
%---------------------------------------------------
% USAGE: [mea, sem, n] = com_mea_sem_cel_arr(cel_arr)
% where: varargin = vector of input variables
%---------------------------------------------------
% RETURNS: a vector of output arguments composed of:
% x = 1.2
% --------------------------------------------------
% SEE ALSO: f(results)
%---------------------------------------------------
% REFERENCES: 
%---------------------------------------------------
% REMARKS: 
%---------------------------------------------------

% Written by: Kadir Mutlu

n_cat = length(cel_arr);
n_bin = length(cel_arr{1}(:, 1));

mea = zeros(n_bin, n_cat);
sem = zeros(n_bin, n_cat);
n = zeros(1, n_cat);
for i = 1:n_cat
    [mea(:, i), sem(:, i), n(i)] = com_mea_sem(cel_arr{i});
end