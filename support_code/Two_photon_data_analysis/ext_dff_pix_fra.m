classdef ext_dff_pix_fra
    %EXT_DFF_PIX_FRA - One line description of what the class performs (H1 line)
    %   Optional file header info (to give more details about the function than in the H1 line)
    %   Optional file header info (to give more details about the function than in the H1 line)
    %   Optional file header info (to give more details about the function than in the H1 line)
    %
    %   EXT_DFF_PIX_FRA constructor syntax:
    %       EXT_DFF_PIX_FRA_OBJ = EXT_DFF_PIX_FRA()
    %
    %   EXT_DFF_PIX_FRA properties/attributes:
    %       Property 1 - description
    %       Property 2 - description
    %
    %   EXT_DFF_PIX_FRA methods/functions:
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
    %   Date: 03-May-2023; Last revision: 03-May-2023
    %
    %   Copyright (c) 2023, Aytac Kadir Mutlu
    %   All rights reserved.


    properties
    end
    
    methods(Static)
        function dff_pix_fra = sli(bou_ons_bou, dff_pla_fra_pix)
            con_fil = matfile('\\home.ansatt.ntnu.no\kadiram\Documents\MATLAB\con_esp.mat');
            dff_pix_fra = [];
            fun_pla = con_fil.fun_pla;
            for pla_num = fun_pla.raw
                [~, act_pix_fra] = ext_sco_com_fra_bou(bou_ons_bou, dff_pla_fra_pix{pla_num});
                dff_pix_fra = [dff_pix_fra; act_pix_fra];
            end
        end
        function [dff_pix_fra, log_pix, res_pix, dff_pix_bou_win, dff_pix_fra_bou] = tri(...
                piv_pla_fra_pix, bas_win_len, ons_tri, fra_rat, isi, pha_win_len, log_pix)
            con_fil = matfile('\\home.ansatt.ntnu.no\kadiram\Documents\MATLAB\con_esp.mat');
            fun_pla = con_fil.fun_pla;
            dff_pix_fra = [];
            dff_pix_bou_win = [];
            dff_pix_fra_bou = [];
            log_pix.res = [];
            log_pix.inh = [];
            log_pix.exc = [];
            res_pix = [];
            for pla = fun_pla.raw
                disp(pla)
                [~, n_uni] = size(piv_pla_fra_pix{pla});
                log_uni.all.all = true(n_uni, 1);
                fie_num = {'all'; 'all'};
                [~, ~, dff_pix_fra_bou_tem, ~, ~, dff_pix_fra_tem, dff_pix_bou_win_tem, ~, log_uni, ...
                    ~, ~, res_uni] = cal_rel_cha_uni_poi_tri(piv_pla_fra_pix{pla}, bas_win_len, ...
                    ons_tri, fra_rat, isi, pha_win_len, log_uni, fie_num);
                dff_pix_fra = [dff_pix_fra; dff_pix_fra_tem];
                dff_pix_bou_win = [dff_pix_bou_win; dff_pix_bou_win_tem];
                dff_pix_fra_bou = [dff_pix_fra_bou; dff_pix_fra_bou_tem];
                % .all !!!!!!!!!!!!!
                log_pix.res = [log_pix.res; log_uni.all.res];
                log_pix.inh = [log_pix.inh; log_uni.all.inh];
                log_pix.exc = [log_pix.exc; log_uni.all.exc];
                res_pix = [res_pix; res_uni];
            end
        end
    end

end
