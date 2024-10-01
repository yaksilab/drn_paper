function sig = lpf(sam_rat, sig, cut_off_fre)
% PURPOSE: To low pass filter
%---------------------------------------------------
% USAGE: sig = lpf(sam_rat, sig, cut_off_fre)
% where:
% sam_rat = sampling rate
% sig = signal
% cut_off_fre = cut off frequency
%---------------------------------------------------
% RETURNS: a vector of output arguments composed of:
% sig = low pass filtered signal
% --------------------------------------------------
% SEE ALSO: f(results)
%---------------------------------------------------
% REFERENCES: 
%---------------------------------------------------
% REMARKS: 
% nyq_fre = nyquistfrequency
% fil_ord = filter order
%---------------------------------------------------

% Written by: Kadir Mutlu

nyq_fre = sam_rat/2;
n_sam = size(sig, 1);
fil_ord = min([ceil(n_sam/3) - 1 500]);

b = fir1(fil_ord, cut_off_fre/nyq_fre);
sig = filtfilt(b, 1, sig);