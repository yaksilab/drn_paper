classdef plo_hig_com
    %PLO_HIG_COM - One line description of what the class performs (H1 line)
    %   Optional file header info (to give more details about the function than in the H1 line)
    %   Optional file header info (to give more details about the function than in the H1 line)
    %   Optional file header info (to give more details about the function than in the H1 line)
    %
    %   PLO_HIG_COM constructor syntax:
    %       PLO_HIG_COM_OBJ = PLO_HIG_COM()
    %
    %   PLO_HIG_COM properties/attributes:
    %       Property 1 - description
    %       Property 2 - description
    %
    %   PLO_HIG_COM methods/functions:
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
    %   Date: 01-Feb-2023; Last revision: 01-Feb-2023
    %
    %   Copyright (c) 2023, Aytac Kadir Mutlu
    %   All rights reserved.


    properties
    end
    
    methods(Static)
        function h_fig = lon(act_reg_sam_fra_sta_con, p_act_reg_win_con_xsa, fie_num)
        global n_reg_for_cro ind_sub_reg nam_reg y_lab_dff lin_wid gra
        n_con = 1;
        n_row = n_con;
        n_col = n_reg_for_cro;
        
%         gap_ver_row = 0.050*ones(n_row, 1);
%         gap_hor_ave = 0.010;
%         gap_hor_col = [gap_hor_ave gap_hor_ave gap_hor_ave gap_hor_ave gap_hor_ave gap_hor_ave];
%         gap_hor_row_col = repmat(gap_hor_col, n_row, 1);
%         mar_bot = 0.070;
%         mar_top = 0.100;
%         mar_lef = 0.050;
%         mar_rig = 0.030;

        gap_ver_row = 0.050*ones(n_row, 1);
        gap_hor_ave = 0.005;
        gap_hor_col = [gap_hor_ave gap_hor_ave gap_hor_ave gap_hor_ave gap_hor_ave gap_hor_ave];
        gap_hor_row_col = repmat(gap_hor_col, n_row, 1);
        mar_bot = 0.070;
        mar_top = 0.100;
        wid = 1.5*6 + 1;
        mar_lef = cal_mar_lef(wid);
        mar_rig = 0.001;
        
        asp_rat_bar = 1;
        asp_rat_axe = [asp_rat_bar asp_rat_bar asp_rat_bar asp_rat_bar asp_rat_bar asp_rat_bar];
        [h_fig, wid_mon, hei_mon] = fig;
        wid = true;
        sca_axe = ones(1, n_row*n_col);
        n_pix_ext = 50;
        [hax_sub, pos_axe, axh, ~, las_pix, rat_wid] = tight_subplot_gen(n_row, n_col, ...
            gap_ver_row, gap_hor_row_col, ...
            mar_bot, mar_top, mar_lef, mar_rig, asp_rat_axe, wid_mon, hei_mon, wid, sca_axe, n_pix_ext);
        linkaxes(hax_sub)
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        var_reg_sam_fra_sta_con = getfield(act_reg_sam_fra_sta_con, fie_num{:});
        p_var_reg_win_con_xsa = getfield(p_act_reg_win_con_xsa, fie_num{1:end-1});
        p_var_reg_win_con_xsa = p_var_reg_win_con_xsa.cel;
        y_min = inf;
        y_max = -inf;
        ind_ite = 0;
        con_fil = matfile('\\home.ansatt.ntnu.no\kadiram\Documents\MATLAB\con_esp.mat');
        tim_fra = con_fil.tim_fra;
        ind_con = 3;
        fon_siz = con_fil.fon_siz;
        n_fra = con_fil.n_fra;
        col_sam = con_fil.col_sam;
        for i = ind_sub_reg
            ind_ite = ind_ite + 1;
            for j = 1:n_con
                ind = (j - 1)*n_col + ind_ite;
                hax = hax_sub(ind);
        
                [mea_dep_var_sam.one, sem_dep_var_sam.one] = smo_mea_sem(var_reg_sam_fra_sta_con...
                    {i}{1}(:, 1, ind_con), var_reg_sam_fra_sta_con{i}{1}(:, 2, ind_con), n_fra.dff.one);
                [mea_dep_var_sam.two, sem_dep_var_sam.two] = smo_mea_sem(var_reg_sam_fra_sta_con...
                    {i}{2}(:, 1, ind_con), var_reg_sam_fra_sta_con{i}{2}(:, 2, ind_con), n_fra.dff.one);
        
                plo_sha.fun(hax, tim_fra.cal.one.tri.(fie_num{1}), ...
                            [mea_dep_var_sam.one ...
                            mea_dep_var_sam.two], ...
                            [sem_dep_var_sam.one ...
                            sem_dep_var_sam.two], ...
                            col_sam);

                [y_min, y_max, hax] = adj_y(hax, y_min, y_max);
                hax.FontSize = fon_siz.pre;
                %
                if ind_ite == 1
                    ylabel(hax, y_lab_dff)
                else
                    hax.YAxis.Visible = 'off';
                end
                if j == 1
                    title(hax, nam_reg(i), 'FontWeight', 'normal')
                    %subtitle(hax, ' ')
                end
                xlabel(hax, 'Time (s)')
            end
        end
        %
        nor_x = 5/60;
        nor_y = 0.9;
        ind_ite = 0;
        nor_x_two = (10 + 25)/60;
        win_len = 5;
        for i = ind_sub_reg
            ind_ite = ind_ite + 1;
            for j = 1:n_con
                ind = (j - 1)*n_col + ind_ite;
                hax = hax_sub(ind);
                yline(hax, 0, 'Color', gra, 'LineWidth', lin_wid, 'LineStyle', '--')
                xline(hax, 0, 'Color', gra, 'LineWidth', lin_wid, 'LineStyle', '--')
                xline(hax, win_len, 'Color', gra, 'LineWidth', lin_wid, 'LineStyle', '--')
                ind_sig.pri_sig(hax, nor_x, nor_y, p_var_reg_win_con_xsa{i}.lme{2, ind_con})
                ind_sig.pri_sig(hax, nor_x_two, nor_y, p_var_reg_win_con_xsa{i}.lme{3, ind_con})
            end
            hax = adj_hax(hax, fon_siz.pub);
        end
        h_fig = opt_h_fig(h_fig, las_pix, rat_wid);
        end

        function h_fig = sho(act_reg_sam_fra_sta_con, p_act_reg_win_con_xsa, fie_num)
        global n_reg_for_cro ind_sub_reg nam_reg y_lab_dff lin_wid gra
        n_con = 1;
        n_row = n_con;
        n_col = n_reg_for_cro;
        
