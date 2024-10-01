function sig = hpf(sam_rat, sig, cut_fre)
% PURPOSE: high pass filter
%---------------------------------------------------
% USAGE: sig = hpf(sam_rat, sig, cut_fre)
% where:
% sam_rat = sampling rate
% sig = signal
% cut_off_fre = cut off frequency
%---------------------------------------------------
% RETURNS: a vector of output arguments composed of:
% sig = high pass filtered signal
% --------------------------------------------------
% SEE ALSO: f(results)
%---------------------------------------------------
% REFERENCES: 
%---------------------------------------------------
% REMARKS: 
%---------------------------------------------------

% Written by: Kadir Mutlu

nyq_fre = sam_rat/2;
n_sam = size(sig, 1);
fil_ord = min([ceil(n_sam/3) - 2 500]);

% design the highpass filter.
b = fir1(fil_ord, cut_fre/nyq_fre, 'high');

% bandpass filter
sig = filtfilt(b, 1, sig);