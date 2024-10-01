function [tim, fre, amp] = seg_amp_spe(sam_rat, sig, seg_len, fre_ran, dcx, sta_tim)
% PURPOSE: function purpose
%---------------------------------------------------
% USAGE: varargout = seg_amp_spe(varargin)
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

if dcx == true
    dcx_bia = com_dcx_bia(sam_rat, sig);
    sig = sig - dcx_bia;
end

[tim, seg] = seg_sig(sam_rat, sig, seg_len);
[fre, amp] = com_amp_spe(sam_rat, seg, fre_ran);

if dcx == true
    fre = fre(2:end);
    amp = amp(2:end, :);
end

tim = tim + sta_tim;