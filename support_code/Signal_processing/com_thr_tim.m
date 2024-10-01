function [thr_tim, thr_bou] = com_thr_tim(sam, sam_rat, thr)
% PURPOSE: compute threshold times
%---------------------------------------------------
% USAGE: thr_tim = com_thr_tim(sam, sam_rat, thr)
% where:
% sam = samples
% sam_rat = sampling rate
% thr = threshold
%---------------------------------------------------
% RETURNS: a vector of output arguments composed of:
% thr_tim = threshold times
% --------------------------------------------------
% SEE ALSO: 
%---------------------------------------------------
% REFERENCES: 
%---------------------------------------------------
% REMARKS: 
%---------------------------------------------------

% Written by: akm

thr_bou = com_thr_bou(sam, thr);
thr_tim = thr_bou/sam_rat;