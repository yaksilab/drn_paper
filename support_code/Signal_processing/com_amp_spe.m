function [fre, amp_var] = com_amp_spe(sam_rat, sam_poi_var, fre_ran)
% PURPOSE: compute amplitude spectrum
%---------------------------------------------------
% USAGE: [fre, amp] = com_amp_spe(sam_rat, sig, fre_ran)
% where: varargin = vector of input variables
%---------------------------------------------------
% RETURNS: a vector of output arguments composed of:
% x = 1.2
% --------------------------------------------------
% SEE ALSO: f(results)
%---------------------------------------------------
% REFERENCES: 
%---------------------------------------------------
% REMARKS: Make sure that the length of the signal is power of 2.
%---------------------------------------------------

% Written by: Kadir Mutlu

nyq_fre = sam_rat/2;
fre_min = fre_ran(1);
fre_max = fre_ran(2);

n_sam = size(sam_poi_var, 1);
hal = n_sam/2;

% fre
fre_res = nyq_fre/hal;
fre_ind_raw = fix(fre_ran/fre_res);
if fre_min == 0
    fre_ran_2 = fre_ind_raw*fre_res;
else
    % + 1 is due to the fact that we want to take the next frequency to be
    % in the range.
    fre_ran_2 = [fre_ind_raw(1) + 1 fre_ind_raw(2)]*fre_res;
end
fre = (fre_ran_2(1):fre_res:fre_ran_2(2))';

% amp
dft = fft(sam_poi_var)/n_sam;

fre_ind = 1 + fre_ind_raw;

% + 1 is due to the fact that we want to take the next frequency to be in
% the range.
fre_ind_min = fre_ind(1) + 1;
fre_ind_max = fre_ind(2);

nyq_ind = hal + 1;

if fre_min == 0 && fre_max == nyq_fre
    % offset + other (symmetric) amplitudes, therefore doubled + nyquist point (point of symmetry)
    amp_var = [dft(1, :, :); 2*abs(dft(2:hal, :, :)); dft(nyq_ind, :, :)];
elseif fre_min == 0
    amp_var = [dft(1, :, :); 2*abs(dft(2:fre_ind_max, :, :))];
elseif fre_max == nyq_fre
    amp_var = [2*abs(dft(fre_ind_min:hal, :, :)); dft(nyq_ind, :, :)];
else
    amp_var = 2*abs(dft(fre_ind_min:fre_ind_max, :, :));
end