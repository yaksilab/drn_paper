function fix_pie_fon(odo_pie, fon_siz)
% PURPOSE: function purpose
%---------------------------------------------------
% USAGE: varargout = fix_pie_fon(varargin)
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

n_sli = length(odo_pie);
for i = 2:2:n_sli
    odo_pie(i).FontSize = fon_siz;
end