function pva = sel_rim(uni, cla, res)
% PURPOSE: To develop a random intercepts model for the statistical
% relationships between the class, the independent variable, and the dependent variable. 
%---------------------------------------------------
% USAGE: [deg, fixed_eff_est, loglik] = sel_rim(uni, cla, obs, res)
% where:
% uni = Vector of statistical units
% cla: Binary vector specifying the classes of the units.
% obs: Vector specifying the observations.
% res: Vector specifying the responses.
%---------------------------------------------------
% RETURNS: a vector of output arguments composed of:
% deg: Degree of the polynomial
% fixed_eff_est = Fixed effect estimates
% loglik = Loglikelihood
% --------------------------------------------------
% SEE ALSO: f(results)
%---------------------------------------------------
% REFERENCES: 
%---------------------------------------------------
% REMARKS:
%---------------------------------------------------

% Written by: Kadir Mutlu

fixedEffectEstimatesCandidates = cell(4, 1);
loglikelihoods = zeros(4, 1);

for i = 1:2
    [fixedEffectEstimatesCandidates{i}, loglik] = fit_rim(uni, cla, res, i - 1);
    loglikelihoods(i) = loglik;
end

nul_log = loglikelihoods(1);
alt_log = loglikelihoods(2);
deg_fre = 1;
pva = tes_lik(nul_log, alt_log, deg_fre);