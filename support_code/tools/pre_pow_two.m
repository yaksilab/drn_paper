function num_pre_pow_two = pre_pow_two(num)
% PURPOSE: function purpose
%---------------------------------------------------
% USAGE: num_pre_pow_two = pre_pow_two(num)
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

num_nex_pow_two = 2^nextpow2(num);
if num_nex_pow_two == num
    num_pre_pow_two = num;
else
    num_pre_pow_two = num_nex_pow_two/2;
end