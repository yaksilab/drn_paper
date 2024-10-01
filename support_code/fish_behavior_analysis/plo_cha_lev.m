function plo_cha_lev(per_pro_ani_shu)
per = 100;
fon_siz = 20;
%
h = histogram(per_pro_ani_shu, 'Orientation', 'horizontal', 'FaceColor', 'k');
%ylim([0 per])
yticks([])
enl_num(fon_siz)
box off
end