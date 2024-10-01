function pat(x_int, hax, col)
% PURPOSE: function purpose
%---------------------------------------------------
% USAGE: varargout = pat(varargin)
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

x_1 = x_int(1);
x_2 = x_int(2);

y_int = get(hax, 'YLim');

y_1 = y_int(1);
y_2 = y_int(2);

patch([x_1 x_1 x_2 x_2], [y_1 y_2 y_2 y_1], col, 'EdgeColor', 'none');