function [ins_pha_spl, cyc_beg, cyc_end, n_cyc] = spl_ins_pha(ins_pha)
% PURPOSE: To split the instanteous phase into chunks from -pi to pi
%---------------------------------------------------
% USAGE: [ins_pha_spl, ind_fal] = spl_ins_pha(ins_pha)
% where:
% ins_pha = instantenous phase
%---------------------------------------------------
% RETURNS: a vector of output arguments composed of:
% ins_pha_spl = instantenous phase split
% ind_fal = indices of fall
% --------------------------------------------------
% SEE ALSO:
%---------------------------------------------------
% REFERENCES: 
%---------------------------------------------------
% REMARKS: write a fun to remove non cyclics
% thr_fal = threshold fall
% ind = indices
% chu = chunk
%---------------------------------------------------

% Written by: akm

thr = pi;
[cyc_end, cyc_beg] = fin_cyc_bou(ins_pha, thr);

cyc_end(1) = [];
cyc_beg(end) = [];

n_cyc = length(cyc_beg);
ins_pha_spl = cell(n_cyc, 1);

for i = 1:n_cyc
    ins_pha_spl{i} = ins_pha(cyc_beg(i):cyc_end(i));
end