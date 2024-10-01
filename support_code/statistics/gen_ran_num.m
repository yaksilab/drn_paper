function ran_num = gen_ran_num(tar, ext)
% PURPOSE: function purpose
%---------------------------------------------------
% USAGE: varargout = gen_ran_num(varargin)
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
% Username: SUPINFO\kadir
% Display Name: kadir
% Computer Name: SYSKRUNCH
% Windows: Microsoft Windows NT 6.2.9200.0
% Date: 22-Mar-2019 08:11:42

ran_num = tar - ext + 2*rand*ext;

end