%         gap_ver_row = 0.050*ones(n_row, 1);
%         gap_hor_ave = 0.010;
%         gap_hor_col = [gap_hor_ave gap_hor_ave gap_hor_ave gap_hor_ave gap_hor_ave gap_hor_ave];
%         gap_hor_row_col = repmat(gap_hor_col, n_row, 1);
%         mar_bot = 0.070;
%         mar_top = 0.100;
%         mar_lef = 0.050;
%         mar_rig = 0.030;
        
        gap_ver_row = 0.050*ones(n_row, 1);
        gap_hor_ave = 0.005;
        gap_hor_col = [gap_hor_ave gap_hor_ave gap_hor_ave gap_hor_ave gap_hor_ave gap_hor_ave];
        gap_hor_row_col = repmat(gap_hor_col, n_row, 1);
        mar_bot = 0.070;
        mar_top = 0.100;
        wid = 1.5*6 + 1;
        mar_lef = cal_mar_lef(wid);
        mar_rig = 0.001;

        asp_rat_bar = 1;
        asp_rat_axe = [asp_rat_bar asp_rat_bar asp_rat_bar asp_rat_bar asp_rat_bar asp_rat_bar];
        [h_fig, wid_mon, hei_mon] = fig;
        wid = true;
        sca_axe = ones(1, n_row*n_col);
        n_pix_ext = 50;
        [hax_sub, pos_axe, axh, ~, las_pix, rat_wid] = tight_subplot_gen(n_row, n_col, ...
            gap_ver_row, gap_hor_row_col, mar_bot, mar_top, mar_lef, mar_rig, asp_rat_axe, wid_mon, ...
            hei_mon, wid, sca_axe, n_pix_ext);
        linkaxes(hax_sub)
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        var_reg_sam_fra_sta_con = getfield(act_reg_sam_fra_sta_con, fie_num{:});
        p_var_reg_win_con_xsa = getfield(p_act_reg_win_con_xsa, fie_num{1:end-1});
        p_var_reg_win_con_xsa = p_var_reg_win_con_xsa.cel;
        y_min = inf;
        y_max = -inf;
        ind_ite = 0;
        con_fil = matfile('\\home.ansatt.ntnu.no\kadiram\Documents\MATLAB\con_esp.mat');
        tim_fra = con_fil.tim_fra;
        ind_con = 3;
        fon_siz = con_fil.fon_siz;
        log_fra = con_fil.log_fra;
        n_fra = con_fil.n_fra;
        log_fra = log_fra.cal.one.tri;
        col_sam = con_fil.col_sam;
        for i = ind_sub_reg
            ind_ite = ind_ite + 1;
            for j = 1:n_con
                ind = (j - 1)*n_col + ind_ite;
                hax = hax_sub(ind);
        
                [mea_dep_var_sam.one, sem_dep_var_sam.one] = smo_mea_sem(var_reg_sam_fra_sta_con...
                    {i}{1}(:, 1, ind_con), var_reg_sam_fra_sta_con{i}{1}(:, 2, ind_con), n_fra.dff.one);
                [mea_dep_var_sam.two, sem_dep_var_sam.two] = smo_mea_sem(var_reg_sam_fra_sta_con...
                    {i}{2}(:, 1, ind_con), var_reg_sam_fra_sta_con{i}{2}(:, 2, ind_con), n_fra.dff.one);
        
                plo_sha.fun(hax, tim_fra.cal.one.tri.(fie_num{1})(log_fra), ...
                            [mea_dep_var_sam.one(log_fra) ...
                            mea_dep_var_sam.two(log_fra)], ...
                            [sem_dep_var_sam.one(log_fra) ...
                            sem_dep_var_sam.two(log_fra)], ...
                            col_sam);

                [y_min, y_max, hax] = adj_y(hax, y_min, y_max);
                hax.FontSize = fon_siz.pre;
                %
                if ind_ite == 1
                    ylabel(hax, y_lab_dff)
                else
                    hax.YAxis.Visible = 'off';
                end
                if j == 1
                    title(hax, nam_reg(i), 'FontWeight', 'normal')
                    %subtitle(hax, ' ')
                end
                xlabel(hax, 'Time (s)')
            end
        end
        %
        nor_x = 7/15;
        nor_y = 0.9;
        ind_ite = 0;
        win_len = 5;
        for i = ind_sub_reg
            ind_ite = ind_ite + 1;
            for j = 1:n_con
                ind = (j - 1)*n_col + ind_ite;
                hax = hax_sub(ind);
                yline(hax, 0, 'Color', gra, 'LineWidth', lin_wid, 'LineStyle', '--')
                xline(hax, 0, 'Color', gra, 'LineWidth', lin_wid, 'LineStyle', '--')
                xline(hax, win_len, 'Color', gra, 'LineWidth', lin_wid, 'LineStyle', '--')
                ind_sig.pri_sig(hax, nor_x, nor_y, p_var_reg_win_con_xsa{i}.lme{2, ind_con})
            end
            hax = adj_hax(hax, fon_siz.pub);
        end
        h_fig = opt_h_fig(h_fig, las_pix, rat_wid);
        end

        function h_fig = sho_sim(dff_reg_sam_fra_cel, p_dff_reg_win_xsa)
        global n_reg_for_cro ind_sub_reg nam_reg y_lab_dff lin_wid gra
        n_con = 1;
        n_row = n_con;
        n_col = n_reg_for_cro;
        
