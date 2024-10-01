function [sam_poi_var, n_sam] = sel_sig_fft(sam_poi_var)
% PURPOSE: select signal for fft
%---------------------------------------------------
% USAGE: [sig, n_sam] = sel_sig_fft(sig)
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

n_sam = size(sam_poi_var, 1);
sam_poi_var = sam_poi_var(1:2^(nextpow2(n_sam) - 1), :);