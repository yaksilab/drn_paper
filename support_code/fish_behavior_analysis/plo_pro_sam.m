function plo_pro_sam(per_pro_ani_con, per_pro_ani_shu, p_cro, tit)
n_row = 1;
n_col = 7;
gap_ver = 0.1;
gap_hor = 0.005;
mar_bot = 0.04;
mar_top = 0.043;
mar_lef = 0.047;
mar_rig = 0.005;
hax_sub = tight_subplot(n_row, n_col, [gap_ver gap_hor], [mar_bot mar_top], [mar_lef mar_rig]);
%
pos_end = hax_sub(6).Position;
delete(hax_sub(2:6))
hax_pro = hax_sub(1);
hax_pro.Position(3) = pos_end(1) + pos_end(3) - hax_pro.Position(1);
axes(hax_sub(1))
off_non = 0.04;
global con_int
plo_pro_onl(per_pro_ani_con, per_pro_ani_shu, hax_pro, p_cro, off_non, con_int)
y_lab = '%tailbeat probability';
ylabel(y_lab)
%%%%%%%%%%%%%%%%%%%%%%
axes(hax_sub(7))
plo_cha_lev(per_pro_ani_shu)
set(hax_sub(7), 'ycolor', 'w')
xlabel('Frequency')
axes(hax_pro)
title(tit, 'FontWeight', 'normal')
end