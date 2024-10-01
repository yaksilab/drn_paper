function [tim_bin, rat_bin] = com_rat_bin(sta_tim, end_tim, tra, bin_siz)
% PURPOSE: function purpose
%---------------------------------------------------
% USAGE: [tim, fir_rat, n_tri] = com_fir_rat(spi, bin_siz)
% where: varargin = vector of input variables
%---------------------------------------------------
% RETURNS: a vector of output arguments composed of:
% x = 1.2
% --------------------------------------------------
% SEE ALSO: f(results)
%---------------------------------------------------
% REFERENCES: 
%---------------------------------------------------
% REMARKS: 
%---------------------------------------------------

% Written by: Kadir Mutlu

edg = sta_tim:bin_siz:end_tim;
cou = histcounts(tra, edg);
rat_bin = cou/bin_siz;
tim_bin = edg(1:end - 1) + bin_siz/2;
tim_bin = tim_bin';
rat_bin = rat_bin';
end