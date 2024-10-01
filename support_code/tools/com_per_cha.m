function per_cha = com_per_cha(old, new)
% PURPOSE: compute percentage change
%---------------------------------------------------
% USAGE: per_cha = com_per_cha(old, new)
%---------------------------------------------------
% RETURNS:
% per_cha = percent change
% --------------------------------------------------
% SEE ALSO:
%---------------------------------------------------
% REFERENCES: 
%---------------------------------------------------
% REMARKS: 
%---------------------------------------------------

% Written by: akm

cha = new - old;
per_cha = (cha./old)*100;