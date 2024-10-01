classdef plo_evo_xsa
    %PLO_EVO_XSA - One line description of what the class performs (H1 line)
    %   Optional file header info (to give more details about the function than in the H1 line)
    %   Optional file header info (to give more details about the function than in the H1 line)
    %   Optional file header info (to give more details about the function than in the H1 line)
    %
    %   PLO_EVO_XSA constructor syntax:
    %       PLO_EVO_XSA_OBJ = PLO_EVO_XSA()
    %
    %   PLO_EVO_XSA properties/attributes:
    %       Property 1 - description
    %       Property 2 - description
    %
    %   PLO_EVO_XSA methods/functions:
    %       Method 1 - description
    %       Method 2 - description
    %
    %   Examples: 
    %       Line 1 of example
    %       Line 2 of example
    %       Line 3 of example
    %
    %   Other m-files required: none
    %   MAT-files required: none
    %
    %   See also: OTHER_CLASS_NAME1,  OTHER_CLASS_NAME2

    %   Author: Aytac Kadir Mutlu
    %   Address: Olav Kyrres gate 9, 7030 Trondheim, Norway
    %   email: kadir.a.mutlu@ntnu.no
    %   Website: https://www.ntnu.edu/kavli
    %   Date: 09-Nov-2023; Last revision: 09-Nov-2023
    %
    %   Copyright (c) 2023, Aytac Kadir Mutlu
    %   All rights reserved.


    properties
    end
    
    methods(Static)
        function h_fig = all(var_reg_win_con_sam_cel, y_lab_ave, p_var_reg_win_con_xsa, ...
                n_ani_bri_sam, n_cel_reg_sam, ind_sam, tit_sam, dat)
            global n_con n_reg_for_cro ind_sub_reg nam_reg siz col_sam_con con_int
            n_row = n_con;
            n_col = n_reg_for_cro;
            gap_ver_row = 0.050*ones(n_row, 1);
            gap_hor_ave = 0.030;
            gap_hor_col = [gap_hor_ave gap_hor_ave gap_hor_ave gap_hor_ave gap_hor_ave gap_hor_ave];
            gap_hor_row_col = repmat(gap_hor_col, n_row, 1);
            mar_bot = 0.035;
            mar_top = 0.070;
            mar_lef = 0.050;
            mar_rig = 0.003;
            asp_rat_bar = 0.5;
            asp_rat_axe = [asp_rat_bar asp_rat_bar asp_rat_bar asp_rat_bar asp_rat_bar asp_rat_bar ...
            asp_rat_bar asp_rat_bar asp_rat_bar asp_rat_bar asp_rat_bar asp_rat_bar ...
            asp_rat_bar asp_rat_bar asp_rat_bar asp_rat_bar asp_rat_bar asp_rat_bar];
            [h_fig, wid_mon, hei_mon] = fig;
            wid = false;
            sca_axe = ones(1, n_row*n_col);
            n_pix_ext = 0;
            [hax_sub, pos_axe, axh, dis_asp_rat, las_pix, rat_wid] = tight_subplot_gen(n_row, n_col, ...
                gap_ver_row, gap_hor_row_col, mar_bot, mar_top, mar_lef, mar_rig, asp_rat_axe, ...
                wid_mon, hei_mon, wid, sca_axe, n_pix_ext);
            linkaxes(hax_sub)
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            y_min = inf;
            y_max = -inf;
            nam_sam = tit_sam(ind_sam);
            ind_win = 2;
            ind_ite = 0;
            con_fil = matfile('\\home.ansatt.ntnu.no\kadiram\Documents\MATLAB\con_esp.mat');
            fon_siz = con_fil.fon_siz;
            for i = ind_sub_reg
                ind_ite = ind_ite + 1;
                for j = 1:n_con
                    ind = (j - 1)*n_col + ind_ite;
                    hax = hax_sub(ind);
                    plo_dat_err_xsa_vio(hax, var_reg_win_con_sam_cel{i}, ind_win, j, siz, ...
                        col_sam_con, ind_sam, dat)
                    [y_min, y_max, hax] = adj_y(hax, y_min, y_max);
                    hax.FontSize = fon_siz.pre;
                    %
                    if ind_ite == 1
                        ylabel(hax, y_lab_ave)
                    else
                        hax.YAxis.Visible = 'off';
                    end
                    if j == 1
                        title(hax, nam_reg(i), 'FontWeight', 'normal')
                        subtitle(hax, ' ')
                        hax.XAxis.Visible = 'off';
                    elseif j == n_con
                        xticklabels(hax, nam_sam)
                    else
                        hax.XAxis.Visible = 'off';
                    end
                end
            end
            %
            [cro, n_sam] = ext_cro(ind_sam);
            off_non = 0.070;
            mou = 0.030;
            sep = off_non + mou + 0.040;
            ext_hei = -(sep + mou);
            ind_ite = 0;
            for i = ind_sub_reg
                ind_ite = ind_ite + 1;
                for j = 1:n_con
                    ind = (j - 1)*n_col + ind_ite;
                    hax = hax_sub(ind);
                    y_lim_pre = ylim(hax);
                    [~, y_lim] = sigstar_lim(hax, cro, fon_siz.pre, off_non, y_lim_pre, sep, mou, ...
                        ext_hei, p_var_reg_win_con_xsa{i}.lme{ind_win, j});
                    [y_min, y_max, hax] = adj_y(hax, y_min, y_max);
                end
            end
            %
            num = 4;
            lef_bia = 0.000;
            [tex_sam, hax] = ...
                wri_sam_rat(con_int, gap_ver_row, mar_top, axh, gap_hor_col, pos_axe, num, lef_bia);
            h_fig = opt_h_fig(h_fig, las_pix, rat_wid);
        end

        function h_fig = one(var_reg_win_con_sam_cel, y_lab_ave, p_var_reg_win_con_xsa, ind_sam, ...
                tit_sam, dat)
            global n_reg_for_cro ind_sub_reg nam_reg siz col_sam_con con_int
            n_con = 1;
            n_row = 1;
            n_col = n_reg_for_cro;
            gap_ver_row = 0.050*ones(n_row, 1);
            gap_hor_ave = 0.030;
            gap_hor_col = [gap_hor_ave gap_hor_ave gap_hor_ave gap_hor_ave gap_hor_ave gap_hor_ave];
            gap_hor_row_col = repmat(gap_hor_col, n_row, 1);
            mar_bot = 0.035;
            mar_top = 0.070;
            mar_lef = 0.050;
            mar_rig = 0.003;
            asp_rat_bar = 0.5;
            asp_rat_axe = [asp_rat_bar asp_rat_bar asp_rat_bar asp_rat_bar asp_rat_bar asp_rat_bar];
            [h_fig, wid_mon, hei_mon] = fig;
            wid = true;
            sca_axe = ones(1, n_row*n_col);
            n_pix_ext = 0;
            [hax_sub, pos_axe, axh, dis_asp_rat, las_pix, rat_wid] = tight_subplot_gen(n_row, n_col, ...
                gap_ver_row, gap_hor_row_col, mar_bot, mar_top, mar_lef, mar_rig, asp_rat_axe, ...
                wid_mon, hei_mon, wid, sca_axe, n_pix_ext);
            linkaxes(hax_sub)
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            y_min = inf;
            y_max = -inf;
            nam_sam = tit_sam(ind_sam);
            ind_win = 2;
            ind_ite = 0;
            con_fil = matfile('\\home.ansatt.ntnu.no\kadiram\Documents\MATLAB\con_esp.mat');
            fon_siz = con_fil.fon_siz;
            for i = ind_sub_reg
                ind_ite = ind_ite + 1;
                for j = 1:n_con
                    ind = (j - 1)*n_col + ind_ite;
                    hax = hax_sub(ind);
                    plo_dat_err_xsa_vio(hax, var_reg_win_con_sam_cel{i}, ind_win, j, siz, ...
                        col_sam_con, ind_sam, dat)
                    [y_min, y_max, hax] = adj_y(hax, y_min, y_max);
                    hax.FontSize = fon_siz.pre;
                    %
                    if ind_ite == 1
                        ylabel(hax, y_lab_ave)
                    else
                        hax.YAxis.Visible = 'off';
                    end
                    if j == 1
                        title(hax, nam_reg(i), 'FontWeight', 'normal')
                        subtitle(hax, ' ')
                        hax.XAxis.Visible = 'off';
                    elseif j == n_con
                        xticklabels(hax, nam_sam)
                    else
                        hax.XAxis.Visible = 'off';
                    end
                end
            end
            %
            [cro, n_sam] = ext_cro(ind_sam);
            off_non = 0.070;
            mou = 0.030;
            sep = off_non + mou + 0.040;
            ext_hei = -(sep + mou);
            ind_ite = 0;
            for i = ind_sub_reg
                ind_ite = ind_ite + 1;
                for j = 1:n_con
                    ind = (j - 1)*n_col + ind_ite;
                    hax = hax_sub(ind);
                    y_lim_pre = ylim(hax);
                    [~, y_lim] = sigstar_lim(hax, cro, fon_siz.pre, off_non, y_lim_pre, sep, mou, ...
                        ext_hei, p_var_reg_win_con_xsa{i}.lme{ind_win, j});
                    [y_min, y_max, hax] = adj_y(hax, y_min, y_max);
                end
            end
            %
            num = 4;
            lef_bia = 0.000;
            [tex_sam, hax] = ...
                wri_sam_rat(con_int, gap_ver_row, mar_top, axh, gap_hor_col, pos_axe, num, lef_bia);
            h_fig = opt_h_fig(h_fig, las_pix, rat_wid);
        end
    end

end
