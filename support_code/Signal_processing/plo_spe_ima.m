function [ima, h] = plo_spe_ima(tim, fre, amp, col)
% PURPOSE: function purpose
%---------------------------------------------------
% USAGE: ima = plo_spe(tim, fre, amp, col)
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

fon_siz = 24;

ima = image(tim, fre, amp, 'CDataMapping', 'scaled');
colormap(jet)
axis xy
if col == true
    h = colorbar;
end
enl_num(fon_siz)
lab_y_axi('Frequency (Hz)', fon_siz)