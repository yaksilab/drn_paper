classdef plo_inh_exc_fie
    %PLO_INH_EXC_FIE - One line description of what the class performs (H1 line)
    %   Optional file header info (to give more details about the function than in the H1 line)
    %   Optional file header info (to give more details about the function than in the H1 line)
    %   Optional file header info (to give more details about the function than in the H1 line)
    %
    %   PLO_INH_EXC_FIE constructor syntax:
    %       PLO_INH_EXC_FIE_OBJ = PLO_INH_EXC_FIE()
    %
    %   PLO_INH_EXC_FIE properties/attributes:
    %       Property 1 - description
    %       Property 2 - description
    %
    %   PLO_INH_EXC_FIE methods/functions:
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
    %   Date: 19-Jan-2024; Last revision: 19-Jan-2024
    %
    %   Copyright (c) 2024, Aytac Kadir Mutlu
    %   All rights reserved.


    properties
    end
    
    methods(Static)
        function h_fig = smo(dff_uni_poi, log_uni, pha_win_len)
        col_lim = [-10 10];
        col_cod = '\DeltaF/F (%)';
        [h_fig, fig_wid, fig_hei] = fig;
        n_row = 4;
        n_col = 1;
        mar_bot = 0.070;
        mar_top = 0.010;
        mar_lef = 0.040;
        mar_rig = 0.000;
        asp_rat_axe = ones(n_row*n_col, 1);
        ver_wit = 0.030;
        gap_ver_row = [ver_wit 0.030 ver_wit ver_wit];
        gap_hor_row_col = 0.040*ones(n_row, n_col);
        wid = false;
        sca_axe = ones(n_row*n_col, 1);
        n_pix_ext = 100;
        [hax_sub, pos_axe, hei_axe, dis_asp_rat, las_pix, rat_wid] = tight_subplot_gen(n_row, ...
            n_col, gap_ver_row, gap_hor_row_col, mar_bot, mar_top, mar_lef, mar_rig, asp_rat_axe, ...
            fig_wid, fig_hei, wid, sca_axe, n_pix_ext);
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        col_han_pos = [0.175 0.380 0.005 0.150];
        con_fil = matfile('\\home.ansatt.ntnu.no\kadiram\Documents\MATLAB\con_esp.mat');
        n_fra = con_fil.n_fra;
        tim_fra = con_fil.tim_fra;
        tim_fra = tim_fra.cal.eig.tri.dff;
        col = 'k';
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% signals
        hax = hax_sub(1);
        inh_pix_fra = dff_uni_poi(log_uni.inh, :);
        inh_pix_fra(isinf(inh_pix_fra)) = 0;
        [h_plo, ind_var_pea] = plo_sha.smo_tri(hax, tim_fra, inh_pix_fra', ...
            col, n_fra.dff.eig.bas, n_fra.dff.eig.smo);
        lin_wid = con_fil.lin_wid;
        lin_wid = lin_wid.two;
        h = yline(hax, 0, 'LineWidth', lin_wid);
        h = xline(hax, 0, 'Color', 'g', 'LineWidth', lin_wid);
        h = xline(hax, pha_win_len, 'Color', 'g', 'LineWidth', lin_wid);
        
        hax = hax_sub(3);
        exc_pix_fra = dff_uni_poi(log_uni.exc, :);
        [h_plo, ind_var_pea] = plo_sha.smo_tri(hax, tim_fra, exc_pix_fra', ...
            col, n_fra.dff.eig.bas, n_fra.dff.eig.smo);
        h = yline(hax, 0, 'LineWidth', lin_wid);
        h = xline(hax, 0, 'Color', 'g', 'LineWidth', lin_wid);
        h = xline(hax, pha_win_len, 'Color', 'g', 'LineWidth', lin_wid);
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% images
        dff_uni_win = com_ave_amp_uni_win(tim_fra, dff_uni_poi', pha_win_len);
        hax = hax_sub(2);
        win = 2;
        [~, ind_pix] = sort(dff_uni_win(log_uni.inh, win), 'ascend');
        
        dff_fra_pix = smo_sam_poi_var(inh_pix_fra(ind_pix, :)', n_fra.dff.eig.bas, n_fra.dff.eig.smo);
        
        ima(hax, tim_fra, dff_fra_pix')
        caxis(hax, col_lim)
        map = con_fil.map;
        map = map.sym;
        hax.Colormap = map;
        hax.YAxis.Visible = "off";
        h = xline(hax, 0, 'Color', 'g', 'LineWidth', lin_wid);
        h = xline(hax, pha_win_len, 'Color', 'g', 'LineWidth', lin_wid);
        
        hax = hax_sub(4);
        [~, ind_pix] = sort(dff_uni_win(log_uni.exc, win), 'descend');
        
        dff_fra_pix = smo_sam_poi_var(exc_pix_fra(ind_pix, :)', n_fra.dff.eig.bas, n_fra.dff.eig.smo);
        
        ima(hax, tim_fra, dff_fra_pix')
        caxis(hax, col_lim)
        hax.Colormap = map;
        hax.YAxis.Visible = "off";
        h = xline(hax, 0, 'Color', 'g', 'LineWidth', lin_wid);
        h = xline(hax, pha_win_len, 'Color', 'g', 'LineWidth', lin_wid);
        col_han = colorbar('Ticks', col_lim);
        col_han.Position = col_han_pos;
        col_han.Label.String = col_cod;
        col_han.Label.Units = 'normalized';
        col_han.Label.Position(1) = 1.5;
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        h_fig = opt_h_fig(h_fig, las_pix, rat_wid);
        end

        function h_fig = smo_pub(dff_uni_poi, log_uni, pha_win_len)
        col_lim = [-10 10];
        col_cod = '\DeltaF/F (%)';
        [h_fig, fig_wid, fig_hei] = fig;
        n_row = 4;
        n_col = 1;
        mar_bot = 0.025;
        hei = 6;
        mar_top = cal_mar_top(hei);
        mar_lef = 0.025;
        mar_rig = 0.000;
        ver_wit = 0.005;
        gap_ver_row = [ver_wit 0.010 ver_wit ver_wit];
        %
        gap_hor_row_col = 0.040*ones(n_row, n_col);
        asp_rat_axe = ones(n_row*n_col, 1);
        wid = false;
        sca_axe = ones(n_row*n_col, 1);
        n_pix_ext = 100;
        [hax_sub, pos_axe, hei_axe, dis_asp_rat, las_pix, rat_wid] = tight_subplot_gen(n_row, ...
            n_col, gap_ver_row, gap_hor_row_col, mar_bot, mar_top, mar_lef, mar_rig, asp_rat_axe, ...
            fig_wid, fig_hei, wid, sca_axe, n_pix_ext);
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        con_fil = matfile('\\home.ansatt.ntnu.no\kadiram\Documents\MATLAB\con_esp.mat');
        n_fra = con_fil.n_fra;
        tim_fra = con_fil.tim_fra;
        tim_fra = tim_fra.cal.eig.tri.dff;
        col = 'k';
        fon_siz = 7;
        lin_wid = con_fil.lin_wid;
        lin_wid = lin_wid.two;
        dff_uni_win = com_ave_amp_uni_win(tim_fra, dff_uni_poi', pha_win_len);
        win = 2;
        map = con_fil.map;
        map = map.sym;
        y_lab = con_fil.y_lab;
        gra = con_fil.gra;
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        mar_siz = con_fil.mar_siz;
        mar_siz = mar_siz.pub;
        log_lin_wid = true;
        for row = 1:n_row
            hax = hax_sub(row);
            if row < 3
                fie = 'exc';
                [~, ind_pix] = sort(dff_uni_win(log_uni.exc, win), 'descend');
            else
                fie = 'inh';
                [~, ind_pix] = sort(dff_uni_win(log_uni.inh, win), 'ascend');
            end
            dff_cel_fra = dff_uni_poi(log_uni.(fie), :);
            dff_cel_fra(isinf(dff_cel_fra)) = 0;
            if rem(row, 2) == 1
                [h_plo, ind_var_pea] = plo_sha.smo_tri(hax, tim_fra, dff_cel_fra', ...
                    col, n_fra.dff.eig.bas, n_fra.dff.eig.smo);
                h = yline(hax, 0, 'Color', gra, 'LineWidth', lin_wid, 'LineStyle', '--');
                ylabel(hax, col_cod)
            else
                dff_fra_pix = smo_sam_poi_var(dff_cel_fra(ind_pix, :)', n_fra.dff.eig.bas, ...
                    n_fra.dff.eig.smo);
                ima(hax, tim_fra, dff_fra_pix')
                caxis(hax, col_lim)
                hax.Colormap = map;
                ylabel(hax, y_lab.neu_num)
            end
            if row ~= n_row
                hax.XAxis.Visible = false;
            end
            h = xline(hax, 0, 'Color', gra, 'LineWidth', lin_wid, 'LineStyle', '--');
            h = xline(hax, pha_win_len, 'Color', gra, 'LineWidth', lin_wid, 'LineStyle', '--');
            hax = adj_hax(hax, fon_siz, mar_siz, log_lin_wid);
        end
        align_Ylabels(h_fig, n_row);
        x_lab = con_fil.x_lab;
        xlabel(hax, x_lab.tim)
        shi = 0.002;
        col_han = adj_col_han(hax, shi);
        col_han.Ticks = col_lim;
        col_han = lab_col(col_han, col_cod);
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        h_fig = opt_h_fig(h_fig, las_pix, rat_wid);
        end

        function h_fig = smo_pub_sid(dff_uni_poi, log_uni, pha_win_len)
        col_lim = [-10 10];
        col_cod = '\DeltaF/F (%)';
        [h_fig, fig_wid, fig_hei] = fig;
        %[h_fig, fig_wid, fig_hei] = fig_mac;
        n_row = 2;
        n_col = 2;
        mar_bot = 0.025;
        hei = 3.5;
        mar_top = cal_mar_top(hei);
        mar_lef = 0.025;
        mar_rig = 0.000;
        ver_wit = 0.007;
        gap_ver_row = [ver_wit ver_wit];
        %
        gap_hor_row_col = 0.010*ones(n_row, n_col);
        asp_rat_axe = ones(n_row*n_col, 1);
        wid = false;
        sca_axe = ones(n_row*n_col, 1);
        n_pix_ext = 100;
        [hax_sub, pos_axe, hei_axe, dis_asp_rat, las_pix, rat_wid] = tight_subplot_gen(n_row, ...
            n_col, gap_ver_row, gap_hor_row_col, mar_bot, mar_top, mar_lef, mar_rig, asp_rat_axe, ...
            fig_wid, fig_hei, wid, sca_axe, n_pix_ext);
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        con_fil = matfile('\\home.ansatt.ntnu.no\kadiram\Documents\MATLAB\con_esp.mat');
        n_fra = con_fil.n_fra;
        tim_fra = con_fil.tim_fra;
        tim_fra = tim_fra.cal.eig.tri.dff;
        col_sig = 'k';
        fon_siz = 7;
        lin_wid = con_fil.lin_wid;
        lin_wid = lin_wid.two;
        dff_uni_win = com_ave_amp_uni_win(tim_fra, dff_uni_poi', pha_win_len);
        win = 2;
        map = con_fil.map;
        map = map.sym;
        y_lab = con_fil.y_lab;
        gra = con_fil.gra;
        x_lab = con_fil.x_lab;
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        for row = 1:n_row
            for col = 1:n_col
                hax = hax_sub((row - 1)*n_col + col);
                if col == 1
                    fie = 'exc';
                    [~, ind_pix] = sort(dff_uni_win(log_uni.exc, win), 'descend');
                else
                    fie = 'inh';
                    [~, ind_pix] = sort(dff_uni_win(log_uni.inh, win), 'ascend');
                end
                dff_cel_fra = dff_uni_poi(log_uni.(fie), :);
                dff_cel_fra(isinf(dff_cel_fra)) = 0;
                if row == 1
                    [h_plo, ind_var_pea] = plo_sha.smo_tri(hax, tim_fra, dff_cel_fra', ...
                        col_sig, n_fra.dff.eig.bas, n_fra.dff.eig.smo);
                    h = yline(hax, 0, 'Color', gra, 'LineWidth', lin_wid, 'LineStyle', '--');
                    if col == 1
                        ylabel(hax, col_cod)
                    end
                else
                    dff_fra_pix = smo_sam_poi_var(dff_cel_fra(ind_pix, :)', n_fra.dff.eig.bas, ...
                        n_fra.dff.eig.smo);
                    ima(hax, tim_fra, dff_fra_pix')
                    caxis(hax, col_lim)
                    hax.Colormap = map;
                    xlabel(hax, x_lab.tim)
                    if col == 1
                        ylabel(hax, y_lab.neu_num)
                    end
                end
                if row == 1
                    hax.XAxis.Visible = false;
                end
                
                h = xline(hax, 0, 'Color', gra, 'LineWidth', lin_wid, 'LineStyle', '--');
                h = xline(hax, pha_win_len, 'Color', gra, 'LineWidth', lin_wid, 'LineStyle', '--');
                hax = adj_hax(hax, fon_siz);
            end
        end
        align_Ylabels(h_fig, n_row);
        shi = 0.002;
        col_han = adj_col_han(hax, shi);
        col_han.Ticks = col_lim;
        col_han = lab_col(col_han, col_cod);
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        h_fig = opt_h_fig(h_fig, las_pix, rat_wid);
        end

        function h_fig = raw(dff_uni_poi, log_uni, pha_win_len)
        col_lim = [-10 10];
        col_cod = '\DeltaF/F (%)';
        [h_fig, fig_wid, fig_hei] = fig;
        n_row = 4;
        n_col = 1;
        mar_bot = 0.070;
        mar_top = 0.010;
        mar_lef = 0.040;
        mar_rig = 0.000;
        asp_rat_axe = ones(n_row*n_col, 1);
        gap_ver_row = 0.040*ones(1, n_row);
        gap_hor_row_col = 0.040*ones(n_row, n_col);
        wid = false;
        sca_axe = ones(n_row*n_col, 1);
        n_pix_ext = 0;
        [hax_sub, pos_axe, hei_axe, dis_asp_rat, las_pix, rat_wid] = tight_subplot_gen(n_row, n_col, ...
            gap_ver_row, gap_hor_row_col, mar_bot, mar_top, mar_lef, mar_rig, asp_rat_axe, fig_wid, ...
            fig_hei, wid, sca_axe, n_pix_ext);
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        col_han_pos = [0.2 0.380 0.005 0.150];
        con_fil = matfile('\\home.ansatt.ntnu.no\kadiram\Documents\MATLAB\con_esp.mat');
        col = 'k';
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% signals
        hax = hax_sub(1);
        tim_fra = con_fil.tim_fra;
        tim_fra = tim_fra.cal.eig.tri.dff;

        log_poi = tim_fra <= 3;
        tim_fra = tim_fra(log_poi);
        dff_uni_poi = dff_uni_poi(:, log_poi');

        inh_uni_poi = dff_uni_poi(log_uni.inh, :);
        inh_uni_poi(isinf(inh_uni_poi)) = 0;
        [h_plo, ind_var_pea] = plo_sha.raw(hax, tim_fra, inh_uni_poi', col);
        
        lin_wid = con_fil.lin_wid;
        h = yline(hax, 0, 'LineWidth', lin_wid.two);
        h = xline(hax, 0, 'Color', 'g', 'LineWidth', lin_wid.two);
        h = xline(hax, pha_win_len, 'Color', 'g', 'LineWidth', lin_wid.two);
        
        hax = hax_sub(3);
        exc_pix_fra = dff_uni_poi(log_uni.exc, :);
        [h_plo, ind_var_pea] = plo_sha.raw(hax, tim_fra, exc_pix_fra', col);
        h = yline(hax, 0, 'LineWidth', lin_wid.two);
        h = xline(hax, 0, 'Color', 'g', 'LineWidth', lin_wid.two);
        h = xline(hax, pha_win_len, 'Color', 'g', 'LineWidth', lin_wid.two);
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% images
        dff_uni_win = com_ave_amp_uni_win(tim_fra, dff_uni_poi', pha_win_len);
        hax = hax_sub(2);
        win = 2;
        [~, ind_pix] = sort(dff_uni_win(log_uni.inh, win), 'ascend');
        dff_fra_pix = inh_uni_poi(ind_pix, :)';
        ima(hax, tim_fra, dff_fra_pix')
        caxis(hax, col_lim)
        map = con_fil.map;
        map = map.sym;
        hax.Colormap = map;
        h = xline(hax, 0, 'Color', 'g', 'LineWidth', lin_wid.two);
        h = xline(hax, pha_win_len, 'Color', 'g', 'LineWidth', lin_wid.two);
        hax.YAxis.Visible = "off";
        
        hax = hax_sub(4);
        [~, ind_pix] = sort(dff_uni_win(log_uni.exc, win), 'descend');
        dff_fra_pix = exc_pix_fra(ind_pix, :)';
        ima(hax, tim_fra, dff_fra_pix')
        caxis(hax, col_lim)
        hax.Colormap = map;
        h = xline(hax, 0, 'Color', 'g', 'LineWidth', lin_wid.two);
        h = xline(hax, pha_win_len, 'Color', 'g', 'LineWidth', lin_wid.two);
        hax.YAxis.Visible = "off";
        col_han = colorbar('Ticks', col_lim);
        col_han.Position = col_han_pos;
        col_han.Label.String = col_cod;
        col_han.Label.Units = 'normalized';
        col_han.Label.Position(1) = 1.5;
        end

        function h_fig = gab(dff_uni_poi, log_fie_fie_cel, pha_win_len)
        col_lim = [-10 10];
        col_cod = '\DeltaF/F (%)';
        [h_fig, fig_wid, fig_hei] = fig;
        n_row = 4;
        n_col = 2;
        mar_bot = 0.025;
        %hei = 4.5;% ewelina
        hei = 6;
        mar_top = cal_mar_top(hei);
        mar_lef = 0.020;
        mar_rig = 0.000;
        ver_wit = 0.005;
        gap_ver_row = [ver_wit 0.010 ver_wit ver_wit];
        %
        gap_hor_row_col = 0.010*ones(n_row, n_col);
        asp_rat_axe = ones(n_row*n_col, 1);
        wid = false;
        sca_axe = ones(n_row*n_col, 1);
        n_pix_ext = 100;
        [hax_sub, pos_axe, hei_axe, dis_asp_rat, las_pix, rat_wid] = tight_subplot_gen(n_row, ...
            n_col, gap_ver_row, gap_hor_row_col, mar_bot, mar_top, mar_lef, mar_rig, asp_rat_axe, ...
            fig_wid, fig_hei, wid, sca_axe, n_pix_ext);
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        linkaxes(hax_sub(1:2))
        linkaxes(hax_sub(5:6))
        con_fil = matfile('\\home.ansatt.ntnu.no\kadiram\Documents\MATLAB\con_esp.mat');
        n_fra = con_fil.n_fra;
        tim_fra = con_fil.tim_fra;
        tim_fra = tim_fra.cal.eig.tri.dff;
        fon_siz = 7;
        lin_wid = con_fil.lin_wid;
        lin_wid = lin_wid.two;
        dff_uni_win = com_ave_amp_uni_win(tim_fra, dff_uni_poi', pha_win_len);
        win = 2;
        map = con_fil.map;
        map = map.sym;
        y_lab = con_fil.y_lab;
        x_lab = con_fil.x_lab;
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        for col = 1:n_col
            if col == 1
                pop = 'gab';
            else
                pop = 'non';
            end
            for row = 1:n_row
                hax = hax_sub((row - 1)*n_col + col);
                if row < 3
                    fie = 'exc';
                    [~, ind_cel] = sort(dff_uni_win(log_fie_fie_cel.(pop).srt.exc, win), 'descend');
                else
                    fie = 'inh';
                    [~, ind_cel] = sort(dff_uni_win(log_fie_fie_cel.(pop).srt.inh, win), 'ascend');
                end
                dff_cel_fra = dff_uni_poi(log_fie_fie_cel.(pop).srt.(fie), :);
                dff_cel_fra(isinf(dff_cel_fra)) = 0;
                if rem(row, 2) == 1
                    [h_plo, ind_var_pea] = plo_sha.smo_tri(hax, tim_fra, dff_cel_fra', ...
                        'k', n_fra.dff.eig.bas, n_fra.dff.eig.smo);
                    h = yline(hax, 0, 'LineWidth', lin_wid);
                    if col == 1
                        ylabel(hax, col_cod)
                    else
                        hax.YAxis.Visible = false;
                    end
                else
                    dff_fra_pix = smo_sam_poi_var(dff_cel_fra(ind_cel, :)', n_fra.dff.eig.bas, ...
                        n_fra.dff.eig.smo);
                    ima(hax, tim_fra, dff_fra_pix')
                    caxis(hax, col_lim)
                    hax.Colormap = map;
                    if col == 1
                        ylabel(hax, y_lab.neu_num)
                    end
                end
                if row ~= n_row
                    hax.XAxis.Visible = false;
                end
                h = xline(hax, 0, 'Color', 'g', 'LineWidth', lin_wid);
                h = xline(hax, pha_win_len, 'Color', 'g', 'LineWidth', lin_wid);
                hax = adj_hax(hax, fon_siz);
            end
            xlabel(hax, x_lab.tim)
        end
        align_Ylabels(h_fig, n_row);
        shi = 0.002;
        col_han = adj_col_han(hax, shi);
        col_han.Ticks = col_lim;
        col_han = lab_col(col_han, col_cod);
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        h_fig = opt_h_fig(h_fig, las_pix, rat_wid);
        end
    end

end
