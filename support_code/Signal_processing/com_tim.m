function tim = com_tim(sam_rat, sam_num)
% PURPOSE: compute time
%---------------------------------------------------
% USAGE: tim = com_tim(sam_rat, sam_num)
% where: varargin = vector of input variables
%---------------------------------------------------
% RETURNS: a vector of output arguments composed of:
% x = 1.2
% --------------------------------------------------
% SEE ALSO: f(results)
%---------------------------------------------------
% REFERENCES: 
%---------------------------------------------------
% REMARKS: consistent with matlab, first sample is not at 0s, but at the sampling period
% so that if fs = 1000, you have 1000 samles, last sample is @ 1s.
%---------------------------------------------------

% Written by: Kadir Mutlu

sam_per = 1/sam_rat;
tim = sam_per*sam_num;