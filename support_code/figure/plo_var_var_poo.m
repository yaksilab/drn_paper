function h_plo = plo_var_var_poo(hax, tac_win_con_sam_uni, act_win_con_sam_uni, ...
    ind_win, siz, col_sam_con, ind_sam)
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

tac_sam_com = ext_var_sam_com(tac_win_con_sam_uni, ind_win);
act_sam_com = ext_var_sam_com(act_win_con_sam_uni, ind_win);
tac_uni = vertcat(tac_sam_com{:});
act_uni = vertcat(act_sam_com{:});
% null
nul_mod = fitlm(tac_uni, act_uni);
log_lik_nul = nul_mod.LogLikelihood;
% alternative
n_uni_sam = cellfun(@length, tac_sam_com);
abl_uni = [zeros(n_uni_sam(1), 1); ones(n_uni_sam(2), 1)];
alt_mod = fitlm([abl_uni tac_uni abl_uni.*tac_uni], act_uni);
log_lik_alt = alt_mod.LogLikelihood;
[tac_sam_poi, act_sam_poi] = com_dat_poi_alt(alt_mod, tac_sam_com, act_sam_com);
r_squ = alt_mod.Rsquared.Ordinary;
%
deg_fre = 1; % order of the polynomial
p_lrt = com_p_lrt(log_lik_nul, log_lik_alt, deg_fre);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
n_sam = length(tac_win_con_sam_uni{1, 1});
h_plo = nan(n_sam, 1);
ind_con = 3;
mar = 'o';
%y_sam = [0.950; 0.900];
y_sam = [0.950; 0.750];
tex_pri = {sprintf('r^2 = %0.2f', r_squ); sprintf('p = %0.3f', p_lrt)};
for i = 1:n_sam
    ind = ind_sam(i);
    h_plo(ind) = scatter(hax, tac_sam_com{ind}, act_sam_com{ind}, siz, ...
        col_sam_con{ind, ind_con}, 'Marker', mar, 'MarkerFaceColor', col_sam_con{ind, ind_con});
    hold(hax, 'on')
    plot(hax, tac_sam_poi{ind}, act_sam_poi{ind}, 'Color', col_sam_con{ind, ind_con})
    text(hax, 0.020, y_sam(i), tex_pri{i}, 'units', 'normalized');
end
ord_chi = [1; 4; 2; 5; 3; 6];
hax.Children = hax.Children(ord_chi);
box(hax, 'off')
end

function var_sam_com = ext_var_sam_com(var_win_con_sam_uni, ind_win)
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
n_sam = length(var_win_con_sam_uni{1, 1});
global n_con
var_sam_com = cell(n_sam, 1);
for i = 1:n_sam
    n_uni = length(var_win_con_sam_uni{1, 1}{i});
    n_com = n_uni*n_con;
    var_sam_com{i} = nan(n_com, 1);
    for j = 1:n_con
        var_sam_com{i}((j - 1)*n_uni + 1:j*n_uni) = var_win_con_sam_uni{ind_win, j}{i};
    end
end
end
