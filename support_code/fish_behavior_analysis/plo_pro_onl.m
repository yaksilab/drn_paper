function plo_pro_onl(pro_win_con_sam_ani, per_pro_shu_sam_ani, hax, p_sam_cro, off_non, sep, mou, ...
    log_tex, ind_sin_sam, cha, ext_hei)
per = 100;
fon_siz = 20;
cha_lev = prctile(per_pro_shu_sam_ani{ind_sin_sam}, 95);
col = 'red';
siz = 10;
%
ind_win = 1;
global col_sam_con lin_wid gro_thr_cro
plo_dat_err_xco(hax, pro_win_con_sam_ani, ind_win, ind_sin_sam, siz, col_sam_con)
xlim([1 - 0.3 3 + 0.3])%%%%%%%%%%%%%%%%%%%%%%
ylim([0 per])
%%%%%%%%%%%%%%%
if cha
    plo_hor_lin(cha_lev, hax, col, lin_wid, '-');
    if log_tex
        tx = text(3.425, cha_lev + 6, 'p = 0.05', 'FontSize', fon_siz, 'Color', col);
    end
end
%%%%%%%%%%%%%
fon_siz_non = fon_siz;
y_lim_pre = ylim;
sigstar_lim(hax, gro_thr_cro, fon_siz_non, off_non, y_lim_pre, sep, mou, ext_hei, p_sam_cro{ind_sin_sam})
end
