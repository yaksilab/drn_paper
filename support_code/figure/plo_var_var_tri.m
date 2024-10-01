function h_plo = plo_var_var_tri(hax, tac_sam_tri_win, act_sam_tri_win, ind_win, siz, col_sam_con, ...
    ind_sam)
% PURPOSE: for plotting across the groups
%---------------------------------------------------
% USAGE: h_plo = plo_bar_dat_mul_win(dat_sam_con_uni_win, ind_con, ind_win, siz)
% where: varargin = vector of input variables
%---------------------------------------------------
% RETURNS: a vector of output arguments composed of:
% x = 1.2
% --------------------------------------------------
% SEE ALSO: f(results)
%---------------------------------------------------
% REFERENCES: 
%---------------------------------------------------
% REMARKS: 
% n_conditions
%---------------------------------------------------

% Written by: Kadir Mutlu
% Username: SUPINFO\kadir
% Display Name: kadir
% Computer Name: SYSKRUNCH
% Windows: Microsoft Windows NT 6.2.9200.0
% Date: 11-Jan-2019 11:38:40
tac_sam_tri = cellfun(@(x) x(:, ind_win), tac_sam_tri_win, 'UniformOutput', false);
act_sam_tri = cellfun(@(x) x(:, ind_win), act_sam_tri_win, 'UniformOutput', false);
tac_tri_win = vertcat(tac_sam_tri_win{:});
act_tri_win = vertcat(act_sam_tri_win{:});
tac_tri = tac_tri_win(:, ind_win);
act_tri = act_tri_win(:, ind_win);
% null
nul_mod = fitlm(tac_tri, act_tri);
log_lik_nul = nul_mod.LogLikelihood;
% alternative
n_tri_sam = cellfun(@(x) size(x, 1), tac_sam_tri_win);
abl_uni = [zeros(n_tri_sam(1), 1); ones(n_tri_sam(2), 1)];
alt_mod = fitlm([abl_uni tac_tri abl_uni.*tac_tri], act_tri);
log_lik_alt = alt_mod.LogLikelihood;
[tac_sam_poi, act_sam_poi] = com_dat_poi_alt(alt_mod, tac_sam_tri, act_sam_tri);
r_squ = alt_mod.Rsquared.Ordinary;
%
deg_fre = 1; % order of the polynomial
p_lrt = com_p_lrt(log_lik_nul, log_lik_alt, deg_fre);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
n_sam = length(tac_sam_tri);
h_plo = nan(n_sam, 1);
ind_con = 3;
mar = 'o';
y_sam = [0.950; 0.900];
tex_pri = {sprintf('r-squared = %0.2f', r_squ); sprintf('p = %0.3f', p_lrt)};
for i = 1:n_sam
    ind = ind_sam(i);
    h_plo(ind) = scatter(hax, tac_sam_tri{ind}, act_sam_tri{ind}, siz, ...
        col_sam_con{ind, ind_con}, 'Marker', mar, 'MarkerFaceColor', col_sam_con{ind, ind_con});
    hold(hax, 'on')
    plot(hax, tac_sam_poi{ind}, act_sam_poi{ind}, 'Color', col_sam_con{ind, ind_con})
    text(hax, 0.010, y_sam(i), tex_pri{i}, 'units', 'normalized');
end
box(hax, 'off')
end
