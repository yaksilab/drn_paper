function [cro_cor, max_lag] = com_cro_cor_win(sam_rat, sam_1, sam_2, sam_tim, tim, dur)
% PURPOSE: compute cross correlation in the window
%---------------------------------------------------
% USAGE: [cro_cor, max_lag_n_sam] = com_cro_cor(sam_rat, tim_ser_1, tim_ser_2, tim, dur)
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

% Written by: Kadir Mutlu

sam_1_sel = sel(sam_rat, sam_1, sam_tim, tim, dur);
sam_2_sel = sel(sam_rat, sam_2, sam_tim, tim, dur);

sam_1_sel_mea_cen = mea_cen(sam_1_sel);
sam_2_sel_mea_cen = mea_cen(sam_2_sel);

n_sam = length(sam_1_sel);
max_lag_n_sam = round(n_sam/5);
max_lag = max_lag_n_sam/sam_rat;

cro_cor = xcorr(sam_1_sel_mea_cen, sam_2_sel_mea_cen, max_lag_n_sam);