function log_vec = isx_wit_clo(num, ran)
% PURPOSE: is within
%---------------------------------------------------
% USAGE: log_vec = isx_wit_clo(num, ran)
% where: ran = range
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

log_vec = num >= ran(:, 1) & num <= ran(:, 2);