%         gap_ver_row = 0.050*ones(n_row, 1);
%         gap_hor_ave = 0.010;
%         gap_hor_col = [gap_hor_ave gap_hor_ave gap_hor_ave gap_hor_ave gap_hor_ave gap_hor_ave];
%         gap_hor_row_col = repmat(gap_hor_col, n_row, 1);
%         mar_bot = 0.070;
%         mar_top = 0.100;
%         mar_lef = 0.050;
%         mar_rig = 0.030;

        gap_ver_row = 0.050*ones(n_row, 1);
        gap_hor_ave = 0.005;
        gap_hor_col = [gap_hor_ave gap_hor_ave gap_hor_ave gap_hor_ave gap_hor_ave gap_hor_ave];
        gap_hor_row_col = repmat(gap_hor_col, n_row, 1);
        mar_bot = 0.070;
        mar_top = 0.100;
        wid = 1.5*6 + 1;
        mar_lef = cal_mar_lef(wid);
        mar_rig = 0.001;
        
        asp_rat_bar = 1;
        asp_rat_axe = [asp_rat_bar asp_rat_bar asp_rat_bar asp_rat_bar asp_rat_bar asp_rat_bar];
        [h_fig, wid_mon, hei_mon] = fig;
        wid = true;
        sca_axe = ones(1, n_row*n_col);
        n_pix_ext = 50;
        [hax_sub, pos_axe, axh, ~, las_pix, rat_wid] = tight_subplot_gen(n_row, n_col, ...
            gap_ver_row, gap_hor_row_col, ...
            mar_bot, mar_top, mar_lef, mar_rig, asp_rat_axe, wid_mon, hei_mon, wid, sca_axe, n_pix_ext);
        linkaxes(hax_sub)
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        y_min = inf;
        y_max = -inf;
        ind_ite = 0;
        con_fil = matfile('\\home.ansatt.ntnu.no\kadiram\Documents\MATLAB\con_esp.mat');
        tim_fra = con_fil.tim_fra;
        fon_siz = con_fil.fon_siz;
        log_fra = con_fil.log_fra;
        col_sam = con_fil.col_sam;
        n_fra = con_fil.n_fra;
        log_fra = log_fra.cal.one.tri;
        for i = ind_sub_reg
            ind_ite = ind_ite + 1;
            ind = ind_ite;
            hax = hax_sub(ind);
            [h_plo, ind_var_pea] = plo_sha.smo_tri(hax, tim_fra.cal.one.tri.dff(log_fra), ...
                dff_reg_sam_fra_cel{i}{1}(log_fra, :), col_sam{1}, n_fra.dff.one.bas, ...
                n_fra.dff.one.smo);
            hold(hax, 'on')
            [h_plo, ind_var_pea] = plo_sha.smo_tri(hax, tim_fra.cal.one.tri.dff(log_fra), ...
                dff_reg_sam_fra_cel{i}{2}(log_fra, :), col_sam{2}, n_fra.dff.one.bas, ...
                n_fra.dff.one.smo);
            [y_min, y_max, hax] = adj_y(hax, y_min, y_max);
            hax.FontSize = fon_siz.pre;
            %
            if ind_ite == 1
                ylabel(hax, y_lab_dff)
            else
                hax.YAxis.Visible = 'off';
            end
            title(hax, nam_reg(i), 'FontWeight', 'normal')
            %subtitle(hax, ' ')
            xlabel(hax, 'Time (s)')
        end
        %
        nor_x = 7/15;
        nor_y = 0.9;
        ind_ite = 0;
        win_len = 5;
        for i = ind_sub_reg
            ind_ite = ind_ite + 1;
            ind = ind_ite;
            hax = hax_sub(ind);
            yline(hax, 0, 'Color', gra, 'LineWidth', lin_wid, 'LineStyle', '--')
            xline(hax, 0, 'Color', gra, 'LineWidth', lin_wid, 'LineStyle', '--')
            xline(hax, win_len, 'Color', gra, 'LineWidth', lin_wid, 'LineStyle', '--')
            ind_sig.pri_sig(hax, nor_x, nor_y, p_dff_reg_win_xsa{i}.lme{2})
