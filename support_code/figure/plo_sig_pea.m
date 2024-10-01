function plo_sig_pea(sig, pea_sam_num)
% PURPOSE: function purpose
%---------------------------------------------------
% USAGE: plo_sig_mar(sig, mar_tim, mar_amp)
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

sam_rat = 3000;
mar_tim = pea_sam_num/sam_rat;
mar_amp = sig(pea_sam_num);
plo_sig_mar(sig, mar_tim, mar_amp)