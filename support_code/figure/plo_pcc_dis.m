classdef plo_pcc_dis
    %PLO_PCC_DIS - One line description of what the class performs (H1 line)
    %   Optional file header info (to give more details about the function than in the H1 line)
    %   Optional file header info (to give more details about the function than in the H1 line)
    %   Optional file header info (to give more details about the function than in the H1 line)
    %
    %   PLO_PCC_DIS constructor syntax:
    %       PLO_PCC_DIS_OBJ = PLO_PCC_DIS()
    %
    %   PLO_PCC_DIS properties/attributes:
    %       Property 1 - description
    %       Property 2 - description
    %
    %   PLO_PCC_DIS methods/functions:
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
    %   Date: 14-Feb-2024; Last revision: 14-Feb-2024
    %
    %   Copyright (c) 2024, Aytac Kadir Mutlu
    %   All rights reserved.


    properties
    end
    
    methods(Static)
        function h_fig = pos_neg(pcc_blo_ani, dis_blo)
            [h_fig, fig_wid, fig_hei] = fig;
            con_fil = matfile('\\home.ansatt.ntnu.no\kadiram\Documents\MATLAB\con_esp.mat');
            asp_rat = con_fil.asp_rat;
            n_row = 1;
            n_col = 1;
            gap_ver_row = 0.050*ones(n_row, 1);
            gap_hor_row_col = 0.030*ones(n_row, n_col);
            mar_bot = 0.100;
            mar_top = 0.030;
            mar_lef = 0.070;
            mar_rig = 0.001;
            asp_rat_axe = asp_rat.bar*ones(n_row*n_col, 1);
            wid = false;
            sca_axe = ones(n_row*n_col, 1);
            n_pix_ext = 30;
            [hax_sub, pos_axe, hei_axe, dis_asp_rat, las_pix, rat_wid] = tight_subplot_gen(n_row, ...
                n_col, ...
                gap_ver_row, gap_hor_row_col, mar_bot, mar_top, mar_lef, mar_rig, asp_rat_axe, ...
                fig_wid, ...
                fig_hei, wid, sca_axe, n_pix_ext);
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            hax = hax_sub(1);
            col = 'k';
            plo_sha.raw(hax, dis_blo, pcc_blo_ani.dat.pos, col)
            plo_sha.raw(hax, dis_blo, pcc_blo_ani.dat.neg, col)
            %
            col = con_fil.gre;
            plo_sha.raw(hax, dis_blo, pcc_blo_ani.shu.pos, col)
            plo_sha.raw(hax, dis_blo, pcc_blo_ani.shu.neg, col)
            %
            hax.XTickLabelMode = 'auto';
            hax.Box = 'off';
            ylabel(hax, 'pairwise CC')
            %xlim([0 150])%%%%%%%%%%%!!!!!!!!!!!!!!!!!!!!
            %xlim([0 400])%%%%%%%%%%%!!!!!!!!!!!!!!!!!!!!
            xlim([0 300])%%%%%%%%%%%!!!!!!!!!!!!!!!!!!!!
            xlabel(hax, 'distance (\mum)')
            h_fig = opt_h_fig(h_fig, las_pix, rat_wid);
        end

        function h_fig = all(pcc_blo_ani, dis_blo, x_lim)
            [h_fig, fig_wid, fig_hei] = fig;
            con_fil = matfile('\\home.ansatt.ntnu.no\kadiram\Documents\MATLAB\con_esp.mat');
            asp_rat = con_fil.asp_rat;
            n_row = 1;
            n_col = 1;
            gap_ver_row = 0.050*ones(n_row, 1);
            gap_hor_row_col = 0.030*ones(n_row, n_col);
