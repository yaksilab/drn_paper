function [mea, sem, n] = com_mea_sem_cel_arr(cel_arr)
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

n_pre = length(cel_arr);
mea = nan(n_pre, 1);
sem = nan(n_pre, 1);
n = nan(n_pre, 1);
for i = 1:n_pre
    [mea(i), sem(i), n(i)] = com_sta(cel_arr{i}, 1);
end