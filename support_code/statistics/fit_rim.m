function [fixed_eff_est, loglik, bic] = fit_rim(uni, cla, res, deg)
% PURPOSE: To fit the random intercepts model to the data
%---------------------------------------------------
% USAGE: [fixed_eff_est, loglik, bic, cov_mat] = fit_rim(uni, cla, obs, res, deg)
% where:
% uni = Vector of statistical units
% cla: Binary vector specifying the classes of the units.
% obs: Vector specifying the observations.
% res: Vector specifying the responses.
% deg: Degree of the polynomial
%---------------------------------------------------
% RETURNS: a vector of output arguments composed of:
% fixed_eff_est = Fixed effect estimates
% loglik = Loglikelihood
% bic = Bayesian information criterion
%---------------------------------------------------

% Written by: Kadir Mutlu

nObservations = length(uni);
firstColumn = ones(nObservations, 1);
if deg == 0
    designMatrix = firstColumn;
elseif deg == 1
    designMatrix = [firstColumn cla];
end
model = @(parameterVector, designMatrix) designMatrix*parameterVector';
initialParameterVectorEstimate = robustfit(designMatrix, res, 'bisquare', 4.685, 'off');
[fixed_eff_est, ~, statistics] = nlmefit(designMatrix, res, uni, [], model, initialParameterVectorEstimate,'REParamsSelect', 1);
loglik = statistics.logl;
bic = statistics.bic;