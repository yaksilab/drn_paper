function [tac_sam_poi, act_sam_poi] = com_dat_poi_alt(alt_mod, tac_sam_com, act_sam_com)
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

bet = alt_mod.Coefficients.Estimate;
abl = 0;
[tac_sam_poi{1}, act_sam_poi{1}] = com_dat_poi(abl, tac_sam_com{1}, act_sam_com{1}, bet);
abl = 1;
[tac_sam_poi{2}, act_sam_poi{2}] = com_dat_poi(abl, tac_sam_com{2}, act_sam_com{2}, bet);
end

function [tac_poi, act_poi] = com_dat_poi(abl, tac_uni, act_uni, bet)
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
log_nan = isnan(tac_uni) | isnan(act_uni);
tac_uni(log_nan) = [];
%
n_poi = 1000000;
inc = (max(tac_uni) - min(tac_uni))/n_poi;
abl_poi = abl*ones(n_poi, 1);
tac_poi = (min(tac_uni):inc:max(tac_uni) - inc)';
%
act_poi = bet(1) + bet(2)*abl_poi + bet(3)*tac_poi + bet(4)*(abl_poi.*tac_poi);
end