%             mar_bot = 0.100;
%             mar_top = 0.030;
%             mar_lef = 0.070;
%             mar_rig = 0.001;

            hei = 3.5;% ewelina
            mar_top = cal_mar_top(hei);
            mar_bot = 0.030;
            mar_lef = 0.020;
            mar_rig = 0.000;

            asp_rat_axe = asp_rat.bar*ones(n_row*n_col, 1);
            wid = false;
            sca_axe = ones(n_row*n_col, 1);
            n_pix_ext = 30;
            [hax_sub, pos_axe, hei_axe, dis_asp_rat, las_pix, rat_wid] = tight_subplot_gen(n_row, ...
                n_col, ...
                gap_ver_row, gap_hor_row_col, mar_bot, mar_top, mar_lef, mar_rig, asp_rat_axe, ...
                fig_wid, ...
                fig_hei, wid, sca_axe, n_pix_ext);
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            hax = hax_sub(1);
            col = 'k';
            plo_sha.raw(hax, dis_blo, pcc_blo_ani.dat.all, col)
            %
            col = con_fil.gre;
            plo_sha.raw(hax, dis_blo, pcc_blo_ani.shu.all, col)
            %
            hax.XTickLabelMode = 'auto';
            hax.Box = 'off';
            ylabel(hax, 'pairwise CC')
            %xlim([0 150])%%%%%%%%%%%!!!!!!!!!!!!!!!!!!!!
            xlim([0 x_lim])%%%%%%%%%%%!!!!!!!!!!!!!!!!!!!!
            %xlim([0 300])%%%%%%%%%%%!!!!!!!!!!!!!!!!!!!!

            %ylim([-0.03 0.06])

            xlabel(hax, 'distance (\mum)')
            fon_siz = con_fil.fon_siz;
            hax = adj_hax(hax, fon_siz.pub);
            h_fig = opt_h_fig(h_fig, las_pix, rat_wid);
        end

        function h_fig = exc_inh(pcc_blo_ani, dis_blo, x_lim)
            [h_fig, fig_wid, fig_hei] = fig;
            con_fil = matfile('\\home.ansatt.ntnu.no\kadiram\Documents\MATLAB\con_esp.mat');
            asp_rat = con_fil.asp_rat;
            n_row = 1;
            n_col = 2;
            
%             gap_ver_row = 0.050*ones(n_row, 1);
%             gap_hor_row_col = 0.070*ones(n_row, n_col);
%             mar_bot = 0.100;
%             mar_top = 0.030;
%             mar_lef = 0.070;
%             mar_rig = 0.001;

            gap_ver_row = 0.010*ones(n_row, 1);
            gap_hor_row_col = 0.015*ones(n_row, n_col);
            hei = 3.5;% ewelina
            mar_top = cal_mar_top(hei);
            mar_bot = 0.030;
            mar_lef = 0.020;
            mar_rig = 0.000;
            
            asp_rat_axe = asp_rat.bar*ones(n_row*n_col, 1);
            wid = false;
            sca_axe = ones(n_row*n_col, 1);
            n_pix_ext = 30;
            [hax_sub, pos_axe, hei_axe, dis_asp_rat, las_pix, rat_wid] = tight_subplot_gen(n_row, ...
                n_col, ...
                gap_ver_row, gap_hor_row_col, mar_bot, mar_top, mar_lef, mar_rig, asp_rat_axe, ...
                fig_wid, ...
                fig_hei, wid, sca_axe, n_pix_ext);
            linkaxes(hax_sub)
            y_min = inf;
            y_max = -inf;
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            hax = hax_sub(1);
            col = 'k';
            plo_sha.raw(hax, dis_blo, pcc_blo_ani.exc.dat.all, col)
            col = con_fil.gre;
            plo_sha.raw(hax, dis_blo, pcc_blo_ani.exc.shu.all, col)
            hax.XTickLabelMode = 'auto';
            hax.Box = 'off';
            ylabel(hax, 'pairwise CC')
            xlim([0 x_lim])%%%%%%%%%%%!!!!!!!!!!!!!!!!!!!!
            [y_min, y_max] = adj_y(hax, y_min, y_max);
            xlabel(hax, 'distance (\mum)')
            fon_siz = con_fil.fon_siz;
            hax = adj_hax(hax, fon_siz.pub);
            %
            hax = hax_sub(2);
            col = 'k';
            plo_sha.raw(hax, dis_blo, pcc_blo_ani.inh.dat.all, col)
            col = con_fil.gre;
            plo_sha.raw(hax, dis_blo, pcc_blo_ani.inh.shu.all, col)
            hax.XTickLabelMode = 'auto';
            hax.Box = 'off';
            hax.YAxis.Visible = 'off';
            xlim([0 x_lim])%%%%%%%%%%%!!!!!!!!!!!!!!!!!!!!
            xlabel(hax, 'distance (\mum)')
            [y_min, y_max] = adj_y(hax, y_min, y_max);
            hax = adj_hax(hax, fon_siz.pub);
            %
            h_fig = opt_h_fig(h_fig, las_pix, rat_wid);
        end
    end

end
