function plo_per_cel_con(per_cel_uni_con, tit, col_con, varargin)
% plo_per_cel_con(per_cel_ani_con, tit, col_con, n_cro, ind_cro_con, p_val_cro)
n_man_arg = 3;
fon_siz = 24;
fig
hax = plo_bar_dat(per_cel_uni_con, col_con);
set(gca, 'XTick', [], 'XTickLabel', [])
pre_for_exp_y_lab('number of cells (%)', fon_siz)
[~, h] = suplabel(tit, 't', [.08 .08 .87 .9]);
set(h, 'FontSize', fon_siz + 3)

if nargin > n_man_arg
    n_cro = varargin{1};
    ind_cro_con = varargin{2};
    p_val_cro = varargin{3};
    for i = 1:n_cro
        cro{i} = ind_cro_con(i, :);
    end
    sigstar(cro, fon_siz, p_val_cro)
end

legend(hax, 'LIGHT', 'SHOCK', 'TAP')
legend('boxoff')
end