function sig_bsf = bsf(sam_rat, sig, cut_fre)
% PURPOSE: band stop filter
%---------------------------------------------------
% USAGE: sig_bsf = bsf(sam_rat, sig, cut_fre)
% where:
% sam_rat = sampling rate
% sig = signal
% cut_fre = cut off frequency
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
if mod(fil_ord, 2) == 1
    fil_ord = fil_ord - 1;
end
%fil_ord = 10000;

% design the bandstop filter.
b = fir1(fil_ord, [cut_fre(1) cut_fre(2)]/nyq_fre, 'stop');

% bandpass filter
sig_bsf = filtfilt(b, 1, sig);