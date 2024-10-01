function thr_bou = com_thr_bou(vec, thr)
% PURPOSE: compute threshold boundaries, for indices where the value exceeds
% the threshold.
%---------------------------------------------------
% USAGE: thr_bou = com_thr_bou(vec, thr)
% where:
% vec = column vector
% thr = threshold
%---------------------------------------------------
% RETURNS: a vector of output arguments composed of:
% the_bou = threshold boundaries. first column: beginning, second column: end
% --------------------------------------------------
% SEE ALSO: 
%---------------------------------------------------
% REFERENCES: 
%---------------------------------------------------
% REMARKS: 
% ind_the_beg = indices threshold beginning
% ind_the_end = indices threshold end
%---------------------------------------------------

% Written by: Aytac Kadir Mutlu

the_log = vec > thr;

len_vec = length(vec);
ind = 1:len_vec;

dif_the = diff(the_log);

thr_beg_log_pre = dif_the > 0;
thr_end_log_pre = dif_the < 0;

fir_log = the_log(1);
las_log = the_log(end);

thr_beg_log = [fir_log; thr_beg_log_pre];
thr_end_log = [thr_end_log_pre; las_log];

ind_thr_beg = ind(thr_beg_log);
ind_thr_end = ind(thr_end_log);

thr_bou = [ind_thr_beg' ind_thr_end'];