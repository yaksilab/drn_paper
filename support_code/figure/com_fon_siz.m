function fon_siz = com_fon_siz(wid)
% PURPOSE: function purpose
%---------------------------------------------------
% USAGE: fon_siz = com_fon_siz(wid)
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
% fon_siz_tex = 12;
% fon_siz_tex = 8;
% wid = 12;
% ori_wid = 55.46;
%---------------------------------------------------

% Written by: Kadir Mutlu
global inc
pix_den = 72; % ppi
pix_den = pix_den/inc;
n_pix = pix_den*wid; 

ori_wid = 1920;
sca = n_pix/ori_wid;
fon_siz_tex = 9;
fon_siz = fix(fon_siz_tex/sca);