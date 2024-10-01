function [tim_sam, len] = cal_tim_poi(sam_rat, n_sam)
% PURPOSE: To compute the sampling times
%---------------------------------------------------
% USAGE: [sam_tim, len] = com_sam_tim(sam_rat, sig)
% where: 
% sam = samples
% sam_rat = sampling rate
%---------------------------------------------------
% RETURNS: a vector of output arguments composed of:
% sam_tim = sampling times
% --------------------------------------------------
% SEE ALSO: f(results)
%---------------------------------------------------
% REFERENCES: 
%---------------------------------------------------
% REMARKS: 
% sam_per = sampling period
% len = length
%---------------------------------------------------

% Written by: Kadir Mutlu

sam_per = 1/sam_rat;
len = sam_per*n_sam;
tim_sam = sam_per:sam_per:len;
tim_sam = tim_sam';