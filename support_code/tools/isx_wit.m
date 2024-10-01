function log_vec = isx_wit(vec, ran)
% PURPOSE: is within
%---------------------------------------------------
% USAGE: log_vec = is_wit(vec, ran)
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

log_vec = vec > ran(1) & vec < ran(2);