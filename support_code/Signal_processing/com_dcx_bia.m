function [bas_var, n_sam] = com_dcx_bia(sam_rat, sam_poi_var)
% PURPOSE: compute dc bias
%---------------------------------------------------
% USAGE: [dcx_bia, n_sam] = com_dcx_bia(sam_rat, sig)
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

fre_ran = [0 0];

% REMARKS: Make sure that the length of the signal is power of 2.
[sam_poi_var, n_sam] = sel_sig_fft(sam_poi_var);

[~, bas_var] = com_amp_spe(sam_rat, sam_poi_var, fre_ran);