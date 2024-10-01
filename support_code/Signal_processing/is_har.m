function log_har = is_har(amp, fre, fun_fre, max_amp, thr_rat)
% PURPOSE: function purpose
%---------------------------------------------------
% USAGE: varargout = is_har(varargin)
% where: varargin = vector of input variables
%---------------------------------------------------
% RETURNS: a vector of output arguments composed of:
% x = 1.2
% --------------------------------------------------
% SEE ALSO: f(results)
%---------------------------------------------------
% REFERENCES: 
%---------------------------------------------------
% REMARKS: If sec_har > nyq_fre, log_har == 0.
% Add the case fun_fre == 0.
%---------------------------------------------------

% Written by: Kadir Mutlu

[n_fre, n_seg, n_sig] = size(amp);

sec_har = 2*fun_fre;
sec_har_mat = sec_har(ones(n_fre, 1), :, :);
fre_mat = fre(:, ones(1, n_seg), ones(1, n_sig));
log_fre = fre_mat == sec_har_mat;

amp_sec_har = sum(amp.*log_fre);
log_har = amp_sec_har./max_amp > thr_rat;