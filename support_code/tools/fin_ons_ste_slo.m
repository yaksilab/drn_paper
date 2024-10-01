function ind_fal = fin_ons_ste_slo(one_dim_arr, thr_fal)
% PURPOSE: find onsets of steep slopes
%---------------------------------------------------
% USAGE: ind_fal = fin_ind_fal(one_dim_arr, the_fal)
% where:
% one_dim_arr = one-dimensional array
% thr_fal = threshold fall
%---------------------------------------------------
% RETURNS: a vector of output arguments composed of:
% ind_fal = indices fall
% --------------------------------------------------
% SEE ALSO: f(results)
%---------------------------------------------------
% REFERENCES: 
%---------------------------------------------------
% REMARKS: 
% incomplete
%---------------------------------------------------

% Written by: Kadir Mutlu

one_dim_arr_dif = diff(one_dim_arr);
fal = one_dim_arr_dif < -thr_fal;
ind_fal = find(fal == 1) + 1;