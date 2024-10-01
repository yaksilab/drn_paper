function [obs_slr, res_slr, r_squ] = com_dat_poi_slr(obs, res)
% PURPOSE: function purpose
%---------------------------------------------------
% USAGE: varargout = com_dat_poi_slr(varargin)
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
% check nan
log_nan = isnan(obs) | isnan(res);
obs(log_nan) = [];
res(log_nan) = [];
%
mdl = fitlm(obs, res);
bet = mdl.Coefficients.Estimate;
r_squ = mdl.Rsquared.Ordinary;
n_dat_poi = 1000000;
inc = (max(obs) - min(obs))/n_dat_poi;
obs_slr = (min(obs):inc:max(obs))';
res_slr = bet(1) + bet(2)*obs_slr;
end
