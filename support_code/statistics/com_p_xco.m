function p_xco = com_p_xco(var_one_uni, var_two_uni)


% add paired t-test for small sample size!

p_xco.srt = signrank(var_one_uni, var_two_uni);
%
y = [var_one_uni; var_two_uni];
sam_siz = length(var_one_uni);
dum_var_nor_gro_uni = [zeros(sam_siz, 1); ones(sam_siz, 1)];% treatment
n_uni = length(y);
X = [ones(n_uni, 1) dum_var_nor_gro_uni];
Z = [ones(n_uni, 1) dum_var_nor_gro_uni];
G = [1:sam_siz 1:sam_siz];% paired
lme = fitlmematrix(X, y, Z, G, 'FitMethod', 'REML');
p_xco.lme = lme.Coefficients.pValue(2);
end
% based on a linear statistical model

% first term is the offset, second term is the effect of treatment/sample
% X-fixed effects (effect of treatment/sample), Z-random effects (effect of individual, 'group')

% each animal is a 'group' giving rise to random effects

% can plot the model for each sample using the fixed effects by setting the
% dummy variable (can calculate y based on any x). Random effect is different for each 'group'.
