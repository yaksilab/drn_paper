function ins_pha = com_ins_pha(sig)
% PURPOSE: To compute the instantenous phase
%---------------------------------------------------
% USAGE: ins_pha = com_ins_pha(sig)
% where:
% sig = signal
%---------------------------------------------------
% RETURNS: a vector of output arguments composed of:
% ins_pha = instantenous phase
% --------------------------------------------------
% SEE ALSO: f(results)
%---------------------------------------------------
% REFERENCES: 
%---------------------------------------------------
% REMARKS: 
% tim_ser_ana = time series analytical
%---------------------------------------------------

% Written by: Kadir Mutlu

sam_ana = hilbert(sig);
ins_pha = angle(sam_ana);