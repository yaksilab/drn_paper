function sig_fft = pre_sig_fft(sig)
% PURPOSE: prepare signal for fft
%---------------------------------------------------
% USAGE: sig_fft = pre_sig_fft(sig)
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

n_sam = length(sig);
nex_pow_2 = nextpow2(n_sam);
pow_2 = nex_pow_2 - 1;

sig_fft = sig(1:2^pow_2);