function sig = dcf(sam_rat, sig)
% PURPOSE: dc filter
%---------------------------------------------------
% USAGE: sig = dcf(sam_rat, sig)
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

cut_fre = 1;

p = dcblock(cut_fre, sam_rat);              % get filter coefficient
b = [1 -1];                         % set up differentiator
a = [1 -p];                         % set up integrator
sig = filtfilt(b, a, sig);                  % filter test data