function [tim, fre, psd] = com_psd(sam_rat, sig, win_len)
% PURPOSE: function purpose
%---------------------------------------------------
% USAGE: varargout = com_psd(varargin)
% where: varargin = vector of input variables
%---------------------------------------------------
% RETURNS: a vector of output arguments composed of:
% x = 1.2
% --------------------------------------------------
% SEE ALSO: f(results)
%---------------------------------------------------
% REFERENCES: 
%---------------------------------------------------
% REMARKS: rectangular window
%---------------------------------------------------

% Written by: Kadir Mutlu

per_ove = 0.5;

n_sam_win = sam_rat*win_len;
win = rectwin(n_sam_win);
n_fft = 2^nextpow2(n_sam_win);
[~, fre, tim, psd] = spectrogram(sig, win, floor(per_ove*n_sam_win), n_fft, sam_rat);
tim = tim';