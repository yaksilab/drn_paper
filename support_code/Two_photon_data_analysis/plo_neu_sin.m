function [hax_sub, pos_axe, las_pix, rat_wid] = plo_neu_sin(cal_ima_ref_ani_row_col_con, ...
    dff_bou_ani_row_col, dff_ani_con_row_col, ani_num, col_sca, col_map, hax_sub, las, fig_wid, ...
    factor_meter_ani)
n_row = length(cal_ima_ref_ani_row_col_con);% n ani
n_col = 4;%1+3
mar_bot = 0.005;
mar_top = 0.060;
if isempty(hax_sub)
    mar_lef = 0.000;
else
    mar_lef = hax_sub(4).Position(1) + hax_sub(4).Position(3) + 0.100;
end
mar_rig = 0.000;
gap_ver = 0.040;
gap_hor = 0.000;
n_row_cro = round(1536*(20/100));
asp_rat = 850/(1536 - 2*n_row_cro);
n_pix_ext = 130;
[hax_sub, pos_axe, las_pix, rat_wid] = tight_subplot_ima(n_row, n_col, [gap_ver gap_hor], ...
    [mar_bot mar_top], [mar_lef mar_rig], asp_rat, fig_wid, n_pix_ext);
%off = 0.060;
off = 0.000;
red = 0.01;
global con_int
per = 50;
dis_ran = ext_dis_ran(per);% !!!
fon_siz = 30;
len_sca_bar = 50; % factor micrometer
n_pix_lef = 20;
bot = 20;
hei = 20;
h_tit_row = cell(n_row, 1);
for i = 1:n_row
    n_col_sca = round(len_sca_bar/factor_meter_ani(i));
    for j = 1:n_col
        ind_sub_i_j = (i - 1)*n_col + j;
        hax = hax_sub(ind_sub_i_j);
        if j == 1
            piv_row_col.ori = cal_ima_ref_ani_row_col_con{i}(:, :, 1);
            [~, n_col_ima] = size(piv_row_col.ori);
            piv_row_col.cro = flip(piv_row_col.ori(n_row_cro:end - n_row_cro, :));
            % scale bar
            piv_row_col.cro(end - bot - hei:end - bot, n_pix_lef:n_pix_lef + n_col_sca) = dis_ran(end);
            %
            ima(hax, 1:n_col_ima, piv_row_col.cro)
            xticks(hax, [])
            yticks(hax, [])
            caxis(hax, dis_ran)
            colormap(hax, bone)
            if i == 1
                h = title('Reference', 'FontWeight', 'normal');
                pos_i_j = hax.Position;
                h.Units = 'normalized';
                h.Position(2) = pos_i_j(2) + pos_i_j(4) + off;
            end
            lef = hax.Position(1);
        else
            con_j = j - 1;
            dff_row_col = dff_ani_con_row_col{i, con_j}(n_row_cro:end - n_row_cro, :);
            piv_row_col_pcx = ext_piv_row_col_pcx(flip(dff_row_col), col_sca, jet);
            sho_ima.rgb(hax, piv_row_col_pcx)
            if las && j == n_col && i == n_row
                colormap(hax, jet);
                col = colorbar(hax);
                tic_lab_num = -5:5:20;
                col.Ticks = interp1(col_sca, [0 1], tic_lab_num);
                col.TickLabels = tic_lab_num;
                pos_i_j = hax.Position;
                col.Position = [pos_i_j(1) + pos_i_j(3) + 0.005 pos_i_j(2) + red ...
                    0.01 pos_i_j(4) - 2*red];
                col.Label.String = '\DeltaF/F (%)';
            end
            if i == 1
                h = title(hax, con_int{con_j}, 'FontWeight', 'normal');
                h.Units = 'normalized';
                pos_i_j = hax.Position;
                h.Position(2) = pos_i_j(2) + pos_i_j(4) + off;
            end
        end
        hax.FontSize = fon_siz;
        hax.Visible = 'off';
    end
    pos_i_j = hax.Position;
    if i == 1
        off_tit = 0.035;
    else
        off_tit = 0.015;
    end
    tit = char(ani_num(i));
    [~, h_tit] = suplabel(tit, 't', [lef pos_i_j(2) (pos_i_j(1) + pos_i_j(3) - lef) pos_i_j(4) + ...
        off_tit]);
    set(h_tit)
    h_tit.FontSize = fon_siz;
    h_tit_row{i} = h_tit;
    hax.Visible = 'off';
end
for i = 1:n_row
    h_tit_row{i}.FontSize = fon_siz;
end
end
