function p_lrt = com_p_lrt(log_lik_nul, log_lik_alt, deg_fre)
% PURPOSE: To perform likelihood-ratio test
%---------------------------------------------------
% USAGE: pva = tes_lik(nul_log, alt_log, deg_fre)
% where: nul_log = Null log-likelihood
% alt_log = Alternative log-likelihood
% deg_free = Degrees of freedom
%---------------------------------------------------
% RETURNS: a vector of output arguments composed of:
% pva = P-value
% --------------------------------------------------
% SEE ALSO: f(results)
%---------------------------------------------------
% REFERENCES: 
%---------------------------------------------------
% REMARKS: 
%---------------------------------------------------

% Written by: Kadir Mutlu

loglikelihoodRatioStatistic = 2*(log_lik_alt - log_lik_nul);
p_lrt = 1 - chi2cdf(loglikelihoodRatioStatistic, deg_fre);