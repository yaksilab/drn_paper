function [amp_sam, tim_sam, ave_amp] = sel_sig_uni(tim_sam, amp_sam, ref_tim, win_siz, ref)
% PURPOSE: select
%---------------------------------------------------
% USAGE: [sam_sel, sam_tim_sel] = sel_sig(sam_rat, sig, sta_tim, dur)
% where:
% sam_rat = sampling rate
% sam = samples
% sam_tim = sampling times
% tim = time
% dur = duration
%---------------------------------------------------
% RETURNS: a vector of output arguments composed of:
% sam_sel = samples selected
% sam_tim_sel = sampling times selected
% --------------------------------------------------
% SEE ALSO: f(results)
%---------------------------------------------------
% REFERENCES: 
%---------------------------------------------------
% REMARKS: 
%---------------------------------------------------

% Written by: Kadir Mutlu

if strcmp(ref, 'sta')
    log_win = tim_sam > ref_tim & tim_sam < ref_tim + win_siz;
else
    log_win = tim_sam > ref_tim - win_siz & tim_sam < ref_tim;
end
amp_sam = amp_sam(log_win, :);
tim_sam = tim_sam(log_win);

ave_amp = mean(amp_sam);