%             pri_sig_duo(hax, nor_x, nor_y, p_dff_reg_win_xsa{i}.rst{2}, ...
%                 p_dff_reg_win_xsa{i}.lme{2}, log_all)
            hax = adj_hax(hax, fon_siz.pub);
        end
        h_fig = opt_h_fig(h_fig, las_pix, rat_wid);
        end

        function h_fig = sho_sim_raw(dff_reg_sam_fra_cel, p_dff_reg_win_xsa)
        global n_reg_for_cro ind_sub_reg nam_reg y_lab_dff col_sam
        n_con = 1;
        n_row = n_con;
        n_col = n_reg_for_cro;
        gap_ver_row = 0.050*ones(n_row, 1);
        gap_hor_ave = 0.010;
        gap_hor_col = [gap_hor_ave gap_hor_ave gap_hor_ave gap_hor_ave gap_hor_ave gap_hor_ave];
        gap_hor_row_col = repmat(gap_hor_col, n_row, 1);
        mar_bot = 0.070;
        mar_top = 0.100;
        mar_lef = 0.050;
        mar_rig = 0.030;
        asp_rat_bar = 1;
        asp_rat_axe = [asp_rat_bar asp_rat_bar asp_rat_bar asp_rat_bar asp_rat_bar asp_rat_bar];
        [h_fig, wid_mon, hei_mon] = fig;
        wid = true;
        sca_axe = ones(1, n_row*n_col);
        n_pix_ext = 50;
        [hax_sub, pos_axe, axh, ~, las_pix, rat_wid] = tight_subplot_gen(n_row, n_col, ...
            gap_ver_row, gap_hor_row_col, ...
            mar_bot, mar_top, mar_lef, mar_rig, asp_rat_axe, wid_mon, hei_mon, wid, sca_axe, n_pix_ext);
        linkaxes(hax_sub)
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        y_min = inf;
        y_max = -inf;
        ind_ite = 0;
        con_fil = matfile('\\home.ansatt.ntnu.no\kadiram\Documents\MATLAB\con_esp.mat');
        tim_fra = con_fil.tim_fra;
        fon_siz = con_fil.fon_siz;
        log_fra = con_fil.log_fra;
        log_fra = log_fra.cal.one.tri;
        for i = ind_sub_reg
            ind_ite = ind_ite + 1;
            ind = ind_ite;
            hax = hax_sub(ind);
            [h_plo, ind_var_pea] = plo_sha.raw(hax, tim_fra.cal.one.tri.dff(log_fra), ...
                dff_reg_sam_fra_cel{i}{1}(log_fra, :), col_sam{1});
            hold(hax, 'on')
            [h_plo, ind_var_pea] = plo_sha.raw(hax, tim_fra.cal.one.tri.dff(log_fra), ...
                dff_reg_sam_fra_cel{i}{2}(log_fra, :), col_sam{2});
            [y_min, y_max, hax] = adj_y(hax, y_min, y_max);
            hax.FontSize = fon_siz.pre;
            %
            if ind_ite == 1
                ylabel(hax, y_lab_dff)
            else
                hax.YAxis.Visible = 'off';
            end
            title(hax, nam_reg(i), 'FontWeight', 'normal')
            subtitle(hax, ' ')
            xlabel(hax, 'Time (s)')
        end
        %
        nor_x = 7/15;
        nor_y = 0.9;
        ind_ite = 0;
        log_all = true;
        for i = ind_sub_reg
            ind_ite = ind_ite + 1;
            ind = ind_ite;
            hax = hax_sub(ind);
            plo_lin_sub_tri(hax, 5)
            %ind_sig.pri_sig(hax, nor_x, nor_y, p_dff_reg_win_xsa{i}.lme{2})
            pri_sig_duo(hax, nor_x, nor_y, p_dff_reg_win_xsa{i}.rst{2}, p_dff_reg_win_xsa{i}.lme{2}, ...
                log_all)
        end
        h_fig = opt_h_fig(h_fig, las_pix, rat_wid);
        end

        function h_fig = lon_sim(dff_reg_sam_fra_cel, p_dff_reg_win_xsa)
        global n_reg_for_cro ind_sub_reg nam_reg y_lab_dff lin_wid gra
        n_con = 1;
        n_row = n_con;
        n_col = n_reg_for_cro;

