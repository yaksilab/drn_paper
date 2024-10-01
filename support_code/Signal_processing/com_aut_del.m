function aut_del = com_aut_del(n_sam, n_sig, sig)
% PURPOSE: compute autocorrelation delayed
%---------------------------------------------------
% USAGE: aut_del = com_aut_del(n_sam, n_sig, sig)
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

n_aut = 2*n_sam - 1;
aut = zeros(n_aut, n_sig);
for i = 1:n_sig
    aut(:, i) = xcorr(sig(:, i));
end
aut_del = aut(n_sam:n_aut, :);