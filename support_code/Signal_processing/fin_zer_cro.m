function zer_cro = fin_zer_cro(sig)
% PURPOSE: find zero crossings
%---------------------------------------------------
% USAGE: zer_cro = fin_zer_cro(sig)
% where: varargin = vector of input variables
%---------------------------------------------------
% RETURNS: a vector of output arguments composed of:
% zer_cro = zero crossings, indices. % taking the previous sample
% --------------------------------------------------
% SEE ALSO: f(results)
%---------------------------------------------------
% REFERENCES: 
%---------------------------------------------------
% REMARKS: there's a difference between the multiplication being 0 and the
% entry itself being zero. the latter is implemented.
%---------------------------------------------------

% Written by: Kadir Mutlu

% first look for exact zeros
ind_0 = find(sig == 0);

% then look for zero crossings between data points
% taking the previous sample
S1 = sig(1:end - 1).*sig(2:end);
ind_1 = find(S1 < 0);

% bring exact zeros and "in-between" zeros together 
zer = sort([ind_0; ind_1]);

% get rid of in-between zeros
dif_zer = diff(zer);
cod_0 = dif_zer - 1;

if sig(end) == 0
    cod_1 = [cod_0; 0];
else
    cod_1 = [cod_0; 1];
end

cod_2 = [0; cod_0];
cod = cod_1 + cod_2;
log_cod = logical(cod);

zer_cro = zer(log_cod);