%         gap_ver_row = 0.050*ones(n_row, 1);
%         gap_hor_ave = 0.010;
%         gap_hor_col = [gap_hor_ave gap_hor_ave gap_hor_ave gap_hor_ave gap_hor_ave gap_hor_ave];
%         gap_hor_row_col = repmat(gap_hor_col, n_row, 1);
%         mar_bot = 0.070;
%         mar_top = 0.100;
%         mar_lef = 0.050;
%         mar_rig = 0.030;

        gap_ver_row = 0.050*ones(n_row, 1);
        gap_hor_ave = 0.005;
        gap_hor_col = [gap_hor_ave gap_hor_ave gap_hor_ave gap_hor_ave gap_hor_ave gap_hor_ave];
        gap_hor_row_col = repmat(gap_hor_col, n_row, 1);
        mar_bot = 0.070;
        mar_top = 0.100;
        wid = 1.5*6 + 1;
        mar_lef = cal_mar_lef(wid);
        mar_rig = 0.001;

        asp_rat_bar = 1;
        asp_rat_axe = [asp_rat_bar asp_rat_bar asp_rat_bar asp_rat_bar asp_rat_bar asp_rat_bar];
        [h_fig, wid_mon, hei_mon] = fig;
        wid = true;
        sca_axe = ones(1, n_row*n_col);
        n_pix_ext = 50;
        [hax_sub, pos_axe, axh, ~, las_pix, rat_wid] = tight_subplot_gen(n_row, n_col, ...
            gap_ver_row, gap_hor_row_col, ...
            mar_bot, mar_top, mar_lef, mar_rig, asp_rat_axe, wid_mon, hei_mon, wid, sca_axe, n_pix_ext);
        linkaxes(hax_sub)
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        y_min = inf;
        y_max = -inf;
        ind_ite = 0;
        con_fil = matfile('\\home.ansatt.ntnu.no\kadiram\Documents\MATLAB\con_esp.mat');
        tim_fra = con_fil.tim_fra;
        fon_siz = con_fil.fon_siz;
        n_fra = con_fil.n_fra;
        col_sam = con_fil.col_sam;
        for i = ind_sub_reg
            ind_ite = ind_ite + 1;
            ind = ind_ite;
            hax = hax_sub(ind);
            [h_plo, ind_var_pea] = plo_sha.smo_tri(hax, tim_fra.cal.one.tri.dff, ...
                dff_reg_sam_fra_cel{i}{1}, col_sam{1}, n_fra.dff.one.bas, ...
                n_fra.dff.one.smo);
            hold(hax, 'on')
            [h_plo, ind_var_pea] = plo_sha.smo_tri(hax, tim_fra.cal.one.tri.dff, ...
                dff_reg_sam_fra_cel{i}{2}, col_sam{2}, n_fra.dff.one.bas, ...
                n_fra.dff.one.smo);
            [y_min, y_max, hax] = adj_y(hax, y_min, y_max);
            hax.FontSize = fon_siz.pre;
            %
            if ind_ite == 1
                ylabel(hax, y_lab_dff)
            else
                hax.YAxis.Visible = 'off';
            end
            title(hax, nam_reg(i), 'FontWeight', 'normal')
            %subtitle(hax, ' ')
            xlabel(hax, 'Time (s)')
        end
        %
        nor_x = 5/60;
        nor_y = 0.9;
        ind_ite = 0;
        win_ear = 2;
        nor_x_two = (10 + 25)/60;
        win_lat = 3;
        win_len = 5;
        for i = ind_sub_reg
            ind_ite = ind_ite + 1;
            ind = ind_ite;
            hax = hax_sub(ind);
            yline(hax, 0, 'Color', gra, 'LineWidth', lin_wid, 'LineStyle', '--')
            xline(hax, 0, 'Color', gra, 'LineWidth', lin_wid, 'LineStyle', '--')
            xline(hax, win_len, 'Color', gra, 'LineWidth', lin_wid, 'LineStyle', '--')
            
            ind_sig.pri_sig(hax, nor_x, nor_y, p_dff_reg_win_xsa{i}.lme{win_ear})
            ind_sig.pri_sig(hax, nor_x_two, nor_y, p_dff_reg_win_xsa{i}.lme{win_lat})

%             pri_sig_duo(hax, nor_x, nor_y, p_dff_reg_win_xsa{i}.rst{2}, ...
%                 p_dff_reg_win_xsa{i}.lme{2}, log_all)
            hax = adj_hax(hax, fon_siz.pub);
        end
        h_fig = opt_h_fig(h_fig, las_pix, rat_wid);
        end
    end

end
