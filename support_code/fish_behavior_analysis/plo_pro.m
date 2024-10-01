function plo_pro(per_pro_con, per_pro_ani_shu, tit_rec)
per = 100;
cha_lev = prctile(per_pro_ani_shu, 95);
x_lab = 'Stimulus intensity';
y_lab = '%tailbeat probability';
fon_siz = 20;
nor_x = 0.05;
nor_y = cha_lev/per + 0.05;
col = 'r';
%
hax = subplot(1, 7, 1:6); bar(per_pro_con)
ylim([0 per])
plo_hor_lin(cha_lev, hax, col);
text(gca, nor_x, nor_y, 'p = 0.05', 'Color', col, 'Units', 'normalized');
xticklabels({'Low', 'Moderate', 'High'})
pre_for_exp_lab(x_lab, y_lab, fon_siz)
pre_for_exp_x_lab(x_lab, fon_siz)
%
h = subplot(1, 7, 7); histogram(per_pro_ani_shu, 'Orientation', 'horizontal')
if length(per_pro_ani_shu) == 1
    xticks([0 1])
end
ylim([0 per])
yticks([])
set(h, 'ycolor', 'w')
x_lab = 'Frequency';
enl_num(fon_siz)
pre_for_exp_x_lab(x_lab, fon_siz)
axes(hax)
tit = title(tit_rec);
tit.Position(2) = tit.Position(2) + 3;
end