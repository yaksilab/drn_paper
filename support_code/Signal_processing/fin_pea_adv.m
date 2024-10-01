function [pea_tim, pea_amp, pea_fre, pea_per, pea_sam_num, lef_bas, rig_bas] = fin_pea_adv(sam_rat, sig, mph, mpp, thr)
% PURPOSE: find peaks
%---------------------------------------------------
% USAGE: [pea_tim, pea_amp, pea_fre, pea_per, pea_sam_num] = fin_pea(sam_rat, sig, mph, mpp)
% where:
% sam_rat = sampling rate
% sig = signal
% mvd = minimum valley depth
%---------------------------------------------------
% RETURNS: a vector of output arguments composed of:
% pea_tim = peak times
% pea = peaks
% sam_num_pea = sample number peaks
% --------------------------------------------------
% SEE ALSO: f(results)
%---------------------------------------------------
% REFERENCES: 
%---------------------------------------------------
% REMARKS: threshold doesn't solve, prominence to the left.
%---------------------------------------------------

% Written by: Kadir Mutlu

max_fre = 15; % can be revised
min_per = 1/max_fre;
mpd = sam_rat*min_per;

% find peaks
[pea_amp, pea_sam_num, ~, ~, lef_bas, rig_bas] = findpeaks(sig, 'MinPeakHeight', mph, 'MinPeakProminence', mpp, 'Threshold', thr, 'MinPeakDistance', mpd);

pea_tim = com_tim(sam_rat, pea_sam_num);
pea_per = diff(pea_tim);
pea_fre = 1./pea_per;