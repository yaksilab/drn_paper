function pai_med = com_pai_med(vec)
% PURPOSE: compute paired median
%---------------------------------------------------
% USAGE: pai_med = com_pai_med(vec)
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

n_ele = length(vec);
n_ele_med = n_ele - 1;
pai_med = zeros(n_ele_med, 1);
for i = 1:n_ele_med
    pai_med(i) = median([vec(i) vec(i + 1)]);
end