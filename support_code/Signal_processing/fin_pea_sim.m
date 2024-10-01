function [pea_tim, pea_amp, pea_fre, pea_per, pea_sam_num] = fin_pea_sim(sam_rat, sig)
% PURPOSE: find peaks
%---------------------------------------------------
% USAGE: [pea_tim, pea_amp, pea_fre, pea_per, pea_sam_num] = fin_pea_sim(sam_rat, sig)
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
% more arguments: fin_pea_adv
%---------------------------------------------------

% Written by: Kadir Mutlu

% find peaks
[pea_amp, pea_sam_num, ~, ~] = findpeaks(sig);

pea_tim = com_tim(sam_rat, pea_sam_num);
pea_per = diff(pea_tim);
pea_fre = 1./pea_per;