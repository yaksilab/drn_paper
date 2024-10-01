function [pos_del, neg_del] = plo_x_cor(sam_rat, x_cor, max_lag)
% PURPOSE: plot cross correlation
%---------------------------------------------------
% USAGE: plo_cro_cor(sam_rat, cro_cor, max_lag)
% where:
% sam_rat = sampling rate
% cro_cor = cross correlation
% max_lag_n_sam = maxlags
% mar = marker
% col_mar_edg = color marker edge
% col_mar_fac = color marker face
% siz_mar = size marker
% --------------------------------------------------
% SEE ALSO:
%---------------------------------------------------
% REFERENCES: 
%---------------------------------------------------
% REMARKS:
%---------------------------------------------------

% Written by: Kadir Mutlu

sam_per = 1/sam_rat;
lag = (-max_lag:sam_per:max_lag)';

[~, del_pea] = findpeaks(x_cor, lag);
pos_del_pea = del_pea(del_pea >= 0);
neg_del_pea = del_pea(del_pea <= 0);
pos_del = min(pos_del_pea);
neg_del = max(neg_del_pea);

plot(lag*1000, x_cor, 'linewidth', 5);