function har = com_har(amp, fre, fun_fre, max_amp)
% PURPOSE: function purpose
%---------------------------------------------------
% USAGE: har = com_har(amp, fre, fun_fre, max_amp)
% where: varargin = vector of input variables
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

[n_fre, n_seg, n_sig] = size(amp);

sec_har = 2*fun_fre;
sec_har_mat = sec_har(ones(n_fre, 1), :, :);
fre_mat = fre(:, ones(1, n_seg), ones(1, n_sig));
log_fre = fre_mat == sec_har_mat;

amp_sec_har = sum(amp.*log_fre);
har_raw = amp_sec_har./max_amp;

har = fix_nan_zer(har_raw);