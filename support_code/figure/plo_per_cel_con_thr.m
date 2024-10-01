function plo_per_cel_con_thr(per_cel_thr_uni_con, tit, col_con, varargin)
n_man_arg = 3;
fon_siz = 24;
siz = 12;
%
n_row = 1;
n_thr = 3;
n_plo = n_row*n_thr;
hax = [];
hax_bar = [];
fig
for i = 1:n_plo
    h = subplot(n_row, n_thr, i);
    
    %
    [~, n_col] = size(per_cel_thr_uni_con{i});
    if n_col == 1
        per_cel_thr_uni_con{i} = per_cel_thr_uni_con{i}';
    end
    %
    
    hax_bar_i = plo_bar_dat(per_cel_thr_uni_con{i}, col_con, siz);
    hax = [hax h];
    hax_bar = [hax_bar hax_bar_i];
    set(gca, 'XTick', [], 'XTickLabel', [])
    pre_for_exp_y_lab('number of cells (%)', fon_siz)
end
linkaxes(hax, 'xy')



for i = 1:n_plo
    axes(hax(i))
    if nargin > n_man_arg
        n_cro = varargin{1};
        ind_cro_con = varargin{2};
        p_val_thr_cro = varargin{3};
        for j = 1:n_cro
            cro{j} = ind_cro_con(j, :);
        end
        sigstar(cro, fon_siz, p_val_thr_cro{i})
    end
    
    legend(hax(i), hax_bar(:, i), 'LIGHT', 'SHOCK', 'TAP')
    legend('boxoff')
end



[~, h] = suplabel(tit, 't', [.08 .08 .87 .9]);
set(h, 'FontSize', fon_siz + 3)



end