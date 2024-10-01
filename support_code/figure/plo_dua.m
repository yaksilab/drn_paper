function h = plo_dua(obs_1, res_1, obs_2, res_2, num_hig_amp)
% PURPOSE: plot dual
%---------------------------------------------------
% USAGE: h = plo_dua(obs_1, res_1, obs_2, res_2, num_hig_amp)
% where: num_hig_amp = number in the order of the high amp data. 1 or 2.
% first or second.
%---------------------------------------------------
% RETURNS: a vector of output arguments composed of:
% x = 1.2
% --------------------------------------------------
% SEE ALSO: f(results)
%---------------------------------------------------
% REFERENCES: 
%---------------------------------------------------
% REMARKS: Aligns 0 ax according to the first dataset
% removing the baseline and alignment of y-axis at 0 are necessary.
% alignment according to the signal with higher max amplitude.
%---------------------------------------------------

% Written by: Kadir Mutlu

num_low_amp = 3 - num_hig_amp;
[h, h_1, h_2] = plotyy(obs_1, res_1, obs_2, res_2);

% Retrieve Ylim of first axis
y_lim = nan(2, 2);
y_lim(1, :) = get(h(1), 'Ylim');
y_lim(2, :) = get(h(2), 'Ylim');
% Ratio of negative leg to positive one (keep sign)
ratio = y_lim(num_hig_amp, 1)/y_lim(num_hig_amp, 2);
% Set same ratio for second axis
y_lim(num_low_amp, :) = get(h(num_low_amp), 'Ylim');
set(h(num_low_amp), 'Ylim', [y_lim(num_low_amp, 2)*ratio y_lim(num_low_amp, 2)])

h_1.LineWidth = 5;
h_2.LineWidth = 5;