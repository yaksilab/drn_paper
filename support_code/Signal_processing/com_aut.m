function aut = com_aut(sam, sam_lag_max)
% PURPOSE: compute autocorrelation
%---------------------------------------------------
% USAGE: aut = com_aut(sam, sam_lag_max)
% where:
% sam_rat = sampling rate
% tim_ser_1 = time series 1
% tim_ser_2 = time series 2
% sam_tim = sampling times
% tim = time
% dur = duration
%---------------------------------------------------
% RETURNS: a vector of output arguments composed of:
% cro_cor = cross correlation
% max_lag_n_sam = maxlags
% --------------------------------------------------
% SEE ALSO: f(results)
%---------------------------------------------------
% REFERENCES: 
%---------------------------------------------------
% REMARKS: 
%---------------------------------------------------

% Written by: akm

sam_mea_cen = mea_cen(sam);

aut = xcorr(sam_mea_cen, sam_mea_cen, sam_lag_max);