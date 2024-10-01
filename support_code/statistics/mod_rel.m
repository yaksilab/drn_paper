function [deg, sta_mod] = mod_rel(uni, cla, obs, res_mat, sta_var_num, end_var_num)
% PURPOSE: To model the relationships
%---------------------------------------------------
% USAGE: model = mod_rel(uni, cla, obs, res_mat, sta_var, end_var)
% where: 
% uni = Vector of statistical units
% cla: Binary vector specifying the classes of the units.
% obs: Vector specifying the observations.
% res_mat: Matrix which specifies the responses in its columns.
% sta_var_num: Starting varibale number.
% end_var_num: Ending variable number.
%---------------------------------------------------
% RETURNS: a vector of output arguments composed of:
% deg: Vector containing the degrees of the polynomials. -1 if the response was 0 for all the
% observations.
% sig: Vector containing the -log10(p) where p is the p value for the effect of the interaction 
% of the class and independent variable on the dependent variable
% model = A cell array whose entries contain the following subentry:
% 1: Degree of the polynomial. -1 if the response was 0 for all the
% observations.
% If the subentry 1 was not -1, the following subentries are added: 
% 2: Fixed effect estimates.
% 3: The log-likelihood.

% If the degree is 0, the following subentry is added:
% 4: P value for the intercept

% If the degree is grater than 0, the following subentries are added:
% 4: P value for the effect of the interaction of the class and independent variable on the
% dependent variable
% 5: Fixed effect estimates for the model excluding the interaction
% 6: Log-likelihood of the excluding model
% 7: P value for the intercept
% --------------------------------------------------
% SEE ALSO: f(results)
%---------------------------------------------------
% REFERENCES: 
%---------------------------------------------------
% REMARKS:
%---------------------------------------------------

% Written by: Kadir Mutlu

n_var = end_var_num - sta_var_num + 1;
sta_mod = cell(1, n_var);
deg = zeros(1, n_var);

for i = sta_var_num:end_var_num
    if res_mat(:, i) == 0
        sta_mod{i}{1} = -1;
    else
        responses = res_mat(:, i);
        [degree, fixedEffectEstimates, loglikelihood] = sel_rim(uni, cla, obs, responses);
        deg(i) = degree;
        sta_mod{i}{1} = degree;
        sta_mod{i}{2} = fixedEffectEstimates;
        sta_mod{i}{3} = loglikelihood;
    end
end