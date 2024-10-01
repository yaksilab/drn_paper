function [fixed_eff_est, loglik] = fit_no_cla_rim(uni, obs, res, deg)
% PURPOSE: To fit the random intercepts model to the data 
%---------------------------------------------------
% USAGE: [fixed_eff_est, loglik] = fit_no_cla_rim(uni, obs, res, deg)
% where:
% uni: A vector specifying the statistical units.
% obs: A vector specifying the observations.
% res: A vector specifying the responses.
% deg: Degree of the polynomial
%---------------------------------------------------
% RETURNS: a vector of output arguments composed of:
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

nObservations = length(uni);
firstColumn = ones(nObservations, 1);
if deg == 0
    designMatrix = firstColumn;
elseif deg == 1
    designMatrix = [firstColumn obs];
elseif deg == 2
    designMatrix = [firstColumn obs obs.^2];
else
    designMatrix = [firstColumn obs obs.^2 obs.^3];
end
model = @(parameterVector, designMatrix) designMatrix*parameterVector';
initialFixedVectorEstimate = robustfit(designMatrix, res, 'bisquare', 4.685, 'off');
[fixed_eff_est, ~, statistics] = nlmefit(designMatrix, res, uni, [], model, initialFixedVectorEstimate,'REParamsSelect', 1);
loglik = statistics.logl;