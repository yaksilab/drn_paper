classdef sam
    properties
        sam_idx
        n_pla_str
        con
        fil_pat_rec
        fil_pat_exp
        fil_pat_sam
        poo_dir
        poo_dir_tem
        col_sig
        col_dru
        col_sti
        tit
        tit_con
        tit_par
        fil_pat_fig_eth
        fil_pat_fig_ang
        fil_pat_fig_ang_tap
        fil_pat_fig_spe_tap
        fil_pat_fig_spo_sta
        fil_pat_fig_lat
        fil_pat_fig_map
        fil_pat_fig_pro
        fil_pat_fig_eth_spo
        fil_pat_fig_mat_eth_spo
        fil_pat_fig_eth_sti
        fil_pat_fig_eth_sti_hal
        fil_pat_fig_ave_pcx
        bas_dur_beh
        res_dur_beh
        col_rat_ave
        col_sti_ave
        fil_pat_beh_fig
        fil_pat_beh_fig_con
        fil_pat_fig_beh_bin
        win_siz
        win_col
        y_lab
        mar
        tap_pre
        n_par
        col_con
        n_tri_thr
        fil_pat_fig_lst
        fil_pat_fig_per_cel
        fil_pat_fig_cro
        fil_pat_fig_lst_thr
        fil_pat_fig_per_cel_thr
        fil_pat_fig_cro_thr
        fil_pat_fig_neu_one
        fil_pat_fig_neu_two
        fil_pat_fig_neu_thr
        fil_pat_fig_neu_fou
        fil_pat_fig_neu_fiv
        fil_pat_fig_neu_six
        fil_pat_fig_neu_sev
        fil_pat_fig_neu_eig
        %
        fil_pat_fig_sum_hab
        fil_pat_fig_sum_tel
        fil_pat_fig_dff_com
        fil_pat_fig_neu_cel_one
        fil_pat_fig_neu_cel_two
        fil_pat_fig_neu_cel_sig
        fil_pat_fig_cor
        fil_pat_fig_hab_cor
        fil_pat_fig_dmx_cor
        fil_pat_fig_dlx_cor
        fil_pat_fig_hab_cor_ext
        fil_pat_fig_dmx_cor_ext
        fil_pat_fig_dlx_cor_ext
        fil_pat_fig_neu_cel_ext
        fil_pat_fig_neu_cel_sig_ext
        fil_pat_fig_cor_ext
        fil_pat_fig_spo_one
        fil_pat_fig_spo_nor_one
        fil_pat_fig_spo_cor
        fil_pat_fig_bra_reg
        fil_pat_fig_cor_map
        fil_pat_fig_cor_his
        fil_pat_fig_icx_res
        fil_pat_fig_vib_res
        fil_pat_fig_pix_res
        fil_pat_fig_cdf
        fil_pat_fig_com_res
        fil_pat_fig_clu_map_cel
        fil_pat_fig_dua_clu_map_cel
        fil_pat_fig_clu_map_cel_ani
        abb_par
        abb_pcx_par
        sta_ani_con
        cel_det_ani
        sta_ani
        n_xri
        sta_det_ani
        fil_pat_mul_sam
        %
        ani
        tai_ani
        bri_ani
        %
        n_ani
        n_ani_tai
        n_ani_cel_det
        n_ani_sta
        n_ani_bri
        %
        fil_pat_fig_tai_ang
        %
        fil_pat_fig_clu_map_pix
        fil_pat_fig_som_clu_map_pix
        fil_pat_fig_clu_map_ani
        fil_pat_fig_clu_map_ani_thr_som
        fil_pat_fig_clu_map_ani_thr
    end
    methods
        function obj = spe(obj)
            obj.n_ani = length(obj.ani);
            obj.win_col = ["red"; "green (color wheel) (x11 green)"; "turquoise"; "cyan"; ...
                "blue gray"];
            obj.win_siz = 120;
            obj.abb_par = ["TR (Hz)"; "HR (Hz)"; "OR (Hz)"; "MR (Hz)"; "ER (Hz)"];
            obj.abb_pcx_par = ["TA (rad)"; "HPC (a.u.)"; "OPC (a.u.)"; "MPC (a.u.)"; ...
                "EPC (a.u.)"];
            obj.col_sti = 'magenta'; %%%%
            obj.col_rat_ave = 'blue';
            obj.col_sti_ave = 'red';
            %
            obj.fil_pat_exp = strings(obj.n_ani, 1);
            for i = 1:obj.n_ani
                raw_dir = strcat("X:\kadiram\Data\Raw\", obj.ani(i));
                obj.fil_pat_exp(i) = strcat(raw_dir, "\tap.mat");
            end
            %
            obj.fil_pat_rec = strings(obj.n_ani, 1);
            for i = 1:obj.n_ani
                pro_dir = strcat("X:\kadiram\Data\Processed\", obj.ani(i));
                obj.fil_pat_rec(i) = strcat(pro_dir, "\tap.mat");
            end
            %
            obj.poo_dir = strcat("X:\kadiram\Data\Pooled\", obj.sam_idx);
            if exist(obj.poo_dir, 'dir') == 0
                mkdir(obj.poo_dir);
            end
            %
            obj.poo_dir_tem = strcat("W:\temp\kadiram\Data\Pooled\", obj.sam_idx);
            if exist(obj.poo_dir_tem, 'dir') == 0
                mkdir(obj.poo_dir_tem);
            end
            obj.tit_par = {'Tail', 'Heart', 'Operculum', 'Mouth', 'Eye'};
            obj.fil_pat_sam = strcat(obj.poo_dir, "\", obj.sam_idx, ".mat");
            obj.fil_pat_fig_tai_ang = strcat(obj.poo_dir, "\tai_ang.png");
            obj.fil_pat_fig_eth = strcat(obj.poo_dir, "\eth.png");
            obj.fil_pat_fig_ang = strcat(obj.poo_dir, "\ang.png");
            obj.fil_pat_fig_ang_tap = strcat(obj.poo_dir, "\ang_tap.png");
            obj.fil_pat_fig_spe_tap = strcat(obj.poo_dir, "\spe_tap.png");
            obj.fil_pat_fig_spo_sta = strcat(obj.poo_dir, "\spo_sta.png");
            obj.fil_pat_beh_fig = strcat(obj.poo_dir, "\beh.png");
            obj.fil_pat_fig_beh_bin = strcat(obj.poo_dir, "\beh_bin.png");
            obj.fil_pat_beh_fig_con = [strcat(obj.poo_dir, "\beh_one.png"); ...
                strcat(obj.poo_dir, "\beh_two.png"); strcat(obj.poo_dir, "\beh_thr.png")];
            obj.fil_pat_fig_lat = strcat(obj.poo_dir, "\lat.png");
            obj.fil_pat_fig_map = strcat(obj.poo_dir, "\map.png");
            obj.fil_pat_fig_pro = strcat(obj.poo_dir, "\pro.png");
            obj.fil_pat_fig_eth_spo = strcat(obj.poo_dir, "\eth_spo.png");
            obj.fil_pat_fig_mat_eth_spo = strcat(obj.poo_dir, "\eth_spo.fig");
            obj.fil_pat_fig_eth_sti = strcat(obj.poo_dir, "\eth_sti.png");
            obj.fil_pat_fig_eth_sti_hal = strcat(obj.poo_dir, "\eth_sti_hal.png");
            obj.fil_pat_fig_ave_pcx = strcat(obj.poo_dir, "\ave_pcx.png");
            obj.fil_pat_fig_neu_one = strcat(obj.poo_dir, "\neu_one.png");
            obj.fil_pat_fig_neu_two = strcat(obj.poo_dir, "\neu_two.png");
            obj.fil_pat_fig_neu_thr = strcat(obj.poo_dir, "\neu_thr.png");
            obj.fil_pat_fig_neu_fou = strcat(obj.poo_dir, "\neu_fou.png");
            obj.fil_pat_fig_neu_fiv = strcat(obj.poo_dir, "\neu_fiv.png");
            obj.fil_pat_fig_neu_six = strcat(obj.poo_dir, "\neu_six.png");
            obj.fil_pat_fig_neu_sev = strcat(obj.poo_dir, "\neu_sev.png");
            obj.fil_pat_fig_neu_eig = strcat(obj.poo_dir, "\neu_eig.png");
            %
            obj.fil_pat_fig_sum_hab = strcat(obj.poo_dir, "\sum_hab.png");
            obj.fil_pat_fig_sum_tel = strcat(obj.poo_dir, "\sum_tel.png");
            obj.fil_pat_fig_dff_com = strcat(obj.poo_dir, "\dff_com.png");
            obj.fil_pat_fig_neu_cel_one = strcat(obj.poo_dir, "\neu_cel_one.png");
            obj.fil_pat_fig_neu_cel_two = strcat(obj.poo_dir, "\neu_cel_two.png");
            obj.fil_pat_fig_neu_cel_ext = strcat(obj.poo_dir, "\neu_cel_ext.png");
            obj.fil_pat_fig_neu_cel_sig = strcat(obj.poo_dir, "\neu_cel_sig.png");
            obj.fil_pat_fig_neu_cel_sig_ext = strcat(obj.poo_dir, "\neu_cel_sig_ext.png");
            obj.fil_pat_fig_cor = strcat(obj.poo_dir, "\cor.png");
            obj.fil_pat_fig_cor_ext = strcat(obj.poo_dir, "\cor_ext.png");
            obj.fil_pat_fig_hab_cor = strcat(obj.poo_dir, "\hab_cor.png");
            obj.fil_pat_fig_dmx_cor = strcat(obj.poo_dir, "\dmx_cor.png");
            obj.fil_pat_fig_dlx_cor = strcat(obj.poo_dir, "\dlx_cor.png");
            obj.fil_pat_fig_hab_cor_ext = strcat(obj.poo_dir, "\hab_cor_ext.png");
            obj.fil_pat_fig_dmx_cor_ext = strcat(obj.poo_dir, "\dmx_cor_ext.png");
            obj.fil_pat_fig_dlx_cor_ext = strcat(obj.poo_dir, "\dlx_cor_ext.png");
            obj.fil_pat_fig_spo_one = strcat(obj.poo_dir, "\spo_one.png");
            obj.fil_pat_fig_spo_nor_one = strcat(obj.poo_dir, "\spo_nor_one.png");
            obj.fil_pat_fig_spo_cor = strcat(obj.poo_dir, "\spo_cor.png");
            obj.fil_pat_fig_bra_reg = strcat(obj.poo_dir, "\bra_reg.png");
            obj.fil_pat_fig_cor_map = strcat(obj.poo_dir, "\cor_map.png");
            obj.fil_pat_fig_cor_his = strcat(obj.poo_dir, "\cor_his.png");
            obj.fil_pat_fig_icx_res = strcat(obj.poo_dir, "\icx_res.png");
            obj.fil_pat_fig_vib_res = strcat(obj.poo_dir, "\vib_res.png");
            obj.fil_pat_fig_pix_res = strcat(obj.poo_dir, "\pix_res.png");
            obj.fil_pat_fig_com_res = strcat(obj.poo_dir, "\com_res.png");
            obj.fil_pat_fig_cdf = strcat(obj.poo_dir, "\cdf.png");
            %
            obj.fil_pat_fig_clu_map_cel = strcat(obj.poo_dir, "\clu_map_cel.png");
            obj.fil_pat_fig_dua_clu_map_cel = strcat(obj.poo_dir, "\dua_clu_map_cel.png");
            obj.fil_pat_fig_clu_map_cel_ani = strcat(obj.poo_dir, "\clu_map_cel_ani.png");
            %
            obj.fil_pat_fig_clu_map_pix = strcat(obj.poo_dir, "\clu_map_pix.png");
            obj.fil_pat_fig_som_clu_map_pix = strcat(obj.poo_dir, "\som_clu_map_pix.png");
            obj.fil_pat_fig_clu_map_ani = strcat(obj.poo_dir, "\clu_map_ani.png");
            obj.fil_pat_fig_clu_map_ani_thr_som = strcat(obj.poo_dir, "\clu_map_ani_thr_som.png");
            obj.fil_pat_fig_clu_map_ani_thr = strcat(obj.poo_dir, "\clu_map_ani_thr.png");
            %
            con_fil = matfile('\\home.ansatt.ntnu.no\kadiram\Documents\MATLAB\con_esp.mat');
            n_con = con_fil.n_con;
            obj.sta_ani_con = false(obj.n_ani, n_con); % stability
            obj.cel_det_ani = false(obj.n_ani, 1);
            obj.sta_ani = false(obj.n_ani, 1);
            for i = 1:obj.n_ani
                rec_fun_i = str2func(['rec_fun.' convertStringsToChars(obj.ani(i))]);
                sti = rec_fun_i();
                if sti.ali == true
                    obj.sta_ani_con(i, :) = sti.sta_con';
                end
                obj.cel_det_ani(i) = sti.cel_det;
                obj.sta_ani(i) = sti.sta;
            end
            obj.n_ani_cel_det = sum(obj.cel_det_ani);
            obj.n_ani_sta = sum(obj.sta_ani);
            obj.sta_det_ani = obj.sta_ani & obj.cel_det_ani;
            %
            n_tri_con = con_fil.n_tri_con;
            n_tri_con_mod = n_tri_con.vrs + 1;
            obj.n_xri = n_tri_con_mod*n_con;
            %
            obj.tai_ani = false(obj.n_ani, 1);
            obj.bri_ani = false(obj.n_ani, 1);
            for i = 1:obj.n_ani
                rec_fun_i = str2func(['rec_fun.' convertStringsToChars(obj.ani(i))]);
                sti = rec_fun_i();
                if sti.bri
                    obj.bri_ani(i) = sti.bri;
                end
                if sti.tai
                    obj.tai_ani(i) = sti.tai;
                end
            end
            obj.n_ani_tai = sum(obj.tai_ani);
            obj.n_ani_bri = sum(obj.bri_ani & obj.cel_det_ani);
        end
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        function sav_dat_sam(obj)
            save(obj.fil_pat_sam, 'obj', '-v7.3')
        end
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% behavioral
        function app_tai_dat(obj)
            mat_fil_obj_exp = matfile(obj.fil_pat_exp(1));
            n_con = mat_fil_obj_exp.n_con;
            n_tri_con = mat_fil_obj_exp.n_tri_con;
            mat_fil_obj_rec_one = matfile(obj.fil_pat_rec(2));%!
            fra_tim_uni = mat_fil_obj_rec_one.fra_tim_uni;
            n_fra = length(fra_tim_uni);
            con_fil = matfile('\\home.ansatt.ntnu.no\kadiram\Documents\MATLAB\con_esp.mat');
            n_fra_con = con_fil.n_fra;
            n_fra_con = n_fra_con.tai.tri.lon;
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            abs_ani = nan(obj.n_ani, 1); % ave_bas_spe
            ang_fra_ani = nan(n_fra, obj.n_ani);
            spe_fra_ani = nan(n_fra, obj.n_ani);
            nta_fra_ani_con = nan(n_fra_con, obj.n_ani, n_con);
            bea_lat_ani_tri = nan(obj.n_ani, n_con*n_tri_con);
            bea_ang_ani_tri = nan(obj.n_ani, n_con*n_tri_con);
            bea_lat_shu_ani_tri = nan(obj.n_ani, n_con*n_tri_con);
            per_pro_ani_con = nan(obj.n_ani, n_con);
            global n_win_ong lat_thr
            ave_ang_epo_ani = cell(n_win_ong, 1);
            for i = 1:n_win_ong
                ave_ang_epo_ani{i} = nan(obj.n_ani, 1);
                for j = 1:obj.n_ani
                    rec_fun = str2func(['rec_fun.' convertStringsToChars(obj.ani(j))]);
                    tap = rec_fun();
                    if tap.tai
                        rec_fil = matfile(obj.fil_pat_rec(j));
                        ave_ang_epo_ani{i}(j) = rec_fil.ave_ang_epo(i, 1);
                    end
                end
            end
            p_ave_ang_xep = com_p_xep(ave_ang_epo_ani);
            %
            for i = 1:obj.n_ani
                rec_fun = str2func(['rec_fun.' convertStringsToChars(obj.ani(i))]);
                tap = rec_fun();
                if tap.tai
                    rec_fil = matfile(obj.fil_pat_rec(i));
                    nta_ani_fra_sta_con = rec_fil.nta_fra_sta_con;
                    abs_ani(i) = rec_fil.ave_bas_spe;
                    for j = 1:n_con
                        nta_fra_ani_con(:, i, j) = nta_ani_fra_sta_con(:, 1, j);
                    end
                    per_pro_con = rec_fil.per_pro_con;
                    bea_lat_tri = rec_fil.bea_lat_tri;
                    bea_ang_tri = rec_fil.bea_ang_tri;
                    bea_lat_shu = rec_fil.bea_lat_shu;
                    per_pro_ani_con(i, :) = per_pro_con';
                    bea_lat_ani_tri(i, :) = bea_lat_tri';
                    bea_ang_ani_tri(i, :) = bea_ang_tri';
                    bea_lat_shu_ani_tri(i, :) = bea_lat_shu';
                    %
                    tai_ang_uni = rec_fil.tai_ang_uni;
                    ang_fra_ani(:, i) = tai_ang_uni;
                    vir_spe_uni = rec_fil.vir_spe_uni;
                    spe_fra_ani(:, i) = vir_spe_uni;
                end
            end
            %
            n_sta = 2;
            ave_tai_sig = nan(n_fra, n_sta);
            ave_vir_spe = nan(n_fra, n_sta);
            dim = 2;
            [ave_tai_sig(:, 1), ~, ave_tai_sig(:, 2)] = com_sta(ang_fra_ani, dim); % entire exp
            [ave_vir_spe(:, 1), ~, ave_vir_spe(:, 2)] = com_sta(spe_fra_ani, dim);
            nta_fra_sta_con = nan(n_fra_con, n_sta, n_con);
            n_win = con_fil.n_win;
            ave_nta_con_win_ani = cell(n_con, n_win.tri);
            for i = 1:n_con
                [nta_fra_sta_con(:, 1, i), ~, nta_fra_sta_con(:, 2, i)] = ...
                    com_sta(nta_fra_ani_con(:, :, i), dim);
                for k = 1:n_win.tri
                    ave_nta_con_win_ani{i, k} = nan(obj.n_ani, 1);
                    for j = 1:obj.n_ani
                        rec_fun = str2func(['rec_fun.' convertStringsToChars(obj.ani(j))]);
                        tap = rec_fun();
                        if tap.tai
                            rec_fil = matfile(obj.fil_pat_rec(j));
                            ave_nta_con_win_ani{i, k}(j) = rec_fil.ave_nta_con_win(i, k);
                        end
                    end
                end
            end
            [p_nta_con_xwi, p_nta_win_xco] = com_p_win_con(ave_nta_con_win_ani);
            %%%%%%%%%%%%%%%%%%%%%%%
            per_pro_ani_shu = com_per_pro_ani(bea_lat_shu_ani_tri, lat_thr);
            p_cro = com_p_cro(per_pro_ani_con');
            %%%%%%%%%%%%%%%%%%%%%%%%%%%
            log_nox_ani_tri = bea_lat_ani_tri > lat_thr;
            [bea_lat_ani_con, p_lat_cro, bea_lat_ani_tri] = ...
                com_bea_par_ani_con(bea_lat_ani_tri, log_nox_ani_tri);
            [bea_ang_ani_con, p_ang_cro, bea_ang_ani_tri] = ...
                com_bea_par_ani_con(bea_ang_ani_tri, log_nox_ani_tri);
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            save(obj.fil_pat_sam, 'abs_ani', 'ave_tai_sig', 'ave_vir_spe', ...
                'bea_lat_ani_tri', 'per_pro_ani_shu', 'bea_ang_ani_tri', ...
                'per_pro_ani_con', 'p_cro', 'bea_lat_ani_con', 'p_lat_cro', ...
                'bea_ang_ani_con', 'p_ang_cro', ...
                'nta_fra_sta_con', 'ave_nta_con_win_ani', 'p_nta_con_xwi', 'p_nta_win_xco', ...
                'ang_fra_ani', ...
                'ave_ang_epo_ani', 'p_ave_ang_xep', '-append')
            %
            tac_tri_win = [];
            for j = 1:obj.n_ani
                rec_fun = str2func(['rec_fun.' convertStringsToChars(obj.ani(j))]);
                tap = rec_fun();
                if tap.tai && tap.bri
                    rec_fil = matfile(obj.fil_pat_rec(j));
                    nta_tri_win = rec_fil.tac_tri_win;
                    tac_tri_win = [tac_tri_win; nta_tri_win];
                end
            end
            save(obj.fil_pat_sam, 'tac_tri_win', '-append')


            nam_fie = {'all'; 'vib'; 'non'; 'spo'};
            n_fie = length(nam_fie);
            for fie_num = 1:n_fie
                bou_dur_ani.(nam_fie{fie_num}) = nan(obj.n_ani, 1);
            end
            ang_bou.all = [];
            ang_bou.vib = [];
            ang_bou.non = [];
            for ani_num = 1:obj.n_ani
                rec_fun = str2func(['rec_fun.' convertStringsToChars(obj.ani(ani_num))]);
                tap = rec_fun();
                if tap.tai
                    rec_fil = matfile(tap.fil_pat_rec);
                    bou_dur = rec_fil.bou_dur;
                    for fie_num = 1:n_fie
                        bou_dur_ani.(nam_fie{fie_num})(ani_num) = bou_dur.(nam_fie{fie_num});
                    end
                    if tap.bri
                        ave_ang_bou = rec_fil.ang_bou;
                        ang_bou.all = [ang_bou.all; ave_ang_bou.all];
                        ang_bou.vib = [ang_bou.vib; ave_ang_bou.vib];
                        ang_bou.non = [ang_bou.non; ave_ang_bou.non];
                    end
                end
            end
            bou_dur.all = mean(bou_dur_ani.all, "omitnan");
            bou_dur.vib = mean(bou_dur_ani.vib, "omitnan");
            bou_dur.non = mean(bou_dur_ani.non, "omitnan");
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            save(obj.fil_pat_sam, 'bou_dur_ani', 'ang_bou', 'bou_dur', '-append')
        end
        % incorporated
        function app_par_tai(obj)
            nam_fie = {'all'; 'vib'; 'non'; 'spo'};
            n_fie = length(nam_fie);
            for fie_num = 1:n_fie
                bou_dur_ani.(nam_fie{fie_num}) = nan(obj.n_ani, 1);
            end
            ang_bou.all = [];
            ang_bou.vib = [];
            ang_bou.non = [];
            for ani_num = 1:obj.n_ani
                rec_fun = str2func(['rec_fun.' convertStringsToChars(obj.ani(ani_num))]);
                tap = rec_fun();
                if tap.tai
                    rec_fil = matfile(tap.fil_pat_rec);
                    bou_dur = rec_fil.bou_dur;
                    for fie_num = 1:n_fie
                        bou_dur_ani.(nam_fie{fie_num})(ani_num) = bou_dur.(nam_fie{fie_num});
                    end
                    if tap.bri
                        ave_ang_bou = rec_fil.ang_bou;
                        ang_bou.all = [ang_bou.all; ave_ang_bou.all];
                        ang_bou.vib = [ang_bou.vib; ave_ang_bou.vib];
                        ang_bou.non = [ang_bou.non; ave_ang_bou.non];
                    end
                end
            end
            bou_dur.all = mean(bou_dur_ani.all, "omitnan");
            bou_dur.vib = mean(bou_dur_ani.vib, "omitnan");
            bou_dur.non = mean(bou_dur_ani.non, "omitnan");
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            save(obj.fil_pat_sam, 'bou_dur_ani', 'ang_bou', 'bou_dur', '-append')
        end
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        function app_ang_fre_fra_sta_con(obj)
            n_sta = 2;
            dim = 2;
            load(obj.fil_pat_rec(1), 'rec_tai_ang_fre_fra_sta_con')
            n_ani = length(obj.fil_pat_rec);
            [n_fra_con, ~, n_con] = size(rec_tai_ang_fre_fra_sta_con);
            ang_fra_ani_con = nan(n_fra_con, n_ani, n_con);
            for i = 1:n_ani
                load(obj.fil_pat_rec(i), 'rec_tai_ang_fre_fra_sta_con')
                for j = 1:n_con
                    ang_fra_ani_con(:, i, j) = rec_tai_ang_fre_fra_sta_con(:, 1, j);
                end
            end
            ang_fre_fra_sta_con = nan(n_fra_con, n_sta, n_con);
            for i = 1:n_con
                [ang_fre_fra_sta_con(:, 1, i), ~, ang_fre_fra_sta_con(:, 2, i)] = com_sta(ang_fra_ani_con(:, :, i), dim);
            end
            save(obj.fil_pat_sam, 'ang_fre_fra_sta_con', '-append')
        end
        function app_ave_tai_sig_tri(obj)
            addpath \\home.ansatt.ntnu.no\kadiram\Documents\MATLAB\statistics
            n_sta = 2;
            dim = 2;
            load(obj.fil_pat_rec(1), 'tim_tri_uni_fra', 'rec_tai_ang_uni_fra_sta_con')
            n_ani = length(obj.fil_pat_rec);
            n_fra = length(tim_tri_uni_fra);
            n_con = size(rec_tai_ang_uni_fra_sta_con, 3);
            ang_fra_ani_con = nan(n_fra, n_ani, n_con);
            for i = 1:n_ani
                load(obj.fil_pat_rec(i), 'rec_tai_ang_uni_fra_sta_con')
                for j = 1:n_con
                    ang_fra_ani_con(:, i, j) = rec_tai_ang_uni_fra_sta_con(:, 1, j);
                end
            end
            %
            ang_fra_sta_con = nan(n_fra, n_sta, n_con);
            for i = 1:n_con
                [ang_fra_sta_con(:, 1, i), ~, ang_fra_sta_con(:, 2, i)] = com_sta(ang_fra_ani_con(:, :, i), dim);
            end
            %
            save(obj.fil_pat_sam, 'tim_tri_uni_fra', 'ang_fra_sta_con', '-append')
        end
        function app_spo_sta(obj)
            addpath \\home.ansatt.ntnu.no\kadiram\Documents\MATLAB\statistics
            load(obj.fil_pat_rec(1), 'rat_tim')
            load(obj.fil_pat_sam, 'rat_tim_ani_par')
            poi = ext_poi(obj.fil_pat_exp(1));
            [ave_rat_win_ani_par, n_par, n_win] = com_ave_rat_win_ani_par(rat_tim, rat_tim_ani_par, obj.win_siz, poi);
            p_com_par = nan(n_win - 1, n_par);
            for i = 1:n_par
                for j = 1:n_win - 1
                    p_com_par(j, i) = signrank(ave_rat_win_ani_par(j, :, i), ave_rat_win_ani_par(j + 1, :, i));
                end
            end
            save(obj.fil_pat_sam, 'ave_rat_win_ani_par', 'p_com_par', '-append')
        end
        function app_per_pro_con(obj)
            load(obj.fil_pat_exp(1), 'n_con')
            load(obj.fil_pat_sam, 'bea_lat_ani_tri')
            per_pro_con = com_per_pro_con(n_con, bea_lat_ani_tri, obj.lat_thr);
            save(obj.fil_pat_sam, 'per_pro_con', '-append')
        end
        function app_bea_lat_ani_tri(obj)
            load(obj.fil_pat_exp(1), 'n_tri_con', 'n_con')
            n_ani = length(obj.fil_pat_rec);
            bea_lat_ani_tri = nan(n_ani, n_con*n_tri_con);
            for i = 1:n_ani
                load(obj.fil_pat_rec(i), 'bea_lat_tri')
                bea_lat_ani_tri(i, :) = bea_lat_tri';
            end
            save(obj.fil_pat_sam, 'bea_lat_ani_tri', '-append')
        end
        function app_bea_lat_shu_ani_tri(obj)
            load(obj.fil_pat_exp(1), 'n_tri_con', 'n_con')
            n_ani = length(obj.fil_pat_rec);
            bea_lat_shu_ani_tri = nan(n_ani, n_con*n_tri_con);
            for i = 1:n_ani
                load(obj.fil_pat_rec(i), 'bea_lat_shu')
                bea_lat_shu_ani_tri(i, :) = bea_lat_shu';
            end
            save(obj.fil_pat_sam, 'bea_lat_shu_ani_tri', '-append')
        end
        function app_per_pro_ani_shu(obj)
            load(obj.fil_pat_sam, 'bea_lat_shu_ani_tri')
            per_pro_ani_shu = com_per_pro_ani(bea_lat_shu_ani_tri, obj.lat_thr);
            save(obj.fil_pat_sam, 'per_pro_ani_shu', '-append')
        end
        function app_pro_dat(obj)
            load(obj.fil_pat_exp(1), 'n_con', 'n_tri_con')
            load(obj.fil_pat_sam, 'bea_lat_ani_tri')
            n_ani = length(obj.fil_pat_rec);
            per_pro_con = com_per_pro_con(n_con, bea_lat_ani_tri, obj.lat_thr);
            bea_lat_shu_ani_tri = nan(n_ani, n_con*n_tri_con);
            for i = 1:n_ani
                load(obj.fil_pat_rec(i), 'bea_lat_shu')
                bea_lat_shu_ani_tri(i, :) = bea_lat_shu';
            end
            per_pro_ani_shu = com_per_pro_ani(bea_lat_shu_ani_tri, obj.lat_thr);
            save(obj.fil_pat_sam, 'per_pro_con', 'per_pro_ani_shu', '-append')
            %
            plo_pro(per_pro_con, per_pro_ani_shu)
            export_fig(char(obj.fil_pat_fig_pro))
        end
        function app_n_ani(obj)
            n_ani = length(obj.fil_pat_rec);
            save(obj.fil_pat_sam, 'n_ani', '-append')
        end
        function app_rat_tri_dat(obj)
            load(obj.fil_pat_exp(1), 'n_con', 'sti_ons', 'n_tri_con')
            load(obj.fil_pat_rec(1), 'rat_tim')
            load(obj.fil_pat_sam, 'rat_tim_ani_par')
            rat_fra_sta_par_con = cell(n_con, 1);
            for i = 1:n_con
                [rat_fra_sta_par_con{i}, tim_tri_bin] = com_rat_fra_sta_par_sam(rat_tim, rat_tim_ani_par, ...
                    sti_ons((i - 1)*n_tri_con + 1:i*n_tri_con), obj.bas_dur_beh, obj.res_dur_beh);
            end
            save(obj.fil_pat_sam, 'rat_fra_sta_par_con', 'tim_tri_bin', '-append')
        end
        function app_lat(obj)
            load(obj.fil_pat_exp(1), 'n_con')
            n_ani = length(obj.fil_pat_rec);
            n_thr = 3;
            %
            per_cel_thr_con_sid_ani = cell(n_thr, 1);
            p_val_thr_con = cell(n_thr, 1);
            lat_ind_thr_con_ani = cell(n_thr, 1);
            for k = 1:n_thr
                per_cel_thr_con_sid_ani{k} = nan(n_con, 2, n_ani);
                lat_ind_thr_con_ani{k} = nan(n_con, n_ani);
                for i = 1:n_ani
                    load(obj.fil_pat_rec(i), 'per_cel_thr_con_sid', 'lat_ind_thr_con')
                    per_cel_thr_con_sid_ani{k}(:, :, i) = per_cel_thr_con_sid{k};
                    lat_ind_thr_con_ani{k}(:, i) = lat_ind_thr_con{k};
                end
                p_val_thr_con{k} = nan(n_con, 1);
                for i = 1:n_con
                    [~, p_val_thr_con{k}(i)] = ttest(per_cel_thr_con_sid_ani{k}(i, 1, :), per_cel_thr_con_sid_ani{k}(i, 2, :));
                end
            end
            save(obj.fil_pat_sam, 'per_cel_thr_con_sid_ani', 'p_val_thr_con', 'lat_ind_thr_con_ani', '-append')
        end
        function app_rat_con_bin_sta_par(obj)
            load(obj.fil_pat_exp(1), 'sti_ons', 'n_tri_con')
            load(obj.fil_pat_rec(1), 'rat_tim', 'rec_tai_ang_uni_fra_sta_con')
            n_ani = length(obj.fil_pat_rec);
            [~, ~, n_con] = size(rec_tai_ang_uni_fra_sta_con);
            %%%%%%%%%%%%%%%%%%
            n_bin = length(rat_tim);
            rat_tim_ani_par = nan(n_bin, n_ani, obj.n_par);
            for i = 1:n_ani
                load(obj.fil_pat_rec(i), 'rat_bin_par')
                rat_tim_ani_par(:, i, :) = reshape(rat_bin_par, n_bin, 1, obj.n_par);
            end
            rat_con_bin_sta_par = cell(n_con, 1);
            for i = 1:n_con
                [rat_con_bin_sta_par{i}, tim_tri_bin] = com_rat_fra_sta_par_sam(rat_tim, rat_tim_ani_par, ...
                    sti_ons((i - 1)*n_tri_con + 1:i*n_tri_con), obj.bas_dur_beh, obj.res_dur_beh);
            end
            save(obj.fil_pat_sam, 'rat_con_bin_sta_par', '-append')
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% figures
            fon_siz = 24;
            plo_beh(n_con, tim_tri_bin, rat_con_bin_sta_par, fon_siz, obj.col_rat_ave, obj.col_sti_ave, obj.y_lab, obj.con, obj.tit, n_ani, obj.n_par)
            export_fig(char(obj.fil_pat_fig_beh_bin))
        end
        function app_tai_rat_hig_bin_sta(obj)
            load(obj.fil_pat_rec(1), 'rat_tim')
            n_bin = length(rat_tim);
            n_sta = 2;
            tai_rat_hig_bin_sta = nan(n_bin, n_sta);
            tai_rat_hig_bin_ani = nan(n_bin, obj.n_ani);
            for i = 1:obj.n_ani
                load(obj.fil_pat_rec(i), 'tai_rat_hig')
                tai_rat_hig_bin_ani(:, i) = tai_rat_hig;
            end
            dim = 2;
            [tai_rat_hig_bin_sta(:, 1), ~, tai_rat_hig_bin_sta(:, 2)] = com_sta(tai_rat_hig_bin_ani, dim);
            save(obj.fil_pat_sam, 'tai_rat_hig_bin_sta', '-append')
        end
        function app_rat_sti_win(obj)
            mat_fil_exp = matfile(obj.fil_pat_exp(1));
            n_tri_con = mat_fil_exp.n_tri_con;
            isi= mat_fil_exp.isi;
            %
            mat_fil_rec = matfile(obj.fil_pat_rec(1));
            tim_bin = mat_fil_rec.tim_bin;
            %
            mat_fil_sam = matfile(obj.fil_pat_sam);
            rat_tim_ani_par = mat_fil_sam.rat_tim_ani_par;
            ave_rat_win_ani_par = mat_fil_sam.ave_rat_win_ani_par;
            %
            win_siz_sti = n_tri_con*isi;
            poi_sti = ext_poi_sti(obj.fil_pat_exp(1));
            [ave_rat_sti_win_ani_par, ~, n_win] = com_ave_rat_win_ani_par(tim_bin, ...
                rat_tim_ani_par, win_siz_sti, poi_sti);
            p_sti_com_par = nan(n_win, obj.n_par);
            ave_rat_bas_win_ani_par = ave_rat_win_ani_par(2:end - 1, :, :);
            for i = 1:obj.n_par
                for j = 1:n_win
                    p_sti_com_par(j, i) = signrank(ave_rat_bas_win_ani_par(j, :, i), ...
                        ave_rat_sti_win_ani_par(j, :, i));
                end
            end
            %
            win_siz_sti_hal = win_siz_sti/2;
            poi_sti_hal = ext_poi_sti_hal(obj.fil_pat_exp(1));
            ave_rat_sti_hal_win_ani_par = com_ave_rat_win_ani_par(tim_bin, rat_tim_ani_par, ...
                win_siz_sti_hal, poi_sti_hal);
            p_sti_hal_com_par = nan(n_win, obj.n_par);
            for i = 1:obj.n_par
                for j = 1:n_win
                    p_sti_hal_com_par(j, i) = signrank(ave_rat_bas_win_ani_par(j, :, i), ...
                        ave_rat_sti_hal_win_ani_par(j, :, i));
                end
            end
            save(obj.fil_pat_sam, 'poi_sti', 'ave_rat_bas_win_ani_par', ...
                'ave_rat_sti_win_ani_par', 'p_sti_com_par', ...
                'poi_sti_hal', 'ave_rat_sti_hal_win_ani_par', 'p_sti_hal_com_par', '-append')
        end
        function app_pcx_ave(obj)
            n_par_pcx = obj.n_par - 1;
            pcx_par_fra_ani = cell(n_par_pcx, 1);
            load(obj.fil_pat_rec(1), 'fra_tim_uni', 'rec_tai_ang_uni_fra_sta_con')
            n_fra = length(fra_tim_uni);
            pcx_par_fra_ani_con = cell(n_par_pcx, 1);
            [n_fra_con, ~, n_con] = size(rec_tai_ang_uni_fra_sta_con);
            for k = 1:n_par_pcx
                pcx_par_fra_ani{k} = nan(n_fra, obj.n_ani);
                pcx_par_fra_ani_con{k} = nan(n_fra_con, obj.n_ani, n_con);
                for i = 1:obj.n_ani
                    load(obj.fil_pat_rec(i), 'pcx_uni_fra_par', 'rec_pcx_uni_par_fra_sta_con')
                    pcx_par_fra_ani{k}(:, i) = pcx_uni_fra_par(:, k);
                    for j = 1:n_con
                        pcx_par_fra_ani_con{k}(:, i, j) = rec_pcx_uni_par_fra_sta_con{k}(:, 1, j);
                    end
                end
            end
            ave_pcx_par_fra_sta = cell(n_par_pcx, 1);
            n_sta = 2;
            dim = 2;
            pcx_par_fra_sta_con = cell(n_par_pcx, 1);
            for i = 1:n_par_pcx
                ave_pcx_par_fra_sta{i} = nan(n_fra, n_sta);
                [ave_pcx_par_fra_sta{i}(:, 1), ~, ave_pcx_par_fra_sta{i}(:, 2)] = com_sta(pcx_par_fra_ani{i}, dim);
                pcx_par_fra_sta_con{i} = nan(n_fra_con, n_sta, n_con);
                for j = 1:n_con
                    [pcx_par_fra_sta_con{i}(:, 1, j), ~, pcx_par_fra_sta_con{i}(:, 2, j)] = com_sta(pcx_par_fra_ani_con{i}(:, :, j), dim);
                end
            end
            save(obj.fil_pat_sam, 'ave_pcx_par_fra_sta', 'pcx_par_fra_sta_con', '-append')
        end
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% neural
        function app_ave_neu(obj) % pixel
            global n_con
            cal_ima_ref_ani_row_col_con = cell(obj.n_ani, 1);
            dff_bou_ani_row_col = cell(obj.n_ani, 1);
            dff_raw_ani_con_row_col = cell(obj.n_ani, n_con);
            dff_ani_con_fra_cel = cell(obj.n_ani, n_con);
            for i = 1:obj.n_ani
                rec_fun_i = str2func(['rec_fun.' convertStringsToChars(obj.ani(i))]);
                sti = rec_fun_i();
                if sti.ali_cax
                    rec_fil = matfile(sti.fil_pat_rec);
                    cal_ima_ref_ani_row_col_con{i} = rec_fil.cal_ima_ref_con;
                    if sti.tai
                        dff_bou_ani_row_col{i} = rec_fil.dff_ave_spo_bou_row_col;
                    end
                    dff_raw_con_row_col = rec_fil.dff_raw_con_row_col;
                    for j = 1:n_con
                        dff_raw_ani_con_row_col{i, j} = dff_raw_con_row_col{j};
                    end
                end
            end
            save(obj.fil_pat_sam, 'cal_ima_ref_ani_row_col_con', 'dff_raw_ani_con_row_col', ...
                'dff_ani_con_fra_cel', 'dff_bou_ani_row_col', '-append')
        end
        %
        function app_dff_all_sam_ave(obj)
            n_cel = struct('sha', 0, 'abl', 0);
            for ani_num = 1:obj.n_ani
                disp(ani_num)
                rec_fun_i = str2func(['rec_fun.' convertStringsToChars(obj.ani(ani_num))]);
                sti = rec_fun_i();
                if sti.ali_cax && sti.tai
                    rec_fil = matfile(sti.fil_pat_rec);
                    n_cel_tem = rec_fil.n_cel;
                    if ani_num < 17
                        if isstruct(n_cel_tem)
                            n_cel.sha = n_cel.sha + n_cel_tem.raw;
                        else
                            n_cel.sha = n_cel.sha + n_cel_tem;
                        end
                    else
                        if isstruct(n_cel_tem)
                            n_cel.abl = n_cel.abl + n_cel_tem.raw;
                        else
                            n_cel.abl = n_cel.abl + n_cel_tem;
                        end
                    end
                end
            end
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            save(obj.fil_pat_sam, 'n_cel', '-append')
            global n_reg_for n_con n_win n_bin_mag_cor_coe n_cro_tot n_epo n_blo
            [n_cel_reg_ani, n_cel_reg] = ext_n_cel_reg_ani(obj);
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% inh exc
            act_reg_ani_con_fra_cel = [];
            act_reg_con_fra_cel = [];
            act_reg_fra_sta_con = [];
            %
            fie_num = {'dff'; 'raw'; 'tri'; 'all'};
            act_reg_ani_con_fra_cel = ext_act_reg_ani_con_fra_cel(obj, ...
                'act_reg_con_fra_cel', fie_num, act_reg_ani_con_fra_cel);
            [act_reg_con_fra_cel, act_reg_fra_sta_con] = ext_act_reg_con_fra_cel(obj, ...
                act_reg_ani_con_fra_cel, fie_num, act_reg_con_fra_cel, ...
                act_reg_fra_sta_con);
            %
            fie_num = {'dff'; 'raw'; 'tri'; 'inh'};
            act_reg_ani_con_fra_cel = ext_act_reg_ani_con_fra_cel(obj, ...
                'act_reg_con_fra_cel', fie_num, act_reg_ani_con_fra_cel);
            [act_reg_con_fra_cel, act_reg_fra_sta_con] = ext_act_reg_con_fra_cel(obj, ...
                act_reg_ani_con_fra_cel, fie_num, act_reg_con_fra_cel, ...
                act_reg_fra_sta_con);
            %
            fie_num = {'dff'; 'raw'; 'tri'; 'exc'};
            act_reg_ani_con_fra_cel = ext_act_reg_ani_con_fra_cel(obj, ...
                'act_reg_con_fra_cel', fie_num, act_reg_ani_con_fra_cel);
            [act_reg_con_fra_cel, act_reg_fra_sta_con] = ext_act_reg_con_fra_cel(obj, ...
                act_reg_ani_con_fra_cel, fie_num, act_reg_con_fra_cel, ...
                act_reg_fra_sta_con);
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% uni
            act_reg_con_win_uni.dff.raw.tri.cel = ...
                cellfun(@(act_con_win) cell(n_con, n_win.tri), ...
                cell(n_reg_for, 1), 'UniformOutput', false);
            act_reg_con_win_uni.frc.cel = cellfun(@(act_con_win) cell(n_con, n_win.tri), ...
                cell(n_reg_for, 1), 'UniformOutput', false);
            %
            act_reg_con_win_uni.dff.raw.tri.ani = ...
                cellfun(@(act_con_win) cell(n_con, n_win.tri), ...
                cell(n_reg_for, 1), 'UniformOutput', false);
            act_reg_con_win_uni.frc.ani = cellfun(@(act_con_win) cell(n_con, n_win.tri), ...
                cell(n_reg_for, 1), 'UniformOutput', false);
            %%%%%%%%%%%%%%%%%%%%
            fra_reg_con_ani.dff.raw.tri.inh = cell(n_reg_for, n_con);
            fra_reg_con_ani.dff.raw.tri.exc = cell(n_reg_for, n_con);
            %
            fra_reg_con_ani.frc.inh = cell(n_reg_for, n_con);
            fra_reg_con_ani.frc.exc = cell(n_reg_for, n_con);
            %%%
            for k = 1:n_reg_for
                for i = 1:n_con
                    cel_ind = 1;
                    for l = 1:n_win.tri
                        act_reg_con_win_uni.dff.raw.tri.ani{k}{i, l} = nan(obj.n_ani, 1);
                        act_reg_con_win_uni.frc.ani{k}{i, l} = nan(obj.n_ani, 1);
                    end
                    %%%
                    fra_reg_con_ani.dff.raw.tri.inh{k, i} = nan(obj.n_ani, 1);
                    fra_reg_con_ani.dff.raw.tri.exc{k, i} = nan(obj.n_ani, 1);
                    %
                    fra_reg_con_ani.frc.inh{k, i} = nan(obj.n_ani, 1);
                    fra_reg_con_ani.frc.exc{k, i} = nan(obj.n_ani, 1);
                    for j = 1:obj.n_ani
                        if obj.bri_ani(j) && obj.cel_det_ani(j)
                            rec_fun_j = ...
                                str2func(['rec_fun.' convertStringsToChars(obj.ani(j))]);
                            sti = rec_fun_j();
                            rec_fil = matfile(sti.fil_pat_rec);
                            %%%%%%%%%%%%%%
                            fra_reg_con = rec_fil.fra_reg_con;
                            fra_reg_con_ani.dff.raw.tri.inh{k, i}(j) = ...
                                fra_reg_con.dff.raw.tri.inh(k, i);
                            fra_reg_con_ani.dff.raw.tri.exc{k, i}(j) = ...
                                fra_reg_con.dff.raw.tri.exc(k, i);
                            %
                            fra_reg_con_ani.frc.inh{k, i}(j) = fra_reg_con.frc.inh(k, i);
                            fra_reg_con_ani.frc.exc{k, i}(j) = fra_reg_con.frc.exc(k, i);
                            %%%%%%%%%%%%%%
                            act_jjj_reg_con_win_cel = rec_fil.act_reg_con_win_cel;
                            for l = 1:n_win.tri
                                act_reg_con_win_uni.dff.raw.tri.cel{k}{i, l}(cel_ind:...
                                    cel_ind + n_cel_reg_ani.rem(k, j) - 1, 1) = ...
                                    act_jjj_reg_con_win_cel.dff.raw.tri.all{k}{i, l};%%!!!!!!
                                act_reg_con_win_uni.frc.cel{k}{i, l}(cel_ind:...
                                    cel_ind + n_cel_reg_ani.rem(k, j) - 1, 1) = ...
                                    act_jjj_reg_con_win_cel.frc.all{k}{i, l};
                                %
                                act_reg_con_win = rec_fil.act_reg_con_win;
                                act_reg_con_win_uni.dff.raw.tri.ani{k}{i, l}(j) = ...
                                    act_reg_con_win.dff.raw.tri.all{k}(i, l);%%!!!!!!
                                act_reg_con_win_uni.frc.ani{k}{i, l}(j) = ...
                                    act_reg_con_win.frc.all{k}(i, l);
                            end
                            cel_ind = cel_ind + n_cel_reg_ani.rem(k, j);
                        end
                    end
                end
            end
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% robustness
            fie_num = {'dff'; 'raw'; 'tri'; 'all'};
            pcc_mea_reg_xri_xri = [];
            pcc_ave_reg_con_ani = [];
            euc_dis_mea_reg_xri_xri = [];
            euc_dis_ave_reg_con_ani = [];
            [pcc_mea_reg_xri_xri, pcc_ave_reg_con_ani, euc_dis_mea_reg_xri_xri, ...
                euc_dis_ave_reg_con_ani] = ext_pcc_mea_reg_xri_xri(obj.bri_ani, ...
                obj.cel_det_ani, obj.fil_pat_rec, fie_num, ...
                pcc_mea_reg_xri_xri, pcc_ave_reg_con_ani, ...
                euc_dis_mea_reg_xri_xri, euc_dis_ave_reg_con_ani);
            %
            fie_num = {'frc'; 'all'};
            [pcc_mea_reg_xri_xri, pcc_ave_reg_con_ani, euc_dis_mea_reg_xri_xri, ...
                euc_dis_ave_reg_con_ani] = ext_pcc_mea_reg_xri_xri(obj.bri_ani, ...
                obj.cel_det_ani, obj.fil_pat_rec, fie_num, ...
                pcc_mea_reg_xri_xri, pcc_ave_reg_con_ani, ...
                euc_dis_mea_reg_xri_xri, euc_dis_ave_reg_con_ani);
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            ofr_reg_win_cel = cell(n_reg_for, n_epo.ong);
            ofr_reg_win_ani = cell(n_reg_for, n_epo.ong);
            for k = 1:n_reg_for
                for l = 1:n_epo.ong
                    ofr_reg_win_ani{k, l} = nan(obj.n_ani, 1);
                end
                cel_ind = 1;
                for j = 1:obj.n_ani
                    if obj.bri_ani(j) && obj.cel_det_ani(j)
                        rec_fun_j = ...
                            str2func(['rec_fun.' convertStringsToChars(obj.ani(j))]);
                        sti = rec_fun_j();
                        rec_fil = matfile(sti.fil_pat_rec);
                        log_cel_reg = rec_fil.log_cel_reg;
                        if isprop(rec_fil, 'ong_fir_rat_cel_win')
                            ong_fir_rat_cel_win = rec_fil.ong_fir_rat_cel_win;
                        else
                            ong_fir_rat_cel_win = rec_fil.ofr_cel_win;
                        end
                        %
                        for l = 1:n_epo.ong
                            ofr_reg_win_cel{k, l}(cel_ind:...
                                cel_ind + n_cel_reg_ani.rem(k, j) - 1, 1) ...
                                = ong_fir_rat_cel_win(log_cel_reg.rem(:, k), l);
                            %
                            ofr_reg_win_ani{k, l}(j) = rec_fil.ofr_reg_win(k, l);
                        end
                        cel_ind = cel_ind + n_cel_reg_ani.rem(k, j);
                    end
                end
            end
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% synch
            per_pai_epo_reg_bin_ani = ini_cel_arr(n_epo.tot, n_reg_for, n_bin_mag_cor_coe, obj.n_ani);
            ske_epo_reg_ani = ini_cel_arr(n_epo.tot, n_reg_for, obj.n_ani, 1);
            acc_epo_reg_ani = ini_cel_arr(n_epo.tot, n_reg_for, obj.n_ani, 1);
            %
            per_pai_epo_xre_bin_ani = ini_cel_arr(n_epo.tot, n_cro_tot, n_bin_mag_cor_coe, obj.n_ani);
            ske_epo_xre_ani = ini_cel_arr(n_epo.tot, n_cro_tot, obj.n_ani, 1);
            acc_epo_xre_ani = ini_cel_arr(n_epo.tot, n_cro_tot, obj.n_ani, 1);
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            cor_coe_epo_reg_blo_ani.all = ini_cel_arr(n_epo.tot, n_reg_for, n_blo.wre, obj.n_ani);
            cor_coe_epo_reg_blo_ani.pos = ini_cel_arr(n_epo.tot, n_reg_for, n_blo.wre, obj.n_ani);
            cor_coe_epo_reg_blo_ani.neg = ini_cel_arr(n_epo.tot, n_reg_for, n_blo.wre, obj.n_ani);
            %
            cor_coe_reg_blo_ani.all = ini_cel_arr(1, n_reg_for, n_blo.wre, obj.n_ani);
            cor_coe_reg_blo_ani.pos = ini_cel_arr(1, n_reg_for, n_blo.wre, obj.n_ani);
            cor_coe_reg_blo_ani.neg = ini_cel_arr(1, n_reg_for, n_blo.wre, obj.n_ani);
            %%%%%%%%%%%
            xcc_epo_blo_ani.all = ini_cel_arr(n_epo.tot, 1, n_blo.xre, obj.n_ani);
            xcc_epo_blo_ani.pos = ini_cel_arr(n_epo.tot, 1, n_blo.xre, obj.n_ani);
            xcc_epo_blo_ani.neg = ini_cel_arr(n_epo.tot, 1, n_blo.xre, obj.n_ani);
            %
            xcc_blo_ani.all = nan(n_blo.xre, obj.n_ani);
            xcc_blo_ani.pos = nan(n_blo.xre, obj.n_ani);
            xcc_blo_ani.neg = nan(n_blo.xre, obj.n_ani);
            for i = 1:obj.n_ani
                if obj.bri_ani(i) && obj.cel_det_ani(i)
                    rec_fun_i = str2func(['rec_fun.' convertStringsToChars(obj.ani(i))]);
                    sti = rec_fun_i();
                    rec_fil = matfile(sti.fil_pat_rec);
                    %
                    for k = 1:n_epo.tot
                        for j = 1:n_reg_for
                            per_pai_epo_reg_bin = rec_fil.per_pai_epo_reg_bin;
                            per_pai_epo_reg_bin_ani{k, j}(:, i) = per_pai_epo_reg_bin{k, j};
                            ske_epo_reg = rec_fil.ske_epo_reg;
                            ske_epo_reg_ani{k, j}(i) = ske_epo_reg{k, j};
                            acc_epo_reg = rec_fil.acc_epo_reg;
                            acc_epo_reg_ani{k, j}(i) = acc_epo_reg(k, j);
                            %
                            cor_coe_epo_reg_blo = rec_fil.cor_coe_epo_reg_blo;
                            cor_coe_epo_reg_blo_ani.all{k, j}(:, i) = cor_coe_epo_reg_blo.all{k, j};
                            cor_coe_epo_reg_blo_ani.pos{k, j}(:, i) = cor_coe_epo_reg_blo.pos{k, j};
                            cor_coe_epo_reg_blo_ani.neg{k, j}(:, i) = cor_coe_epo_reg_blo.neg{k, j};
                        end
                        %
                        xcc_epo_blo = rec_fil.xcc_epo_blo;
                        xcc_epo_blo_ani.all{k, 1}(:, i) = xcc_epo_blo.all{k, 1};
                        xcc_epo_blo_ani.pos{k, 1}(:, i) = xcc_epo_blo.pos{k, 1};
                        xcc_epo_blo_ani.neg{k, 1}(:, i) = xcc_epo_blo.neg{k, 1};
                        %%%%%%%%%%%%%%%%%
                        for j = 1:n_cro_tot
                            per_pai_epo_xre_bin = rec_fil.per_pai_epo_xre_bin;
                            per_pai_epo_xre_bin_ani{k, j}(:, i) = per_pai_epo_xre_bin{k, j};
                            ske_epo_xre = rec_fil.ske_epo_xre;
                            ske_epo_xre_ani{k, j}(i) = ske_epo_xre{k, j};
                            acc_epo_xre = rec_fil.acc_epo_xre;
                            acc_epo_xre_ani{k, j}(i) = acc_epo_xre(k, j);
                        end
                    end
                    %%%%
                    for j = 1:n_reg_for
                        cor_coe_reg_blo = rec_fil.cor_coe_reg_blo;
                        cor_coe_reg_blo_ani.all{1, j}(:, i) = cor_coe_reg_blo.all{1, j};
                        cor_coe_reg_blo_ani.pos{1, j}(:, i) = cor_coe_reg_blo.pos{1, j};
                        cor_coe_reg_blo_ani.neg{1, j}(:, i) = cor_coe_reg_blo.neg{1, j};
                    end
                    %
                    xcc_blo = rec_fil.xcc_blo;
                    xcc_blo_ani.all(:, i) = xcc_blo.all;
                    xcc_blo_ani.pos(:, i) = xcc_blo.pos;
                    xcc_blo_ani.neg(:, i) = xcc_blo.neg;
                end
            end
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            save(obj.fil_pat_sam, 'n_cel_reg_ani', 'n_cel_reg', 'fra_reg_con_ani', ...
                'act_reg_con_fra_cel', 'act_reg_fra_sta_con', 'act_reg_con_win_uni', ...
                ...
                'pcc_mea_reg_xri_xri', 'pcc_ave_reg_con_ani', ...
                'euc_dis_mea_reg_xri_xri', 'euc_dis_ave_reg_con_ani', ...
                ...
                'ofr_reg_win_ani', ...
                ...
                'per_pai_epo_reg_bin_ani', 'ske_epo_reg_ani', 'acc_epo_reg_ani', ...
                'per_pai_epo_xre_bin_ani', 'ske_epo_xre_ani', 'acc_epo_xre_ani', ...
                ...
                'cor_coe_epo_reg_blo_ani', 'cor_coe_reg_blo_ani', 'xcc_epo_blo_ani', 'xcc_blo_ani', ...
                '-append')

            con_fil = matfile('\\home.ansatt.ntnu.no\kadiram\Documents\MATLAB\con_esp.mat');
            n_reg_for = con_fil.n_reg_for;
            act_reg_tri_win = cell(n_reg_for, 1);
            n_tri = con_fil.n_tri;
            n_win = con_fil.n_win;
            for reg = 1:n_reg_for
                disp(reg)
                act_reg_tri_win{reg} = [];
                for ani_num = 1:obj.n_ani
                    disp(ani_num)
                    rec_fun = str2func(['rec_fun.' convertStringsToChars(obj.ani(ani_num))]);
                    tap = rec_fun();
                    if tap.tai && tap.bri
                        mat_fil_rec = matfile(obj.fil_pat_rec(ani_num));
                        dff_reg_tri_win = mat_fil_rec.act_reg_tri_win;
                        if isempty(dff_reg_tri_win{reg})
                            dff_reg_tri_win{reg} = nan(n_tri.vrs, n_win.tri);
                        end
                        act_reg_tri_win{reg} = [act_reg_tri_win{reg}; dff_reg_tri_win{reg}];
                    end
                end
            end
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            save(obj.fil_pat_sam, 'act_reg_tri_win', '-append')


            % motor
            dff_cel_fra.bou.all = [];
            for ani_num = 1:obj.n_ani
                disp(ani_num)
                rec_fun_i = str2func(['rec_fun.' convertStringsToChars(obj.ani(ani_num))]);
                sti = rec_fun_i();
                if sti.ali_cax && sti.tai
                    rec_fil = matfile(sti.fil_pat_rec);
                    act_cel_fra = rec_fil.dff_cel_fra;
                    dff_cel_fra.bou.all = [dff_cel_fra.bou.all; act_cel_fra.bou.all];
                end
            end
            [~, n_cel_reg] = ext_n_cel_reg_ani(obj);
            n_cel = n_cel_reg.raw(1);
            k_max = 5;
            clu_cel_k.bou.all = nan(n_cel, k_max);
            parpool
            options = statset('UseParallel', 1);
            ioi_k.bou.all = nan(1, k_max);
            k_sta = 5;
            for k = k_sta:k_max
                disp(k)
                [clu_cel_k.bou.all(:, k), ~, sum_dis_clu, D] = kmeans(dff_cel_fra.bou.all, k, ...
                    'Distance', 'correlation', 'Replicates', 50, 'Options', options);
                ioi_k.bou.all(1, k) = sum(sum_dis_clu)/mean(sum(D));
            end
            dff_cel_fra.bou.spo = [];
            for ani_num = 1:obj.n_ani
                disp(ani_num)
                rec_fun_i = str2func(['rec_fun.' convertStringsToChars(obj.ani(ani_num))]);
                sti = rec_fun_i();
                if sti.ali_cax && sti.tai
                    rec_fil = matfile(sti.fil_pat_rec);
                    act_cel_fra = rec_fil.dff_cel_fra;
                    dff_cel_fra.bou.spo = [dff_cel_fra.bou.spo; act_cel_fra.bou.spo];
                end
            end
            clu_cel_k.bou.spo = nan(n_cel, k_max);
            ioi_k.bou.spo = nan(1, k_max);
            for k = k_sta:k_max
                disp(k)
                [clu_cel_k.bou.spo(:, k), ~, sum_dis_clu, D] = kmeans(dff_cel_fra.bou.spo, k, ...
                    'Distance', 'correlation', 'Replicates', 50, 'Options', options);
                ioi_k.bou.spo(1, k) = sum(sum_dis_clu)/mean(sum(D));
            end
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            save(obj.fil_pat_sam, 'n_cel_reg', 'dff_cel_fra', 'clu_cel_k', 'ioi_k', '-append')


            x_cel = [];
            y_cel = [];
            for ani_num = 1:obj.n_ani
                disp(ani_num)
                rec_fun_i = str2func(['rec_fun.' convertStringsToChars(obj.ani(ani_num))]);
                sti = rec_fun_i();
                rec_fil = matfile(sti.fil_pat_rec);
                x_cel = [x_cel; rec_fil.x_cel];
                y_cel = [y_cel; rec_fil.y_cel];
            end
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            save(obj.fil_pat_sam, 'x_cel', 'y_cel', '-append')


            sam_fil = matfile(obj.fil_pat_sam);
            x_cel.abs = sam_fil.x_cel;
            y_cel.abs = sam_fil.y_cel;
            x_cel.rel = [];
            y_cel.rel = [];
            for ani_num = 1:obj.n_ani
                disp(ani_num)
                rec_fun_i = str2func(['rec_fun.' convertStringsToChars(obj.ani(ani_num))]);
                sti = rec_fun_i();
                rec_fil = matfile(sti.fil_pat_rec);
                aps_cel = rec_fil.x_cel;
                x_cel.rel = [x_cel.rel; aps_cel.rel];
                aps_cel = rec_fil.y_cel;
                y_cel.rel = [y_cel.rel; aps_cel.rel];
            end
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            save(obj.fil_pat_sam, 'x_cel', 'y_cel', '-append')

            sam_fil = matfile(obj.fil_pat_sam);
            x_cel = sam_fil.x_cel;
            y_cel = sam_fil.y_cel;
            x_cel.res = [];
            y_cel.res = [];
            for ani_num = 1:obj.n_ani
                disp(ani_num)
                rec_fun_i = str2func(['rec_fun.' convertStringsToChars(obj.ani(ani_num))]);
                sti = rec_fun_i();
                rec_fil = matfile(sti.fil_pat_rec);
                aps_cel = rec_fil.x_cel;
                x_cel.res = [x_cel.res; aps_cel.res];
                aps_cel = rec_fil.y_cel;
                y_cel.res = [y_cel.res; aps_cel.res];
            end
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            save(obj.fil_pat_sam, 'x_cel', 'y_cel', '-append')


            log_cel_con.exc = [];
            log_cel_con.inh = [];
            for ani_num = 1:obj.n_ani
                disp(ani_num)
                rec_fun_i = str2func(['rec_fun.' convertStringsToChars(obj.ani(ani_num))]);
                sti = rec_fun_i();
                rec_fil = matfile(sti.fil_pat_rec);
                boo_cel_con = rec_fil.log_cel_con;
                log_cel_con.exc = [log_cel_con.exc; boo_cel_con.exc];
                log_cel_con.inh = [log_cel_con.inh; boo_cel_con.inh];
            end
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            save(obj.fil_pat_sam, 'log_cel_con', '-append')
        end
        % unincorporated
        function app_par(obj)
            con_fil = matfile('\\home.ansatt.ntnu.no\kadiram\Documents\MATLAB\con_esp.mat');
            n_blo = con_fil.n_blo;
            pcc_blo_ani.all = nan(n_blo.xre, obj.n_ani);
            pcc_blo_ani.pos = nan(n_blo.xre, obj.n_ani);
            pcc_blo_ani.neg = nan(n_blo.xre, obj.n_ani);
            for ani_num = 1:obj.n_ani
                disp(ani_num)
                rec_fun_i = str2func(['rec_fun.' convertStringsToChars(obj.ani(ani_num))]);
                sti = rec_fun_i();
                rec_fil = matfile(sti.fil_pat_rec);
                pcc_blo = rec_fil.pcc_blo;
                pcc_blo_ani.all(:, ani_num) = pcc_blo.all;
                pcc_blo_ani.pos(:, ani_num) = pcc_blo.pos;
                pcc_blo_ani.neg(:, ani_num) = pcc_blo.neg;
            end
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            save(obj.fil_pat_sam, 'pcc_blo_ani', '-append')
        end
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% axo-cel
        function app_roi_r(obj)
            log_ani_pla_icx_row_col = cell(obj.n_ani, 1);
            r_ani_pla_icx_row_col = cell(obj.n_ani, 1);
            con_fil = matfile('\\home.ansatt.ntnu.no\kadiram\Documents\MATLAB\con_esp.mat');
            per_cel_bin_ani = nan(con_fil.n_bin_cor_coe, obj.n_ani);
            r_cel = [];
            for i = 1:obj.n_ani
                rec_fun_i = str2func(['rec_fun.' convertStringsToChars(obj.ani(i))]);
                sti = rec_fun_i();
                if sti.ali_cax
                    rec_fil = matfile(sti.fil_pat_rec);
                    log_pla_icx_row_col = rec_fil.log_pla_icx_row_col;
                    log_ani_pla_icx_row_col{i} = log_pla_icx_row_col.glu;
                    r_ani_pla_icx_row_col{i} = rec_fil.r_pla_icx_row_col;
                    %
                    per_cel_bin_ani(:, i) = rec_fil.per_cel_bin;
                    %
                    r_cel = [r_cel; rec_fil.r_cel];
                end
            end
            [pro_ste, r_ste] = ecdf(r_cel);
            %
            n_icx = con_fil.n_icx;
            n_con = con_fil.n_con;
            n_fra = con_fil.n_fra;
            dff_icx_con_fra_ani = ini_cel_arr(n_icx, n_con, n_fra.cal.tri.eig.dff, obj.n_ani);
            for j = 1:n_icx
                for k = 1:n_con
                    for i = 1:obj.n_ani
                        rec_fun_i = str2func(['rec_fun.' convertStringsToChars(obj.ani(i))]);
                        sti = rec_fun_i();
                        if sti.ali_cax
                            rec_fil = matfile(sti.fil_pat_rec);
                            dff_icx_con_fra = rec_fil.dff_icx_con_fra;
                            dff_icx_con_fra_ani{j, k}(:, i) = dff_icx_con_fra{j, k};
                        end
                    end
                end
            end
            %
            [clu_roi_k, ioi_k, n_roi, ~] = com_clu_cel_k(obj);
            %
            x_ani_roi = cell(obj.n_ani, 1);
            y_ani_roi = cell(obj.n_ani, 1);
            z_ani_roi = cell(obj.n_ani, 1);
            for ani_num = 1:obj.n_ani
                disp(ani_num)
                rec_fun_i = str2func(['rec_fun.' convertStringsToChars(obj.ani(ani_num))]);
                sti = rec_fun_i();
                rec_fil = matfile(sti.fil_pat_rec);
                x_ani_roi{ani_num} = rec_fil.x_roi;
                y_ani_roi{ani_num} = rec_fil.y_roi;
                z_ani_roi{ani_num} = rec_fil.z_roi;
            end
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            dff_roi_fra = [];
            log_fie_roi.inh = logical([]);
            log_fie_roi.exc = logical([]);
            res_ani_roi = cell(obj.n_ani, 1);
            con_fil = matfile('\\home.ansatt.ntnu.no\kadiram\Documents\MATLAB\con_esp.mat');
            n_blo = con_fil.n_blo;
            fra_blo_ani.ros_cau.exc = nan(n_blo.for.ros_cau, obj.n_ani);
            fra_blo_ani.ros_cau.inh = nan(n_blo.for.ros_cau, obj.n_ani);
            fra_blo_ani.dor_ven.exc = nan(n_blo.for.dor_ven, obj.n_ani);
            fra_blo_ani.dor_ven.inh = nan(n_blo.for.dor_ven, obj.n_ani);
            for ani_num = 1:obj.n_ani
                disp(ani_num)
                rec_fun_i = str2func(['rec_fun.' convertStringsToChars(obj.ani(ani_num))]);
                sti = rec_fun_i();
                rec_fil = matfile(sti.fil_pat_rec);
                %
                act_cel_fra = rec_fil.dff_roi_fra;
                dff_roi_fra = [dff_roi_fra; act_cel_fra];
                log_roi = rec_fil.log_roi;
                log_fie_roi.inh = [log_fie_roi.inh; log_roi.all.srt.inh];
                log_fie_roi.exc = [log_fie_roi.exc; log_roi.all.srt.exc];
                %
                res_ani_roi{ani_num} = rec_fil.res_roi;
                fra_blo = rec_fil.fra_blo;
                fra_blo_ani.ros_cau.exc(:, ani_num) = fra_blo.ros_cau.exc;
                fra_blo_ani.ros_cau.inh(:, ani_num) = fra_blo.ros_cau.inh;
                fra_blo_ani.dor_ven.exc(:, ani_num) = fra_blo.dor_ven.exc;
                fra_blo_ani.dor_ven.inh(:, ani_num) = fra_blo.dor_ven.inh;
            end
            cor_fie_fie_blo_ani.tai = fin_cor_fie_fie_blo_ani(obj, 'tai');
            cor_fie_fie_blo_ani.spo = fin_cor_fie_fie_blo_ani(obj, 'spo');
            [cum_pro_bin_ani.tai, r_ani.tai, p.tai] = gen_cum_pro_bin_ani(obj, 'tai');
            [cum_pro_bin_ani.spo, r_ani.spo, p.spo] = gen_cum_pro_bin_ani(obj, 'spo');
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            save(obj.fil_pat_sam, 'log_ani_pla_icx_row_col', 'r_ani_pla_icx_row_col', ...
                'dff_icx_con_fra_ani', 'per_cel_bin_ani', 'r_cel', 'pro_ste', 'r_ste', ...
                'n_roi', 'dff_roi_fra', 'clu_roi_k', 'ioi_k', 'x_ani_roi', 'y_ani_roi', ...
                'z_ani_roi', 'res_ani_roi', 'fra_blo_ani', 'cor_fie_fie_blo_ani', 'cum_pro_bin_ani',...
                'r_ani', 'p', 'log_fie_roi', '-append')
        end
        % incorporated
        function app_par_roi_r(obj)
            sam_fil = matfile(obj.fil_pat_sam);
            cor_fie_fie_blo_ani = sam_fil.cor_fie_fie_blo_ani;
            cor_fie_fie_blo_ani.tai = fin_cor_fie_fie_blo_ani(obj, 'tai');
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            save(obj.fil_pat_sam, 'cor_fie_fie_blo_ani', '-append')
        end
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% axo-onl
        function app_axo_onl_omn(obj)
            app_par_tai_all(obj)
            app_par_tai_pix_all(obj)
            app_par_tai(obj)
            app_par_axo_onl(obj)
            sav_fig_bin_sig(obj)
            sav_fig_inh_exc_sin(obj)
        end
        %
        function app_dff_row_con_fra_ani(obj)
            x_ani_bin = cell(obj.n_ani, 1);
            y_ani_bin = cell(obj.n_ani, 1);
            z_ani_bin = cell(obj.n_ani, 1);
            log_bin.dor = [];
            for ani_num = 1:obj.n_ani
                disp(ani_num)
                rec_fun_i = str2func(['rec_fun.' convertStringsToChars(obj.ani(ani_num))]);
                sti = rec_fun_i();
                rec_fil = matfile(sti.fil_pat_rec);
                x_ani_bin{ani_num} = rec_fil.x_bin;
                y_ani_bin{ani_num} = rec_fil.y_bin;
                z_ani_bin{ani_num} = rec_fil.z_bin;
                boo_bin = rec_fil.log_bin;
                log_bin.dor = [log_bin.dor; boo_bin.dor];
            end
            log_bin.dor = logical(log_bin.dor);
            n_bin = size(log_bin.dor, 1);
            
            dff_bin_fra.bou.all = gen_dff_bin_fra(obj, {'bou', 'all'});
            fra_blo_ani.all = gen_fra_blo_ani(obj, 'all');
            fra_blo_ani.vib = gen_fra_blo_ani(obj, 'vib');
            fra_blo_ani.non = gen_fra_blo_ani(obj, 'non');
            log_bin.all = fin_log_bin(obj, 'all');
            log_bin.vib = fin_log_bin(obj, 'vib');
            log_bin.non = fin_log_bin(obj, 'non');
            res_ani_bin.bou.all = gen_res_ani_bin(obj, 'all');
            res_ani_bin.bou.vib = gen_res_ani_bin(obj, 'vib');
            res_ani_bin.bou.non = gen_res_ani_bin(obj, 'non');
            r_blo_ani.tai = gen_r_blo_ani(obj, 'tai');
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            save(obj.fil_pat_sam, 'x_ani_bin', 'y_ani_bin', 'z_ani_bin', 'n_bin', 'fra_blo_ani', ...
                'dff_bin_fra', 'log_bin', 'res_ani_bin', 'r_blo_ani', '-append')

            sam_fil = matfile(obj.fil_pat_sam);
            fra_blo_ani = sam_fil.fra_blo_ani;
            log_bin = sam_fil.log_bin;
            res_ani_bin = sam_fil.res_ani_bin;
            dff_lig_bin_fra = gen_dff_bin_fra(obj, {'lig'});
            disp('dff')
            dff_sho_bin_fra = gen_dff_bin_fra(obj, {'sho'});
            dff_tap_bin_fra = gen_dff_bin_fra(obj, {'tap'});
            fra_blo_ani.lig = gen_fra_blo_ani(obj, 'lig');% doesn't exist !!!
            disp('fra')
            fra_blo_ani.sho = gen_fra_blo_ani(obj, 'sho');
            fra_blo_ani.tap = gen_fra_blo_ani(obj, 'tap');
            log_bin.lig = fin_log_bin_sen(obj, 'lig');
            disp('log')
            log_bin.sho = fin_log_bin_sen(obj, 'sho');
            log_bin.tap = fin_log_bin_sen(obj, 'tap');
            res_ani_bin.lig = gen_res_ani_bin(obj, 'lig');
            disp('res')
            res_ani_bin.sho = gen_res_ani_bin(obj, 'sho');
            res_ani_bin.tap = gen_res_ani_bin(obj, 'tap');
            r_blo_ani.lig = gen_r_blo_ani(obj, 'lig');
            disp('r')
            r_blo_ani.sho = gen_r_blo_ani(obj, 'sho');
            r_blo_ani.tap = gen_r_blo_ani(obj, 'tap');
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            save(obj.fil_pat_sam, 'dff_lig_bin_fra', 'dff_sho_bin_fra', 'dff_tap_bin_fra', ...
                'fra_blo_ani', 'log_bin', 'res_ani_bin', 'r_blo_ani', '-append')
        end
        % incorporated
        function app_par_axo_onl(obj)
            sam_fil = matfile(obj.fil_pat_sam);
            r_blo_ani = sam_fil.r_blo_ani;
            r_blo_ani.ong = gen_r_blo_ani(obj, 'ong');
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            save(obj.fil_pat_sam, 'r_blo_ani', '-append')
        end       
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% cel-onl
        function app_som(obj)
            x_ani_cel = cell(obj.n_ani, 1);
            y_ani_cel = cell(obj.n_ani, 1);
            z_ani_cel = cell(obj.n_ani, 1);
            clu_ani_cel.bou.all = cell(obj.n_ani, 1);
            for ani_num = 1:obj.n_ani
                disp(ani_num)
                rec_fun_i = str2func(['rec_fun.' convertStringsToChars(obj.ani(ani_num))]);
                sti = rec_fun_i();
                if sti.tai
                    rec_fil = matfile(sti.fil_pat_rec);
                    x_cel = rec_fil.x_cel;
                    y_cel = rec_fil.y_cel;
                    z_cel = rec_fil.z_cel;
                    x_ani_cel{ani_num} = x_cel;
                    y_ani_cel{ani_num} = y_cel;
                    z_ani_cel{ani_num} = z_cel;
                    clu_cel_k = rec_fil.clu_cel_k;
                    clu_ani_cel.bou.all{ani_num} = clu_cel_k.bou.all(:, 5);
                end
            end
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            save(obj.fil_pat_sam, 'x_ani_cel', 'y_ani_cel', 'z_ani_cel', 'clu_ani_cel', '-append')

            pcc_blo_ani = [];
            pcc_blo_ani = gen_pcc_blo_ani(obj, pcc_blo_ani, 'ses');
            pcc_blo_ani = gen_pcc_blo_ani(obj, pcc_blo_ani, 'ong');
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            save(obj.fil_pat_sam, 'pcc_blo_ani', '-append')

            sam_fil = matfile(obj.fil_pat_sam);
            ioi_k.pix = sam_fil.ioi_k;
            [clu_cel_k, ioi_k.cel, n_cel, dff_cel_fra] = ext_clu_cel_k(obj);
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            save(obj.fil_pat_sam, 'n_cel', 'dff_cel_fra', 'clu_cel_k', 'ioi_k', '-append')

            con_fil = matfile('\\home.ansatt.ntnu.no\kadiram\Documents\MATLAB\con_esp.mat');
            n_blo = con_fil.n_blo;
            fra_blo_ani.ros_cau.exc = nan(n_blo.rap, obj.n_ani);
            fra_blo_ani.ros_cau.inh = nan(n_blo.rap, obj.n_ani);
            %
            fra_blo_ani.dor_ven.exc = nan(n_blo.rap, obj.n_ani);
            fra_blo_ani.dor_ven.inh = nan(n_blo.rap, obj.n_ani);
            for ani_num = 1:obj.n_ani
                disp(ani_num)
                rec_fun_i = str2func(['rec_fun.' convertStringsToChars(obj.ani(ani_num))]);
                sti = rec_fun_i();
                if sti.tai
                    rec_fil = matfile(sti.fil_pat_rec);
                    fra_blo = rec_fil.fra_blo;
                    fra_blo_ani.ros_cau.exc(:, ani_num) = fra_blo.ros_cau.exc;
                    fra_blo_ani.ros_cau.inh(:, ani_num) = fra_blo.ros_cau.inh;
                    %
                    fra_blo_ani.dor_ven.exc(:, ani_num) = fra_blo.dor_ven.exc;
                    fra_blo_ani.dor_ven.inh(:, ani_num) = fra_blo.dor_ven.inh;
                end
            end
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            save(obj.fil_pat_sam, 'fra_blo_ani', '-append')

            sam_fil = matfile(obj.fil_pat_sam);
            pcc_blo_ani = sam_fil.pcc_blo_ani;
            con_fil = matfile('\\home.ansatt.ntnu.no\kadiram\Documents\MATLAB\con_esp.mat');
            n_blo = con_fil.n_blo;
            pcc_blo_ani.tai.cel.pos = nan(n_blo.rap.thr, obj.n_ani);
            pcc_blo_ani.tai.cel.neg = nan(n_blo.rap.thr, obj.n_ani);
            pcc_blo_ani.tai.shu.pos = nan(n_blo.rap.thr, obj.n_ani);
            pcc_blo_ani.tai.shu.neg = nan(n_blo.rap.thr, obj.n_ani);
            for ani_num = 1:obj.n_ani
                disp(ani_num)
                rec_fun_i = str2func(['rec_fun.' convertStringsToChars(obj.ani(ani_num))]);
                sti = rec_fun_i();
                if sti.tai
                    rec_fil = matfile(sti.fil_pat_rec);
                    pcc_blo = rec_fil.pcc_blo;
                    pcc_blo_ani.tai.cel.pos(:, ani_num) = pcc_blo.cel_tai.pos;
                    pcc_blo_ani.tai.cel.neg(:, ani_num) = pcc_blo.cel_tai.neg;
                    pcc_blo_ani.tai.shu.pos(:, ani_num) = pcc_blo.shu_tai.pos;
                    pcc_blo_ani.tai.shu.neg(:, ani_num) = pcc_blo.shu_tai.neg;
                end
            end
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            save(obj.fil_pat_sam, 'pcc_blo_ani', '-append')

            sam_fil = matfile(obj.fil_pat_sam);
            clu_ani_cel = sam_fil.clu_ani_cel;
            clu_ani_cel.bou.spo = cell(obj.n_ani, 1);
            for ani_num = 1:obj.n_ani
                disp(ani_num)
                rec_fun_i = str2func(['rec_fun.' convertStringsToChars(obj.ani(ani_num))]);
                sti = rec_fun_i();
                if sti.tai
                    rec_fil = matfile(sti.fil_pat_rec);
                    clu_cel_k = rec_fil.clu_cel_k;
                    clu_ani_cel.bou.spo{ani_num} = clu_cel_k.bou.spo(:, 5);
                end
            end
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            save(obj.fil_pat_sam, 'clu_ani_cel', '-append')

            dff_bou_win.all = [];
            dff_bou_win.vib = [];
            dff_bou_win.non = [];
            for ani_num = 1:obj.n_ani
                disp(ani_num)
                rec_fun = str2func(['rec_fun.' convertStringsToChars(obj.ani(ani_num))]);
                tap = rec_fun();
                if tap.tai && tap.bri
                    mat_fil_rec = matfile(obj.fil_pat_rec(ani_num));
                    act_bou_win = mat_fil_rec.dff_bou_win;
                    dff_bou_win.all = [dff_bou_win.all; act_bou_win.all];
                    dff_bou_win.vib = [dff_bou_win.vib; act_bou_win.vib];
                    dff_bou_win.non = [dff_bou_win.non; act_bou_win.non];
                end
            end
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            save(obj.fil_pat_sam, 'dff_bou_win', '-append')

            sam_fil = matfile(obj.fil_pat_sam);
            dff_fie_cel_fra = sam_fil.dff_fie_cel_fra;
            log_fie_fie_cel = sam_fil.log_fie_fie_cel;
            res_fie_fie_cel = sam_fil.res_fie_fie_cel;
            fra_blo_ani.tai = sam_fil.fra_blo_ani;
            dff_fie_cel_fra.bou_all = [];
            dff_fie_cel_fra.lig = [];
            dff_fie_cel_fra.sho = [];
            dff_fie_cel_fra.tap = [];
            for ani_num = 1:obj.n_ani
                disp(ani_num)
                rec_fun_i = str2func(['rec_fun.' convertStringsToChars(obj.ani(ani_num))]);
                sti = rec_fun_i();
                rec_fil = matfile(sti.fil_pat_rec);
                act_cel_fra = rec_fil.dff_cel_fra;
                dff_fie_cel_fra.bou_all = [dff_fie_cel_fra.bou_all; act_cel_fra.bou_all];
                dff_fie_cel_fra.lig = [dff_fie_cel_fra.lig; act_cel_fra.lig];
                dff_fie_cel_fra.sho = [dff_fie_cel_fra.sho; act_cel_fra.sho];
                dff_fie_cel_fra.tap = [dff_fie_cel_fra.tap; act_cel_fra.tap];
            end
            [log_fie_fie_cel.bou_all.srt, res_fie_fie_cel.bou_all.srt] = gen_log_cel(obj, {'bou_all'...
                , 'srt'});
            [log_fie_fie_cel.bou_all.srt_010, res_fie_fie_cel.bou_all.srt_010] = gen_log_cel(obj, {...
                'bou_all', 'srt_010'});
            [log_fie_fie_cel.bou_all.srt_001, res_fie_fie_cel.bou_all.srt_001] = gen_log_cel(obj, {...
                'bou_all', 'srt_001'});
            [log_fie_fie_cel.bou_all.zsc, res_fie_fie_cel.bou_all.zsc] = gen_log_cel(obj, {'bou_all'...
                , 'zsc'});

            [log_fie_fie_cel.lig.srt, res_fie_fie_cel.lig.srt] = gen_log_cel(obj, {'lig', 'srt'});
            [log_fie_fie_cel.lig.srt_010, res_fie_fie_cel.lig.srt_010] = gen_log_cel(obj, {'lig', ...
                'srt_010'});
            [log_fie_fie_cel.lig.srt_001, res_fie_fie_cel.lig.srt_001] = gen_log_cel(obj, {'lig', ...
                'srt_001'});
            [log_fie_fie_cel.lig.zsc, res_fie_fie_cel.lig.zsc] = gen_log_cel(obj, {'lig', 'zsc'});

            [log_fie_fie_cel.sho.srt, res_fie_fie_cel.sho.srt] = gen_log_cel(obj, {'sho', 'srt'});
            [log_fie_fie_cel.sho.srt_010, res_fie_fie_cel.sho.srt_010] = gen_log_cel(obj, {'sho', ...
                'srt_010'});
            [log_fie_fie_cel.sho.srt_001, res_fie_fie_cel.sho.srt_001] = gen_log_cel(obj, {'sho', ...
                'srt_001'});
            [log_fie_fie_cel.sho.zsc, res_fie_fie_cel.sho.zsc] = gen_log_cel(obj, {'sho', 'zsc'});

            [log_fie_fie_cel.tap.srt, res_fie_fie_cel.tap.srt] = gen_log_cel(obj, {'tap', 'srt'});
            [log_fie_fie_cel.tap.srt_010, res_fie_fie_cel.tap.srt_010] = gen_log_cel(obj, {'tap', ...
                'srt_010'});
            [log_fie_fie_cel.tap.srt_001, res_fie_fie_cel.tap.srt_001] = gen_log_cel(obj, {'tap', ...
                'srt_001'});
            [log_fie_fie_cel.tap.zsc, res_fie_fie_cel.tap.zsc] = gen_log_cel(obj, {'tap', 'zsc'});
            
            fra_blo_ani.lig = gen_fra_blo_ani(obj, 'lig');
            fra_blo_ani.sho = gen_fra_blo_ani(obj, 'sho');
            fra_blo_ani.tap = gen_fra_blo_ani(obj, 'tap');
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            save(obj.fil_pat_sam, 'dff_fie_cel_fra', 'log_fie_fie_cel', 'res_fie_fie_cel', ...
                'fra_blo_ani', '-append')

            sam_fil = matfile(obj.fil_pat_sam);
            pcc_blo_ani = sam_fil.pcc_blo_ani;
            pcc_blo_ani = gen_pcc_blo_ani(obj, pcc_blo_ani, 'lig');
            pcc_blo_ani = gen_pcc_blo_ani(obj, pcc_blo_ani, 'sho');
            pcc_blo_ani = gen_pcc_blo_ani(obj, pcc_blo_ani, 'tap');
            pcc_blo_ani = gen_pcc_blo_ani(obj, pcc_blo_ani, 'tai');
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            save(obj.fil_pat_sam, 'pcc_blo_ani', '-append')

            con_fil = matfile('\\home.ansatt.ntnu.no\kadiram\Documents\MATLAB\con_esp.mat');
            n_kxx = con_fil.n_kxx;
            ioi_kxx_ani = nan(n_kxx, obj.n_ani);
            ioi_shu_kxx_ani = nan(n_kxx, obj.n_ani);
            del_ioi_kxx_ani = nan(n_kxx, obj.n_ani);
            for i = 1:obj.n_ani
                rec_fun_i = str2func(['rec_fun.' convertStringsToChars(obj.ani(i))]);
                sti = rec_fun_i();
                rec_fil = matfile(sti.fil_pat_rec);
                ioi_kxx_ani(:, i) = rec_fil.ioi_kxx;
                ioi_shu_kxx_ani(:, i) = rec_fil.ioi_shu_kxx;
                del_ioi_kxx_ani(:, i) = rec_fil.del_ioi_kxx;
            end
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            save(obj.fil_pat_sam, 'ioi_kxx_ani', 'ioi_shu_kxx_ani', 'del_ioi_kxx_ani', '-append')

            clu_fid_ani.dat = nan(obj.n_ani, 1);
            clu_fid_ani.shu = nan(obj.n_ani, 1);
            for i = 1:obj.n_ani
                rec_fun_i = str2func(['rec_fun.' convertStringsToChars(obj.ani(i))]);
                sti = rec_fun_i();
                rec_fil = matfile(sti.fil_pat_rec);
                clu_fid = rec_fil.clu_fid;
                clu_fid_ani.dat(i) = clu_fid.dat;
                clu_fid_ani.shu(i) = clu_fid.shu;
            end
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            save(obj.fil_pat_sam, 'clu_fid_ani', '-append')

            sam_fil = matfile(obj.fil_pat_sam);
            pcc_blo_ani = sam_fil.pcc_blo_ani;
            pcc_blo_ani = gen_pcc_blo_ani(obj, pcc_blo_ani, 'ong');
            %
            r_pai.one.dat = [];
            r_pai.one.shu = [];
            r_pai.two.dat = [];
            r_pai.two.shu = [];
            for ani_num = 1:obj.n_ani
                disp(ani_num)
                rec_fun_i = str2func(['rec_fun.' convertStringsToChars(obj.ani(ani_num))]);
                sti = rec_fun_i();
                rec_fil = matfile(sti.fil_pat_rec);
                pcc_pai = rec_fil.r_pai;
                r_pai.one.dat = [r_pai.one.dat; pcc_pai.one.dat];
                r_pai.one.shu = [r_pai.one.shu; pcc_pai.one.shu];
                r_pai.two.dat = [r_pai.two.dat; pcc_pai.two.dat];
                r_pai.two.shu = [r_pai.two.shu; pcc_pai.two.shu];
            end
            r.dat = corr(r_pai.one.dat, r_pai.two.dat);
            r.shu = corr(r_pai.one.shu, r_pai.two.shu);
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            save(obj.fil_pat_sam, 'pcc_blo_ani', 'r_pai', 'r', '-append')

            n_cel_ani = nan(obj.n_ani, 1);
            for i = 1:obj.n_ani
                rec_fun_i = str2func(['rec_fun.' convertStringsToChars(obj.ani(i))]);
                sti = rec_fun_i();
                rec_fil = matfile(sti.fil_pat_rec);
                n_cel = rec_fil.n_cel;
                n_cel_ani(i) = n_cel.all;
            end
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            save(obj.fil_pat_sam, 'n_cel_ani', '-append')
        end
        % incorporated
        function app_par_som(obj)
            n_cel_ani = nan(obj.n_ani, 1);
            for i = 1:obj.n_ani
                rec_fun_i = str2func(['rec_fun.' convertStringsToChars(obj.ani(i))]);
                sti = rec_fun_i();
                rec_fil = matfile(sti.fil_pat_rec);
                n_cel = rec_fil.n_cel;
                n_cel_ani(i) = n_cel.all;
            end
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            save(obj.fil_pat_sam, 'n_cel_ani', '-append')
        end
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% gab
        function con = ext_con(obj)
            piv_ani = nan(obj.n_ani, 1);
            for ani_num = 1:obj.n_ani
                disp(ani_num)
                rec_fun_i = str2func(['rec_fun.' convertStringsToChars(obj.ani(ani_num))]);
                sti = rec_fun_i();
                rec_fil = matfile(sti.fil_pat_rec);
                piv_pla_row_col = rec_fil.piv_pla_row_col;
                piv_pla_row_col.red{2} = uint16(piv_pla_row_col.red{2});
                piv_ani(ani_num) = max(cell2mat(piv_pla_row_col.red), [], 'all');
            end
            con = cal_con(max(piv_ani));
        end
        function app_gab_omn(obj, thr)
            app_gab_all(obj, thr)
            app_gab(obj)
            %sav_fig_gab_tog(obj)
            %sav_fig_gab_clu_map_cel(obj)
            %sav_fig_inh_exc(obj)
            %sav_fig_inh_non_exc_sig(obj)
        end
        function app_gab(obj)
            dff_cel_fra.bou.all = [];% cells discriminated when plotting
            n_cel = 0;

            log_fie_fie_cel = [];
            log_fie_fie_cel = gen_log_fie_fie_cel(log_fie_fie_cel, {'gab', 'srt'});%initialization
            log_fie_fie_cel = gen_log_fie_fie_cel(log_fie_fie_cel, {'non', 'srt'});
            log_fie_fie_cel = gen_log_fie_fie_cel(log_fie_fie_cel, {'gab', 'zsc'});
            log_fie_fie_cel = gen_log_fie_fie_cel(log_fie_fie_cel, {'non', 'zsc'});
            
            fra_fie_ani = [];
            fra_fie_ani = ini_fra_fie_ani(fra_fie_ani, 'srt', obj);
            fra_fie_ani = ini_fra_fie_ani(fra_fie_ani, 'zsc', obj);

            fra_fie_blo_ani = [];
            fra_fie_blo_ani = gen_fra_fie_blo_ani(fra_fie_blo_ani, 'srt', obj);
            fra_fie_blo_ani = gen_fra_fie_blo_ani(fra_fie_blo_ani, 'zsc', obj);
            
            res_fie_cel.srt = [];
            res_fie_cel.zsc = [];
            
            acc_ani = nan(obj.n_ani, 1);
            xcc_ani = nan(obj.n_ani, 1);
            con_fil = matfile('\\home.ansatt.ntnu.no\kadiram\Documents\MATLAB\con_esp.mat');
            n_k = con_fil.n_k;
            clu_sel_ani_k.gab = nan(obj.n_ani, n_k);
            clu_sel_ani_k.ran = nan(obj.n_ani, n_k);
            k = 4;
            x_cel = [];
            y_cel = [];
            z_cel = [];
            for ani_num = 1:obj.n_ani
                disp(ani_num)
                rec_fun_i = str2func(['rec_fun.' convertStringsToChars(obj.ani(ani_num))]);
                sti = rec_fun_i();
                rec_fil = matfile(sti.fil_pat_rec);
                
                gab_fie_fie_cel = rec_fil.log_fie_fie_cel;
                log_fie_fie_cel = enh_log_fie_fie_cel(log_fie_fie_cel, {'gab', 'srt'}, ...
                    gab_fie_fie_cel);% concatenation
                log_fie_fie_cel = enh_log_fie_fie_cel(log_fie_fie_cel, {'non', 'srt'}, ...
                    gab_fie_fie_cel);
                log_fie_fie_cel = enh_log_fie_fie_cel(log_fie_fie_cel, {'gab', 'zsc'}, ...
                    gab_fie_fie_cel);
                log_fie_fie_cel = enh_log_fie_fie_cel(log_fie_fie_cel, {'non', 'zsc'}, ...
                    gab_fie_fie_cel);
                
                act_cel_fra = rec_fil.dff_cel_fra;
                dff_cel_fra.bou.all = [dff_cel_fra.bou.all; act_cel_fra.bou.all];
                n_cel = n_cel + size(act_cel_fra.bou.all, 1);

                fra_fie = rec_fil.fra_fie;
                fra_fie_ani = enh_fra_fie_ani(fra_fie_ani, 'srt', ani_num, fra_fie);
                fra_fie_ani = enh_fra_fie_ani(fra_fie_ani, 'zsc', ani_num, fra_fie);

                fra_fie_fie_blo = rec_fil.fra_fie_fie_blo;
                fra_fie_blo_ani = enh_fra_fie_blo_ani(fra_fie_blo_ani, 'srt', ani_num, ...
                    fra_fie_fie_blo);
                fra_fie_blo_ani = enh_fra_fie_blo_ani(fra_fie_blo_ani, 'zsc', ani_num, ...
                    fra_fie_fie_blo);
                
                rea_fie_cel = rec_fil.res_fie_cel;
                res_fie_cel.srt = [res_fie_cel.srt; rea_fie_cel.srt];
                res_fie_cel.zsc = [res_fie_cel.zsc; rea_fie_cel.zsc];

                x_cel = [x_cel; rec_fil.x_cel];
                y_cel = [y_cel; rec_fil.y_cel];
                z_cel = [z_cel; rec_fil.z_cel];
                
                acc = rec_fil.acc;
                xcc = rec_fil.xcc;
                acc_ani(ani_num) = acc;
                xcc_ani(ani_num) = xcc;
                clu_sel_k = rec_fil.clu_sel_k;
                clu_sel_ani_k.gab(ani_num, k) = clu_sel_k.gab(k);
                clu_sel_ani_k.ran(ani_num, k) = clu_sel_k.ran(k);
            end
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            save(obj.fil_pat_sam, 'log_fie_fie_cel', 'acc_ani', 'xcc_ani', 'clu_sel_ani_k', 'n_cel', ...
                'dff_cel_fra', 'fra_fie_ani', 'fra_fie_blo_ani', 'res_fie_cel', 'x_cel', 'y_cel', ...
                'z_cel', '-append')

            [dff_cel_fra, log_fie_fie_cel, res_fie_cel, fra_fie_ani] = gen_dff_cel_fra(obj);
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            save(obj.fil_pat_sam, 'dff_cel_fra', 'log_fie_fie_cel', 'res_fie_cel', 'fra_fie_ani', ...
                '-append')
        end
        % unincorporated
        function app_par_gab(obj)
            sam_fil = matfile(obj.fil_pat_sam);
            log_fie_fie_cel = sam_fil.log_fie_fie_cel;
            log_fie_fie_cel.gab = logical([]);
            log_fie_fie_cel.non = logical([]);
            for ani_num = 1:obj.n_ani
                disp(ani_num)
                rec_fun_i = str2func(['rec_fun.' convertStringsToChars(obj.ani(ani_num))]);
                sti = rec_fun_i();
                rec_fil = matfile(sti.fil_pat_rec);
                log_cel = rec_fil.log_cel;
                log_fie_fie_cel.gab = [log_fie_fie_cel.gab; log_cel.gab.all];
                log_fie_fie_cel.non = [log_fie_fie_cel.non; log_cel.non.all];
            end
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            save(obj.fil_pat_sam, 'log_fie_fie_cel', '-append')
        end
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% neurobehavioral
        function app_neu_beh(obj)
            con_fil = matfile('\\home.ansatt.ntnu.no\kadiram\Documents\MATLAB\con_esp.mat');
            n_reg_for = con_fil.n_reg_for;
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% pooling
            dff_reg_fra_cel.bou.all = cell(n_reg_for, 1);
            dff_reg_win_cel.bou.all = cell(n_reg_for, 1);
            for reg = 1:n_reg_for
                for ani_num = 1:obj.n_ani
                    disp(ani_num)
                    rec_fun_i = str2func(['rec_fun.' convertStringsToChars(obj.ani(ani_num))]);
                    sti = rec_fun_i();
                    if sti.bri && sti.tai
                        rec_fil = matfile(sti.fil_pat_rec);
                        dff_reg_fra_cel_tem = rec_fil.dff_reg_fra_cel;
                        dff_reg_fra_cel.bou.all{reg} = [dff_reg_fra_cel.bou.all{reg} ...
                            dff_reg_fra_cel_tem.bou.all{reg}];
                        %
                        dff_reg_win_cel_tem = rec_fil.dff_reg_win_cel;
                        dff_reg_win_cel.bou.all{reg} = [dff_reg_win_cel.bou.all{reg} ...
                            dff_reg_win_cel_tem.bou.all{reg}];
                    end
                end
            end
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            save(obj.fil_pat_sam, 'dff_reg_fra_cel', 'dff_reg_win_cel', '-append')


            sam_fil = matfile(obj.fil_pat_sam);
            dff_reg_fra_cel = sam_fil.dff_reg_fra_cel;
            dff_reg_win_cel = sam_fil.dff_reg_win_cel;
            con_fil = matfile('\\home.ansatt.ntnu.no\kadiram\Documents\MATLAB\con_esp.mat');
            n_reg_for = con_fil.n_reg_for;
            n_win = con_fil.n_win;
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% pooling
            dff_reg_fra_cel.bou.spo = cell(n_reg_for, 1);
            dff_reg_win_cel.bou.spo = cell(n_reg_for, 1);
            for reg = 1:n_reg_for
                dff_reg_win_cel.bou.spo{reg} = cell(n_win.tri, 1);
                for ani_num = 1:obj.n_ani
                    disp(ani_num)
                    rec_fun_i = str2func(['rec_fun.' convertStringsToChars(obj.ani(ani_num))]);
                    sti = rec_fun_i();
                    if sti.bri && sti.tai
                        rec_fil = matfile(sti.fil_pat_rec);
                        dff_reg_fra_cel_tem = rec_fil.dff_reg_fra_cel;
                        dff_reg_fra_cel.bou.spo{reg} = [dff_reg_fra_cel.bou.spo{reg} ...
                            dff_reg_fra_cel_tem.bou.spo{reg}];
                        %
                        dff_reg_win_cel_tem = rec_fil.dff_reg_win_cel;
                        for win = 1:n_win.tri
                            dff_reg_win_cel.bou.spo{reg}{win} = [dff_reg_win_cel.bou.spo{reg}{win}; ...
                                dff_reg_win_cel_tem.bou.spo{reg}{win}];
                        end
                    end
                end
            end
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            save(obj.fil_pat_sam, 'dff_reg_fra_cel', 'dff_reg_win_cel', '-append')
        end
        % unincorporated
        function app_par_neu_beh(obj)
            log_cel.bou_spo.srt.exc = [];
            log_cel.bou_spo.srt.inh = [];
            for ani_num = 1:obj.n_ani
                disp(ani_num)
                rec_fun_i = str2func(['rec_fun.' convertStringsToChars(obj.ani(ani_num))]);
                sti = rec_fun_i();
                rec_fil = matfile(sti.fil_pat_rec);
                boo_cel = rec_fil.log_cel;
                log_cel.bou_spo.srt.exc = [log_cel.bou_spo.srt.exc; boo_cel.bou_spo.srt.exc];
                log_cel.bou_spo.srt.inh = [log_cel.bou_spo.srt.inh; boo_cel.bou_spo.srt.inh];
            end
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            save(obj.fil_pat_sam, 'log_cel', '-append')
        end
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% plotting
        
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% BEH
        function h_fig = plo_tai_ang_met(obj)
            sam_fil = matfile(obj.fil_pat_sam);
            ang_fra_ani = sam_fil.ang_fra_ani;
            h_fig = plo_tai_ang(ang_fra_ani);
        end
        function h_fig = plo_ang_his_met(obj)
            sam_fil = matfile(obj.fil_pat_sam);
            ang_bou = sam_fil.ang_bou;
            h_fig = plo_ang_his(ang_bou);
        end
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% NEURAL
        
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% cel sha abl
        function plo_neu_pix(obj, sta_ani)
            mat_fil = matfile(obj.fil_pat_sam);
            global col_sca_ste
            col_sca = col_sca_ste;
            col_map = 'jet';
            plo_neu(mat_fil.cal_ima_ref_ani_row_col_con, mat_fil.dff_bou_ani_row_col, ...
                mat_fil.dff_raw_ani_con_row_col, obj.ani, sta_ani, col_sca, col_map, ...
                obj.sta_ani_con, obj.tit, obj.sta_ani, obj.bri_ani, obj.tai_ani)
        end
        %
        function plo_neu_cel_met(obj, sta_ani)
            mat_sam = matfile(obj.fil_pat_sam);
            global col_sca_ste
            col_sca = col_sca_ste;
            col_map = 'jet';
            plo_neu_cel(mat_sam.cal_ima_ref_ani_row_col_con, ...
                mat_sam.dff_cel_swi_ani_row_col, mat_sam.dff_cel_ani_con_row_col, obj.ani, ...
                sta_ani, col_sca, col_map, obj.sta_ani_con, obj.tit, obj.sta_ani, ...
                obj.sta_det_ani)
        end
        function plo_neu_cel_ext(obj, n_ani_eve)
            load(obj.fil_pat_sam, 'cal_ima_ref_ani_row_col_con', 'dff_cel_ani_con_row_col')
            %global col_sca_lat
            global col_sca_ste
            col_sca = col_sca_ste;
            col_map = 'jet';
            plo_neu_ext(obj.n_con, cal_ima_ref_ani_row_col_con, dff_cel_ani_con_row_col, ...
                obj.ani, n_ani_eve, col_sca, col_map, obj.n_ani, obj.sta_ani_con)
        end
        function plo_neu_cel_sig(obj, n_ani_eve)
            load(obj.fil_pat_sam, 'cal_ima_ref_ani_row_col_con', 'tim_tri_fra', ...
                'dff_ani_con_fra_cel', 'res_dur_neu')
            global col_sca_ste
            col_sca = col_sca_ste;
            col_map = 'jet';
            plo_neu_sig(obj.n_con, cal_ima_ref_ani_row_col_con, tim_tri_fra, ...
                dff_ani_con_fra_cel, obj.ani, n_ani_eve, col_sca, col_map, res_dur_neu)
        end
        function plo_neu_cel_sig_ext(obj, n_ani_eve)
            load(obj.fil_pat_sam, 'cal_ima_ref_ani_row_col_con', 'tim_tri_fra', ...
                'dff_ani_con_fra_cel', 'res_dur_neu')
            global col_sca_ste
            col_sca = col_sca_ste;
            col_map = 'jet';
            plo_neu_sig_ext(obj.n_con, cal_ima_ref_ani_row_col_con, tim_tri_fra, ...
                dff_ani_con_fra_cel, obj.ani, n_ani_eve, col_sca, col_map, res_dur_neu, ...
                obj.n_ani)
        end
        function plo_tap_cor_met(obj, n_ani_eve)
            load(obj.fil_pat_sam, 'pcc_ani_con')
            plo_tap_cor(pcc_ani_con, obj.ani, 'forebrain', n_ani_eve)
        end % forebrain
        function plo_tap_cor_ext_met(obj, n_ani_eve)
            load(obj.fil_pat_sam, 'pcc_ani_con')
            plo_tap_cor_ext(pcc_ani_con, obj.ani, 'forebrain', n_ani_eve, obj.n_ani)
        end % forebrain
        function plo_tap_cor_str_met(obj, n_ani_eve)
            load(obj.fil_pat_sam, 'pcc_ani_str_con')
            global str
            global n_str
            for i = 1:n_str
                pcc_ani_con = cell(obj.n_ani, obj.n_con);
                for j = 1:obj.n_ani
                    for k = 1:obj.n_con
                        pcc_ani_con{j, k} = pcc_ani_str_con{j, i, k};
                    end
                end
                plo_tap_cor(pcc_ani_con, obj.ani, str{i}, n_ani_eve)
            end
        end
        function plo_tap_cor_str_ext_met(obj, n_ani_eve)
            load(obj.fil_pat_sam, 'pcc_ani_str_con')
            global str
            global n_str
            for i = 1:n_str
                pcc_ani_con = cell(obj.n_ani, obj.n_con);
                for j = 1:obj.n_ani
                    for k = 1:obj.n_con
                        pcc_ani_con{j, k} = pcc_ani_str_con{j, i, k};
                    end
                end
                plo_tap_cor_ext(pcc_ani_con, obj.ani, str{i}, n_ani_eve, obj.n_ani)
            end
        end
        %
        function plo_spo_cor_met(obj)
            mat_sam = matfile(obj.fil_pat_sam);
            plo_spo_cor(mat_sam.cen_sub_ani_cel_dim, mat_sam.cor_coe_ani_reg_cel_cel, ...
                obj.bri_ani, obj.ani, obj.tit)
        end
        function plo_bra_reg_met(obj)
            mat_sam = matfile(obj.fil_pat_sam);
            plo_bra_reg(mat_sam.log_ani_cel_reg, mat_sam.int_ref_ani_row_col, ...
                mat_sam.cel_lab_tel_ani_row_col, obj.bri_ani, obj.ani, obj.tit)
        end
        function h_fig = plo_dua_clu_map_cel_met(obj)
            sam_fil = matfile(obj.fil_pat_sam);
            dff_cel_fra = sam_fil.dff_cel_fra;
            clu_cel_k = sam_fil.clu_cel_k;
            bou_dur_ani = sam_fil.bou_dur_ani;
            k = 5;
            n_cel = sam_fil.n_cel;
            con_fil = matfile('\\home.ansatt.ntnu.no\kadiram\Documents\MATLAB\con_esp.mat');
            piv_col_pcx = con_fil.piv_col_pcx;
            % h_fig = plo_dua_clu_map_cel(dff_cel_fra.bou.all, clu_cel_k.bou.all(:, k), ...
            %     bou_dur_ani.all, n_cel);
            h_fig = plo_dua_clu_map_cel(dff_cel_fra.bou.spo, clu_cel_k.bou.spo(:, k), ...
                bou_dur_ani.spo, n_cel, piv_col_pcx.fiv.cel.spo);
        end
        function h_fig = plo_clu_map_cel_ani_met(obj, sta_ani_num, sto_ani_num)
            [h_fig, fig_wid, fig_hei] = fig;
            con_fil = matfile('\\home.ansatt.ntnu.no\kadiram\Documents\MATLAB\con_esp.mat');
            n_row = 2;
            n_col = 8;
            gap_ver_row = 0.005*ones(n_row, 1);
            gap_hor = 0.005;
            gap_hor_row_col = gap_hor*ones(n_row, n_col);
            mar_bot = 0.040;
            mar_top = 0.000;
            mar_lef = 0.000;
            mar_rig = 0.000;
            asp_rat = con_fil.asp_rat;
            asp_rat_axe = asp_rat.cal.ori*ones(n_row*n_col);
            wid = true;
            sca_axe = ones(n_row*n_col, 1);
            n_pix_ext = 0;
            [hax_sub, pos_axe, hei_axe, dis_asp_rat, las_pix, rat_wid] = tight_subplot_gen(n_row, ...
                n_col, gap_ver_row, gap_hor_row_col, mar_bot, mar_top, mar_lef, mar_rig, ...
                asp_rat_axe, fig_wid, fig_hei, wid, sca_axe, n_pix_ext);
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            k = 5;
            r_lim = [1 k];
            piv_col_pcx = con_fil.piv_col_pcx;
            piv_col_pcx = piv_col_pcx.fiv.cel.spo;
            nam_ani = cell(obj.n_ani, 1);
            for ani_num = 1:obj.n_ani
                nam_ani{ani_num} = convertStringsToChars(obj.ani(ani_num));
            end
            sub_num = 0;
            for ani_num = sta_ani_num:sto_ani_num
                disp(ani_num)
                rec_fun_i = str2func(['rec_fun.' nam_ani{ani_num}]);
                sti = rec_fun_i();
                if sti.tai
                    mat_fil_rec = matfile(obj.fil_pat_rec(ani_num));
                    clu_row_col = mat_fil_rec.clu_row_col;
                    sub_num = sub_num + 1;
                    hax = hax_sub(sub_num);
                    piv_row_col_pcx = ext_piv_row_col_pcx(flip(clu_row_col.bou.spo, 1), r_lim, ...
                        piv_col_pcx);
                    ima_obj = sho_ima.rgb(hax, piv_row_col_pcx);
                    hax.Colormap = piv_col_pcx;
                end
            end
        end
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% axo-cel
        function h_fig = plo_cor_map_met(obj, sta_ani)
            mat_fil = matfile(obj.fil_pat_sam);
            h_fig = plo_cor_map(obj.ani, sta_ani, mat_fil.log_ani_pla_icx_row_col, ...
                mat_fil.r_ani_pla_icx_row_col);
        end
        function h_fig = plo_icx_res_met(obj)
            con_fil = matfile('\\home.ansatt.ntnu.no\kadiram\Documents\MATLAB\con_esp.mat');
            mat_fil = matfile(obj.fil_pat_sam);
            tim_fra = con_fil.tim_fra;
            h_fig = plo_icx_res(tim_fra.cal.eig.tri.dff, mat_fil.dff_icx_con_fra_ani, 'population');
        end
        function h_fig = plo_vib_res_met(obj)
            con_fil = matfile('\\home.ansatt.ntnu.no\kadiram\Documents\MATLAB\con_esp.mat');
            mat_fil = matfile(obj.fil_pat_sam);
            tim_fra = con_fil.tim_fra;
            h_fig = plo_vib_res(tim_fra.cal.eig.tri.dff, mat_fil.dff_icx_con_fra_ani, 'population');
        end
        function h_fig = plo_cor_his_met(obj)
            mat_fil = matfile(obj.fil_pat_sam);
            h_fig = plo_cor_his(mat_fil.per_cel_bin_ani);
        end
        function h_fig = plo_cdf_met(obj, fie)
            sam_fil = matfile(obj.fil_pat_sam);
            r_cel = sam_fil.r_cel;
            h_fig = plo_cdf(r_cel.(fie));
        end
        function h_fig = plo_clu_map_roi_met(obj)
            sam_fil = matfile(obj.fil_pat_sam);
            dff_roi_fra = sam_fil.dff_roi_fra;
            clu_roi_k = sam_fil.clu_roi_k;
            bou_dur_ani = nan;
            k = 5;
            con_fil = matfile('\\home.ansatt.ntnu.no\kadiram\Documents\MATLAB\con_esp.mat');
            piv_col_pcx = con_fil.piv_col_pcx;
            fie_num = {'axo_cel'};
            h_fig = plo_clu_map_cel(dff_roi_fra, clu_roi_k(:, k), bou_dur_ani, ...
                piv_col_pcx.axo.bou.all, obj.n_pla_str, fie_num);
        end
        function h_fig = plo_inh_exc_axo_met(obj)
            sam_fil = matfile(obj.fil_pat_sam);
            con_fil = matfile('\\home.ansatt.ntnu.no\kadiram\Documents\MATLAB\con_esp.mat');
            piv_col_pcx = con_fil.piv_col_pcx;
            mar_siz = con_fil.mar_siz;
            h_fig = plo_clu_map_ani_thr(sam_fil.x_ani_roi, sam_fil.y_ani_roi, ...
                sam_fil.z_ani_roi, piv_col_pcx.div, sam_fil.res_ani_roi, mar_siz.roi);
        end
        function h_fig = plo_cor_dis_met(obj, fie)
            sam_fil = matfile(obj.fil_pat_sam);
            con_fil = matfile('\\home.ansatt.ntnu.no\kadiram\Documents\MATLAB\con_esp.mat');
            dis_blo = con_fil.dis_blo;
            cor_fie_fie_blo_ani = sam_fil.cor_fie_fie_blo_ani;
            h_fig = plo_pcc_dis(cor_fie_fie_blo_ani.(fie), dis_blo.xre);
        end
        function h_fig = plo_cor_dis_all_met(obj, fie)
            sam_fil = matfile(obj.fil_pat_sam);
            con_fil = matfile('\\home.ansatt.ntnu.no\kadiram\Documents\MATLAB\con_esp.mat');
            dis_blo = con_fil.dis_blo;
            dis_blo = dis_blo.axo;
            cor_fie_fie_blo_ani = sam_fil.cor_fie_fie_blo_ani;
            x_lim = 210;
            dis_blo(end) = x_lim;
            h_fig = plo_pcc_dis.exc_inh(cor_fie_fie_blo_ani.(fie), dis_blo, x_lim);
        end
        function h_fig = plo_edf_met(obj, fie)
            sam_fil = matfile(obj.fil_pat_sam);
            cum_pro_bin_ani = sam_fil.cum_pro_bin_ani;
            h_fig = plo_edf(cum_pro_bin_ani.(fie));
        end
        function h_fig = plo_inh_exc_sig_roi_met(obj)
            sam_fil = matfile(obj.fil_pat_sam);
            dff_roi_fra = sam_fil.dff_roi_fra;
            log_fie_roi = sam_fil.log_fie_roi;
            con_fil = matfile('\\home.ansatt.ntnu.no\kadiram\Documents\MATLAB\con_esp.mat');
            win_len = con_fil.win_len;
            h_fig = plo_inh_exc_fie.smo_pub_sid(dff_roi_fra, log_fie_roi, win_len.dff.pha.drn.tai);
        end
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% axo onl
        function [h_fig, dff_pla_pix_fra] = plo_clu_map_pix_met(obj)
            sam_fil = matfile(obj.fil_pat_sam);
            dff_pix_fra = sam_fil.dff_pix_fra;
            clu_pix_k = sam_fil.clu_pix_k;
            bou_dur_ani = sam_fil.bou_dur_ani;
            dff_pla_pix_fra.bou.all = ext_dff_pla_pix_fra(dff_pix_fra.bou.all, sam_fil.n_pix_pla_ani);
            k = 5;
            clu_pla_pix.bou.all = ext_dff_pla_pix_fra(clu_pix_k.bou.all(:, k), sam_fil.n_pix_pla_ani);
            fie_num = {'axo', 'bou', 'all'};
            h_fig = plo_clu_map_pix(dff_pla_pix_fra.bou.all, clu_pla_pix.bou.all, fie_num, ...
                bou_dur_ani.all);
        end
        function h_fig = plo_clu_map_ani_met(obj, sta_ani_num, sto_ani_num, fie_num)
            [h_fig, fig_wid, fig_hei] = fig;
            con_fil = matfile('\\home.ansatt.ntnu.no\kadiram\Documents\MATLAB\con_esp.mat');
            n_row = 4;
            n_pla = con_fil.n_pla;
            fun_pla = con_fil.fun_pla;
            n_col = 2*n_pla.neu.fun;
            gap_ver_row = 0.005*ones(n_row, 1);
            gap_hor = 0.005;
            gap_hor_row_col = gap_hor*ones(n_row, n_col);
            nam = 0.020;
            gap_hor_row_col(:, n_pla.neu.fun) = nam;
            mar_bot = 0.040;
            mar_top = 0.000;
            mar_lef = nam;
            mar_rig = 0.000;
            asp_rat = con_fil.asp_rat;
            asp_rat_axe = asp_rat.cal.ori*ones(n_row*n_col);
            wid = true;
            sca_axe = ones(n_row*n_col, 1);
            n_pix_ext = 0;
            [hax_sub, pos_axe, hei_axe, dis_asp_rat, las_pix, rat_wid] = tight_subplot_gen(n_row, ...
                n_col, gap_ver_row, gap_hor_row_col, mar_bot, mar_top, mar_lef, mar_rig, ...
                asp_rat_axe, fig_wid, fig_hei, wid, sca_axe, n_pix_ext);
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            k = 5;
            r_lim = [1 k];
            nam_ani = cell(obj.n_ani, 1);
            for ani_num = 1:obj.n_ani
                nam_ani{ani_num} = convertStringsToChars(obj.ani(ani_num));
            end
            sub_ind = 0;
            piv_col_pcx = con_fil.piv_col_pcx;
            piv_col_pcx = getfield(piv_col_pcx, fie_num{:});
            [~, str_met] = gen_str(fie_num);
            for ani_num = sta_ani_num:sto_ani_num
                disp(ani_num)
                rec_fun_i = str2func(['rec_fun.' nam_ani{ani_num}]);
                sti = rec_fun_i();
                if sti.tai
                    mat_fil_rec = matfile(obj.fil_pat_rec(ani_num));
                    clu_pla_k_row_col = mat_fil_rec.clu_pla_k_row_col;
                    clu_pla_k_row_col = getfield(clu_pla_k_row_col, fie_num{:});
                    for col_num = 1:n_pla.neu.fun
                        sub_ind = sub_ind + 1;
                        hax = hax_sub(sub_ind);
                        pla = fun_pla.plo(1, col_num);

                        clu_row_col = arrayfun(@(clu) map_vec.(str_met)(clu), clu_pla_k_row_col...
                            {pla, k});% takes long ...

                        piv_row_col_pcx = ext_piv_row_col_pcx(clu_row_col, r_lim, piv_col_pcx);
                        ima_obj = sho_ima.rgb(hax, piv_row_col_pcx);
                        hax.Colormap = piv_col_pcx;
                        if col_num == 1
                            y_lab = ylabel(hax, obj.ani(ani_num));
                            y_lab.Units = 'normalized';
                            y_lab.Position(1) = 0;
                        end
                    end
                end
            end
        end
        function h_fig = plo_clu_map_ani_thr_met(obj)
            sam_fil = matfile(obj.fil_pat_sam);
            x_ani_pix = sam_fil.x_ani_pix;
            y_ani_pix = sam_fil.y_ani_pix;
            z_ani_pix = sam_fil.z_ani_pix;
            con_fil = matfile('\\home.ansatt.ntnu.no\kadiram\Documents\MATLAB\con_esp.mat');
            piv_col_pcx = con_fil.piv_col_pcx;
            clu_ani_pix = sam_fil.clu_ani_pix;

            fie_num = {'axo', 'bou', 'all'};
            clu_ani_pix = getfield(clu_ani_pix, fie_num{2:end});
            [~, str_met] = gen_str(fie_num);
            clu_ani_pix = cellfun(@(ele_row_col) map_mat(ele_row_col, str_met), clu_ani_pix, ...
                'UniformOutput', false);

            h_fig = plo_clu_map_ani_thr(x_ani_pix, y_ani_pix, z_ani_pix, ...
                piv_col_pcx.fiv.pix.bou, clu_ani_pix);
        end
        function h_fig = plo_inh_exc_ani_thr_met(obj, fie_num)
            sam_fil = matfile(obj.fil_pat_sam);
            x_dow_ani_pix = sam_fil.x_dow_ani_pix;
            y_dow_ani_pix = sam_fil.y_dow_ani_pix;
            z_dow_ani_pix = sam_fil.z_dow_ani_pix;
            con_fil = matfile('\\home.ansatt.ntnu.no\kadiram\Documents\MATLAB\con_esp.mat');
            piv_col_pcx = con_fil.piv_col_pcx;
            res_dow_ani_pix = sam_fil.res_dow_ani_pix;
            res_dow_ani_pix = getfield(res_dow_ani_pix, fie_num{2:end});
            mar_siz = con_fil.mar_siz;
            h_fig = plo_clu_map_ani_thr(x_dow_ani_pix, y_dow_ani_pix, z_dow_ani_pix, ...
                piv_col_pcx.div, res_dow_ani_pix, mar_siz.pix);
        end
        function h_fig = plo_inh_exc_ani_sin_met(obj, fie_num)
            sam_fil = matfile(obj.fil_pat_sam);
            x_dow_ani_pix = sam_fil.x_dow_ani_pix;
            y_dow_ani_pix = sam_fil.y_dow_ani_pix;
            z_dow_ani_pix = sam_fil.z_dow_ani_pix;
            con_fil = matfile('\\home.ansatt.ntnu.no\kadiram\Documents\MATLAB\con_esp.mat');
            piv_col_pcx = con_fil.piv_col_pcx;
            res_dow_ani_pix = sam_fil.res_dow_ani_pix;
            res_dow_ani_pix = getfield(res_dow_ani_pix, fie_num{2:end});
            %mar_siz = con_fil.mar_siz;

            mar_siz.pix = 7;

            h_fig = plo_clu_map_ani_sin(x_dow_ani_pix, y_dow_ani_pix, z_dow_ani_pix, ...
                piv_col_pcx.div, res_dow_ani_pix, mar_siz.pix);
        end
        %
        function h_fig = plo_bin_sig_raw_met(obj)
            sam_fil = matfile(obj.fil_pat_sam);
            dff_bin_fra = sam_fil.dff_bin_fra;
            log_bin = sam_fil.log_bin;
            dff_bin_win = sam_fil.dff_bin_win;
            pha_win_len = 10;
            h_fig = plo_inh_exc_fie.raw(dff_bin_fra.bou.all, log_bin.all, dff_bin_win.bou.all, ...
                pha_win_len);
        end
        %
        function h_fig = plo_bin_sig_lig_met(obj)
            sam_fil = matfile(obj.fil_pat_sam);
            dff_lig_bin_fra = sam_fil.dff_lig_bin_fra;
            log_bin = sam_fil.log_bin;
            con_fil = matfile('\\home.ansatt.ntnu.no\kadiram\Documents\MATLAB\con_esp.mat');
            win_len = con_fil.win_len;
            h_fig = plo_inh_exc_fie.smo_pub(dff_lig_bin_fra, log_bin.lig.srt, win_len.dff.pha.drn.tai);
        end
        function h_fig = plo_bin_sig_sho_met(obj)
            sam_fil = matfile(obj.fil_pat_sam);
            dff_sho_bin_fra = sam_fil.dff_sho_bin_fra;
            log_bin = sam_fil.log_bin;
            con_fil = matfile('\\home.ansatt.ntnu.no\kadiram\Documents\MATLAB\con_esp.mat');
            win_len = con_fil.win_len;
            h_fig = plo_inh_exc_fie.smo_pub(dff_sho_bin_fra, log_bin.sho.srt, win_len.dff.pha.drn.tai);
        end
        function h_fig = plo_bin_sig_tap_met(obj)
            sam_fil = matfile(obj.fil_pat_sam);
            dff_tap_bin_fra = sam_fil.dff_tap_bin_fra;
            log_bin = sam_fil.log_bin;
            con_fil = matfile('\\home.ansatt.ntnu.no\kadiram\Documents\MATLAB\con_esp.mat');
            win_len = con_fil.win_len;
            h_fig = plo_inh_exc_fie.smo_pub(dff_tap_bin_fra, log_bin.tap.srt, win_len.dff.pha.drn.tai);
        end
        function h_fig = plo_bin_sig_met(obj)
            sam_fil = matfile(obj.fil_pat_sam);
            dff_bin_fra = sam_fil.dff_bin_fra;
            log_bin = sam_fil.log_bin;
            con_fil = matfile('\\home.ansatt.ntnu.no\kadiram\Documents\MATLAB\con_esp.mat');
            win_len = con_fil.win_len;
            fie = 'srt';
            h_fig = plo_inh_exc_fie.smo_pub(dff_bin_fra.bou.all, log_bin.all.(fie), ...
                win_len.dff.pha.drn.tai);
        end
        %
        function h_fig = plo_inh_exc_sin_bou_dur_met(obj)
            sam_fil = matfile(obj.fil_pat_sam);
            x_ani_bin = sam_fil.x_ani_bin;
            y_ani_bin = sam_fil.y_ani_bin;
            z_ani_bin = sam_fil.z_ani_bin;
            con_fil = matfile('\\home.ansatt.ntnu.no\kadiram\Documents\MATLAB\con_esp.mat');
            piv_col_pcx = con_fil.piv_col_pcx;
            res_bin = sam_fil.res_bin;
            mar_siz.pix = 7;
            h_fig = plo_clu_map_ani_sin_tog(x_ani_bin, y_ani_bin, z_ani_bin, piv_col_pcx.div, ...
                res_bin, mar_siz.pix);
        end
        function h_fig = plo_inh_exc_ani_bin_met(obj, fie_num)
            sam_fil = matfile(obj.fil_pat_sam);
            x_ani_bin = sam_fil.x_ani_bin;
            y_ani_bin = sam_fil.y_ani_bin;
            z_ani_bin = sam_fil.z_ani_bin;
            con_fil = matfile('\\home.ansatt.ntnu.no\kadiram\Documents\MATLAB\con_esp.mat');
            piv_col_pcx = con_fil.piv_col_pcx;
            res_ani_bin = sam_fil.res_ani_bin;
            res_ani_bin = getfield(res_ani_bin, fie_num{2:end});
            mar_siz.pix = 7;
            h_fig = plo_clu_map_ani_cle(x_ani_bin, y_ani_bin, z_ani_bin, piv_col_pcx.div, ...
                res_ani_bin, mar_siz.pix);
        end
        function h_fig = plo_inh_exc_sin_met(obj, fie_num)
            sam_fil = matfile(obj.fil_pat_sam);
            x_ani_bin = sam_fil.x_ani_bin;
            y_ani_bin = sam_fil.y_ani_bin;
            z_ani_bin = sam_fil.z_ani_bin;
            con_fil = matfile('\\home.ansatt.ntnu.no\kadiram\Documents\MATLAB\con_esp.mat');
            piv_col_pcx = con_fil.piv_col_pcx;
            res_ani_bin = sam_fil.res_ani_bin;
            res_ani_bin = getfield(res_ani_bin, fie_num{2:end});
            mar_siz.pix = 7;
            h_fig = plo_clu_map_ani_sin(x_ani_bin, y_ani_bin, z_ani_bin, piv_col_pcx.div, ...
                res_ani_bin, mar_siz.pix);
        end
        function h_fig = plo_inh_exc_sid_met(obj, fie_num)
            sam_fil = matfile(obj.fil_pat_sam);
            x_ani_bin = sam_fil.x_ani_bin;
            y_ani_bin = sam_fil.y_ani_bin;
            z_ani_bin = sam_fil.z_ani_bin;
            con_fil = matfile('\\home.ansatt.ntnu.no\kadiram\Documents\MATLAB\con_esp.mat');
            piv_col_pcx = con_fil.piv_col_pcx;
            res_ani_bin = sam_fil.res_ani_bin;
            res_ani_bin = getfield(res_ani_bin, fie_num{2:end});
            mar_siz.pix = 7;
            vie_ang_dir = [180 3];
            h_fig = plo_clu_map_ani_sin(x_ani_bin, y_ani_bin, z_ani_bin, piv_col_pcx.div, ...
                res_ani_bin, mar_siz.pix, vie_ang_dir);
        end
        function h_fig = plo_inh_exc_spl_met(obj, fie_num)
            sam_fil = matfile(obj.fil_pat_sam);
            x_ani_bin = sam_fil.x_ani_bin;
            y_ani_bin = sam_fil.y_ani_bin;
            z_ani_bin = sam_fil.z_ani_bin;
            con_fil = matfile('\\home.ansatt.ntnu.no\kadiram\Documents\MATLAB\con_esp.mat');
            piv_col_pcx = con_fil.piv_col_pcx;
            res_ani_bin = sam_fil.res_ani_bin;
            res_ani_bin = getfield(res_ani_bin, fie_num{2:end});
            mar_siz.pix = 7*(100/50);
            vie_ang_dir = [-120 30];
            h_fig = plo_clu_map_ani_spl(x_ani_bin, y_ani_bin, z_ani_bin, piv_col_pcx.div, ...
                res_ani_bin, mar_siz.pix, vie_ang_dir);
        end
        %
        function h_fig = plo_spa_den_met(obj, fie_num, pop)
            sam_fil = matfile(obj.fil_pat_sam);
            x_ani_bin = sam_fil.x_ani_bin;
            y_ani_bin = sam_fil.y_ani_bin;
            log_bin = sam_fil.log_bin;
            mar_siz.pix = 7;
            boo_bin = getfield(log_bin, fie_num{3:end});
            if pop == "dor"
                boo_bin.exc = boo_bin.exc & log_bin.dor;
                boo_bin.inh = boo_bin.inh & log_bin.dor;
            elseif pop == "ven"
                boo_bin.exc = boo_bin.exc & ~log_bin.dor;
                boo_bin.inh = boo_bin.inh & ~log_bin.dor;
            end
            h_fig = plo_spa_den_axo(x_ani_bin, y_ani_bin, boo_bin, mar_siz.pix);
        end
        function h_fig = plo_spa_den_dor_ven_met(obj, fie_num)
            sam_fil = matfile(obj.fil_pat_sam);
            x_ani_bin = sam_fil.x_ani_bin;
            y_ani_bin = sam_fil.y_ani_bin;
            log_bin = sam_fil.log_bin;
            vie_ang_dir = [-90 90];
            h_fig = plo_spa_den_dor_ven(x_ani_bin, y_ani_bin, log_bin, vie_ang_dir, fie_num);
        end
        function h_fig = plo_pie_axo_met(obj, fie_num)
            sam_fil = matfile(obj.fil_pat_sam);
            res_ani_bin = sam_fil.res_ani_bin;
            res_ani_bin = getfield(res_ani_bin, fie_num{:});
            res_bin = vertcat(res_ani_bin{:});
            h_fig = plo_pie(res_bin);
        end
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% cel onl
        function h_fig = plo_clu_map_cel_met(obj)
            sam_fil = matfile(obj.fil_pat_sam);
            dff_cel_fra = sam_fil.dff_cel_fra;
            clu_cel_k = sam_fil.clu_cel_k;
            bou_dur_ani = sam_fil.bou_dur_ani;
            k = 5;
            con_fil = matfile('\\home.ansatt.ntnu.no\kadiram\Documents\MATLAB\con_esp.mat');
            piv_col_pcx = con_fil.piv_col_pcx;
            fie_num = {'cel_onl_cel'};
            h_fig = plo_clu_map_cel(dff_cel_fra.bou.all, clu_cel_k.bou.all(:, k), bou_dur_ani.all, ...
                piv_col_pcx.axo.bou.all, obj.n_pla_str, fie_num);
        end
        function h_fig = plo_clu_map_ani_thr_cel_met(obj, fie_num)
            sam_fil = matfile(obj.fil_pat_sam);
            x_ani_cel = sam_fil.x_ani_cel;
            y_ani_cel = sam_fil.y_ani_cel;
            z_ani_cel = sam_fil.z_ani_cel;
            con_fil = matfile('\\home.ansatt.ntnu.no\kadiram\Documents\MATLAB\con_esp.mat');
            piv_col_pcx = con_fil.piv_col_pcx;
            piv_col_pcx = getfield(piv_col_pcx, fie_num{:});
            clu_ani_cel = sam_fil.clu_ani_cel;
            clu_ani_cel = getfield(clu_ani_cel, fie_num{3:end});
            [~, str_met] = gen_str(fie_num);
            clu_ani_cel = cellfun(@(ele_row_col) map_mat(ele_row_col, str_met), clu_ani_cel, ...
                'UniformOutput', false);
            mar_siz = con_fil.mar_siz;
            h_fig = plo_clu_map_ani_thr(x_ani_cel, y_ani_cel, z_ani_cel, ...
                piv_col_pcx, clu_ani_cel, mar_siz.cel);
        end
        %
        function h_fig = plo_dff_ang_met(obj)
            sam_fil = matfile(obj.fil_pat_sam);
            ang_bou = sam_fil.ang_bou;
            dff_bou_win = sam_fil.dff_bou_win;
            h_fig = plo_dff_bou(ang_bou, dff_bou_win(:, 2));
        end
        function h_fig = plo_pcc_dis_cel_met(obj, fie)
            sam_fil = matfile(obj.fil_pat_sam);
            con_fil = matfile('\\home.ansatt.ntnu.no\kadiram\Documents\MATLAB\con_esp.mat');
            dis_blo = con_fil.dis_blo;
            if obj.sam_idx == "axo_onl"
                pcc_blo_ani = sam_fil.r_blo_ani;
                dis_blo = dis_blo.tel;
                x_lim = 310;
                dis_blo(end) = x_lim;
            else
                pcc_blo_ani = sam_fil.pcc_blo_ani;
                dis_blo = dis_blo.rap.thr;
                x_lim = 150;
            end
            h_fig = plo_pcc_dis.all(pcc_blo_ani.(fie), dis_blo, x_lim);
        end
        function h_fig = plo_clu_map_spo_met(obj)
            sam_fil = matfile(obj.fil_pat_sam);
            dff_cel_fra = sam_fil.dff_cel_fra;
            clu_cel_k = sam_fil.clu_cel_k;
            bou_dur_ani = sam_fil.bou_dur_ani;
            k = 5;
            con_fil = matfile('\\home.ansatt.ntnu.no\kadiram\Documents\MATLAB\con_esp.mat');
            piv_col_pcx = con_fil.piv_col_pcx;
            fie_num = {'cel_onl_cel_bou_spo'};
            h_fig = plo_clu_map_cel(dff_cel_fra.bou.spo, clu_cel_k.bou.spo(:, k), bou_dur_ani.non, ...
                piv_col_pcx.axo.bou.all, obj.n_pla_str, fie_num);
        end
        function h_fig = plo_inh_exc_sig_met(obj, fie)
            sam_fil = matfile(obj.fil_pat_sam);
            con_fil = matfile('\\home.ansatt.ntnu.no\kadiram\Documents\MATLAB\con_esp.mat');
            win_len = con_fil.win_len;
            dff_fie_cel_fra = sam_fil.dff_fie_cel_fra;
            pha_win_len = win_len.dff.pha.drn.tai;
            log_fie_fie_cel = sam_fil.log_fie_fie_cel;
%             h_fig = plo_inh_exc_fie.smo_pub(dff_fie_cel_fra.(fie), log_fie_fie_cel.(fie).srt, ...
%                 pha_win_len);

%             h_fig = plo_inh_exc_fie.smo(dff_fie_cel_fra.(fie), log_fie_fie_cel.(fie).srt, ...
%                 pha_win_len);

            h_fig = plo_inh_exc_fie.raw(dff_fie_cel_fra.(fie), log_fie_fie_cel.(fie).srt, ...
                pha_win_len);
        end
        function h_fig = plo_inh_exc_spa_met(obj, fie)
            con_fil = matfile('\\home.ansatt.ntnu.no\kadiram\Documents\MATLAB\con_esp.mat');
            dis_blo = con_fil.dis_blo;
            sam_fil = matfile(obj.fil_pat_sam);
            fra_blo_ani = sam_fil.fra_blo_ani;
            h_fig = plo_inh_exc_spa(dis_blo.rap, fra_blo_ani.(fie));
        end
        function h_fig = plo_inh_exc_spa_all_met(obj)
            con_fil = matfile('\\home.ansatt.ntnu.no\kadiram\Documents\MATLAB\con_esp.mat');
            dis_blo = con_fil.dis_blo;
            sam_fil = matfile(obj.fil_pat_sam);
            fra_blo_ani = sam_fil.fra_blo_ani;
            h_fig = plo_inh_exc_spa_all(dis_blo.rap, fra_blo_ani);
        end
        function h_fig = plo_res_met(obj, fie_num)
            sam_fil = matfile(obj.fil_pat_sam);
            x_ani_cel = sam_fil.x_ani_cel;
            y_ani_cel = sam_fil.y_ani_cel;
            z_ani_cel = sam_fil.z_ani_cel;
            res_cel = sam_fil.res_fie_fie_cel;
            res_cel = getfield(res_cel, fie_num{:});
            vie_ang_dir = [-120 30];
            h_fig = plo_res(x_ani_cel, y_ani_cel, z_ani_cel, res_cel, vie_ang_dir);
        end
        function h_fig = plo_clu_met(obj)
            sam_fil = matfile(obj.fil_pat_sam);
            ioi_kxx_ani = sam_fil.ioi_kxx_ani;
            ioi_shu_kxx_ani = sam_fil.ioi_shu_kxx_ani;
            del_ioi_kxx_ani = sam_fil.del_ioi_kxx_ani;
            h_fig = plo_clu(ioi_kxx_ani, ioi_shu_kxx_ani, del_ioi_kxx_ani);
        end
        function h_fig = plo_clu_fid_met(obj)
            sam_fil = matfile(obj.fil_pat_sam);
            clu_fid_ani = sam_fil.clu_fid_ani;
            h_fig = plo_clu_fid(clu_fid_ani);
        end
        function h_fig = plo_cor_cor_met(obj)
            sam_fil = matfile(obj.fil_pat_sam);
            r_pai = sam_fil.r_pai;
            h_fig = plo_cor_cor(r_pai);
        end
        function h_fig = plo_cor_cor_den_met(obj)
            sam_fil = matfile(obj.fil_pat_sam);
            r_pai = sam_fil.r_pai;
            h_fig = plo_cor_cor_den(r_pai);
        end
        function h_fig = plo_pie_met(obj, fie_num)
            sam_fil = matfile(obj.fil_pat_sam);
            res_cel = sam_fil.res_fie_fie_cel;
            res_cel = getfield(res_cel, fie_num{:});
            h_fig = plo_pie(res_cel);
        end
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% gab
        function h_fig = plo_clu_sel_met(obj)
            sam_fil = matfile(obj.fil_pat_sam);
            clu_sel_ani_k = sam_fil.clu_sel_ani_k;
            k = 4;
            h_fig = plo_clu_sel(clu_sel_ani_k, k);
        end
        function h_fig = plo_pai_cor_met(obj)
            sam_fil = matfile(obj.fil_pat_sam);
            acc_ani = sam_fil.acc_ani;
            xcc_ani = sam_fil.xcc_ani;
            h_fig = plo_pai_cor(acc_ani, xcc_ani);
        end
        function h_fig = plo_inh_exc_ros_cau_met(obj)
            con_fil = matfile('\\home.ansatt.ntnu.no\kadiram\Documents\MATLAB\con_esp.mat');
            dis_blo = con_fil.dis_blo;
            sam_fil = matfile(obj.fil_pat_sam);
            fra_blo_ani = sam_fil.fra_blo_ani;
            h_fig = plo_inh_exc_ros_cau(dis_blo.rap.ros_cau, fra_blo_ani.ros_cau);
        end
        function h_fig = plo_inh_exc_dor_ven_met(obj)
            sam_fil = matfile(obj.fil_pat_sam);
            fra_blo_ani = sam_fil.fra_blo_ani;
            con_fil = matfile('\\home.ansatt.ntnu.no\kadiram\Documents\MATLAB\con_esp.mat');
            dis_blo = con_fil.dis_blo;
            h_fig = plo_inh_exc_ros_cau(dis_blo.rap.dor_ven, fra_blo_ani.dor_ven);
        end
        function h_fig = plo_inh_non_exc_sig_met(obj)
            sam_fil = matfile(obj.fil_pat_sam);
            dff_cel_fra = sam_fil.dff_cel_fra;
            res_fie_cel = sam_fil.res_fie_cel;
            bou_dur_ani = sam_fil.bou_dur_ani;
            con_fil = matfile('\\home.ansatt.ntnu.no\kadiram\Documents\MATLAB\con_esp.mat');
            piv_col_pcx = con_fil.piv_col_pcx;
            log_fie_fie_cel = sam_fil.log_fie_fie_cel;
            h_fig = plo_inh_non_exc_sig(dff_cel_fra.bou.all, res_fie_cel.srt, bou_dur_ani.all, ...
                piv_col_pcx.inh_non_exc, log_fie_fie_cel.gab.srt.all);
        end
        function h_fig = plo_inh_non_exc_zsc_met(obj)
            sam_fil = matfile(obj.fil_pat_sam);
            dff_cel_fra = sam_fil.dff_cel_fra;
            res_fie_cel = sam_fil.res_fie_cel;
            bou_dur_ani = sam_fil.bou_dur_ani;
            con_fil = matfile('\\home.ansatt.ntnu.no\kadiram\Documents\MATLAB\con_esp.mat');
            piv_col_pcx = con_fil.piv_col_pcx;
            log_fie_fie_cel = sam_fil.log_fie_fie_cel;
            h_fig = plo_inh_non_exc_sig(dff_cel_fra.bou.all, res_fie_cel.zsc, bou_dur_ani.all, ...
                piv_col_pcx.inh_non_exc, log_fie_fie_cel.gab.zsc.all);
        end
        function h_fig = plo_inh_exc_zsc_met(obj)
            sam_fil = matfile(obj.fil_pat_sam);
            fra_fie_ani = sam_fil.fra_fie_ani;
            h_fig = plo_inh_exc(fra_fie_ani.zsc);
        end
        function h_fig = plo_inh_exc_sig_sid_met(obj, fie)
            sam_fil = matfile(obj.fil_pat_sam);
            con_fil = matfile('\\home.ansatt.ntnu.no\kadiram\Documents\MATLAB\con_esp.mat');
            win_len = con_fil.win_len;
            
            %dff_fie_cel_fra = sam_fil.dff_fie_cel_fra;
            %pha_win_len = win_len.dff.pha.drn.tai;

            dff_fie_cel_fra = sam_fil.dff_cel_fra;
            pha_win_len = win_len.dff.pha.drn.gab;

            log_fie_fie_cel = sam_fil.log_fie_fie_cel;
            h_fig = plo_inh_exc_fie.smo_pub_sid(dff_fie_cel_fra.(fie), log_fie_fie_cel.(fie).srt, ...
                pha_win_len);
        end
        function h_fig = plo_gab_clu_met(obj, fie)
            sam_fil = matfile(obj.fil_pat_sam);
            x_cel = sam_fil.x_cel;
            y_cel = sam_fil.y_cel;
            z_cel = sam_fil.z_cel;
            log_fie_fie_cel = sam_fil.log_fie_fie_cel;
            h_fig = plo_gab_clu(x_cel, y_cel, z_cel, log_fie_fie_cel, fie);
        end
        function h_fig = plo_inh_exc_met(obj, fie)
            sam_fil = matfile(obj.fil_pat_sam);
            fra_fie_ani = sam_fil.fra_fie_ani;
            h_fig = plo_inh_exc(fra_fie_ani.(fie).srt);
        end
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% figures
        % behavioral
        function sav_fig_tai_ang(obj)
            h_fig = plo_tai_ang_met(obj);
            fil_pat = char(obj.fil_pat_fig_tai_ang);
            exp_fig(h_fig, fil_pat)
        end
        function sav_fig_spo_sta(obj)
            addpath(genpath('\\home.ansatt.ntnu.no\kadiram\Documents\MATLAB\figure'))
            load(obj.fil_pat_sam, 'ave_rat_win_ani_par', 'p_com_par')
            [n_com, n_par] = size(p_com_par);
            com_cel = cell(n_com, 1);
            for i = 1:n_com
                com_cel{i} = [i i + 1];
            end
            fig
            for i = 1:n_par
                subplot(n_par, 1, i)
                plo_kad_plo_mat(ave_rat_win_ani_par(:, :, i), obj.mar, obj.mar_siz)
                sigstar(com_cel, obj.fon_siz, p_com_par(:, i));
                if i == 1
                    title('Tail')
                elseif i == 2
                    title('Heart')
                elseif i == 3
                    title('Operculum')
                elseif i == 4
                    title('Mouth')
                elseif i == 5
                    title('Eye')
                end
                %
                pre_for_exp(obj.fon_siz)
                if i == n_par
                    xticks(1:n_com + 1)
                    xticklabels({'Baseline', 'Drug', 'After Taps 1', 'After Taps 2', 'After Taps 3'})
                else
                    xticks([])
                end
            end
            [~,h]=suplabel('Rate (Hz)','y');
            set(h,'FontSize',obj.fon_siz)
            n = length(obj.fil_pat_exp);
            [~,h]=suplabel([obj.tit '; n = ' sprintf('%d', n) ' animals'],'t', [.08 .08 .87 .9]);
            set(h,'FontSize',obj.fon_siz + 3)
            export_fig(char(obj.fil_pat_fig_spo_sta))
        end
        function sav_fig_lat_map(obj)
            plo_lat_map_met(obj)
            exp_map(obj)
        end
        function sav_fig_pro(obj)
            plo_pro_met(obj)
            exp_pro(obj)
        end
        function sav_fig_lat(obj)
            plo_lat_met(obj)
            exp_lat(obj)
        end
        function sav_fig_eth_spo(obj)
            plo_eth_spo_met(obj)
            exp_eth_spo(obj)
        end
        function sav_fig_eth_sti(obj)
            plo_eth_sti_met(obj)
            exp_eth_sti(obj)
            plo_eth_sti_hal_met(obj)
            exp_eth_sti_hal(obj)
        end
        function sav_fig_ave_pcx(obj)
            plo_ave_pcx_met(obj)
            exp_ave_pcx(obj)
        end
        function sav_fig_ang_his(obj)
            sam_fil = matfile(obj.fil_pat_sam);
            ang_bou = sam_fil.ang_bou;
            h_fig = plo_ang_his(ang_bou.all);
            exp_fig(h_fig, [char(obj.poo_dir) '\ang_his_all.png'])
            h_fig = plo_ang_his(ang_bou.vib);
            exp_fig(h_fig, [char(obj.poo_dir) '\ang_his_vib.png'])
            h_fig = plo_ang_his(ang_bou.non);
            exp_fig(h_fig, [char(obj.poo_dir) '\ang_his_non.png'])
        end
        % neural
        function sav_fig_neu_one(obj)
            stx_ani = 1;
            plo_neu_pix(obj, stx_ani)
            export_fig(char(obj.fil_pat_fig_neu_one))
        end
        function sav_fig_neu_two(obj)
            stx_ani = 7;
            plo_neu_pix(obj, stx_ani)
            export_fig(char(obj.fil_pat_fig_neu_two))
        end
        function sav_fig_neu_thr(obj)
            stx_ani = 13;
            plo_neu_pix(obj, stx_ani)
            export_fig(char(obj.fil_pat_fig_neu_thr))
        end
        function sav_fig_neu_fou(obj)
            stx_ani = 19;
            plo_neu_pix(obj, stx_ani)
            export_fig(char(obj.fil_pat_fig_neu_fou))
        end
        function sav_fig_neu_fiv(obj)
            stx_ani = 25;
            plo_neu_pix(obj, stx_ani)
            export_fig(char(obj.fil_pat_fig_neu_fiv))
        end
        function sav_fig_neu_six(obj)
            stx_ani = 31;
            plo_neu_pix(obj, stx_ani)
            export_fig(char(obj.fil_pat_fig_neu_six))
        end
        function sav_fig_neu_sev(obj)
            stx_ani = 37;
            plo_neu_pix(obj, stx_ani)
            export_fig(char(obj.fil_pat_fig_neu_sev))
        end
        function sav_fig_neu_eig(obj)
            stx_ani = 43;
            plo_neu_pix(obj, stx_ani)
            export_fig(char(obj.fil_pat_fig_neu_eig))
        end
        %
        function sav_fig_spo_one(obj)
            stx_ani = 1;
            plo_spo_met(obj, stx_ani)
            export_fig(char(obj.fil_pat_fig_spo_one))
            plo_spo_nor_met(obj, stx_ani)
            export_fig(char(obj.fil_pat_fig_spo_nor_one))
        end
        %
        function sav_fig_dff_com(obj)
            plo_dff_com_met(obj)
            export_fig(char(obj.fil_pat_fig_dff_com))
        end
        %
        function sav_fig_neu_cel_one(obj, sta_ani)
            plo_neu_cel_met(obj, sta_ani)
            export_fig(char(obj.fil_pat_fig_neu_cel_one))
        end
        function sav_fig_neu_cel_two(obj, sta_ani)
            plo_neu_cel_met(obj, sta_ani)
            export_fig(char(obj.fil_pat_fig_neu_cel_two))
        end
        %
        function sav_fig_neu_cel_sig(obj, n_ani_eve)
            plo_neu_cel_sig(obj, n_ani_eve)
            exp_neu_cel_sig(obj)
        end
        function sav_fig_neu_cel_sig_ext(obj, n_ani_eve)
            plo_neu_cel_sig_ext(obj, n_ani_eve)
            exp_neu_cel_sig_ext(obj)
        end
        function sav_fig_cor(obj, n_ani_eve)
            plo_tap_cor_met(obj, n_ani_eve)
            exp_cor(obj)
        end
        function sav_fig_cor_ext(obj, n_ani_eve)
            plo_tap_cor_ext_met(obj, n_ani_eve)
            exp_cor_ext(obj)
        end
        function sav_fig_str_cor(obj, n_ani_eve)
            load(obj.fil_pat_sam, 'pcc_ani_str_con')
            global str
            global n_str
            for i = 1:n_str
                pcc_ani_con = cell(obj.n_ani, obj.n_con);
                for j = 1:obj.n_ani
                    for k = 1:obj.n_con
                        pcc_ani_con{j, k} = pcc_ani_str_con{j, i, k};
                    end
                end
                plo_tap_cor(pcc_ani_con, obj.ani, str{i}, n_ani_eve)
                if i == 1
                    exp_hab_cor(obj)
                elseif i == 2
                    exp_dmx_cor(obj)
                else
                    exp_dlx_cor(obj)
                end
            end
        end
        function sav_fig_str_cor_ext(obj, n_ani_eve)
            load(obj.fil_pat_sam, 'pcc_ani_str_con')
            global str
            global n_str
            for i = 1:n_str
                pcc_ani_con = cell(obj.n_ani, obj.n_con);
                for j = 1:obj.n_ani
                    for k = 1:obj.n_con
                        pcc_ani_con{j, k} = pcc_ani_str_con{j, i, k};
                    end
                end
                plo_tap_cor_ext(pcc_ani_con, obj.ani, str{i}, n_ani_eve, obj.n_ani)
                if i == 1
                    exp_hab_cor_ext(obj)
                elseif i == 2
                    exp_dmx_cor_ext(obj)
                else
                    exp_dlx_cor_ext(obj)
                end
            end
        end
        %
        function sav_fig_spo_cor(obj)
            plo_spo_cor_met(obj)
            export_fig(char(obj.fil_pat_fig_spo_cor))
        end
        function sav_fig_bra_reg(obj)
            plo_bra_reg_met(obj)
            export_fig(char(obj.fil_pat_fig_bra_reg))
        end
        %
        function sav_fig_dua_clu_map_cel(obj)
            h_fig = plo_dua_clu_map_cel_met(obj);
            fil_pat = char(obj.fil_pat_fig_dua_clu_map_cel);
            exp_fig(h_fig, fil_pat)
        end
        function sav_fig_clu_map_cel_ani(obj, sta_ani_num, sto_ani_num)
            h_fig = plo_clu_map_cel_ani_met(obj, sta_ani_num, sto_ani_num);
            fil_pat = char(obj.fil_pat_fig_clu_map_cel_ani);
            exp_fig(h_fig, fil_pat)
        end
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% axo cel
        function sav_fig_cor_map(obj)
            sta_ani_num = 1;
            h_fig = plo_cor_map_met(obj, sta_ani_num);
            fil_pat = char(obj.fil_pat_fig_cor_map);
            exp_fig(h_fig, fil_pat)
        end
        function sav_fig_icx_res(obj)
            h_fig = plo_icx_res_met(obj);
            fil_pat = char(obj.fil_pat_fig_icx_res);
            exp_fig(h_fig, fil_pat)
        end
        function sav_fig_vib_res(obj)
            h_fig = plo_vib_res_met(obj);
            fil_pat = char(obj.fil_pat_fig_vib_res);
            exp_fig(h_fig, fil_pat)
        end
        function sav_fig_cor_his(obj)
            h_fig = plo_cor_his_met(obj);
            fil_pat = char(obj.fil_pat_fig_cor_his);
            exp_fig(h_fig, fil_pat)
        end
        function sav_fig_cdf(obj)
            h_fig = plo_cdf_met(obj);
            fil_pat = char(obj.fil_pat_fig_cdf);
            exp_fig(h_fig, fil_pat)
        end
        function sav_fig_clu_map_roi(obj)
            h_fig = plo_clu_map_roi_met(obj);
            exp_fig(h_fig, [char(obj.poo_dir) '\clu_map_roi.png'])
        end
        function sav_fig_inh_exc_axo(obj)
            h_fig = plo_inh_exc_axo_met(obj);
            exp_fig(h_fig, [char(obj.poo_dir) '\inh_exc_axo.png'])
        end
        function sav_fig_inh_exc_spa_axo(obj)
            con_fil = matfile('\\home.ansatt.ntnu.no\kadiram\Documents\MATLAB\con_esp.mat');
            dis_blo = con_fil.dis_blo;
            sam_fil = matfile(obj.fil_pat_sam);
            h_fig = plo_inh_exc_spa(dis_blo.for, sam_fil.fra_blo_ani);
            exp_fig(h_fig, [char(obj.poo_dir) '\inh_exc_spa.png'])
        end
        function sav_fig_cdf_exc_inh(obj)
            h_fig = plo_cdf_met(obj, 'exc');
            exp_fig(h_fig, [char(obj.poo_dir) '\cdf_exc.png'])
            h_fig = plo_cdf_met(obj, 'inh');
            exp_fig(h_fig, [char(obj.poo_dir) '\cdf_inh.png'])
        end
        function sav_fig_cor_dis(obj)
            h_fig = plo_cor_dis_met(obj, 'exc');
            exp_fig(h_fig, [char(obj.poo_dir) '\cor_dis_exc.png'])
            h_fig = plo_cor_dis_met(obj, 'inh');
            exp_fig(h_fig, [char(obj.poo_dir) '\cor_dis_inh.png'])
        end
        function sav_fig_cor_dis_all(obj)
            h_fig = plo_cor_dis_all_met(obj, 'tai');
            exp_fig(h_fig, [char(obj.poo_dir) '\cor_dis_all_tai.png'])
%             h_fig = plo_cor_dis_all_met(obj, 'spo');
%             exp_fig(h_fig, [char(obj.poo_dir) '\cor_dis_all_spo.png'])
        end
        function sav_fig_edf(obj)
            h_fig = plo_edf_met(obj, 'tai');
            exp_fig(h_fig, [char(obj.poo_dir) '\edf_tai.png'])
%             h_fig = plo_edf_met(obj, 'spo');
%             exp_fig(h_fig, [char(obj.poo_dir) '\edf_spo.png'])
        end
        function sav_fig_inh_exc_sig_roi(obj)
            h_fig = plo_inh_exc_sig_roi_met(obj);
            exp_fig(h_fig, [char(obj.poo_dir) '\inh_exc_sig_roi.png'])
        end
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% axo onl
        function sav_fig_clu_map_ani(obj, sta_ani_num, sto_ani_num, fie_num)
            h_fig = plo_clu_map_ani_met(obj, sta_ani_num, sto_ani_num, fie_num);
            str_fie = gen_str(fie_num);
            exp_fig(h_fig, [char(obj.poo_dir) '\clu_map_ani' str_fie '_' num2str(sta_ani_num) '_' ...
                num2str(sto_ani_num) '.png'])
        end
        function sav_fig_clu_map_ani_thr(obj)
            h_fig = plo_clu_map_ani_thr_met(obj);
            fil_pat = char(obj.fil_pat_fig_clu_map_ani_thr);
            exp_fig(h_fig, fil_pat)
        end
        function sav_fig_inh_exc_ani_thr(obj)
            fie_num = {'axo', 'bou', 'all'};
            h_fig = plo_inh_exc_ani_thr_met(obj, fie_num);
            exp_fig(h_fig, [char(obj.poo_dir) '\inh_exc_ani_thr_all.png'])
            fie_num = {'axo', 'bou', 'vib'};
            h_fig = plo_inh_exc_ani_thr_met(obj, fie_num);
            exp_fig(h_fig, [char(obj.poo_dir) '\inh_exc_ani_thr_vib.png'])
            fie_num = {'axo', 'bou', 'non'};
            h_fig = plo_inh_exc_ani_thr_met(obj, fie_num);
            exp_fig(h_fig, [char(obj.poo_dir) '\inh_exc_ani_thr_non.png'])
        end
        function sav_fig_inh_exc_spa_axo_onl(obj)
            con_fil = matfile('\\home.ansatt.ntnu.no\kadiram\Documents\MATLAB\con_esp.mat');
            dis_blo = con_fil.dis_blo;
            sam_fil = matfile(obj.fil_pat_sam);
            fra_dow_blo_ani = sam_fil.fra_dow_blo_ani;
            h_fig = plo_inh_exc_spa(dis_blo.for, fra_dow_blo_ani.all);
            exp_fig(h_fig, [char(obj.poo_dir) '\inh_exc_spa_all.png'])
            h_fig = plo_inh_exc_spa(dis_blo.for, fra_dow_blo_ani.vib);
            exp_fig(h_fig, [char(obj.poo_dir) '\inh_exc_spa_vib.png'])
            h_fig = plo_inh_exc_spa(dis_blo.for, fra_dow_blo_ani.non);
            exp_fig(h_fig, [char(obj.poo_dir) '\inh_exc_spa_non.png'])
        end
        function sav_fig_inh_exc_ani_sin(obj)
            fie_num = {'axo', 'bou', 'all'};
            h_fig = plo_inh_exc_ani_sin_met(obj, fie_num);
            exp_fig(h_fig, [char(obj.poo_dir) '\inh_exc_ani_sin.png'])
        end
        function sav_fig_inh_exc_sin(obj)
            fie_num = {'axo', 'bou', 'all'};
            h_fig = plo_inh_exc_sin_met(obj, fie_num);
            exp_fig(h_fig, [char(obj.poo_dir) '\inh_exc_sin.png'])
        end
        function sav_fig_spa_den(obj)
            fie_num = {'axo', 'bou', 'all', 'srt'};
            h_fig = plo_spa_den_met(obj, fie_num);
            exp_fig(h_fig, [char(obj.poo_dir) '\spa_den.png'])
        end
        function sav_fig_inh_exc_sin_bou_dur(obj)
            h_fig = plo_inh_exc_sin_bou_dur_met(obj);
            exp_fig(h_fig, [char(obj.poo_dir) '\inh_exc_sin_bou_dur.png'])
        end
        function sav_fig_inh_exc_ani_bin(obj)
            fie_num = {'axo', 'bou', 'all'};
            h_fig = plo_inh_exc_ani_bin_met(obj, fie_num);
            exp_fig(h_fig, [char(obj.poo_dir) '\inh_exc_ani_bin.png'])
        end
        %
        function sav_fig_bin_sig_raw(obj)
            h_fig = plo_bin_sig_raw_met(obj);
            exp_fig(h_fig, [char(obj.poo_dir) '\bin_sig_raw.png'])
        end
        function sav_fig_bin_sig_all(obj)
            sam_fil = matfile(obj.fil_pat_sam);
            dff_lig_bin_fra = sam_fil.dff_lig_bin_fra;
            log_bin = sam_fil.log_bin;
            con_fil = matfile('\\home.ansatt.ntnu.no\kadiram\Documents\MATLAB\con_esp.mat');
            win_len = con_fil.win_len;
            h_fig = plo_inh_exc_fie.smo_pub(dff_lig_bin_fra, log_bin.lig.srt, win_len.dff.pha.drn.tai);
            exp_fig(h_fig, [char(obj.poo_dir) '\bin_sig_lig.png'])

            dff_sho_bin_fra = sam_fil.dff_sho_bin_fra;
            h_fig = plo_inh_exc_fie.smo_pub(dff_sho_bin_fra, log_bin.sho.srt, win_len.dff.pha.drn.tai);
            exp_fig(h_fig, [char(obj.poo_dir) '\bin_sig_sho.png'])

            dff_tap_bin_fra = sam_fil.dff_tap_bin_fra;
            h_fig = plo_inh_exc_fie.smo_pub(dff_tap_bin_fra, log_bin.tap.srt, win_len.dff.pha.drn.tai);
            exp_fig(h_fig, [char(obj.poo_dir) '\bin_sig_tap.png'])

            dff_bin_fra = sam_fil.dff_bin_fra;
            fie = 'srt';
            h_fig = plo_inh_exc_fie.smo_pub(dff_bin_fra.bou.all, log_bin.all.(fie), ...
                win_len.dff.pha.drn.tai);
            exp_fig(h_fig, [char(obj.poo_dir) '\bin_sig.png'])
        end
        function sav_fig_bin_sig_lig(obj)
            h_fig = plo_bin_sig_lig_met(obj);
            exp_fig(h_fig, [char(obj.poo_dir) '\bin_sig_lig.png'])
        end
        function sav_fig_bin_sig_sho(obj)
            h_fig = plo_bin_sig_sho_met(obj);
            exp_fig(h_fig, [char(obj.poo_dir) '\bin_sig_sho.png'])
        end
        function sav_fig_bin_sig_tap(obj)
            h_fig = plo_bin_sig_tap_met(obj);
            exp_fig(h_fig, [char(obj.poo_dir) '\bin_sig_tap.png'])
        end
        function sav_fig_bin_sig(obj)
            h_fig = plo_bin_sig_met(obj);
            exp_fig(h_fig, [char(obj.poo_dir) '\bin_sig.png'])
        end
        %
        function sav_fig_inh_exc_spl(obj)
            sam_fil = matfile(obj.fil_pat_sam);
            x_ani_bin = sam_fil.x_ani_bin;
            y_ani_bin = sam_fil.y_ani_bin;
            z_ani_bin = sam_fil.z_ani_bin;
            con_fil = matfile('\\home.ansatt.ntnu.no\kadiram\Documents\MATLAB\con_esp.mat');
            piv_col_pcx = con_fil.piv_col_pcx;
            res_ani_bin = sam_fil.res_ani_bin;
            %mar_siz.pix = 7*(100/50);
            mar_siz.pix = 5;
            vie_ang_dir = [-120 30];

%             fie_num = {'axo', 'lig', 'srt'};
%             res_lig_ani_bin = getfield(res_ani_bin, fie_num{2:end});
%             h_fig = plo_clu_map_ani_spl(x_ani_bin, y_ani_bin, z_ani_bin, piv_col_pcx.div, ...
%                 res_lig_ani_bin, mar_siz.pix, vie_ang_dir);
%             exp_fig(h_fig, [char(obj.poo_dir) '\inh_exc_spl_lig.png'])
            
            fie_num = {'axo', 'sho', 'srt'};
            res_sho_ani_bin = getfield(res_ani_bin, fie_num{2:end});
            h_fig = plo_clu_map_ani_spl(x_ani_bin, y_ani_bin, z_ani_bin, piv_col_pcx.div, ...
                res_sho_ani_bin, mar_siz.pix, vie_ang_dir);
            exp_fig(h_fig, [char(obj.poo_dir) '\inh_exc_spl_sho.png'])
            
%             fie_num = {'axo', 'tap', 'srt'};
%             res_tap_ani_bin = getfield(res_ani_bin, fie_num{2:end});
%             h_fig = plo_clu_map_ani_spl(x_ani_bin, y_ani_bin, z_ani_bin, piv_col_pcx.div, ...
%                 res_tap_ani_bin, mar_siz.pix, vie_ang_dir);
%             exp_fig(h_fig, [char(obj.poo_dir) '\inh_exc_spl_tap.png'])
% 
%             fie_num = {'axo', 'bou', 'all', 'srt'};
%             res_ani_bin = getfield(res_ani_bin, fie_num{2:end});
%             h_fig = plo_clu_map_ani_spl(x_ani_bin, y_ani_bin, z_ani_bin, piv_col_pcx.div, ...
%                 res_ani_bin, mar_siz.pix, vie_ang_dir);
%             exp_fig(h_fig, [char(obj.poo_dir) '\inh_exc_spl.png'])
        end
        %
        function sav_fig_spa_den_srt(obj)
            fie_num = {'axo', 'bou', 'all', 'srt_010'};
            h_fig = plo_spa_den_met(obj, fie_num);
            exp_fig(h_fig, [char(obj.poo_dir) '\spa_den_010.png'])
            %
            fie_num = {'axo', 'bou', 'all', 'srt_001'};
            h_fig = plo_spa_den_met(obj, fie_num);
            exp_fig(h_fig, [char(obj.poo_dir) '\spa_den_001.png'])
        end
        function sav_fig_spa_den_dvx(obj)
            fie_num = {'axo', 'bou', 'all', 'srt'};
            h_fig = plo_spa_den_met(obj, fie_num, "dor");
            exp_fig(h_fig, [char(obj.poo_dir) '\spa_den_dor.png'])
            h_fig = plo_spa_den_met(obj, fie_num, "ven");
            exp_fig(h_fig, [char(obj.poo_dir) '\spa_den_ven.png'])
            %
            fie_num = {'axo', 'bou', 'all', 'srt_010'};
            h_fig = plo_spa_den_met(obj, fie_num, "dor");
            exp_fig(h_fig, [char(obj.poo_dir) '\spa_den_dor_010.png'])
            h_fig = plo_spa_den_met(obj, fie_num, "ven");
            exp_fig(h_fig, [char(obj.poo_dir) '\spa_den_ven_010.png'])
            %
            fie_num = {'axo', 'bou', 'all', 'srt_001'};
            h_fig = plo_spa_den_met(obj, fie_num, "dor");
            exp_fig(h_fig, [char(obj.poo_dir) '\spa_den_dor_001.png'])
            h_fig = plo_spa_den_met(obj, fie_num, "ven");
            exp_fig(h_fig, [char(obj.poo_dir) '\spa_den_ven_001.png'])
        end
        function sav_fig_spa_den_dor_ven(obj)
            fie_num = {'axo', 'bou', 'lig', 'srt'};
            sam_fil = matfile(obj.fil_pat_sam);
            x_ani_bin = sam_fil.x_ani_bin;
            y_ani_bin = sam_fil.y_ani_bin;
            log_bin = sam_fil.log_bin;
            vie_ang_dir = [-90 90];
            h_fig = plo_spa_den_dor_ven(x_ani_bin, y_ani_bin, log_bin, vie_ang_dir, fie_num);
            exp_fig(h_fig, [char(obj.poo_dir) '\spa_den_dor_ven_str_lig.png'])

            fie_num = {'axo', 'bou', 'sho', 'srt'};
            h_fig = plo_spa_den_dor_ven(x_ani_bin, y_ani_bin, log_bin, vie_ang_dir, fie_num);
            exp_fig(h_fig, [char(obj.poo_dir) '\spa_den_dor_ven_str_sho.png'])

            fie_num = {'axo', 'bou', 'tap', 'srt'};
            h_fig = plo_spa_den_dor_ven(x_ani_bin, y_ani_bin, log_bin, vie_ang_dir, fie_num);
            exp_fig(h_fig, [char(obj.poo_dir) '\spa_den_dor_ven_str_tap.png'])
            
            fie_num = {'axo', 'bou', 'all', 'srt'};
            h_fig = plo_spa_den_dor_ven(x_ani_bin, y_ani_bin, log_bin, vie_ang_dir, fie_num);
            exp_fig(h_fig, [char(obj.poo_dir) '\spa_den_dor_ven_str.png'])
        end
        function sav_fig_pie_axo(obj)
            sam_fil = matfile(obj.fil_pat_sam);
            res_fie_ani_bin = sam_fil.res_ani_bin;

%             fie_num = {'lig', 'srt'};
%             res_ani_bin = getfield(res_fie_ani_bin, fie_num{:});
%             res_bin = vertcat(res_ani_bin{:});
%             h_fig = plo_pie(res_bin);
%             exp_fig(h_fig, [char(obj.poo_dir) '\pie_lig.png'])

            fie_num = {'sho', 'srt'};
            res_ani_bin = getfield(res_fie_ani_bin, fie_num{:});
            res_bin = vertcat(res_ani_bin{:});
            h_fig = plo_pie(res_bin);
            exp_fig(h_fig, [char(obj.poo_dir) '\pie_sho.png'])
            
%             fie_num = {'tap', 'srt'};
%             res_ani_bin = getfield(res_fie_ani_bin, fie_num{:});
%             res_bin = vertcat(res_ani_bin{:});
%             h_fig = plo_pie(res_bin);
%             exp_fig(h_fig, [char(obj.poo_dir) '\pie_tap.png'])
%             
%             fie_num = {'bou', 'all', 'srt'};
%             res_ani_bin = getfield(res_fie_ani_bin, fie_num{:});
%             res_bin = vertcat(res_ani_bin{:});
%             h_fig = plo_pie(res_bin);
%             exp_fig(h_fig, [char(obj.poo_dir) '\pie_bou_all.png'])
        end
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% cel onl
        function sav_fig_clu_map_cel(obj)
            h_fig = plo_clu_map_cel_met(obj);
            fil_pat = char(obj.fil_pat_fig_clu_map_cel);
            exp_fig(h_fig, fil_pat)
        end
        %
        function sav_fig_pcc_dis(obj)
            %sav_fig_pcc_dis_cel(obj, 'ong')
            
            sam_fil = matfile(obj.fil_pat_sam);
            con_fil = matfile('\\home.ansatt.ntnu.no\kadiram\Documents\MATLAB\con_esp.mat');
            dis_blo = con_fil.dis_blo;
            if obj.sam_idx == "axo_onl"
                pcc_blo_ani = sam_fil.r_blo_ani;
                dis_blo = dis_blo.tel;
                x_lim = 310;
                dis_blo(end) = x_lim;
            else
                pcc_blo_ani = sam_fil.pcc_blo_ani;
                dis_blo = dis_blo.rap.thr;
                x_lim = 150;
            end

            fie = 'lig';
            h_fig = plo_pcc_dis.all(pcc_blo_ani.(fie), dis_blo, x_lim);
            sav_dir = char(obj.poo_dir);
            exp_fig(h_fig, [sav_dir '\cor_dis_' fie '.png'])

            fie = 'sho';
            h_fig = plo_pcc_dis.all(pcc_blo_ani.(fie), dis_blo, x_lim);
            exp_fig(h_fig, [sav_dir '\cor_dis_' fie '.png'])

            fie = 'tap';
            h_fig = plo_pcc_dis.all(pcc_blo_ani.(fie), dis_blo, x_lim);
            exp_fig(h_fig, [sav_dir '\cor_dis_' fie '.png'])

            fie = 'tai';
            h_fig = plo_pcc_dis.all(pcc_blo_ani.(fie), dis_blo, x_lim);
            exp_fig(h_fig, [sav_dir '\cor_dis_' fie '.png'])
        end
        function sav_fig_pcc_dis_cel(obj, fie)
            h_fig = plo_pcc_dis_cel_met(obj, fie);
            sav_dir = char(obj.poo_dir);
            %sav_dir = char(obj.poo_dir_tem);
            exp_fig(h_fig, [sav_dir '\cor_dis_' fie '.png'])
        end
        function sav_fig_clu_map_spo(obj)
            h_fig = plo_clu_map_spo_met(obj);
            exp_fig(h_fig, [char(obj.poo_dir) '\clu_map_spo.png'])
        end
        function sav_fig_dff_ang(obj)
            sam_fil = matfile(obj.fil_pat_sam);
            ang_bou = sam_fil.ang_bou;
            dff_bou_win = sam_fil.dff_bou_win;
            h_fig = plo_dff_bou(ang_bou.all, dff_bou_win.all(:, 2));
            exp_fig(h_fig, [char(obj.poo_dir) '\dff_ang_all.png'])
            h_fig = plo_dff_bou(ang_bou.vib, dff_bou_win.vib(:, 2));
            exp_fig(h_fig, [char(obj.poo_dir) '\dff_ang_vib.png'])
            h_fig = plo_dff_bou(ang_bou.non, dff_bou_win.non(:, 2));
            exp_fig(h_fig, [char(obj.poo_dir) '\dff_ang_non.png'])
        end
        function sav_fig_inh_exc_cel_onl(obj)
            sav_fig_inh_exc_sig(obj)
            sav_fig_inh_exc_spa(obj)
            sav_fig_res(obj)
        end
        function sav_fig_inh_exc_sig(obj)
            h_fig = plo_inh_exc_sig_met(obj, 'lig');
            sav_dir = char(obj.poo_dir);
            exp_fig(h_fig, [sav_dir '\inh_exc_sig_lig.png'])
            h_fig = plo_inh_exc_sig_met(obj, 'sho');
            exp_fig(h_fig, [sav_dir '\inh_exc_sig_sho.png'])
            h_fig = plo_inh_exc_sig_met(obj, 'tap');
            exp_fig(h_fig, [sav_dir '\inh_exc_sig_tap.png'])
            h_fig = plo_inh_exc_sig_met(obj, 'bou_all');
            exp_fig(h_fig, [sav_dir '\inh_exc_sig_bou_all.png'])
        end
        function sav_fig_inh_exc_spa(obj)
            h_fig = plo_inh_exc_spa_met(obj, 'lig');
            exp_fig(h_fig, [char(obj.poo_dir) '\inh_exc_spa_lig.png'])
            h_fig = plo_inh_exc_spa_met(obj, 'sho');
            exp_fig(h_fig, [char(obj.poo_dir) '\inh_exc_spa_sho.png'])
            h_fig = plo_inh_exc_spa_met(obj, 'tap');
            exp_fig(h_fig, [char(obj.poo_dir) '\inh_exc_spa_tap.png'])
            h_fig = plo_inh_exc_spa_met(obj, 'tai');%%%!!!!! bou_all
            exp_fig(h_fig, [char(obj.poo_dir) '\inh_exc_spa_bou_all.png'])
        end
        function sav_fig_res(obj)
            h_fig = plo_res_met(obj, {'lig', 'srt'});
            exp_fig(h_fig, [char(obj.poo_dir) '\res_lig.png'])
            h_fig = plo_res_met(obj, {'sho', 'srt'});
            exp_fig(h_fig, [char(obj.poo_dir) '\res_sho.png'])
            h_fig = plo_res_met(obj, {'tap', 'srt'});
            exp_fig(h_fig, [char(obj.poo_dir) '\res_tap.png'])
            h_fig = plo_res_met(obj, {'bou_all', 'srt'});
            exp_fig(h_fig, [char(obj.poo_dir) '\res_bou_all.png'])
        end
        function sav_fig_inh_exc_spa_all(obj)
            h_fig = plo_inh_exc_spa_all_met(obj);
            exp_fig(h_fig, [char(obj.poo_dir) '\inh_exc_spa_all.png'])
        end
        function sav_fig_clu(obj)
            h_fig = plo_clu_met(obj);
            exp_fig(h_fig, [char(obj.poo_dir) '\clu.png'])
        end
        function sav_fig_clu_fid(obj)
            h_fig = plo_clu_fid_met(obj);
            exp_fig(h_fig, [char(obj.poo_dir) '\clu_fid.png'])
        end
        function sav_fig_cor_cor(obj)
            h_fig = plo_cor_cor_met(obj);
            exp_fig(h_fig, [char(obj.poo_dir) '\cor_cor.png'])
        end
        function sav_fig_cor_cor_den(obj)
            h_fig = plo_cor_cor_den_met(obj);
            exp_fig(h_fig, [char(obj.poo_dir) '\cor_cor_den.png'])
        end
        function sav_fig_pie(obj)
            h_fig = plo_pie_met(obj, {'lig', 'srt'});
            %exp_fig(h_fig, [char(obj.poo_dir) '\pie_lig.png'])
            h_fig.Children.Proportions

            h_fig = plo_pie_met(obj, {'sho', 'srt'});
            %exp_fig(h_fig, [char(obj.poo_dir) '\pie_sho.png'])
            h_fig.Children.Proportions

            h_fig = plo_pie_met(obj, {'tap', 'srt'});
            %exp_fig(h_fig, [char(obj.poo_dir) '\pie_tap.png'])
            h_fig.Children.Proportions

            h_fig = plo_pie_met(obj, {'bou_all', 'srt'});
            %exp_fig(h_fig, [char(obj.poo_dir) '\pie_bou_all.png'])
            h_fig.Children.Proportions
        end
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% gab
        function sav_fig_gab_tog(obj)
            sav_fig_gab_all(obj)
            sav_fig_gab_neu_beh(obj)
            sav_fig_gab_ong(obj)
        end
        %
        function sav_fig_gab_neu_beh(obj)
            sav_fig_inh_exc(obj)
            sav_fig_inh_exc_ros_cau(obj)
        end
        function sav_fig_gab_ong(obj)
            sav_fig_clu_sel(obj)
            sav_fig_pai_cor(obj)
        end
        %
        function sav_fig_clu_sel(obj)
            h_fig = plo_clu_sel_met(obj);
            exp_fig(h_fig, [char(obj.poo_dir) '\clu_sel.png'])
        end
        function sav_fig_pai_cor(obj)
            h_fig = plo_pai_cor_met(obj);
            exp_fig(h_fig, [char(obj.poo_dir) '\pai_cor.png'])
        end
        function sav_fig_inh_exc_ros_cau(obj)
            h_fig = plo_inh_exc_ros_cau_met(obj);
            exp_fig(h_fig, [char(obj.poo_dir) '\inh_exc_ros_cau.png'])
            h_fig = plo_inh_exc_dor_ven_met(obj);
            exp_fig(h_fig, [char(obj.poo_dir) '\inh_exc_dor_ven.png'])
        end
        function sav_fig_inh_exc_sig_sid(obj)
            h_fig = plo_inh_exc_sig_sid_met(obj, 'lig');
            sav_dir = char(obj.poo_dir);
            exp_fig(h_fig, [sav_dir '\inh_exc_sig_lig.png'])
            h_fig = plo_inh_exc_sig_sid_met(obj, 'sho');
            exp_fig(h_fig, [sav_dir '\inh_exc_sig_sho.png'])
            h_fig = plo_inh_exc_sig_sid_met(obj, 'tap');
            exp_fig(h_fig, [sav_dir '\inh_exc_sig_tap.png'])
            h_fig = plo_inh_exc_sig_sid_met(obj, 'bou_all');
            exp_fig(h_fig, [sav_dir '\inh_exc_sig_bou_all.png'])
        end
        function sav_fig_gab_clu(obj)
            h_fig = plo_gab_clu_met(obj, 'lig');
            exp_fig(h_fig, [char(obj.poo_dir) '\gab_clu_lig.png'])
            h_fig = plo_gab_clu_met(obj, 'sho');
            exp_fig(h_fig, [char(obj.poo_dir) '\gab_clu_sho.png'])
            h_fig = plo_gab_clu_met(obj, 'tap');
            exp_fig(h_fig, [char(obj.poo_dir) '\gab_clu_tap.png'])
            h_fig = plo_gab_clu_met(obj, 'bou_all');
            exp_fig(h_fig, [char(obj.poo_dir) '\gab_clu_bou_all.png'])
        end
        function sav_fig_inh_exc(obj)
            h_fig = plo_inh_exc_met(obj, 'lig');
            exp_fig(h_fig, [char(obj.poo_dir) '\inh_exc_lig.png'])
            h_fig = plo_inh_exc_met(obj, 'sho');
            exp_fig(h_fig, [char(obj.poo_dir) '\inh_exc_sho.png'])
            h_fig = plo_inh_exc_met(obj, 'tap');
            exp_fig(h_fig, [char(obj.poo_dir) '\inh_exc_tap.png'])
            h_fig = plo_inh_exc_met(obj, 'bou_all');
            exp_fig(h_fig, [char(obj.poo_dir) '\inh_exc_bou_all.png'])
        end
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% all
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% pre
        function sav_rec_all(obj, beg_ani)
            nam_ani = cell(obj.n_ani, 1);
            for i = 1:obj.n_ani
                nam_ani{i} = convertStringsToChars(obj.ani(i));
            end
            for i = beg_ani:obj.n_ani
                disp(i)
                rec_fun_i = str2func(['rec_fun.' nam_ani{i}]);
                sti = rec_fun_i();
                sav_rec(sti)
            end
        end
        function sav_ima_cal_all(obj)
            nam_ani = cell(obj.n_ani, 1);
            for i = 1:obj.n_ani
                nam_ani{i} = convertStringsToChars(obj.ani(i));
            end
            for i = 1:obj.n_ani
                disp(i)
                rec_fun_i = str2func(['rec_fun.' nam_ani{i}]);
                sti = rec_fun_i();
                sav_ima_cal(sti)
            end
        end
        function pri_factor_meter_all(obj)
            nam_ani = cell(obj.n_ani, 1);
            for i = 1:obj.n_ani
                nam_ani{i} = convertStringsToChars(obj.ani(i));
            end
            beg_ani = 1;
            for i = beg_ani:obj.n_ani
                disp(i)
                rec_fun_i = str2func(['rec_fun.' nam_ani{i}]);
                sti = rec_fun_i();
                disp(sti.factor_meter)
            end
        end
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% behavioral
        function app_syn_all(obj, sta_ani)
            nam_ani = cell(obj.n_ani, 1);
            for i = 1:obj.n_ani
                nam_ani{i} = convertStringsToChars(obj.ani(i));
            end
            for i = sta_ani:obj.n_ani
                disp(i)
                rec_fun_i = str2func(['rec_fun.' nam_ani{i}]);
                sti = rec_fun_i();
                if sti.tai
                    [man_sec, ini_del] = app_syn(sti);
                end
            end
        end
        function app_syn_axo_all(obj, sta_ani)
            nam_ani = cell(obj.n_ani, 1);
            for i = 1:obj.n_ani
                nam_ani{i} = convertStringsToChars(obj.ani(i));
            end
            for i = sta_ani:obj.n_ani
                disp(i)
                rec_fun_i = str2func(['rec_fun.' nam_ani{i}]);
                sti = rec_fun_i();
                if sti.tai
                    app_syn_axo(sti)
                end
            end
        end
        function app_tai_all(obj, sta_ani)
            nam_ani = cell(obj.n_ani, 1);
            for i = 1:obj.n_ani
                nam_ani{i} = convertStringsToChars(obj.ani(i));
            end
            %parfor i = sta_ani:obj.n_ani
            for i = sta_ani:obj.n_ani
                disp(i)
                rec_fun_i = str2func(['rec_fun.' nam_ani{i}]);
                sti = rec_fun_i();
                if sti.tai
                    app_tai(sti)
                end
            end
        end
        function app_par_tai_all(obj)
            nam_ani = cell(obj.n_ani, 1);
            for i = 1:obj.n_ani
                nam_ani{i} = convertStringsToChars(obj.ani(i));
            end
            parfor i = 1:obj.n_ani
                disp(i)
                rec_fun_i = str2func(['rec_fun.' nam_ani{i}]);
                sti = rec_fun_i();
                if sti.tai
                    app_par_tai(sti)
                end
            end
        end
        %
        function app_bou_all(obj)
            nam_ani = cell(obj.n_ani, 1);
            for i = 1:obj.n_ani
                nam_ani{i} = convertStringsToChars(obj.ani(i));
            end
            %parfor i = 1:obj.n_ani
            for i = 1:obj.n_ani
                disp(i)
                rec_fun_i = str2func(['rec_fun.' nam_ani{i}]);
                sti = rec_fun_i();
                if sti.tai
                    app_bou(sti)
                end
            end
        end
        function app_par_bou_all(obj)
            nam_ani = cell(obj.n_ani, 1);
            for i = 1:obj.n_ani
                nam_ani{i} = convertStringsToChars(obj.ani(i));
            end
            for i = 1:obj.n_ani
                disp(i)
                rec_fun_i = str2func(['rec_fun.' nam_ani{i}]);
                sti = rec_fun_i();
                if sti.tai
                    app_par_bou(sti)
                end
            end
        end
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% neural
        function sav_ima_g2r_all(obj)
            nam_ani = cell(obj.n_ani, 1);
            for i = 1:obj.n_ani
                nam_ani{i} = convertStringsToChars(obj.ani(i));
            end
            %parfor i = 1:obj.n_ani
            for i = 1:obj.n_ani
                disp(i)
                rec_fun_i = str2func(['rec_fun.' nam_ani{i}]);
                sti = rec_fun_i();
                sav_ima_g2r(sti)
            end
        end
        function app_ext_all(obj, sta_ani)
            nam_ani = cell(obj.n_ani, 1);
            for i = 1:obj.n_ani
                nam_ani{i} = convertStringsToChars(obj.ani(i));
            end
            parfor i = sta_ani:obj.n_ani
            %for i = 1:obj.n_ani
                disp(i)
                rec_fun_i = str2func(['rec_fun.' nam_ani{i}]);
                sti = rec_fun_i();
                if sti.bri && sti.cel_det
                    app_ext(sti)
                end
            end
        end
        %
        function sav_ali_mas_met_all(obj, sta_ani)
            for i = sta_ani:obj.n_ani
                disp(i)
                rec_fun_i = str2func(['rec_fun.' convertStringsToChars(obj.ani(i))]);
                sti = rec_fun_i();
                sav_ali_mas_met(sti)
            end
        end
        function ali_cal_ima_all(obj, sta_ani)
            nam_ani = cell(obj.n_ani, 1);
            for i = 1:obj.n_ani
                nam_ani{i} = convertStringsToChars(obj.ani(i));
            end
            for i = sta_ani:obj.n_ani
                disp(i)
                rec_fun_i = str2func(['rec_fun.' nam_ani{i}]);
                sti = rec_fun_i();
                ali_cal_ima(sti)
            end
        end
        %
        function app_neu_pix_dat_all(obj, sta_ani) % spo, and raw
            parfor i = sta_ani:obj.n_ani
            %for i = sta_ani:obj.n_ani
                disp(i)
                rec_fun_i = str2func(['rec_fun.' convertStringsToChars(obj.ani(i))]);
                tap = rec_fun_i();
                if tap.ali_cax
                    app_neu_pix_dat(tap)
                end
            end
        end
        function app_neu_spo_tai_all(obj, sto_ani)
            parfor i = 1:sto_ani
            %for i = 1:obj.n_ani
                disp(i)
                rec_fun_i = str2func(['rec_fun.' convertStringsToChars(obj.ani(i))]);
                tap = rec_fun_i();
                if tap.ali_cax
                    app_neu_spo_tai(tap)
                end
            end
        end
        function app_neu_dat_raw_all(obj, sta_ani)
            parfor i = sta_ani:obj.n_ani
            %for i = 1:obj.n_ani
                disp(i)
                rec_fun_i = str2func(['rec_fun.' convertStringsToChars(obj.ani(i))]);
                tap = rec_fun_i();
                if tap.ali_cax
                    app_neu_dat_raw(tap)
                end
            end
        end
        %
        function app_fra_sta_sto_all(obj)
            nam_ani = cell(obj.n_ani, 1);
            for i = 1:obj.n_ani
                nam_ani{i} = convertStringsToChars(obj.ani(i));
            end
            parfor i = 1:obj.n_ani
            %for i = 1:obj.n_ani
                disp(i)
                rec_fun_i = str2func(['rec_fun.' nam_ani{i}]);
                sti = rec_fun_i();
                if sti.bri
                    app_fra_sta_sto(sti)
                end
            end
        end
        function app_par_roi_all(obj)
            nam_ani = cell(obj.n_ani, 1);
            for ani_num = 1:obj.n_ani
                nam_ani{ani_num} = convertStringsToChars(obj.ani(ani_num));
            end
            beg_ani = 1;
            %parfor ani_num = beg_ani:obj.n_ani
            for ani_num = beg_ani:obj.n_ani
                disp(['ani ' num2str(ani_num)])
                rec_fun_i = str2func(['rec_fun.' nam_ani{ani_num}]);
                tap = rec_fun_i();
                app_par_roi(tap)
            end
        end
        function app_ave_dff_cel_tri_all(obj)
            nam_ani = cell(obj.n_ani, 1);
            for i = 1:obj.n_ani
                nam_ani{i} = convertStringsToChars(obj.ani(i));
            end
            %parfor i = 1:obj.n_ani
            for i = 1:obj.n_ani
                disp(i)
                rec_fun_i = str2func(['rec_fun.' nam_ani{i}]);
                sti = rec_fun_i();
                if sti.bri && sti.cel_det
                    app_ave_dff_cel_tri(sti)
                end
            end
        end
        %%%%%%%%%%%%%%%%
        function app_ofr_win_all(obj)
            nam_ani = cell(obj.n_ani, 1);
            for i = 1:obj.n_ani
                nam_ani{i} = convertStringsToChars(obj.ani(i));
            end
            for i = 1:obj.n_ani
                disp(i)
                rec_fun_i = str2func(['rec_fun.' nam_ani{i}]);
                sti = rec_fun_i();
                if sti.cel_det && sti.bri
                    app_ofr_win(sti)
                end
            end
        end
        % clustering
        function app_clu_ana_all(obj)
            nam_ani = cell(obj.n_ani, 1);
            for i = 1:obj.n_ani
                nam_ani{i} = convertStringsToChars(obj.ani(i));
            end
            parfor i = 1:obj.n_ani
            %for i = 1:obj.n_ani
                disp(i)
                rec_fun_i = str2func(['rec_fun.' nam_ani{i}]);
                sti = rec_fun_i();
                if sti.cel_det && sti.bri
                    app_clu_ana(sti)
                end
            end
        end
        %
        function app_dff_con_all(obj)
            parfor i = 1:obj.n_ani
            %for i = 1:obj.n_ani
                disp(i)
                rec_fun_i = str2func(['rec_fun.' convertStringsToChars(obj.ani(i))]);
                sti = rec_fun_i();
                if sti.cel_det && sti.sta
                    app_dff_con(sti)
                end
            end
        end
        function app_dff_dow_con_all(obj)
            parfor i = 1:obj.n_ani
            %for i = 1:obj.n_ani
                disp(i)
                rec_fun_i = str2func(['rec_fun.' convertStringsToChars(obj.ani(i))]);
                sti = rec_fun_i();
                if sti.cel_det && sti.sta
                    app_dff_dow_con(sti)
                end
            end
        end
        %
        function app_dff_bra_chu_fra_cel_all(obj, sta_ani)
            parfor i = sta_ani:obj.n_ani
            %for i = 1:obj.n_ani
                disp(i)
                rec_fun_i = str2func(['rec_fun.' ...
                    convertStringsToChars(obj.ani(i))]); %#ok<PFBNS>
                sti = rec_fun_i();
                if sti.bri && sti.cel_det
                    app_dff_bra_chu_fra_cel(sti)
                end
            end
        end
        function app_ave_nfr_cel_tri_all(obj)
            parfor i = 1:obj.n_ani
            %for i = 1:obj.n_ani
                disp(i)
                rec_fun_i = str2func(['rec_fun.' convertStringsToChars(obj.ani(i))]);
                sti = rec_fun_i();
                if sti.cel_det && sti.bri
                    app_ave_nfr_cel_tri(sti)
                end
            end
        end
        function app_par_all(obj)
            nam_ani = cell(obj.n_ani, 1);
            for i = 1:obj.n_ani
                nam_ani{i} = convertStringsToChars(obj.ani(i));
            end
            parfor i = 1:obj.n_ani
            %for i = 1:obj.n_ani
                disp(i)
                rec_fun_i = str2func(['rec_fun.' nam_ani{i}]);
                sti = rec_fun_i();
                if sti.cel_det && sti.bri
                    app_par(sti)
                end
            end
        end
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% axo cel
        function app_par_roi_sig_all(obj)
            nam_ani = cell(obj.n_ani, 1);
            for i = 1:obj.n_ani
                nam_ani{i} = convertStringsToChars(obj.ani(i));
            end
            %parfor i = 1:obj.n_ani
            for i = 1:obj.n_ani
                disp(i)
                rec_fun_i = str2func(['rec_fun.' nam_ani{i}]);
                sti = rec_fun_i();
                app_par_roi_sig(sti)
            end
        end
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% axo onl
        function app_log_pla_icx_row_col_all(obj, sta_ani)
            nam_ani = cell(obj.n_ani, 1);
            for i = 1:obj.n_ani
                nam_ani{i} = convertStringsToChars(obj.ani(i));
            end
            %parfor i = beg_ani:obj.n_ani
            for i = sta_ani:obj.n_ani
                disp(i)
                rec_fun_i = str2func(['rec_fun.' nam_ani{i}]);
                tap = rec_fun_i();
                %%%%%%%%%%%%%%%%%%%%%%%
                app_log_pla_icx_row_col(tap)
            end
        end
        function app_par_axo_onl_all(obj)
            nam_ani = cell(obj.n_ani, 1);
            for ani_num = 1:obj.n_ani
                nam_ani{ani_num} = convertStringsToChars(obj.ani(ani_num));
            end

            %parfor i = 1:obj.n_ani
            for ani_num = 1:obj.n_ani
                disp(ani_num)
                rec_fun_i = str2func(['rec_fun.' nam_ani{ani_num}]);
                sti = rec_fun_i();
                app_par_axo_onl(sti)
            end
        end
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% cel onl
        function app_cel_log_pla_row_col_all(obj, sta_ani)
            nam_ani = cell(obj.n_ani, 1);
            for i = 1:obj.n_ani
                nam_ani{i} = convertStringsToChars(obj.ani(i));
            end
            %parfor i = beg_ani:obj.n_ani
            for i = sta_ani:obj.n_ani
                disp(i)
                rec_fun_i = str2func(['rec_fun.' nam_ani{i}]);
                tap = rec_fun_i();
                %%%%%%%%%%%%%%%%%%%%%%%
                app_cel_log_pla_row_col(tap)
            end
        end
        function det_per_bin_edg_all(obj, sta_ani)
            nam_ani = cell(obj.n_ani, 1);
            for i = 1:obj.n_ani
                nam_ani{i} = convertStringsToChars(obj.ani(i));
            end
            %parfor i = beg_ani:obj.n_ani
            for i = sta_ani:obj.n_ani
                disp(i)
                rec_fun_i = str2func(['rec_fun.' nam_ani{i}]);
                tap = rec_fun_i();
                %%%%%%%%%%%%%%%%%%%%%%%
                det_per_bin_edg(tap)
            end
        end
        function app_som_log_pla_row_col_cel_all(obj, sta_ani)
            nam_ani = cell(obj.n_ani, 1);
            for ani_num = 1:obj.n_ani
                nam_ani{ani_num} = convertStringsToChars(obj.ani(ani_num));
            end
            for ani_num = sta_ani:obj.n_ani
                disp(ani_num)
                rec_fun_i = str2func(['rec_fun.' nam_ani{ani_num}]);
                tap = rec_fun_i();
                %%%%%%%%%%%%%%%%%%%%%%%
                if tap.tai
                    app_som_log_pla_row_col_cel(tap)
                end
            end
        end
        function app_par_som_all(obj)
            nam_ani = cell(obj.n_ani, 1);
            for ani_num = 1:obj.n_ani
                nam_ani{ani_num} = convertStringsToChars(obj.ani(ani_num));
            end
            beg_ani = 1;
            %parfor ani_num = beg_ani:obj.n_ani
            for ani_num = beg_ani:obj.n_ani
                disp(['ani ' num2str(ani_num)])
                rec_fun_i = str2func(['rec_fun.' nam_ani{ani_num}]);
                tap = rec_fun_i();
                app_par_som(tap)
            end
        end
        function sav_roi_all(obj, beg_ani)
            nam_ani = cell(obj.n_ani, 1);
            for ani_num = 1:obj.n_ani
                nam_ani{ani_num} = convertStringsToChars(obj.ani(ani_num));
            end
            for ani_num = beg_ani:obj.n_ani
                disp(['ani ' num2str(ani_num)])
                rec_fun_i = str2func(['rec_fun.' nam_ani{ani_num}]);
                tap = rec_fun_i();
                sav_roi(tap)
            end
        end
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% gab
        function sav_ima_gab_all(obj, beg_ani)
            nam_ani = cell(obj.n_ani, 1);
            for ani_num = 1:obj.n_ani
                nam_ani{ani_num} = convertStringsToChars(obj.ani(ani_num));
            end
            for ani_num = beg_ani:obj.n_ani
                disp(['ani ' num2str(ani_num)])
                rec_fun_i = str2func(['rec_fun.' nam_ani{ani_num}]);
                tap = rec_fun_i();
                %%%%%%%%%%%%%%%%%%%%%%%
                sav_ima_gab(tap)
            end
        end
        function det_thr_gab_all(obj)
            nam_ani = cell(obj.n_ani, 1);
            for ani_num = 1:obj.n_ani
                nam_ani{ani_num} = convertStringsToChars(obj.ani(ani_num));
            end
            beg_ani = 1;
            for ani_num = beg_ani:obj.n_ani
                disp(['ani ' num2str(ani_num)])
                rec_fun_i = str2func(['rec_fun.' nam_ani{ani_num}]);
                tap = rec_fun_i();
                %%%%%%%%%%%%%%%%%%%%%%%
                det_thr_gab(tap)
            end
        end
        function app_gab_all(obj, thr)
            nam_ani = cell(obj.n_ani, 1);
            for ani_num = 1:obj.n_ani
                nam_ani{ani_num} = convertStringsToChars(obj.ani(ani_num));
            end
            beg_ani = 1;
            %parfor ani_num = beg_ani:obj.n_ani
            for ani_num = beg_ani:obj.n_ani
                disp(['ani ' num2str(ani_num)])
                rec_fun_i = str2func(['rec_fun.' nam_ani{ani_num}]);
                tap = rec_fun_i();
                app_gab(tap, thr)
            end
        end
        %
        function app_par_gab_all(obj)
            nam_ani = cell(obj.n_ani, 1);
            for ani_num = 1:obj.n_ani
                nam_ani{ani_num} = convertStringsToChars(obj.ani(ani_num));
            end
            beg_ani = 1;
            for ani_num = beg_ani:obj.n_ani
                disp(['ani ' num2str(ani_num)])
                rec_fun_i = str2func(['rec_fun.' nam_ani{ani_num}]);
                tap = rec_fun_i();
                app_par_gab(tap)
            end
        end
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% neurobeh
        function app_tai_pix_all(obj, sta_ani)
            nam_ani = cell(obj.n_ani, 1);
            for i = 1:obj.n_ani
                nam_ani{i} = convertStringsToChars(obj.ani(i));
            end
            %parfor i = sta_ani:obj.n_ani % out of memory
            for i = sta_ani:obj.n_ani
                disp(i)
                rec_fun_i = str2func(['rec_fun.' nam_ani{i}]);
                sti = rec_fun_i();
                if sti.tai
                    app_tai_pix(sti)
                end
            end
        end
        function app_par_tai_pix_all(obj)
            nam_ani = cell(obj.n_ani, 1);
            for ani_num = 1:obj.n_ani
                nam_ani{ani_num} = convertStringsToChars(obj.ani(ani_num));
            end
            sta_ani_num = 1;
            parfor ani_num = sta_ani_num:obj.n_ani
            %for ani_num = sta_ani_num:obj.n_ani
                fprintf('ani %d\n', ani_num)
                rec_fun_i = str2func(['rec_fun.' nam_ani{ani_num}]);
                sti = rec_fun_i();
                app_par_tai_pix(sti)
            end
        end
        
        function app_clu_pix_k_all(obj)
            nam_ani = cell(obj.n_ani, 1);
            for ani_num = 1:obj.n_ani
                nam_ani{ani_num} = convertStringsToChars(obj.ani(ani_num));
            end
            mat_sam = matfile(obj.fil_pat_sam);
            gro_pix_k = mat_sam.clu_pix_k;
            for ani_num = 1:obj.n_ani
                disp(ani_num)
                rec_fun_i = str2func(['rec_fun.' nam_ani{ani_num}]);
                sti = rec_fun_i();
                if sti.tai
                    rec_fil = matfile(sti.fil_pat_rec);
                    n_pix = rec_fil.n_pix;
                    clu_pix_k = rec_fil.clu_pix_k;
                    clu_pix_k.bou.all = gro_pix_k.bou.all(1:n_pix, :);
                    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
                    save(sti.fil_pat_rec, 'clu_pix_k', '-append')
                    gro_pix_k.bou.all(1:n_pix, :) = [];
                end
            end
        end
        
        function app_clu_pla_k_row_col_all(obj)
            nam_ani = cell(obj.n_ani, 1);
            for ani_num = 1:obj.n_ani
                nam_ani{ani_num} = convertStringsToChars(obj.ani(ani_num));
            end
            sta_ani_num = 1;
            for ani_num = sta_ani_num:obj.n_ani
                disp(ani_num)
                rec_fun_i = str2func(['rec_fun.' nam_ani{ani_num}]);
                sti = rec_fun_i();
                if sti.tai
                    app_clu_pla_k_row_col(sti)
                end
            end
        end
        
        % tph sha abl
        function app_tai_cel_all(obj)
            nam_ani = cell(obj.n_ani, 1);
            for i = 1:obj.n_ani
                nam_ani{i} = convertStringsToChars(obj.ani(i));
            end
            parfor i = 1:obj.n_ani
            %for i = 1:obj.n_ani
                disp(i)
                rec_fun_i = str2func(['rec_fun.' nam_ani{i}]);
                sti = rec_fun_i();
                if sti.tai
                    app_tai_cel(sti)
                end
            end
        end
        function app_par_tai_cel_all(obj)
            nam_ani = cell(obj.n_ani, 1);
            for i = 1:obj.n_ani
                nam_ani{i} = convertStringsToChars(obj.ani(i));
            end
            %parfor i = 1:obj.n_ani
            for i = 1:obj.n_ani
                disp(i)
                rec_fun_i = str2func(['rec_fun.' nam_ani{i}]);
                sti = rec_fun_i();
                if sti.tai && sti.bri
                    app_par_tai_cel(sti)
                end
            end
        end
        function app_clu_cel_k_all(obj)
            nam_ani = cell(obj.n_ani, 1);
            for ani_num = 1:obj.n_ani
                nam_ani{ani_num} = convertStringsToChars(obj.ani(ani_num));
            end
            mat_sam = matfile(obj.fil_pat_sam);
            gro_cel_k = mat_sam.clu_cel_k;
            for ani_num = 1:obj.n_ani
                disp(ani_num)
                rec_fun_i = str2func(['rec_fun.' nam_ani{ani_num}]);
                sti = rec_fun_i();
                if sti.tai
                    rec_fil = matfile(sti.fil_pat_rec);
                    n_cel_reg = rec_fil.n_cel_reg;
                    n_cel = n_cel_reg.raw(1);
                    clu_cel_k = rec_fil.clu_cel_k;
                    %clu_cel_k.bou.all = gro_cel_k.bou.all(1:n_cel, :);
                    clu_cel_k.bou.spo = gro_cel_k.bou.spo(1:n_cel, :);
                    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
                    save(sti.fil_pat_rec, 'clu_cel_k', '-append')
                    %gro_cel_k.bou.all(1:n_cel, :) = [];
                    gro_cel_k.bou.spo(1:n_cel, :) = [];
                end
            end
        end
        function app_clu_row_col_all(obj)
            nam_ani = cell(obj.n_ani, 1);
            for ani_num = 1:obj.n_ani
                nam_ani{ani_num} = convertStringsToChars(obj.ani(ani_num));
            end
            sta_ani_num = 1;
            for ani_num = sta_ani_num:obj.n_ani
                disp(ani_num)
                rec_fun_i = str2func(['rec_fun.' nam_ani{ani_num}]);
                sti = rec_fun_i();
                if sti.tai
                    app_clu_row_col(sti)
                end
            end
        end
        % cel onl
        function app_neu_beh_cel_onl_all(obj, con)
            nam_ani = cell(obj.n_ani, 1);
            for ani_num = 1:obj.n_ani
                nam_ani{ani_num} = convertStringsToChars(obj.ani(ani_num));
            end
            sam_fil = matfile(obj.fil_pat_sam);
            gro_pix_k = sam_fil.clu_pix_k;
            for ani_num = 1:obj.n_ani
                disp(ani_num)
                rec_fun_i = str2func(['rec_fun.' nam_ani{ani_num}]);
                sti = rec_fun_i();
                if sti.tai
                    rec_fil = matfile(sti.fil_pat_rec);
                    clu_pix_k = rec_fil.clu_pix_k;
                    n_pix = rec_fil.n_pix;
                    clu_pix_k.som.(con) = gro_pix_k.som.(con)(1:n_pix.som, :);
                    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
                    save(sti.fil_pat_rec, 'clu_pix_k', '-append')
                    gro_pix_k.som.(con)(1:n_pix.som, :) = [];
                end
            end
            sta_ani_num = 1;
            for ani_num = sta_ani_num:obj.n_ani
                disp(ani_num)
                rec_fun_i = str2func(['rec_fun.' nam_ani{ani_num}]);
                sti = rec_fun_i();
                if sti.tai
                    app_neu_beh_cel_onl(sti, con)
                end
            end
        end
        %
        function app_par_neu_beh_cel_onl_all(obj)
            nam_ani = cell(obj.n_ani, 1);
            for ani_num = 1:obj.n_ani
                nam_ani{ani_num} = convertStringsToChars(obj.ani(ani_num));
            end
            sta_ani_num = 1;
            parfor ani_num = sta_ani_num:obj.n_ani
                disp(ani_num)
                rec_fun_i = str2func(['rec_fun.' nam_ani{ani_num}]);
                sti = rec_fun_i();
                if sti.tai
                    app_par_neu_beh_cel_onl(sti)
                end
            end
        end
        % gab - % appends from sam
        function app_gab_clu_cel_k_all(obj)
            nam_ani = cell(obj.n_ani, 1);
            for ani_num = 1:obj.n_ani
                nam_ani{ani_num} = convertStringsToChars(obj.ani(ani_num));
            end
            sam_fil = matfile(obj.fil_pat_sam);
            gro_cel_k = sam_fil.clu_cel_k;
            for ani_num = 1:obj.n_ani
                disp(ani_num)
                rec_fun_i = str2func(['rec_fun.' nam_ani{ani_num}]);
                sti = rec_fun_i();
                if sti.tai
                    rec_fil = matfile(sti.fil_pat_rec);
                    n_cel = rec_fil.n_cel;

                    clu_cel_k = rec_fil.clu_cel_k;

                    %clu_cel_k.bou.all = gro_cel_k.bou.all(1:n_cel.all, :);
                    clu_cel_k.bou.spo = gro_cel_k.bou.spo(1:n_cel.all, :);
                    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
                    save(sti.fil_pat_rec, 'clu_cel_k', '-append')
                    %gro_cel_k.bou.all(1:n_cel.all, :) = [];
                    gro_cel_k.bou.spo(1:n_cel.all, :) = [];
                end
            end
        end
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% figures all
        function sav_fig_neu_axo_all(obj)
            for i = 1:obj.n_ani
                rec_fun_i = str2func(['rec_fun.' convertStringsToChars(obj.ani(i))]);
                tap = rec_fun_i();
                sav_fig_neu_axo(tap)
            end
        end
        function sav_fig_axo_all(obj, sta_ani)
            for i = sta_ani:obj.n_ani
                rec_fun_i = str2func(['rec_fun.' convertStringsToChars(obj.ani(i))]);
                tap = rec_fun_i();
                sav_fig_roi(tap)
                sav_fig_pix_res(tap)
            end
        end
        function sav_fig_inh_exc_sig_all(obj)
            for i = 1:obj.n_ani
                rec_fun_i = str2func(['rec_fun.' convertStringsToChars(obj.ani(i))]);
                tap = rec_fun_i();
                sav_fig_inh_exc_sig(tap)
            end
        end
        function sav_fig_inh_exc_map_all(obj)
            for i = 1:obj.n_ani
                rec_fun_i = str2func(['rec_fun.' convertStringsToChars(obj.ani(i))]);
                tap = rec_fun_i();
                sav_fig_inh_exc_map(tap)
            end
        end
        function sav_fig_tai_com_all(obj)
            for i = 1:obj.n_ani
                rec_fun_i = str2func(['rec_fun.' convertStringsToChars(obj.ani(i))]);
                tap = rec_fun_i();
                sav_fig_tai_com(tap)
            end
        end
        function sav_fig_tai_com_dva_all(obj)
            for i = 1:obj.n_ani
                rec_fun_i = str2func(['rec_fun.' convertStringsToChars(obj.ani(i))]);
                tap = rec_fun_i();
                sav_fig_tai_com_dva(tap)
            end
        end
        function sav_fig_bou_ave_all(obj)
            for i = 1:obj.n_ani
                rec_fun_i = str2func(['rec_fun.' convertStringsToChars(obj.ani(i))]);
                tap = rec_fun_i();
                sav_fig_bou_ave(tap)
            end
        end
        function sav_fig_bou_ave_pix_all(obj, sta_ani)
            for ani_num = sta_ani:obj.n_ani
                rec_fun_i = str2func(['rec_fun.' convertStringsToChars(obj.ani(ani_num))]);
                tap = rec_fun_i();
                if tap.tai
                    sav_fig_bou_ave_pix(tap)
                end
            end
        end
        function sav_fig_clu_map_pix_all(obj)
            for ani_num = 1:obj.n_ani
                rec_fun_i = str2func(['rec_fun.' convertStringsToChars(obj.ani(ani_num))]);
                tap = rec_fun_i();
                if tap.tai
                    sav_fig_clu_map_pix(tap)
                end
            end
        end
        function sav_fig_cor_del_all(obj)
            for i = 1:obj.n_ani
                rec_fun_i = str2func(['rec_fun.' convertStringsToChars(obj.ani(i))]);
                tap = rec_fun_i();
                sav_fig_cor_del(tap)
            end
        end
        function sav_fig_som_all(obj, sta_ani)
            for ani_num = sta_ani:obj.n_ani
                rec_fun_i = str2func(['rec_fun.' convertStringsToChars(obj.ani(ani_num))]);
                tap = rec_fun_i();
                if tap.tai
                    sav_fig_som(tap)
                end
            end
        end
        function sav_fig_ong_all(obj)
            for ani_num = 1:obj.n_ani
                rec_fun_i = str2func(['rec_fun.' convertStringsToChars(obj.ani(ani_num))]);
                tap = rec_fun_i();
                if tap.tai
                    sav_fig_ong(tap)
                end
            end
        end
        function sav_fig_ong_cel_all(obj)
            for ani_num = 1:obj.n_ani
                rec_fun_i = str2func(['rec_fun.' convertStringsToChars(obj.ani(ani_num))]);
                tap = rec_fun_i();
                sav_fig_ong_two(tap)
            end
        end
        function sav_fig_cor_map_exc_inh_all(obj)
            for ani_num = 1:obj.n_ani
                rec_fun_i = str2func(['rec_fun.' convertStringsToChars(obj.ani(ani_num))]);
                tap = rec_fun_i();
                sav_fig_cor_map_exc_inh(tap)
            end
        end
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% gab
        function plo_gab_all(obj)
            for ani_num = 1:obj.n_ani
                rec_fun_i = str2func(['rec_fun.' convertStringsToChars(obj.ani(ani_num))]);
                tap = rec_fun_i();
                plo_gab_met(tap)
            end
        end
        function sav_fig_gab_all(obj)
            for ani_num = 1:obj.n_ani
                rec_fun_i = str2func(['rec_fun.' convertStringsToChars(obj.ani(ani_num))]);
                tap = rec_fun_i();
                sav_fig_gab(tap)
            end
        end
        function sav_fig_gab_clu_all(obj)
            for ani_num = 1:obj.n_ani
                rec_fun_i = str2func(['rec_fun.' convertStringsToChars(obj.ani(ani_num))]);
                tap = rec_fun_i();
                if tap.tai
                    sav_fig_gab_clu(tap)
                end
            end
        end
        function sav_fig_gab_ong_all(obj)
            for ani_num = 1:obj.n_ani
                rec_fun_i = str2func(['rec_fun.' convertStringsToChars(obj.ani(ani_num))]);
                tap = rec_fun_i();
                sav_fig_gab_ong(tap)
            end
        end
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% general
        function add_var_ext_all(obj, var_ext, var_new)
            for i = 1:obj.n_ani
                disp(i)
                rec_fun_i = str2func(['rec_fun.' convertStringsToChars(obj.ani(i))]);
                sti = rec_fun_i();
                add_var_ext_met(sti, var_ext, var_new)
            end
        end
        function sav_var = ext_var_met(obj, var_nam)
            sav_var = ext_var(obj, 'fil_pat_sam', var_nam);
        end
        function isx_var_all(obj, var_nam)
            for ani_num = 1:obj.n_ani
                rec_fun_i = str2func(['rec_fun.' convertStringsToChars(obj.ani(ani_num))]);
                tap = rec_fun_i();
                rec_fil = matfile(tap.fil_pat_rec);
                var = isprop(rec_fil, var_nam);
                disp(var)
            end
        end
        function isx_var(obj, var_nam)
            mat_fil = matfile(obj.fil_pat_sam);
            var = isprop(mat_fil, var_nam);
            disp(var)
        end
        function dis_var_all(obj, var_nam)
            for ani_num = 1:obj.n_ani
                disp(ani_num)
                rec_fun_i = str2func(['rec_fun.' convertStringsToChars(obj.ani(ani_num))]);
                tap = rec_fun_i();
                rec_fil = matfile(tap.fil_pat_rec);
                var = rec_fil.(var_nam);
                disp(var)
            end
        end
        function dis_pro_all(obj, pro_nam)
            for ani_num = 1:obj.n_ani
                disp(ani_num)
                rec_fun_i = str2func(['rec_fun.' convertStringsToChars(obj.ani(ani_num))]);
                tap = rec_fun_i();
                tap.(pro_nam)
            end
        end
        function che_all(obj)
            for ani_num = 1:obj.n_ani
                disp(ani_num)
                rec_fun_i = str2func(['rec_fun.' convertStringsToChars(obj.ani(ani_num))]);
                tap = rec_fun_i();
                if tap.tai
                    che(tap)
                end
            end
        end
    end
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% stats
function p_xep = com_p_xep(var_epo_uni)
global n_win_ong
n_com = n_win_ong - 1;
p_xep = nan(n_com, 1);
for i = 1:n_com
    p_xep(i) = signrank(var_epo_uni{i}, var_epo_uni{i + 1});
end
end

function [p_con_xwi, p_win_xco] = com_p_win_con(var_con_win_uni)
global n_con n_cro_win
p_con_xwi = nan(n_con, n_cro_win);
global win_cro_ind
% for each condition, compare across the windows
for i = 1:n_con
    for j = 1:n_cro_win
        p_con_xwi(i, j) = signrank(var_con_win_uni{i, win_cro_ind(j, 1)}, ...
            var_con_win_uni{i, win_cro_ind(j, 2)});
    end
end
%
global n_win_tot n_cro_con
p_win_xco = nan(n_win_tot, n_cro_con);
global con_cro_ind
% for each window, compare across the conditions
for i = 1:n_win_tot
    for j = 1:n_cro_con
        p_win_xco(i, j) = signrank(var_con_win_uni{con_cro_ind(j, 1), i}, ...
            var_con_win_uni{con_cro_ind(j, 2), i});
    end
end
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% behavioral
function [rat_tim_sta_par, tim, n, n_par, tri_rat_tim_fis_par] = ...
    com_rat_fra_sta_par_sam(rat_tim, rat_tim_fis_par, sti_ons, bas_dur, res_dur)
addpath \\home.ansatt.ntnu.no\kadiram\Documents\MATLAB\statistics
[tri_rat_tim_fis_par, n_tim, n_par, tim] = com_tri_rat_tim_fis_par(rat_tim, rat_tim_fis_par, sti_ons, bas_dur, res_dur);
rat_tim_sta_par = nan(n_tim, 2, n_par);
[rat_tim_sta_par(:, 1, :), ~, rat_tim_sta_par(:, 2, :), n] = com_sta(tri_rat_tim_fis_par, 2);
end

function [tri_rat_tim_fis_par, n_tim, n_par, tim, n_fis] = ...
    com_tri_rat_tim_fis_par(rat_tim, rat_tim_fis_par, sti_ons, bas_dur, res_dur)
bin_siz = rat_tim(2) - rat_tim(1);
tim = -bas_dur:bin_siz:res_dur;
tim = tim';
n_tim = length(tim);
[~, n_fis, n_par] = size(rat_tim_fis_par);
n_tri = length(sti_ons);
tri_rat_tim_fis_par = nan(n_tim, n_fis, n_par);
for i = 1:n_fis
    for j = 1:n_tri
        sti_ons_j = sti_ons(j);
        tim_sta_j = sti_ons_j - bas_dur;
        tim_end_j = sti_ons_j + res_dur;
        log_tim_j = rat_tim >= tim_sta_j & rat_tim <= tim_end_j;
        rat_fis_tim_tri_par_i = rat_tim_fis_par(log_tim_j, i, :);
    end
    tri_rat_tim_fis_par(:, i, :) = mean(rat_fis_tim_tri_par_i, 2);
end
end

function poi = ext_poi(fil_pat_exp)
load(fil_pat_exp, 'dru_ons', 'sti_ons', 'end_tim', 'n_tri_con')
poi = [dru_ons; sti_ons(1:n_tri_con:end); end_tim];
end

function poi_sti = ext_poi_sti(fil_pat_exp) % only "stimulus points" !!!
load(fil_pat_exp, 'sti_ons', 'n_tri_con', 'isi')
poi_sti = sti_ons(n_tri_con:n_tri_con:end) + isi;
end

function poi_sti_hal = ext_poi_sti_hal(fil_pat_exp)
load(fil_pat_exp, 'sti_ons', 'n_tri_con')
poi_sti_hal = sti_ons(n_tri_con/2 + 1:n_tri_con:end);
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% rate
% not for drug due to first win!
function [p_com_par, ave_rat_win_ani_par, ave_rat_bas_win_ani_par, p_sti_com_par, ...
    ave_rat_sti_win_ani_par, p_sti_hal_com_par, ave_rat_sti_hal_win_ani_par] = ...
    com_ave_rat_dat(tim_bin, rat_par_bin_ani, win_siz, poi, win_siz_sti, poi_sti, ...
    win_siz_sti_hal, poi_sti_hal)
n_win = length(poi);
global n_par
n_com = n_win - 1;
p_com_par = nan(n_com, n_par);
ave_rat_win_ani_par = com_ave_rat_win_ani_par(tim_bin, rat_par_bin_ani, win_siz, poi);
for i = 1:n_par
    ave_rat_win_ani_i = ave_rat_win_ani_par(:, :, i);
    if numel(ave_rat_win_ani_i) ~= sum(isnan(ave_rat_win_ani_i), 'all')
        for j = 1:n_com
            p_com_par(j, i) = signrank(ave_rat_win_ani_par(j, :, i), ...
                ave_rat_win_ani_par(j + 1, :, i));
        end
    end
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
ave_rat_bas_win_ani_par = ave_rat_win_ani_par(1:end - 1, :, :); %%%!! not for drug!!!
%
ave_rat_sti_win_ani_par = com_ave_rat_win_ani_par(tim_bin, rat_par_bin_ani, win_siz_sti, ...
    poi_sti);
p_sti_com_par = com_p_sti_com_par(ave_rat_bas_win_ani_par, ave_rat_sti_win_ani_par);
%
ave_rat_sti_hal_win_ani_par = com_ave_rat_win_ani_par(tim_bin, rat_par_bin_ani, win_siz_sti_hal, ...
    poi_sti_hal);
p_sti_hal_com_par = com_p_sti_com_par(ave_rat_bas_win_ani_par, ave_rat_sti_hal_win_ani_par);
end

function ave_rat_win_ani_par = com_ave_rat_win_ani_par(tim_bin, rat_par_bin_ani, win_siz, poi)
global n_par
[n_bin, n_ani] = size(rat_par_bin_ani{1});
rat_bin_ani_par = nan(n_bin, n_ani, n_par);
for i = 1:n_par
    if ~isempty(rat_par_bin_ani{i})
        rat_bin_ani_par(:, :, i) = rat_par_bin_ani{i};
    end
end
[rat_win_bin_ani_par, n_win] = win_rat_mul(tim_bin, rat_bin_ani_par, win_siz, poi);
ave_rat_win_ani_par = nan(n_win, n_ani, n_par);
for i = 1:n_win
    ave_rat_win_ani_par(i, :, :) = mean(rat_win_bin_ani_par{i});
end
end

function [rat_win_bin_ani_par, n_win] = win_rat_mul(tim_bin, rat_bin_ani_par, win_siz, poi)
n_win = length(poi);
rat_win_bin_ani_par = cell(n_win, 1);
for i = 1:n_win
    rat_win_bin_ani_par{i} = win_rat_sin(tim_bin, rat_bin_ani_par, [poi(i) - win_siz poi(i)]);
end
end

function rat_sel_bin_ani_par = win_rat_sin(tim_bin, rat_bin_ani_par, win)
log_win = tim_bin >= win(1) & tim_bin < win(2);
rat_sel_bin_ani_par = rat_bin_ani_par(log_win, :, :);
end

function p_sti_com_par = com_p_sti_com_par(ave_rat_bas_win_ani_par, ave_rat_sti_win_ani_par)
[n_win, ~, n_par] = size(ave_rat_bas_win_ani_par);
p_sti_com_par = nan(n_win, n_par);
for i = 1:n_par
    ave_rat_win_ani_i = ave_rat_bas_win_ani_par(:, :, i);
    if numel(ave_rat_win_ani_i) ~= sum(isnan(ave_rat_win_ani_i), 'all')
        for j = 1:n_win
            p_sti_com_par(j, i) = signrank(ave_rat_bas_win_ani_par(j, :, i), ...
                ave_rat_sti_win_ani_par(j, :, i));
        end
    end
end
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function per_pro_ani_con = com_per_pro_ani_con(n_con, bea_lat_ani_tri, lat_thr)
[n_ani, n_tri] = size(bea_lat_ani_tri);
per_pro_ani_con = nan(n_ani, n_con);
n_tri_con = n_tri/n_con;
for i = 1:n_con
    bea_lat_ani_tri_i = bea_lat_ani_tri(:, (i - 1)*n_tri_con + 1:i*n_tri_con);
    log_bea_lat_ani_tri_i = bea_lat_ani_tri_i <= lat_thr;
    n_res_ani_i = sum(log_bea_lat_ani_tri_i, 2);
    per_pro_ani_con(:, i) = 100*(n_res_ani_i/n_tri_con);
end
end

function p_cro = com_p_cro(var_con_uni)
    n_con = 3;
    n_cro = 3;
    ind_cro_con = nchoosek(1:n_con, 2);
    p_cro = nan(n_cro, 1);
    for i = 1:n_cro
        p_cro(i) = ...
            signrank(var_con_uni(ind_cro_con(i, 1), :), ...
            var_con_uni(ind_cro_con(i, 2), :));
    end
end

function [bea_par_ani_con, p_par_cro, bea_par_ani_tri] = ...
    com_bea_par_ani_con(bea_par_ani_tri, log_nox_ani_tri)
    global n_con n_tri_con
    [n_ani, ~] = size(bea_par_ani_tri);
    bea_par_ani_con = nan(n_ani, n_con);
    bea_par_ani_tri(log_nox_ani_tri) = nan;
    dim = 2;
    for i = 1:n_ani
        for j = 1:n_con
            bea_par_ani_con(i, j) = com_sta(bea_par_ani_tri...
                (i, (j - 1)*n_tri_con.vrs + 1:j*n_tri_con.vrs), dim);
        end
    end
    n_cro = 3;
    ind_cro_con = nchoosek(1:n_con, 2);
    p_par_cro = nan(n_cro, 1);
    for i = 1:n_cro
        if sum(~isnan(bea_par_ani_con(:, ind_cro_con(i, 1)))) > 0 && sum(~isnan(bea_par_ani_con(:, ...
                ind_cro_con(i, 2)))) > 0
            p_par_cro(i) = signrank(bea_par_ani_con(:, ind_cro_con(i, 1)), ...
                bea_par_ani_con(:, ind_cro_con(i, 2)));
        end
    end
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% behavioral plotting
function h_fig = plo_tai_ang(ang_fra_ani)
[h_fig, fig_wid, fig_hei] = fig;
con_fil = matfile('\\home.ansatt.ntnu.no\kadiram\Documents\MATLAB\con_esp.mat');
n_row = 1;
n_col = 1;
gap_ver_row = 0.005*ones(n_row, 1);
gap_hor = 0.005;
gap_hor_row_col = 0.005*ones(n_row, n_col);
mar_bot = 0.040;
mar_top = 0.040;
mar_lef = 0.040;
mar_rig = 0.000;
asp_rat = con_fil.asp_rat;
asp_rat_axe = asp_rat.sig.lon*ones(n_row, n_col);
wid = false;
sca_axe = ones(n_row*n_col, 1);
n_pix_ext = 200;
[hax_sub, pos_axe, hei_axe, dis_asp_rat, las_pix, rat_wid] = tight_subplot_gen(n_row, n_col, ...
    gap_ver_row, gap_hor_row_col, mar_bot, mar_top, mar_lef, mar_rig, asp_rat_axe, fig_wid, ...
    fig_hei, wid, sca_axe, n_pix_ext);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
global y_lab_ang
global sti_ons_tri
hax = hax_sub(1);
tim_fra = con_fil.tim_fra;
ima(hax, tim_fra.ani.ses, ang_fra_ani')
yticks(hax, 1:size(ang_fra_ani, 2))
clim(hax, [0 0.25])
x_lin = xline(hax, sti_ons_tri.vrs.sec, 'r');
ylabel(hax, 'Animal')
col_han = colorbar(hax);
col_han.Position(1) = col_han.Position(1) + 0.03;
col_han.Label.String = y_lab_ang;
end

function plo_fig_tap(sti_ons, n_tri_con, fra_tim_uni, ave_tai_sig, tim_tri_uni_fra, ...
    ang_fra_sta_con, col_tai_sig, fon_siz, col_sti, con, isi, y_lab, tit)
n_row = 2;
n_con = size(ang_fra_sta_con, 3);
con_ons = sti_ons(1:n_tri_con:end);
con_off = sti_ons(n_tri_con:n_tri_con:end);
x_lab = 'Time (s)';
%
fig
n_col = n_con;
gap_ver = 0.04;
gap_hor = 0.025;
mar_bot = 0.07;
mar_top = 0.07;
mar_lef = 0.045;
mar_rig = 0.005;
hax_sub = tight_subplot(n_row, n_col, [gap_ver gap_hor], [mar_bot mar_top], [mar_lef mar_rig]);
linkaxes(hax_sub, 'y')
y_min = inf;
y_max = -inf;
for i = 1:n_con
    ind_sub_plo = i;
    hax_tri_i = hax_sub(ind_sub_plo);
    axes(hax_tri_i)
    log_i = fra_tim_uni > con_ons(i) - isi & fra_tim_uni < con_off(i) + isi;
    plo_sha(fra_tim_uni(log_i), ave_tai_sig(log_i, 1), ave_tai_sig(log_i, 2), col_tai_sig);
    pre_for_exp(fon_siz)
    if i == 1
        pre_for_exp_y_lab(y_lab, fon_siz)
    else
        pre_for_exp(fon_siz)
        yticks([])
        hax_tri_i.YColor = 'none';
    end
    title(convertStringsToChars(con(i)), 'FontWeight', 'normal')
    [y_min, y_max] = adj_y(hax_tri_i, y_min, y_max);
    %
    ind_sub_plo = n_col + i;
    hax_tap_i = hax_sub(ind_sub_plo);
    axes(hax_tap_i)
    plo_sha(tim_tri_uni_fra, ang_fra_sta_con(:, 1, i), ang_fra_sta_con(:, 2, i), col_tai_sig);
    if i == 1
        pre_for_exp_lab(x_lab, y_lab, fon_siz)
    else
        pre_for_exp_x_lab(x_lab, fon_siz)
        yticks([])
        hax_tap_i.YColor = 'none';
    end
    [y_min, y_max] = adj_y(hax_tap_i, y_min, y_max);
end
lin_wid = 0.5;
for i = 1:n_con
    ind_sub_plo = i;
    axes(hax_sub(ind_sub_plo))
    hax_tri_i = hax_sub(ind_sub_plo);
    plo_ver_lin(sti_ons((i - 1)*n_tri_con + 1:i*n_tri_con), hax_tri_i, col_sti, lin_wid)
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    ind_sub_plo_tap = ind_sub_plo + n_con;
    axes(hax_sub(ind_sub_plo_tap))
    hax_tap_i = hax_sub(ind_sub_plo_tap);
    plo_ver_lin(0, hax_tap_i, col_sti, lin_wid)
end
enl_num(fon_siz)
%[~, h] = suplabel([tit '; n = ' sprintf('%d', n)], 't', [.08 .08 .87 .9]);
[~, h] = suplabel(tit, 't', [.08 .08 .87 .9]);
set(h, 'FontSize', fon_siz + 3)
end

function plo_ave_pcx(dru_ons, sti_ons, sta_tim, end_tim, fra_tim_uni, ...
    ave_tai_sig, ave_pcx_par_fra_sta, ...
    col_sig, fon_siz, col_dru, col_sti, abb_pcx_par, tit, n_ani)
n_par = 5;
x_tic = [dru_ons; sti_ons(1:2:end)];
if ~isempty(dru_ons)
    x_tic_min = x_tic/60;
    n_tic = length(x_tic_min);
    x_tic_str = string(x_tic_min);
    x_tic_cha = cell(n_tic, 1);
    for j = 1:n_tic
        x_tic_cha{j} = char(x_tic_str(j));
    end
end
fig
n_row = n_par;
n_col = 1;
gap_ver = 0.025;
gap_hor = 0;
mar_bot = 0.075;
mar_top = 0.033;
mar_lef = 0.045;
mar_rig = 0.005;
hax_sub = tight_subplot(n_row, n_col, [gap_ver gap_hor], [mar_bot mar_top], [mar_lef mar_rig]);
lef_lab = nan(n_par, 1);
for i = 1:n_par
    axes(hax_sub(i))
    if i == 1
        plo_sha(fra_tim_uni, ave_tai_sig(:, 1), ave_tai_sig(:, 2), col_sig)
        wri_tit([tit '; n = ' sprintf('%d', n_ani) ' animals'], fon_siz)
    else
        ind = i - 1;
        plo_sha(fra_tim_uni, ave_pcx_par_fra_sta{ind}(:, 1), ave_pcx_par_fra_sta{ind}(:, 2), col_sig)
    end
    y_lab = abb_pcx_par(i);
    h_lab(i) = ylabel(y_lab);
    xlim([sta_tim end_tim])
    hax = gca;
    y_lim = hax.YLim;
    pre_for_exp(fon_siz)
    xticks([])
%     plo_ver_lin(dru_ons, hax, col_dru)
%     plo_ver_lin(sti_ons, hax, col_sti)
    hax.YLim = y_lim;
    pre_for_exp(fon_siz)
    %
    if i == n_par
        xticks(x_tic)
        if ~isempty(dru_ons)
            xticklabels(x_tic_cha)
        end
    end
    enl_num(fon_siz)
    h_lab(i).Units = 'normalized';
    lef_lab(i) = h_lab(i).Position(1);
    if i < n_par
        hax_sub(i).XColor = 'w';
    end
end
lef = min(lef_lab);
for i = 1:n_row
    h_lab(i).Position(1) = lef;
end
if ~isempty(dru_ons)
    [~, h] = suplabel('Time (min)', 'x');
else
    [~, h] = suplabel('Time (s)', 'x');
end
set(h, 'FontSize', fon_siz)
hax = axes('Units', 'normalized', 'Position', [hax_sub(1).Position(1) hax_sub(5).Position(2) hax_sub(1).Position(3) ...
    hax_sub(1).Position(2) + hax_sub(1).Position(4) - hax_sub(n_par).Position(2)], 'XTick', [], 'YTick', [], 'XColor', 'none', 'YColor', 'none');
hax.XLim = hax_sub(1).XLim;
plo_ver_lin(dru_ons, hax, col_dru)
plo_ver_lin(sti_ons, hax, col_sti)
hax.Color = 'none';
end

function plo_ave_rat(dru_ons, sti_ons, sta_tim, end_tim, n_tri_con, ...
    rat_tim, rat_tim_par_sta, col_sig, fon_siz, col_dru, win_siz, win_col, col_sti)
n_par = 5;
x_tic = [dru_ons; sti_ons(1:2:end)];
if ~isempty(dru_ons)
    x_tic_min = x_tic/60;
    n_tic = length(x_tic_min);
    x_tic_str = string(x_tic_min);
    x_tic_cha = cell(n_tic, 1);
    for j = 1:n_tic
        x_tic_cha{j} = char(x_tic_str(j));
    end
end
global lin_wid
for i = 1:n_par
    subplot(5, 1, i)
    plo_sha(rat_tim, rat_tim_par_sta(:, i, 1), rat_tim_par_sta(:, i, 2), col_sig)
    xlim([sta_tim end_tim])    
    hax = gca;
    pre_for_exp(fon_siz)
    if ~isempty(dru_ons)
        plo_ver_lin(dru_ons, hax, col_dru)
    end
    %
    xticks([])
    poi = [dru_ons; sti_ons(1:n_tri_con:end); end_tim];
    plo_sti_sub_tri(hax, win_siz, poi, win_col)
    plo_ver_lin(sti_ons, hax, col_sti, lin_wid)
    if i == 1
        title('Tail', 'FontSize', fon_siz)
    elseif i == 2
        title('Heart', 'FontSize', fon_siz)
    elseif i == 3
        title('Operculum', 'FontSize', fon_siz)
    elseif i == 4
        title('Mouth', 'FontSize', fon_siz)
    elseif i == 5
        title('Eye', 'FontSize', fon_siz)
        pre_for_exp(fon_siz)
    end
    %
    if i == n_par
        xticks(x_tic)
        if ~isempty(dru_ons)
            xticklabels(x_tic_cha)
        end
    end
end
enl_num(fon_siz)
%
[~,h]=suplabel('Rate (Hz)','y');
set(h,'FontSize',fon_siz)
%
if ~isempty(dru_ons)
    [~, h] = suplabel('Time (min)', 'x');
else
    [~, h] = suplabel('Time (s)', 'x');
end
set(h, 'FontSize', fon_siz)
end

function plo_spo_sta(ave_rat_win_ani_par, p_com_par, mar, mar_siz, fon_siz)
[n_com, n_par] = size(p_com_par);
com_cel = cell(n_com, 1);
for i = 1:n_com
    com_cel{i} = [i i + 1];
end
off_non = 0.13;
for i = 1:n_par
    subplot(n_par, 1, i)
    plo_kad_plo_mat(ave_rat_win_ani_par(:, :, i), mar, mar_siz)
    sigstar(com_cel, fon_siz, off_non, p_com_par(:, i));
    h = gca;
    h.PlotBoxAspectRatio(1) = 0.5;
    if i == 1
        title('Tail', 'FontSize', fon_siz)
    elseif i == 2
        title('Heart', 'FontSize', fon_siz)
    elseif i == 3
        title('Operculum', 'FontSize', fon_siz)
    elseif i == 4
        title('Mouth', 'FontSize', fon_siz)
    elseif i == 5
        title('Eye', 'FontSize', fon_siz)
    end
    %
    pre_for_exp(fon_siz)
    if i == n_par
        xticks(1:n_com + 1)
        xticklabels({'Baseline', 'Drug', 'Taps 1', 'Taps 2', 'Taps 3'})
    else
        xticks([])
    end
end
enl_num(fon_siz)
[~,h]=suplabel('Rate (Hz)', 'y', [.35 .08 .84 .84]);
set(h,'FontSize',fon_siz)
end

function plo_eth_spo(dru_ons, sti_ons, sta_tim, end_tim, n_tri_con, ...
    rat_tim, rat_tim_par_sta, col_sig, col_dru, win_siz, win_col, col_sti, ...
    ave_rat_win_ani_par, p_com_par, mar_siz, fon_siz, tit, abb_par, n_ani)
[n_com, n_par] = size(p_com_par);
if ~isempty(dru_ons)
    x_tic = [dru_ons; sti_ons(1:2:end)];
    x_tic_bar = {'Baseline', 'Pharma', 'Low', 'Moderate', 'High'};
else
    x_tic = sti_ons;
    x_tic_bar = {'Baseline', 'Low', 'Moderate', 'High'};
end
x_tic_min = x_tic/60;
n_tic = length(x_tic_min);
x_tic_str = string(x_tic_min);
x_tic_cha = cell(n_tic, 1);
for j = 1:n_tic
    x_tic_cha{j} = char(x_tic_str(j));
end
%
poi = [dru_ons; sti_ons(1:n_tri_con:end); end_tim];
com_cel_rat = cell(n_com, 1);
for i = 1:n_com
    com_cel_rat{i} = [poi(i) - win_siz(1)/2 poi(i + 1) - win_siz(1)/2];
end
fon_siz_p = 20;
fig
n_row = n_par;
n_col = 3;
gap_ver = 0.023;
gap_hor = 0.032;
mar_bot = 0.065;
mar_top = 0.060;
mar_lef = 0.045;
mar_rig = 0.001;
hax_sub = tight_subplot(n_row, n_col, [gap_ver gap_hor], [mar_bot mar_top], [mar_lef mar_rig]);
h_lab_par = [];
x_par = nan(n_par, 1);
off_non = 0.08;
lin_wid = 0.5;
isi = 60; % !!!!!!!!!!!!!!!!!!!!!!
n_con = 3;
for i = 1:n_par
    ind_lef = (i - 1)*n_col + 1;
    ind_mid = ind_lef + 1;
    pos_mid = hax_sub(ind_mid).Position;
    delete(hax_sub(ind_mid))
    hax_sub(ind_lef).Position(3) = pos_mid(1) + pos_mid(3) - hax_sub(ind_lef).Position(1);
    axes(hax_sub(ind_lef))
    plo_sha(rat_tim, rat_tim_par_sta(:, i, 1), rat_tim_par_sta(:, i, 2), col_sig)
    hax_sub(ind_lef).FontSize = fon_siz;
    xlim([sta_tim end_tim])
    h_lab = ylabel(abb_par{i});
    h_lab_par = [h_lab_par; h_lab];
    x_par(i) = h_lab.Position(1);
    hax = gca;
    pre_for_exp(fon_siz)
    if ~isempty(dru_ons)
        plo_ver_lin(dru_ons, hax, col_dru)
    end
    %
    xticks([])
    plo_ver_lin(sti_ons, hax, col_sti, lin_wid)
    plo_sti_sub_tri(hax, win_siz, poi, win_col)
    [~, y_lim] = sigstar(com_cel_rat, fon_siz_p, off_non, p_com_par(:, i));
    hax.YLim = y_lim;
    if i == n_par
        xticks(x_tic)
        xticklabels(x_tic_cha)
        xlabel('Time (min)')
    else
        hax_sub(ind_lef).XColor = 'none';
        h = gca;
        h.XColor = 'none';
    end
    if i == 1
        yli = ylim;
        text(sti_ons(n_tri_con/2:n_tri_con:end) + isi/2, yli(2)*ones(n_con, 1)*(115/100), x_tic_bar(2:end))
    end
end
x_min = min(x_par);
for i = 1:n_par
    h_lab_par(i).Position(1) = x_min;
end
%
com_cel = cell(n_com, 1);
for i = 1:n_com
    com_cel{i} = [i i + 1];
end
%
n_win = n_com + 1;
for i = 1:n_par
    ind_rig = (i - 1)*n_col + 3;
    axes(hax_sub(ind_rig))
    plo_bar_dat(reshape(ave_rat_win_ani_par(:, :, i), n_win, n_ani)', win_col, mar_siz);
    xlim([0.5 n_win + 0.5])
    sigstar(com_cel, fon_siz_p, off_non, p_com_par(:, i));
    pre_for_exp(fon_siz)
    if i == n_par
        xticks(1:n_com + 1)
        xticklabels(x_tic_bar)
    else
        xticks([])
    end
    hax_sub(ind_rig).FontSize = fon_siz;
end
 [~,h]=suplabel(tit,'t', [.08 0 .87 .983]);
 set(h,'FontSize',fon_siz + 3)
end

function plo_eth_sti(dru_ons, sti_ons, sta_tim, end_tim, n_tri_con, rat_tim, ...
    rat_tim_par_sta, col_sig, col_dru, win_siz_bas, col_win_bas, col_sti, ...
    ave_rat_bas_win_ani_par, p_sti_com_par, mar_siz, n_ani, tit, win_siz_sti, ...
    ave_rat_sti_win_ani_par, poi_sti, col_win_sti, abb_par)
fon_siz = 20;
[n_com, n_par] = size(p_sti_com_par);
x_tic = [dru_ons; sti_ons(1:2:end)];
if ~isempty(dru_ons)
    x_tic_min = x_tic/60;
    n_tic = length(x_tic_min);
    x_tic_str = string(x_tic_min);
    x_tic_cha = cell(n_tic, 1);
    for j = 1:n_tic
        x_tic_cha{j} = char(x_tic_str(j));
    end
end
%
poi_bas = sti_ons(1:n_tri_con:end);
com_cel_rat = cell(n_com, 1);
for i = 1:n_com
    com_cel_rat{i} = [poi_bas(i) - win_siz_bas/2 poi_sti(i) - win_siz_sti/2];
end
fon_siz_p = 20;
fig
n_row = n_par;
n_col = 2*n_com;
gap_ver = 0.02;
gap_hor = 0.03;
mar_bot = 0.07;
mar_top = 0.03;
mar_lef = 0.045;
mar_rig = 0.001;
[hax_sub, pos_sub] = tight_subplot(n_row, n_col, [gap_ver gap_hor], [mar_bot mar_top], ...
    [mar_lef mar_rig]);
n_win = 2*n_com;
siz_win = nan(n_win, 1);
poi_win = nan(n_win, 1);
ind_com = 0;
col_win = strings(n_win, 1);
for i = 1:n_win
    if mod(i, 2) == 1
        siz_win(i) = win_siz_bas;
        ind_com = ind_com + 1;
        poi_win(i) = poi_bas(ind_com);
        col_win(i) = col_win_bas;
    else
        siz_win(i) = win_siz_sti;
        poi_win(i) = poi_sti(ind_com);
        col_win(i) = col_win_sti;
    end
end
h_lab_par = [];
x_par = nan(n_par, 1);
off_non = 0.15;
for i = 1:n_par
    hax_sub_eth_i = hax_sub((i - 1)*n_col + 1);
    ind_end = (i - 1)*n_col + n_com;
    delete(hax_sub((i - 1)*n_col + 2:ind_end))
    pos_end = pos_sub{ind_end};
    hax_sub_eth_i.Position(3) = pos_end(1) + pos_end(3) - hax_sub_eth_i.Position(1);
    axes(hax_sub_eth_i)
    plo_sha(rat_tim, rat_tim_par_sta(:, i, 1), rat_tim_par_sta(:, i, 2), col_sig)
    xlim([sta_tim end_tim])
    hax_sub_eth_i.FontSize = fon_siz;
    h_lab = ylabel(abb_par{i});
    h_lab_par = [h_lab_par; h_lab];
    x_par(i) = h_lab.Position(1);
    hax = gca;
    box off
    if ~isempty(dru_ons)
        plo_ver_lin(dru_ons, hax, col_dru)
    end
    %
    xticks([])
    plo_ver_lin(sti_ons, hax, col_sti)
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%
    plo_sti_sub_tri(hax, siz_win, poi_win, col_win)
    [~, y_lim] = sigstar(com_cel_rat, fon_siz_p, off_non, p_sti_com_par(:, i));
    hax.YLim = y_lim;
    if i == n_par
        xticks(x_tic)
        if ~isempty(dru_ons)
            xticklabels(x_tic_cha)
            enl_num(fon_siz)
        end
        lab_x_axi('Time (min)', fon_siz);
    end
end
x_min = min(x_par);
for i = 1:n_par
    h_lab_par(i).Position(1) = x_min;
end
%%%%%%%%%%%%%%%%%%% bar plots
for i = 1:n_par
    linkaxes(hax_sub((i - 1)*n_col + n_com + 1:i*n_col))
    y_max_j = -inf;
    for j = 1:n_com
        hax_sub_com_i = hax_sub((i - 1)*n_col + n_com + j);
        axes(hax_sub_com_i)
        plo_bar_dat([reshape(ave_rat_bas_win_ani_par(j, :, i), n_ani, 1) reshape(ave_rat_sti_win_ani_par(j, :, i), n_ani, 1)], ...
            [col_win_bas col_win_sti], mar_siz);
        y_lim_j = hax_sub_com_i.YLim;
        if max(y_lim_j) < y_max_j
            hax_sub_com_i.YLim(2) = y_max_j;
        end
        sigstar_sca([1 2], fon_siz_p, off_non, p_sti_com_par(j, i));
        y_lim_j = hax_sub_com_i.YLim;
        y_lim_j_max = max(y_lim_j);
        if y_lim_j_max > y_max_j
            y_max_j = y_lim_j_max;
        end
        pre_for_exp(fon_siz)
        if i == n_par
            xticks(1:n_com + 1)
            xticklabels({'Bas', 'Sti'})
        else
            xticks([])
        end
        if j > 1
            yticks([])
            hax_sub_com_i.YColor = 'w';
        end
        hax_sub_com_i.FontSize = fon_siz;
    end
end
[~,h]=suplabel([tit '; n = ' sprintf('%d', n_ani) ' animals'],'t', [.08 .08 .87 .9]);
set(h,'FontSize',fon_siz + 3)
end

function plo_beh(n_con, tim_tri_bin, rat_fra_sta_par_con, fon_siz, ...
    col_rat_ave, col_sti_ave, y_lab, con, tit, n_ani, n_par)
ult_y = 0.9;
ini_dif = 0.04;
x_lab = 'Time (s)';
addpath(genpath('\\home.ansatt.ntnu.no\kadiram\Documents\MATLAB\figure'))
y_lim_con_par = nan(n_con, 2, n_par);
fig
for i = 1:n_con
    for j = 1:n_par
        hax = subplot(n_con, n_par, (i - 1)*n_par + j);
        plo_rat_tri(tim_tri_bin, rat_fra_sta_par_con{i}, fon_siz, col_rat_ave, col_sti_ave, y_lab, j, hax)
        y_lim_con_par(i, :, j) = ylim;
        if i == n_con
            xlabel(x_lab)
        end
    end
end
close
fig
for i = 1:n_con
    for j = 1:n_par
        hax = subplot(n_con, n_par, (i - 1)*n_par + j);
        plo_rat_tri(tim_tri_bin, rat_fra_sta_par_con{i}, fon_siz, col_rat_ave, col_sti_ave, y_lab, j, hax)
        ylim([min(y_lim_con_par(:, 1, j)) max(y_lim_con_par(:, 2, j))])
        if i == n_con
            xlabel(x_lab)
        end
    end
end
for i = 1:n_con
    [~, h] = suplabel([char(con(i)) ' n = ' sprintf('%d', n_ani)],'t', [.08 .08 .87 ult_y - (i - 1)*(ult_y/n_con) - ini_dif]);
    set(h,'FontSize', fon_siz + 3)
end
enl_num(fon_siz)
[~, h] = suplabel(char(tit), 't', [.08 .08 .87 ult_y]);
set(h, 'FontSize', fon_siz + 3)
end

function plo_res_lst(tim_tri_fra, dff_fra_sta_con, col_con, tit, n_con)
sti = ["L"; "S"; "T"];
x_lab ='Time (s)';
y_lab = '\DeltaF/F (%)';
fon_siz = 24;
n_row = 1;
sti_dur_con = [2; 1; 0.200];
per = 1;

n_plo = n_row*n_con;
hax = [];
fig
for i = 1:n_plo
    h = subplot(n_row, n_con, i);
    plo_sha(tim_tri_fra, dff_fra_sta_con(:, 1, i), dff_fra_sta_con(:, 2, i), col_con(i));
    hax = [hax h];
    if i == 1
        pre_for_exp_lab(x_lab, y_lab, fon_siz)
        axes('Position', h.Position, 'Color', 'none', 'XTick', [], 'YTick', [], 'XTickLabel', [], 'YTickLabel', []);
    else
        set(h, 'ycolor', 'w')
        pre_for_exp_x_lab(x_lab, fon_siz)
        axes('Position', h.Position, 'YColor', 'w', 'Color', 'none', 'XTick', [], 'YTick', [], 'XTickLabel', [], 'YTickLabel', []);
    end
    hold on
    add_hor_sca_bar_out(h, sti_dur_con(i), col_con(i), per);
    x_lim = h.XLim;
    nor_x = (-x_lim(1) + sti_dur_con(i)/2 - 0.2)/diff(x_lim);
    nor_y = 3;
    tx = wri(sti(i), nor_x, nor_y, 'k', fon_siz);
end
linkaxes(hax, 'xy')
pre_for_exp(fon_siz)
[~, h] = suplabel(tit, 't', [.08 .08 .87 .9]);
set(h, 'FontSize', fon_siz + 3)
end

function plo_res_lst_thr(tim_tri_fra, dff_thr_fra_sta_con, col_con, tit, n_con)
sti = ["L"; "S"; "T"];
x_lab ='Time (s)';
y_lab = '\DeltaF/F (%)';
fon_siz = 24;
n_thr = 3;
n_row = n_thr;
sti_dur_con = [2; 1; 0.200];
per = 1;

n_plo = n_row*n_con;
hax = [];
fig
for i = 1:n_plo
    thr_num_i = ceil(i/n_con);
    con_i = mod(i, n_con);
    if con_i == 0
        con_i = n_con;
    end
    h = subplot(n_row, n_con, i);
    plo_sha(tim_tri_fra, dff_thr_fra_sta_con{thr_num_i}(:, 1, con_i), dff_thr_fra_sta_con{thr_num_i}(:, 2, con_i), col_con(con_i));
    hax = [hax h];
    if con_i == 1 && thr_num_i == n_thr
        pre_for_exp_lab(x_lab, y_lab, fon_siz)
        axes('Position', h.Position, 'Color', 'none', 'XTick', [], 'YTick', [], 'XTickLabel', [], 'YTickLabel', []);
    elseif con_i == 1
        lab_y_axi(y_lab, fon_siz)
        pre_for_exp(fon_siz)
        axes('Position', h.Position, 'Color', 'none', 'XTick', [], 'YTick', [], 'XTickLabel', [], 'YTickLabel', []);
    elseif thr_num_i == n_thr
        set(h, 'ycolor', 'w')
        pre_for_exp_x_lab(x_lab, fon_siz)
        axes('Position', h.Position, 'YColor', 'w', 'Color', 'none', 'XTick', [], 'YTick', [], 'XTickLabel', [], 'YTickLabel', []);
    else
        set(h, 'ycolor', 'w')
        pre_for_exp(fon_siz)
        axes('Position', h.Position, 'YColor', 'w', 'Color', 'none', 'XTick', [], 'YTick', [], 'XTickLabel', [], 'YTickLabel', []);
    end
    hold on
    add_hor_sca_bar_out(h, sti_dur_con(con_i), col_con(con_i), per);
    x_lim = h.XLim;
    nor_x = (-x_lim(1) + sti_dur_con(con_i)/2 - 0.2)/diff(x_lim);
    nor_y = 3;
    tx = wri(sti(con_i), nor_x, nor_y, 'k', fon_siz);
end
linkaxes(hax, 'xy')
[~, h] = suplabel(tit, 't', [.08 .08 .87 .9]);
set(h, 'FontSize', fon_siz + 3)
end

function plo_pro(bea_lat_ani_tri, per_pro_ani_con, per_pro_ani_shu, p_cro, tit)
fig
n_row = 1;
n_col = 1;
gap_ver = 0.000;
gap_hor = 0.000;
mar_bot = 0.070;
mar_top = 0.070;
mar_lef = 0.020;
del = 0.025;
mar_rig = 0.500 + del;
hax_sub = tight_subplot(n_row, n_col, [gap_ver gap_hor], [mar_bot mar_top], [mar_lef mar_rig]);
hax = hax_sub(1);
axes(hax)
sim = true;
plo_lat_map_sim(bea_lat_ani_tri, hax, sim)
y_lab = 'Animal';
h_lab = ylabel(y_lab);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
n_row = 1;
n_col = 2;
gap_ver = 0.000;
gap_hor = 0.005;
mar_lef = 0.500 + del;
mar_rig = 0.005;
wei = [3 1];
hax_sub = tight_subplot(n_row, n_col, [gap_ver gap_hor], [mar_bot mar_top], [mar_lef mar_rig], wei);
linkaxes(hax_sub, 'y')
hax = hax_sub(1);
axes(hax)
off_non = 0.020;
global con_int
mou = 0.010;
sep = off_non + mou + 0.010;
log_tex = true;
plo_pro_onl(per_pro_ani_con, per_pro_ani_shu, hax, p_cro, off_non, con_int, sep, mou, log_tex)
y_lab = '%tailbeat probability';
h_lab_bot = ylabel(y_lab);
% histogram
y_lim = ylim;
y_min = y_lim(1);
y_max = y_lim(2);
hax = hax_sub(2);
axes(hax)
plo_cha_lev(per_pro_ani_shu)
hax.YLim = [y_min y_max];
x_lab = 'Frequency';
xlabel(x_lab)
hax.YColor = 'none';
%
sup_hei = 0.980;
supAxes = [0 0 1 sup_hei];
[ax,h]=suplabel(tit,'t',supAxes);
end

function h_fig = plo_ang_his(ang_bou)
n_row = 1;
n_col = 1;
gap_ver_row = 0.030*ones(n_row, 1);
gap_hor_ave = 0.030;
gap_hor_col = gap_hor_ave;
gap_hor_row_col = repmat(gap_hor_col, n_row, n_col);
mar_bot = 0.100;
mar_top = 0.040;
mar_lef = 0.070;
mar_rig = 0.000;
asp_rat_axe = 1;
[h_fig, wid_mon, hei_mon] = fig;
wid = false;
sca_axe = ones(n_row*n_col, 1);
n_pix_ext = 30;
[hax_sub, ~, ~, ~, las_pix, rat_wid] = tight_subplot_gen(n_row, n_col, gap_ver_row, gap_hor_row_col...
    , mar_bot, mar_top, mar_lef, mar_rig, asp_rat_axe, wid_mon, hei_mon, wid, sca_axe, n_pix_ext);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
hax = hax_sub(1);
histogram(hax, ang_bou)
box(hax, "off")
xlabel(hax, 'Average swim bout angle (rad)')
ylabel(hax, 'Frequency')
%%%%%%%%%%%%%%
h_fig = opt_h_fig(h_fig, las_pix, rat_wid);
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% neural
function [n_cel_reg_ani, n_cel_reg] = ext_n_cel_reg_ani(obj)
    global n_reg_for
    n_cel_reg_ani.raw = zeros(n_reg_for, obj.n_ani);
    n_cel_reg_ani.rem = zeros(n_reg_for, obj.n_ani);
    for k = 1:n_reg_for
        for i = 1:obj.n_ani
            if (obj.sta_ani(i) && obj.cel_det_ani(i)) && obj.bri_ani(i)
                rec_fun_i = str2func(['rec_fun.' convertStringsToChars(obj.ani(i))]);
                sti = rec_fun_i();
                rec_fil = matfile(sti.fil_pat_rec);
                n_cel_iii_reg = rec_fil.n_cel_reg;
                n_cel_reg_ani.raw(k, i) = n_cel_iii_reg.raw(k);
                n_cel_reg_ani.rem(k, i) = n_cel_iii_reg.rem(k);
            end
        end
    end
    n_cel_reg.raw = sum(n_cel_reg_ani.raw, 2);
    n_cel_reg.rem = sum(n_cel_reg_ani.rem, 2);% total over animals
end

function act_reg_ani_con_fra_cel = ext_act_reg_ani_con_fra_cel(obj, var, fie_num, ...
    act_reg_ani_con_fra_cel)
global n_reg_for n_con
var_reg_ani_con_fra_cel = cell(n_reg_for, 1);
for k = 1:n_reg_for
    var_reg_ani_con_fra_cel{k} = cell(obj.n_ani, n_con);
    for i = 1:obj.n_ani
        if (obj.sta_ani(i) && obj.cel_det_ani(i)) && obj.bri_ani(i)
            rec_fun_i = str2func(['rec_fun.' convertStringsToChars(obj.ani(i))]);
            sti = rec_fun_i();
            rec_fil = matfile(sti.fil_pat_rec);
            var_reg_con_fra_cel = rec_fil.(var);
            var_reg_con_fra_cel = getfield(var_reg_con_fra_cel, fie_num{:});
            for j = 1:n_con
                var_reg_ani_con_fra_cel{k}{i, j} = var_reg_con_fra_cel{k, j};
            end
        end
    end
end
act_reg_ani_con_fra_cel = setfield(act_reg_ani_con_fra_cel, fie_num{:}, var_reg_ani_con_fra_cel);
end

function [act_reg_con_fra_cel, act_reg_fra_sta_con] = ext_act_reg_con_fra_cel(obj, ...
    act_reg_ani_con_fra_cel, fie_num, act_reg_con_fra_cel, act_reg_fra_sta_con)
global n_reg_for n_con
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% pooling
var_reg_con_fra_cel = cell(n_reg_for, n_con);
var_reg_fra_sta_con = cell(n_reg_for, 1);
act_reg_ani_con_fra_cel = getfield(act_reg_ani_con_fra_cel, fie_num{:});
con_fil = matfile('\\home.ansatt.ntnu.no\kadiram\Documents\MATLAB\con_esp.mat');
tri_len = con_fil.tri_len;
for k = 1:n_reg_for
    var_reg_fra_sta_con{k} = nan(tri_len.dff.one.int + 1, 2, n_con);
    for i = 1:n_con
        for j = 1:obj.n_ani
            if obj.bri_ani(j) && obj.cel_det_ani(j)
                var_reg_con_fra_cel{k, i} = [var_reg_con_fra_cel{k, i} ...
                    act_reg_ani_con_fra_cel{k}{j, i}];
            end
        end
        [var_reg_fra_sta_con{k}(:, 1, i), ~, var_reg_fra_sta_con{k}(:, 2, i)] = ...
            com_sta(var_reg_con_fra_cel{k, i}, 2);
    end
end
act_reg_con_fra_cel = setfield(act_reg_con_fra_cel, fie_num{:}, var_reg_con_fra_cel);
act_reg_fra_sta_con = setfield(act_reg_fra_sta_con, fie_num{:}, var_reg_fra_sta_con);
end

function [pcc_mea_reg_xri_xri, pcc_ave_reg_con_ani, euc_dis_mea_reg_xri_xri, ...
    euc_dis_ave_reg_con_ani] = ext_pcc_mea_reg_xri_xri(bri_ani, cel_det_ani, fil_pat_rec, ...
    fie_num, pcc_mea_reg_xri_xri, pcc_ave_reg_con_ani, euc_dis_mea_reg_xri_xri, ...
    euc_dis_ave_reg_con_ani)
global n_reg_for n_xri n_con
var_pcc_mea_reg_xri_xri = cell(n_reg_for, 1);
pcc_reg_xri_xri_ani = cell(n_reg_for, 1);
var_pcc_ave_reg_con_ani = cell(n_reg_for, n_con); % trial-combination-averaged
n_ani = length(bri_ani);
var_euc_dis_mea_reg_xri_xri = cell(n_reg_for, 1);
euc_dis_reg_xri_xri_ani = cell(n_reg_for, 1);
var_euc_dis_ave_reg_con_ani = cell(n_reg_for, n_con); % trial-combination-averaged
for i = 1:n_reg_for
    pcc_reg_xri_xri_ani{i} = nan(n_xri, n_xri, n_ani);
    euc_dis_reg_xri_xri_ani{i} = nan(n_xri, n_xri, n_ani);
    for j = 1:n_ani
        if bri_ani(j) && cel_det_ani(j)
            rec_fil_obj = matfile(fil_pat_rec(j));
            %
            pcc_reg_xri_xri = getfield(rec_fil_obj.pcc_reg_xri_xri, fie_num{:});
            pcc_reg_xri_xri_ani{i}(:, :, j) = pcc_reg_xri_xri{i};
            %
            euc_dis_reg_xri_xri = getfield(rec_fil_obj.euc_dis_reg_xri_xri, fie_num{:});
            euc_dis_reg_xri_xri_ani{i}(:, :, j) = euc_dis_reg_xri_xri{i};
        end
    end
    var_pcc_mea_reg_xri_xri{i} = com_sta(pcc_reg_xri_xri_ani{i}, 3);
    var_euc_dis_mea_reg_xri_xri{i} = com_sta(euc_dis_reg_xri_xri_ani{i}, 3);
    %
    for j = 1:n_con
        var_pcc_ave_reg_con_ani{i, j} = nan(n_ani, 1);
        var_euc_dis_ave_reg_con_ani{i, j} = nan(n_ani, 1);
        for k = 1:n_ani
            if bri_ani(k) && cel_det_ani(k)
                rec_fil_obj = matfile(fil_pat_rec(k));
                %
                pcc_reg_con = getfield(rec_fil_obj.pcc_reg_con, fie_num{:});
                var_pcc_ave_reg_con_ani{i, j}(k) = pcc_reg_con(i, j);
                %
                euc_dis_reg_con = getfield(rec_fil_obj.euc_dis_reg_con, fie_num{:});
                var_euc_dis_ave_reg_con_ani{i, j}(k) = euc_dis_reg_con(i, j);
            end
        end
    end
end
pcc_mea_reg_xri_xri = setfield(pcc_mea_reg_xri_xri, fie_num{:}, var_pcc_mea_reg_xri_xri);
pcc_ave_reg_con_ani = setfield(pcc_ave_reg_con_ani, fie_num{:}, var_pcc_ave_reg_con_ani);
%
euc_dis_mea_reg_xri_xri = ...
    setfield(euc_dis_mea_reg_xri_xri, fie_num{:}, var_euc_dis_mea_reg_xri_xri);
euc_dis_ave_reg_con_ani = ...
    setfield(euc_dis_ave_reg_con_ani, fie_num{:}, var_euc_dis_ave_reg_con_ani);
end

function dff_pla_pix_fra = ext_dff_pla_pix_fra(dff_pix_fra, n_pix_pla_ani)
con_fil = matfile('\\home.ansatt.ntnu.no\kadiram\Documents\MATLAB\con_esp.mat');
n_pla = con_fil.n_pla;
dff_pla_pix_fra = cell(n_pla.neu.raw, 1);
n_ani = size(n_pix_pla_ani, 2);
fun_pla = con_fil.fun_pla;
n_pix_ani = sum(n_pix_pla_ani, 1, "omitnan");
n_pix_cum_ani = cumsum(n_pix_ani);
n_pix_cum_pla_ani = cumsum(n_pix_pla_ani, 1, "omitnan");
for ani = 1:n_ani
    disp(ani)
    if ~isnan(n_pix_pla_ani(1, ani))
        for pla = fun_pla.raw
            if ani == 1
                ani_sta_pix = 1;
            else
                ani_sta_pix = n_pix_cum_ani(ani - 1) + 1;
            end
            if pla == 1
                sta_pix = ani_sta_pix;
            else
                sta_pix = ani_sta_pix + n_pix_cum_pla_ani(pla - 1, ani);
            end
            sto_pix = sta_pix - 1 + n_pix_pla_ani(pla, ani);
            dff_pla_pix_fra{pla} = [dff_pla_pix_fra{pla}; dff_pix_fra(sta_pix:sto_pix, :)];
        end
    end
end
end

function [clu_pix_k, ioi_k] = ext_clu_pix_k(log_pix, dff_pix_fra)
n_pix = sum(log_pix, "all", "omitnan");
k_max = 5;
clu_pix_k = nan(n_pix, k_max);
options = statset('UseParallel', 1);
ioi_k = nan(1, k_max);
k_sta = 5;
for k = k_sta:k_max
    disp(k)
    [clu_pix_k(:, k), ~, sum_dis_clu, D] = kmeans(dff_pix_fra(log_pix, :), k, 'Distance', ...
        'correlation', 'Replicates', 50, 'Options', options);
    ioi_k(1, k) = sum(sum_dis_clu)/mean(sum(D));
end
end

function [clu_cel_k, ioi_k, n_cel, dff_cel_fra] = com_clu_cel_k(obj)
dff_cel_fra = [];% cells discriminated when plotting
n_cel = 0;
for ani_num = 1:obj.n_ani
    disp(ani_num)
    rec_fun_i = str2func(['rec_fun.' convertStringsToChars(obj.ani(ani_num))]);
    sti = rec_fun_i();
    rec_fil = matfile(sti.fil_pat_rec);
    act_cel_fra = rec_fil.dff_roi_fra;%!!!!!!!!!!!!!!!
    dff_cel_fra = [dff_cel_fra; act_cel_fra];
    n_cel = n_cel + size(act_cel_fra, 1);
end
k_max = 5;
clu_cel_k = nan(n_cel, k_max);
p = gcp('nocreate');
if isempty(p)
    parpool
end
options = statset('UseParallel', 1);
ioi_k = nan(1, k_max);
k_sta = 5;
for k = k_sta:k_max
    disp(k)
    [clu_cel_k(:, k), ~, sum_dis_clu, D] = kmeans(dff_cel_fra, k, ...
        'Distance', 'correlation', 'Replicates', 50, 'Options', options);
    ioi_k(1, k) = sum(sum_dis_clu)/mean(sum(D));
end
end

function pcc_blo_ani = gen_pcc_blo_ani(obj, pcc_blo_ani, per)
con_fil = matfile('\\home.ansatt.ntnu.no\kadiram\Documents\MATLAB\con_esp.mat');
n_blo = con_fil.n_blo;
pcc_blo_ani.(per).dat.all = nan(n_blo.rap.thr, obj.n_ani);
pcc_blo_ani.(per).dat.pos = nan(n_blo.rap.thr, obj.n_ani);
pcc_blo_ani.(per).dat.neg = nan(n_blo.rap.thr, obj.n_ani);
pcc_blo_ani.(per).shu.all = nan(n_blo.rap.thr, obj.n_ani);
pcc_blo_ani.(per).shu.pos = nan(n_blo.rap.thr, obj.n_ani);
pcc_blo_ani.(per).shu.neg = nan(n_blo.rap.thr, obj.n_ani);
for ani_num = 1:obj.n_ani
    disp(ani_num)
    rec_fun_i = str2func(['rec_fun.' convertStringsToChars(obj.ani(ani_num))]);
    sti = rec_fun_i();
    rec_fil = matfile(sti.fil_pat_rec);
    pcc_blo = rec_fil.pcc_blo;
    pcc_blo_ani.(per).dat.all(:, ani_num) = pcc_blo.(per).dat.all;
    pcc_blo_ani.(per).dat.pos(:, ani_num) = pcc_blo.(per).dat.pos;
    pcc_blo_ani.(per).dat.neg(:, ani_num) = pcc_blo.(per).dat.neg;
    pcc_blo_ani.(per).shu.all(:, ani_num) = pcc_blo.(per).shu.all;
    pcc_blo_ani.(per).shu.pos(:, ani_num) = pcc_blo.(per).shu.pos;
    pcc_blo_ani.(per).shu.neg(:, ani_num) = pcc_blo.(per).shu.neg;
end
end

function log_fie_fie_cel = gen_log_fie_fie_cel(log_fie_fie_cel, fie_num)
log_fie_fie_cel.(fie_num{1}).(fie_num{2}).all = logical([]);
log_fie_fie_cel.(fie_num{1}).(fie_num{2}).inh = logical([]);
log_fie_fie_cel.(fie_num{1}).(fie_num{2}).exc = logical([]);
log_fie_fie_cel.(fie_num{1}).(fie_num{2}).non = logical([]);
end

function log_fie_fie_cel = enh_log_fie_fie_cel(log_fie_fie_cel, fie_num, gab_fie_fie_cel)
log_fie_fie_cel.(fie_num{1}).(fie_num{2}).all = [log_fie_fie_cel.(fie_num{1}).(fie_num{2}).all; ...
    gab_fie_fie_cel.(fie_num{1}).(fie_num{2}).all];
log_fie_fie_cel.(fie_num{1}).(fie_num{2}).inh = [log_fie_fie_cel.(fie_num{1}).(fie_num{2}).inh; ...
    gab_fie_fie_cel.(fie_num{1}).(fie_num{2}).inh];
log_fie_fie_cel.(fie_num{1}).(fie_num{2}).exc = [log_fie_fie_cel.(fie_num{1}).(fie_num{2}).exc; ...
    gab_fie_fie_cel.(fie_num{1}).(fie_num{2}).exc];
log_fie_fie_cel.(fie_num{1}).(fie_num{2}).non = [log_fie_fie_cel.(fie_num{1}).(fie_num{2}).non; ...
    gab_fie_fie_cel.(fie_num{1}).(fie_num{2}).non];
end

function fra_fie_blo_ani = gen_fra_fie_blo_ani(fra_fie_blo_ani, fie, obj)
con_fil = matfile('\\home.ansatt.ntnu.no\kadiram\Documents\MATLAB\con_esp.mat');
n_blo = con_fil.n_blo;
fra_fie_blo_ani.(fie).ros_cau.exc.gab = nan(n_blo.rap.one, obj.n_ani);
fra_fie_blo_ani.(fie).ros_cau.exc.non = nan(n_blo.rap.one, obj.n_ani);
fra_fie_blo_ani.(fie).ros_cau.inh.gab = nan(n_blo.rap.one, obj.n_ani);
fra_fie_blo_ani.(fie).ros_cau.inh.non = nan(n_blo.rap.one, obj.n_ani);
fra_fie_blo_ani.(fie).dor_ven.exc.gab = nan(n_blo.rap.one, obj.n_ani);
fra_fie_blo_ani.(fie).dor_ven.exc.non = nan(n_blo.rap.one, obj.n_ani);
fra_fie_blo_ani.(fie).dor_ven.inh.gab = nan(n_blo.rap.one, obj.n_ani);
fra_fie_blo_ani.(fie).dor_ven.inh.non = nan(n_blo.rap.one, obj.n_ani);
end

function fra_fie_blo_ani = enh_fra_fie_blo_ani(fra_fie_blo_ani, fie, ani_num, fra_fie_fie_blo)
fra_fie_blo_ani.(fie).ros_cau.exc.gab(:, ani_num) = fra_fie_fie_blo.gab.(fie).ros_cau.exc;
fra_fie_blo_ani.(fie).ros_cau.exc.non(:, ani_num) = fra_fie_fie_blo.non.(fie).ros_cau.exc;
fra_fie_blo_ani.(fie).ros_cau.inh.gab(:, ani_num) = fra_fie_fie_blo.gab.(fie).ros_cau.inh;
fra_fie_blo_ani.(fie).ros_cau.inh.non(:, ani_num) = fra_fie_fie_blo.non.(fie).ros_cau.inh;
fra_fie_blo_ani.(fie).dor_ven.exc.gab(:, ani_num) = fra_fie_fie_blo.gab.(fie).dor_ven.exc;
fra_fie_blo_ani.(fie).dor_ven.exc.non(:, ani_num) = fra_fie_fie_blo.non.(fie).dor_ven.exc;
fra_fie_blo_ani.(fie).dor_ven.inh.gab(:, ani_num) = fra_fie_fie_blo.gab.(fie).dor_ven.inh;
fra_fie_blo_ani.(fie).dor_ven.inh.non(:, ani_num) = fra_fie_fie_blo.non.(fie).dor_ven.inh;
end

function cor_fie_fie_blo_ani = fin_cor_fie_fie_blo_ani(obj, fie)
cor_fie_fie_blo_ani.exc.dat = gen_cor_fie_fie_blo_ani(obj, {fie, 'exc', 'dat'});
cor_fie_fie_blo_ani.exc.shu = gen_cor_fie_fie_blo_ani(obj, {fie, 'exc', 'shu'});
cor_fie_fie_blo_ani.inh.dat = gen_cor_fie_fie_blo_ani(obj, {fie, 'inh', 'dat'});
cor_fie_fie_blo_ani.inh.shu = gen_cor_fie_fie_blo_ani(obj, {fie, 'inh', 'shu'});
end

function cor_fie_fie_blo_ani = gen_cor_fie_fie_blo_ani(obj, fie_num)
con_fil = matfile('\\home.ansatt.ntnu.no\kadiram\Documents\MATLAB\con_esp.mat');
n_blo = con_fil.n_blo;
n_blo = n_blo.axo;
cor_fie_fie_blo_ani.all = nan(n_blo, obj.n_ani);
cor_fie_fie_blo_ani.pos = nan(n_blo, obj.n_ani);
cor_fie_fie_blo_ani.neg = nan(n_blo, obj.n_ani);
for ani = 1:obj.n_ani
    rec_fun_i = str2func(['rec_fun.' convertStringsToChars(obj.ani(ani))]);
    sti = rec_fun_i();
    rec_fil = matfile(sti.fil_pat_rec);
    cor_fie_fie_blo = rec_fil.cor_fie_fie_blo;
    cor_fie_fie_blo_ani.all(:, ani) = cor_fie_fie_blo.(fie_num{1}).(fie_num{2}).(fie_num{3}).all;
    cor_fie_fie_blo_ani.pos(:, ani) = cor_fie_fie_blo.(fie_num{1}).(fie_num{2}).(fie_num{3}).pos;
    cor_fie_fie_blo_ani.neg(:, ani) = cor_fie_fie_blo.(fie_num{1}).(fie_num{2}).(fie_num{3}).neg;
end
end

function [cum_pro_bin_ani, r_ani, p] = gen_cum_pro_bin_ani(obj, fie)
con_fil = matfile('\\home.ansatt.ntnu.no\kadiram\Documents\MATLAB\con_esp.mat');
cum_pro_bin_ani.exc = nan(con_fil.n_bin_cor_coe, obj.n_ani);
cum_pro_bin_ani.inh = nan(con_fil.n_bin_cor_coe, obj.n_ani);
r_ani.exc = nan(obj.n_ani, 1);
r_ani.inh = nan(obj.n_ani, 1);
for i = 1:obj.n_ani
    rec_fun_i = str2func(['rec_fun.' convertStringsToChars(obj.ani(i))]);
    sti = rec_fun_i();
    rec_fil = matfile(sti.fil_pat_rec);
    cum_pro_bin = rec_fil.cum_pro_bin;
    cum_pro_bin_ani.exc(:, i) = cum_pro_bin.(fie).exc;
    cum_pro_bin_ani.inh(:, i) = cum_pro_bin.(fie).inh;
    r = rec_fil.r;
    r_ani.exc(i) = r.(fie).exc;
    r_ani.inh(i) = r.(fie).inh;
end
p = signrank(r_ani.exc, r_ani.inh);
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% cel onl
function [dff_cel_fra, log_fie_fie_cel, res_fie_fie_cel, fra_fie_ani] = gen_dff_cel_fra(obj)
dff_cel_fra.bou_all = [];
dff_cel_fra.lig = [];
dff_cel_fra.sho = [];
dff_cel_fra.tap = [];
for ani_num = 1:obj.n_ani
    disp(ani_num)
    rec_fun_i = str2func(['rec_fun.' convertStringsToChars(obj.ani(ani_num))]);
    sti = rec_fun_i();
    rec_fil = matfile(sti.fil_pat_rec);
    act_cel_fra = rec_fil.dff_cel_fra;
    dff_cel_fra.bou_all = [dff_cel_fra.bou_all; act_cel_fra.bou_all];
    dff_cel_fra.lig = [dff_cel_fra.lig; act_cel_fra.lig];
    dff_cel_fra.sho = [dff_cel_fra.sho; act_cel_fra.sho];
    dff_cel_fra.tap = [dff_cel_fra.tap; act_cel_fra.tap];
end
[log_fie_fie_cel.bou_all.srt, res_fie_fie_cel.bou_all.srt] = gen_log_cel_gab(obj, {'bou_all', 'srt'});
[log_fie_fie_cel.lig.srt, res_fie_fie_cel.lig.srt] = gen_log_cel_gab(obj, {'lig', 'srt'});
[log_fie_fie_cel.sho.srt, res_fie_fie_cel.sho.srt] = gen_log_cel_gab(obj, {'sho', 'srt'});
[log_fie_fie_cel.tap.srt, res_fie_fie_cel.tap.srt] = gen_log_cel_gab(obj, {'tap', 'srt'});
%
fra_fie_ani.bou_all = gen_fra_fie_ani(obj, {'bou_all', 'srt'});
fra_fie_ani.lig = gen_fra_fie_ani(obj, {'lig', 'srt'});
fra_fie_ani.sho = gen_fra_fie_ani(obj, {'sho', 'srt'});
fra_fie_ani.tap = gen_fra_fie_ani(obj, {'tap', 'srt'});
end

function [log_cel, res_cel] = gen_log_cel(obj, fie_num)
log_cel.inh = [];
log_cel.exc = [];
log_cel.non = [];
res_cel = [];
for ani_num = 1:obj.n_ani
    disp(ani_num)
    rec_fun_i = str2func(['rec_fun.' convertStringsToChars(obj.ani(ani_num))]);
    sti = rec_fun_i();
    rec_fil = matfile(sti.fil_pat_rec);
    boo_cel = rec_fil.log_cel;
    log_cel.inh = [log_cel.inh; boo_cel.(fie_num{1}).neu.(fie_num{2}).inh];
    log_cel.exc = [log_cel.exc; boo_cel.(fie_num{1}).neu.(fie_num{2}).exc];
    log_cel.non = [log_cel.non; boo_cel.(fie_num{1}).neu.(fie_num{2}).non];
    res_fie_cel = rec_fil.res_fie_cel;
    res_cel = [res_cel; res_fie_cel.(fie_num{1}).(fie_num{2})];
end
log_cel.inh = logical(log_cel.inh);
log_cel.exc = logical(log_cel.exc);
log_cel.non = logical(log_cel.non);
end

function [log_cel, res_cel] = gen_log_cel_gab(obj, fie_num)
log_cel.inh = [];
log_cel.exc = [];
log_cel.non = [];
res_cel = [];
for ani_num = 1:obj.n_ani
    disp(ani_num)
    rec_fun_i = str2func(['rec_fun.' convertStringsToChars(obj.ani(ani_num))]);
    sti = rec_fun_i();
    rec_fil = matfile(sti.fil_pat_rec);
    boo_cel = rec_fil.log_cel;
    log_cel.inh = [log_cel.inh; boo_cel.(fie_num{1}).(fie_num{2}).inh];
    log_cel.exc = [log_cel.exc; boo_cel.(fie_num{1}).(fie_num{2}).exc];
    log_cel.non = [log_cel.non; boo_cel.(fie_num{1}).(fie_num{2}).non];
    res_fie_cel = rec_fil.res_fie_cel;
    res_cel = [res_cel; res_fie_cel.(fie_num{1}).(fie_num{2})];
end
log_cel.inh = logical(log_cel.inh);
log_cel.exc = logical(log_cel.exc);
log_cel.non = logical(log_cel.non);
end

function fra_fie_ani = gen_fra_fie_ani(obj, fie_num)
fra_fie_ani = [];
fra_fie_ani = ini_fra_fie_ani(fra_fie_ani, fie_num{2}, obj);
for ani_num = 1:obj.n_ani
    disp(ani_num)
    rec_fun_i = str2func(['rec_fun.' convertStringsToChars(obj.ani(ani_num))]);
    sti = rec_fun_i();
    rec_fil = matfile(sti.fil_pat_rec);
    fra_fie = rec_fil.fra_fie;
    fra_fie_ani = enh_fra_fie_ani(fra_fie_ani, fie_num{2}, ani_num, fra_fie.(fie_num{1}));
end
end

function fra_fie_ani = ini_fra_fie_ani(fra_fie_ani, fie, obj)
fra_fie_ani.(fie).exc.gab = nan(obj.n_ani, 1);
fra_fie_ani.(fie).exc.non = nan(obj.n_ani, 1);
fra_fie_ani.(fie).inh.gab = nan(obj.n_ani, 1);
fra_fie_ani.(fie).inh.non = nan(obj.n_ani, 1);
end

function fra_fie_ani = enh_fra_fie_ani(fra_fie_ani, fie, ani_num, fra_fie)
fra_fie_ani.(fie).exc.gab(ani_num) = fra_fie.gab.(fie).exc;
fra_fie_ani.(fie).exc.non(ani_num) = fra_fie.non.(fie).exc;
fra_fie_ani.(fie).inh.gab(ani_num) = fra_fie.gab.(fie).inh;
fra_fie_ani.(fie).inh.non(ani_num) = fra_fie.non.(fie).inh;
end

function fra_blo_ani = gen_fra_blo_ani(obj, fie)
rec_fun = str2func(['rec_fun.' convertStringsToChars(obj.ani(1))]);
sti = rec_fun();
rec_fil = matfile(sti.fil_pat_rec);
fra_blo = rec_fil.fra_blo;
n_blo.ros_cau = length(fra_blo.(fie).ros_cau.exc);
n_blo.dor_ven = length(fra_blo.(fie).dor_ven.exc);

fra_blo_ani.ros_cau.exc = nan(n_blo.ros_cau, obj.n_ani);
fra_blo_ani.ros_cau.inh = nan(n_blo.ros_cau, obj.n_ani);
fra_blo_ani.dor_ven.exc = nan(n_blo.dor_ven, obj.n_ani);
fra_blo_ani.dor_ven.inh = nan(n_blo.dor_ven, obj.n_ani);
for ani_num = 1:obj.n_ani
    disp(ani_num)
    rec_fun = str2func(['rec_fun.' convertStringsToChars(obj.ani(ani_num))]);
    sti = rec_fun();
    rec_fil = matfile(sti.fil_pat_rec);
    fra_blo = rec_fil.fra_blo;
    fra_blo_ani.ros_cau.exc(:, ani_num) = fra_blo.(fie).ros_cau.exc;
    fra_blo_ani.ros_cau.inh(:, ani_num) = fra_blo.(fie).ros_cau.inh;
    fra_blo_ani.dor_ven.exc(:, ani_num) = fra_blo.(fie).dor_ven.exc;
    fra_blo_ani.dor_ven.inh(:, ani_num) = fra_blo.(fie).dor_ven.inh;
end
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% neurobehavioral
function [clu_cel_k, ioi_k, n_cel, dff_cel_fra] = ext_clu_cel_k(obj)
dff_cel_fra.bou.all = [];% cells discriminated when plotting
dff_cel_fra.bou.spo = [];
n_cel = 0;
for ani_num = 1:obj.n_ani
    disp(ani_num)
    rec_fun_i = str2func(['rec_fun.' convertStringsToChars(obj.ani(ani_num))]);
    sti = rec_fun_i();
    if sti.tai
        rec_fil = matfile(sti.fil_pat_rec);
        act_cel_fra = rec_fil.dff_cel_fra;
        dff_cel_fra.bou.all = [dff_cel_fra.bou.all; act_cel_fra.bou.all];
        dff_cel_fra.bou.spo = [dff_cel_fra.bou.spo; act_cel_fra.bou.spo];
        n_cel = n_cel + size(act_cel_fra.bou.all, 1);
    end
end
k_max = 5;
clu_cel_k.bou.all = nan(n_cel, k_max);
clu_cel_k.bou.spo = nan(n_cel, k_max);
p = gcp('nocreate');
if isempty(p)
    parpool
end
options = statset('UseParallel', 1);
ioi_k.bou.all = nan(1, k_max);
ioi_k.bou.spo = nan(1, k_max);
k_sta = 5;
for k = k_sta:k_max
    disp(k)
    [clu_cel_k.bou.all(:, k), ~, sum_dis_clu, D] = kmeans(dff_cel_fra.bou.all, k, ...
        'Distance', 'correlation', 'Replicates', 50, 'Options', options);
    ioi_k.bou.all(1, k) = sum(sum_dis_clu)/mean(sum(D));
    %
    [clu_cel_k.bou.spo(:, k), ~, sum_dis_clu, D] = kmeans(dff_cel_fra.bou.spo, k, ...
        'Distance', 'correlation', 'Replicates', 50, 'Options', options);
    ioi_k.bou.spo(1, k) = sum(sum_dis_clu)/mean(sum(D));
end
end

function fra_dow_blo_ani = gen_fra_dow_blo_ani(obj, fie)
con_fil = matfile('\\home.ansatt.ntnu.no\kadiram\Documents\MATLAB\con_esp.mat');
n_blo = con_fil.n_blo;
fra_dow_blo_ani.ros_cau.exc = nan(n_blo.for.ros_cau, obj.n_ani);
fra_dow_blo_ani.ros_cau.inh = nan(n_blo.for.ros_cau, obj.n_ani);
%
fra_dow_blo_ani.dor_ven.exc = nan(n_blo.for.dor_ven, obj.n_ani);
fra_dow_blo_ani.dor_ven.inh = nan(n_blo.for.dor_ven, obj.n_ani);
for ani_num = 1:obj.n_ani
    disp(ani_num)
    rec_fun_i = str2func(['rec_fun.' convertStringsToChars(obj.ani(ani_num))]);
    sti = rec_fun_i();
    if sti.tai
        rec_fil = matfile(sti.fil_pat_rec);
        fra_dow_blo = rec_fil.fra_dow_blo;
        fra_dow_blo_ani.ros_cau.exc(:, ani_num) = fra_dow_blo.(fie).ros_cau.exc;
        fra_dow_blo_ani.ros_cau.inh(:, ani_num) = fra_dow_blo.(fie).ros_cau.inh;
        %
        fra_dow_blo_ani.dor_ven.exc(:, ani_num) = fra_dow_blo.(fie).dor_ven.exc;
        fra_dow_blo_ani.dor_ven.inh(:, ani_num) = fra_dow_blo.(fie).dor_ven.inh;
    end
end
end

function log_bin = gen_log_bin(obj, fie_num)
log_bin.res = [];
log_bin.inh = [];
log_bin.exc = [];
for ani_num = 1:obj.n_ani
    disp(ani_num)
    rec_fun_i = str2func(['rec_fun.' convertStringsToChars(obj.ani(ani_num))]);
    sti = rec_fun_i();
    rec_fil = matfile(sti.fil_pat_rec);
    boo_bin = rec_fil.log_bin;
    log_bin.res = [log_bin.res; boo_bin.(fie_num{1}).(fie_num{2}).res];
    log_bin.inh = [log_bin.inh; boo_bin.(fie_num{1}).(fie_num{2}).inh];
    log_bin.exc = [log_bin.exc; boo_bin.(fie_num{1}).(fie_num{2}).exc];
end
log_bin.res = logical(log_bin.res);
log_bin.inh = logical(log_bin.inh);
log_bin.exc = logical(log_bin.exc);
end

function log_bin = fin_log_bin(obj, fie)
log_bin.srt = gen_log_bin(obj, {fie, 'srt'});
log_bin.srt_010 = gen_log_bin(obj, {fie, 'srt_010'});
log_bin.srt_001 = gen_log_bin(obj, {fie, 'srt_001'});
end

function log_bin = gen_log_bin_sen(obj, fie_num)
log_bin.res = [];
log_bin.inh = [];
log_bin.exc = [];
for ani_num = 1:obj.n_ani
    disp(ani_num)
    rec_fun_i = str2func(['rec_fun.' convertStringsToChars(obj.ani(ani_num))]);
    sti = rec_fun_i();
    rec_fil = matfile(sti.fil_pat_rec);
    boo_bin = rec_fil.log_bin;
    log_bin.res = [log_bin.res; boo_bin.(fie_num{1}).neu.(fie_num{2}).res];
    log_bin.inh = [log_bin.inh; boo_bin.(fie_num{1}).neu.(fie_num{2}).inh];
    log_bin.exc = [log_bin.exc; boo_bin.(fie_num{1}).neu.(fie_num{2}).exc];
end
log_bin.res = logical(log_bin.res);
log_bin.inh = logical(log_bin.inh);
log_bin.exc = logical(log_bin.exc);
end

function log_bin = fin_log_bin_sen(obj, fie)
log_bin.srt = gen_log_bin_sen(obj, {fie, 'srt'});
log_bin.srt_010 = gen_log_bin_sen(obj, {fie, 'srt_010'});
log_bin.srt_001 = gen_log_bin_sen(obj, {fie, 'srt_001'});
end

function dff_bin_fra = gen_dff_bin_fra(obj, fie_num)
dff_bin_fra = [];
for ani_num = 1:obj.n_ani
    disp(ani_num)
    rec_fun_i = str2func(['rec_fun.' convertStringsToChars(obj.ani(ani_num))]);
    sti = rec_fun_i();
    rec_fil = matfile(sti.fil_pat_rec);
    act_bin_fra = rec_fil.dff_bin_fra;
    dff_bin_fra = [dff_bin_fra; getfield(act_bin_fra, fie_num{:})];
end
end

function res_ani_bin = gen_res_ani_bin(obj, fie)
res_ani_bin.srt = cell(obj.n_ani, 1);
res_ani_bin.srt_010 = cell(obj.n_ani, 1);
res_ani_bin.srt_001 = cell(obj.n_ani, 1);
for ani_num = 1:obj.n_ani
    disp(ani_num)
    rec_fun_i = str2func(['rec_fun.' convertStringsToChars(obj.ani(ani_num))]);
    sti = rec_fun_i();
    rec_fil = matfile(sti.fil_pat_rec);
    res_bin = rec_fil.res_bin;
    res_ani_bin.srt{ani_num} = res_bin.(fie).srt;
    res_ani_bin.srt_010{ani_num} = res_bin.(fie).srt_010;
    res_ani_bin.srt_001{ani_num} = res_bin.(fie).srt_001;
end
end

function r_blo_ani = gen_r_blo_ani(obj, fie)
% for axo_onl
con_fil = matfile('\\home.ansatt.ntnu.no\kadiram\Documents\MATLAB\con_esp.mat');
n_blo = con_fil.n_blo;
n_blo = n_blo.tel;
r_blo_ani.dat.all = nan(n_blo, obj.n_ani);
r_blo_ani.dat.pos = nan(n_blo, obj.n_ani);
r_blo_ani.dat.neg = nan(n_blo, obj.n_ani);
%
r_blo_ani.shu.all = nan(n_blo, obj.n_ani);
r_blo_ani.shu.pos = nan(n_blo, obj.n_ani);
r_blo_ani.shu.neg = nan(n_blo, obj.n_ani);
for ani_num = 1:obj.n_ani
    disp(ani_num)
    rec_fun_i = str2func(['rec_fun.' convertStringsToChars(obj.ani(ani_num))]);
    sti = rec_fun_i();
    rec_fil = matfile(sti.fil_pat_rec);
    r_blo = rec_fil.r_blo;
    r_blo_ani.dat.all(:, ani_num) = r_blo.(fie).dat.all;
    r_blo_ani.dat.pos(:, ani_num) = r_blo.(fie).dat.pos;
    r_blo_ani.dat.neg(:, ani_num) = r_blo.(fie).dat.neg;
    %
    r_blo_ani.shu.all(:, ani_num) = r_blo.(fie).shu.all;
    r_blo_ani.shu.pos(:, ani_num) = r_blo.(fie).shu.pos;
    r_blo_ani.shu.neg(:, ani_num) = r_blo.(fie).shu.neg;
end
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% neural plotting
function plo_neu(cal_ima_ref_ani_row_col_con, dff_bou_ani_row_col, dff_ani_con_row_col, ...
    ani, sta_ani, col_sca, col_map, sta_ani_con, tit, stx_ani, bri_ani, tai_ani)
fig
n_ani = length(ani);
n_ani_lef = n_ani - sta_ani + 1;
n_row = 3;
n_sub_fig_max = 2; % half of the 'figure', 3 rows, 1 'column'.
n_sub_fig = min(ceil(n_ani_lef/n_row), n_sub_fig_max);
hax_sub = [];
for i = 1:n_sub_fig
    las = i == n_sub_fig;
    ind_sub_fig = i;
    hax_sub = plo_neu_sin(cal_ima_ref_ani_row_col_con, dff_bou_ani_row_col, ...
        dff_ani_con_row_col, ani, sta_ani, col_sca, col_map, stx_ani, tit, hax_sub, las, ...
        ind_sub_fig, sta_ani_con, bri_ani, tai_ani);
end
end

function hax_sub = plo_neu_sin(cal_ima_ref_ani_row_col_con, dff_bou_ani_row_col, ...
    dff_ani_con_row_col, ani, sta_ani, col_sca, col_map, stx_ani, tit, hax_sub, las, ...
    ind_sub_fig, sta_ani_con, bri_ani, tai_ani)
n_row = 3;
n_con = 4;
n_col = n_con + 1;
mar_bot = 0.000;
mar_top = 0.070;
if isempty(hax_sub)
    mar_lef = 0.000;
else
    mar_lef = hax_sub(4).Position(1) + hax_sub(4).Position(3) + 0.100;
end
mar_rig = 0.000;
gap_ver = 0.025;
gap_hor = 0.000;
asp_rat = 850/1536;
hax_sub = tight_subplot_ima(n_row, n_col, [gap_ver gap_hor], [mar_bot mar_top], ...
    [mar_lef mar_rig], asp_rat);
off = 0.060;
red = 0.01;
n_ani = length(ani);
con = {'Swim'};
global con_int
per = 30;
dis_ran = ext_dis_ran(per);
for i = 1:n_row
    ind_ani_i = sta_ani - 1 + (ind_sub_fig - 1)*n_row + i;
    if ind_ani_i <= n_ani
        for j = 1:n_col
            ind_sub_i_j = (i - 1)*n_col + j;
            axe_i_j = hax_sub(ind_sub_i_j);
            axes(axe_i_j)
            if j == 1
                ima_j = cal_ima_ref_ani_row_col_con{ind_ani_i}(:, :, 1);
                [~, n_col_ima] = size(ima_j);
                ima(axe_i_j, 1:n_col_ima, ima_j)
                xticks(axe_i_j, [])
                yticks(axe_i_j, [])
                caxis(dis_ran)
                colormap(axe_i_j, bone)
                if i == 1
                    h = title('Reference', 'FontWeight', 'normal');
                    pos_i_j = axe_i_j.Position;
                    h.Units = 'normalized';
                    h.Position(2) = pos_i_j(2) + pos_i_j(4) + off;
                end
                lef = axe_i_j.Position(1);
            elseif j == 2
                con_j = j - 1;
                if stx_ani(ind_ani_i) && tai_ani(ind_ani_i)
                    ima(axe_i_j, 1:n_col_ima, dff_bou_ani_row_col{ind_ani_i, con_j})
                    xticks(axe_i_j, [])
                    yticks(axe_i_j, [])
                    caxis(col_sca)
                    colormap(axe_i_j, col_map)
                    if i == 1
                        h = title(con{con_j}, 'FontWeight', 'normal');
                        h.Units = 'normalized';
                        pos_i_j = axe_i_j.Position;
                        h.Position(2) = pos_i_j(2) + pos_i_j(4) + off;
                    end
                end
            else
                con_j = j - 2;
                if sta_ani_con(ind_ani_i, con_j)
                    ima(axe_i_j, 1:n_col_ima, dff_ani_con_row_col{ind_ani_i, con_j})
                    xticks(axe_i_j, [])
                    yticks(axe_i_j, [])
                    caxis(col_sca)
                    colormap(axe_i_j, col_map)
                    if las && j == n_col
                        h_bar = colorbar;
                        pos_i_j = axe_i_j.Position;
                        h_bar.Position = [pos_i_j(1) + pos_i_j(3) + 0.005 ...
                            pos_i_j(2) + red 0.01 pos_i_j(4) - 2*red];
                        h_bar.Label.String = '\DeltaF/F (%)';
                    end
                    if i == 1
                        h = title(con_int{con_j}, 'FontWeight', 'normal');
                        h.Units = 'normalized';
                        pos_i_j = axe_i_j.Position;
                        h.Position(2) = pos_i_j(2) + pos_i_j(4) + off;
                    end
                end
            end
        end
        pos_i_j = axe_i_j.Position;
        if i == 1
            off_tit = 0.03;
        else
            off_tit = 0.01;
        end
        if bri_ani(ind_ani_i)
            sub_tit = [char(ani(ind_ani_i)) '\color{green} \surd'];
        else
            sub_tit = [char(ani(ind_ani_i)) '\color{red} \times'];
        end
        [~, h_tit] = suplabel(sub_tit, 't', [lef pos_i_j(2) ...
            (pos_i_j(1) + pos_i_j(3) - lef) pos_i_j(4) + off_tit]);
        set(h_tit)
        if las
            if i == 1
                pos_i_j_top = pos_i_j;
                off_tit_top = off_tit + 0.025;
            end
            if i == n_row || ind_ani_i == n_ani
                [~, h_tit] = suplabel([tit ...
                    sprintf(' %d - %d /%d', sta_ani, ind_ani_i, n_ani)], ...
                    't', [0 pos_i_j_top(2) (pos_i_j_top(1) + pos_i_j_top(3)) ...
                    pos_i_j_top(4) + off_tit_top]);
                set(h_tit)
            end
        end
    end
end
end

function plo_spo(cal_ima_ref_ani_row_col_con, dff_ani_con_row_col, ...
    ani, sta_ani, col_sca, col_map, sta_ani_con, tit, col_cod)
fig
n_sub_fig_max = 2;
n_ani = length(ani);
n_ani_lef = n_ani - sta_ani + 1;
n_row = 3;
n_sub_fig = min(ceil(n_ani_lef/n_row), n_sub_fig_max);
hax_sub = [];
for i = 1:n_sub_fig
    las = i == n_sub_fig;
    ind_sub_fig = i;
    hax_sub = plo_spo_sin(cal_ima_ref_ani_row_col_con, ...
        dff_ani_con_row_col, ani, sta_ani, col_sca, col_map, tit, hax_sub, las, ...
        ind_sub_fig, sta_ani_con, col_cod);
end
end

function hax_sub = plo_spo_sin(cal_ima_ref_ani_row_col_con, ...
    dff_ani_con_row_col, ani, sta_ani, col_sca, col_map, tit, hax_sub, las, ...
    ind_sub_fig, stx_ani, col_cod)
n_row = 3;
n_con = 4;
n_col = n_con + 1;
mar_bot = 0.000;
mar_top = 0.070;
if isempty(hax_sub)
    mar_lef = 0.000;
else
    mar_lef = hax_sub(4).Position(1) + hax_sub(4).Position(3) + 0.100;
end
mar_rig = 0.000;
gap_ver = 0.025;
gap_hor = 0.000;
asp_rat = 850/1536;
hax_sub = tight_subplot_ima(n_row, n_col, [gap_ver gap_hor], [mar_bot mar_top], ...
    [mar_lef mar_rig], asp_rat);
off = 0.060;
red = 0.01;
n_ani = length(ani);
bas = {'Baseline'};
global con_int
con = [bas; con_int];
for i = 1:n_row
    ind_ani_i = sta_ani - 1 + (ind_sub_fig - 1)*n_row + i;
    if ind_ani_i <= n_ani
        for j = 1:n_col
            ind_sub_i_j = (i - 1)*n_col + j;
            axe_i_j = hax_sub(ind_sub_i_j);
            axes(axe_i_j)
            if j == 1
                ima_dou = cal_ima_ref_ani_row_col_con{ind_ani_i}(:, :, 1);
                ima_eig = im2uint8(rescale(ima_dou));
                ima_j = imadjust(ima_eig);
                ima(ima_j)
                colormap(axe_i_j, bone)
                if i == 1
                    h = title('Reference', 'FontWeight', 'normal');
                    pos_i_j = axe_i_j.Position;
                    h.Units = 'normalized';
                    h.Position(2) = pos_i_j(2) + pos_i_j(4) + off;
                end
                lef = axe_i_j.Position(1);
            else
                con_j = j - 1;
                if stx_ani(ind_ani_i)
                    ima(dff_ani_con_row_col{ind_ani_i, con_j})
                    caxis(col_sca)
                    colormap(axe_i_j, col_map)
                    if las && j == n_col
                        h_bar = colorbar;
                        pos_i_j = axe_i_j.Position;
                        h_bar.Position = [pos_i_j(1) + pos_i_j(3) + 0.005 pos_i_j(2) + red 0.01 ...
                            pos_i_j(4) - 2*red];
                        h_bar.Label.String = col_cod;
                    end
                    if i == 1
                        h = title(con{con_j}, 'FontWeight', 'normal');
                        h.Units = 'normalized';
                        pos_i_j = axe_i_j.Position;
                        h.Position(2) = pos_i_j(2) + pos_i_j(4) + off;
                    end
                end
            end
        end
        pos_i_j = axe_i_j.Position;
        if i == 1
            off_tit = 0.03;
        else
            off_tit = 0.01;
        end
        [~, h_tit] = suplabel(ani(ind_ani_i), 't', [lef pos_i_j(2) ...
            (pos_i_j(1) + pos_i_j(3) - lef) pos_i_j(4) + off_tit]);
        set(h_tit)
        if las
            if i == 1
                pos_i_j_top = pos_i_j;
                off_tit_top = off_tit + 0.025;
            end
            if i == n_row || ind_ani_i == n_ani
                [~, h_tit] = suplabel([tit ...
                    sprintf(' %d - %d /%d', sta_ani, ind_ani_i, n_ani)], ...
                    't', [0 pos_i_j_top(2) (pos_i_j_top(1) + pos_i_j_top(3)) ...
                    pos_i_j_top(4) + off_tit_top]);
                set(h_tit)
            end
        end
    end
end
end
%
function plo_dff_com(brainRegion, num_win, ...
    act_rat_win_cel, dff_fix_win_fra_cel, dff_sli_win_fra_cel, dff_sum_win_fra_cel)
fig
n_row = 2;
n_col = 5;
gap_ver = 0.035;
gap_hor = 0.050;
mar_bot = 0.070;
mar_top = 0.070;
mar_lef = 0.015;
mar_rig = 0.001;
hax_sub = tight_subplot(n_row, n_col, [gap_ver gap_hor], [mar_bot mar_top], [mar_lef mar_rig]);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
n_met = 3;
sca_bar_neu = 100;
global tim_win_fra
global col_sca_ste
linkaxes(hax_sub([6, 7, 8]))
tit_met = ["Fixed"; "Sliding"; "Sumbre"];
c = @cmu.colors;
y_min = inf;
y_max = -inf;
for i = 1:n_met
    hax = hax_sub(i);
    axes(hax)
    if i == 1
        dff_win_fra_cel = dff_fix_win_fra_cel;
    elseif i == 2
        dff_win_fra_cel = dff_sli_win_fra_cel;
    else
        dff_win_fra_cel = dff_sum_win_fra_cel;
    end
    dff_fra_cel = dff_win_fra_cel{num_win};
    dff_cel_fra = sor_mat_asc(act_rat_win_cel{num_win}, dff_fra_cel);
    ima(dff_cel_fra)
    caxis(col_sca_ste)
    colormap(jet)
    if i == n_met
        h_bar = colorbar;
        h_bar.Position(1) = (105/100)*h_bar.Position(1);
        h_bar.Label.String = '\DeltaF/F (%)';
    end
    title(tit_met(i), 'FontWeight', 'normal')
    [~, ~, h] = add_ver_sca_bar_top(hax, sca_bar_neu, 'k');
    if i == 1
        nor_x = -0.200;
        nor_y = 0.780;
        tx = text(nor_x, nor_y, 'Neurons', 'Units', 'normalized');
        set(tx,'Rotation',90);
    end
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    hax_tra = hax_sub(n_col + i);
    axes(hax_tra)
    %
    [n_cel, n_fra] = size(dff_cel_fra);
    %
    ind_cel_i = round(n_cel/2);
    plot(tim_win_fra, dff_cel_fra(ind_cel_i, :), 'Color', c('ash grey'))
    [y_min, y_max, hax_tra] = adj_y(hax_tra, y_min, y_max);
    %
    set(hax_tra, 'xcolor', 'w', 'ycolor', 'w')
    box off
end
axes('Position', hax_sub(n_col + 1).Position, 'XColor', 'w', 'YColor', 'w', 'Color', 'none', ...
    'XTick', [], 'YTick', [], 'XTickLabel', [], 'YTickLabel', []);
sca_bar = 10;
add_ver_sca_bar(hax_sub(n_col + 1), sca_bar, 'k');
%
axes('Position', hax_sub(n_col + 1).Position, 'XColor', 'w', 'YColor', 'w', ...
    'Color', 'none', 'XTick', [], 'YTick', [], 'XTickLabel', [], 'YTickLabel', []);
bas_dur = 30;
nor_y_bar_bel = 0.7*mar_bot;
add_hor_sca_bar_bel(hax_sub(n_col + 1), bas_dur, 'k', nor_y_bar_bel);
nor_x = 0.05;
nor_y = -0.7;
tx = text(nor_x, nor_y, '30 s', 'units', 'normalized');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
ent(mar_lef, mar_rig, brainRegion)
end

function plo_dff_deb(num_win, act_rat_win_cel, f_fra_cel, dff_fra_cel, dff_dow_fra_cel)
fig
n_row = 3;
n_col = 1;
gap_ver = 0.035;
gap_hor = 0.050;
mar_bot = 0.070;
mar_top = 0.070;
mar_lef = 0.035;
mar_rig = 0.015;
hax_sub = tight_subplot(n_row, n_col, [gap_ver gap_hor], [mar_bot mar_top], [mar_lef mar_rig]);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
axes(hax_sub(1))
global tim_cal_fra
f_cel_fra = sor_mat_asc(act_rat_win_cel{num_win}, f_fra_cel);
n_cel = size(f_cel_fra, 1);
ind_cel = round(n_cel/2);
plot(tim_cal_fra, f_cel_fra(ind_cel, :))
box off
%
linkaxes(hax_sub([2 3]), 'y')
y_min = inf;
y_max = -inf;
hax_tra = hax_sub(2);
axes(hax_sub(2))
dff_cel_fra = sor_mat_asc(act_rat_win_cel{num_win}, dff_fra_cel);
plot(tim_cal_fra, dff_cel_fra(ind_cel, :))
[y_min, y_max, hax_tra] = adj_y(hax_tra, y_min, y_max);
box off
%
hax_tra = hax_sub(3);
axes(hax_sub(3))
global tim_cal_dow_fra
dff_dow_cel_fra = sor_mat_asc(act_rat_win_cel{num_win}, dff_dow_fra_cel);
plot(tim_cal_dow_fra, dff_dow_cel_fra(ind_cel, :))
[y_min, y_max, hax_tra] = adj_y(hax_tra, y_min, y_max);
box off
end
%
function plo_neu_cel(cal_ima_ref_ani_row_col_con, dff_bou_ani_row_col, dff_ani_con_row_col, ...
    ani, sta_ani, col_sca, col_map, sta_ani_con, tit, stx_ani, sta_det_ani)
fig
n_ani_lef = sum(sta_det_ani(sta_ani:end));
n_row = 3;
n_sub_fig_max = 2; % half of the 'figure', 3 rows, 1 'column'.
n_sub_fig = min(ceil(n_ani_lef/n_row), n_sub_fig_max);
hax_sub = [];
for i = 1:n_sub_fig
    las = i == n_sub_fig;
    ind_sub_fig = i;
    hax_sub = plo_neu_cel_sin(cal_ima_ref_ani_row_col_con, dff_bou_ani_row_col, ...
        dff_ani_con_row_col, ani, sta_ani, col_sca, col_map, stx_ani, tit, hax_sub, las, ...
        ind_sub_fig, sta_ani_con, sta_det_ani);
end
end

function hax_sub = plo_neu_cel_sin(cal_ima_ref_ani_row_col_con, dff_bou_ani_row_col, ...
    dff_ani_con_row_col, ani, sta_ani, col_sca, col_map, stx_ani, tit, hax_sub, las, ...
    ind_sub_fig, sta_ani_con, sta_det_ani)
n_row = 3;
n_con = 4;
n_col = n_con + 1;
mar_bot = 0.000;
mar_top = 0.070;
if isempty(hax_sub)
    mar_lef = 0.000;
else
    mar_lef = hax_sub(4).Position(1) + hax_sub(4).Position(3) + 0.100;
end
mar_rig = 0.000;
gap_ver = 0.025;
gap_hor = 0.000;
asp_rat = 850/1536;
hax_sub = tight_subplot_ima(n_row, n_col, [gap_ver gap_hor], [mar_bot mar_top], ...
    [mar_lef mar_rig], asp_rat);
off = 0.060;
red = 0.01;
n_ani = length(ani);
con = {'Swim'};
global con_int
n_ani_fig_max = 6;
cum_sum_sta_det_ani = cumsum(sta_det_ani);
for i = 1:n_row
    ind_ani_i = find(cum_sum_sta_det_ani == floor(sta_ani/n_ani_fig_max)*n_ani_fig_max + ...
        (ind_sub_fig - 1)*n_row + i, 1);
    if ind_ani_i <= n_ani
        for j = 1:n_col
            ind_sub_i_j = (i - 1)*n_col + j;
            axe_i_j = hax_sub(ind_sub_i_j);
            axes(axe_i_j)
            if j == 1
                ima_dou = cal_ima_ref_ani_row_col_con{ind_ani_i}(:, :, 1);
                ima_eig = im2uint8(rescale(ima_dou));
                ima_j = imadjust(ima_eig);
                ima(ima_j)
                colormap(axe_i_j, bone)
                if i == 1
                    h = title('Reference', 'FontWeight', 'normal');
                    pos_i_j = axe_i_j.Position;
                    h.Units = 'normalized';
                    h.Position(2) = pos_i_j(2) + pos_i_j(4) + off;
                end
                lef = axe_i_j.Position(1);
            elseif j == 2
                con_j = j - 1;
                if stx_ani(ind_ani_i)
                    ima(dff_bou_ani_row_col{ind_ani_i, con_j})
                    caxis(col_sca)
                    colormap(axe_i_j, col_map)
                    if i == 1
                        h = title(con{con_j}, 'FontWeight', 'normal');
                        h.Units = 'normalized';
                        pos_i_j = axe_i_j.Position;
                        h.Position(2) = pos_i_j(2) + pos_i_j(4) + off;
                    end
                end
            else
                con_j = j - 2;
                if sta_ani_con(ind_ani_i, con_j)
                    ima(dff_ani_con_row_col{ind_ani_i, con_j})
                    caxis(col_sca)
                    colormap(axe_i_j, col_map)
                    if las && j == n_col
                        h_bar = colorbar;
                        pos_i_j = axe_i_j.Position;
                        h_bar.Position = [pos_i_j(1) + pos_i_j(3) + 0.005 pos_i_j(2) + red 0.01 ...
                            pos_i_j(4) - 2*red];
                        h_bar.Label.String = '\DeltaF/F (%)';
                    end
                    if i == 1
                        h = title(con_int{con_j}, 'FontWeight', 'normal');
                        h.Units = 'normalized';
                        pos_i_j = axe_i_j.Position;
                        h.Position(2) = pos_i_j(2) + pos_i_j(4) + off;
                    end
                end
            end
        end
        pos_i_j = axe_i_j.Position;
        if i == 1
            off_tit = 0.03;
        else
            off_tit = 0.01;
        end
        [~, h_tit] = suplabel(ani(ind_ani_i), 't', [lef pos_i_j(2) ...
            (pos_i_j(1) + pos_i_j(3) - lef) pos_i_j(4) + off_tit]);
        set(h_tit)
        if las
            if i == 1
                pos_i_j_top = pos_i_j;
                off_tit_top = off_tit + 0.025;
            end
            if i == n_row || ind_ani_i == n_ani
                [~, h_tit] = suplabel(tit, ...
                    't', [0 pos_i_j_top(2) (pos_i_j_top(1) + pos_i_j_top(3)) ...
                    pos_i_j_top(4) + off_tit_top]);
                set(h_tit)
            end
%             if i == n_row || ind_ani_i == n_ani
%                 [~, h_tit] = suplabel([tit ...% min(ind_ani_i, n_ani) 
%                     sprintf(' %d - %d /%d', sta_ani, ind_ani_i, n_ani)], ...
%                     't', [0 pos_i_j_top(2) (pos_i_j_top(1) + pos_i_j_top(3)) ...
%                     pos_i_j_top(4) + off_tit_top]);
%                 set(h_tit)
%             end
        end
    end
end
end

function plo_neu_ext(n_con, cal_ima_ref_ani_row_col_con, dff_ani_con_row_col, ani, n_ani, ...
    col_sca, col_map, n_ani_obj, sta_ani_con)
n_row = n_ani/2;
n_col = n_con + 1;
fig
mar_bot = 0.000;
mar_top = 0.045;
mar_lef = 0.000;
mar_rig = 0.000;
gap_ver = 0.025;
gap_hor = 0.000;
asp_rat = 850/1536;
hax_sub = tight_subplot_ima(n_row, n_col, [gap_ver gap_hor], [mar_bot mar_top], [mar_lef mar_rig], asp_rat);
off = 0.051;
global con_int
for i = 1:n_row
    ind_ext_i = n_ani + i;
    ima_dou = cal_ima_ref_ani_row_col_con{ind_ext_i}(:, :, 1);
    if ~isempty(ima_dou)
        for j = 1:n_col
            ind_sub_i_j = (i - 1)*n_col + j;
            axe_i_j = hax_sub(ind_sub_i_j);
            axes(axe_i_j)
            if j == 1
                ima_eig = im2uint8(rescale(ima_dou));
                ima_j = imadjust(ima_eig); % adjusted !
                ima(ima_j)
                colormap(axe_i_j, bone)
                if i == 1
                    h = title('Reference', 'FontWeight', 'normal');
                    pos_i_j = axe_i_j.Position;
                    h.Units = 'normalized';
                    h.Position(2) = pos_i_j(2) + pos_i_j(4) + off;
                end
                lef = axe_i_j.Position(1);
            else
                con_j = j - 1;
                if sta_ani_con(ind_ext_i, con_j)
                    ima(dff_ani_con_row_col{ind_ext_i, con_j})
                    caxis(col_sca)
                    colormap(axe_i_j, col_map)
                    if i == 1
                        h = title(con_int{con_j}, 'FontWeight', 'normal');
                        h.Units = 'normalized';
                        pos_i_j = axe_i_j.Position;
                        h.Position(2) = pos_i_j(2) + pos_i_j(4) + off;
                    end
                end
            end
        end
        pos_i_j = axe_i_j.Position;
        if i == 1
            off_tit = 0.03;
        else
            off_tit = 0.01;
        end
        [~, h_tit] = suplabel(ani(ind_ext_i), 't', [lef pos_i_j(2) (pos_i_j(1) + pos_i_j(3) - lef) pos_i_j(4) + off_tit]);
        set(h_tit)
    end
end
%
mar_bot = 0.000;
mar_top = 0.045;
mar_lef = hax_sub(4).Position(1) + hax_sub(4).Position(3) + 0.010;
mar_rig = 0.000;
gap_ver = 0.025;
gap_hor = 0.000;
asp_rat = 850/1536;
hax_sub = tight_subplot_ima(n_row, n_col, [gap_ver gap_hor], [mar_bot mar_top], [mar_lef mar_rig], asp_rat);
red = 0.01;
for i = 1:n_row
    ind_ima_i = n_ani + n_row + i;
    if ind_ima_i <= n_ani_obj
        ima_dou = cal_ima_ref_ani_row_col_con{ind_ima_i}(:, :, 1);
        if ~isempty(ima_dou)
            for j = 1:n_col
                ind_sub_i_j = (i - 1)*n_col + j;
                axe_i_j = hax_sub(ind_sub_i_j);
                axes(axe_i_j)
                if j == 1
                    ima_eig = im2uint8(rescale(ima_dou));
                    ima_j = imadjust(ima_eig);
                    ima(ima_j)
                    colormap(axe_i_j, bone)
                    if i == 1
                        h = title('Reference', 'FontWeight', 'normal');
                        pos_i_j = axe_i_j.Position;
                        h.Units = 'normalized';
                        h.Position(2) = pos_i_j(2) + pos_i_j(4) + off;
                    end
                    lef = axe_i_j.Position(1);
                else
                    con_j = j - 1;
                    if sta_ani_con(ind_ima_i, con_j)
                        ima(dff_ani_con_row_col{ind_ima_i, con_j})
                        caxis(col_sca)
                        colormap(axe_i_j, col_map)
                        if j == n_col
                            h_bar = colorbar;
                            pos_i_j = axe_i_j.Position;
                            h_bar.Position = [pos_i_j(1) + pos_i_j(3) + 0.005 pos_i_j(2) + red 0.01 pos_i_j(4) - 2*red];
                            h_bar.Label.String = '\DeltaF/F (%)';
                        end
                        if i == 1
                            h = title(con_int{con_j}, 'FontWeight', 'normal');
                            h.Units = 'normalized';
                            pos_i_j = axe_i_j.Position;
                            h.Position(2) = pos_i_j(2) + pos_i_j(4) + off;
                        end
                    end
                end
            end
            pos_i_j = axe_i_j.Position;
            if i == 1
                off_tit = 0.03;
            else
                off_tit = 0.01;
            end
            [~, h_tit] = suplabel(ani(ind_ima_i), 't', [lef pos_i_j(2) (pos_i_j(1) + pos_i_j(3) - lef) pos_i_j(4) + off_tit]);
            set(h_tit)
        end
    end
end
end

function plo_neu_sig(n_con, cal_ima_ref_ani_row_col_con, tim_tri_fra, dff_ani_con_fra_cel, ...
    ani, n_ani, col_sca, col_map, res_dur_neu)
n_row = n_ani/2;
n_col = n_con + 1;
fig
mar_bot = 0.000;
mar_top = 0.045;
mar_lef = 0.000;
mar_rig = 0.000;
gap_ver = 0.025;
gap_hor = 0.000;
asp_rat = 850/1536;
hax_sub = tight_subplot_ima(n_row, n_col, [gap_ver gap_hor], [mar_bot mar_top], ...
    [mar_lef mar_rig], asp_rat);
off = 0.051;
global con_int
global lin_wid
sti_poi = 0;
sti_col = 'violet';
for i = 1:n_row
    for j = 1:n_col
        ind_sub_i_j = (i - 1)*n_col + j;
        axe_i_j = hax_sub(ind_sub_i_j);
        axes(axe_i_j)
        if j == 1
            ima_dou = cal_ima_ref_ani_row_col_con{i}(:, :, 1);
            ima_eig = im2uint8(rescale(ima_dou));
            ima_j = imadjust(ima_eig); % adjusted !
            ima(ima_j)
            colormap(axe_i_j, bone)
            if i == 1
                h = title('Reference', 'FontWeight', 'normal');
                pos_i_j = axe_i_j.Position;
                h.Units = 'normalized';
                h.Position(2) = pos_i_j(2) + pos_i_j(4) + off;
            end
            lef = axe_i_j.Position(1);
        else
            con_j = j - 1;
            dff_i_j_cel_fra = dff_ani_con_fra_cel{i, con_j}';
            if ~isempty(dff_i_j_cel_fra)
                dff_ima_i_j_cel_fra = sor_mat(tim_tri_fra, dff_i_j_cel_fra', res_dur_neu);
                n_cel_i_j = size(dff_i_j_cel_fra, 1);
                imagesc(tim_tri_fra, 1:n_cel_i_j, smo_ima(dff_ima_i_j_cel_fra))
                caxis(col_sca)
                colormap(axe_i_j, col_map)
                set(axe_i_j, 'ytick', [], 'yticklabel', [], 'xtick', [], 'xticklabel', [])
                h = plo_ver_lin(sti_poi, axe_i_j, sti_col, lin_wid);
            end
            if i == 1
                h = title(con_int{con_j}, 'FontWeight', 'normal');
                h.Units = 'normalized';
                pos_i_j = axe_i_j.Position;
                h.Position(2) = pos_i_j(2) + pos_i_j(4) + off;
                if j == 2
                    hold on
                    axes('Position', axe_i_j.Position, 'XColor', 'w', ...
                        'YColor', 'w', 'Color', 'none', 'XTick', [], 'YTick', [], ...
                        'XTickLabel', [], 'YTickLabel', []);
                    nor_y = 0.65;
                    add_hor_sca_bar_bel(axe_i_j, 2, 'k', nor_y);
                    nor_x = 0.05;
                    nor_y = -0.7;
                    text(nor_x, nor_y, '2s', 'units', 'normalized');
                end
            end
        end
    end
    pos_i_j = axe_i_j.Position;
    if i == 1
        off_tit = 0.03;
    else
        off_tit = 0.01;
    end
    [~, h_tit] = suplabel(ani(i), 't', [lef pos_i_j(2) (pos_i_j(1) + pos_i_j(3) - lef) ...
        pos_i_j(4) + off_tit]);
    set(h_tit)
end
% should be for the animals in the second column.
mar_bot = 0.000;
mar_top = 0.045;
mar_lef = hax_sub(4).Position(1) + hax_sub(4).Position(3) + 0.010;
mar_rig = 0.000;
gap_ver = 0.025;
gap_hor = 0.000;
asp_rat = 850/1536;
hax_sub = tight_subplot_ima(n_row, n_col, [gap_ver gap_hor], [mar_bot mar_top], ...
    [mar_lef mar_rig], asp_rat);
red = 0.01;
for i = 1:n_row
    for j = 1:n_col
        ind_sub_i_j = (i - 1)*n_col + j;
        axe_i_j = hax_sub(ind_sub_i_j);
        axes(axe_i_j)
        ind_ima_i = n_row + i;
        if j == 1
            ima_dou = cal_ima_ref_ani_row_col_con{ind_ima_i}(:, :, 1);
            ima_eig = im2uint8(rescale(ima_dou));
            ima_j = imadjust(ima_eig);
            ima(ima_j)
            colormap(axe_i_j, bone)
            if i == 1
                h = title('Reference', 'FontWeight', 'normal');
                pos_i_j = axe_i_j.Position;
                h.Units = 'normalized';
                h.Position(2) = pos_i_j(2) + pos_i_j(4) + off;
            end
            lef = axe_i_j.Position(1);
        else
            con_j = j - 1;
            dff_i_j_cel_fra = dff_ani_con_fra_cel{ind_ima_i, con_j}';
            if ~isempty(dff_i_j_cel_fra)
                dff_ima_i_j_cel_fra = sor_mat(tim_tri_fra, dff_i_j_cel_fra', res_dur_neu);
                n_cel_i_j = size(dff_i_j_cel_fra, 1);
                imagesc(tim_tri_fra, 1:n_cel_i_j, smo_ima(dff_ima_i_j_cel_fra))
                caxis(col_sca)
                colormap(axe_i_j, col_map)
                set(axe_i_j, 'ytick', [], 'yticklabel', [], 'xtick', [], 'xticklabel', [])
                h = plo_ver_lin(sti_poi, axe_i_j, sti_col, lin_wid);
                if j == n_col
                    h_bar = colorbar;
                    pos_i_j = axe_i_j.Position;
                    h_bar.Position = [pos_i_j(1) + pos_i_j(3) + 0.005 pos_i_j(2) + red 0.01 pos_i_j(4) - 2*red];
                    h_bar.Label.String = '\DeltaF/F (%)';
                end
            end
            if i == 1
                h = title(con_int{con_j}, 'FontWeight', 'normal');
                h.Units = 'normalized';
                pos_i_j = axe_i_j.Position;
                h.Position(2) = pos_i_j(2) + pos_i_j(4) + off;
            end
        end
    end
    pos_i_j = axe_i_j.Position;
    if i == 1
        off_tit = 0.03;
    else
        off_tit = 0.01;
    end
    [~, h_tit] = suplabel(ani(ind_ima_i), 't', [lef pos_i_j(2) (pos_i_j(1) + pos_i_j(3) - lef) pos_i_j(4) + off_tit]);
    set(h_tit)
end
end

function plo_neu_sig_ext(n_con, cal_ima_ref_ani_row_col_con, tim_tri_fra, ...
    dff_ani_con_fra_cel, ani, n_ani, col_sca, col_map, res_dur_neu, n_ani_obj)
n_row = n_ani/2;
n_col = n_con + 1;
fig
mar_bot = 0.000;
mar_top = 0.045;
mar_lef = 0.000;
mar_rig = 0.000;
gap_ver = 0.025;
gap_hor = 0.000;
asp_rat = 850/1536;
hax_sub = tight_subplot_ima(n_row, n_col, [gap_ver gap_hor], [mar_bot mar_top], [mar_lef mar_rig], asp_rat);
off = 0.051;
global con_int
global lin_wid
sti_poi = 0;
sti_col = 'violet';
for i = 1:n_row
    ind_ext_i = n_ani + i;
    if ind_ext_i <= n_ani_obj
        for j = 1:n_col
            ind_sub_i_j = (i - 1)*n_col + j;
            axe_i_j = hax_sub(ind_sub_i_j);
            axes(axe_i_j)
            if j == 1
                ima_dou = cal_ima_ref_ani_row_col_con{ind_ext_i}(:, :, 1);
                ima_eig = im2uint8(rescale(ima_dou));
                ima_j = imadjust(ima_eig); % adjusted !
                ima(ima_j)
                colormap(axe_i_j, bone)
                if i == 1
                    h = title('Reference', 'FontWeight', 'normal');
                    pos_i_j = axe_i_j.Position;
                    h.Units = 'normalized';
                    h.Position(2) = pos_i_j(2) + pos_i_j(4) + off;
                end
                lef = axe_i_j.Position(1);
            else
                con_j = j - 1;
                dff_i_j_cel_fra = dff_ani_con_fra_cel{ind_ext_i, con_j}';
                if ~isempty(dff_i_j_cel_fra)
                    dff_ima_i_j_cel_fra = sor_mat(tim_tri_fra, dff_i_j_cel_fra', res_dur_neu);
                    n_cel_i_j = size(dff_i_j_cel_fra, 1);
                    imagesc(tim_tri_fra, 1:n_cel_i_j, smo_ima(dff_ima_i_j_cel_fra))
                    caxis(col_sca)
                    colormap(axe_i_j, col_map)
                    set(axe_i_j, 'ytick', [], 'yticklabel', [], 'xtick', [], 'xticklabel', [])
                    h = plo_ver_lin(sti_poi, axe_i_j, sti_col, lin_wid);
                end
                if i == 1
                    h = title(con_int{con_j}, 'FontWeight', 'normal');
                    h.Units = 'normalized';
                    pos_i_j = axe_i_j.Position;
                    h.Position(2) = pos_i_j(2) + pos_i_j(4) + off;
                end
            end
        end
        pos_i_j = axe_i_j.Position;
        if i == 1
            off_tit = 0.03;
        else
            off_tit = 0.01;
        end
        [~, h_tit] = suplabel(ani(ind_ext_i), 't', [lef pos_i_j(2) (pos_i_j(1) + pos_i_j(3) - lef) pos_i_j(4) + off_tit]);
        set(h_tit)
    end
end
%
mar_bot = 0.000;
mar_top = 0.045;
mar_lef = hax_sub(4).Position(1) + hax_sub(4).Position(3) + 0.010;
mar_rig = 0.000;
gap_ver = 0.025;
gap_hor = 0.000;
asp_rat = 850/1536;
hax_sub = tight_subplot_ima(n_row, n_col, [gap_ver gap_hor], [mar_bot mar_top], [mar_lef mar_rig], asp_rat);
red = 0.01;
for i = 1:n_row
    ind_ima_i = n_ani + n_row + i;
    if ind_ima_i <= n_ani_obj
        for j = 1:n_col
            ind_sub_i_j = (i - 1)*n_col + j;
            axe_i_j = hax_sub(ind_sub_i_j);
            axes(axe_i_j)
            if j == 1
                ima_dou = cal_ima_ref_ani_row_col_con{ind_ima_i}(:, :, 1);
                ima_eig = im2uint8(rescale(ima_dou));
                ima_j = imadjust(ima_eig);
                ima(ima_j)
                colormap(axe_i_j, bone)
                if i == 1
                    h = title('Reference', 'FontWeight', 'normal');
                    pos_i_j = axe_i_j.Position;
                    h.Units = 'normalized';
                    h.Position(2) = pos_i_j(2) + pos_i_j(4) + off;
                end
                lef = axe_i_j.Position(1);
            else
                con_j = j - 1;
                dff_i_j_cel_fra = dff_ani_con_fra_cel{ind_ima_i, con_j}';
                if ~isempty(dff_i_j_cel_fra)
                    dff_ima_i_j_cel_fra = sor_mat(tim_tri_fra, dff_i_j_cel_fra', res_dur_neu);
                    n_cel_i_j = size(dff_i_j_cel_fra, 1);
                    imagesc(tim_tri_fra, 1:n_cel_i_j, smo_ima(dff_ima_i_j_cel_fra))
                    caxis(col_sca)
                    colormap(axe_i_j, col_map)
                    set(axe_i_j, 'ytick', [], 'yticklabel', [], 'xtick', [], 'xticklabel', [])
                    h = plo_ver_lin(sti_poi, axe_i_j, sti_col, lin_wid);
                    if j == n_col
                        h_bar = colorbar;
                        pos_i_j = axe_i_j.Position;
                        h_bar.Position = [pos_i_j(1) + pos_i_j(3) + 0.005 pos_i_j(2) + red 0.01 pos_i_j(4) - 2*red];
                        h_bar.Label.String = '\DeltaF/F (%)';
                    end
                end
                if i == 1
                    h = title(con_int{con_j}, 'FontWeight', 'normal');
                    h.Units = 'normalized';
                    pos_i_j = axe_i_j.Position;
                    h.Position(2) = pos_i_j(2) + pos_i_j(4) + off;
                end
            end
        end
        pos_i_j = axe_i_j.Position;
        if i == 1
            off_tit = 0.03;
        else
            off_tit = 0.01;
        end
        [~, h_tit] = suplabel(ani(ind_ima_i), 't', [lef pos_i_j(2) (pos_i_j(1) + pos_i_j(3) - lef) pos_i_j(4) + off_tit]);
        set(h_tit)
    end
end
end

function plo_tap_cor(pcc_ani_con, ani, str, n_ani)
[~, n_con] = size(pcc_ani_con);
n_row = n_ani/2;
n_col = n_con;
fig
mar_bot = 0.035;
mar_top = 0.090;
mar_lef = 0.022;
gap_ver = 0.030;
mar_rig = 0.000;
gap_hor = 0.000;
asp_rat = 1;
hax_sub = tight_subplot_ima(n_row, n_col, [gap_ver gap_hor], [mar_bot mar_top], [mar_lef mar_rig], asp_rat);
global con_int
off = mar_top + 0.010;
n_tri_con = size(pcc_ani_con{1, 1}, 1);
lab = strings(n_tri_con, 1);
for i = 1:n_tri_con
    lab(i) = convertCharsToStrings(sprintf('T%d', i));
end
col_sca = [0.2 0.8];
off_tit_mid = 0.013;
for i = 1:n_row
    for j = 1:n_col
        ind_sub_i_j = (i - 1)*n_col + j;
        axe_i_j = hax_sub(ind_sub_i_j);
        axes(axe_i_j)
        %
        ima(pcc_ani_con{i, j})
        caxis(col_sca)
        if j == 1
            lef = axe_i_j.Position(1);
            yticks(1:n_tri_con)
            axe_i_j.YAxis.TickLength = [0 0];
            yticklabels(lab)
        end
        %
        if i == 1
            h = title(con_int{j}, 'FontWeight', 'normal');
            h.Units = 'normalized';
            pos_i_j = axe_i_j.Position;
            h.Position(2) = pos_i_j(2) + pos_i_j(4) + off;
        elseif i == n_row
            xticks(1:n_tri_con)
            axe_i_j.XAxis.TickLength = [0 0];
            xticklabels(lab)
        end
    end
    pos_i_j = axe_i_j.Position;
    if i == 1
        off_tit = 0.035;
    else
        off_tit = off_tit_mid;
    end
    [~, h_tit] = suplabel([char(ani(i)) ' ' str], 't', [lef pos_i_j(2) (pos_i_j(1) + pos_i_j(3) - lef) pos_i_j(4) + off_tit]);
    set(h_tit)
end
%
mar_lef = hax_sub(n_col).Position(1) + hax_sub(n_col).Position(3) + 0.010;
hax_sub = tight_subplot_ima(n_row, n_col, [gap_ver gap_hor], [mar_bot mar_top], [mar_lef mar_rig], asp_rat);
red = 0.01;
for i = 1:n_row
    for j = 1:n_col
        ind_sub_i_j = (i - 1)*n_col + j;
        axe_i_j = hax_sub(ind_sub_i_j);
        axes(axe_i_j)
        %
        ind_ima_i = n_row + i;
        ima(pcc_ani_con{ind_ima_i, j})
        caxis(col_sca)
        if j == 1
            lef = axe_i_j.Position(1);
        end
        if j == n_col
            h_bar = colorbar;
            pos_i_j = axe_i_j.Position;
            h_bar.Position = [pos_i_j(1) + pos_i_j(3) + 0.005 pos_i_j(2) + red 0.01 pos_i_j(4) - 2*red];
            h_bar.Label.String = 'PCC';
        end
        %
        if i == 1
            h = title(con_int{j}, 'FontWeight', 'normal');
            h.Units = 'normalized';
            pos_i_j = axe_i_j.Position;
            h.Position(2) = pos_i_j(2) + pos_i_j(4) + off;
        elseif i == n_row
            xticks(1:n_tri_con)
            axe_i_j.XAxis.TickLength = [0 0];
            xticklabels(lab)
        end
    end
    pos_i_j = axe_i_j.Position;
    if i == 1
        off_tit = 0.035;
    else
        off_tit = off_tit_mid;
    end
    [~, h_tit] = suplabel([char(ani(ind_ima_i)) ' ' str], 't', [lef pos_i_j(2) (pos_i_j(1) + pos_i_j(3) - lef) pos_i_j(4) + off_tit]);
    set(h_tit)
end
colormap(jet)
end

function plo_tap_cor_ext(pcc_ani_con, ani, str, n_ani, n_ani_obj)
[~, n_con] = size(pcc_ani_con);
n_row = n_ani/2;
n_col = n_con;
fig
mar_bot = 0.035;
mar_top = 0.090;
mar_lef = 0.022;
gap_ver = 0.030;
mar_rig = 0.000;
gap_hor = 0.000;
asp_rat = 1;
hax_sub = tight_subplot_ima(n_row, n_col, [gap_ver gap_hor], [mar_bot mar_top], [mar_lef mar_rig], asp_rat);
global con_int
off = mar_top + 0.010;
n_tri_con = size(pcc_ani_con{1, 1}, 1);
lab = strings(n_tri_con, 1);
for i = 1:n_tri_con
    lab(i) = convertCharsToStrings(sprintf('T%d', i));
end
col_sca = [0.2 0.8];
off_tit_mid = 0.013;
for i = 1:n_row
    ind_ext_i = n_ani + i;
    if ind_ext_i <= n_ani_obj
        for j = 1:n_col
            ind_sub_i_j = (i - 1)*n_col + j;
            axe_i_j = hax_sub(ind_sub_i_j);
            axes(axe_i_j)
            %
            ima(pcc_ani_con{ind_ext_i, j})
            caxis(col_sca)
            if j == 1
                lef = axe_i_j.Position(1);
                yticks(1:n_tri_con)
                axe_i_j.YAxis.TickLength = [0 0];
                yticklabels(lab)
            end
            %
            if i == 1
                h = title(con_int{j}, 'FontWeight', 'normal');
                h.Units = 'normalized';
                pos_i_j = axe_i_j.Position;
                h.Position(2) = pos_i_j(2) + pos_i_j(4) + off;
            elseif i == n_row
                xticks(1:n_tri_con)
                axe_i_j.XAxis.TickLength = [0 0];
                xticklabels(lab)
            end
        end
        pos_i_j = axe_i_j.Position;
        if i == 1
            off_tit = 0.035;
        else
            off_tit = off_tit_mid;
        end
        [~, h_tit] = suplabel([char(ani(ind_ext_i)) ' ' str], 't', [lef pos_i_j(2) (pos_i_j(1) + pos_i_j(3) - lef) pos_i_j(4) + off_tit]);
        set(h_tit)
    end
end
%
mar_lef = hax_sub(n_col).Position(1) + hax_sub(n_col).Position(3) + 0.010;
hax_sub = tight_subplot_ima(n_row, n_col, [gap_ver gap_hor], [mar_bot mar_top], [mar_lef mar_rig], asp_rat);
red = 0.01;
for i = 1:n_row
    ind_ima_i = n_ani + n_row + i;
    if ind_ima_i <= n_ani_obj
        for j = 1:n_col
            ind_sub_i_j = (i - 1)*n_col + j;
            axe_i_j = hax_sub(ind_sub_i_j);
            axes(axe_i_j)
            %
            ima(pcc_ani_con{ind_ima_i, j})
            caxis(col_sca)
            if j == 1
                lef = axe_i_j.Position(1);
            end
            if j == n_col
                h_bar = colorbar;
                pos_i_j = axe_i_j.Position;
                h_bar.Position = [pos_i_j(1) + pos_i_j(3) + 0.005 pos_i_j(2) + red 0.01 pos_i_j(4) - 2*red];
                h_bar.Label.String = 'PCC';
            end
            %
            if i == 1
                h = title(con_int{j}, 'FontWeight', 'normal');
                h.Units = 'normalized';
                pos_i_j = axe_i_j.Position;
                h.Position(2) = pos_i_j(2) + pos_i_j(4) + off;
            elseif i == n_row
                xticks(1:n_tri_con)
                axe_i_j.XAxis.TickLength = [0 0];
                xticklabels(lab)
            end
        end
        pos_i_j = axe_i_j.Position;
        if i == 1
            off_tit = 0.035;
        else
            off_tit = off_tit_mid;
        end
        [~, h_tit] = suplabel([char(ani(ind_ima_i)) ' ' str], 't', [lef pos_i_j(2) (pos_i_j(1) + pos_i_j(3) - lef) pos_i_j(4) + off_tit]);
        set(h_tit)
    end
end
colormap(jet)
end

function plo_spo_cor(cen_sub_ani_cel_dim, cor_coe_ani_reg_cel_cel, bri_ani, ani, tit)
fig
n_row = 2;
n_col = 4;
mar_bot = 0.000;
mar_top = 0.060;
mar_lef = 0.000;
mar_rig = 0.000;
gap_ver = 0.030;
gap_hor = 0.030;
asp_rat = 850/1536;
[hax_sub, pos_axe] = tight_subplot_ima(n_row, n_col, [gap_ver gap_hor], [mar_bot mar_top], ...
    [mar_lef mar_rig], asp_rat);
n_ani = length(cen_sub_ani_cel_dim);
global n_row_cax
correlation_threshold = 0.5;
int_col_com = colormap(jet);
ind_sub = 0;
for i = 1:n_ani
    if bri_ani(i)
        ind_sub = ind_sub + 1;
        hax = hax_sub(ind_sub);
        axes(hax)
        n_cel = size(cen_sub_ani_cel_dim{i}, 1);
        reg_num = 1;
        x_cel = cen_sub_ani_cel_dim{i}(:, 2);
        y_cel = n_row_cax - cen_sub_ani_cel_dim{i}(:, 1);
        hold on
        for j = 1:n_cel - 1
            for k = n_cel:-1:j + 1
                cor_coe = cor_coe_ani_reg_cel_cel{i, reg_num}(j, k);
                if abs(cor_coe) > correlation_threshold
                    col = round((255/2)*(cor_coe + 1) + 1);
                    plot([x_cel(j) x_cel(k)], [y_cel(j) y_cel(k)], ...
                        'Color', int_col_com(col, :), 'LineWidth', 0.1)
                end
            end
        end
        scatter(x_cel, y_cel, 'MarkerEdgeColor', [0.75 0.75 0.75])
        set(hax, 'xcolor', 'w', 'ycolor', 'w')
        title(ani(i), 'FontWeight', 'normal')
    end
end
ent_gen(pos_axe, tit)
end

function plo_bra_reg(log_ani_cel_reg, int_ref_ani_row_col, cel_lab_tel_ani_row_col, ...
    bri_ani, ani, tit)
fig
n_row = 2;
n_col = 4;
mar_bot = 0.000;
mar_top = 0.060;
mar_lef = 0.000;
mar_rig = 0.000;
gap_ver = 0.030;
gap_hor = 0.030;
asp_rat = 850/1536;
[hax_sub, pos_axe] = tight_subplot_ima(n_row, n_col, [gap_ver gap_hor], [mar_bot mar_top], ...
    [mar_lef mar_rig], asp_rat);
n_ani = length(ani);
%
ind_sub = 0;
global n_reg_for
global int_reg_cha
for i = 1:n_ani
    if bri_ani(i)
        ind_sub = ind_sub + 1;
        hax = hax_sub(ind_sub);
        axes(hax)
        %
        int_ref_row_col = int_ref_ani_row_col{i};
        int_ref_row_col = imadjust(int_ref_row_col);
        int_ref_row_col = im2double(int_ref_row_col);
        int_red_row_col = int_ref_row_col;
        int_gre_row_col = int_ref_row_col;
        int_blu_row_col = int_ref_row_col;
        %
        cel_lab_tel_row_col = cel_lab_tel_ani_row_col{i};
        log_cel_reg = log_ani_cel_reg{i};
        log_cel_reg_row_col = ext_log_cel_reg_row_col(cel_lab_tel_row_col, log_cel_reg);
        for j = 4:n_reg_for
            int_red_row_col(log_cel_reg_row_col{j}) = int_reg_cha(j, 1);
            int_gre_row_col(log_cel_reg_row_col{j}) = int_reg_cha(j, 2);
            int_blu_row_col(log_cel_reg_row_col{j}) = int_reg_cha(j, 3);
        end
        %
        int_row_col_cha = cat(3, int_red_row_col, int_gre_row_col, int_blu_row_col);
        imshow(int_row_col_cha)
        title(ani(i), 'FontWeight', 'normal')
    end
end
ent_gen(pos_axe, tit)
end

function h_fig = plo_clu_map_cel(dff_cel_fra, clu_cel, bou_dur_ani, piv_col_pcx, n_pla_str, fie_num)
[h_fig, fig_wid, fig_hei] = fig;
con_fil = matfile('\\home.ansatt.ntnu.no\kadiram\Documents\MATLAB\con_esp.mat');
n_row = 2;
n_col = 1;
gap_ver_row = 0.005*ones(n_row, 1);
gap_hor = 0.005;
gap_hor_row_col = 0.005*ones(n_row, n_col);
mar_bot = 0.040;
mar_top = 0.040;
mar_lef = 0.040;
mar_rig = 0.000;
asp_rat_axe = [1*ones(n_col, 1); 1*ones(n_col, 1)];
wid = false;
sca_axe = ones(n_row*n_col, 1);
n_pix_ext = 200;
[hax_sub, pos_axe, hei_axe, dis_asp_rat, las_pix, rat_wid] = tight_subplot_gen(n_row, n_col, ...
    gap_ver_row, gap_hor_row_col, mar_bot, mar_top, mar_lef, mar_rig, asp_rat_axe, fig_wid, ...
    fig_hei, wid, sca_axe, n_pix_ext);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
tim_fra = con_fil.tim_fra;
n_fra = con_fil.n_fra;
col_lim = [-20 20];
y_lab = con_fil.y_lab;
n_clu = max(clu_cel);
hax = hax_sub(1);
[~, str_met] = gen_str(fie_num);
clu_cel = arrayfun(@(clu) map_vec.(str_met)(clu), clu_cel);% SORTING BASED ON GROUP
[clu_cel, ind_cel] = sort(clu_cel);
dff_fra_cel = smo_sam_poi_var(dff_cel_fra(ind_cel, :)', n_fra.dff.(n_pla_str));
ima(hax, tim_fra.cal.(n_pla_str).tri.dff, dff_fra_cel')% sorted and smoothed
hax.YAxis.Visible = 'off';
caxis(hax, col_lim)
colormap(hax, jet)
%
hax_sig = hax_sub(2);
for clu = 1:n_clu
    log_cel = clu_cel == clu;
    [h_plo, ind_var_pea] = plo_sha.smo_tri(hax_sig, tim_fra.cal.(n_pla_str).tri.dff, dff_fra_cel(:, ...
        log_cel), piv_col_pcx(clu, :), n_fra.dff.(n_pla_str));
    hold(hax_sig, "on")
end
lin_wid = con_fil.lin_wid;
h = yline(hax_sig, 0, 'LineWidth', lin_wid.two);
h = xline(hax_sig, 0, 'Color', 'g', 'LineWidth', lin_wid.two);
h = xline(hax_sig, mean(bou_dur_ani, "omitnan"), 'Color', 'r', 'LineWidth', lin_wid.two);

col = colorbar(hax);
col.Units = "pixels";
col.Position(1) = 600;
col.Label.String = y_lab.dff;
% generate new axes, and image the clusters!
row_num = 1;
for col_num = 1:n_col
    axe_num = (row_num - 1)*n_col + col_num;
    pos_coo = pos_axe{axe_num};
    hax = axes('Units', 'normalized', 'Position', [pos_coo(1) - gap_hor pos_coo(2) gap_hor ...
        pos_coo(4)], 'XTickLabel', '', 'YTickLabel', '');
    ima(hax, nan, clu_cel)
    hax.XAxis.Visible = 'off';
    hax.YAxis.Visible = 'off';
    hax.Colormap = piv_col_pcx;
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
set(h_fig.Children, 'Units', 'pixels')
h_fig.Position(3) = las_pix;
h_fig.Renderer = 'painters';
h_fig.PaperSize(1) = rat_wid*h_fig.PaperSize(1);
h_fig.PaperUnits = 'normalized';
h_fig.PaperPosition = [0 0 1 1];
end

function h_fig = plo_dua_clu_map_cel(dff_cel_fra, clu_cel, bou_dur_ani, n_cel, piv_col_pcx)
[h_fig, fig_wid, fig_hei] = fig;
con_fil = matfile('\\home.ansatt.ntnu.no\kadiram\Documents\MATLAB\con_esp.mat');
n_row = 2;
n_col = 2;
gap_ver_row = 0.005*ones(n_row, 1);
gap_hor = 0.005;
gap_hor_row_col = 0.030*ones(n_row, n_col);
mar_bot = 0.040;
mar_top = 0.040;
mar_lef = 0.040;
mar_rig = 0.000;
asp_rat_axe = [1*ones(n_col, 1); 1*ones(n_col, 1)];
wid = false;
sca_axe = ones(n_row*n_col, 1);
n_pix_ext = 200;
[hax_sub, pos_axe, hei_axe, dis_asp_rat, las_pix, rat_wid] = tight_subplot_gen(n_row, n_col, ...
    gap_ver_row, gap_hor_row_col, mar_bot, mar_top, mar_lef, mar_rig, asp_rat_axe, fig_wid, ...
    fig_hei, wid, sca_axe, n_pix_ext);
linkaxes(hax_sub(3:4))
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
tim_fra = con_fil.tim_fra;
n_fra = con_fil.n_fra;
col_lim = [-20 20];
y_lab = con_fil.y_lab;
n_clu = max(clu_cel);
log_smo = 'true';
clu_cel_sha = clu_cel(1:n_cel.sha);
dff_cel_fra_sha = dff_cel_fra(1:n_cel.sha, :);
bou_dur_ani_sha = bou_dur_ani(1:16);
hax = hax_sub(1);
[clu_cel_sha, ind_cel] = sort(clu_cel_sha);
dff_fra_cel = smo_sam_poi_var(dff_cel_fra_sha(ind_cel, :)', n_fra.dff.one);
ima(hax, tim_fra.cal.one.tri.dff, dff_fra_cel')% sorted and smoothed
hax.YAxis.Visible = 'off';
caxis(hax, col_lim)
colormap(hax, jet)
%
hax_sig = hax_sub(3);
for clu = 1:n_clu
    log_cel = clu_cel_sha == clu;
    [h_plo, ind_var_pea] = plo_sha_gen(hax_sig, tim_fra.cal.one.tri.dff, dff_fra_cel(:, ...
        log_cel), piv_col_pcx(clu, :), log_smo, n_fra.dff.one);
    hold(hax_sig, "on")
end
lin_wid = con_fil.lin_wid;
h = yline(hax_sig, 0, 'LineWidth', lin_wid.two);
h = xline(hax_sig, 0, 'Color', 'g', 'LineWidth', lin_wid.two);
h = xline(hax_sig, mean(bou_dur_ani_sha, "omitnan"), 'Color', 'r', 'LineWidth', lin_wid.two);
clu_cel_abl = clu_cel(n_cel.sha + 1:end);
dff_cel_fra_abl = dff_cel_fra(n_cel.sha + 1:end, :);
bou_dur_ani_abl = bou_dur_ani(17:end);
hax = hax_sub(2);
[clu_cel_abl, ind_cel] = sort(clu_cel_abl);
dff_fra_cel = smo_sam_poi_var(dff_cel_fra_abl(ind_cel, :)', n_fra.dff.one);
ima(hax, tim_fra.cal.one.tri.dff, dff_fra_cel')% sorted and smoothed
hax.YAxis.Visible = 'off';
caxis(hax, col_lim)
colormap(hax, jet)
%
hax_sig = hax_sub(4);
for clu = 1:n_clu
    log_cel = clu_cel_abl == clu;
    [h_plo, ind_var_pea] = plo_sha_gen(hax_sig, tim_fra.cal.one.tri.dff, dff_fra_cel(:, ...
        log_cel), piv_col_pcx(clu, :), log_smo, n_fra.dff.one);
    hold(hax_sig, "on")
end
lin_wid = con_fil.lin_wid;
h = yline(hax_sig, 0, 'LineWidth', lin_wid.two);
h = xline(hax_sig, 0, 'Color', 'g', 'LineWidth', lin_wid.two);
h = xline(hax_sig, mean(bou_dur_ani_abl, "omitnan"), 'Color', 'r', 'LineWidth', lin_wid.two);
hax_sig.YAxis.Visible = 'off';

col = colorbar(hax);
col.Units = "pixels";
col.Position(1) = 1200;
col.Label.String = y_lab.dff;

row_num = 1;
for col_num = 1:n_col
    axe_num = (row_num - 1)*n_col + col_num;
    pos_coo = pos_axe{axe_num};
    hax = axes('Units', 'normalized', 'Position', [pos_coo(1) - gap_hor pos_coo(2) gap_hor ...
        pos_coo(4)], 'XTickLabel', '', 'YTickLabel', '');
    if col_num == 1
        ima(hax, nan, clu_cel_sha)
    else
        ima(hax, nan, clu_cel_abl)
    end
    hax.XAxis.Visible = 'off';
    hax.YAxis.Visible = 'off';
    hax.Colormap = piv_col_pcx;
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
set(h_fig.Children, 'Units', 'pixels')
h_fig.Position(3) = las_pix;
h_fig.Renderer = 'painters';
h_fig.PaperSize(1) = rat_wid*h_fig.PaperSize(1);
h_fig.PaperUnits = 'normalized';
h_fig.PaperPosition = [0 0 1 1];
end

function h_fig = plo_dff_bou(tac_tri, act_tri)
[h_fig, fig_wid, fig_hei] = fig;
con_fil = matfile('\\home.ansatt.ntnu.no\kadiram\Documents\MATLAB\con_esp.mat');
n_row = 1;
n_col = 1;
gap_ver_row = 0.005*ones(n_row, 1);
gap_hor = 0.005;
gap_hor_row_col = 0.030*ones(n_row, n_col);
mar_bot = 0.040;
mar_top = 0.040;
mar_lef = 0.040;
mar_rig = 0.000;
asp_rat_axe = [1*ones(n_col, 1); 1*ones(n_col, 1)];
wid = false;
sca_axe = ones(n_row*n_col, 1);
n_pix_ext = 200;
[hax_sub, pos_axe, hei_axe, dis_asp_rat, las_pix, rat_wid] = tight_subplot_gen(n_row, n_col, ...
    gap_ver_row, gap_hor_row_col, mar_bot, mar_top, mar_lef, mar_rig, asp_rat_axe, fig_wid, ...
    fig_hei, wid, sca_axe, n_pix_ext);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
hax = hax_sub(1);
siz = 20;
%h_plo = plo_var_var.one_sam(hax, tac_tri, act_tri, siz);


[tac_poi, act_poi, r_squ] = com_dat_poi_slr(tac_tri, act_tri);

[cor_coe, p_val] = corr(tac_tri, act_tri);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
mar = 'o';
y_sam = [0.950; 0.900];
tex_pri = {sprintf('r = %0.2f', cor_coe); sprintf('p = %0.3f', p_val)};
h_plo = scatter(hax, tac_tri, act_tri, siz, 'Marker', mar);
hold(hax, 'on')
plot(hax, tac_poi, act_poi)
text(hax, 0.010, y_sam(1), tex_pri{1}, 'units', 'normalized');
text(hax, 0.010, y_sam(2), tex_pri{2}, 'units', 'normalized');
box(hax, 'off')
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
set(h_fig.Children, 'Units', 'pixels')
h_fig.Position(3) = las_pix;
h_fig.Renderer = 'painters';
h_fig.PaperSize(1) = rat_wid*h_fig.PaperSize(1);
h_fig.PaperUnits = 'normalized';
h_fig.PaperPosition = [0 0 1 1];
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% axo-cel
function h_fig = plo_vib_res(tim_fra, dff_icx_con_fra_tri, ani)
[h_fig, fig_wid, fig_hei] = fig;
n_row = 1;
n_col = 1;
gap_ver_row = 0.070;
gap_hor_row_col = 0.030*ones(n_row, n_col);
mar_bot = 0.100;
mar_top = 0.030;
mar_lef = 0.070;
mar_rig = 0.001;
asp_rat_axe = 1;
wid = false;
sca_axe = 1;
n_pix_ext = 50;
[hax_sub, pos_axe, hei_axe, dis_asp_rat, las_pix, rat_wid] = tight_subplot_gen(n_row, n_col, ...
    gap_ver_row, gap_hor_row_col, mar_bot, mar_top, mar_lef, mar_rig, asp_rat_axe, fig_wid, ...
    fig_hei, wid, sca_axe, n_pix_ext);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[n_icx, n_con] = size(dff_icx_con_fra_tri);
icx_num = 1;
col_con = 'kkk';
lin_wid = 1;
con_fil = matfile('\\home.ansatt.ntnu.no\kadiram\Documents\MATLAB\con_esp.mat');
n_fra = con_fil.n_fra;
log_smo = true;
for i = n_con
    hax = hax_sub(1);
    [h_plo, ind_var_pea] = plo_sha_gen(hax, tim_fra, ...
            dff_icx_con_fra_tri{icx_num, i}, col_con(i), log_smo, n_fra.dff.eig);
end
y_lab = con_fil.y_lab;
for i = n_con
    hax = hax_sub(1);
    h = plo_ver_lin(hax, 0, 'k', lin_wid, '-');
    xlabel(hax, 'Time (s)')
    ylabel(hax, y_lab.dff)
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
set(h_fig.Children, 'Units', 'pixels')
h_fig.Position(3) = las_pix;
h_fig.Renderer = 'painters';
h_fig.PaperSize(1) = rat_wid*h_fig.PaperSize(1);
h_fig.PaperUnits = 'normalized';
h_fig.PaperPosition = [0 0 1 1];
end

function h_fig = plo_cor_map(ani, sta_ani, log_ani_pla_icx_row_col, r_ani_pla_icx_row_col)
[h_fig, fig_wid, fig_hei] = fig;
n_ani = length(ani);
n_row = n_ani;
con_fil = matfile('\\home.ansatt.ntnu.no\kadiram\Documents\MATLAB\con_esp.mat');
n_pla = con_fil.n_pla;
n_col = n_pla.neu.fun;
gap_ver_row = 0.010*ones(n_row, 1);
gap_hor_row_col = 0.010*ones(n_row, n_col);
mar_bot = 0.010;
mar_top = 0.010;
mar_lef = 0.010;
mar_rig = 0.035;
asp_rat = con_fil.asp_rat;
asp_rat_axe = asp_rat.cal.ori*ones(1, n_row*n_col);
wid = false;
sca_axe = 1;
n_pix_ext = 70;
[hax_sub, pos_axe, hei_axe, dis_asp_rat, las_pix, rat_wid] = tight_subplot_gen(n_row, n_col, ...
    gap_ver_row, gap_hor_row_col, mar_bot, mar_top, mar_lef, mar_rig, asp_rat_axe, fig_wid, ...
    fig_hei, wid, sca_axe, n_pix_ext);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
r_lim = con_fil.r_lim;
lim_r = con_fil.lim_r;
centeredmap = centered;
fun_pla = con_fil.fun_pla;
for i = 1:n_row
    ind_ani = sta_ani - 1 + i;
    for j = 1:n_col
        hax = hax_sub((i - 1)*n_col + j);
        pla_num = fun_pla.plo(1, j);
        piv_row_col_pcx = ext_piv_row_col_pcx(r_ani_pla_icx_row_col{ind_ani}{pla_num, 1}, r_lim, ...
            centeredmap);
        piv_row_col_pcx.abs(repmat(log_ani_pla_icx_row_col{ind_ani}{pla_num, con_fil.icx_num}, ...
            [1, 1, 3])) = 0;
        ima = sho_ima.rgb(hax, piv_row_col_pcx);
    end
    hax.Colormap = centeredmap;
    col = colorbar(hax);
    col.Ticks = [0 0.5 1];
    col.TickLabels = [-lim_r 0 lim_r];
    col.Units = "pixels";
    col.Position(1) = las_pix - 70;
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
set(h_fig.Children, 'Units', 'pixels')
h_fig.Position(3) = las_pix;
h_fig.Renderer = 'painters';
h_fig.PaperSize(1) = rat_wid*h_fig.PaperSize(1);
h_fig.PaperUnits = 'normalized';
h_fig.PaperPosition = [0 0 1 1];
end

function h_fig = plo_cor_his(per_cel_bin_ani)
[h_fig, fig_wid, fig_hei] = fig;
n_row = 1;
con_fil = matfile('\\home.ansatt.ntnu.no\kadiram\Documents\MATLAB\con_esp.mat');
n_col = 1;
gap_ver_row = 0.010*ones(n_row, 1);
gap_hor_row_col = 0.010*ones(n_row, n_col);
mar_bot = 0.100;
mar_top = 0.010;
mar_lef = 0.100;
mar_rig = 0.035;
asp_rat_axe = 0.7;
wid = false;
sca_axe = 1;
n_pix_ext = 70;
[hax, pos_axe, hei_axe, dis_asp_rat, las_pix, rat_wid] = tight_subplot_gen(n_row, n_col, ...
    gap_ver_row, gap_hor_row_col, mar_bot, mar_top, mar_lef, mar_rig, asp_rat_axe, fig_wid, ...
    fig_hei, wid, sca_axe, n_pix_ext);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
plo_sha_gen(hax, con_fil.cor_coe_bin, per_cel_bin_ani, [0 0 0], false, nan);
xlabel(hax, 'corr')
ylabel(hax, '%cell')
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
set(h_fig.Children, 'Units', 'pixels')
h_fig.Position(3) = las_pix;
h_fig.Renderer = 'painters';
h_fig.PaperSize(1) = rat_wid*h_fig.PaperSize(1);
h_fig.PaperUnits = 'normalized';
h_fig.PaperPosition = [0 0 1 1];
end

function h_fig = plo_cdf(r_cel)
[h_fig, fig_wid, fig_hei] = fig;
n_row = 1;
con_fil = matfile('\\home.ansatt.ntnu.no\kadiram\Documents\MATLAB\con_esp.mat');
n_col = 1;
gap_ver_row = 0.010*ones(n_row, 1);
gap_hor_row_col = 0.010*ones(n_row, n_col);
mar_bot = 0.100;
mar_top = 0.010;
mar_lef = 0.100;
mar_rig = 0.035;
asp_rat_axe = 0.7;
wid = false;
sca_axe = 1;
n_pix_ext = 70;
[hax, pos_axe, hei_axe, dis_asp_rat, las_pix, rat_wid] = tight_subplot_gen(n_row, n_col, ...
    gap_ver_row, gap_hor_row_col, mar_bot, mar_top, mar_lef, mar_rig, asp_rat_axe, fig_wid, ...
    fig_hei, wid, sca_axe, n_pix_ext);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
ecdf(hax, r_cel);
box(hax, 'off')
lin_wid = con_fil.lin_wid;
hax.Children.LineWidth = lin_wid.thr;
xline(0)
yline(0.5)
xlabel(hax, 'corr')
ylabel(hax, 'cum. probability')
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
set(h_fig.Children, 'Units', 'pixels')
h_fig.Position(3) = las_pix;
h_fig.Renderer = 'painters';
h_fig.PaperSize(1) = rat_wid*h_fig.PaperSize(1);
h_fig.PaperUnits = 'normalized';
h_fig.PaperPosition = [0 0 1 1];
end

function h_fig = plo_edf(cum_pro_bin_ani)
[h_fig, fig_wid, fig_hei] = fig;
n_row = 1;
con_fil = matfile('\\home.ansatt.ntnu.no\kadiram\Documents\MATLAB\con_esp.mat');
n_col = 1;

% gap_ver_row = 0.010*ones(n_row, 1);
% gap_hor_row_col = 0.010*ones(n_row, n_col);
% mar_bot = 0.100;
% mar_top = 0.010;
% mar_lef = 0.100;
% mar_rig = 0.035;

hei = 2.5;% percy
mar_top = cal_mar_top(hei);
mar_bot = 0.030;
mar_lef = 0.020;
mar_rig = 0.000;
gap_ver_row = 0.005*ones(n_row, 1);
gap_hor_row_col = 0.040*ones(n_row, n_col);

asp_rat_axe = 1;
wid = false;
sca_axe = 1;
n_pix_ext = 70;
[hax, pos_axe, hei_axe, dis_asp_rat, las_pix, rat_wid] = tight_subplot_gen(n_row, n_col, ...
    gap_ver_row, gap_hor_row_col, mar_bot, mar_top, mar_lef, mar_rig, asp_rat_axe, fig_wid, ...
    fig_hei, wid, sca_axe, n_pix_ext);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
plo_sha.raw(hax, con_fil.r_bin, cum_pro_bin_ani.exc, 'r');
hold(hax, "on")
plo_sha.raw(hax, con_fil.r_bin, cum_pro_bin_ani.inh, 'b');
xline(0)
yline(0.5)
xlabel(hax, 'corr')
ylabel(hax, 'cum. probability')
fon_siz = con_fil.fon_siz;
hax = adj_hax(hax, fon_siz.pub);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
set(h_fig.Children, 'Units', 'pixels')
h_fig.Position(3) = las_pix;
h_fig.Renderer = 'painters';
h_fig.PaperSize(1) = rat_wid*h_fig.PaperSize(1);
h_fig.PaperUnits = 'normalized';
h_fig.PaperPosition = [0 0 1 1];
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% axo-onl
function h_fig = plo_clu_map_pix(dff_pla_pix_fra, clu_pla_pix, fie_num, bou_dur_ani)
[h_fig, fig_wid, fig_hei] = fig;
con_fil = matfile('\\home.ansatt.ntnu.no\kadiram\Documents\MATLAB\con_esp.mat');
n_row = 2;
n_pla = con_fil.n_pla;
fun_pla = con_fil.fun_pla;
n_col = n_pla.neu.fun;
gap_ver_row = 0.005*ones(n_row, 1);
gap_hor = 0.005;
gap_hor_row_col = 0.005*ones(n_row, n_col);
mar_bot = 0.040;
mar_top = 0.040;
mar_lef = 0.040;
mar_rig = 0.000;
asp_rat_axe = [1*ones(n_col, 1); 1*ones(n_col, 1)];
wid = true;
sca_axe = ones(n_row*n_col, 1);
n_pix_ext = 0;
[hax_sub, pos_axe, hei_axe, dis_asp_rat, las_pix, rat_wid] = tight_subplot_gen(n_row, n_col, ...
    gap_ver_row, gap_hor_row_col, mar_bot, mar_top, mar_lef, mar_rig, asp_rat_axe, fig_wid, ...
    fig_hei, wid, sca_axe, n_pix_ext);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
tim_fra = con_fil.tim_fra;
n_fra = con_fil.n_fra;
col_lim = [-20 20];
clu_col_pix = cell(n_col, 1);
y_lab = con_fil.y_lab;
n_clu = max(clu_pla_pix{1});
linkaxes(hax_sub(end - 6:end))
y_min = inf;
y_max = -inf;
lin_wid = con_fil.lin_wid;
[~, str_met] = gen_str(fie_num);
piv_col_pcx = con_fil.piv_col_pcx;
piv_col_pcx = getfield(piv_col_pcx, fie_num{:});
for col_num = 1:n_col
    hax = hax_sub(col_num);
    pla = fun_pla.plo(1, col_num);
    clu_pix = arrayfun(@(clu) map_vec.(str_met)(clu), clu_pla_pix{pla});% SORTING BASED ON GROUP
    [clu_col_pix{col_num}, ind_pix] = sort(clu_pix);% sorting based on cluster number,
    sam_fra_pix = smo_sam_poi_var(dff_pla_pix_fra{pla}(ind_pix, :)', n_fra.bou);
    ima(hax, tim_fra.cal.eig.tri.dff, sam_fra_pix')% no sorting
    hax.YAxis.Visible = 'off';
    caxis(hax, col_lim)
    colormap(hax, jet)
    %
    sub_ind = col_num + n_col;
    hax_sig = hax_sub(sub_ind);
    for clu = 1:n_clu
        log_pix = clu_col_pix{col_num} == clu;
        [h_plo, ind_var_pea] = plo_sha.smo_tri(hax_sig, tim_fra.cal.eig.tri.dff, sam_fra_pix(:, ...
            log_pix), piv_col_pcx(clu, :), n_fra.bou);
        hold(hax_sig, "on")
    end
    [y_min, y_max, hax_sig] = adj_y(hax_sig, y_min, y_max);
    if col_num > 1
        hax_sig.YAxis.Visible = "off";
    end
    h = yline(hax_sig, 0, 'LineWidth', lin_wid.two);
    h = xline(hax_sig, 0, 'Color', 'g', 'LineWidth', lin_wid.two);
    if ~isempty(bou_dur_ani)
        h = xline(hax_sig, mean(bou_dur_ani, "omitnan"), 'Color', 'r', 'LineWidth', lin_wid.two);
    end
end

col = colorbar(hax);
col.Units = "pixels";
col.Position(1) = 950;
col.Position(2) = 100;
col.Label.String = y_lab.dff;

row_num = 1;
for col_num = 1:n_col
    axe_num = (row_num - 1)*n_col + col_num;
    pos_coo = pos_axe{axe_num};
    hax = axes('Units', 'normalized', 'Position', [pos_coo(1) - gap_hor pos_coo(2) gap_hor ...
        pos_coo(4)], 'XTickLabel', '', 'YTickLabel', '');
    ima(hax, nan, clu_col_pix{col_num})
    hax.XAxis.Visible = 'off';
    hax.YAxis.Visible = 'off';
    hax.Colormap = piv_col_pcx;
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
set(h_fig.Children, 'Units', 'pixels')
h_fig.Position(3) = las_pix;
h_fig.Renderer = 'painters';
h_fig.PaperSize(1) = rat_wid*h_fig.PaperSize(1);
h_fig.PaperUnits = 'normalized';
h_fig.PaperPosition = [0 0 1 1];
end

function h_fig = plo_pcc_dis_sin(pcc_blo_ani, dis_blo)
[h_fig, fig_wid, fig_hei] = fig;
con_fil = matfile('\\home.ansatt.ntnu.no\kadiram\Documents\MATLAB\con_esp.mat');
asp_rat = con_fil.asp_rat;
n_row = 1;
n_col = 1;
gap_ver_row = 0.050*ones(n_row, 1);
gap_hor_row_col = 0.030*ones(n_row, n_col);
mar_bot = 0.100;
mar_top = 0.030;
mar_lef = 0.060;
mar_rig = 0.001;
asp_rat_axe = asp_rat.bar*ones(n_row*n_col, 1);
wid = false;
sca_axe = ones(n_row*n_col, 1);
n_pix_ext = 30;
[hax_sub, pos_axe, hei_axe, dis_asp_rat, las_pix, rat_wid] = tight_subplot_gen(n_row, n_col, ...
    gap_ver_row, gap_hor_row_col, mar_bot, mar_top, mar_lef, mar_rig, asp_rat_axe, fig_wid, ...
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
xlim([0 150])%%%%%%%%%%%!!!!!!!!!!!!!!!!!!!!
xlabel(hax, 'distance (\mum)')
h_fig = opt_h_fig(h_fig, las_pix, rat_wid);
end

function h_fig = plo_clu_map_ani_thr(x_ani_pix, y_ani_pix, z_ani_pix, piv_col_pcx, clu_ani_pix, ...
    mar_siz)
[h_fig, fig_wid, fig_hei] = fig;
con_fil = matfile('\\home.ansatt.ntnu.no\kadiram\Documents\MATLAB\con_esp.mat');
n_row = 2;
n_col = 7;
gap_ver_row = 0.000*ones(n_row, 1);
gap_hor = 0.000;
gap_hor_row_col = gap_hor*ones(n_row, n_col);
mar_bot = 0.000;
mar_top = 0.000;
mar_lef = 0.000;
mar_rig = 0.000;
asp_rat = con_fil.asp_rat;
asp_rat_axe = asp_rat.cal.ori*ones(n_row*n_col, 1);
wid = true;
sca_axe = ones(n_row*n_col, 1);
n_pix_ext = 0;
[hax_sub, pos_axe, hei_axe, dis_asp_rat, las_pix, rat_wid] = tight_subplot_gen(n_row, ...
    n_col, gap_ver_row, gap_hor_row_col, mar_bot, mar_top, mar_lef, mar_rig, ...
    asp_rat_axe, fig_wid, fig_hei, wid, sca_axe, n_pix_ext);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
n_ani = length(x_ani_pix);
ind_sub = 0;
for ani = 1:n_ani
    if ~isempty(x_ani_pix{ani})
        ind_sub = ind_sub + 1;
        hax = hax_sub(ind_sub);
        x_pix = x_ani_pix{ani};
        y_pix = y_ani_pix{ani};
        z_pix = z_ani_pix{ani};
        clu_pix = clu_ani_pix{ani};
        scatter3(hax, x_pix, y_pix, z_pix, mar_siz, clu_pix, 'filled')
        hax.PlotBoxAspectRatio = [1 asp_rat.cal.ori 1];
        colormap(hax, piv_col_pcx)
        view(hax, -120, 30)
        axis(hax, 'equal')
        hax.XLim = [min(vertcat(x_ani_pix{:})) max(vertcat(x_ani_pix{:}))];
        hax.YLim = [min(vertcat(y_ani_pix{:})) max(vertcat(y_ani_pix{:}))];
        hax.ZLim = [min(vertcat(z_ani_pix{:})) max(vertcat(z_ani_pix{:}))];
        hax.XAxis.Visible = 'off';
        hax.YAxis.Visible = 'off';
        hax.ZAxis.Visible = 'off';
    end
end
end

function h_fig = plo_clu_map_ani_sin(x_ani_pix, y_ani_pix, z_ani_pix, piv_col_pcx, clu_ani_pix, ...
    mar_siz, vie_ang_dir)
% fie .srt !!!
[h_fig, fig_wid, fig_hei] = fig;
con_fil = matfile('\\home.ansatt.ntnu.no\kadiram\Documents\MATLAB\con_esp.mat');
n_row = 1;
n_col = 1;
gap_ver_row = 0.000*ones(n_row, 1);
gap_hor = 0.000;
gap_hor_row_col = gap_hor*ones(n_row, n_col);
mar_bot = 0.000;
mar_top = 0.000;
mar_lef = 0.000;
mar_rig = 0.000;
asp_rat = con_fil.asp_rat;
asp_rat_axe = asp_rat.cal.ori*ones(n_row*n_col, 1);
wid = false;
sca_axe = ones(n_row*n_col, 1);
n_pix_ext = 0;
[hax_sub, pos_axe, hei_axe, dis_asp_rat, las_pix, rat_wid] = tight_subplot_gen(n_row, ...
    n_col, gap_ver_row, gap_hor_row_col, mar_bot, mar_top, mar_lef, mar_rig, ...
    asp_rat_axe, fig_wid, fig_hei, wid, sca_axe, n_pix_ext);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
x_pix = vertcat(x_ani_pix{:});
y_pix = vertcat(y_ani_pix{:});
z_pix = vertcat(z_ani_pix{:});
clu_pix = vertcat(clu_ani_pix{:});

x_lim = [min(x_pix) max(x_pix)];
y_lim = [min(y_pix) max(y_pix)];
z_lim = [min(z_pix) max(z_pix)];

log_gre = clu_pix == 2;
x_pix(log_gre) = [];
y_pix(log_gre) = [];
z_pix(log_gre) = [];
clu_pix(log_gre) = [];

hax = hax_sub(1);
scatter3(hax, x_pix, y_pix, z_pix, mar_siz, clu_pix, 'filled')
hax.PlotBoxAspectRatio = [1 asp_rat.cal.ori 1];
colormap(hax, piv_col_pcx)
axis(hax, 'equal')
hax.XLim = x_lim;
hax.YLim = y_lim;
hax.ZLim = z_lim;
%view(hax, -120, 30)
view(hax, vie_ang_dir(1), vie_ang_dir(2))
hax.XAxis.Visible = 'off';
hax.YAxis.Visible = 'off';
hax.ZAxis.Visible = 'off';
end

function h_fig = plo_clu_map_ani_spl(x_ani_pix, y_ani_pix, z_ani_pix, piv_col_pcx, clu_ani_pix, ...
    mar_siz, vie_ang_dir)
% fie .srt !!!
[h_fig, fig_wid, fig_hei] = fig;
con_fil = matfile('\\home.ansatt.ntnu.no\kadiram\Documents\MATLAB\con_esp.mat');
n_row = 2;
n_col = 1;
gap_ver_row = 0.000*ones(n_row, 1);
gap_hor = 0.000;
gap_hor_row_col = gap_hor*ones(n_row, n_col);
mar_bot = 0.000;
mar_top = 0.000;
mar_lef = 0.000;
mar_rig = 0.000;
asp_rat = con_fil.asp_rat;
asp_rat_axe = ones(n_row*n_col, 1);
wid = false;
sca_axe = ones(n_row*n_col, 1);
n_pix_ext = 0;
[hax_sub, pos_axe, hei_axe, dis_asp_rat, las_pix, rat_wid] = tight_subplot_gen(n_row, ...
    n_col, gap_ver_row, gap_hor_row_col, mar_bot, mar_top, mar_lef, mar_rig, ...
    asp_rat_axe, fig_wid, fig_hei, wid, sca_axe, n_pix_ext);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
x_pix = vertcat(x_ani_pix{:});
y_pix = vertcat(y_ani_pix{:});
z_pix = vertcat(z_ani_pix{:});
clu_pix = vertcat(clu_ani_pix{:});

x_lim = [min(x_pix) max(x_pix)];
y_lim = [min(y_pix) max(y_pix)];
z_lim = [min(z_pix) max(z_pix)];

log_gre = clu_pix == 2;
x_pix(log_gre) = [];
y_pix(log_gre) = [];
z_pix(log_gre) = [];
clu_pix(log_gre) = [];
tra = 0.1;
ind_hax = 0;
w = 100;
xc = x_lim(1) + w;
yc = y_lim(1) + w;
zc = z_lim(1);
for clu = [3 1]
    ind_hax = ind_hax + 1;
    hax = hax_sub(ind_hax);
    log_inh = clu_pix == clu;
    scatter3(hax, x_pix(log_inh), y_pix(log_inh), z_pix(log_inh), mar_siz, piv_col_pcx(clu, :), ...
        'filled', 'MarkerEdgeAlpha', tra, 'MarkerFaceAlpha', tra)
    hax.PlotBoxAspectRatio = [1 asp_rat.cal.ori 1];
    colormap(hax, piv_col_pcx)
    axis(hax, 'equal')
    hax.XLim = x_lim;
    hax.YLim = y_lim;
    hax.ZLim = z_lim;
    view(hax, vie_ang_dir(1), vie_ang_dir(2))
    hax.XAxis.Visible = 'off';
    hax.YAxis.Visible = 'off';
    hax.ZAxis.Visible = 'off';
    hax.XGrid = 'off';
    hax.YGrid = 'off';
    hax.ZGrid = 'off';
    hl = scalebar_3d(hax, xc,yc,zc, w);
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
h_fig = opt_h_fig(h_fig, las_pix, rat_wid);
end

function h_fig = plo_spa_den_axo(x_ani_uni, y_ani_uni, log_uni, mar_siz)
[h_fig, fig_wid, fig_hei] = fig;
con_fil = matfile('\\home.ansatt.ntnu.no\kadiram\Documents\MATLAB\con_esp.mat');
n_row = 1;
n_col = 2;
gap_ver_row = 0.000*ones(n_row, 1);
gap_hor = 0.000;
gap_hor_row_col = gap_hor*ones(n_row, n_col);
mar_bot = 0.000;
mar_top = 0.000;
mar_lef = 0.000;
mar_rig = 0.000;
asp_rat = con_fil.asp_rat;
asp_rat_axe = asp_rat.cal.ori*ones(n_row*n_col, 1);
wid = false;
sca_axe = ones(n_row*n_col, 1);
n_pix_ext = 0;
[hax_sub, pos_axe, hei_axe, dis_asp_rat, las_pix, rat_wid] = tight_subplot_gen(n_row, ...
    n_col, gap_ver_row, gap_hor_row_col, mar_bot, mar_top, mar_lef, mar_rig, ...
    asp_rat_axe, fig_wid, fig_hei, wid, sca_axe, n_pix_ext);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
x_uni.all = vertcat(x_ani_uni{:});
y_uni.all = vertcat(y_ani_uni{:});
x_lim = [min(x_uni.all) max(x_uni.all)];
y_lim = [min(y_uni.all) max(y_uni.all)];

for col = 1:n_col
    if col == 1
        fie = 'inh';
    elseif col == 2
        fie = 'exc';
    end
    x_uni.(fie) = x_uni.all(log_uni.(fie));
    y_uni.(fie) = y_uni.all(log_uni.(fie));
    pro_den_uni.(fie) = ksdensity([x_uni.(fie) y_uni.(fie)], [x_uni.(fie) y_uni.(fie)]);
    % just for coloring

    min_den.(fie) = min(pro_den_uni.(fie));
    max_den.(fie) = max(pro_den_uni.(fie));
end

min_den = max(min_den.inh, min_den.exc);
max_den = min(max_den.inh, max_den.exc);

for col = 1:n_col
    hax = hax_sub(col);
    if col == 1
        fie = 'inh';
    elseif col == 2
        fie = 'exc';
    end
    pro_den_uni.(fie)(pro_den_uni.(fie) < min_den) = min_den;
    pro_den_uni.(fie)(pro_den_uni.(fie) > max_den) = max_den;
    h = scatter(hax, x_uni.(fie), y_uni.(fie), mar_siz, pro_den_uni.(fie), 'filled');

    hax.PlotBoxAspectRatio = [1 asp_rat.cal.ori 1];
    view(hax, -120, 30)
    axis(hax, 'equal')

    hax.XAxis.Visible = 'off';
    hax.YAxis.Visible = 'off';
    hax.XLim = x_lim;
    hax.YLim = y_lim;
end
end

function h_fig = plo_clu_map_ani_cle(x_ani_pix, y_ani_pix, z_ani_pix, piv_col_pcx, clu_ani_pix, ...
    mar_siz)
[h_fig, fig_wid, fig_hei] = fig;
con_fil = matfile('\\home.ansatt.ntnu.no\kadiram\Documents\MATLAB\con_esp.mat');
n_row = 2;
n_col = 7;
gap_ver_row = 0.000*ones(n_row, 1);
gap_hor = 0.000;
gap_hor_row_col = gap_hor*ones(n_row, n_col);
mar_bot = 0.000;
mar_top = 0.000;
mar_lef = 0.000;
mar_rig = 0.000;
asp_rat = con_fil.asp_rat;
asp_rat_axe = asp_rat.cal.ori*ones(n_row*n_col, 1);
wid = true;
sca_axe = ones(n_row*n_col, 1);
n_pix_ext = 0;
[hax_sub, pos_axe, hei_axe, dis_asp_rat, las_pix, rat_wid] = tight_subplot_gen(n_row, ...
    n_col, gap_ver_row, gap_hor_row_col, mar_bot, mar_top, mar_lef, mar_rig, ...
    asp_rat_axe, fig_wid, fig_hei, wid, sca_axe, n_pix_ext);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
n_ani = length(x_ani_pix);
ind_sub = 0;
for ani = 1:n_ani
    if ~isempty(x_ani_pix{ani})
        ind_sub = ind_sub + 1;
        hax = hax_sub(ind_sub);
        x_pix = x_ani_pix{ani};
        y_pix = y_ani_pix{ani};
        z_pix = z_ani_pix{ani};
        clu_pix = clu_ani_pix{ani};

        log_gre = clu_pix == 2;
        x_pix(log_gre) = [];
        y_pix(log_gre) = [];
        z_pix(log_gre) = [];
        clu_pix(log_gre) = [];

        scatter3(hax, x_pix, y_pix, z_pix, mar_siz, clu_pix, 'filled')
        hax.PlotBoxAspectRatio = [1 asp_rat.cal.ori 1];
        colormap(hax, piv_col_pcx)
        view(hax, -120, 30)
        axis(hax, 'equal')
        hax.XLim = [min(vertcat(x_ani_pix{:})) max(vertcat(x_ani_pix{:}))];
        hax.YLim = [min(vertcat(y_ani_pix{:})) max(vertcat(y_ani_pix{:}))];
        hax.ZLim = [min(vertcat(z_ani_pix{:})) max(vertcat(z_ani_pix{:}))];
        hax.XAxis.Visible = 'off';
        hax.YAxis.Visible = 'off';
        hax.ZAxis.Visible = 'off';
    end
end
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% gab
function h_fig = plo_clu_sel(clu_sel_ani_k, k)
[h_fig, fig_wid, fig_hei] = fig;
con_fil = matfile('\\home.ansatt.ntnu.no\kadiram\Documents\MATLAB\con_esp.mat');
n_row = 1;
n_col = 1;

% gap_ver_row = 0.005*ones(n_row, 1);
% gap_hor_row_col = 0.030*ones(n_row, n_col);
% mar_bot = 0.040;
% mar_top = 0.040;
% mar_lef = 0.040;
% mar_rig = 0.000;

hei = 3;
mar_top = cal_mar_top(hei);
mar_bot = 0.015;
mar_lef = 0.020;
mar_rig = 0.000;
gap_ver_row = 0.005*ones(n_row, 1);
gap_hor_row_col = 0.040*ones(n_row, n_col);

asp_rat_axe = 0.5;
wid = false;
sca_axe = ones(n_row*n_col, 1);
n_pix_ext = 200;
[hax_sub, pos_axe, hei_axe, dis_asp_rat, las_pix, rat_wid] = tight_subplot_gen(n_row, n_col, ...
    gap_ver_row, gap_hor_row_col, mar_bot, mar_top, mar_lef, mar_rig, asp_rat_axe, fig_wid, ...
    fig_hei, wid, sca_axe, n_pix_ext);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
hax = hax_sub(1);
var_win_con_sam_uni{1, 1}{1} = clu_sel_ani_k.gab(:, k);
var_win_con_sam_uni{1, 2}{1} = clu_sel_ani_k.ran(:, k);
ind_win = 1;
ind_sin_sam = 1;
mar_siz = con_fil.mar_siz;
col_sam_con{1, 1} = [1 0 1];
col_sam_con{1, 2} = [0 0 0];
h_plo = plo_dat_err_xco(hax, var_win_con_sam_uni, ind_win, ind_sin_sam, mar_siz.pre, col_sam_con);
p_xco = com_p_xco(clu_sel_ani_k.gab(:, k), clu_sel_ani_k.ran(:, k));

groups = {[1, 2]};
off_non = 0.070;
mou = 0.030;
sep = off_non + mou + 0.040;
ext_hei = -(sep + mou);
fon_siz = con_fil.fon_siz;
%
hax = hax_sub(1);
y_lim_pre = ylim(hax);
[H, y_lim] = sigstar_lim(hax, groups, fon_siz.non, off_non, y_lim_pre, sep, mou, ext_hei, ...
    p_xco.srt);
y_min = inf;
y_max = -inf;
[y_min, y_max, hax] = adj_y(hax, y_min, y_max);
y_lab = con_fil.y_lab;
ylabel(hax, y_lab.clu_sel)
hax.XTick = [1 2];
hax.XTickLabel = {'G','R'};
log_lin_wid = true;
hax = adj_hax(hax, fon_siz.pub, mar_siz.pub, log_lin_wid);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
set(h_fig.Children, 'Units', 'pixels')
h_fig.Position(3) = las_pix;
h_fig.Renderer = 'painters';
h_fig.PaperSize(1) = rat_wid*h_fig.PaperSize(1);
h_fig.PaperUnits = 'normalized';
h_fig.PaperPosition = [0 0 1 1];
end

function h_fig = plo_pai_cor(acc, xcc)
[h_fig, fig_wid, fig_hei] = fig;
con_fil = matfile('\\home.ansatt.ntnu.no\kadiram\Documents\MATLAB\con_esp.mat');
n_row = 1;
n_col = 1;
%
% gap_ver_row = 0.005*ones(n_row, 1);
% gap_hor_row_col = 0.030*ones(n_row, n_col);
% mar_bot = 0.040;
% mar_top = 0.040;
% mar_lef = 0.040;
% mar_rig = 0.000;
%
%hei = 2.5;% stephanie
hei = 3;
mar_top = cal_mar_top(hei);
mar_bot = 0.025;
mar_lef = 0.020;
mar_rig = 0.000;
gap_ver_row = 0.005*ones(n_row, 1);
gap_hor_row_col = 0.040*ones(n_row, n_col);
%
asp_rat_axe = 0.5;
wid = false;
sca_axe = ones(n_row*n_col, 1);
n_pix_ext = 200;
[hax_sub, pos_axe, hei_axe, dis_asp_rat, las_pix, rat_wid] = tight_subplot_gen(n_row, n_col, ...
    gap_ver_row, gap_hor_row_col, mar_bot, mar_top, mar_lef, mar_rig, asp_rat_axe, fig_wid, ...
    fig_hei, wid, sca_axe, n_pix_ext);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
hax = hax_sub(1);
var_win_con_sam_uni{1, 1}{1} = acc;
var_win_con_sam_uni{1, 2}{1} = xcc;
ind_win = 1;
ind_sin_sam = 1;
mar_siz = con_fil.mar_siz;
col_sam_con{1, 1} = [1 0 1];
col_sam_con{1, 2} = [0 0 0];
h_plo = plo_dat_err_xco(hax, var_win_con_sam_uni, ind_win, ind_sin_sam, mar_siz.pre, col_sam_con);
p_xco = com_p_xco(acc, xcc);

groups = {[1, 2]};
off_non = 0.070;
mou = 0.030;
sep = off_non + mou + 0.040;
ext_hei = -(sep + mou);
fon_siz = con_fil.fon_siz;
%
hax = hax_sub(1);
y_lim_pre = ylim(hax);
[H, y_lim] = sigstar_lim(hax, groups, fon_siz.non, off_non, y_lim_pre, sep, mou, ext_hei, ...
    p_xco.lme);
y_min = inf;
y_max = -inf;
[y_min, y_max, hax] = adj_y(hax, y_min, y_max);
%hax.XTickLabel = {'GAD1xGAD1','GAD1xnon-GAD1'};
y_lab = con_fil.y_lab;
ylabel(hax, y_lab.pai_cor)
hax.XTick = [1 2];
hax.XTickLabel = {'GxG','GxN'};
log_lin_wid = true;
hax = adj_hax(hax, fon_siz.pub, mar_siz.pub, log_lin_wid);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
set(h_fig.Children, 'Units', 'pixels')
h_fig.Position(3) = las_pix;
h_fig.Renderer = 'painters';
h_fig.PaperSize(1) = rat_wid*h_fig.PaperSize(1);
h_fig.PaperUnits = 'normalized';
h_fig.PaperPosition = [0 0 1 1];
end

function h_fig = plo_inh_exc(fra_ani)
n_row = 1;
n_col = 2;

% gap_ver_row = 0.030*ones(n_row, 1);
% gap_hor_ave = 0.005;
% gap_hor_col = gap_hor_ave;
% gap_hor_row_col = repmat(gap_hor_col, n_row, 1);
% mar_bot = 0.090;
% mar_top = 0.040;
% mar_lef = 0.050;
% mar_rig = 0.000;

gap_ver_row = 0.020*ones(n_row, 1);
gap_hor_col = 0.005*ones(n_col, 1);
gap_hor_row_col = repmat(gap_hor_col, n_row, n_col);
mar_bot = 0.015;
hei = 3.5;
mar_top = cal_mar_top(hei);
mar_lef = 0.020;
mar_rig = 0.000;

asp_rat_bar = 0.5;
asp_rat_axe = asp_rat_bar*ones(1, n_row*n_col);
[h_fig, wid_mon, hei_mon] = fig;
wid = false;
sca_axe = ones(1, n_row*n_col);
n_pix_ext = 30;
[hax_sub, pos_axe, axh, dis_asp_rat, las_pix, rat_wid] = tight_subplot_gen...
    (n_row, n_col, ...
    gap_ver_row, gap_hor_row_col, mar_bot, mar_top, mar_lef, mar_rig, asp_rat_axe, wid_mon, ...
    hei_mon, wid, sca_axe, n_pix_ext);
linkaxes(hax_sub)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% exc
y_min = inf;
y_max = -inf;
nam_sam = ["gab"; "non"];
hax = hax_sub(1);
var_win_con_sam_uni{1, 1}{1} = fra_ani.exc.gab;
var_win_con_sam_uni{1, 2}{1} = fra_ani.exc.non;
ind_win = 1;
ind_sin_sam = 1;
con_fil = matfile('\\home.ansatt.ntnu.no\kadiram\Documents\MATLAB\con_esp.mat');
mar_siz = con_fil.mar_siz;
col_sam_con{1, 1} = [1 0 1];
col_sam_con{1, 2} = [0 0 0];
h_plo = plo_dat_err_xco(hax, var_win_con_sam_uni, ind_win, ind_sin_sam, mar_siz.pre, col_sam_con);
p_xco.exc = com_p_xco(fra_ani.exc.gab, fra_ani.exc.non);
[y_min, y_max, hax] = adj_y(hax, y_min, y_max);
fon_siz = con_fil.fon_siz;
hax.FontSize = fon_siz.pre;
xticks(hax, [1, 2])
%xticklabels(hax, {'gad1', 'non-gad1'})
xticklabels(hax, {'G', 'N'})
%y_lab = 'tail-modulated cells in DRN (%)';
y_lab = 'tail-modulated cells (%)';
ylabel(hax, y_lab)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% inh
var_win_con_sam_uni{1, 1}{1} = fra_ani.inh.gab;
var_win_con_sam_uni{1, 2}{1} = fra_ani.inh.non;
hax = hax_sub(2);
h_plo = plo_dat_err_xco(hax, var_win_con_sam_uni, ind_win, ind_sin_sam, mar_siz.pre, col_sam_con);
p_xco.inh = com_p_xco(fra_ani.inh.gab, fra_ani.inh.non);
[y_min, y_max, hax] = adj_y(hax, y_min, y_max);
%%%%%%%%%%%%%%%%%%%%
groups = {[1, 2]};
off_non = 0.070;
mou = 0.030;
sep = off_non + mou + 0.040;
ext_hei = -(sep + mou);
%
hax = hax_sub(1);
y_lim_pre = ylim(hax);
[H, y_lim] = sigstar.sig(hax, groups, y_lim_pre, sep, mou, ext_hei, off_non, ...
    p_xco.exc.lme);
[y_min, y_max, hax] = adj_y(hax, y_min, y_max);
%
hax = hax_sub(2);
y_lim_pre = ylim(hax);
[H, y_lim] = sigstar.sig(hax, groups, y_lim_pre, sep, mou, ext_hei, off_non, ...
    p_xco.inh.lme);
[y_min, y_max, hax] = adj_y(hax, y_min, y_max);
%set(H(1, 2), 'Position', [1.5 73 0])
xticks(hax, [1, 2])
xticklabels(hax, {'G', 'N'})
hax.YAxis.Visible = 'off';
log_lin_wid = true;
adj_hax(hax_sub(1), fon_siz.pub, mar_siz.pub, log_lin_wid);
hax = adj_hax(hax, fon_siz.pub, mar_siz.pub, log_lin_wid);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
h_fig = opt_h_fig(h_fig, las_pix, rat_wid);
end

function h_fig = plo_inh_exc_ros_cau(dis_blo, fra_blo_ani)
n_row = 2;
n_col = 1;
gap_ver_row = 0.130*ones(n_row, 1);
gap_hor_ave = 0.005;
gap_hor_col = gap_hor_ave;
gap_hor_row_col = repmat(gap_hor_col, n_row, 1);
mar_bot = 0.000;
mar_top = 0.040;
mar_lef = 0.043;
mar_rig = 0.000;
asp_rat_bar = 0.5;
asp_rat_axe = asp_rat_bar*ones(1, n_row*n_col);
[h_fig, wid_mon, hei_mon] = fig;
wid = false;
sca_axe = ones(1, n_row*n_col);
n_pix_ext = 30;
[hax_sub, pos_axe, axh, dis_asp_rat, las_pix, rat_wid] = tight_subplot_gen...
    (n_row, n_col, ...
    gap_ver_row, gap_hor_row_col, mar_bot, mar_top, mar_lef, mar_rig, asp_rat_axe, wid_mon, ...
    hei_mon, wid, sca_axe, n_pix_ext);
linkaxes(hax_sub)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
y_min = inf;
y_max = -inf;
nam_sam = ["gab"; "non"];
hax = hax_sub(1);

con_fil = matfile('\\home.ansatt.ntnu.no\kadiram\Documents\MATLAB\con_esp.mat');
plo_sha.raw(hax, dis_blo, fra_blo_ani.exc.gab, 'r')
hold(hax, "on")
plo_sha.raw(hax, dis_blo, fra_blo_ani.exc.non, 'k')

[y_min, y_max, hax] = adj_y(hax, y_min, y_max);
fon_siz = con_fil.fon_siz;
hax.FontSize = fon_siz.pre;
xticklabels(hax, [])
xticklabels(hax, nam_sam)
hax.XAxis.Color = 'w';
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
hax = hax_sub(2);

plo_sha.raw(hax, dis_blo, fra_blo_ani.inh.gab, 'r')
hold(hax, "on")
plo_sha.raw(hax, dis_blo, fra_blo_ani.inh.non, 'k')

[y_min, y_max, hax] = adj_y(hax, y_min, y_max);
%%%%%%%%%%%%%%%%%%%%
y_lab = 'tail-modulated cells in DRN (%)';
supAxes = [mar_lef 0 1 1];
[ax, h] = suplabel(y_lab, 'y', supAxes);
h.Units = 'normalized';
h.Position(2) = 0.77;
%%%%%%%%%%%%%%
nor_x = -1.1;
nor_y = 0.4;
h = text(hax_sub(1), nor_x, nor_y, 'excitation', 'units', 'normalized');
%
nor_y = 0.6;
h = text(hax_sub(2), nor_x, nor_y, 'inhibition', 'units', 'normalized');
%
h_fig = opt_h_fig(h_fig, las_pix, rat_wid);
end

function h_fig = plo_inh_exc_spa_gab(dis_blo, fra_fie_blo_ani, fie)
n_row = 2;
n_col = 2;
gap_ver_row = 0.030*ones(n_row, 1);
gap_hor_ave = 0.030;
gap_hor_col = gap_hor_ave;
gap_hor_row_col = repmat(gap_hor_col, n_row, n_col);
mar_bot = 0.000;
mar_top = 0.040;
mar_lef = 0.043;
mar_rig = 0.000;
asp_rat_bar = 0.5;
asp_rat_axe = asp_rat_bar*ones(n_row*n_col, 1);
[h_fig, wid_mon, hei_mon] = fig;
wid = false;
sca_axe = ones(n_row*n_col, 1);
n_pix_ext = 30;
[hax_sub, ~, ~, ~, las_pix, rat_wid] = tight_subplot_gen(n_row, n_col, gap_ver_row, gap_hor_row_col...
    , mar_bot, mar_top, mar_lef, mar_rig, asp_rat_axe, wid_mon, hei_mon, wid, sca_axe, n_pix_ext);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
y_min = inf;
y_max = -inf;
hax = hax_sub(1);
con_fil = matfile('\\home.ansatt.ntnu.no\kadiram\Documents\MATLAB\con_esp.mat');
plo_sha.raw(hax, dis_blo.ros_cau, fra_fie_blo_ani.(fie).ros_cau.exc.gab, 'r')
hold(hax, "on")
plo_sha.raw(hax, dis_blo.ros_cau, fra_fie_blo_ani.(fie).ros_cau.exc.non, 'k')
[y_min, y_max, hax] = adj_y(hax, y_min, y_max);
fon_siz = con_fil.fon_siz;
hax.FontSize = fon_siz.pre;
xticklabels(hax, [])
hax.XAxis.Color = 'w';
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
hax = hax_sub(3);
plo_sha.raw(hax, dis_blo.ros_cau, fra_fie_blo_ani.(fie).ros_cau.inh.gab, 'r')
hold(hax, "on")
plo_sha.raw(hax, dis_blo.ros_cau, fra_fie_blo_ani.(fie).ros_cau.inh.non, 'k')
[y_min, y_max, hax] = adj_y(hax, y_min, y_max);
%%%%%%%%%%%%%%%%%%%%
y_lab = 'tail-modulated cells in DRN (%)';
supAxes = [mar_lef 0 1 1];
[ax, h] = suplabel(y_lab, 'y', supAxes);
h.Units = 'normalized';
h.Position(2) = 0.77;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
hax = hax_sub(2);
plo_sha.raw(hax, dis_blo.dor_ven, fra_fie_blo_ani.(fie).dor_ven.exc.gab, 'r')
hold(hax, "on")
plo_sha.raw(hax, dis_blo.dor_ven, fra_fie_blo_ani.(fie).dor_ven.exc.non, 'k')
[y_min, y_max, hax] = adj_y(hax, y_min, y_max);
xticklabels(hax, [])
hax.XAxis.Color = 'w';
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
hax = hax_sub(4);
plo_sha.raw(hax, dis_blo.dor_ven, fra_fie_blo_ani.(fie).dor_ven.inh.gab, 'r')
hold(hax, "on")
plo_sha.raw(hax, dis_blo.dor_ven, fra_fie_blo_ani.(fie).dor_ven.inh.non, 'k')
[y_min, y_max, hax] = adj_y(hax, y_min, y_max);
linkaxes(hax_sub, 'y')
linkaxes([hax_sub(1) hax_sub(3)], 'x')
linkaxes([hax_sub(2) hax_sub(4)], 'x')
%%%%%%%%%%%%%%
h_fig = opt_h_fig(h_fig, las_pix, rat_wid);
end

function h_fig = plo_gab_clu(x_pix, y_pix, z_pix, log_cel, fie)
[h_fig, fig_wid, fig_hei] = fig;
con_fil = matfile('\\home.ansatt.ntnu.no\kadiram\Documents\MATLAB\con_esp.mat');
n_row = 1;
n_col = 2;
gap_ver_row = 0.000*ones(n_row, 1);
gap_hor_row_col = 0.000*ones(n_row, n_col);
mar = 0.000;
mar_bot = mar;
mar_top = mar;
mar_lef = mar;
mar_rig = mar;
asp_rat_axe = 1;
wid = true;
sca_axe = 1;
n_pix_ext = 0;
[hax_sub, pos_axe, hei_axe, dis_asp_rat, las_pix, rat_wid] = tight_subplot_gen(n_row, n_col, ...
    gap_ver_row, gap_hor_row_col, mar_bot, mar_top, mar_lef, mar_rig, asp_rat_axe, fig_wid, ...
    fig_hei, wid, sca_axe, n_pix_ext);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
mar_siz = 200;
%
hax = hax_sub(1);
log_cel_non = log_cel.(fie).srt.non;
gre = 0.1;
tra = 0.1;
scatter3(hax, x_pix(log_cel_non), y_pix(log_cel_non), z_pix(log_cel_non), mar_siz, [gre gre gre], ...
    'filled', 'MarkerEdgeAlpha', tra, 'MarkerFaceAlpha', tra)
hold(hax, "on")
log_cel_exc = log_cel.(fie).srt.exc;
tra = 0.7;
scatter3(hax, x_pix(log_cel_exc), y_pix(log_cel_exc), z_pix(log_cel_exc), mar_siz, 'r', 'filled', ...
    'MarkerEdgeAlpha', tra, 'MarkerFaceAlpha', tra)
hold(hax, "on")
log_cel_inh = log_cel.(fie).srt.inh;
scatter3(hax, x_pix(log_cel_inh), y_pix(log_cel_inh), z_pix(log_cel_inh), mar_siz, 'b', 'filled', ...
    'MarkerEdgeAlpha', tra, 'MarkerFaceAlpha', tra)
asp_rat = con_fil.asp_rat;
hax.PlotBoxAspectRatio = [1 asp_rat.cal.ori 1];
view(hax, -120, 30)
hax.XAxis.Visible = 'off';
hax.YAxis.Visible = 'off';
hax.ZAxis.Visible = 'off';
axis(hax, 'equal')
hax.XGrid = 'off';
hax.YGrid = 'off';
hax.ZGrid = 'off';
xc = 0;
yc = 0;
zc = 0;
w = 50;
hl = scalebar_3d(hax, xc,yc,zc, w);
%%%%%%%%%%%%%%%%%%%%%%%%%%
hax = hax_sub(2);
tra = 0.7;
scatter3(hax, x_pix(log_cel.non), y_pix(log_cel.non), z_pix(log_cel.non)...
    , mar_siz, 'k', 'filled', 'MarkerEdgeAlpha', tra, 'MarkerFaceAlpha', tra)
hold(hax, "on")
scatter3(hax, x_pix(log_cel.gab), y_pix(log_cel.gab), z_pix(log_cel.gab)...
    , mar_siz, 'm', 'filled', 'MarkerEdgeAlpha', tra, 'MarkerFaceAlpha', tra)
hax.PlotBoxAspectRatio = [1 asp_rat.cal.ori 1];
view(hax, -120, 30)
hax.XAxis.Visible = 'off';
hax.YAxis.Visible = 'off';
hax.ZAxis.Visible = 'off';
axis(hax, 'equal')
hax.XGrid = 'off';
hax.YGrid = 'off';
hax.ZGrid = 'off';
hl = scalebar_3d(hax, xc,yc,zc, w);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
set(h_fig.Children, 'Units', 'pixels')
h_fig.Position(3) = las_pix;
h_fig.Renderer = 'painters';
h_fig.PaperSize(1) = rat_wid*h_fig.PaperSize(1);
h_fig.PaperUnits = 'normalized';
h_fig.PaperPosition = [0 0 1 1];
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% cel onl
function h_fig = plo_inh_exc_spa(dis_blo, fra_blo_ani)
n_row = 2;
n_col = 2;
gap_ver_row = 0.030*ones(n_row, 1);
gap_hor_ave = 0.030;
gap_hor_col = gap_hor_ave;
gap_hor_row_col = repmat(gap_hor_col, n_row, n_col);
mar_bot = 0.050;
mar_top = 0.040;
mar_lef = 0.043;
mar_rig = 0.000;
asp_rat_bar = 0.5;
asp_rat_axe = asp_rat_bar*ones(n_row*n_col, 1);
[h_fig, wid_mon, hei_mon] = fig;
wid = false;
sca_axe = ones(n_row*n_col, 1);
n_pix_ext = 30;
[hax_sub, ~, ~, ~, las_pix, rat_wid] = tight_subplot_gen(n_row, n_col, gap_ver_row, gap_hor_row_col...
    , mar_bot, mar_top, mar_lef, mar_rig, asp_rat_axe, wid_mon, hei_mon, wid, sca_axe, n_pix_ext);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% linkaxes(hax_sub, 'y')
% linkaxes([hax_sub(1) hax_sub(3)], 'x')
% linkaxes([hax_sub(2) hax_sub(4)], 'x')

y_min = inf;
y_max = -inf;
hax = hax_sub(1);
con_fil = matfile('\\home.ansatt.ntnu.no\kadiram\Documents\MATLAB\con_esp.mat');
plo_sha.raw(hax, dis_blo.ros_cau, fra_blo_ani.ros_cau.exc, 'k')
[y_min, y_max, hax] = adj_y(hax, y_min, y_max);
fon_siz = con_fil.fon_siz;
hax.FontSize = fon_siz.pre;
xticklabels(hax, [])
hax.XAxis.Color = 'w';
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
hax = hax_sub(3);
plo_sha.raw(hax, dis_blo.ros_cau, fra_blo_ani.ros_cau.inh, 'k')
[y_min, y_max, hax] = adj_y(hax, y_min, y_max);
%%%%%%%%%%%%%%%%%%%%
% y_lab = 'tail-modulated cells in DRN (%)';
% supAxes = [mar_lef 0 1 1];
% [ax, h] = suplabel(y_lab, 'y', supAxes);
% h.Units = 'normalized';
% h.Position(2) = 0.77;
%
hax = hax_sub(2);
plo_sha.raw(hax, dis_blo.dor_ven, fra_blo_ani.dor_ven.exc, 'k')
[y_min, y_max, hax] = adj_y(hax, y_min, y_max);
xticklabels(hax, [])
hax.XAxis.Color = 'w';
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
hax = hax_sub(4);
plo_sha.raw(hax, dis_blo.dor_ven, fra_blo_ani.dor_ven.inh, 'k')
[y_min, y_max, hax] = adj_y(hax, y_min, y_max);

linkaxes(hax_sub, 'y')
linkaxes([hax_sub(1) hax_sub(3)], 'x')
linkaxes([hax_sub(2) hax_sub(4)], 'x')
%%%%%%%%%%%%%%
h_fig = opt_h_fig(h_fig, las_pix, rat_wid);
end

function h_fig = plo_inh_exc_spa_all(dis_blo, fra_blo_ani)
n_dir = 2;
n_dim = 2;
n_row = n_dir;
fie_num = {'lig', 'tap', 'tai'};
n_fie = length(fie_num);
n_col = n_dim*n_fie;

% gap_ver_row = 0.040*ones(n_row, 1);
% gap_hor_ave = 0.020;
% gap_hor_col = gap_hor_ave;
% gap_hor_row_col = repmat(gap_hor_col, n_row, n_col);
% mar_bot = 0.070;
% mar_top = 0.040;
% mar_lef = 0.070;
% mar_rig = 0.015;

gap_ver_row = 0.015*ones(n_row, 1);
gap_hor_ave = 0.010;
gap_hor_col = gap_hor_ave;
gap_hor_row_col = repmat(gap_hor_col, n_row, n_col);
mar_bot = 0.015;
hei = 2*2 + 1; % stephanie
mar_top = cal_mar_top(hei);
mar_lef = 0.020;
mar_rig = 0.001;

asp_rat_bar = 1;
asp_rat_axe = asp_rat_bar*ones(n_row*n_col, 1);
[h_fig, wid_mon, hei_mon] = fig;
wid = false;
n_sub = n_row*n_col;
sca_axe = ones(n_sub, 1);
n_pix_ext = 30;
[hax_sub, ~, ~, ~, las_pix, rat_wid] = tight_subplot_gen(n_row, n_col, gap_ver_row, gap_hor_row_col...
    , mar_bot, mar_top, mar_lef, mar_rig, asp_rat_axe, wid_mon, hei_mon, wid, sca_axe, n_pix_ext);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
dir_num = {'exc', 'inh'};
% y_lab.exc = 'Excited neurons (%)';
% y_lab.inh = 'Inhibited neurons (%)';
y_lab.exc = 'Exc. neurons (%)';
y_lab.inh = 'Inh. neurons (%)';
con_fil = matfile('\\home.ansatt.ntnu.no\kadiram\Documents\MATLAB\con_esp.mat');
fon_siz = con_fil.fon_siz;
for row = 1:n_row
    for col = 1:n_col
        sub = (row - 1)*n_col + col;
        hax = hax_sub(sub);
        num_fie = ceil(col/n_dim);
        if rem(col, 2) == 1
            x_dim = 'ros_cau';
            x_lab = {'P', 'A'};
        else
            x_dim = 'dor_ven';
            x_lab = {'V', 'D'};
        end
        fra_bin_ani = fra_blo_ani.(fie_num{num_fie}).(x_dim).(dir_num{row});
        fra_ani.low = mean(fra_bin_ani(1:2, :), 1);
        fra_ani.hig = mean(fra_bin_ani(end - 1:end, :), 1);
        p = signrank(fra_ani.low, fra_ani.hig);
        plo_sha.raw(hax, dis_blo.(x_dim), fra_bin_ani, 'k')
        xlim(hax, [0 100])
        ylim(hax, [0 100])
        if row == 1
            hax.XAxis.Visible = "off";
        else
            hax.XTick = [0 100];
            hax.XTickLabel = x_lab;
        end
        if col > 1
            hax.YAxis.Visible = "off";
        else
            hax.YLabel.String = y_lab.(dir_num{row});
        end
        adj_hax(hax, fon_siz.pub)
    end
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
h_fig = opt_h_fig(h_fig, las_pix, rat_wid);
end

function h_fig = plo_res(x_ani_pix, y_ani_pix, z_ani_pix, clu_pix, vie_ang_dir)
% fie .srt !!!
[h_fig, fig_wid, fig_hei] = fig_mac;
%[h_fig, fig_wid, fig_hei] = fig;
con_fil = matfile('\\home.ansatt.ntnu.no\kadiram\Documents\MATLAB\con_esp.mat');
n_row = 1;
n_col = 1;
gap_ver_row = 0.000*ones(n_row, 1);
gap_hor = 0.000;
gap_hor_row_col = gap_hor*ones(n_row, n_col);
mar_bot = 0.000;
mar_top = 0.000;
mar_lef = 0.000;
mar_rig = 0.000;
asp_rat = con_fil.asp_rat;
asp_rat_axe = asp_rat.cal.ori*ones(n_row*n_col, 1);
wid = false;
sca_axe = ones(n_row*n_col, 1);
n_pix_ext = 0;
[hax_sub, pos_axe, hei_axe, dis_asp_rat, las_pix, rat_wid] = tight_subplot_gen(n_row, ...
    n_col, gap_ver_row, gap_hor_row_col, mar_bot, mar_top, mar_lef, mar_rig, ...
    asp_rat_axe, fig_wid, fig_hei, wid, sca_axe, n_pix_ext);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
piv_col_pcx = con_fil.piv_col_pcx;
x_pix = vertcat(x_ani_pix{:});
y_pix = vertcat(y_ani_pix{:});
z_pix = vertcat(z_ani_pix{:});

% x_lim = [min(x_pix) max(x_pix)];
% y_lim = [min(y_pix) max(y_pix)];
% z_lim = [min(z_pix) max(z_pix)];

log_gre = clu_pix == 2;
hax = hax_sub(1);
%mar_siz = con_fil.mar_siz;
%mar_siz = mar_siz.cel;
mar_siz = 100;
gre = 0.1;
tra = 0.1;
scatter3(hax, x_pix(log_gre), y_pix(log_gre), z_pix(log_gre), mar_siz, [gre gre gre], 'filled', ...
    'MarkerEdgeAlpha', tra, 'MarkerFaceAlpha', tra)

hold(hax, "on")
x_pix(log_gre) = [];
y_pix(log_gre) = [];
z_pix(log_gre) = [];
clu_pix(log_gre) = [];
tra = 0.7;
scatter3(hax, x_pix, y_pix, z_pix, mar_siz, clu_pix, 'filled', 'MarkerEdgeAlpha', tra, ...
    'MarkerFaceAlpha', tra)
hax.PlotBoxAspectRatio = [1 asp_rat.cal.ori 1];
colormap(hax, piv_col_pcx.div)
axis(hax, 'equal')
% hax.XLim = x_lim;
% hax.YLim = y_lim;
% hax.ZLim = z_lim;
view(hax, vie_ang_dir(1), vie_ang_dir(2))
hax.XAxis.Visible = 'off';
hax.YAxis.Visible = 'off';
hax.ZAxis.Visible = 'off';
hax.XGrid = 'off';
hax.YGrid = 'off';
hax.ZGrid = 'off';
hold(hax, "on")
xc = 0;
yc = 0;
zc = 0;
w = 50;
hl = scalebar_3d(hax, xc,yc,zc, w);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
h_fig = opt_h_fig(h_fig, las_pix, rat_wid);
end

function h_fig = plo_clu(ioi_kxx_ani, ioi_shu_kxx_ani, del_ioi_kxx_ani)
[h_fig, fig_wid, fig_hei] = fig;
con_fil = matfile('\\home.ansatt.ntnu.no\kadiram\Documents\MATLAB\con_esp.mat');
n_row = 1;
n_col = 2;

% gap_ver_row = 0.050*ones(n_row, 1);
% gap_hor = 0.000;
% gap_hor_row_col = gap_hor*ones(n_row, n_col);
% mar_bot = 0.080;
% mar_top = 0.030;
% mar_lef = 0.070;
% mar_rig = 0.000;

gap_ver_row = 0.000*ones(n_row, 1);
gap_hor = 0.025;
gap_hor_row_col = gap_hor*ones(n_row, n_col);
mar_bot = 0.030;
hei = 4;
mar_top = cal_mar_top(hei);
mar_lef = 0.030;
mar_rig = 0.000;

asp_rat = con_fil.asp_rat;
asp_rat_axe = asp_rat.sig.sho*ones(n_row*n_col, 1);
wid = false;
sca_axe = ones(n_row*n_col, 1);
n_pix_ext = 0;
[hax_sub, pos_axe, hei_axe, dis_asp_rat, las_pix, rat_wid] = tight_subplot_gen(n_row, ...
    n_col, gap_ver_row, gap_hor_row_col, mar_bot, mar_top, mar_lef, mar_rig, ...
    asp_rat_axe, fig_wid, fig_hei, wid, sca_axe, n_pix_ext);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
linkaxes(hax_sub, 'x')
n_kxx = con_fil.n_kxx;
kxx_clu = (1:n_kxx)';
gre = con_fil.gre;

hax = hax_sub(1);
h_dat = plo_sha.raw(hax, kxx_clu, ioi_kxx_ani, 'k');
hold(hax, 'on')
h_shu = plo_sha.raw(hax, kxx_clu, ioi_shu_kxx_ani, gre);
hax.Box = 'off';
y_lab = ['intra-cluster D/' newline 'inter-cluster D'];
ylabel(hax, y_lab)
xlabel(hax, 'k-means clusters')
hax.YLim(2) = 1;

lin_wid = con_fil.lin_wid;
lin_wid = lin_wid.one;
hax = hax_sub(2);
[~, ind_var_pea] = plo_sha.raw(hax, kxx_clu, del_ioi_kxx_ani, 'k');
opt_k_sam = ind_var_pea;
hax.YTickLabelMode = 'auto';
hax.YLimMode = 'auto';
hax.Box = 'off';
y_lab = ['\Delta of intra-cluster D/' newline 'inter-cluster D'];
ylabel(hax, y_lab)
hax.XLim(1) = 0;
hax.XTick = [ind_var_pea n_kxx];
hax.XTickLabelMode = 'auto';
xlabel(hax, 'k-means clusters')
hax.YLim(1) = 0;
%
hax = hax_sub(1);
xline(hax, opt_k_sam, 'Color', 'black', 'LineWidth', lin_wid, 'LineStyle', '--')
% leg = legend(hax, [h_dat h_shu], 'data', 'shuffled');
% leg.Box = 'off';
%hax.XAxis.Visible = 'off';
fon_siz = con_fil.fon_siz;
hax = adj_hax(hax, fon_siz.pub);

leg = legend(hax, [h_dat h_shu], 'data', 'shuffled');
leg.Box = 'off';
%
hax = hax_sub(2);
xline(hax, opt_k_sam, 'Color', 'black', 'LineWidth', lin_wid, 'LineStyle', '--')
hax = adj_hax(hax, fon_siz.pub);
end

function h_fig = plo_clu_fid(clu_fid_ani)
[h_fig, fig_wid, fig_hei] = fig;
con_fil = matfile('\\home.ansatt.ntnu.no\kadiram\Documents\MATLAB\con_esp.mat');
n_row = 1;
n_col = 1;
gap_ver_row = 0.005*ones(n_row, 1);
gap_hor_row_col = 0.030*ones(n_row, n_col);

% mar_bot = 0.040;
% mar_top = 0.040;
% mar_lef = 0.040;
% mar_rig = 0.000;

mar_bot = 0.035;
hei = 3.5;% ewelina
mar_top = cal_mar_top(hei);
mar_lef = 0.018;
mar_rig = 0.000;

asp_rat_axe = 0.5;
wid = false;
sca_axe = ones(n_row*n_col, 1);
n_pix_ext = 200;
[hax_sub, pos_axe, hei_axe, dis_asp_rat, las_pix, rat_wid] = tight_subplot_gen(n_row, n_col, ...
    gap_ver_row, gap_hor_row_col, mar_bot, mar_top, mar_lef, mar_rig, asp_rat_axe, fig_wid, ...
    fig_hei, wid, sca_axe, n_pix_ext);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
hax = hax_sub(1);
var_win_con_sam_uni{1, 1}{1} = clu_fid_ani.dat;
var_win_con_sam_uni{1, 2}{1} = clu_fid_ani.shu;
ind_win = 1;
ind_sin_sam = 1;
mar_siz = con_fil.mar_siz;
col_sam_con{1, 1} = [0 0 0];
col_sam_con{1, 2} = [0 0 0];
h_plo = plo_dat_err_xco(hax, var_win_con_sam_uni, ind_win, ind_sin_sam, mar_siz.pre, col_sam_con);
p_xco = com_p_xco(clu_fid_ani.dat, clu_fid_ani.shu);

groups = {[1, 2]};
off_non = 0.070;
mou = 0.030;
sep = off_non + mou + 0.040;
ext_hei = -(sep + mou);
fon_siz = con_fil.fon_siz;
%
hax = hax_sub(1);
y_lim_pre = ylim(hax);
[H, y_lim] = sigstar_lim(hax, groups, fon_siz.non, off_non, y_lim_pre, sep, mou, ext_hei, ...
    p_xco.srt);
y_min = inf;
y_max = -inf;
[y_min, y_max, hax] = adj_y(hax, y_min, y_max);
hax.XTick = [1 2];
hax.XTickLabel = {'data','shuffled'};
ylabel(hax, 'cluster fidelity (%)')
log_lin_wid = true;
hax = adj_hax(hax, fon_siz.pub, mar_siz.pub, log_lin_wid);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
set(h_fig.Children, 'Units', 'pixels')
h_fig.Position(3) = las_pix;
h_fig.Renderer = 'painters';
h_fig.PaperSize(1) = rat_wid*h_fig.PaperSize(1);
h_fig.PaperUnits = 'normalized';
h_fig.PaperPosition = [0 0 1 1];
end

function h_fig = plo_cor_cor(r_pai)
con_fil = matfile('\\home.ansatt.ntnu.no\kadiram\Documents\MATLAB\con_esp.mat');
n_row = 1;
n_col = 1;
gap_ver = 0.050;
gap_ver_row = gap_ver*ones(n_row, 1);
gap_hor_ave = 0.025;
gap_hor_col = gap_hor_ave*ones(1, n_col);
gap_hor_row_col = repmat(gap_hor_col, n_row, n_col);
mar_bot = 0.070;
mar_top = 0.070;
mar_lef = 0.055;
mar_rig = 0.003;
asp_rat_bar = 1;
asp_rat_axe = asp_rat_bar;
[h_fig, wid_mon, hei_mon] = fig;
wid = false;
sca_axe = ones(1, n_row*n_col);
n_pix_ext = 10;
[hax_sub, pos_axe, axh, dis_asp_rat, las_pix, rat_wid] = tight_subplot_gen...
    (n_row, n_col, ...
    gap_ver_row, gap_hor_row_col, mar_bot, mar_top, mar_lef, mar_rig, asp_rat_axe, wid_mon, ...
    hei_mon, wid, sca_axe, n_pix_ext);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
hax = hax_sub(1);
h_plo = scatter(hax, r_pai.two.shu, r_pai.one.shu, 'Marker', 'o', 'MarkerEdgeColor', con_fil.gre, ...
    'MarkerFaceColor', con_fil.gre);
hold(hax, 'on')
h_plo = scatter(hax, r_pai.two.dat, r_pai.one.dat, 'Marker', 'o', 'MarkerEdgeColor', 'k', ...
    'MarkerFaceColor', 'k');
hax.XAxis.Visible = false;
hax.YAxis.Visible = false;
end

function h_fig = plo_cor_cor_den(r_pai)
con_fil = matfile('\\home.ansatt.ntnu.no\kadiram\Documents\MATLAB\con_esp.mat');
n_row = 1;
n_col = 1;
gap_ver = 0.000;
gap_ver_row = gap_ver*ones(n_row, 1);
gap_hor_ave = 0.000;
gap_hor_col = gap_hor_ave*ones(1, n_col);
gap_hor_row_col = repmat(gap_hor_col, n_row, n_col);
mar_bot = 0.000;
mar_top = 0.000;
mar_lef = 0.000;
mar_rig = 0.000;
asp_rat_bar = 1;
asp_rat_axe = asp_rat_bar;
% [h_fig, wid_mon, hei_mon] = fig;
[h_fig, wid_mon, hei_mon] = fig_mac;
wid = false;
sca_axe = ones(1, n_row*n_col);
n_pix_ext = 10;
[hax_sub, pos_axe, axh, dis_asp_rat, las_pix, rat_wid] = tight_subplot_gen...
    (n_row, n_col, ...
    gap_ver_row, gap_hor_row_col, mar_bot, mar_top, mar_lef, mar_rig, asp_rat_axe, wid_mon, ...
    hei_mon, wid, sca_axe, n_pix_ext);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
hax = hax_sub(1);
h_plo = scatter(hax, r_pai.two.shu, r_pai.one.shu, 'Marker', 'o', 'MarkerEdgeColor', con_fil.gre, ...
    'MarkerFaceColor', con_fil.gre);
hold(hax, 'on')
% h_plo = scatter(hax, r_pai.two.dat, r_pai.one.dat, 'Marker', 'o', 'MarkerEdgeColor', 'k', ...
%     'MarkerFaceColor', 'k');
mar_siz = con_fil.mar_siz;
mar_siz = mar_siz.pre;
h_plo = plo_spa_den(hax, r_pai.two.dat, r_pai.one.dat, mar_siz);
h_plo.Marker = 'o';
hax.XLim = [-1 1];
hax.YLim = [-1 1];
hax.XAxis.Visible = false;
hax.YAxis.Visible = false;
end
