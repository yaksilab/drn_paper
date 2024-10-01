function p_xsa = lme(var_one_uni, var_two_uni)
y = [var_one_uni; var_two_uni];
n_ani = length(y);
abl = [zeros(length(var_one_uni), 1); ones(length(var_two_uni), 1)];
X = [ones(n_ani, 1) abl];
Z = [ones(n_ani, 1) abl];
G = 1:n_ani;
lme = fitlmematrix(X, y, Z, G, 'FitMethod', 'REML');
p_xsa = lme.Coefficients.pValue(2);
end
