function [per_uni_bin, ske] = cal_per_uni_bin(var_uni, var_edg)
cou_bin = histcounts(var_uni, var_edg);
%n_pai = length(cor_coe_pai);
per_uni_bin = 100*(cou_bin./sum(cou_bin));
%kur = kurtosis(cor_coe_pai);
ske = skewness(var_uni);
end