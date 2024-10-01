function p_xsa = com_p_xsa(var_sam_uni)
n_sam = length(var_sam_uni);
n_cro = nchoosek(n_sam, 2);
ind_cro_sam = nchoosek(1:n_sam, 2);
p_xsa.rst = nan(n_cro, 1);
for i = 1:n_cro
    sam_one = ind_cro_sam(i, 1);
    sam_two = ind_cro_sam(i, 2);
    p_xsa.rst(i) = ranksum(var_sam_uni{sam_one}, var_sam_uni{sam_two});
    %
    y = [var_sam_uni{sam_one}; var_sam_uni{sam_two}];
    n_ani = length(y);
    dum_var_nor_gro_ani = [zeros(length(var_sam_uni{sam_one}), 1); ones(length(var_sam_uni{sam_two})...
        , 1)];% sample
    X = [ones(n_ani, 1) dum_var_nor_gro_ani];
    Z = [ones(n_ani, 1) dum_var_nor_gro_ani];
    G = 1:n_ani;
    lme = fitlmematrix(X, y, Z, G, 'FitMethod', 'REML');
    p_xsa.lme(i) = lme.Coefficients.pValue(2);
end
end
% based on a linear statistical model

% first term is the offset, second term is the effect of treatment/sample
% X-fixed effects (effect of sample), Z-random effects (effect of individual, 'group')

% each animal is a 'group' giving rise to random effects

% can plot the model for each sample using the fixed effects by setting the
% dummy variable (can calculate y based on any x). Random effect is different for each 'group'.

% no lrt
