function [amp_sam, tim_sam, ave_amp] = sel_sig(sam_rat, amp_sam, ref_tim, win_siz, ref)
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

sam_tim = com_sam_tim(sam_rat, amp_sam(:, 1));

n_sam_win = ceil(sam_rat*win_siz);
if strcmp(ref, 'sta')
    sta_ind = floor(sam_rat*ref_tim) + 1; % so that tim can also be 0.
    end_ind = sta_ind + n_sam_win;
else
    end_ind = floor(sam_rat*ref_tim) + 1;
    sta_ind = end_ind - n_sam_win;
end
ind = sta_ind:end_ind;

amp_sam = amp_sam(ind, :);
tim_sam = sam_tim(ind);

ave_amp = mean(amp_sam);