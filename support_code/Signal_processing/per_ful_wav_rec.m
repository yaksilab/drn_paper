function sig = per_ful_wav_rec(sig)
% PURPOSE: perform full-wave rectification
%---------------------------------------------------
% USAGE: sig = per_ful_wav_rec(sig)
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

log_neg = sig < 0;

sig(log_neg) = -sig(log_neg);
end