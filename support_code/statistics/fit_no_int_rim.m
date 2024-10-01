function [fixed_eff_est, loglik] = fit_no_int_rim(uni, cla, obs, res, deg)
% PURPOSE: To fit the random intercepts model which ignores the interaction of class and independent variable on the dependent variable, to the data
%---------------------------------------------------
% USAGE: [fixed_eff_est, loglik] = fit_no_int_rim(uni, cla, obs, res, deg)
% where: 
% uni = Vector of statistical units
% cla: A binary vector specifying the classes of the units.
% obs: A vector specifying the observations.
% res: A vector specifying the responses.
% deg: Degree of the polynomial
%---------------------------------------------------
% RETURNS: a vector of output arguments composed of:
% fixed_eff_est = Fixed effect estimates
% loglik = Loglikelihood
%---------------------------------------------------

% Written by: Kadir Mutlu

nObservations = length(uni);
firstColumn = ones(nObservations, 1);
if deg == 0
    designMatrix = [firstColumn cla];
elseif deg == 1
    designMatrix = [firstColumn cla obs];
elseif deg == 2
    designMatrix = [firstColumn cla obs obs.^2];
else
    designMatrix = [firstColumn cla obs obs.^2 obs.^3];
end
model = @(parameterVector, designMatrix) designMatrix*parameterVector';
initialParameterVectorEstimate = robustfit(designMatrix, res, 'bisquare', 4.685, 'off');
[fixed_eff_est, ~, statistics] = nlmefit(designMatrix, res, uni, [], model, initialParameterVectorEstimate,'REParamsSelect', 1);
loglik = statistics.logl;