function [max_lag, r_lag_var, tim_del_var] = com_cro_cor(sam_rat, sam_poi_var, sig_2, max_lag)
% PURPOSE: compute cross correlation
%---------------------------------------------------
% USAGE: [max_lag, cro_cor] = com_cro_cor(sam_rat, sig_1, sig_2)
% where:
% sam_rat = sampling rate
% sam_1 = samples 1
% sam_2 = samples 2
% max_lag = max lag
%---------------------------------------------------
% RETURNS: a vector of output arguments composed of:
% cro_cor = cross correlation
% max_lag_n_sam = maxlags
% --------------------------------------------------
% SEE ALSO: f(results)
%---------------------------------------------------
% REFERENCES: r = xcorr(x,y) returns the cross-correlation of two discrete-time sequences. 
% Cross-correlation measures the similarity between a vector x and shifted (lagged) copies of a vector y 
% as a function of the lag.
%---------------------------------------------------
% REMARKS: 
%---------------------------------------------------

% Written by: Kadir Mutlu

sam_poi_var = rem_bas(sam_rat, sam_poi_var);
sig_2 = rem_bas(sam_rat, sig_2);

[~, n_var] = size(sam_poi_var);
max_lag_n_poi = round(sam_rat*max_lag);

n_lag = 2*max_lag_n_poi + 1;
r_lag_var.raw = nan(n_lag, n_var);
r_lag_var.abs = nan(n_lag, n_var);
lag_var = nan(n_var, 1);
for var_num = 1:n_var
    [r_lag_var.raw(:, var_num), lag_ind] = xcorr(sam_poi_var(:, var_num), sig_2, max_lag_n_poi, ...
        'normalized');
    r_lag_var.abs(:, var_num) = abs(r_lag_var.raw(:, var_num));
    [~, ind_lag] = max(r_lag_var.abs(:, var_num), [], 1);
    lag_var(var_num) = lag_ind(ind_lag);
end
tim_del_var = lag_var/sam_rat;
end
