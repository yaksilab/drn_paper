function ima = plo_spe_sig(sam_rat, sig, seg_len, fre_ran, dcx, col, sta_tim)
% PURPOSE: function purpose
%---------------------------------------------------
% USAGE: plo_spe(sam_rat, sig, len_seg, fre_ran, dcx)
% where:
% sam_rat = sampling rate
% sig = signal
% seg_len = length segment (in samples). Should be a power of 2. If you want fft.
% fre_ran = frequency range
% dcx = false: no correction for dc bias. true: correction
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

[tim, fre, amp] = seg_amp_spe(sam_rat, sig, seg_len, fre_ran, dcx, sta_tim);
ima = plo_spe_ima(tim, fre, amp, col);