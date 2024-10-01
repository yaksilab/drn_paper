function sig = bpf(sam_rat, sig, cut_fre)
% PURPOSE: band pass filter
%---------------------------------------------------
% USAGE: sig_bpf = bpf(sam_rat, sig, cut_fre)
% where:
% sam_rat = sampling rate
% sig = signal
% cut_off_fre = cut off frequency
%---------------------------------------------------
% RETURNS: a vector of output arguments composed of:
% sig = band pass filtered signal
% --------------------------------------------------
% SEE ALSO: f(results)
%---------------------------------------------------
% REFERENCES: 
%---------------------------------------------------
% REMARKS: 
% fil_ord_suf = 10000;
% n_sam = size(sig, 1);
% fil_ord = min([ceil(n_sam/3) - 1 fil_ord_suf]);
%---------------------------------------------------

% Written by: Kadir Mutlu

nyq_fre = sam_rat/2;
n_sam = size(sig, 1);
fil_ord = ceil(n_sam/3) - 1;

% design the bandpass filter.
b = fir1(fil_ord, [cut_fre(1) cut_fre(2)]/nyq_fre);

% bandpass filter
sig = filtfilt(b, 1, sig);