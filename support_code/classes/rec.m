classdef rec
    properties
        tem% temp?
        ani
        sti
        age
        dru
        % titles
        tit
        tit_spo_bou
        tit_rec
        tit_con
        %
        fil_pat_exp
        fil_pat_ima_fis
        fil_pat_tai
        tai
        factor_meter
        %
        fil_pat_ima_cal % aligned
        fil_pat_met_cal
        pro_dir
        pro_dir_tem
        fil_pat_csv
        %
        neu_ref_dur
        bas_dur_neu
        res_dur_neu
        %
        man_ver
        fil_pat_rec
        fil_pat_dff
        ali
        sourceP
        iniStruct
        y_mid
        %
        fil_pat_eth
        fil_pat_mas
        fra_rat_jso
        %
        mph_tai
        fra_mph_mpp
        %
        pri_com_hea
        pri_com_ope
        pri_com_mou
        pri_com_eye
        %
        hea_per_pro
        min_hea_rat
        max_hea_rat
        %
        ope_per_pro
        ope_per_wid_min
        max_obf
        ope_per_dec
        ope_per_wid_max
        ope_dir
        %
        mou_per_pro
        max_mbf
        mou_dir
        %
        max_ebf
        min_thr
        %
        col_tai
        col_hea
        col_ope
        col_mou
        col_eye
        col_rob
        %
        col_tai_sig
        col_hea_sig
        col_ope_sig
        col_mou_sig
        col_eye_sig
        %
        col_dru
        col_sti
        col_spo_bou_ons
        fon_siz_num
        %
        fil_pat_fig_eth
        fil_pat_fig_eth_nox_spo
        fil_pat_fig_mat_eth
        fil_pat_fig_ang
        fil_pat_fig_ang_tap
        fil_pat_fig_spe_tap
        fil_pat_fig_ang_cor
        fil_pat_fig_lat % latency
        fil_pat_fig_map
        fil_pat_fig_pro
        fil_pat_beh_fig
        fil_pat_beh_fig_con
        fil_pat_fig_cor
        fil_pat_fig_cor_str
        fil_pat_fig_per_act_neu
        fil_pat_fig_dev
        fil_pat_fig_n_cel
        fil_pat_fig_cro_res
        fil_pat_fig_lst
        fil_pat_fig_per_cel
        fil_pat_fig_cro_res_thr
        fil_pat_neu_fig_con
        fil_pat_neu_fig_raw_con
        fil_pat_cel_fig_con
        fil_pat_fig_neu_bou
        fil_pat_fig_sum_hab
        fil_pat_fig_sum_tel
        fil_pat_fig_sti_cel_tri
        fil_pat_fig_cor_sta
        fil_pat_fig_fir_fra
        fil_pat_fig_dec
        fil_pat_fig_dec_dff
        fil_pat_fig_dec_ong
        %
        fil_pat_vid
        %
        col_rat_ave
        col_sti_ave
        bas_dur_beh
        %
        fil_pat_neu_fig_spo_bou
        fil_pat_neu_fig_spo_bou_ave
        % alignment
        blockLength
        referenceSize
        %%%%%%%%%%%%%%% cell detection
        spo
        mov_blo
        detectionTimepoint
        windowSize
        windowStep
        confPath
        confPath_ali
        targetP
        n_chu
        % baseline computation
        fil_pat_roi_t_hab_chu_pla
        fil_pat_roi_t_hab_int_pla
        fil_pat_roi_t_tel_chu
        fil_pat_roi_t
        % event detection
        dur_mer_fra
        dur_del_fra
        fil_pat_num_eve_con
        %
        fon_siz_bou
        nor_y_bou
        %
        tap_pre
        %
        y_lab_ang
        y_lab_spe
        % errors
        n_fra_rob
        %
        col_con
        n_tri_thr_int
        n_tri_sti
        tri_num_tri_int
        int_cro
        log_int
        n_int
        sta_con
        % dev
        n_typ_tot
        chu_num_cro % [nan; nan; 2]
        col_cod
        %
        cel_det
        ali_cax
        sta
        bas % debug
        bri
        %
        rem_cel_num
        %%%%%%%%%%%%%%%%%%%%%%%%%%
        tif_dir_pla
        tif_dir_red_pla
        tif_fil_pla
        n_fra_tot
        n_col_ini
        %
        fil_pat_fig_res_map
        fil_pat_fig_ras_map
        fil_pat_fig_ras_map_sub
        fil_pat_fig_clu_map
        %
        exp
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% axo
        fil_pat_ima_cal_pla
        fil_pat_ima_cal_red_pla
        fil_pat_ima_cal_blu_pla
        fil_pat_ima_cal_glu_pla
        fil_pat_fig_neu_axo
        fil_pat_fig_ses
        fil_pat_fig_roi
        fil_pat_fig_blu
        fil_pat_fig_z_sco
        fil_pat_fig_cor_map
        fil_pat_fig_icx_res
        per_bin_edg
        % onl
        fil_pat_fig_loa_map
        fil_pat_fig_loa_map_ses
        fil_pat_fig_com_res
        fil_pat_fig_pix_res
        fil_pat_fig_inh_exc_sig_con
        fil_pat_fig_exc_inh_sig_con
        fil_pat_fig_exc_inh_sig_tes_con
        fil_pat_fig_inh_exc_map
        fil_pat_fig_tai_com
        fil_pat_fig_tai_com_dor
        fil_pat_fig_tai_com_ven
        fil_pat_fig_bou_ave
        fil_pat_fig_bou_ave_pix
        fil_pat_fig_clu_map_pix
        fil_pat_fig_cor_del
        % gab
        thr_gab
        fil_pat_res
        % glia
        fil_pat_bin_pla
        %
        boo_tri_con
        vir_spe_thr
        vir_spe_new
        %
        fil_pat_two_pla
        yak
        fis_spe_pro% fish speed problem
        sui_fil
    end
    methods
        function obj = spe(obj)
            con_fil = matfile('\\home.ansatt.ntnu.no\kadiram\Documents\MATLAB\con_esp.mat');
            log_tri_con = con_fil.log_tri_con;
            obj.boo_tri_con = log_tri_con.vrs;
            roo_dir_tem = "W:\temp";
            if obj.tem
                roo_dir = roo_dir_tem;
            else
                roo_dir = "X:";
            end
            raw_dir = strcat(roo_dir, "\kadiram\Data\Raw\", obj.ani);
            if obj.yak
                raw_dir = strcat("W:\kadir\raw\", obj.ani);
            end

            obj.fil_pat_exp = strcat(raw_dir, "\tap.mat");
            n_pla = con_fil.n_pla;
            if obj.exp == "g2r" || obj.exp == "spo" || obj.exp == "exp"
                obj.fil_pat_bin_pla = cell(n_pla.neu.raw, 1);
                obj.fil_pat_two_pla = cell(n_pla.neu.raw, 1);
                % wor_dir = strcat("D:\Kadir\raw\", obj.ani);
                wor_dir = strcat("W:\Kadir\raw\", obj.ani);
                wor_dir_con = dir(wor_dir);
                cha_wor_dir = char(wor_dir);
                ind_dat_rec = 1;
                dat_rec = wor_dir_con(ind_dat_rec).name;
                dat_rec_dir = [cha_wor_dir '\' dat_rec];
                con_dat_rec_dir = dir(dat_rec_dir);
                tar_dir = [dat_rec_dir '\' con_dat_rec_dir(3).name '\'];
                for pla = 1:n_pla.neu.raw
                    obj.fil_pat_bin_pla{pla} = strcat(tar_dir, "plane", string(pla - 1), ...
                        "\data", ".bin");
                    obj.fil_pat_two_pla{pla} = strcat(tar_dir, "plane", string(pla - 1), ...
                        "\data_chan2", ".bin");
                end
            end
            if exist(raw_dir, 'dir')
                raw_dir_con = dir(raw_dir);
                ind_dat_rec = 3;
                while length(raw_dir_con(ind_dat_rec).name) ~= 10
                    ind_dat_rec = ind_dat_rec + 1;
                end
                cha_raw_dir = char(raw_dir);
                dat_rec = raw_dir_con(ind_dat_rec).name;
                dat_rec_dir = [cha_raw_dir '\' dat_rec];
                con_dat_rec_dir = dir(dat_rec_dir);
                %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
                obj.sourceP = [dat_rec_dir '\' con_dat_rec_dir(3).name '\'];
                obj.targetP = [obj.sourceP 'aligned\'];
                obj.fil_pat_res = [obj.sourceP 'suite2p\results.mat'];
                
                %%%%%%%%%%%%%%%% gab, explant
                if obj.exp == "gab" || obj.exp == "g2r" || obj.exp == "spo" || obj.exp == "exp"
                    if obj.exp == "gab" || obj.exp == "g2r"
                        obj.targetP = [obj.sourceP 'suite2p\'];
                    elseif obj.exp == "spo" || obj.exp == "exp"
                        obj.targetP = ['W:\kadir\raw\' char(obj.ani) '\suite2p\'];
                        if exist(obj.targetP, 'dir') == 0
                            mkdir(obj.targetP)
                        end
                    end
                    obj.fil_pat_met_cal = strcat(obj.targetP, "metadata.mat");
                    obj.fil_pat_ima_cal_pla = cell(n_pla.neu.raw, 1);
                    obj.fil_pat_ima_cal_red_pla = cell(n_pla.neu.raw, 1);
                    fun_pla = con_fil.fun_pla;
                    for i = fun_pla.raw
                        pla_dir = strcat(obj.targetP, "plane", string(i - 1));
                        if exist(pla_dir, 'dir') == 0
                            mkdir(pla_dir)
                        end
                        obj.fil_pat_ima_cal_pla{i, 1} = strcat(obj.targetP, "plane", string(i - 1), ...
                            "\pla_", string(i), ".mat");
                        obj.fil_pat_ima_cal_red_pla{i, 1} = strcat(obj.targetP, "plane", string(i ...
                            - 1), "\red_pla_", string(i), ".mat");
                    end
                    obj.confPath = ...
                    ['\\home.ansatt.ntnu.no\kadiram\Documents\Resources\Cell_detection' ...
                    '\gabConfig.json'];
                elseif isempty(obj.exp)
                    obj.exp = "sha_abl";
                    obj.confPath = ...
                    ['\\home.ansatt.ntnu.no\kadiram\Documents\Resources\Cell_detection' ...
                    '\exampleConfig.json'];
                end

                ani_ima = dir([cha_raw_dir '\*_0.mat']);
                obj.fil_pat_ima_fis = convertCharsToStrings([cha_raw_dir '\' ani_ima.name]);
                tai_dat = dir([cha_raw_dir '\Rob*']);
                obj.fil_pat_tai = convertCharsToStrings([cha_raw_dir '\' tai_dat.name]);
                %
                obj.fil_pat_met_cal = strcat(obj.targetP, "metadata.mat");
                if isfile(obj.fil_pat_met_cal)
                    obj.factor_meter = ext_factor_meter(obj.fil_pat_met_cal);
                end
                confFile = dir([obj.sourceP '*.ini']);
                obj.iniStruct = ini2struct([obj.sourceP confFile.name]);
                obj.iniStruct = obj.iniStruct.x_;
                exp_var = regexprep(obj.iniStruct.experiment_name_, '["]', '');
                obj.fil_pat_ima_cal = strcat(obj.targetP, "alignment_plane1\", ...
                    convertCharsToStrings(exp_var), "_plane_1.mat");
                obj.confPath_ali = ...
                    ['\\home.ansatt.ntnu.no\kadiram\Documents\Resources\Cell_detection' ...
                    '\exampleConfig.json'];% for laetitia alignment
                obj.windowSize = 3;
                obj.windowStep = 1;
            end
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            obj.pro_dir = strcat(roo_dir, "\kadiram\Data\Processed\", obj.ani);
            if exist(obj.pro_dir, 'dir') == 0
                mkdir(obj.pro_dir)
            end
            obj.pro_dir_tem = strcat(roo_dir_tem, "\kadiram\Data\Processed\", obj.ani);
            if exist(obj.pro_dir_tem, 'dir') == 0
                mkdir(obj.pro_dir_tem)
            end
            obj.fil_pat_csv = strcat(obj.pro_dir, "\", obj.ani, ".csv");
            %
            obj.fil_pat_rec = strcat(obj.pro_dir, "\tap.mat");
            obj.fil_pat_vid = strcat(obj.pro_dir, "\vid.mp4");
            obj.tit = strcat(obj.dru, " ", obj.ani, " ", obj.sti);
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            obj.n_chu = length(obj.mov_blo) + 1; % if unstable, no movement point
            obj.n_int = length(obj.log_int);
            %
            if obj.n_chu == 1
                obj.fil_pat_roi_t = ...
                    strcat(obj.targetP, "celldetection_for\celldetection_plane1\roi_t.mat");
            end
            obj.col_cod = '\DeltaF/F (%)';
            obj.col_sti = 'magenta';
            obj.col_spo_bou_ons = 'green';
            %%%%%%%% STARTING FROM TPH2 DATA !!!!!!!!!!!!!!!!!
            obj.bas_dur_neu = 5;
            obj.res_dur_neu = 5;
            %%%%%%
            if isempty(obj.bas)
                obj.bas = false;
            end
            if isempty(obj.bri)
                obj.bri = false;
            end
            obj.vir_spe_new = false;
            if obj.exp == "spo"
                obj.vir_spe_thr = 0;
            else
                obj.vir_spe_thr = 0.1;% only for esp269 & esp273 in rec_fun 11.06.25
            end
        end
        function obj = spe_axo(obj)
            raw_dir = strcat("X:\kadiram\Data\Raw\", obj.ani);
            obj.fil_pat_exp = strcat(raw_dir, "\tap.mat");
            roo_dir_tem = "W:\temp";
            %%%%%%%%%%%%
            % obj.fil_pat_bin_pla = cell(n_pla.neu.raw, 1);
            % wor_dir = strcat("D:\Kadir\raw\", obj.ani);
            % wor_dir_con = dir(wor_dir);
            % cha_wor_dir = char(wor_dir);
            % ind_dat_rec = 1;
            % dat_rec = wor_dir_con(ind_dat_rec).name;
            % dat_rec_dir = [cha_wor_dir '\' dat_rec];
            % con_dat_rec_dir = dir(dat_rec_dir);
            % tar_dir = [dat_rec_dir '\' con_dat_rec_dir(3).name '\'];
            % for pla = 1:n_pla.neu.raw
            %     obj.fil_pat_bin_pla{pla, 1} = strcat(tar_dir, "plane", string(pla - 1), ...
            %         "\data", ".bin");
            % end
            %
            if exist(raw_dir, 'dir')
                raw_dir_con = dir(raw_dir);
                cha_raw_dir = char(raw_dir);
                ind_dat_rec = 3;
                while raw_dir_con(ind_dat_rec).isdir == 0
                    ind_dat_rec = ind_dat_rec + 1;
                end
                dat_rec = raw_dir_con(ind_dat_rec).name;
                dat_rec_dir = [cha_raw_dir '\' dat_rec];
                con_dat_rec_dir = dir(dat_rec_dir);
                obj.sourceP = [dat_rec_dir '\' con_dat_rec_dir(3).name '\'];
                obj.targetP = [obj.sourceP 'suite2p\'];
                if exist(obj.targetP, 'dir') == 0
                    mkdir(obj.targetP)
                end
                %
                obj.fil_pat_met_cal = strcat(obj.targetP, "metadata.mat");
                confFile = dir([obj.sourceP '*.ini']);
                obj.iniStruct = ini2struct([obj.sourceP confFile.name]);
                obj.iniStruct = obj.iniStruct.x_;
                obj.y_mid = (str2double(obj.iniStruct.y_fov_)*10^6)/2;
                %
                ani_ima = dir([cha_raw_dir '\*_0.mat']);
                obj.fil_pat_ima_fis = convertCharsToStrings([cha_raw_dir '\' ani_ima.name]);
                tai_dat = dir([cha_raw_dir '\Rob*']);
                obj.fil_pat_tai = convertCharsToStrings([cha_raw_dir '\' tai_dat.name]);
                %
                obj.fil_pat_met_cal = strcat(obj.targetP, "metadata.mat");
                if isfile(obj.fil_pat_met_cal)
                    obj.factor_meter = ext_factor_meter(obj.fil_pat_met_cal);
                end
                con_fil = matfile('\\home.ansatt.ntnu.no\kadiram\Documents\MATLAB\con_esp.mat');
                n_pla = con_fil.n_pla;
                obj.tif_dir_pla = cell(n_pla.neu.raw, 1);
                obj.fil_pat_ima_cal_pla = cell(n_pla.neu.raw, 1);
                obj.fil_pat_ima_cal_blu_pla = cell(n_pla.neu.raw, 1);
                obj.fil_pat_ima_cal_glu_pla = cell(n_pla.neu.raw, 1);
                fun_pla = con_fil.fun_pla;
                for i = fun_pla.raw
                    pla_dir = strcat(obj.targetP, "plane", string(i - 1));
                    if exist(pla_dir, 'dir') == 0
                        mkdir(pla_dir)
                    end
                    obj.tif_dir_pla{i, 1} = strcat(obj.targetP, "plane", string(i - 1), "\reg_tif");
                    obj.fil_pat_ima_cal_pla{i, 1} = strcat(obj.targetP, "plane", string(i - 1), ...
                        "\pla_", string(i), ".mat");
                    obj.fil_pat_ima_cal_blu_pla{i, 1} = strcat(obj.targetP, "plane", string(i - 1), ...
                        "\blu_pla_", string(i), ".mat");
                    obj.fil_pat_ima_cal_glu_pla{i, 1} = strcat(obj.targetP, "plane", string(i - 1), ...
                        "\glu_pla_", string(i), ".mat");
                end
                obj.confPath_ali = ...
                    ['\\home.ansatt.ntnu.no\kadiram\Documents\Resources\Cell_detection' ...
                    '\exampleConfig.json'];
                obj.confPath = ['\\home.ansatt.ntnu.no\kadiram\Documents\from\anh_tuan\' ...
                    'exampleConfig_adaptedAO.json'];
                
                % !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
                % obj.confPath = ...
                %     ['\\home.ansatt.ntnu.no\kadiram\Documents\Resources\Cell_detection' ...
                %     '\gabConfig.json'];

                obj.windowSize = 3;
                obj.windowStep = 1;
            end
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            obj.pro_dir = strcat("X:\kadiram\Data\Processed\", obj.ani);
            if exist(obj.pro_dir, 'dir') == 0
                mkdir(obj.pro_dir)
            end
            obj.pro_dir_tem = strcat(roo_dir_tem, "\kadiram\Data\Processed\", obj.ani);
            if exist(obj.pro_dir_tem, 'dir') == 0
                mkdir(obj.pro_dir_tem)
            end
            obj.fil_pat_rec = strcat(obj.pro_dir, "\tap.mat");
            obj.fil_pat_vid = strcat(obj.pro_dir, "\vid.mp4");
            %%%%%%%%%%%%%%%%%%
            obj.tit = strcat(obj.dru, " ", obj.ani);
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            obj.n_chu = length(obj.mov_blo) + 1; % if unstable, no movement point
            obj.n_int = length(obj.log_int);
            %
            obj.col_cod = '\DeltaF/F (%)';
            obj.col_sti = 'magenta';
            obj.col_spo_bou_ons = 'green';
            %%%%%%%% STARTING FROM TPH2 DATA !!!!!!!!!!!!!!!!!
            obj.bas_dur_neu = 5;
            obj.res_dur_neu = 5;
            %%%%%%
            if isempty(obj.bas)
                obj.bas = false;
            end
            if isempty(obj.bri)
                obj.bri = false;
            end
            obj.vir_spe_thr = 0.1;
            obj.vir_spe_new = false;
        end
        function obj = spe_gfa(obj)
            roo_dir_tem = "W:\temp";
            if obj.yak
                raw_dir = strcat("W:\kadir\raw\", obj.ani);
            else
                raw_dir = strcat("X:\kadiram\Data\Raw\", obj.ani);
            end
            obj.fil_pat_exp = strcat(raw_dir, "\tap.mat");
            con_fil = matfile('\\home.ansatt.ntnu.no\kadiram\Documents\MATLAB\con_esp.mat');
            n_pla = con_fil.n_pla;
            obj.fil_pat_bin_pla = cell(n_pla.neu.raw, 1);
            %
            % wor_dir = strcat("D:\Kadir\raw\", obj.ani);
            % wor_dir_con = dir(wor_dir);
            % cha_wor_dir = char(wor_dir);
            % ind_dat_rec = 3;
            % dat_rec = wor_dir_con(ind_dat_rec).name;
            % dat_rec_dir = [cha_wor_dir '\' dat_rec];
            % con_dat_rec_dir = dir(dat_rec_dir);
            % tar_dir = [dat_rec_dir '\' con_dat_rec_dir(3).name '\suite2p\'];
            % for pla = 1:n_pla.neu.raw
            %     obj.fil_pat_bin_pla{pla, 1} = strcat(tar_dir, "plane", string(pla - 1), ...
            %         "\data", ".bin");
            % end
            if exist(raw_dir, 'dir')
                raw_dir_con = dir(raw_dir);
                cha_raw_dir = char(raw_dir);
                ind_dat_rec = 3;
                while raw_dir_con(ind_dat_rec).isdir == 0
                    ind_dat_rec = ind_dat_rec + 1;
                end
                dat_rec = raw_dir_con(ind_dat_rec).name;
                dat_rec_dir = [cha_raw_dir '\' dat_rec];
                con_dat_rec_dir = dir(dat_rec_dir);
                obj.sourceP = [dat_rec_dir '\' con_dat_rec_dir(3).name '\'];
                obj.targetP = [obj.sourceP 'suite2p\'];
                %
                obj.fil_pat_met_cal = strcat(obj.targetP, "metadata.mat");
                confFile = dir([obj.sourceP '*.ini']);
                obj.iniStruct = ini2struct([obj.sourceP confFile.name]);
                obj.iniStruct = obj.iniStruct.x_;
                obj.y_mid = (str2double(obj.iniStruct.y_fov_)*10^6)/2;
                %
                ani_ima = dir([cha_raw_dir '\*_0.mat']);
                obj.fil_pat_ima_fis = convertCharsToStrings([cha_raw_dir '\' ani_ima.name]);
                tai_dat = dir([cha_raw_dir '\Rob*']);
                obj.fil_pat_tai = convertCharsToStrings([cha_raw_dir '\' tai_dat.name]);
                %
                obj.fil_pat_met_cal = strcat(obj.targetP, "metadata.mat");
                if isfile(obj.fil_pat_met_cal)
                    obj.factor_meter = ext_factor_meter(obj.fil_pat_met_cal);
                end
                %
                obj.tif_dir_pla = cell(n_pla.neu.raw, 1);
                obj.fil_pat_ima_cal_pla = cell(n_pla.neu.raw, 1);
                obj.fil_pat_ima_cal_blu_pla = cell(n_pla.neu.raw, 1);
                obj.fil_pat_ima_cal_glu_pla = cell(n_pla.neu.raw, 1);
                for i = 1:n_pla.neu.raw
                    obj.tif_dir_pla{i, 1} = strcat(obj.targetP, "plane", string(i - 1), "\reg_tif");
                    obj.fil_pat_ima_cal_pla{i, 1} = strcat(obj.targetP, "plane", string(i - 1), ...
                        "\pla_", string(i), ".mat");
                    obj.fil_pat_ima_cal_blu_pla{i, 1} = strcat(obj.targetP, "plane", string(i - 1), ...
                        "\blu_pla_", string(i), ".mat");
                    obj.fil_pat_ima_cal_glu_pla{i, 1} = strcat(obj.targetP, "plane", string(i - 1), ...
                        "\glu_pla_", string(i), ".mat");
                end
                %%%%%%%
                for pla = 1:n_pla.neu.raw
                    obj.fil_pat_bin_pla{pla, 1} = strcat(obj.targetP, "plane", string(pla - 1), ...
                        "\data", ".bin");
                end
            end
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            obj.pro_dir = strcat("X:\kadiram\Data\Processed\", obj.ani);
            if exist(obj.pro_dir, 'dir') == 0
                mkdir(obj.pro_dir)
            end
            obj.pro_dir_tem = strcat(roo_dir_tem, "\kadiram\Data\Processed\", obj.ani);
            if exist(obj.pro_dir_tem, 'dir') == 0
                mkdir(obj.pro_dir_tem)
            end
            obj.fil_pat_rec = strcat(obj.pro_dir, "\tap.mat");
            obj.fil_pat_dff = strcat(obj.pro_dir, "\dff.mat");
            obj.fil_pat_vid = strcat(obj.pro_dir, "\vid.mp4");
            %%%%%%%%%%%%%%%%%%
            obj.tit = strcat(obj.dru, " ", obj.ani);
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            obj.n_chu = length(obj.mov_blo) + 1; % if unstable, no movement point
            obj.fil_pat_roi_t_hab_chu_pla = cell(obj.n_chu, n_pla.neu.raw);
            obj.fil_pat_roi_t_tel_chu = cell(obj.n_chu, 1);
            obj.n_int = length(obj.log_int);
            %%%%%%%% STARTING FROM TPH2 DATA !!!!!!!!!!!!!!!!!
            obj.bas_dur_neu = 5;
            obj.res_dur_neu = 5;
            %%%%%%
            if isempty(obj.bas)
                obj.bas = false;
            end
            if isempty(obj.bri)
                obj.bri = false;
            end
        end
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% preprocessing
        function sav_rec(obj)
            save(obj.fil_pat_rec, '-v7.3')
        end
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% neural
        
        %%%%%%%%%%%%%% AXO
        function sav_ima_cal(obj)
            fun_pla = [1 3 4 5 6 7 8];
            con_fil = matfile('\\home.ansatt.ntnu.no\kadiram\Documents\MATLAB\con_esp.mat');
            microscope = 'resonant';
            readMetadata = @() getMetadata(obj.sourceP, microscope);
            sta_dev.gsk = 1.5;
            for pla = fun_pla
                im = gen_imx(obj.tif_dir_pla{pla});
                %
                mean_per_block = cal_mean_per_block(readMetadata, con_fil.blockLength, im);
                save(obj.fil_pat_ima_cal_pla{pla}, 'im', 'mean_per_block', '-v7.3')
                sav_mean_per_block.raw(mean_per_block, obj.targetP, pla);
                %
                im = imgaussfilt3(im, sta_dev.gsk);
                mean_per_block = cal_mean_per_block(readMetadata, con_fil.blockLength, im);
                save(obj.fil_pat_ima_cal_glu_pla{pla}, 'im', 'mean_per_block', '-v7.3')
                sav_mean_per_block.glu(mean_per_block, obj.targetP, pla);
            end
            metadata = readMetadata();
            save(obj.fil_pat_met_cal, 'metadata', '-v7.3')
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% piv_pla_row_col
            n_pla = con_fil.n_pla;
            piv_pla_row_col.raw = cell(n_pla.neu.raw, 1);
            piv_pla_row_col.glu = cell(n_pla.neu.raw, 1);
            for pla = fun_pla
                piv_pla_row_col.raw{pla} = ext_ref_ima.raw(obj.targetP, obj.detectionTimepoint, ...
                obj.windowSize, obj.windowStep, pla, metadata);
                piv_pla_row_col.glu{pla} = ext_ref_ima.glu(obj.targetP, obj.detectionTimepoint, ...
                obj.windowSize, obj.windowStep, pla, metadata);
            end
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            load(obj.fil_pat_exp, 'sti_ons', 'n_con', 'n_tri_con', 'fra_rat_two_pho')
            vol_rat = fra_rat_two_pho/n_pla.neu.raw;
            dff_pla_con_row_col = cell(n_pla.neu.raw, n_con);
            for pla = fun_pla
                obj_ima_cal = matfile(obj.fil_pat_ima_cal_pla{pla});% raw, not blurred
                piv_row_col_fra = obj_ima_cal.im;
                [~, ~, dff_con_row_col] = ext_pix_dat(piv_row_col_fra, sti_ons, n_con, n_tri_con, ...
                    vol_rat, obj.neu_ref_dur, obj.bas_dur_neu, obj.res_dur_neu);
                for j = 1:n_con
                    dff_pla_con_row_col{pla, j} = dff_con_row_col{j};
                end
            end
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            save(obj.fil_pat_rec, 'piv_pla_row_col', 'dff_pla_con_row_col', '-append')
        end
        function app_reg_met(obj)
            mat_fil = matfile("X:\kadiram\Data\Raw\esp247\2023_03_17\20230317_16_25_53_BS_2023-03-17_Exp4\suite2p\plane2\ops.mat");
            ops = mat_fil.ops;
            x_off_fra = double(ops.xoff)*obj.factor_meter;
            y_off_fra = double(ops.yoff)*obj.factor_meter;
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            save(obj.fil_pat_rec, 'x_off_fra', 'y_off_fra', '-append')
        end
        %%%%%%%%%%% gaba
        function sav_ima_gab(obj)
            fun_pla = [1 3 4 5 6 7 8];
            con_fil = matfile('\\home.ansatt.ntnu.no\kadiram\Documents\MATLAB\con_esp.mat');
            microscope = 'resonant';
            readMetadata = @() getMetadata(obj.sourceP, microscope);
            n_pla = con_fil.n_pla;
            piv_pla_row_col.gre = cell(n_pla.neu.raw, 1);
            piv_pla_row_col.red = cell(n_pla.neu.raw, 1);
            for pla = fun_pla
                disp(pla)
                im = gen_imx(obj.tif_dir_pla{pla});
                mean_per_block = cal_mean_per_block(readMetadata, con_fil.blockLength, im);
                save(obj.fil_pat_ima_cal_pla{pla}, 'im', 'mean_per_block', '-v7.3')
                sav_mean_per_block.raw(mean_per_block, obj.targetP, pla);
                piv_pla_row_col.gre{pla} = uint16(mean(im, 3));
                %
                im = gen_imx(obj.tif_dir_red_pla{pla});
                mean_per_block = cal_mean_per_block(readMetadata, con_fil.blockLength, im);
                save(obj.fil_pat_ima_cal_red_pla{pla}, 'im', 'mean_per_block', '-v7.3')
                sav_mean_per_block.red(mean_per_block, obj.targetP, pla);
                piv_pla_row_col.red{pla} = uint16(mean(im, 3));
            end
            metadata = readMetadata();
            save(obj.fil_pat_met_cal, 'metadata', '-v7.3')
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            save(obj.fil_pat_rec, 'piv_pla_row_col', '-append')
        end
        %%%%%%%%%%% g2r
        function sav_ima_g2r(obj)
            con_fil = matfile('\\home.ansatt.ntnu.no\kadiram\Documents\MATLAB\con_esp.mat');
            microscope = 'resonant';
            readMetadata = @() getMetadata(obj.sourceP, microscope);
            for pla = 1
                disp(pla)
                im = gen_imx(obj.tif_dir_pla{pla});
                mean_per_block = cal_mean_per_block(readMetadata, con_fil.blockLength, im);
                save(obj.fil_pat_ima_cal_pla{pla}, 'im', 'mean_per_block', '-v7.3')
                sav_mean_per_block.raw(mean_per_block, obj.targetP, pla);
                piv_row_col.gre = uint16(mean(im, 3));
                %
                im = gen_imx(obj.tif_dir_red_pla{pla});
                mean_per_block = cal_mean_per_block(readMetadata, con_fil.blockLength, im);
                save(obj.fil_pat_ima_cal_red_pla{pla}, 'im', 'mean_per_block', '-v7.3')
                sav_mean_per_block.red(mean_per_block, obj.targetP, pla);
                piv_row_col.red = uint16(mean(im, 3));
            end
            metadata = readMetadata();
            save(obj.fil_pat_met_cal, 'metadata', '-v7.3')
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            save(obj.fil_pat_rec, 'piv_row_col', '-append')
        end
        %%%%%%%%%%% gfa
        function sav_ima_gfa(obj)
            con_fil = matfile('\\home.ansatt.ntnu.no\kadiram\Documents\MATLAB\con_esp.mat');
            fun_pla = con_fil.fun_pla;
            microscope = 'resonant';
            readMetadata = @() getMetadata(obj.sourceP, microscope);
            n_pla = con_fil.n_pla;
            piv_pla_row_col = cell(n_pla.neu.raw, 1);
            for pla = fun_pla.raw
                disp(pla)
                im = gen_imx_bin(obj.fil_pat_bin_pla{pla});
                mean_per_block = cal_mean_per_block(readMetadata, con_fil.blockLength, im);
                save(obj.fil_pat_ima_cal_pla{pla}, 'im', 'mean_per_block', '-v7.3')
                sav_mean_per_block.raw(mean_per_block, obj.targetP, pla);
                piv_pla_row_col{pla} = uint16(mean(im, 3));
            end
            metadata = readMetadata();
            save(obj.fil_pat_met_cal, 'metadata', '-v7.3')
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            save(obj.fil_pat_rec, 'piv_pla_row_col', '-append')
        end
        %%%%%%%%%%% spo
        function sav_ima_spo(obj)
            con_fil = matfile('\\home.ansatt.ntnu.no\kadiram\Documents\MATLAB\con_esp.mat');
            fun_pla = con_fil.fun_pla;
            n_fra = con_fil.n_fra;
            n_fra = n_fra.cal.ses.eig.spo;
            microscope = 'resonant';
            readMetadata = @() getMetadata(obj.sourceP, microscope);
            n_pla = con_fil.n_pla;
            piv_pla_row_col.gre = cell(n_pla.neu.raw, 1);
            piv_pla_row_col.red = cell(n_pla.neu.raw, 1);
            for pla = fun_pla.raw
                disp(pla)
                im = gen_imx_bin(obj.fil_pat_bin_pla{pla}, n_fra);
                mean_per_block = cal_mean_per_block(readMetadata, con_fil.blockLength, im);
                save(obj.fil_pat_ima_cal_pla{pla}, 'im', 'mean_per_block', '-v7.3')
                sav_mean_per_block.raw(mean_per_block, obj.targetP, pla);
                piv_pla_row_col.gre{pla} = uint16(mean(im, 3));
                %
                im = gen_imx_bin(obj.fil_pat_two_pla{pla}, n_fra);
                mean_per_block = cal_mean_per_block(readMetadata, con_fil.blockLength, im);
                save(obj.fil_pat_ima_cal_red_pla{pla}, 'im', 'mean_per_block', '-v7.3')
                sav_mean_per_block.red(mean_per_block, obj.targetP, pla);
                piv_pla_row_col.red{pla} = uint16(mean(im, 3));
            end
            metadata = readMetadata();
            save(obj.fil_pat_met_cal, 'metadata', '-v7.3')
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            save(obj.fil_pat_rec, 'piv_pla_row_col', '-append')
        end
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% behavioral
        function [man_sec, ini_del] = app_syn(obj)
            [man_sec, ini_del] = ext_syn_par(obj.fil_pat_ima_fis, obj.fil_pat_exp);
            display(man_sec)
            display(ini_del)
            save(obj.fil_pat_rec, 'man_sec', 'ini_del', '-append')
        end
        function app_syn_axo(obj)
            [man_sec, ini_del] = ext_syn_par_axo(obj.fil_pat_ima_fis, obj.fil_pat_exp);
            display(man_sec)
            display(ini_del)
            save(obj.fil_pat_rec, 'man_sec', 'ini_del', '-append')
        end
        %
        function app_tai(obj)
            % averaging over 2 minute windows for the rates done at sam.
            rec_fil = matfile(obj.fil_pat_rec);
            man_sec = rec_fil.man_sec;
            ini_del = rec_fil.ini_del;
            seg_len = 1024;
            [tai_ang_fra.raw, ~, tai_ang_uni, fra_tim_uni, vir_spe_uni, fra_tim, ~, ~, fra_ind, ~] ...
                = ext_tai_dat_seg(obj.fil_pat_tai, obj.fil_pat_rec, obj.fil_pat_exp, ...
                obj.fil_pat_ima_fis, seg_len, man_sec, ini_del, obj.vir_spe_thr, obj.vir_spe_new, ...
                obj.fis_spe_pro);
            % segment
            
            % average baseline speed
            exp_fil = matfile(obj.fil_pat_exp);
            sta_tim = exp_fil.sta_tim;
            con_fil = matfile('\\home.ansatt.ntnu.no\kadiram\Documents\MATLAB\con_esp.mat');
            tim_fra = con_fil.tim_fra;
            if isprop(exp_fil, 'end_tim')
                end_tim = exp_fil.end_tim;
                tim_fra.ses = tim_fra.ani.ses.sti;
                tim_fra.neu = tim_fra.cal.eig.ses.axo;
            else
                end_tim = exp_fil.dur_spo;
                tim_fra.ses = tim_fra.ani.ses.spo;
                tim_fra.neu = tim_fra.cal.eig.ses.lon;
            end
            n_con = con_fil.n_con;
            n_tri_con = con_fil.n_tri_con;
            n_tri_con = n_tri_con.vrs;
            sti_ons_tri = con_fil.sti_ons_tri;
            sti_ons_tri = sti_ons_tri.vrs.all;
            n_epo = con_fil.n_epo;
            n_epo = n_epo.ong;
            off_ong_win = con_fil.off_ong_win;
            win_siz = 120;
            [~, ~, ave_bas_spe] = sel_sig_uni(fra_tim_uni, vir_spe_uni, sti_ons_tri(1), ...
                win_siz, 'sto');
            %
            ave_ang_epo = nan(n_epo, 1);
            for epo = 1:n_epo
                [~, ~, ave_ang_epo(epo)] = sel_sig_uni(fra_tim_uni, tai_ang_uni, off_ong_win(epo), ...
                    win_siz, 'sto');
            end
            %%%%%%%%% bea
            [tai_bea, tai_sig, tai_bea_ang] = ext_tai_bea_seg(fra_tim, obj.mph_tai, ...
                obj.fra_mph_mpp, tai_ang_fra.raw); % extraction, tai_sig: rectified tai_ang !!!
            bin_siz = 1;
            sta_dev = 1;
            [tim_bin, tai_rat, ~] = com_rat(sta_tim, end_tim, tai_bea, bin_siz, sta_dev, fra_tim);
            % tim_bin in the middle
            rat_bin_par = tai_rat;% per bin!
            %%%%%%%%%%%%%%

            % trial-based tail angle CHANGE
            fra_rat = con_fil.fra_rat;
            sta_tim = con_fil.sta_tim;
            sam_poi_uni = [nan(fra_rat.man*sta_tim, 1); tai_ang_uni];
            win_len = con_fil.win_len;
            isi = con_fil.isi;
            pha_win_len = win_len.tai;
            [~, cha_uni_poi_tri, ~, ~, ~, ~] = cal_rel_cha_uni_poi_tri(sam_poi_uni, win_len.tai, ...
                sti_ons_tri, fra_rat.man, isi, pha_win_len);
            log_fra = con_fil.log_fra;
            nta_fra_tri = cha_uni_poi_tri{1}(log_fra.tai.tri.lon, :);
            % trial averaging
            n_fra = con_fil.n_fra;
            n_sta = 2;
            nta_fra_sta_con = nan(n_fra.tai.tri.lon, n_sta, n_con);
            for i = 1:n_con
                [nta_fra_sta_con(:, 1, i), ~, ...
                    nta_fra_sta_con(:, 2, i)] = ...
                    com_sta(nta_fra_tri(:, (i - 1)*n_tri_con + 1:i*n_tri_con), 2);
            end
            n_win = con_fil.n_win;
            ave_nta_con_win = nan(n_con, n_win.tri);
            for i = 1:n_con
                ave_nta_con_win(i, :) = com_ave_amp_uni_win(tim_fra.tai.tri.lon, ...
                    reshape(nta_fra_sta_con(:, 1, i), [n_fra.tai.tri.lon 1]), win_len.tai);
            end
            %%%%%%%%%%%%%%%%%%%%%
            [bea_lat_tri, bea_ang_tri] = ext_bea_lat_tri(sti_ons_tri, tai_bea, tai_bea_ang);
            lat_thr = con_fil.lat_thr;
            [per_pro_con, log_tri_con] = com_per_pro_con(n_con, bea_lat_tri, lat_thr);
            %%%%%%%%%
            tai_bea_shu = shu_tra(tai_bea);
            bea_lat_shu = ext_bea_lat_tri(sti_ons_tri, tai_bea_shu, tai_bea_ang);
            per_pro_ani_shu = com_per_pro_ani(bea_lat_shu', lat_thr);
            %%%%%%%%%%%%%%%%%%%%%%
            bea_lat_con = nan(n_tri_con, n_con);
            for j = 1:n_con
                bea_lat_con(:, j) = bea_lat_tri((j - 1)*n_tri_con + 1:j*n_tri_con);
            end
            %
            log_nox_tri = bea_lat_tri > lat_thr;
            bea_lat_tri(log_nox_tri) = nan;
            %%%%%%%%%%%%%%%%%%%%%%%%% bou %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            bea_del = con_fil.bea_del;
            [bou_ons_bou.all, bou_off_bou.all, dur_bou.all] = ext_bou_ons(tim_bin, tai_rat, tai_bea...
                , bea_del);
            spo_bor = con_fil.spo_bor;
            n_bou.all = length(bou_ons_bou.all);
            log_bou.all = true(n_bou.all, 1);
            [spo_bou_ons, log_bou.spo] = ide_spo_bou_ons(bou_ons_bou.all, spo_bor);

            epo_num = con_fil.epo_num;
            min_sec = con_fil.min_sec;
            bou_ons_bou.vib = bou_ons_bou.all(bou_ons_bou.all >= epo_num{6}(1)*min_sec & ...
                bou_ons_bou.all < epo_num{6}(2)*min_sec);
            bou_ons_bou.non = setdiff(bou_ons_bou.all, bou_ons_bou.vib);% also spo_bou_ons!
            log_bou.vib = bou_ons_bou.all >= epo_num{6}(1)*min_sec & bou_ons_bou.all < epo_num{6}(2)...
                *min_sec;
            log_bou.non = ~log_bou.vib;
            bou_off_bou.spo = bou_off_bou.all(log_bou.spo);
            bou_off_bou.vib = bou_off_bou.all(log_bou.vib);
            bou_off_bou.non = bou_off_bou.all(~log_bou.vib);
            dur_bou.spo = dur_bou.all(log_bou.spo);
            dur_bou.vib = dur_bou.all(log_bou.vib);
            dur_bou.non = dur_bou.all(~log_bou.vib);
            %
            bou_dur.all = mean(dur_bou.all);
            bou_dur.spo = mean(dur_bou.spo);
            bou_dur.vib = mean(dur_bou.vib);
            bou_dur.non = mean(dur_bou.non);

            % for tail: averaging over the swim bout.
            n_bou.vib = length(bou_ons_bou.vib);
            n_bou.non = length(bou_ons_bou.non);
            n_bou.spo = length(spo_bou_ons);
            ang_bou.all = nan(n_bou.all, 1);
            ang_bou.vib = nan(n_bou.vib, 1);
            ang_bou.non = nan(n_bou.non, 1);
            for bou = 1:n_bou.all
                ang_bou.all(bou) = mean(tai_ang_uni(tim_fra.ses > bou_ons_bou.all(bou) & ...
                    tim_fra.ses < bou_off_bou.all(bou)));
            end
            for bou = 1:n_bou.vib
                ang_bou.vib(bou) = mean(tai_ang_uni(tim_fra.ses > bou_ons_bou.vib(bou) & ...
                    tim_fra.ses < bou_off_bou.vib(bou)));
            end
            for bou = 1:n_bou.non
                ang_bou.non(bou) = mean(tai_ang_uni(tim_fra.ses > bou_ons_bou.non(bou) & ...
                    tim_fra.ses < bou_off_bou.non(bou)));
            end
            
            tai_ang_fra.dow.raw = cal_dow(obj.fil_pat_tai, obj.fil_pat_rec, obj.fil_pat_exp, ...
                obj.fil_pat_ima_fis, seg_len, man_sec, ini_del, obj.fis_spe_pro);
            %tconst = con_fil.tau;
            %ifi = con_fil.ifi;
            %tbin = ifi.cal.eig;
            %kernellength=round(2*tconst/tbin);
            % kernel1=exp(-[0:kernellength-1]/(tconst/tbin));
            % tai_ang_fra.dow.con = conv(tai_ang_fra.dow.raw, kernel1, 'same');
            tac_tri_win = com_ave_amp_uni_win(tim_fra.tai.tri.lon, nta_fra_tri, win_len.tai);
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% spo
            [res_ons_per, res_off_per, dur_res_per] = cal_pcb_ons_bou(bou_ons_bou.all, ...
                bou_off_bou.all);
            [mrp, ind_max] = max(dur_res_per);% max_res_per
            mrp_ons = res_ons_per(ind_max);% max_res_per
            mrp_off = res_off_per(ind_max);
            spo_per_ons = mrp_ons - mrp;
            spo_per_off = mrp_ons + mrp;
            log_tai_bin = tim_bin > spo_per_ons & tim_bin < spo_per_off;
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% gfap
            max_ang_bou.non = nan(n_bou.non, 1);
            for bou = 1:n_bou.non
                max_ang_bou.non(bou) = max(tai_ang_uni(tim_fra.ses > bou_ons_bou.non(bou) & ...
                    tim_fra.ses < bou_off_bou.non(bou)));
            end
            max_ang_thr = 0.1;
            log_bou.non_hig = max_ang_bou.non > max_ang_thr;
            bou_ons_bou.non_hig = bou_ons_bou.all(log_bou.non_hig);
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% coping
            mph = 0.065;
            [tai_bea_acb, ~] = ext_tai_bea_acb(tim_fra.neu, mph, tai_ang_fra.dow.raw);
            bea_del = 0.2;
            dur_thr = 1;

            % added after gfap done
            [tim_bin_acb, tai_rat_acb, ~] = com_rat(sta_tim, end_tim, tai_bea_acb, bin_siz, ...
                sta_dev, fra_tim);

            [acb_ons_bou.all, acb_off_bou.all, dur_acb_bou.all] = ext_acb_ons(tim_bin_acb, ...
                tai_rat_acb, tai_bea_acb, bea_del);
            log_bou = dur_acb_bou.all > dur_thr;
            dur_acb_bou.all = dur_acb_bou.all(log_bou);
            acb_ons_bou.all = acb_ons_bou.all(log_bou);
            acb_off_bou.all = acb_off_bou.all(log_bou);
            acb_ons_bou.vib = acb_ons_bou.all(acb_ons_bou.all >= epo_num{6}(1)*min_sec & ...
                acb_ons_bou.all < epo_num{6}(2)*min_sec);
            acb_ons_bou.non = setdiff(acb_ons_bou.all, acb_ons_bou.vib);
            n_acb.all = length(acb_ons_bou.all);
            log_acb.all = true(n_acb.all, 1);
            log_acb.vib = acb_ons_bou.all >= epo_num{6}(1)*min_sec & acb_ons_bou.all < epo_num{6}(2)...
                *min_sec;
            log_acb.non = ~log_acb.vib;
            acb_off_bou.vib = acb_off_bou.all(log_acb.vib);
            acb_off_bou.non = acb_off_bou.all(~log_acb.vib);
            dur_acb_bou.vib = dur_acb_bou.all(log_acb.vib);
            dur_acb_bou.non = dur_acb_bou.all(~log_acb.vib);
            %
            [pcb_ons_bou.non, pcb_off_bou.non, dur_pcb_bou.non] = cal_pcb_ons_bou(acb_ons_bou.non, ...
                acb_off_bou.non);

            % 'tai_ang_uni' ('tai_ang_fra' - not uniform like Ca signal)

            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            save(obj.fil_pat_rec, 'tai_bea', 'tai_sig', 'tai_ang_uni', 'fra_tim_uni', ...
                'vir_spe_uni', ...
                'bea_lat_tri', 'bea_lat_con', 'bea_lat_shu', ...
                'per_pro_con', 'log_tri_con', 'tai_bea_ang', 'tai_bea_shu', ...
                'per_pro_ani_shu', 'tim_bin', 'rat_bin_par', ...
                'bea_ang_tri', ...
                'fra_tim', 'fra_ind', ...
                'nta_fra_sta_con', 'ave_nta_con_win', 'ave_bas_spe', ...
                'ave_ang_epo', ...
                'bou_ons_bou', 'bou_off_bou', 'dur_bou', 'spo_bou_ons', ...
                'bou_dur', 'n_bou', 'ang_bou', 'log_bou', 'tai_ang_fra', 'tac_tri_win', ...
                'res_ons_per', 'res_off_per', 'dur_res_per', ...
                'mrp', 'mrp_ons', 'mrp_off', 'log_tai_bin', ...
                'max_ang_bou', 'acb_ons_bou', 'acb_off_bou', 'dur_acb_bou', 'n_acb', 'log_acb', ...
                'pcb_ons_bou', 'pcb_off_bou', 'dur_pcb_bou', '-append')

            % rec_fil = matfile(obj.fil_pat_rec);
            % con_fil = matfile('\\home.ansatt.ntnu.no\kadiram\Documents\MATLAB\con_esp.mat');
            % tconst = con_fil.tau;
            % ifi = con_fil.ifi;
            % tbin = ifi.man;
            % kernellength=round(2*tconst/tbin);
            % kernel1=exp(-[0:kernellength-1]/(tconst/tbin));%exponentially decaying kernel
            % tai_ang_fra = rec_fil.tai_ang_fra;
            % tai_ang_uni = rec_fil.tai_ang_uni;
            % tai_ang_fra.con = conv(tai_ang_uni, kernel1, 'same');
            % %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            % save(obj.fil_pat_rec, 'tai_ang_fra', '-append')

            rec_fil = matfile(obj.fil_pat_rec);
            man_sec = rec_fil.man_sec;
            ini_del = rec_fil.ini_del;
            [~, ~, ~, tim_syn_fra] = ext_tem_fra_dat_cut(obj.fil_pat_ima_fis, ...
                obj.fil_pat_exp, man_sec, ini_del);
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            save(obj.fil_pat_rec, 'tim_syn_fra', '-append')

            % rec_fil = matfile(obj.fil_pat_rec);
            % con_fil = matfile('\\home.ansatt.ntnu.no\kadiram\Documents\MATLAB\con_esp.mat');
            % tconst = 10;
            % ifi = con_fil.ifi;
            % tbin = ifi.man;
            % kernellength=round(2*tconst/tbin);
            % kernel1=exp(-[0:kernellength-1]/(tconst/tbin));%exponentially decaying kernel
            % tai_ang_fra = rec_fil.tai_ang_fra;
            % tai_ang_uni = rec_fil.tai_ang_uni;
            % tai_ang_fra.con = conv(tai_ang_uni, kernel1, 'same');
            % %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            % save(obj.fil_pat_rec, 'tai_ang_fra', '-append')
        end
        % in
        function app_par_tai(obj)
            rec_fil = matfile(obj.fil_pat_rec);
            man_sec = rec_fil.man_sec;
            ini_del = rec_fil.ini_del;
            [~, ~, ~, tim_syn_fra] = ext_tem_fra_dat_cut(obj.fil_pat_ima_fis, ...
                obj.fil_pat_exp, man_sec, ini_del);
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            save(obj.fil_pat_rec, 'tim_syn_fra', '-append')
        end
        %%%%%%%%%%%%%%%%%%%%%%%%%
        function pri_dur_res_per(obj)
            rec_fil = matfile(obj.fil_pat_rec);
            mrp = rec_fil.mrp;
            disp(mrp)
            % disp(rec_fil.mrp_ons)
            % disp(rec_fil.mrp_off)
        end
        function det_per_bin_edg_ani(obj)
            mat_fil = matfile(obj.fil_pat_ima_fis);
            piv_row_col = mat_fil.data(:, :, 120*200);
            
            % n_lev = 50;
            % piv_row_col = adj_bri(piv_row_col, n_lev);

            %per_bin_edg_ani = 50;
            %per_bin_edg_ani = 30;
            per_bin_edg_ani = 45;

            [high_in_ani, low_in_ani] = ext_hig_low.pea_eig(piv_row_col, per_bin_edg_ani);
            piv_row_col = imadjust(piv_row_col, [low_in_ani.rel high_in_ani.rel]);
            hax = axes;
            sho_ima.gra(hax, piv_row_col)
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            save(obj.fil_pat_rec, 'per_bin_edg_ani', 'high_in_ani', 'low_in_ani', '-append')
        end
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% manual
        function app_bou(obj)
            rec_fil = matfile(obj.fil_pat_rec);
            man_sec = rec_fil.man_sec;
            ini_del = rec_fil.ini_del;
            tim_fra = cal_tim_fra(obj.fil_pat_ima_fis, man_sec, ini_del);
            fra_bou_pha = readmatrix(obj.fil_pat_csv);
            bou_ons_bou.all = tim_fra(fra_bou_pha(:, 1));
            bou_off_bou.all = tim_fra(fra_bou_pha(:, 2));
            con_fil = matfile('\\home.ansatt.ntnu.no\kadiram\Documents\MATLAB\con_esp.mat');
            n_fra = con_fil.n_fra;
            fra_rat = con_fil.fra_rat;
            log_bou.all = fra_rat.cal.eig*bou_off_bou.all + n_fra.cal.tri.eig.dff <= n_fra.cal.ses.eig;
            bou_ons_bou.all = bou_ons_bou.all(log_bou.all);
            bou_off_bou.all = bou_off_bou.all(log_bou.all);
            dur_bou.all = bou_off_bou.all - bou_ons_bou.all;
            spo_bor = con_fil.spo_bor;
            [spo_bou_ons, log_bou.spo] = ide_spo_bou_ons(bou_ons_bou.all, spo_bor);

            epo_num = con_fil.epo_num;
            min_sec = con_fil.min_sec;
            bou_ons_bou.vib = bou_ons_bou.all(bou_ons_bou.all >= epo_num{6}(1)*min_sec & ...
                bou_ons_bou.all < epo_num{6}(2)*min_sec);
            bou_ons_bou.non = setdiff(bou_ons_bou.all, bou_ons_bou.vib);
            log_bou.vib = bou_off_bou.all >= epo_num{6}(1)*min_sec & ...
                bou_off_bou.all < epo_num{6}(2)*min_sec;
            bou_off_bou.spo = bou_off_bou.all(log_bou.spo);
            bou_off_bou.vib = bou_off_bou.all(log_bou.vib);
            bou_off_bou.non = bou_off_bou.all(~log_bou.vib);
            dur_bou.spo = dur_bou.all(log_bou.spo);
            dur_bou.vib = dur_bou.all(log_bou.vib);
            dur_bou.non = dur_bou.all(~log_bou.vib);
            bou_dur.all = mean(dur_bou.all);
            bou_dur.spo = mean(dur_bou.spo);
            bou_dur.vib = mean(dur_bou.vib);
            bou_dur.non = mean(dur_bou.non);

            n_bou.all = length(bou_ons_bou.all);
            n_bou.vib = length(bou_ons_bou.vib);
            n_bou.non = length(bou_ons_bou.non);
            n_bou.spo = length(spo_bou_ons);
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            save(obj.fil_pat_rec, 'bou_ons_bou', 'bou_off_bou', 'dur_bou', 'bou_dur', ...
                'spo_bou_ons', 'n_bou', '-append')
        end
        % incorporated
        function app_par_bou(obj)
            rec_fil = matfile(obj.fil_pat_rec);
            bou_ons_bou = rec_fil.bou_ons_bou;
            n_bou = length(bou_ons_bou);
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            save(obj.fil_pat_rec, 'n_bou', '-append')
        end
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        function app_fra_ind(obj)
            fra_ind = ext_tem_fra_dat_cut(obj.fil_pat_ima_fis, obj.fil_pat_exp, obj.fil_pat_rec);
            save(obj.fil_pat_rec, 'fra_ind', '-append')
        end
        function app_fra_ind_nox_syn(obj)
            fra_ind = ext_tem_fra_dat_cut_nox_syn(obj.fil_pat_ima_fis, obj.fil_pat_exp);
            save(obj.fil_pat_rec, 'fra_ind', '-append')
        end
        function sho_fir_fis_fra(obj)
            sho_fir_fra(obj.fil_pat_ima_fis, 'data');
        end
        function fra = ext_fra_met(obj, tim)
            load(obj.fil_pat_rec, 'fra_tim_vid')
            fra = ext_fra(fra_tim_vid, tim);
        end
        function tim = ext_tim_met(obj, fra)
            load(obj.fil_pat_rec, 'fra_tim_vid')
            tim = fra_tim_vid(fra);
        end
        function sho_fra_tim_met(obj, tim)
            load(obj.fil_pat_rec, 'fra_tim_vid')
            sho_fra_tim(fra_tim_vid, obj.fil_pat_ima_fis, tim)
        end
        % for manual tail extraction
        function data = ext_tai_sig(obj)
            load(obj.fil_pat_ima_fis, 'data')
            log_row_col = ext_log_row_col(squeeze(data(:, :, 14000)), 100/255, 0);
            [~, ~, ~, piv_fra] = ext_sig_roi(data, log_row_col);
            fig; plot(piv_fra)
            implay(data)
        end
        %%%%%%%%%%%%%%
        function app_fra_cut_cro_ali(obj)
            load(obj.fil_pat_ima_fis, 'data')
            load(obj.fil_pat_rec, 'fra_ind')% output of ext_tai_dat_seg
            fra = data(:, :, fra_ind);
            fra = cro_ima(fra);
            fra = ali_ima(fra);
            save(obj.fil_pat_rec, 'fra', '-append')
        end
        % function app_mas_dat(obj)
        %     if obj.ali
        %         sho_fir_fra(obj.fil_pat_rec, 'fra');
        %     elseif ~obj.ali
        %         sho_fir_fra(obj.fil_pat_ima_fis, 'data');
        %     end
        % 
        %     hea = imfreehand;
        %     gil = imfreehand;
        %     mou = imfreehand;
        %     eye = imfreehand;
        %     noi = imfreehand;
        % 
        %     mas_hea = createMask(hea);
        %     mas_gil = createMask(gil);
        %     mas_mou = createMask(mou);
        %     mas_eye = createMask(eye);
        %     mas_noi = createMask(noi);
        % 
        %     save(obj.fil_pat_rec, 'mas_hea', 'mas_gil', 'mas_mou', 'mas_eye', 'mas_noi', ...
        %         '-append')
        %     close
        % end%ed
        function app_uni_sig(obj)
            load(obj.fil_pat_rec, 'hea_sig', 'ope_sig', 'mou_sig', 'eye_sig', 'fra_tim_uni', 'fra_tim')
            pcx_fra_par = [hea_sig ope_sig mou_sig eye_sig];
            n_par = 4;
            pcx_uni_fra_par = nan(length(fra_tim_uni), n_par);
            load(obj.fil_pat_exp, 'sta_tim', 'end_tim', 'fra_rat')
            for i = 1:n_par
                pcx_uni_fra_par(:, i) = smo_uni_cor(fra_tim, pcx_fra_par(:, i), sta_tim, end_tim, fra_rat);
            end
            save(obj.fil_pat_rec, 'pcx_uni_fra_par', '-append')
        end
        function app_dru_ons(obj)
            dru_ons = [];
            save(obj.fil_pat_exp, 'dru_ons', '-append')
        end
        function cor_dru_ons_sha(obj)
            dru_ons = 240;
            save(obj.fil_pat_exp, 'dru_ons', '-append')
        end
        % function cor_mas_hea(obj)
        %     addpath \\home.ansatt.ntnu.no\kadiram\Documents\MATLAB\Signal_processing
        %     if obj.ali
        %         sho_fir_fra(obj.fil_pat_rec, 'fra');
        %     else
        %         sho_fir_fra(obj.fil_pat_ima_fis, 'data');
        %     end
        % 
        %     hea = imfreehand;
        %     mas_hea = createMask(hea);
        % 
        %     save(obj.fil_pat_rec, 'mas_hea', '-append')
        %     close
        % end%ed
        % function cor_mas_ope(obj)
        %     addpath \\home.ansatt.ntnu.no\kadiram\Documents\MATLAB\Signal_processing
        %     if obj.ali
        %         sho_fir_fra(obj.fil_pat_rec, 'fra');
        %     else
        %         sho_fir_fra(obj.fil_pat_ima_fis, 'data');
        %     end
        % 
        %     gil = imfreehand;
        %     mas_gil = createMask(gil);
        % 
        %     save(obj.fil_pat_rec, 'mas_gil', '-append')
        %     close
        % end%ed
        function app_res_fro_eth(obj)
            load(obj.fil_pat_eth, 'hea_bea', 'hea_sig', 'ope_bea', 'ope_sig', 'mou_bea', 'mou_sig', 'eye_bea', 'eye_sig')
            save(obj.fil_pat_rec, 'hea_bea', 'hea_sig', 'ope_bea', 'ope_sig', 'mou_bea', 'mou_sig', 'eye_bea', 'eye_sig', '-append')
        end
        function app_rat_dat(obj)
            [rat_tim, rat_tim_par] = ext_rat_dat(obj);
            save(obj.fil_pat_rec, 'rat_tim', 'rat_tim_par', '-append')
        end
        function app_mas_exi(obj)
            load(obj.fil_pat_mas, 'mas_hea', 'mas_gil', 'mas_mou', 'mas_eye')
            save(obj.fil_pat_rec, 'mas_hea', 'mas_gil', 'mas_mou', 'mas_eye', '-append')
        end
        % function app_mas_noi(obj)
        %     addpath \\home.ansatt.ntnu.no\kadiram\Documents\MATLAB\Signal_processing
        %     sho_fir_fra(obj.fil_pat_rec, 'fra');
        %     noi = imfreehand;
        %     mas_noi = createMask(noi);
        %     save(obj.fil_pat_rec, 'mas_noi', '-append')
        %     close
        % end%ed
        function app_rob_dat(obj)
            window_size_heartbeat = 90;
            search_band_heartbeat = [1 5];
            skip_interval_heartbeat = 10;
            %
            addpath \\home.ansatt.ntnu.no\kadiram\Documents\MATLAB\Signal_processing
            load(obj.fil_pat_rec, 'fra_rat', 'fra', 'mas_hea', 'mas_noi', 'sta_tim')
            %
            window = ceil(fra_rat*window_size_heartbeat);
            %
            hea_sig = ext_sig_roi(fra, mas_hea);
            noi_sig = ext_sig_roi(fra, mas_noi);
            D_r = hea_sig';
            D2_r = noi_sig';
            %
            rat_rob = zeros(1,ceil((size(D_r,2)-window)/ceil(skip_interval_heartbeat*fra_rat)))';
            counter = 0;
            for index = 1:ceil(skip_interval_heartbeat*fra_rat):(size(D_r,2)-window)
                counter = counter + 1;
                D = D_r(:,index:(index+window));
                D2 = D2_r(:,index:(index+window));
                L = size(D,2);
                f = fra_rat*(0:(L/2))/L; % frequency
                all_ffts = zeros(size(D,1),size(f,2));
                for trace = 1:size(D,1)
                    Y = fft(D(trace,:));
                    P2 = abs(Y/L);
                    P1 = P2(1:floor(L/2+1));
                    P1(2:end-1) = 2*P1(2:end-1);
                    P1 = P1/mean(D(trace,:));
                    all_ffts(trace,:) = P1;
                end
                all_ffts2 = zeros(size(D2,1),size(f,2));
                for trace = 1:size(D2,1)
                    Y = fft(D2(trace,:));
                    P2 = abs(Y/L);
                    P1 = P2(1:floor(L/2+1));
                    P1(2:end-1) = 2*P1(2:end-1);
                    P1 = P1/mean(D2(trace,:));
                    all_ffts2(trace,:) = P1;
                end
                ref_fft = mean(all_ffts,1)-mean(all_ffts2,1);
                ref_fft((f<search_band_heartbeat(1))|(f>search_band_heartbeat(2))) = -Inf;
                [~, I] = max(ref_fft);
                rat_rob(counter) = f(I);
            end
            tim_rob = 1:ceil(skip_interval_heartbeat*fra_rat):(size(D_r,2) - window);
            tim_rob = sta_tim + tim_rob'/fra_rat;
            save(obj.fil_pat_rec, 'tim_rob', 'rat_rob', '-append')
        end
        function app_bea_lat_tri(obj)
            load(obj.fil_pat_exp, 'sti_ons')
            load(obj.fil_pat_rec, 'tai_bea')
            bea_lat_tri = ext_bea_lat_tri(sti_ons, tai_bea);
            save(obj.fil_pat_rec, 'bea_lat_tri', '-append')
        end
        function app_tai_bea_shu(obj)
            load(obj.fil_pat_rec, 'tai_bea')
            tai_bea_shu = shu_tra(tai_bea);
            save(obj.fil_pat_rec, 'tai_bea_shu', '-append')
        end
        function app_bea_lat_shu(obj)
            load(obj.fil_pat_exp, 'sti_ons')
            load(obj.fil_pat_rec, 'tai_bea_shu')
            bea_lat_shu = ext_bea_lat_tri(sti_ons, tai_bea_shu);
            save(obj.fil_pat_rec, 'bea_lat_shu', '-append')
        end
        function app_bea_lat_con(obj)
            load(obj.fil_pat_exp, 'n_tri_con', 'n_con')
            bea_lat_con = nan(n_tri_con, n_con);
            load(obj.fil_pat_rec, 'bea_lat_tri')
            for j = 1:n_con
                bea_lat_con(:, j) = bea_lat_tri((j - 1)*n_tri_con + 1:j*n_tri_con);
            end
            save(obj.fil_pat_rec, 'bea_lat_con', '-append')
        end
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% videos
        function app_fra_tim_vid(obj)
            fra_tim = ext_tem_fra_dat(obj.fil_pat_ima_fis);% raw video frame times
            % synch
            load(obj.fil_pat_rec, 'man_sec', 'ini_del');
            fra_tim_vid = syn(fra_tim, man_sec, ini_del);
            save(obj.fil_pat_rec, 'fra_tim_vid', '-append')
        end
        function [ima_cli, tim_fra] = ext_tap_one(obj, sti_num)
            load(obj.fil_pat_exp, 'sti_ons')
            sti_ons = sti_ons(sti_num);
            load(obj.fil_pat_rec, 'fra_tim_vid')
            load(obj.fil_pat_ima_fis, 'data')
            [ima_cli, tim_fra] = ext_ima_cli(fra_tim_vid, data, sti_ons);
        end
        function ima_cli = ext_ima_int_met(obj, tim, dev)
            load(obj.fil_pat_rec, 'fra_tim_vid')
            ima_cli = ext_ima_int(fra_tim_vid, obj.fil_pat_ima_fis, tim, dev);
        end
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% pixel%%%%% neural
        function app_neu_pix_dat(obj)
            app_neu_spo_tai(obj)
            app_neu_dat_raw(obj)
        end
        function app_neu_dat_raw(obj)
            load(obj.fil_pat_exp, 'sti_ons', 'n_tri', 'n_con', 'n_tri_con')
            if n_con == 1
                n_tri_con = n_tri;
            end
            load(obj.fil_pat_met_cal, 'metadata')
            obj_ima_cal = matfile(obj.fil_pat_ima_cal);
            %
            fra_rat = 1/metadata.timeStep;
            n_fra_ref = round(fra_rat*obj.neu_ref_dur);
            n_fra_bas = round(fra_rat*obj.bas_dur_neu);
            n_fra_res = round(fra_rat*obj.res_dur_neu);
            n_row = metadata.dim(1);
            n_col = metadata.dim(2);
            n_tri = length(sti_ons);
            dff_raw_tri_row_col = cell(n_tri, 1);
            tri_con_ons = (1:n_tri_con:n_tri)';
            cal_ima_ref_con = nan(n_row, n_col, n_con);
            for i = 1:n_tri
                sti_ons_i = sti_ons(i);
                sti_ons_i_fra = round(fra_rat*sti_ons_i);
                fra_num_bas_i = sti_ons_i_fra - n_fra_bas:sti_ons_i_fra;
                fra_num_res_i = sti_ons_i_fra:sti_ons_i_fra + n_fra_res;
                fra_bas_i = obj_ima_cal.im(:, :, fra_num_bas_i);
                fra_res_i = obj_ima_cal.im(:, :, fra_num_res_i);
                ima_bas_i = mean(fra_bas_i, 3);
                ima_res_i = mean(fra_res_i, 3);
                
                [log_i, con_ind] = ismember(i, tri_con_ons);
                if log_i
                    fra_num_ref = sti_ons_i_fra - n_fra_ref:sti_ons_i_fra;
                    fra_ref = obj_ima_cal.im(:, :, fra_num_ref);
                    cal_ima_ref_con(:, :, con_ind) = mean(fra_ref, 3);
                end

                dff_raw_tri_row_col{i} = ((ima_res_i - ima_bas_i)./ima_bas_i)*100;
            end
            dff_raw_con_row_col = cell(n_con, 1);
            for i = 1:n_con
                dff_raw_row_col_tri_i = nan(n_row, n_col, n_tri_con);
                for j = 1:n_tri_con
                    dff_raw_row_col_tri_i(:, :, j) = dff_raw_tri_row_col{(i - 1)*n_tri_con + j};
                end
                dff_raw_con_row_col{i} = mean(dff_raw_row_col_tri_i, 3);
            end
            save(obj.fil_pat_rec, 'cal_ima_ref_con', 'dff_raw_tri_row_col', ...
                'dff_raw_con_row_col', '-append')
        end
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% cell detection
        function det_cel(obj)
            con_fil = matfile('\\home.ansatt.ntnu.no\kadiram\Documents\MATLAB\con_esp.mat');
            n_pla = con_fil.n_pla;
            n_pla = n_pla.neu.raw;
            fun_pla = con_fil.fun_pla;
            reg = 'rap';
            spe = ext_spe(obj.mov_blo, reg, obj.n_chu);
            for pla = fun_pla.raw
                for i = 1:obj.n_chu
                    disp(strcat("Plane ", string(pla), "/", string(n_pla), ", chunk ", ...
                        string(i), "/", string(obj.n_chu)))
                    keyword = char(spe(i));
                    % pixel correlations are also performed in the mean_per_block.
                    detectROI_LL_1018(obj.targetP, obj.confPath, keyword, ...
                        obj.detectionTimepoint(i), obj.windowSize, obj.windowStep, pla)
                end
            end
        end
        function cor_det_cel(obj, sta_pla)
            con_fil = matfile('\\home.ansatt.ntnu.no\kadiram\Documents\MATLAB\con_esp.mat');
            n_pla = con_fil.n_pla;
            n_pla = n_pla.neu.raw;
            reg = 'rap';
            spe = ext_spe(obj.mov_blo, reg, obj.n_chu);
            for pla = sta_pla:n_pla
                for i = 1:obj.n_chu
                    disp(strcat("Plane ", string(pla), "/", string(n_pla), ", chunk ", ...
                        string(i), "/", string(obj.n_chu)))
                    keyword = char(spe(i));
                    % pixel correlations are also performed in the mean_per_block.
                    detectROI_LL_1018(obj.targetP, obj.confPath, keyword, ...
                        obj.detectionTimepoint(i), obj.windowSize, obj.windowStep, pla)
                end
            end
        end
        %
        function sav_roi(obj)
            con_fil = matfile('\\home.ansatt.ntnu.no\kadiram\Documents\MATLAB\con_esp.mat');
            frameStart = 1;
            n_fra = con_fil.n_fra;
            
            frameStop = n_fra.cal.ses.eig.spo;%% !!!!!!!!!!!!!!!!!!!!!
            %frameStop = 4047;%% !!!!!!!!!!!!!!!!!!!!!

            n_pla = con_fil.n_pla; % !!!!!!!!!!
            fun_pla = con_fil.fun_pla;
            reg = 'rap';
            spe = ext_spe(obj.mov_blo, reg, obj.n_chu);
            n_cel_pla.raw = nan(n_pla.neu.raw, 1);
            n_cel_pla.raw(2) = 0;
            cel_fie_pla_row_col.pla = cell(n_pla.neu.raw, 1);
            % flipped when saving as .mat, before cel_det
            
            % cel_lab_pla_row_col
            piv_pla_fra_cel = cell(n_pla.neu.raw, 1);
            fra_rat = con_fil.fra_rat;
            dff_pla_fra_cel = cell(n_pla.neu.raw, 1);
            for pla = fun_pla.raw
                for chu = 1:obj.n_chu
                    disp(strcat("Plane ", string(pla), "/", string(n_pla.neu.raw), ", chunk ", ...
                        string(chu), "/", string(obj.n_chu)))
                    keyword = char(spe(chu));
                    roi_t = extractTraces(frameStart, frameStop, obj.targetP, keyword, ...
                        pla, obj.fil_pat_ima_cal_pla{pla});
                    % obj.targetP - W:\kadir\raw\esp282\suite2p\  \celldetection_rap
                end
                n_cel_pla.raw(pla) = max(roi_t.neuronLabels, [], 'all');
                cel_fie_pla_row_col.pla{pla} = roi_t.neuronLabels;
                cel_fie_pla_row_col.pla{pla}(cel_fie_pla_row_col.pla{pla} == 0) = nan;
                % cell label starts from 1 per plane
                
                piv_pla_fra_cel{pla} = roi_t.traces';
                dff_pla_fra_cel{pla} = cal_dff_fra_roi.sli(fra_rat.cal.eig, piv_pla_fra_cel{pla});
            end
            [~, ~, ~, x_cel, y_cel, z_cel, coo_cel_dim] = cal_xyz_cel(obj.factor_meter, ...
                obj.iniStruct, cel_fie_pla_row_col.pla);
            n_cel.all = sum(n_cel_pla.raw);
            [log_cel_pla, log_pla_row_col.all.all, cel_fie_pla_row_col] = ext_log_cel_pla(n_cel, ...
                n_cel_pla, cel_fie_pla_row_col);
            dis_cel_cel = squareform(pdist([x_cel.abs y_cel.abs z_cel.abs]));
            dis_pai = ext_upp(dis_cel_cel);
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            save(obj.fil_pat_rec, 'n_cel_pla', 'cel_fie_pla_row_col', 'piv_pla_fra_cel', ...
                'dff_pla_fra_cel', 'x_cel', 'y_cel', 'z_cel', 'coo_cel_dim', 'n_cel', 'dis_cel_cel',...
                'dis_pai', 'log_cel_pla', 'log_pla_row_col', '-append')
        end
        function cor_par_roi(obj)
            con_fil = matfile('\\home.ansatt.ntnu.no\kadiram\Documents\MATLAB\con_esp.mat');
            n_pla = con_fil.n_pla;
            fun_pla = con_fil.fun_pla;
            cel_fie_pla_row_col.pla = cell(n_pla.neu.raw, 1);
            for pla = fun_pla.raw
                fix_pat_roi_t = [obj.targetP 'celldetection_rap\celldetection_plane' num2str(pla) ...
                    '\roi_t.mat'];
                mat_fil = matfile(fix_pat_roi_t);
                roi_t = mat_fil.roi_t;
                cel_fie_pla_row_col.pla{pla} = roi_t.neuronLabels;
                cel_fie_pla_row_col.pla{pla}(cel_fie_pla_row_col.pla{pla} == 0) = nan;
            end
            rec_fil = matfile(obj.fil_pat_rec);
            n_cel = rec_fil.n_cel;
            n_cel_pla = rec_fil.n_cel_pla;
            [log_cel_pla, ~, cel_fie_pla_row_col] = ext_log_cel_pla(n_cel, n_cel_pla, ...
                cel_fie_pla_row_col);
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            save(obj.fil_pat_rec, 'cel_fie_pla_row_col', 'log_cel_pla', '-append')
        end
        %
        function h_fig = sho_pla_met(obj, pla)
            rec_fil = matfile(obj.fil_pat_rec);
            piv_pla_row_col = rec_fil.piv_pla_row_col;
            log_pla_row_col = rec_fil.log_pla_row_col;
            h_fig = sho_pla(piv_pla_row_col, log_pla_row_col, pla);
        end
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% cell
        function app_bra_reg(obj)
            rec_fil = matfile(obj.fil_pat_rec);
            n_cel = rec_fil.n_cel;
            int_ref_row_col = rec_fil.int_ref_row_col;
            int_ref_row_col = flip(int_ref_row_col);% needs update !!!!
            fig
            imshow(int_ref_row_col)
            cel_lab_row_col = rec_fil.cel_lab_row_col;
            cel_lab_row_col = flip(cel_lab_row_col);% to use the drawing
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            
            % Left hab, Dl, Dm, Dc, Dd, Dmp
            
            % Right hab, Dl, Dm, Dc, Dd, Dmp
            % global n_reg_tot n_reg_for ind_for ind_hab ind_tel ind_dlx ind_dmx ...
            %     ind_dcx ind_ddx ind_dmp
            cel_lab_reg_pre_uni = nan(n_cel.raw, 1);
            log_tot_cel_reg.raw = false(n_cel.raw, n_reg_tot);
            ind_pre = 1;
            for i = 1:n_reg_tot
                roi = drawfreehand;
                mas_roi = createMask(roi);
                mas_roi_dou = double(mas_roi);
                mas_roi_dou(~mas_roi) = nan;
                %
                cel_lab_reg_row_col = mas_roi_dou.*cel_lab_row_col;
                cel_lab_reg_uni = unique(cel_lab_reg_row_col);
                cel_lab_reg_uni(isnan(cel_lab_reg_uni)) = [];
                cel_lab_reg_uni = setdiff(cel_lab_reg_uni, cel_lab_reg_pre_uni);
                log_tot_cel_reg.raw(cel_lab_reg_uni, i) = true;
                %
                n_cel_reg_lat = length(cel_lab_reg_uni);
                ind_pos = ind_pre + n_cel_reg_lat - 1;
                cel_lab_reg_pre_uni(ind_pre:ind_pos) = cel_lab_reg_uni;
                ind_pre = ind_pos + 1;
            end
            %
            n_tot_cel_reg.raw = sum(log_tot_cel_reg.raw)';
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% forebrain
            log_cel_reg.raw = false(n_cel.raw, n_reg_for);
            log_cel_reg.raw(:, ind_for) = true;
            con_fil = matfile('\\home.ansatt.ntnu.no\kadiram\Documents\MATLAB\con_esp.mat');
            n_reg_for_cro = con_fil.n_reg_for_cro;
            log_cel_reg.raw(:, ind_hab) = logical(log_tot_cel_reg.raw(:, 1) + ...
                log_tot_cel_reg.raw(:, 1 + n_reg_for_cro));
            log_cel_reg.raw(:, ind_tel) = ~log_cel_reg.raw(:, ind_hab);
            log_cel_reg.raw(:, ind_dlx) = logical(log_tot_cel_reg.raw(:, 2) + ...
                log_tot_cel_reg.raw(:, 2 + n_reg_for_cro));
            log_cel_reg.raw(:, ind_dmx) = logical(log_tot_cel_reg.raw(:, 3) + ...
                log_tot_cel_reg.raw(:, 3 + n_reg_for_cro));
            log_cel_reg.raw(:, ind_dcx) = logical(log_tot_cel_reg.raw(:, 4) + ...
                log_tot_cel_reg.raw(:, 4 + n_reg_for_cro));
            log_cel_reg.raw(:, ind_ddx) = logical(log_tot_cel_reg.raw(:, 5) + ...
                log_tot_cel_reg.raw(:, 5 + n_reg_for_cro));
            log_cel_reg.raw(:, ind_dmp) = logical(log_tot_cel_reg.raw(:, 6) + ...
                log_tot_cel_reg.raw(:, 6 + n_reg_for_cro));
            %
            n_cel_reg.raw = sum(log_cel_reg.raw)';
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            save(obj.fil_pat_rec, 'log_tot_cel_reg', 'n_tot_cel_reg', ...
                'log_cel_reg', 'n_cel_reg', '-append')
        end
        function app_dff_bra_chu_fra_cel(obj)
            %global n_reg_for n_win_ong win_len tri_len
            rec_fil = matfile(obj.fil_pat_rec);
            con_fil = matfile('\\home.ansatt.ntnu.no\kadiram\Documents\MATLAB\con_esp.mat');
            sti_ons_tri = con_fil.sti_ons_tri;
            fra_rat = con_fil.fra_rat;
            isi = con_fil.isi;
            win_len = con_fil.win_len;% due to global
            [~, act_fra_cel.dff.raw.tri] = ext_cha_poi_uni(rec_fil.f_fra_cel, win_len.dff, ...
                sti_ons_tri.vrs.one, fra_rat.cal.one, isi);
            n_cel_reg = rec_fil.n_cel_reg;
            log_cel_reg = rec_fil.log_cel_reg;
            log_tot_cel_reg = rec_fil.log_tot_cel_reg;
            poi_tri_lim = con_fil.poi_tri_lim;
            tim_fra = con_fil.tim_fra;

            % 2nd, 3rd line!
            [~, ~, ~, ~, act_con_cel_win.dff.raw.tri, act_win_cel_tri.dff.raw.tri, ...
                act_reg_con_win_cel.dff.raw.tri, act_reg_con_win.dff.raw.tri, n_cel_reg.rem, ~, ...
                act_reg_con_fra_cel.dff.raw.tri, log_cel_reg.rem, log_tot_cel_reg.rem, ~, ...
                fra_reg_con.dff.raw.tri] = ext_act(act_fra_cel.dff.raw.tri, log_cel_reg.raw, ...
                obj.rem_cel_num, win_len.dff, tri_len.dff, poi_tri_lim.dff.one, ...
                tim_fra.cal.one.tri.dff, log_tot_cel_reg.raw, obj.boo_tri_con);% n_reg_for !!!!
            % act_win_cel_tri{k}(i, j) = act_cel_tri_win{i}(j, k);% ess. same
            dff_con_row_col = com_dff_con_row_col(rec_fil.cel_lab_row_col, act_reg_con_win_cel, ...
                obj.rem_cel_num);
            [pcc_reg_xri_xri.dff.raw.tri.all, pcc_reg_con.dff.raw.tri.all, ...
                euc_dis_reg_xri_xri.dff.raw.tri.all, euc_dis_reg_con.dff.raw.tri.all] = ...
                ext_pcc_euc(log_cel_reg.rem, act_con_cel_win.dff.raw.tri.all, ...
                act_win_cel_tri.dff.raw.tri);% all in the output !!!
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% ong
            n_reg_for = con_fil.n_reg_for;% due to global
            ofr_reg_win = nan(n_reg_for, n_win_ong);
            ofr_cel_win = nan; % editor
            % for i = 1:n_reg_for
            %     ofr_reg_win(i, :) = mean(ofr_cel_win(log_cel_reg.rem(:, i), :));
            % end
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% corr
            
            % compute n_pai_reg - missing !!!!!!, if necessary, using
            
            % n_cel_reg.rem ---- same cen_sub_cel_dim
            [~, act_fra_cel.dff.raw.sli] = com_dff_met_fra_cel(rec_fil.f_fra_cel, fra_rat.cal.one);
            [acc_epo_reg_pai, cor_coe_epo_reg_blo, per_pai_epo_reg_bin, ske_epo_reg, acc_epo_reg, ...
                per_pai_epo_xre_bin, ske_epo_xre, acc_epo_xre, ~, ...
                xcc_epo_blo, cor_coe_reg_blo, xcc_blo] = com_syn(act_fra_cel, log_cel_reg, obj, ...
                rec_fil.cel_lab_row_col, log_tot_cel_reg);
            % cor_coe_reg_blo: epoch-averaged, dunno where used.
            %!!!!! CLEAN UP
            con_fil = matfile('\\home.ansatt.ntnu.no\kadiram\Documents\MATLAB\con_esp.mat');
            n_reg_for = con_fil.n_reg_for;
            n_epo = con_fil.n_epo;
            act_reg_epo_fra_cel.dff.raw.sli = cell(n_reg_for, n_epo.tot);
            rec_fil = matfile(obj.fil_pat_rec);
            act_fra_cel = rec_fil.act_fra_cel;
            fra_epo_sam = con_fil.fra_epo_sam;
            log_cel_reg = rec_fil.log_cel_reg;
            for i = 1:n_reg_for
                for j = 1:n_epo.tot
                    act_reg_epo_fra_cel.dff.raw.sli{i, j} = act_fra_cel.dff.raw.sli(fra_epo_sam{j}, ...
                        log_cel_reg.raw(:, i));
                end
            end

            traces = act_fra_cel.dff.raw.sli';
            log_cel = logical(sum(log_cel_reg.raw(:, con_fil.ind_sub_reg), 2));
            % because of deliniation
            log_fra = con_fil.log_fra;
            traces = traces(log_cel, log_fra.cal.one.ses);
            % log_cel_reg.raw = log_cel_reg.raw(log_cel, :); done before
            % d-club, why ???????
            %n_cel = size(traces, 1);%editor
            % parfor i = 1:n_cel%editor
            %     traces(i, :) = fil_yak(traces(i, :));
            % end
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            save(obj.fil_pat_rec, 'n_cel_reg', ...
                'act_fra_cel', 'log_cel_reg', 'log_tot_cel_reg', 'fra_reg_con', ...
                'act_reg_con_fra_cel', 'act_reg_con_win_cel', 'act_reg_con_win', 'dff_con_row_col', ...
                'pcc_reg_xri_xri', 'pcc_reg_con', 'euc_dis_reg_xri_xri', 'euc_dis_reg_con', ...
                'act_reg_epo_fra_cel', 'traces', ...
                ...
                'ofr_cel_win', 'ofr_reg_win', ...
                ...
                'acc_epo_reg_pai', 'per_pai_epo_reg_bin', 'ske_epo_reg', ...
                'acc_epo_reg', 'per_pai_epo_xre_bin', 'ske_epo_xre', 'acc_epo_xre', ...
                ...
                'cor_coe_epo_reg_blo', 'cor_coe_reg_blo', 'xcc_epo_blo', 'xcc_blo', ...
                '-append')
            %
            rec_fil = matfile(obj.fil_pat_rec);
            act_fra_cel = rec_fil.act_fra_cel;
            con_fil = matfile('\\home.ansatt.ntnu.no\kadiram\Documents\MATLAB\con_esp.mat');
            win_len = con_fil.win_len;
            poi_tri_lim = con_fil.poi_tri_lim;
            tim_fra = con_fil.tim_fra;
            % tri based dff for the entire session
            act_cel_tri_win = cal_act_cel_tri_win(act_fra_cel.dff.raw.tri, obj.rem_cel_num, ...
                win_len.dff.one, poi_tri_lim.dff.one, tim_fra.cal.one.tri.dff);% .sec internal
            log_cel_reg = rec_fil.log_cel_reg;
            act_reg_tri_win = cal_act_reg_tri_win(act_cel_tri_win, log_cel_reg.rem);
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            save(obj.fil_pat_rec, 'act_reg_tri_win', '-append')

            rec_fil = matfile(obj.fil_pat_rec);
            act_fra_cel = rec_fil.act_fra_cel;
            con_fil = matfile('\\home.ansatt.ntnu.no\kadiram\Documents\MATLAB\con_esp.mat');
            win_len = con_fil.win_len;
            poi_tri_lim = con_fil.poi_tri_lim;
            tim_fra = con_fil.tim_fra;
            % tri based dff for the entire session
            act_cel_tri_win = cal_act_cel_tri_win(act_fra_cel.dff.raw.tri, obj.rem_cel_num, ...
                win_len.dff.one, poi_tri_lim.dff.one, tim_fra.cal.one.tri.dff);% .sec internal
            [log_cel_con, ~] = ext_log_res_tes_cel_con(act_cel_tri_win);
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            save(obj.fil_pat_rec, 'log_cel_con', '-append')

            rec_fil = matfile(obj.fil_pat_rec);
            if isx_var(obj, 'f_chu_fra_cel')
                f_chu_fra_cel = rec_fil.f_chu_fra_cel;
                % only the first chunk is considered!
                f_fra_cel = f_chu_fra_cel{1};
            else
                f_fra_cel = rec_fil.f_fra_cel;
            end
            [bas_flu, ~] = ext_f_bas_win(f_fra_cel);
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            save(obj.fil_pat_rec, 'bas_flu', '-append')

            %%%%%%%%%% Fig. 6B !!!!!!!!!!!!!!!
            rec_fil = matfile(obj.fil_pat_rec);
            act_fra_cel = rec_fil.act_fra_cel;
            coo_cel_dim = rec_fil.coo_cel_dim;
            coo_cel_dim(:, 3) = 0;
            dis_cel_cel = squareform(pdist(coo_cel_dim));
            epo = 6;% during high intensity vibrations
            pcc_blo = com_for_pcc_blo(act_fra_cel, dis_cel_cel, epo);%.sli
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            save(obj.fil_pat_rec, 'dis_cel_cel', 'pcc_blo', '-append')
            
            rec_fil = matfile(obj.fil_pat_rec);
            act_reg_con_fra_cel = rec_fil.act_reg_con_fra_cel;
            act_fra_cel = rec_fil.act_fra_cel;
            dff_chu_fra_cel = rec_fil.dff_chu_fra_cel;
            act_fra_cel.dff.raw.tri = dff_chu_fra_cel{1};
            log_cel_reg.raw = rec_fil.log_cel_reg;
            log_tot_cel_reg.raw = rec_fil.log_tot_cel_reg;
            con_fil = matfile('\\home.ansatt.ntnu.no\kadiram\Documents\MATLAB\con_esp.mat');
            win_len = con_fil.win_len;
            poi_tri_lim = con_fil.poi_tri_lim;
            tim_fra = con_fil.tim_fra;
            [~, ~, ~, ~, ~, ~, ~, ~, ~, ~, act_reg_con_fra_cel.dff.raw.tri, ~, ~, ~, ~] = ext_act(...
                act_fra_cel.dff.raw.tri, log_cel_reg.raw, obj.rem_cel_num, win_len.dff.one, ...
                poi_tri_lim.dff.one, tim_fra.cal.one.tri.dff, log_tot_cel_reg.raw, ...
                obj.boo_tri_con);
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            save(obj.fil_pat_rec, 'act_fra_cel', 'log_cel_reg', 'log_tot_cel_reg', ...
                'act_reg_con_fra_cel', '-append')

            %%%% RESPONSE VIS !!!!!!!!!!!!!!!!!
            rec_fil = matfile(obj.fil_pat_rec);
            act_reg_con_fra_cel = rec_fil.act_reg_con_fra_cel;
            act_reg_con_win_cel.dff.raw.tri.all{1} = cal_dff_con_win_cel(...
                act_reg_con_fra_cel.dff.raw.tri.all');% works for fb, linear indexing ...all,exc,inh?
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            save(obj.fil_pat_rec, 'act_reg_con_win_cel', '-append')

            rec_fil = matfile(obj.fil_pat_rec);
            act_fra_cel = rec_fil.act_fra_cel;
            con_fil = matfile('\\home.ansatt.ntnu.no\kadiram\Documents\MATLAB\con_esp.mat');
            win_len = con_fil.win_len;
            poi_tri_lim = con_fil.poi_tri_lim;
            tim_fra = con_fil.tim_fra;
            % tri based dff for the entire session
            act_cel_tri_win = cal_act_cel_tri_win(act_fra_cel.dff.raw.tri, obj.rem_cel_num, ...
                win_len.dff.one, poi_tri_lim.dff.one, tim_fra.cal.one.tri.dff);% .sec internal
            %%%%%%%%%%
            tac_tri_win = rec_fil.tac_tri_win;
            n_cel_reg = rec_fil.n_cel_reg;
            log_cel_reg = rec_fil.log_cel_reg;
            slo_reg_cel = cal_slo_reg_cel(tac_tri_win, act_cel_tri_win, n_cel_reg, log_cel_reg);
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            save(obj.fil_pat_rec, 'act_cel_tri_win', 'slo_reg_cel', '-append')

            rec_fil = matfile(obj.fil_pat_rec);
            act_cel_tri_win = rec_fil.act_cel_tri_win;
            tac_tri_win = rec_fil.tac_tri_win;
            n_cel_reg = rec_fil.n_cel_reg;
            con_fil = matfile('\\home.ansatt.ntnu.no\kadiram\Documents\MATLAB\con_esp.mat');
            log_tri_con = con_fil.log_tri_con;
            log_tri_con = log_tri_con.vrs;
            log_tri = log_tri_con(:, 3);
            win = 2;
            tac_tri = tac_tri_win(log_tri, win);
            n_tri = 6;
            n_cel_reg = n_cel_reg.rem;
            n_cel = n_cel_reg(1);
            act_tri_cel = nan(n_tri, n_cel);
            for cel = 1:n_cel
                act_tri_cel(:, cel) = act_cel_tri_win{cel}(log_tri, win);
            end
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            save(obj.fil_pat_rec, 'tac_tri', 'act_tri_cel', '-append')

            rec_fil = matfile(obj.fil_pat_rec);
            tac_tri = rec_fil.tac_tri;
            n_cel_reg = rec_fil.n_cel_reg;
            n_cel_reg = n_cel_reg.rem;
            n_cel = n_cel_reg(1);
            tac_tri_cel = repmat(tac_tri, 1, n_cel);
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            save(obj.fil_pat_rec, 'tac_tri_cel', '-append')

            % should be for plotting the lines
            rec_fil = matfile(obj.fil_pat_rec);
            act_cel_tri_win = rec_fil.act_cel_tri_win;
            tac_tri_win = rec_fil.tac_tri_win;
            n_cel_reg = rec_fil.n_cel_reg;
            log_cel_reg = rec_fil.log_cel_reg;
            [~, tac_sam, act_reg_sam_cel] = cal_slo_reg_cel(tac_tri_win, act_cel_tri_win, n_cel_reg...
                , log_cel_reg);
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            save(obj.fil_pat_rec, 'tac_sam', 'act_reg_sam_cel', '-append')
            
            rec_fil = matfile(obj.fil_pat_rec);
            pcc_blo.all_cel = rec_fil.pcc_blo;
            log_cel_reg = rec_fil.log_cel_reg;
            res_reg_con_win_uni = rec_fil.act_reg_con_win_cel;
            res_reg_con_win_uni = res_reg_con_win_uni.dff.raw.tri.all;
            reg = 1;
            res_con_win_uni = res_reg_con_win_uni{reg};
            res_cel = res_con_win_uni{3, 2};
            con_fil = matfile('\\home.ansatt.ntnu.no\kadiram\Documents\MATLAB\con_esp.mat');
            res_thr = con_fil.res_thr;% calculated and saved through 'sam'!
            n_reg_for = con_fil.n_reg_for;
            log_raw_cel = res_cel < res_thr;
            log_cel_reg.thr = log_cel_reg.rem & repmat(log_raw_cel, 1, n_reg_for);
            log_cel = log_cel_reg.thr(:, reg);
            act_fra_cel = rec_fil.act_fra_cel;
            act_fra_cel = act_fra_cel.dff.raw.sli;
            act_fra_cel = act_fra_cel(:, log_cel);% cell selection!
            dis_cel_cel = rec_fil.dis_cel_cel;
            dis_cel_cel = dis_cel_cel(log_cel, log_cel');
            epo = 6;% during high intensity vibrations
            pcc_blo.thr_cel = com_for_pcc_blo(act_fra_cel, dis_cel_cel, epo);
            %
            cor_coe_epo_reg_blo = rec_fil.cor_coe_epo_reg_blo;
            acc_epo_xre = rec_fil.acc_epo_xre;
            log_tot_cel_reg = rec_fil.log_tot_cel_reg;
            n_reg_tot = con_fil.n_reg_tot;
            log_tot_cel_reg.thr = log_tot_cel_reg.rem & repmat(log_raw_cel, 1, n_reg_tot);
            [~, cor_coe_epo_reg_blo.thr_cel, ~, ~, ~, ~, ~, acc_epo_xre.thr_cel] = com_syn(...
                act_fra_cel, log_cel_reg.thr, obj, rec_fil.cel_lab_row_col, log_tot_cel_reg.thr);
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            save(obj.fil_pat_rec, 'log_cel_reg', 'pcc_blo', 'acc_epo_xre', 'cor_coe_epo_reg_blo', ...
                '-append')

            rec_fil = matfile(obj.fil_pat_rec);
            log_cel_reg = rec_fil.log_cel_reg;
            pcc_blo = rec_fil.pcc_blo;
            acc_epo_xre = rec_fil.acc_epo_xre;
            cor_coe_epo_reg_blo = rec_fil.cor_coe_epo_reg_blo;
            [log_cel_reg.thr_one, pcc_blo.thr_one, acc_epo_xre.thr_one, cor_coe_epo_reg_blo.thr_one...
                ] = ext_thr_dat(obj, 'one');
            [log_cel_reg.thr_two, pcc_blo.thr_two, acc_epo_xre.thr_two, cor_coe_epo_reg_blo.thr_two...
                ] = ext_thr_dat(obj, 'two');
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            save(obj.fil_pat_rec, 'log_cel_reg', 'pcc_blo', 'acc_epo_xre', 'cor_coe_epo_reg_blo', ...
                '-append')

            rec_fil = matfile(obj.fil_pat_rec);
            act_cel_tri_win = rec_fil.act_cel_tri_win;
            tac_tri_win = rec_fil.tac_tri_win;
            n_cel_reg = rec_fil.n_cel_reg;
            log_cel_reg = rec_fil.log_cel_reg;
            [~, ~, ~, coe_det_reg_cel] = cal_slo_reg_cel(tac_tri_win, act_cel_tri_win, n_cel_reg, ...
                log_cel_reg);
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            save(obj.fil_pat_rec, 'coe_det_reg_cel', '-append')

            rec_fil = matfile(obj.fil_pat_rec);
            log_cel_reg = rec_fil.log_cel_reg;
            act_fra_cel = rec_fil.act_fra_cel;
            act_fra_cel = act_fra_cel.dff.raw.sli;
            cor_coe_epo_reg_blo = rec_fil.cor_coe_epo_reg_blo;
            log_tot_cel_reg = rec_fil.log_tot_cel_reg;
            [~, cor_coe_epo_reg_blo.lon_spo, ~, ~, ~, ~, ~, ~] = com_syn(act_fra_cel, ...
                log_cel_reg.rem, obj, rec_fil.cel_lab_row_col, log_tot_cel_reg.rem);
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            save(obj.fil_pat_rec, 'cor_coe_epo_reg_blo', '-append')

            rec_fil = matfile(obj.fil_pat_rec);
            reg = 1;
            con_fil = matfile('\\home.ansatt.ntnu.no\kadiram\Documents\MATLAB\con_esp.mat');
            n_reg_for = con_fil.n_reg_for;
            log_raw_cel = rec_fil.log_cel;
            log_raw_cel = log_raw_cel.for_syn{1};
            log_cel_reg = rec_fil.log_cel_reg;
            pcc_blo = rec_fil.pcc_blo;
            acc_epo_xre = rec_fil.acc_epo_xre;
            cor_coe_epo_reg_blo = rec_fil.cor_coe_epo_reg_blo;
            log_cel_reg.for_syn = log_cel_reg.rem & repmat(log_raw_cel, 1, n_reg_for);
            log_cel = log_cel_reg.for_syn(:, reg);
            act_fra_cel = rec_fil.act_fra_cel;
            dff_fra_cel = act_fra_cel.dff.raw.sli;
            dis_cel_cel = rec_fil.dis_cel_cel;
            dis_cel_cel = dis_cel_cel(log_cel, log_cel');
            epo = 6;% during high intensity vibrations
            pcc_blo.for_syn = com_for_pcc_blo(dff_fra_cel(:, log_cel), dis_cel_cel, epo);
            % cell selection!
            log_tot_cel_reg = rec_fil.log_tot_cel_reg;
            n_reg_tot = con_fil.n_reg_tot;
            log_tot_cel_reg.thr = log_tot_cel_reg.rem & repmat(log_raw_cel, 1, n_reg_tot);
            [~, cor_coe_epo_reg_blo.for_syn, ~, ~, ~, ~, ~, acc_epo_xre.for_syn] = com_syn(...
                dff_fra_cel, log_cel_reg.for_syn, obj, rec_fil.cel_lab_row_col, log_tot_cel_reg.thr);
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            save(obj.fil_pat_rec, 'log_cel_reg', 'pcc_blo', 'acc_epo_xre', 'cor_coe_epo_reg_blo', ...
                '-append')

            rec_fil = matfile(obj.fil_pat_rec);
            slo_reg_cel.hig_tri = rec_fil.slo_reg_cel;
            act_cel_tri_win = rec_fil.act_cel_tri_win;
            tac_tri_win = rec_fil.tac_tri_win;
            n_cel_reg = rec_fil.n_cel_reg;
            log_cel_reg = rec_fil.log_cel_reg;
            slo_reg_cel.all_tri = cal_slo_reg_cel(tac_tri_win, act_cel_tri_win, n_cel_reg, ...
                log_cel_reg);
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            save(obj.fil_pat_rec, 'slo_reg_cel', '-append')

            rec_fil = matfile(obj.fil_pat_rec);
            slo_reg_cel = rec_fil.slo_reg_cel;
            act_cel_tri_win = rec_fil.act_cel_tri_win;
            tac_tri_win = rec_fil.tac_tri_win;
            n_cel_reg = rec_fil.n_cel_reg;
            log_cel_reg = rec_fil.log_cel_reg;
            slo_reg_cel.lhx_tri = cal_slo_reg_cel(tac_tri_win, act_cel_tri_win, n_cel_reg, ...
                log_cel_reg);
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            save(obj.fil_pat_rec, 'slo_reg_cel', '-append')
        end
        %%%%%%%%%%%%% in
        function app_par(obj)
            rec_fil = matfile(obj.fil_pat_rec);
            slo_reg_cel = rec_fil.slo_reg_cel;
            act_cel_tri_win = rec_fil.act_cel_tri_win;
            tac_tri_win = rec_fil.tac_tri_win;
            n_cel_reg = rec_fil.n_cel_reg;
            log_cel_reg = rec_fil.log_cel_reg;
            slo_reg_cel.lhx_tri = cal_slo_reg_cel(tac_tri_win, act_cel_tri_win, n_cel_reg, ...
                log_cel_reg);
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            save(obj.fil_pat_rec, 'slo_reg_cel', '-append')
        end
        % correction
        function cor(obj)
            rec_fil = matfile(obj.fil_pat_rec);
            cal_ima_ref_con = rec_fil.cal_ima_ref_con;
            int_ref_row_col = squeeze(cal_ima_ref_con(:, :, 3));
            int_ref_row_col = uint16(int_ref_row_col);
            cel_fie_pla_row_col = rec_fil.cel_fie_pla_row_col;
            cel_lab_row_col = cel_fie_pla_row_col.pla{1};
            cel_lab_row_col(cel_lab_row_col == 0) = nan;
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            save(obj.fil_pat_rec, 'int_ref_row_col', 'cel_lab_row_col', '-append')
        end
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% axon-cel
        function [high_in, low_in] = det_hig_low(obj)
            mat_fil = matfile(obj.fil_pat_rec);
            piv_pla_row_col = mat_fil.piv_pla_row_col;
            
            cel_per_bin_edg = 30;% axo-cel; axo-onl = cel_onl, for upper limit

            [high_in, low_in] = ext_hig_low.pea(piv_pla_row_col.raw{1}, cel_per_bin_edg);
            plo_piv(piv_pla_row_col.raw, high_in, low_in);

            % [high_in, low_in] = ext_hig_low.pea(piv_pla_row_col{1}, cel_per_bin_edg);
            % plo_piv(piv_pla_row_col, high_in, low_in);
        end% for vis
        %%%%%
        function det_per_bin_edg(obj)
            mat_fil = matfile(obj.fil_pat_rec);
            piv_pla_row_col = mat_fil.piv_pla_row_col;
            
            %obj.per_bin_edg = 30; % axo_onl, cel_onl !!!!
            %obj.per_bin_edg = 25;
            %obj.per_bin_edg = 15;
            %obj.per_bin_edg = 10;
            %obj.per_bin_edg = 7;
            %obj.per_bin_edg = 5;
            %obj.per_bin_edg = 3;
            
            %[high_in, low_in] = ext_hig_low.pea(piv_pla_row_col.glu{1}, obj.per_bin_edg);
            %h_fig = plo_piv(piv_pla_row_col.glu, high_in, low_in);

            % for glia

            %obj.per_bin_edg = 70;

            [high_in, low_in] = ext_hig_low.pea(piv_pla_row_col{1}, obj.per_bin_edg);
            plo_piv(piv_pla_row_col, high_in, low_in);

            save(obj.fil_pat_rec, 'high_in', 'low_in', '-append')
        end
        function app_log_pla_row_col(obj)
            con_fil = matfile('\\home.ansatt.ntnu.no\kadiram\Documents\MATLAB\con_esp.mat');
            n_pla = con_fil.n_pla;
            mat_fil = matfile(obj.fil_pat_rec);
            log_pla_row_col.axo = cell(n_pla.neu.raw, 1);
            fun_pla = [1 3 4 5 6 7 8];
            piv_pla_row_col = mat_fil.piv_pla_row_col;
            for i = fun_pla
                % log_pla_row_col.axo{i} = ext_log_row_col(piv_pla_row_col.glu{i}, mat_fil.high_in, ...
                %     mat_fil.low_in);

                % for glia
                log_pla_row_col.axo{i} = ext_log_row_col(piv_pla_row_col{i}, mat_fil.high_in, ...
                    mat_fil.low_in);
            end
            save(obj.fil_pat_rec, 'log_pla_row_col', '-append')
        end
        function cor_log_pla_row_col(obj, pla)
            mat_fil = matfile(obj.fil_pat_rec);
            log_pla_row_col = mat_fil.log_pla_row_col;
            piv_pla_row_col = mat_fil.piv_pla_row_col;
            for i = pla
                log_pla_row_col.axo{i} = ext_log_row_col(piv_pla_row_col.glu{i}, mat_fil.high_in, ...
                    mat_fil.low_in);
            end
            save(obj.fil_pat_rec, 'log_pla_row_col', '-append')
        end
        function app_log_pla_row_col_for(obj)
            mat_fil = matfile(obj.fil_pat_rec);
            log_pla_row_col = mat_fil.log_pla_row_col;
            fun_pla = [1 3 4 5 6 7 8];
            con_fil = matfile('\\home.ansatt.ntnu.no\kadiram\Documents\MATLAB\con_esp.mat');
            n_pla = con_fil.n_pla;
            log_pla_row_col.for = cell(n_pla.neu.raw, 1);
            piv_pla_row_col = mat_fil.piv_pla_row_col;
            for i = fun_pla
                log_pla_row_col.for{i} = ext_log_row_col(piv_pla_row_col{i}, mat_fil.high_in, ...
                    mat_fil.low_in);
            end
            save(obj.fil_pat_rec, 'log_pla_row_col', '-append')
        end
        %%%
        function app_axo(obj)
            app_ica_filters_pla(obj)
            disp('1/3 done')
            app_log_pla_row_col_mas(obj)
            disp('2/3 done')
            app_roi_sig(obj)
            disp('3/3 done')
        end
        %%%
        function app_ica_filters_pla(obj)
            con_fil = matfile('\\home.ansatt.ntnu.no\kadiram\Documents\MATLAB\con_esp.mat');
            fun_pla = con_fil.fun_pla;
            n_pla = con_fil.n_pla;
            nPC = 1;
            ica_filters_pla.glu = cell(n_pla.neu.raw, 1);
            for pla_num = fun_pla.raw
                obj_ima_cal = matfile(obj.fil_pat_ima_cal_pla{pla_num});
                piv_row_col_fra = obj_ima_cal.im;
                ica_filters_pla.glu{pla_num} = ext_ica_filters(piv_row_col_fra, nPC);
                % nIC = nPC in ext_ica_filters
            end
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            save(obj.fil_pat_rec, 'ica_filters_pla', '-append')
        end
        function app_log_pla_row_col_mas(obj)
            mat_fil = matfile(obj.fil_pat_rec);
            log_pla_row_col = mat_fil.log_pla_row_col;
            piv_pla_row_col = mat_fil.piv_pla_row_col;
            thr = 0.1;
            log_pla_row_col.mas = ext_log_pla_row_col(piv_pla_row_col, obj.per_bin_edg, thr);
            save(obj.fil_pat_rec, 'log_pla_row_col', '-append')
        end
        function app_roi_sig(obj)
            rec_fil = matfile(obj.fil_pat_rec);
            ica_filters_pla = rec_fil.ica_filters_pla;
            con_fil = matfile('\\home.ansatt.ntnu.no\kadiram\Documents\MATLAB\con_esp.mat');
            n_pla = con_fil.n_pla;
            n_fra = con_fil.n_fra;
            n_fra = n_fra.cal.ses.eig.sti;
            fun_pla = con_fil.fun_pla;
            smwidth = 1.5;
            thresh = 0.7;
            arealims = [10 400];
            plotting = false;
            log_pla_row_col = rec_fil.log_pla_row_col;
            z_sco_pla_row_col.glu = cell(n_pla.neu.raw, 1);
            nPC = 1;
            n_icx = nPC;
            log_pla_icx_row_col.glu = cell(n_pla.neu.raw, n_icx);
            log_pla_roi_row_col = cell(n_pla.neu.raw, 1);% double cell array
            piv_pla_fra_roi = cell(n_pla.neu.raw, 1);
            fra_rat = con_fil.fra_rat;
            fra_rat = fra_rat.cal.eig;
            dff_pla_fra_roi = cell(n_pla.neu.raw, 1);
            for pla = fun_pla.raw
                disp(pla)
                [~, ~, ~, log_pla_icx_row_col.glu(pla, :), ~, ~, ~, ica_filters_fil, ~, n_roi, ...
                    log_pla_roi_row_col{pla}] = CellsortSegmentation(ica_filters_pla.glu{pla}, ...
                    smwidth, thresh, arealims, plotting, log_pla_row_col.axo{pla}, ...
                    log_pla_row_col.mas{pla});
                z_sco_pla_row_col.glu{pla} = abs(squeeze(ica_filters_fil));
                n_roi_pla.raw(pla) = n_roi;% no ini, but works!
                obj_ima_cal = matfile(obj.fil_pat_ima_cal_pla{pla});
                piv_row_col_fra = obj_ima_cal.im;
                piv_pla_fra_roi{pla} = nan(n_fra, n_roi);
                for roi = 1:n_roi
                    piv_fra = ext_piv_fra(piv_row_col_fra, log_pla_roi_row_col{pla}{roi});
                    piv_pla_fra_roi{pla}(:, roi) = piv_fra(1:n_fra);
                end
                dff_pla_fra_roi{pla} = cal_dff_fra_roi.sli(fra_rat, piv_pla_fra_roi{pla});
            end
            ind_pla_roi = ext_ind_pla_cel(n_roi_pla.raw);
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% cell detection !!!!
            load(obj.fil_pat_met_cal, 'metadata')
            [frameStart, frameStop] = ext_fra_sta_sto(metadata, obj.mov_blo, obj.blockLength);
            reg = 'for';
            spe = ext_spe(obj.mov_blo, reg, obj.n_chu);
            n_cel_pla.raw = nan(n_pla.neu.raw, 1);
            cel_fie_pla_row_col.pla = cell(n_pla.neu.raw, 1);
            % flipped when saving as .mat, before cel_det
            piv_pla_fra_cel = cell(n_pla.neu.raw, 1);
            dff_pla_fra_cel = cell(n_pla.neu.raw, 1);
            for j = fun_pla.raw
                includeMask = double(log_pla_row_col.for{j});
                excludeMask = double(log_pla_row_col.axo{j});
                for i = 1:obj.n_chu
                    disp(strcat("Plane ", string(j), "/", string(n_pla.neu.raw), ", chunk ", ...
                        string(i), "/", string(obj.n_chu)))
                    keyword = char(spe(i));
                    detectROI(obj.targetP, obj.confPath, keyword, obj.detectionTimepoint(i), ...
                        obj.windowSize, obj.windowStep, j, includeMask, excludeMask)
                    roi_t = extractTraces(frameStart(i), frameStop(i), obj.targetP, keyword, ...
                        j, obj.fil_pat_ima_cal_pla{j});
                end
                n_cel_pla.raw(j) = max(roi_t.neuronLabels, [], 'all');
                cel_fie_pla_row_col.pla{j} = roi_t.neuronLabels;
                cel_fie_pla_row_col.pla{j}(cel_fie_pla_row_col.pla{j} == 0) = nan;
                piv_pla_fra_cel{j} = roi_t.traces';
                dff_pla_fra_cel{j} = cal_dff_fra_roi.sli(fra_rat, piv_pla_fra_cel{j});
            end
            n_cel_pla.raw(2) = 0;
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% calc !!!
            [~, ~, ~, x_cel, y_cel, z_cel, coo_cel_dim] = cal_xyz_cel(obj.factor_meter, ...
                obj.iniStruct, cel_fie_pla_row_col.pla);
            n_cel.all = sum(n_cel_pla.raw);
            [log_cel_pla, log_pla_row_col.all.all, cel_fie_pla_row_col] = ext_log_cel_pla(n_cel, ...
                n_cel_pla, cel_fie_pla_row_col);
            [~, ~, ~, x_roi, y_roi, z_roi] = cal_xyz_roi(obj.factor_meter, ...
                obj.iniStruct, log_pla_roi_row_col);
            coo_roi_dim = [x_roi y_roi z_roi];
            log_roi.lef.all = y_roi > obj.y_mid;
            log_roi.rig.all = ~log_roi.lef.all;
            log_cel.lef.all = y_cel.abs > obj.y_mid;
            log_cel.rig.all = ~log_cel.lef.all;
            win_len = con_fil.win_len;
            win_len_bas = win_len.dff.eig;
            sti_ons_tri = con_fil.sti_ons_tri;
            isi = con_fil.isi;
            sti_ons_tri = sti_ons_tri.vrs.tap;
            piv_fra_cel = [piv_pla_fra_cel{:}];
            pha_win_len = win_len_bas;
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% with tap data
            [~, ~, ~, ~, ~, dff_cel_fra.tap, ~, ~, log_cel.tap, ~, ~, res_cel.tap] = ...
                cal_rel_cha_uni_poi_tri(...
                piv_fra_cel, win_len_bas, sti_ons_tri, fra_rat, isi, pha_win_len);
            log_cel.lef.tap.exc = log_cel.lef.all & log_cel.tap.srt.exc;
            log_cel.lef.tap.inh = log_cel.lef.all & log_cel.tap.srt.inh;
            log_cel.rig.tap.exc = log_cel.rig.all & log_cel.tap.srt.exc;
            log_cel.rig.tap.inh = log_cel.rig.all & log_cel.tap.srt.inh;
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% corr !!!
            piv_fra_roi = [piv_pla_fra_roi{:}];
            n_roi = sum(n_roi_pla.raw);
            [~, ~, ~, ~, ~, dff_roi_fra.tap, ~, ~, log_roi.tap, ~, ~, res_fie_roi.tap] = ...
                cal_rel_cha_uni_poi_tri(piv_fra_roi, win_len_bas, sti_ons_tri, fra_rat, isi, ...
                win_len.dff.pha.drn.tai);
            log_roi.lef.tap.exc = log_roi.lef.all & log_roi.tap.srt.exc;
            log_roi.lef.tap.inh = log_roi.lef.all & log_roi.tap.srt.inh;
            log_roi.rig.tap.exc = log_roi.rig.all & log_roi.tap.srt.exc;
            log_roi.rig.tap.inh = log_roi.rig.all & log_roi.tap.srt.inh;
            dis_fie_roi_cel.exc.lef = pdist2(coo_roi_dim(log_roi.lef.tap.exc, :), coo_cel_dim(...
                log_cel.lef.all, :));
            dis_fie_roi_cel.exc.rig = pdist2(coo_roi_dim(log_roi.rig.tap.exc, :), coo_cel_dim(...
                log_cel.rig.all, :));
            dis_fie_roi_cel.inh.lef = pdist2(coo_roi_dim(log_roi.lef.tap.inh, :), coo_cel_dim(...
                log_cel.lef.all, :));
            dis_fie_roi_cel.inh.rig = pdist2(coo_roi_dim(log_roi.rig.tap.inh, :), coo_cel_dim(...
                log_cel.rig.all, :));
            dis_fie_pai.tap.exc = [dis_fie_roi_cel.exc.lef(:); dis_fie_roi_cel.exc.rig(:)];
            dis_fie_pai.tap.inh = [dis_fie_roi_cel.inh.lef(:); dis_fie_roi_cel.inh.rig(:)];
            dff_fra.tap.exc = mean(dff_roi_fra.tap(log_roi.tap.srt.exc, :), 1)';
            dff_fra.tap.inh = mean(dff_roi_fra.tap(log_roi.tap.srt.inh, :), 1)';
            dff_fra_roi = [dff_pla_fra_roi{:}];
            log_fra = con_fil.log_fra;
            dff_fra.spo.exc = mean(dff_fra_roi(log_fra.cal.eig.ong, log_roi.tap.srt.exc), 2);
            dff_fra.spo.inh = mean(dff_fra_roi(log_fra.cal.eig.ong, log_roi.tap.srt.inh), 2);
            res_pla_row_col.tap = ext_res_pla_row_col(log_pla_roi_row_col, res_fie_roi.tap.srt);
            dis_blo = con_fil.dis_blo;
            fra_blo.tap = cal_fra_blo(coo_roi_dim, log_roi.tap.srt, dis_blo.for);
            %%% vis, cum pro
            [r_cel.tap, per_cel_bin.tap, r_pla_icx_row_col.tap, cum_pro_bin.tap, r.tap] = cal_r_cel(...
                dff_cel_fra.tap', dff_fra.tap, log_cel_pla, cel_fie_pla_row_col.pla);% EVOKED ACT, RES..
            %%% cor dis
            fie = 'tap';
            [~, r_fie_pai.tap] = cal_cor_fie_fie_roi_cel(dff_roi_fra.tap', log_roi, dff_cel_fra.tap', ...
                log_cel, log_fra.cal.eig.tri, fie);% lef rig, log_fra- all true
            cor_fie_fie_blo.tap = cal_cor_fie_fie_blo(dis_fie_pai.tap, r_fie_pai.tap);
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% with tail data
            bou_ons_bou = rec_fil.bou_ons_bou;
            bou_ons_bou = bou_ons_bou.all;
            %%%%%%%%%%%%%%%
            [~, ~, ~, ~, ~, dff_cel_fra.tai, ~, ~, log_cel.tai, ~, ~, res_cel.tai] = ...
                cal_rel_cha_uni_poi_tri(piv_fra_cel, win_len_bas, bou_ons_bou, fra_rat, isi, ...
                win_len.dff.pha.drn.tai);
            log_cel.lef.tai.exc = log_cel.lef.all & log_cel.tai.srt.exc;
            log_cel.lef.tai.inh = log_cel.lef.all & log_cel.tai.srt.inh;
            log_cel.rig.tai.exc = log_cel.rig.all & log_cel.tai.srt.exc;
            log_cel.rig.tai.inh = log_cel.rig.all & log_cel.tai.srt.inh;
            %
            [~, ~, ~, ~, ~, dff_roi_fra.tai, ~, ~, log_roi.tai, ~, ~, res_fie_roi.tai] = ...
                cal_rel_cha_uni_poi_tri(piv_fra_roi, win_len_bas, bou_ons_bou, fra_rat, isi, ...
                win_len.dff.pha.drn.tai);
            log_roi.lef.tai.exc = log_roi.lef.all & log_roi.tai.srt.exc;
            log_roi.lef.tai.inh = log_roi.lef.all & log_roi.tai.srt.inh;
            log_roi.rig.tai.exc = log_roi.rig.all & log_roi.tai.srt.exc;
            log_roi.rig.tai.inh = log_roi.rig.all & log_roi.tai.srt.inh;
            %%%%%%%%%%%%%%%
            dff_fra.tai.exc = mean(dff_roi_fra.tai(log_roi.tai.srt.exc, :), 1)';
            dff_fra.tai.inh = mean(dff_roi_fra.tai(log_roi.tai.srt.inh, :), 1)';
            res_pla_row_col.tai = ext_res_pla_row_col(log_pla_roi_row_col, res_fie_roi.tai.srt);
            fra_blo.tai = cal_fra_blo(coo_roi_dim, log_roi.tai.srt, dis_blo.for);
            %%% vis, cum pro
            [r_cel.tai, per_cel_bin.tai, r_pla_icx_row_col.tai, cum_pro_bin.tai, r.tai] = cal_r_cel(...
                dff_cel_fra.tai', dff_fra.tai, log_cel_pla, cel_fie_pla_row_col.pla);
            % 'trial'-averaged for cells & axons
            
            %%% cor dis
            dis_fie_roi_cel.exc.lef = pdist2(coo_roi_dim(log_roi.lef.tai.exc, :), coo_cel_dim(...
                log_cel.lef.all, :));
            dis_fie_roi_cel.exc.rig = pdist2(coo_roi_dim(log_roi.rig.tai.exc, :), coo_cel_dim(...
                log_cel.rig.all, :));
            dis_fie_roi_cel.inh.lef = pdist2(coo_roi_dim(log_roi.lef.tai.inh, :), coo_cel_dim(...
                log_cel.lef.all, :));
            dis_fie_roi_cel.inh.rig = pdist2(coo_roi_dim(log_roi.rig.tai.inh, :), coo_cel_dim(...
                log_cel.rig.all, :));
            dis_fie_pai.tai.exc = [dis_fie_roi_cel.exc.lef(:); dis_fie_roi_cel.exc.rig(:)];
            dis_fie_pai.tai.inh = [dis_fie_roi_cel.inh.lef(:); dis_fie_roi_cel.inh.rig(:)];
            fie = 'tai';
            [~, r_fie_pai.tai] = cal_cor_fie_fie_roi_cel(dff_roi_fra.tai', log_roi, ...
                dff_cel_fra.tai', log_cel, log_fra.cal.eig.tri, fie);
            cor_fie_fie_blo.tai = cal_cor_fie_fie_blo(dis_fie_pai.tai, r_fie_pai.tai);
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            save(obj.fil_pat_rec, 'ind_pla_roi', 'x_cel', 'y_cel', 'z_cel', 'coo_cel_dim', 'n_cel', ...
                'log_cel_pla', 'log_pla_row_col', 'cel_fie_pla_row_col', 'coo_roi_dim', 'x_roi', ...
                'y_roi', 'z_roi', 'n_roi_pla', 'log_pla_roi_row_col', 'piv_pla_fra_roi', ...
                'dff_pla_fra_roi', 'dff_cel_fra', 'log_cel', 'res_cel', 'log_pla_icx_row_col', ...
                'z_sco_pla_row_col', 'dff_roi_fra', 'res_fie_roi', 'dis_fie_pai', 'r_fie_pai', ...
                'dff_fra', 'res_pla_row_col', 'fra_blo', 'r_cel', 'per_cel_bin', ...
                'r_pla_icx_row_col', 'cum_pro_bin', 'r', 'log_roi', 'cor_fie_fie_blo', 'n_roi', ...
                'frameStart', 'frameStop', 'n_cel_pla', 'piv_pla_fra_cel', 'dff_pla_fra_cel', ...
                '-append')


            rec_fil = matfile(obj.fil_pat_rec);
            dff_fra = rec_fil.dff_fra;
            dff_pla_fra_roi = rec_fil.dff_pla_fra_roi;
            dff_fra_roi = [dff_pla_fra_roi{:}];
            con_fil = matfile('\\home.ansatt.ntnu.no\kadiram\Documents\MATLAB\con_esp.mat');
            log_fra = con_fil.log_fra;
            log_roi = rec_fil.log_roi;
            win_len = con_fil.win_len;
            win_len_bas = win_len.dff.eig;
            sti_ons_tri = con_fil.sti_ons_tri;
            isi = con_fil.isi;
            sti_ons_tri = sti_ons_tri.vrs.tap;
            fra_rat = con_fil.fra_rat;
            fra_rat = fra_rat.cal.eig;
            piv_pla_fra_roi = rec_fil.piv_pla_fra_roi;
            piv_fra_roi = [piv_pla_fra_roi{:}];
            [~, ~, ~, ~, ~, ~, ~, ~, log_roi.tap, ~, ~, ~] = ...
                cal_rel_cha_uni_poi_tri(piv_fra_roi, win_len_bas, sti_ons_tri, fra_rat, isi, ...
                win_len.dff.pha.drn.tai);
            log_roi.lef.tap.exc = log_roi.lef.all & log_roi.tap.srt.exc;
            log_roi.lef.tap.inh = log_roi.lef.all & log_roi.tap.srt.inh;
            log_roi.rig.tap.exc = log_roi.rig.all & log_roi.tap.srt.exc;
            log_roi.rig.tap.inh = log_roi.rig.all & log_roi.tap.srt.inh;
            dff_fra.spo_tap.exc = mean(dff_fra_roi(log_fra.cal.eig.ong_gli, log_roi.tap.srt.exc), 2);
            dff_fra.spo_tap.inh = mean(dff_fra_roi(log_fra.cal.eig.ong_gli, log_roi.tap.srt.inh), 2);
            r_cel = rec_fil.r_cel;
            per_cel_bin = rec_fil.per_cel_bin;
            r_pla_icx_row_col = rec_fil.r_pla_icx_row_col;
            r = rec_fil.r;
            dff_pla_fra_cel = rec_fil.dff_pla_fra_cel;
            dff_fra_cel = [dff_pla_fra_cel{:}];
            log_cel_pla = rec_fil.log_cel_pla;
            cel_fie_pla_row_col = rec_fil.cel_fie_pla_row_col;
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% with tap data
            [r_cel.spo_tap, per_cel_bin.spo_tap, r_pla_icx_row_col.spo_tap, cum_pro_bin.spo_tap, ...
                r.spo_tap] = cal_r_cel(dff_fra_cel(log_fra.cal.eig.ong_gli, :), dff_fra.spo_tap, ...
                log_cel_pla, cel_fie_pla_row_col.pla);
            log_cel = rec_fil.log_cel;
            r_fie_pai = rec_fil.r_fie_pai;
            fie = 'tap';
            [~, r_fie_pai.spo_tap] = cal_cor_fie_fie_roi_cel(dff_fra_roi, log_roi, dff_fra_cel, ...
                log_cel, log_fra.cal.eig.ong_gli, fie);

            cor_fie_fie_blo.spo_tap = cal_cor_fie_fie_blo(dis_fie_pai.tap, r_fie_pai.spo_tap);
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            save(obj.fil_pat_rec, 'log_roi', 'r_fie_pai', 'dff_fra', 'r_cel', 'per_cel_bin', ...
                'r_pla_icx_row_col', 'cum_pro_bin', 'r', '-append')

            rec_fil = matfile(obj.fil_pat_rec);
            dis_fie_pai = rec_fil.dis_fie_pai;
            r_fie_pai = rec_fil.r_fie_pai;
            % dis_fie_pai.tai: for the pairs, axons identified based on
            % tail response - dis_fie_pai.tai.exc, dis_fie_pai.tai.inh
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            %%%%%%%%%%%%%%%%%%%%% with tail data
            dff_pla_fra_roi = rec_fil.dff_pla_fra_roi;
            dff_fra_roi = [dff_pla_fra_roi{:}];
            con_fil = matfile('\\home.ansatt.ntnu.no\kadiram\Documents\MATLAB\con_esp.mat');
            log_fra = con_fil.log_fra;
            log_roi = rec_fil.log_roi;
            dff_fra = rec_fil.dff_fra;
            dff_fra.spo_tai.exc = mean(dff_fra_roi(log_fra.cal.eig.ong_gli, log_roi.tai.srt.exc), 2);
            dff_fra.spo_tai.inh = mean(dff_fra_roi(log_fra.cal.eig.ong_gli, log_roi.tai.srt.inh), 2);
            cum_pro_bin = rec_fil.cum_pro_bin;
            r_cel = rec_fil.r_cel;
            per_cel_bin = rec_fil.per_cel_bin;
            r_pla_icx_row_col = rec_fil.r_pla_icx_row_col;
            r = rec_fil.r;
            dff_pla_fra_cel = rec_fil.dff_pla_fra_cel;
            dff_fra_cel = [dff_pla_fra_cel{:}];
            log_cel_pla = rec_fil.log_cel_pla;
            cel_fie_pla_row_col = rec_fil.cel_fie_pla_row_col;
            [r_cel.spo_tai, per_cel_bin.spo_tai, r_pla_icx_row_col.spo_tai, cum_pro_bin.spo_tai, ...
                r.spo_tai] = cal_r_cel(dff_fra_cel(log_fra.cal.eig.ong_gli, :), dff_fra.spo_tai, ...
                log_cel_pla, cel_fie_pla_row_col.pla);% entire ongoing ~10 min.
            log_cel = rec_fil.log_cel;
            [~, r_fie_pai.spo_tai] = cal_cor_fie_fie_roi_cel(dff_fra_roi, log_roi, dff_fra_cel, ...
                log_cel, log_fra.cal.eig.ong_gli, 'tai');
            cor_fie_fie_blo = rec_fil.cor_fie_fie_blo;
            cor_fie_fie_blo.spo_tai = cal_cor_fie_fie_blo(dis_fie_pai.tai, r_fie_pai.spo_tai);
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% exc/inh cel - for evoked
            dff_cel_fra = rec_fil.dff_cel_fra;
            %%% tai-exc
            dff_fra_cel = dff_cel_fra.tai(log_cel.tai.srt.exc, :)';
            [r_cel.tai_exc, per_cel_bin.tai_exc, r_pla_icx_row_col.tai_exc, cum_pro_bin.tai_exc, ...
                r.tai_exc] = cal_r_cel(dff_fra_cel, dff_fra.tai);
            coo_roi_dim = rec_fil.coo_roi_dim;
            coo_cel_dim = rec_fil.coo_cel_dim;
            fie_mod = 'tai';
            fie_cel = 'exc';

            % we need to have the distance between the exc axons and exc
            % cells
            dis_tem_pai = cal_dis_fie_pai(coo_roi_dim, log_roi, coo_cel_dim, log_cel, fie_mod, ...
                fie_cel);

            % .tai_exc: tai-for identification of axons, exc-for
            % identification of fb cells|.exc-for the axons
            dis_fie_pai.tai_exc.exc = dis_tem_pai.(fie_mod).exc;
            dis_fie_pai.tai_exc.inh = dis_tem_pai.(fie_mod).inh;
            dff_roi_fra = rec_fil.dff_roi_fra;
            [~, r_fie_pai.tai_exc] = cal_cor_fie_fie_roi_cel(dff_roi_fra.tai', log_roi, dff_fra_cel...
                , log_cel, log_fra.cal.eig.tri, fie_mod, fie_cel);% log_cel: for rig/lef
            cor_fie_fie_blo.tai_exc = cal_cor_fie_fie_blo(dis_fie_pai.tai_exc, r_fie_pai.tai_exc);
            %%% tai-inh
            dff_fra_cel = dff_cel_fra.tai(log_cel.tai.srt.inh, :)';
            [r_cel.tai_inh, per_cel_bin.tai_inh, r_pla_icx_row_col.tai_inh, cum_pro_bin.tai_inh, ...
                r.tai_inh] = cal_r_cel(dff_fra_cel, dff_fra.tai);
            fie_cel = 'inh';
            dis_tem_pai = cal_dis_fie_pai(coo_roi_dim, log_roi, coo_cel_dim, log_cel, fie_mod, ...
                fie_cel);
            dis_fie_pai.tai_inh.exc = dis_tem_pai.(fie_mod).exc;
            dis_fie_pai.tai_inh.inh = dis_tem_pai.(fie_mod).inh;
            [~, r_fie_pai.tai_inh] = cal_cor_fie_fie_roi_cel(dff_roi_fra.tai', log_roi, dff_fra_cel...
                , log_cel, log_fra.cal.eig.tri, fie_mod, fie_cel);% log_cel: for rig/lef
            cor_fie_fie_blo.tai_inh = cal_cor_fie_fie_blo(dis_fie_pai.tai_inh, r_fie_pai.tai_inh);
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% exc/inh cel - for spo
            dff_fra_cel = [dff_pla_fra_cel{:}];
            %%% exc
            [r_cel.spo_tai_exc, per_cel_bin.spo_tai_exc, r_pla_icx_row_col.spo_tai_exc, ...
                cum_pro_bin.spo_tai_exc, r.spo_tai_exc] = cal_r_cel(dff_fra_cel(...
                log_fra.cal.eig.ong_gli, log_cel.tai.srt.exc), dff_fra.spo_tai);%entire ongoing ~10 min
            fie_cel = 'exc';
            [~, r_fie_pai.spo_tai_exc] = cal_cor_fie_fie_roi_cel(dff_fra_roi, log_roi, dff_fra_cel, ...
                log_cel, log_fra.cal.eig.ong_gli, fie_mod, fie_cel);
            cor_fie_fie_blo.spo_tai_exc = cal_cor_fie_fie_blo(dis_fie_pai.tai_exc, ...
                r_fie_pai.spo_tai_exc);
            %%% inh
            [r_cel.spo_tai_inh, per_cel_bin.spo_tai_inh, r_pla_icx_row_col.spo_tai_inh, ...
                cum_pro_bin.spo_tai_inh, r.spo_tai_inh] = cal_r_cel(dff_fra_cel(...
                log_fra.cal.eig.ong_gli, log_cel.tai.srt.inh), dff_fra.spo_tai);%entire ongoing ~10 min
            fie_cel = 'inh';
            [~, r_fie_pai.spo_tai_inh] = cal_cor_fie_fie_roi_cel(dff_fra_roi, log_roi, dff_fra_cel, ...
                log_cel, log_fra.cal.eig.ong_gli, fie_mod, fie_cel);
            cor_fie_fie_blo.spo_tai_inh = cal_cor_fie_fie_blo(dis_fie_pai.tai_inh, ...
                r_fie_pai.spo_tai_inh);
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            save(obj.fil_pat_rec, 'dff_fra', 'r_cel', 'per_cel_bin', 'r_pla_icx_row_col', ...
                'cum_pro_bin', 'r', 'dis_fie_pai', 'r_fie_pai', 'cor_fie_fie_blo', '-append')



            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            rec_fil = matfile(obj.fil_pat_rec);
            con_fil = matfile('\\home.ansatt.ntnu.no\kadiram\Documents\MATLAB\con_esp.mat');
            coo_roi_dim = rec_fil.coo_roi_dim;
            log_roi = rec_fil.log_roi;
            log_cel_pla = rec_fil.log_cel_pla;
            cel_fie_pla_row_col = rec_fil.cel_fie_pla_row_col;
            log_cel = rec_fil.log_cel;
            coo_cel_dim = rec_fil.coo_cel_dim;
            win_len = con_fil.win_len;
            win_len_bas = win_len.dff.eig;
            isi = con_fil.isi;
            piv_pla_fra_cel = rec_fil.piv_pla_fra_cel;
            piv_fra_cel = [piv_pla_fra_cel{:}];
            piv_pla_fra_roi = rec_fil.piv_pla_fra_roi;
            piv_fra_roi = [piv_pla_fra_roi{:}];
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% with tail data
            bou_ons_bou = rec_fil.bou_ons_bou;
            bou_ons_bou = bou_ons_bou.non;
            %%%%%%%%%%%%%%%
            dff_cel_fra = rec_fil.dff_cel_fra;
            res_cel = rec_fil.res_cel;
            fra_rat = con_fil.fra_rat;
            fra_rat = fra_rat.cal.eig;
            [~, ~, ~, ~, ~, dff_cel_fra.bou_non, ~, ~, log_cel.bou_non, ~, ~, res_cel.bou_non] = ...
                cal_rel_cha_uni_poi_tri(piv_fra_cel, win_len_bas, bou_ons_bou, fra_rat, isi, ...
                win_len.dff.pha.drn.tai);
            disp('cells done')
            log_cel.lef.bou_non.exc = log_cel.lef.all & log_cel.bou_non.srt.exc;
            log_cel.lef.bou_non.inh = log_cel.lef.all & log_cel.bou_non.srt.inh;
            log_cel.rig.bou_non.exc = log_cel.rig.all & log_cel.bou_non.srt.exc;
            log_cel.rig.bou_non.inh = log_cel.rig.all & log_cel.bou_non.srt.inh;
            %
            dff_roi_fra = rec_fil.dff_roi_fra;
            res_fie_roi = rec_fil.res_fie_roi;
            [~, ~, ~, ~, ~, dff_roi_fra.bou_non, ~, ~, log_roi.bou_non, ~, ~, res_fie_roi.bou_non]...
                = cal_rel_cha_uni_poi_tri(piv_fra_roi, win_len_bas, bou_ons_bou, fra_rat, isi, ...
                win_len.dff.pha.drn.tai);
            disp('rois done')
            log_roi.lef.bou_non.exc = log_roi.lef.all & log_roi.bou_non.srt.exc;
            log_roi.lef.bou_non.inh = log_roi.lef.all & log_roi.bou_non.srt.inh;
            log_roi.rig.bou_non.exc = log_roi.rig.all & log_roi.bou_non.srt.exc;
            log_roi.rig.bou_non.inh = log_roi.rig.all & log_roi.bou_non.srt.inh;
            %%%%%%%%%%%%%%%
            dff_fra = rec_fil.dff_fra;
            dff_fra.bou_non.exc = mean(dff_roi_fra.bou_non(log_roi.bou_non.srt.exc, :), 1)';
            dff_fra.bou_non.inh = mean(dff_roi_fra.bou_non(log_roi.bou_non.srt.inh, :), 1)';
            res_pla_row_col = rec_fil.res_pla_row_col;
            log_pla_roi_row_col = rec_fil.log_pla_roi_row_col;
            res_pla_row_col.bou_non = ext_res_pla_row_col(log_pla_roi_row_col, ...
                res_fie_roi.bou_non.srt);
            fra_blo = rec_fil.fra_blo;
            dis_blo = con_fil.dis_blo;
            fra_blo.bou_non = cal_fra_blo(coo_roi_dim, log_roi.bou_non.srt, dis_blo.for);
            %%% vis, cum pro
            r_cel = rec_fil.r_cel;
            per_cel_bin = rec_fil.per_cel_bin;
            r_pla_icx_row_col = rec_fil.r_pla_icx_row_col;
            cum_pro_bin = rec_fil.cum_pro_bin;
            r = rec_fil.r;
            [r_cel.bou_non, per_cel_bin.bou_non, r_pla_icx_row_col.bou_non, cum_pro_bin.bou_non, ...
                r.bou_non] = cal_r_cel(dff_cel_fra.bou_non', dff_fra.bou_non, log_cel_pla, ...
                cel_fie_pla_row_col.pla);
            % 'trial'-averaged for cells & axons
            
            %%% cor dis
            dis_fie_roi_cel.exc.lef = pdist2(coo_roi_dim(log_roi.lef.bou_non.exc, :), coo_cel_dim(...
                log_cel.lef.all, :));
            dis_fie_roi_cel.exc.rig = pdist2(coo_roi_dim(log_roi.rig.bou_non.exc, :), coo_cel_dim(...
                log_cel.rig.all, :));
            dis_fie_roi_cel.inh.lef = pdist2(coo_roi_dim(log_roi.lef.bou_non.inh, :), coo_cel_dim(...
                log_cel.lef.all, :));
            dis_fie_roi_cel.inh.rig = pdist2(coo_roi_dim(log_roi.rig.bou_non.inh, :), coo_cel_dim(...
                log_cel.rig.all, :));
            dis_fie_pai = rec_fil.dis_fie_pai;
            dis_fie_pai.bou_non.exc = [dis_fie_roi_cel.exc.lef(:); dis_fie_roi_cel.exc.rig(:)];
            dis_fie_pai.bou_non.inh = [dis_fie_roi_cel.inh.lef(:); dis_fie_roi_cel.inh.rig(:)];
            fie = 'bou_non';
            r_fie_pai = rec_fil.r_fie_pai;
            log_fra = con_fil.log_fra;
            [~, r_fie_pai.bou_non] = cal_cor_fie_fie_roi_cel(dff_roi_fra.bou_non', log_roi, ...
                dff_cel_fra.bou_non', log_cel, log_fra.cal.eig.tri, fie);
            cor_fie_fie_blo = rec_fil.cor_fie_fie_blo;
            cor_fie_fie_blo.bou_non = cal_cor_fie_fie_blo(dis_fie_pai.bou_non, r_fie_pai.bou_non);
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            save(obj.fil_pat_rec, 'dff_cel_fra', 'log_cel', 'res_cel', 'dff_roi_fra', 'res_fie_roi'...
                , 'dis_fie_pai', 'r_fie_pai', 'dff_fra', 'res_pla_row_col', 'fra_blo', 'r_cel', ...
                'per_cel_bin', 'r_pla_icx_row_col', 'cum_pro_bin', 'r', 'log_roi', ...
                'cor_fie_fie_blo', '-append')

            rec_fil = matfile(obj.fil_pat_rec);
            dis_fie_pai = rec_fil.dis_fie_pai;
            r_fie_pai = rec_fil.r_fie_pai;
            %%%%%%%%%%%%%%%%%%%%% with tail data
            dff_pla_fra_roi = rec_fil.dff_pla_fra_roi;
            dff_fra_roi = [dff_pla_fra_roi{:}];
            con_fil = matfile('\\home.ansatt.ntnu.no\kadiram\Documents\MATLAB\con_esp.mat');
            log_fra = con_fil.log_fra;
            log_roi = rec_fil.log_roi;
            dff_fra = rec_fil.dff_fra;
            dff_fra.spo_bou_non.exc = mean(dff_fra_roi(log_fra.cal.eig.ong_gli, ...
                log_roi.bou_non.srt.exc), 2);
            dff_fra.spo_bou_non.inh = mean(dff_fra_roi(log_fra.cal.eig.ong_gli, ...
                log_roi.bou_non.srt.inh), 2);
            cum_pro_bin = rec_fil.cum_pro_bin;
            dff_pla_fra_cel = rec_fil.dff_pla_fra_cel;
            dff_fra_cel = [dff_pla_fra_cel{:}];
            r_pla_icx_row_col = rec_fil.r_pla_icx_row_col;
            r = rec_fil.r;
            log_cel_pla = rec_fil.log_cel_pla;
            cel_fie_pla_row_col = rec_fil.cel_fie_pla_row_col;
            [~, ~, r_pla_icx_row_col.spo_bou_non, cum_pro_bin.spo_bou_non, r.spo_bou_non] = ...
                cal_r_cel(dff_fra_cel(log_fra.cal.eig.ong_gli, :), dff_fra.spo_bou_non, log_cel_pla...
                , cel_fie_pla_row_col.pla);
            log_cel = rec_fil.log_cel;
            [~, r_fie_pai.spo_bou_non] = cal_cor_fie_fie_roi_cel(dff_fra_roi, log_roi, dff_fra_cel, ...
                log_cel, log_fra.cal.eig.ong_gli, 'bou_non');
            cor_fie_fie_blo = rec_fil.cor_fie_fie_blo;
            cor_fie_fie_blo.spo_bou_non = cal_cor_fie_fie_blo(dis_fie_pai.bou_non, ...
                r_fie_pai.spo_bou_non);
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% exc/inh cel - for evoked
            dff_cel_fra = rec_fil.dff_cel_fra;
            %%% tai-exc
            dff_fra_cel = dff_cel_fra.bou_non(log_cel.bou_non.srt.exc, :)';
            [~, ~, ~, cum_pro_bin.bou_non_exc, r.bou_non_exc] = cal_r_cel(dff_fra_cel, ...
                dff_fra.bou_non);
            coo_roi_dim = rec_fil.coo_roi_dim;
            coo_cel_dim = rec_fil.coo_cel_dim;
            fie_mod = 'bou_non';
            fie_cel = 'exc';
            dis_tem_pai = cal_dis_fie_pai(coo_roi_dim, log_roi, coo_cel_dim, log_cel, fie_mod, ...
                fie_cel);
            dis_fie_pai.bou_non_exc.exc = dis_tem_pai.(fie_mod).exc;
            dis_fie_pai.bou_non_exc.inh = dis_tem_pai.(fie_mod).inh;
            dff_roi_fra = rec_fil.dff_roi_fra;
            [~, r_fie_pai.bou_non_exc] = cal_cor_fie_fie_roi_cel(dff_roi_fra.bou_non', log_roi, ...
                dff_fra_cel, log_cel, log_fra.cal.eig.tri, fie_mod, fie_cel);% log_cel: for rig/lef
            cor_fie_fie_blo.bou_non_exc = cal_cor_fie_fie_blo(dis_fie_pai.bou_non_exc, ...
                r_fie_pai.bou_non_exc);
            %%% tai-inh
            dff_fra_cel = dff_cel_fra.bou_non(log_cel.bou_non.srt.inh, :)';
            [~, ~, ~, cum_pro_bin.bou_non_inh, r.bou_non_inh] = cal_r_cel(dff_fra_cel, ...
                dff_fra.bou_non);
            fie_cel = 'inh';
            dis_tem_pai = cal_dis_fie_pai(coo_roi_dim, log_roi, coo_cel_dim, log_cel, fie_mod, ...
                fie_cel);
            dis_fie_pai.bou_non_inh.exc = dis_tem_pai.(fie_mod).exc;
            dis_fie_pai.bou_non_inh.inh = dis_tem_pai.(fie_mod).inh;
            [~, r_fie_pai.bou_non_inh] = cal_cor_fie_fie_roi_cel(dff_roi_fra.bou_non', log_roi, ...
                dff_fra_cel, log_cel, log_fra.cal.eig.tri, fie_mod, fie_cel);% log_cel: for rig/lef
            cor_fie_fie_blo.bou_non_inh = cal_cor_fie_fie_blo(dis_fie_pai.bou_non_inh, ...
                r_fie_pai.bou_non_inh);
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% exc/inh cel - for spo
            dff_fra_cel = [dff_pla_fra_cel{:}];
            %%% exc
            [~, ~, ~, cum_pro_bin.spo_bou_non_exc, r.spo_bou_non_exc] = cal_r_cel(dff_fra_cel...
                (log_fra.cal.eig.ong_gli, log_cel.bou_non.srt.exc), dff_fra.spo_bou_non);
            fie_cel = 'exc';
            [~, r_fie_pai.spo_bou_non_exc] = cal_cor_fie_fie_roi_cel(dff_fra_roi, log_roi, ...
                dff_fra_cel, log_cel, log_fra.cal.eig.ong_gli, fie_mod, fie_cel);
            cor_fie_fie_blo.spo_bou_non_exc = cal_cor_fie_fie_blo(dis_fie_pai.bou_non_exc, ...
                r_fie_pai.spo_bou_non_exc);
            %%% inh
            [~, ~, ~, cum_pro_bin.spo_bou_non_inh, r.spo_bou_non_inh] = cal_r_cel(dff_fra_cel...
                (log_fra.cal.eig.ong_gli, log_cel.bou_non.srt.inh), dff_fra.spo_bou_non);
            fie_cel = 'inh';
            [~, r_fie_pai.spo_bou_non_inh] = cal_cor_fie_fie_roi_cel(dff_fra_roi, log_roi, ...
                dff_fra_cel, log_cel, log_fra.cal.eig.ong_gli, fie_mod, fie_cel);
            cor_fie_fie_blo.spo_bou_non_inh = cal_cor_fie_fie_blo(dis_fie_pai.bou_non_inh, ...
                r_fie_pai.spo_bou_non_inh);
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            save(obj.fil_pat_rec, 'dff_fra', 'cum_pro_bin', 'dis_fie_pai', 'r_fie_pai', ...
                'cor_fie_fie_blo', 'r', 'r_pla_icx_row_col', '-append')

            rec_fil = matfile(obj.fil_pat_rec);
            coo_roi_dim = rec_fil.coo_roi_dim;
            log_roi = rec_fil.log_roi;
            coo_cel_dim = rec_fil.coo_cel_dim;
            log_cel = rec_fil.log_cel;
            dis_fie_roi_cel.lef = pdist2(coo_roi_dim(log_roi.lef.all, :), coo_cel_dim(...
                log_cel.lef.all, :));
            dis_fie_roi_cel.rig = pdist2(coo_roi_dim(log_roi.rig.all, :), coo_cel_dim(...
                log_cel.rig.all, :));
            dis_fie_pai = rec_fil.dis_fie_pai;
            dis_fie_pai.bou_non.all = [dis_fie_roi_cel.lef(:); dis_fie_roi_cel.rig(:)];
            r_fie_pai = rec_fil.r_fie_pai;
            %%%%%%%%%%%%%%%%%%%%% with tail data
            dff_pla_fra_roi = rec_fil.dff_pla_fra_roi;
            dff_fra_roi = [dff_pla_fra_roi{:}];
            con_fil = matfile('\\home.ansatt.ntnu.no\kadiram\Documents\MATLAB\con_esp.mat');
            log_fra = con_fil.log_fra;
            dff_pla_fra_cel = rec_fil.dff_pla_fra_cel;
            dff_fra_cel = [dff_pla_fra_cel{:}];
            [~, r_fie_pai.spo_bou_non] = cal_cor_fie_fie_roi_cel(dff_fra_roi, log_roi, dff_fra_cel, ...
                log_cel, log_fra.cal.eig.ong_gli, 'bou_non');
            cor_fie_fie_blo = rec_fil.cor_fie_fie_blo;
            cor_fie_fie_blo.spo_bou_non = cal_cor_fie_fie_blo(dis_fie_pai.bou_non, ...
                r_fie_pai.spo_bou_non);
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            save(obj.fil_pat_rec, 'dis_fie_pai', 'r_fie_pai', 'cor_fie_fie_blo', '-append')
        end
        % in
        function app_par_roi_sig(obj)
            rec_fil = matfile(obj.fil_pat_rec);
            coo_roi_dim = rec_fil.coo_roi_dim;
            log_roi = rec_fil.log_roi;
            coo_cel_dim = rec_fil.coo_cel_dim;
            log_cel = rec_fil.log_cel;
            dis_fie_roi_cel.lef = pdist2(coo_roi_dim(log_roi.lef.all, :), coo_cel_dim(...
                log_cel.lef.all, :));
            dis_fie_roi_cel.rig = pdist2(coo_roi_dim(log_roi.rig.all, :), coo_cel_dim(...
                log_cel.rig.all, :));
            dis_fie_pai = rec_fil.dis_fie_pai;
            dis_fie_pai.bou_non.all = [dis_fie_roi_cel.lef(:); dis_fie_roi_cel.rig(:)];
            r_fie_pai = rec_fil.r_fie_pai;
            %%%%%%%%%%%%%%%%%%%%% with tail data
            dff_pla_fra_roi = rec_fil.dff_pla_fra_roi;
            dff_fra_roi = [dff_pla_fra_roi{:}];
            con_fil = matfile('\\home.ansatt.ntnu.no\kadiram\Documents\MATLAB\con_esp.mat');
            log_fra = con_fil.log_fra;
            dff_pla_fra_cel = rec_fil.dff_pla_fra_cel;
            dff_fra_cel = [dff_pla_fra_cel{:}];
            [~, r_fie_pai.spo_bou_non] = cal_cor_fie_fie_roi_cel(dff_fra_roi, log_roi, dff_fra_cel, ...
                log_cel, log_fra.cal.eig.ong_gli, 'bou_non');
            cor_fie_fie_blo = rec_fil.cor_fie_fie_blo;
            cor_fie_fie_blo.spo_bou_non = cal_cor_fie_fie_blo(dis_fie_pai.bou_non, ...
                r_fie_pai.spo_bou_non);
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            save(obj.fil_pat_rec, 'dis_fie_pai', 'r_fie_pai', 'cor_fie_fie_blo', '-append')
        end
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% axo onl
        function app_log_pla_icx_row_col(obj)
            con_fil = matfile('\\home.ansatt.ntnu.no\kadiram\Documents\MATLAB\con_esp.mat');
            n_pla = con_fil.n_pla;
            fun_pla = con_fil.fun_pla;
            rec_fil = matfile(obj.fil_pat_rec);

            piv_pla_row_col = rec_fil.piv_pla_row_col;

            % for axo

            % piv_pla_row_col = piv_pla_row_col.glu;% ave. raw image
            % log_pla_row_col: manually drawn roi for the target region

            log_pla_icx_row_col = ext_log_pla_icx_row_col(piv_pla_row_col, ...
                rec_fil.log_pla_row_col, rec_fil.low_in, obj.per_bin_edg);% pixel identification
            [n_pix_pla, n_pix] = ext_n_pix_pla(log_pla_icx_row_col.glu);
            piv_pla_fra_pix = cell(n_pla.neu.raw, 1);
            for pla_num = fun_pla.raw

                % for axo
                % obj_ima_cal = matfile(obj.fil_pat_ima_cal_glu_pla{pla_num});

                obj_ima_cal = matfile(obj.fil_pat_ima_cal_pla{pla_num});
                piv_row_col_fra = obj_ima_cal.im;
                piv_pla_fra_pix{pla_num} = ext_sig_roi(piv_row_col_fra, log_pla_icx_row_col.glu...
                    {pla_num});% only for the identified pixels !
            end
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            save(obj.fil_pat_rec, 'log_pla_icx_row_col', 'n_pix_pla', 'n_pix', 'piv_pla_fra_pix', ...
                '-append')

             [x_pla_pix, y_pla_pix, z_pla_pix] = ext_xyz_pla_pix(log_pla_icx_row_col.glu, ...
                obj.factor_meter, obj.iniStruct);
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            save(obj.fil_pat_rec, 'x_pla_pix', 'y_pla_pix', 'z_pla_pix', '-append')

            %%%%%%%%%%%% BIN %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            [piv_pla_fra_bin, x_bin, y_bin, z_bin, dis_bin_bin.all] = cal_piv_pla_fra_bin(...
                piv_pla_fra_pix, log_pla_icx_row_col.glu, x_pla_pix, y_pla_pix, z_pla_pix);
            coo_bin_dim = [x_bin y_bin z_bin];
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            save(obj.fil_pat_rec, 'piv_pla_fra_bin', 'x_bin', 'y_bin', 'z_bin', 'dis_bin_bin', ...
                'coo_bin_dim', '-append')

            n_bin_pla = cellfun(@(x) size(x, 2), piv_pla_fra_bin);
            n_bin.all = length(x_bin);
            log_bin.all.all = true(n_bin.all, 1);
            n_bin.dor = sum(n_bin_pla(fun_pla.dor));
            log_bin.dor = [false(n_bin_pla(1), 1); true(n_bin.dor, 1); false(n_bin.all - n_bin_pla(...
                1) - n_bin.dor, 1)];
            log_bin.lef.all = y_bin > obj.y_mid;
            log_bin.rig.all = ~log_bin.lef.all;
            dis_bin_bin.lef = dis_bin_bin.all(log_bin.lef.all, log_bin.lef.all);
            dis_pai_lef = ext_upp(dis_bin_bin.lef);
            dis_bin_bin.rig = dis_bin_bin.all(log_bin.rig.all, log_bin.rig.all);
            dis_pai_rig = ext_upp(dis_bin_bin.rig);
            dis_pai = [dis_pai_lef; dis_pai_rig];
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            save(obj.fil_pat_rec, 'n_bin_pla', 'n_bin', 'log_bin', 'dis_pai', '-append')
            
            % win_len = con_fil.win_len;
            % bou_ons_bou = rec_fil.bou_ons_bou;
            % log_bin = rec_fil.log_bin;
            % fra_rat = con_fil.fra_rat;
            % isi = con_fil.isi;
            % [dff_bin_fra.bou.all, log_bin.all, res_bin.all, dff_bin_bou_win, ...
            %     dff_bin_fra_bou] = ext_dff_pix_fra.tri(piv_pla_fra_bin, win_len.dff.eig, ...
            %     bou_ons_bou.all, fra_rat.cal.eig, isi, win_len.dff.pha.drn.tai, log_bin.all);
            % log_bou = rec_fil.log_bou;
            % coo_bin_dim = rec_fil.coo_bin_dim;
            % dis_blo = con_fil.dis_blo;
            % [log_bin.all, ~, res_bin.all] = ext_inh_exc(dff_bin_bou_win, log_bou.all, log_bin.all);
            % [log_bin.vib, ~, res_bin.vib] = ext_inh_exc(dff_bin_bou_win, log_bou.vib, log_bin.all);
            % [log_bin.non, ~, res_bin.non] = ext_inh_exc(dff_bin_bou_win, log_bou.non, log_bin.all);
            % fra_blo.all = cal_fra_blo(coo_bin_dim, log_bin.all, dis_blo.for);
            % fra_blo.vib = cal_fra_blo(coo_bin_dim, log_bin.vib, dis_blo.for);
            % fra_blo.non = cal_fra_blo(coo_bin_dim, log_bin.non, dis_blo.for);
            % r_pai = cal_r_pai.sep(dff_bin_fra.bou.all', log_bin);
            % r_blo.tai.dat = cal_pcc_blo(dis_pai, r_pai, dis_blo.wre);
            % r_blo.tai.shu = cal_r_blo_shu(dis_pai, r_pai, dis_blo.wre);
            % %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            % save(obj.fil_pat_rec, 'dff_bin_fra', 'dff_bin_bou_win', 'dff_bin_fra_bou', 'fra_blo', ...
            %     'log_bin', 'res_bin', 'r_pai', 'r_blo', '-append')

            win_len = con_fil.win_len;
            fra_rat = con_fil.fra_rat;
            isi = con_fil.isi;
            piv_fra_bin = [piv_pla_fra_bin{:}];
            fra_rat = fra_rat.cal.eig;
            sti_ons_tri = con_fil.sti_ons_tri;
            % [~, ~, ~, ~, ~, dff_bin_fra.lig, ~, ~, log_bin.lig, ~, ~, res_bin.lig] = ...
            %     cal_rel_cha_uni_poi_tri(piv_fra_bin, win_len.dff.eig, sti_ons_tri.vrs.lig, fra_rat, ...
            %     isi, win_len.dff.pha.drn.tai);
            [~, ~, ~, ~, ~, dff_bin_fra.sho, ~, ~, log_bin.sho, ~, ~, res_bin.sho] = ...
                cal_rel_cha_uni_poi_tri(piv_fra_bin, win_len.dff.eig, sti_ons_tri.vrs.sho, fra_rat, ...
                isi, win_len.dff.pha.drn.tai);
            [~, ~, ~, ~, ~, dff_bin_fra.tap, ~, ~, log_bin.tap, ~, ~, res_bin.tap] = ...
                cal_rel_cha_uni_poi_tri(piv_fra_bin, win_len.dff.eig, sti_ons_tri.vrs.tap, fra_rat, ...
                isi, win_len.dff.pha.drn.tai);
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            save(obj.fil_pat_rec, 'dff_bin_fra', 'log_bin', 'res_bin', '-append')

            rec_fil = matfile(obj.fil_pat_rec);
            con_fil = matfile('\\home.ansatt.ntnu.no\kadiram\Documents\MATLAB\con_esp.mat');
            dis_blo = con_fil.dis_blo;
            dis_pai = rec_fil.dis_pai;
            log_bin = rec_fil.log_bin;
            r_pai.tai = cal_r_pai.sep(dff_bin_fra.bou.all', log_bin);
            r_pai.lig = cal_r_pai.sep(dff_bin_fra.lig', log_bin);
            r_pai.sho = cal_r_pai.sep(dff_bin_fra.sho', log_bin);
            r_pai.tap = cal_r_pai.sep(dff_bin_fra.tap', log_bin);

            r_blo.tai = cal_r_blo(dis_pai, r_pai.tai, dis_blo.tel);
            r_blo.lig = cal_r_blo(dis_pai, r_pai.lig, dis_blo.tel);
            r_blo.sho = cal_r_blo(dis_pai, r_pai.sho, dis_blo.tel);
            r_blo.tap = cal_r_blo(dis_pai, r_pai.tap, dis_blo.tel);
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            save(obj.fil_pat_rec, 'r_pai', 'r_blo', '-append')

            rec_fil = matfile(obj.fil_pat_rec);
            n_bin_pla = rec_fil.n_bin_pla;
            ind_pla_bin = ext_ind_pla_cel(n_bin_pla);
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            save(obj.fil_pat_rec, 'ind_pla_bin', '-append')

            rec_fil = matfile(obj.fil_pat_rec);
            n_pix_pla = rec_fil.n_pix_pla;
            ind_pla_pix = ext_ind_pla_cel(n_pix_pla);
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            save(obj.fil_pat_rec, 'ind_pla_pix', '-append')

            con_fil = matfile('\\home.ansatt.ntnu.no\kadiram\Documents\MATLAB\con_esp.mat');
            fra_rat = con_fil.fra_rat;
            rec_fil = matfile(obj.fil_pat_rec);
            piv_pla_fra_bin = rec_fil.piv_pla_fra_bin;
            piv_fra_bin = [piv_pla_fra_bin{:}];
            dff_fra_bin = cal_dff_fra_roi.sli(fra_rat.cal.eig, piv_fra_bin);
            met = 'sgolay';
            n_fra = con_fil.n_fra;
            dff_fra_bin = smoothdata(dff_fra_bin, met, n_fra.dff.eig.smo);

            log_fra = con_fil.log_fra;
            r_pai = rec_fil.r_pai;
            r_pai.ong = cal_r_pai.tog(dff_fra_bin(log_fra.cal.eig.ong, :));

            dis_blo = con_fil.dis_blo;
            dis_blo = dis_blo.tel;
            r_blo = rec_fil.r_blo;
            dis_pai = rec_fil.dis_pai;
            r_blo.ong = cal_r_blo(dis_pai, r_pai.ong, dis_blo);
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            save(obj.fil_pat_rec, 'dff_fra_bin', 'r_pai', 'r_blo', '-append')



            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% gfa !!!!!!!!!
            rec_fil = matfile(obj.fil_pat_rec);
            n_bin_pla = rec_fil.n_bin_pla;
            n_bin_pla = n_bin_pla(:, 1);
            ind_pla_bin = ext_ind_pla_cel(n_bin_pla);
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            save(obj.fil_pat_rec, 'ind_pla_bin', '-append')

            con_fil = matfile('\\home.ansatt.ntnu.no\kadiram\Documents\MATLAB\con_esp.mat');
            rec_fil = matfile(obj.fil_pat_rec);
            win_len = con_fil.win_len;
            bou_ons_bou = rec_fil.bou_ons_bou;
            log_bin = rec_fil.log_bin;
            dff_bin_fra = rec_fil.dff_bin_fra;
            res_bin = rec_fil.res_bin;
            fra_rat = con_fil.fra_rat;
            isi = con_fil.isi;
            piv_pla_fra_bin = rec_fil.piv_pla_fra_bin;
            piv_fra_bin = [piv_pla_fra_bin{:}];
            fra_rat = fra_rat.cal.eig;

            % log_bin.all used before ...!!!!

            [~, ~, ~, ~, ~, dff_bin_fra.bou.all, ~, ~, log_bin.all, ~, ~, res_bin.all] = ...
                cal_rel_cha_uni_poi_tri(piv_fra_bin, win_len.dff.eig, bou_ons_bou.all, fra_rat, ...
                isi, win_len.dff.pha.drn.tai);
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            save(obj.fil_pat_rec, 'dff_bin_fra', 'log_bin', 'res_bin', '-append')

            dis_blo = con_fil.dis_blo;
            dis_pai = rec_fil.dis_pai;
            r_pai.tai = cal_r_pai.sep(dff_bin_fra.bou.all', log_bin);
            r_pai.sho = cal_r_pai.sep(dff_bin_fra.sho', log_bin);
            r_pai.tap = cal_r_pai.sep(dff_bin_fra.tap', log_bin);

            r_blo.tai = cal_r_blo(dis_pai, r_pai.tai, dis_blo.wre);
            r_blo.sho = cal_r_blo(dis_pai, r_pai.sho, dis_blo.wre);
            r_blo.tap = cal_r_blo(dis_pai, r_pai.tap, dis_blo.wre);
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            save(obj.fil_pat_rec, 'r_pai', 'r_blo', '-append')

            %%%%%%%%%%%%%% spo !!!!!!!!!!!!!!!!!!!!
            con_fil = matfile('\\home.ansatt.ntnu.no\kadiram\Documents\MATLAB\con_esp.mat');
            rec_fil = matfile(obj.fil_pat_rec);
            win_len = con_fil.win_len;
            bou_ons_bou = rec_fil.bou_ons_bou;
            log_bin = rec_fil.log_bin;
            dff_bin_fra = rec_fil.dff_bin_fra;
            res_bin = rec_fil.res_bin;
            fra_rat = con_fil.fra_rat;
            isi = con_fil.isi;
            piv_pla_fra_bin = rec_fil.piv_pla_fra_bin;
            piv_fra_bin = [piv_pla_fra_bin{:}];
            fra_rat = fra_rat.cal.eig;
            [~, ~, ~, ~, ~, dff_bin_fra.bou.non, ~, ~, log_bin.non, ~, ~, res_bin.non] = ...
                cal_rel_cha_uni_poi_tri(piv_fra_bin, win_len.dff.eig, bou_ons_bou.non, fra_rat, ...
                isi, win_len.dff.pha.drn.tai);% log_uni.srt.exc
            dis_blo = con_fil.dis_blo;
            dis_pai = rec_fil.dis_pai;
            r_pai = cal_r_pai.sep(dff_bin_fra.bou.non', log_bin);
            r_blo = rec_fil.r_blo;
            r_blo.non = cal_r_blo(dis_pai, r_pai, dis_blo.wre);
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            save(obj.fil_pat_rec, 'dff_bin_fra', 'log_bin', 'res_bin', 'r_blo', '-append')
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% gfa !!!!!!!!!

            rec_fil = matfile(obj.fil_pat_rec);
            x_bin = rec_fil.x_bin;
            y_bin = rec_fil.y_bin;
            log_bin = rec_fil.log_bin;
            con_fil = matfile('\\home.ansatt.ntnu.no\kadiram\Documents\MATLAB\con_esp.mat');
            coo_bin_dim = con_fil.coo_bin_dim;
            fie = 'uni';
            fie_num = {'axo', 'bou', 'all', 'srt'};
            pro_den_bin.tai = cal_pro_den_bin(x_bin, y_bin, log_bin, fie_num, coo_bin_dim.(fie));
            z_bin = rec_fil.z_bin;
            coo_sid_bin_dim = con_fil.coo_sid_bin_dim;
            pro_den_sid_bin.tai = cal_pro_den_sid_bin(x_bin, z_bin, log_bin, fie_num, ...
                coo_sid_bin_dim.(fie));
            fie_num = {'axo', 'bou', 'lig', 'neu', 'srt'};
            pro_den_bin.lig = cal_pro_den_bin(x_bin, y_bin, log_bin, fie_num, coo_bin_dim.(fie));
            pro_den_sid_bin.lig = cal_pro_den_sid_bin(x_bin, z_bin, log_bin, fie_num, ...
                coo_sid_bin_dim.(fie));
            fie_num = {'axo', 'bou', 'tap', 'neu', 'srt'};
            pro_den_bin.tap = cal_pro_den_bin(x_bin, y_bin, log_bin, fie_num, coo_bin_dim.(fie));
            pro_den_sid_bin.tap = cal_pro_den_sid_bin(x_bin, z_bin, log_bin, fie_num, ...
                coo_sid_bin_dim.(fie));
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            save(obj.fil_pat_rec, 'pro_den_bin', 'pro_den_sid_bin', '-append')

            rec_fil = matfile(obj.fil_pat_rec);
            pro_den_bin = rec_fil.pro_den_bin;
            x_bin = rec_fil.x_bin;
            y_bin = rec_fil.y_bin;
            log_bin = rec_fil.log_bin;
            con_fil = matfile('\\home.ansatt.ntnu.no\kadiram\Documents\MATLAB\con_esp.mat');
            coo_bin_dim = con_fil.coo_bin_dim;
            fie = 'uni';
            fie_num = {'axo', 'bou', 'non', 'srt'};
            pro_den_bin.non = cal_pro_den_bin(x_bin, y_bin, log_bin, fie_num, coo_bin_dim.(fie));
            pro_den_sid_bin = rec_fil.pro_den_sid_bin;
            z_bin = rec_fil.z_bin;
            coo_sid_bin_dim = con_fil.coo_sid_bin_dim;
            pro_den_sid_bin.non = cal_pro_den_sid_bin(x_bin, z_bin, log_bin, fie_num, ...
                coo_sid_bin_dim.(fie));
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            save(obj.fil_pat_rec, 'pro_den_bin', 'pro_den_sid_bin', '-append')
        end
        % un
        function app_par_axo_onl(obj)
            rec_fil = matfile(obj.fil_pat_rec);
            pro_den_bin = rec_fil.pro_den_bin;
            x_bin = rec_fil.x_bin;
            y_bin = rec_fil.y_bin;
            log_bin = rec_fil.log_bin;
            con_fil = matfile('\\home.ansatt.ntnu.no\kadiram\Documents\MATLAB\con_esp.mat');
            coo_bin_dim = con_fil.coo_bin_dim;
            fie = 'uni';
            pro_den_sid_bin = rec_fil.pro_den_sid_bin;
            z_bin = rec_fil.z_bin;
            coo_sid_bin_dim = con_fil.coo_sid_bin_dim;
            fie_num = {'axo', 'bou', 'lig', 'neu', 'srt'};
            pro_den_bin.lig = cal_pro_den_bin(x_bin, y_bin, log_bin, fie_num, coo_bin_dim.(fie));
            pro_den_sid_bin.lig = cal_pro_den_sid_bin(x_bin, z_bin, log_bin, fie_num, ...
                coo_sid_bin_dim.(fie));
            fie_num = {'axo', 'bou', 'tap', 'neu', 'srt'};
            pro_den_bin.tap = cal_pro_den_bin(x_bin, y_bin, log_bin, fie_num, coo_bin_dim.(fie));
            pro_den_sid_bin.tap = cal_pro_den_sid_bin(x_bin, z_bin, log_bin, fie_num, ...
                coo_sid_bin_dim.(fie));
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            save(obj.fil_pat_rec, 'pro_den_bin', 'pro_den_sid_bin', '-append')
        end
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% cel onl
        function app_som_log_pla_row_col_cel(obj)
            rec_fil = matfile(obj.fil_pat_rec);
            dff_pla_fra_cel = rec_fil.dff_pla_fra_cel;
            dff_fra_cel = [dff_pla_fra_cel{:}];% for spo
            met = 'sgolay';
            con_fil = matfile('\\home.ansatt.ntnu.no\kadiram\Documents\MATLAB\con_esp.mat');
            n_fra = con_fil.n_fra;
            dff_fra_cel = smoothdata(dff_fra_cel, met, n_fra.dff.eig.smo);
            log_fra = con_fil.log_fra;
            [clu_cel_k.ong, ~] = com_clu_cel_k(dff_fra_cel(log_fra.cal.eig.ong, :));% single per
            [ioi_kxx, ioi_shu_kxx, del_ioi_kxx] = ext_clu_ana(dff_fra_cel(log_fra.cal.eig.ong, :));
            [clu_cel, clu_fid] = cal_clu_cel(dff_fra_cel);% ongoing activity is selected, 2 periods
            % clu_cel.one, clu_cel.two
            r_pai.ong = cal_r_pai.tog(dff_fra_cel(log_fra.cal.eig.ong, :));
            dis_blo = con_fil.dis_blo;
            dis_blo = dis_blo.rap.thr;
            pcc_blo = rec_fil.pcc_blo;
            pcc_blo.ong = [];
            dis_pai = rec_fil.dis_pai;
            pcc_blo.ong.dat = cal_pcc_blo(dis_pai, r_pai.ong, dis_blo);
            pcc_blo.ong.shu = cal_r_blo_shu(dis_pai, r_pai.ong, dis_blo);
            %
            r_pai.one.dat = cal_r_pai.tog(dff_fra_cel(log_fra.cal.eig.ong_one, :));
            r_pai.one.shu = shu_var_row.ent(r_pai.one.dat);
            r_pai.two.dat = cal_r_pai.tog(dff_fra_cel(log_fra.cal.eig.ong_two, :));
            r_pai.two.shu = shu_var_row.ent(r_pai.two.dat);
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            save(obj.fil_pat_rec, 'dff_fra_cel', 'ioi_kxx', 'ioi_shu_kxx', 'del_ioi_kxx', ...
                'clu_cel', 'clu_fid', 'r_pai', 'pcc_blo', 'clu_cel_k', '-append')

            rec_fil = matfile(obj.fil_pat_rec);
            con_fil = matfile('\\home.ansatt.ntnu.no\kadiram\Documents\MATLAB\con_esp.mat');
            win_len = con_fil.win_len;
            bou_ons_bou = rec_fil.bou_ons_bou;% .all, sec
            fra_rat = con_fil.fra_rat;
            fra_rat = fra_rat.cal.eig;
            isi = con_fil.isi;
            piv_pla_fra_cel = rec_fil.piv_pla_fra_cel;
            piv_fra_cel = [piv_pla_fra_cel{:}];
            % vibration type(bou_all), cell type
            [~, ~, ~, ~, ~, dff_cel_fra.bou_all, ~, ~, log_cel.bou_all, ~, ~, res_fie_cel.bou_all] =...
                cal_rel_cha_uni_poi_tri(piv_fra_cel, win_len.dff.eig, bou_ons_bou.all, fra_rat, isi,...
                win_len.dff.pha.drn.tai);
            sti_ons_tri = con_fil.sti_ons_tri;
            [~, ~, ~, ~, ~, dff_cel_fra.lig, ~, ~, log_cel.lig, ~, ~, res_fie_cel.lig] = ...
                cal_rel_cha_uni_poi_tri(piv_fra_cel, win_len.dff.eig, sti_ons_tri.vrs.lig, fra_rat, ...
                isi, win_len.dff.pha.drn.tai);
            [~, ~, ~, ~, ~, dff_cel_fra.sho, ~, ~, log_cel.sho, ~, ~, res_fie_cel.sho] = ...
                cal_rel_cha_uni_poi_tri(piv_fra_cel, win_len.dff.eig, sti_ons_tri.vrs.sho, fra_rat, ...
                isi, win_len.dff.pha.drn.tai);
            [~, ~, ~, ~, ~, dff_cel_fra.tap, ~, ~, log_cel.tap, ~, ~, res_fie_cel.tap] = ...
                cal_rel_cha_uni_poi_tri(piv_fra_cel, win_len.dff.eig, sti_ons_tri.vrs.tap, fra_rat, ...
                isi, win_len.dff.pha.drn.tai);
            dis_blo = con_fil.dis_blo;
            dis_blo = dis_blo.rap;
            coo_cel_dim = rec_fil.coo_cel_dim;
            fra_blo.tai = cal_fra_blo(coo_cel_dim, log_cel.bou_all.srt, dis_blo);
            fra_blo.lig = cal_fra_blo(coo_cel_dim, log_cel.lig.srt, dis_blo);
            fra_blo.sho = cal_fra_blo(coo_cel_dim, log_cel.sho.srt, dis_blo);
            fra_blo.tap = cal_fra_blo(coo_cel_dim, log_cel.tap.srt, dis_blo);
            dis_pai = rec_fil.dis_pai;
            [r_pai.lig, pcc_blo.lig] = cal_r_pai_r_blo(dff_cel_fra.lig, dis_pai);
            [r_pai.sho, pcc_blo.sho] = cal_r_pai_r_blo(dff_cel_fra.sho, dis_pai);
            [r_pai.tap, pcc_blo.tap] = cal_r_pai_r_blo(dff_cel_fra.tap, dis_pai);
            [r_pai.tai, pcc_blo.tai] = cal_r_pai_r_blo(dff_cel_fra.bou.all, dis_pai);% not .bou_all!
            % clu_cel_k.bou.all was put back after clustering the
            
            % all-animal-pooled neurons
            clu_cel_k = rec_fil.clu_cel_k;
            [clu_cel_k.bou_all, ~] = com_clu_cel_k(dff_cel_fra.bou.all');
            [clu_cel_k.lig, ~] = com_clu_cel_k(dff_cel_fra.lig');
            [clu_cel_k.tap, ~] = com_clu_cel_k(dff_cel_fra.tap');
            % sensory responses with and without tail
            log_tri_con = logical(rec_fil.log_tri_con);
            con_num = con_fil.con_num;
            [~, ~, ~, ~, ~, dff_cel_fra.tap_tai, ~, ~, log_cel.tap_tai.neu, ~, ~, res_fie_cel.tap_tai] ...
                = cal_rel_cha_uni_poi_tri(piv_fra_cel, win_len.dff.eig, sti_ons_tri.vrs.tap...
                (log_tri_con(:, con_num.tap)), fra_rat, isi, win_len.dff.pha.drn.tai);
            % dff_cel_fra.tap_tai: all cells for those trials, exc+inh+non
            [~, ~, ~, ~, ~, dff_cel_fra.tap_not, ~, ~, log_cel.tap_not.neu, ~, ~, res_fie_cel.tap_not] ...
                = cal_rel_cha_uni_poi_tri(piv_fra_cel, win_len.dff.eig, sti_ons_tri.vrs.tap...
                (~log_tri_con(:, con_num.tap)), fra_rat, isi, win_len.dff.pha.drn.tai);
            [r_pai.tap_tai, pcc_blo.tap_tai] = cal_r_pai_r_blo(dff_cel_fra.tap_tai, dis_pai);
            [r_pai.tap_not, pcc_blo.tap_not] = cal_r_pai_r_blo(dff_cel_fra.tap_not, dis_pai);
            fra_blo.tap_tai = cal_fra_blo(coo_cel_dim, log_cel.tap_tai.neu.zsc, dis_blo);
            fra_blo.tap_not = cal_fra_blo(coo_cel_dim, log_cel.tap_not.neu.zsc, dis_blo);
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            save(obj.fil_pat_rec, 'piv_fra_cel', 'dff_cel_fra', 'log_cel', 'res_fie_cel', ...
                'fra_blo', 'r_pai', 'pcc_blo', 'clu_cel_k', '-append')

            rec_fil = matfile(obj.fil_pat_rec);
            con_fil = matfile('\\home.ansatt.ntnu.no\kadiram\Documents\MATLAB\con_esp.mat');
            win_len = con_fil.win_len;
            bou_ons_bou = rec_fil.bou_ons_bou;% .all, sec
            fra_rat = con_fil.fra_rat;
            fra_rat = fra_rat.cal.eig;
            isi = con_fil.isi;
            piv_fra_cel = rec_fil.piv_fra_cel;
            [~, ~, ~, ~, ~, ~, ~, ~, log_cel.bou_all] = cal_rel_cha_uni_poi_tri(piv_fra_cel, ...
                win_len.dff.eig, bou_ons_bou.all, fra_rat, isi,win_len.dff.pha.drn.tai);
            sti_ons_tri = con_fil.sti_ons_tri;
            [~, ~, ~, ~, ~, ~, ~, ~, log_cel.lig] = cal_rel_cha_uni_poi_tri(piv_fra_cel, ...
                win_len.dff.eig, sti_ons_tri.vrs.lig, fra_rat, isi, win_len.dff.pha.drn.tai);
            [~, ~, ~, ~, ~, ~, ~, ~, log_cel.tap] = cal_rel_cha_uni_poi_tri(piv_fra_cel, ...
                win_len.dff.eig, sti_ons_tri.vrs.tap, fra_rat, isi, win_len.dff.pha.drn.tai);
            coo_cel_dim = rec_fil.coo_cel_dim;
            dis_blo = con_fil.dis_blo;
            dis_blo = dis_blo.rap;
            fra_blo = rec_fil.fra_blo;
            fra_blo.tai_two = cal_fra_blo(coo_cel_dim, log_cel.bou_all.two, dis_blo);
            fra_blo.lig_two = cal_fra_blo(coo_cel_dim, log_cel.lig.two, dis_blo);
            fra_blo.tap_two = cal_fra_blo(coo_cel_dim, log_cel.tap.two, dis_blo);
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            save(obj.fil_pat_rec, 'fra_blo', '-append')

            % modality
            rec_fil = matfile(obj.fil_pat_rec);
            con_fil = matfile('\\home.ansatt.ntnu.no\kadiram\Documents\MATLAB\con_esp.mat');
            win_len = con_fil.win_len;
            bou_ons_bou = rec_fil.bou_ons_bou;% .all, sec
            fra_rat = con_fil.fra_rat;
            fra_rat = fra_rat.cal.eig;
            isi = con_fil.isi;
            piv_fra_cel = rec_fil.piv_fra_cel;
            log_cel = rec_fil.log_cel;
            [~, ~, ~, ~, ~, ~, ~, ~, log_cel.bou_all, ~, dff_cel_win.tai] =...
                cal_rel_cha_uni_poi_tri(piv_fra_cel, win_len.dff.eig, bou_ons_bou.all, fra_rat, isi,...
                win_len.dff.pha.drn.tai);
            sti_ons_tri = con_fil.sti_ons_tri;
            [~, ~, ~, ~, ~, ~, ~, ~, log_cel.lig, ~, dff_cel_win.lig] = ...
                cal_rel_cha_uni_poi_tri(piv_fra_cel, win_len.dff.eig, sti_ons_tri.vrs.lig, fra_rat, ...
                isi, win_len.dff.pha.drn.tai);
            [~, ~, ~, ~, ~, ~, ~, ~, log_cel.tap, ~, dff_cel_win.tap] = ...
                cal_rel_cha_uni_poi_tri(piv_fra_cel, win_len.dff.eig, sti_ons_tri.vrs.tap, fra_rat, ...
                isi, win_len.dff.pha.drn.tai);
            log_cel.mul_all = (log_cel.bou_all.srt.res + log_cel.lig.srt.res + log_cel.tap.srt.res)...
                > 1;
            log_cel.uni_tai = log_cel.bou_all.srt.res & ~log_cel.mul_all;
            log_cel.uni_lig = log_cel.lig.srt.res & ~log_cel.mul_all;
            log_cel.uni_tap = log_cel.tap.srt.res & ~log_cel.mul_all;
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            save(obj.fil_pat_rec, 'log_cel', 'dff_cel_win', '-append')

            rec_fil = matfile(obj.fil_pat_rec);
            tai_ang_fra = rec_fil.tai_ang_fra;
            dff_fra_cel = rec_fil.dff_fra_cel;
            con_fil = matfile('\\home.ansatt.ntnu.no\kadiram\Documents\MATLAB\con_esp.mat');
            fra_rat = con_fil.fra_rat;
            tim_fra = con_fil.tim_fra;
            cax_tim_fra = tim_fra.cal.eig.ses.ent;
            [dff_fra_cel, tix_fra] = resample(dff_fra_cel, cax_tim_fra, fra_rat.man);% upsample
            sti_ons_tri = con_fil.sti_ons_tri;

            plo_tim_fra = tim_fra.ani.ses.sti;
            log_fra = tix_fra >= 60 & tix_fra <= plo_tim_fra(end);% for the entire session!
            dff_fra_cel = dff_fra_cel(log_fra, :);

            log_fra = plo_tim_fra > 60 & plo_tim_fra < sti_ons_tri.vrs.all(1);% for the spo
            [pve, pve_cel] = cal_pve(tai_ang_fra.con(log_fra), dff_fra_cel(log_fra, :));%upsampled dff
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            save(obj.fil_pat_rec, 'pve', 'pve_cel', '-append')

            rec_fil = matfile(obj.fil_pat_rec);
            log_cel = rec_fil.log_cel;
            n_cel = rec_fil.n_cel;
            fra.tap_tai.exc = sum(log_cel.tap_tai.neu.zsc.exc)/n_cel.all;
            fra.tap_not.exc = sum(log_cel.tap_not.neu.zsc.exc)/n_cel.all;
            fra.tap_tai.inh = sum(log_cel.tap_tai.neu.zsc.inh)/n_cel.all;
            fra.tap_not.inh = sum(log_cel.tap_not.neu.zsc.inh)/n_cel.all;
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            save(obj.fil_pat_rec, 'fra', '-append')

            fil_pat_tif = [obj.targetP, 'mean_per_block_plane3.tiff'];
            piv_row_col_fra = uint16(tiffreadVolume(fil_pat_tif));
            per_sat_pix = sum(piv_row_col_fra >= 65534, "all")/numel(piv_row_col_fra);%int16..
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            save(obj.fil_pat_rec, 'per_sat_pix', '-append')

            pla_fil = matfile(obj.fil_pat_ima_cal_pla{3});
            piv_row_col_fra = pla_fil.im;
            per_sat_pix = sum(piv_row_col_fra == 32767, "all")/numel(piv_row_col_fra);
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            save(obj.fil_pat_rec, 'per_sat_pix', '-append')

            rec_fil = matfile(obj.fil_pat_rec);
            piv_fra_cel = rec_fil.piv_fra_cel;
            per_zer_fra_cel = 100*(sum(piv_fra_cel == 0, "all")/numel(piv_fra_cel));
            display(per_zer_fra_cel)

            pla_fil = matfile(obj.fil_pat_ima_cal_pla{3});
            piv_row_col_fra = pla_fil.im;
            rec_fil = matfile(obj.fil_pat_rec);
            log_pla_row_col = rec_fil.log_pla_row_col;
            n_cel = rec_fil.n_cel;
            n_cel_pla = rec_fil.n_cel_pla;
            if isprop(rec_fil, 'cel_fie_pla_row_col')
                cel_fie_pla_row_col = rec_fil.cel_fie_pla_row_col;
            else
                con_fil = matfile('\\home.ansatt.ntnu.no\kadiram\Documents\MATLAB\con_esp.mat');
                fun_pla = con_fil.fun_pla;
                n_pla = con_fil.n_pla;
                cel_fie_pla_row_col.pla = cell(n_pla.neu.raw, 1);
                for pla = fun_pla.raw
                    celldetectionDir = [obj.targetP 'celldetection_rap\celldetection_plane' ...
                        num2str(pla)];
                    fil_pat = [celldetectionDir filesep 'roi_t.mat'];
                    mat_fil = matfile(fil_pat);
                    roi_t = mat_fil.roi_t;

                    cel_fie_pla_row_col.pla{pla} = roi_t.neuronLabels;
                    cel_fie_pla_row_col.pla{pla}(cel_fie_pla_row_col.pla{pla} == 0) = nan;
                    % cell label starts from 1 per plane
                end
            end
            [~, log_pla_row_col.all.all, ~] = ext_log_cel_pla(n_cel, n_cel_pla, cel_fie_pla_row_col);
            piv_pix = piv_row_col_fra(log_pla_row_col.all.all{3});
            per_sat_pix = sum(piv_pix == 32767, "all")/numel(piv_pix);
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            save(obj.fil_pat_rec, 'cel_fie_pla_row_col', 'log_pla_row_col', 'per_sat_pix', '-append')

            rec_fil = matfile(obj.fil_pat_rec);
            dff_fra_cel = rec_fil.dff_fra_cel;
            con_fil = matfile('\\home.ansatt.ntnu.no\kadiram\Documents\MATLAB\con_esp.mat');
            fra_rat = con_fil.fra_rat;
            tim_fra = con_fil.tim_fra;
            cax_tim_fra = tim_fra.cal.eig.ses.ent;
            [dff_fra_cel, tix_fra] = resample(dff_fra_cel, cax_tim_fra, fra_rat.man);% upsample
            sti_ons_tri = con_fil.sti_ons_tri;
            plo_tim_fra = tim_fra.ani.ses.sti;
            log_fra = tix_fra >= 60 & tix_fra <= plo_tim_fra(end);% for the entire session!
            dff_fra_cel = dff_fra_cel(log_fra, :);
            log_fra = plo_tim_fra > 60 & plo_tim_fra < sti_ons_tri.vrs.all(1);% for the spo
            n_cel = size(dff_fra_cel, 2);
            tau_num = 4:2:20;
            n_tau = length(tau_num);
            pve_cel_tau = nan(n_cel, n_tau);
            tai_ang_uni = rec_fil.tai_ang_uni;
            ite = 0;
            for tau = tau_num
                ite = ite + 1;
                tai_ang_fra = cal_tai_ang_fra(tai_ang_uni, tau);
                [~, pve_cel_tau(:, ite)] = cal_pve(tai_ang_fra(log_fra), dff_fra_cel(log_fra, :));
                %upsampled dff
            end
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            save(obj.fil_pat_rec, 'pve_cel_tau', '-append')

            rec_fil = matfile(obj.fil_pat_rec);
            piv_pla_row_col = rec_fil.piv_pla_row_col;
            fil_pat_cal_pla = obj.fil_pat_ima_cal_pla;
            con_fil = matfile('\\home.ansatt.ntnu.no\kadiram\Documents\MATLAB\con_esp.mat');
            n_pla = con_fil.n_pla;
            piv_pla_row_col.ima = cell(n_pla.neu.raw, 1);
            for pla = 3
                ima_fil = matfile(fil_pat_cal_pla{pla});
                piv_pla_row_col.ima{pla} = ext_ref_ima.ima(ima_fil.im);
            end
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            save(obj.fil_pat_rec, 'piv_pla_row_col', '-append')

            % spo tai
            rec_fil = matfile(obj.fil_pat_rec);
            con_fil = matfile('\\home.ansatt.ntnu.no\kadiram\Documents\MATLAB\con_esp.mat');
            win_len = con_fil.win_len;
            bou_ons_bou = rec_fil.bou_ons_bou;% .all, sec
            fra_rat = con_fil.fra_rat;
            fra_rat = fra_rat.cal.eig;
            isi = con_fil.isi;
            dff_cel_fra = rec_fil.dff_cel_fra;
            log_cel = rec_fil.log_cel;
            res_fie_cel = rec_fil.res_fie_cel;
            piv_fra_cel = rec_fil.piv_fra_cel;
            [~, ~, ~, ~, ~, dff_cel_fra.bou_non, ~, ~, log_cel.bou_non, ~, ~, res_fie_cel.bou_non] =...
                cal_rel_cha_uni_poi_tri(piv_fra_cel, win_len.dff.eig, bou_ons_bou.non, fra_rat, isi,...
                win_len.dff.pha.drn.tai);
            dis_blo = con_fil.dis_blo;
            dis_blo = dis_blo.rap;
            coo_cel_dim = rec_fil.coo_cel_dim;
            fra_blo = rec_fil.fra_blo;
            fra_blo.bou_non = cal_fra_blo(coo_cel_dim, log_cel.bou_non.srt, dis_blo);
            dis_pai = rec_fil.dis_pai;
            r_pai = rec_fil.r_pai;
            pcc_blo = rec_fil.pcc_blo;
            [r_pai.bou_non, pcc_blo.bou_non] = cal_r_pai_r_blo(dff_cel_fra.bou_non, dis_pai);
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            save(obj.fil_pat_rec, 'dff_cel_fra', 'log_cel', 'res_fie_cel', 'fra_blo', 'r_pai', ...
                'pcc_blo', '-append')

            % tap tai/not
            rec_fil = matfile(obj.fil_pat_rec);
            con_fil = matfile('\\home.ansatt.ntnu.no\kadiram\Documents\MATLAB\con_esp.mat');
            win_len = con_fil.win_len;
            sti_ons_tri = con_fil.sti_ons_tri;
            fra_rat = con_fil.fra_rat;
            fra_rat = fra_rat.cal.eig;
            isi = con_fil.isi;
            dff_cel_win = rec_fil.dff_cel_win;
            piv_fra_cel = rec_fil.piv_fra_cel;
            log_tri_con = logical(rec_fil.log_tri_con);
            con_num = con_fil.con_num;
            [~, ~, ~, ~, ~, ~, ~, ~, ~, ~, dff_cel_win.tap_tai] ...
                = cal_rel_cha_uni_poi_tri(piv_fra_cel, win_len.dff.eig, sti_ons_tri.vrs.tap...
                (log_tri_con(:, con_num.tap)), fra_rat, isi, win_len.dff.pha.drn.tai);
            % dff_cel_fra.tap_tai: all cells for those trials, exc+inh+non
            [~, ~, ~, ~, ~, ~, ~, ~, ~, ~, dff_cel_win.tap_not] ...
                = cal_rel_cha_uni_poi_tri(piv_fra_cel, win_len.dff.eig, sti_ons_tri.vrs.tap...
                (~log_tri_con(:, con_num.tap)), fra_rat, isi, win_len.dff.pha.drn.tai);
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            save(obj.fil_pat_rec, 'dff_cel_win', '-append')

            rec_fil = matfile(obj.fil_pat_rec);
            con_fil = matfile('\\home.ansatt.ntnu.no\kadiram\Documents\MATLAB\con_esp.mat');
            win_len = con_fil.win_len;
            fra_rat = con_fil.fra_rat;
            fra_rat = fra_rat.cal.eig;
            isi = con_fil.isi;
            piv_fra_cel = rec_fil.piv_fra_cel;
            sti_ons_tri = con_fil.sti_ons_tri;
            [~, ~, ~, ~, ~, ~, dff_cel_tri_win.lig] = ...
                cal_rel_cha_uni_poi_tri(piv_fra_cel, win_len.dff.eig, sti_ons_tri.vrs.lig, fra_rat, ...
                isi, win_len.dff.pha.drn.tai);
            [~, ~, ~, ~, ~, ~, dff_cel_tri_win.tap] = ...
                cal_rel_cha_uni_poi_tri(piv_fra_cel, win_len.dff.eig, sti_ons_tri.vrs.tap, fra_rat, ...
                isi, win_len.dff.pha.drn.tai);
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            save(obj.fil_pat_rec, 'dff_cel_tri_win', '-append')

            rec_fil = matfile(obj.fil_pat_rec);
            log_cel = rec_fil.log_cel;
            log_cel.tai_lig.bim = (log_cel.bou_non.srt.res + log_cel.lig.srt.res) > 1;
            log_cel.tai_lig.tai = log_cel.bou_non.srt.res & ~log_cel.tai_lig.bim;
            log_cel.tai_lig.lig = log_cel.lig.srt.res & ~log_cel.tai_lig.bim;
            log_cel.tai_lig.non = ~log_cel.bou_non.srt.res & ~log_cel.lig.srt.res;
            
            log_cel.tai_tap.bim = (log_cel.bou_non.srt.res + log_cel.tap.srt.res) > 1;
            log_cel.tai_tap.tai = log_cel.bou_non.srt.res & ~log_cel.tai_tap.bim;
            log_cel.tai_tap.tap = log_cel.tap.srt.res & ~log_cel.tai_tap.bim;
            log_cel.tai_tap.non = ~log_cel.bou_non.srt.res & ~log_cel.tap.srt.res;
            
            log_cel.lig_tap.bim = (log_cel.lig.srt.res + log_cel.tap.srt.res) > 1;
            log_cel.lig_tap.lig = log_cel.lig.srt.res & ~log_cel.lig_tap.bim;
            log_cel.lig_tap.tap = log_cel.tap.srt.res & ~log_cel.lig_tap.bim;
            log_cel.lig_tap.non = ~log_cel.lig.srt.res & ~log_cel.tap.srt.res;
            %
            dff_cel_win = rec_fil.dff_cel_win;
            con_fil = matfile('\\home.ansatt.ntnu.no\kadiram\Documents\MATLAB\con_esp.mat');
            win_len = con_fil.win_len;
            bou_ons_bou = rec_fil.bou_ons_bou;% .all, sec
            fra_rat = con_fil.fra_rat;
            fra_rat = fra_rat.cal.eig;
            isi = con_fil.isi;
            piv_fra_cel = rec_fil.piv_fra_cel;
            [~, ~, ~, ~, ~, ~, ~, ~, ~, ~, dff_cel_win.bou_non] =...
                cal_rel_cha_uni_poi_tri(piv_fra_cel, win_len.dff.eig, bou_ons_bou.non, fra_rat, isi,...
                win_len.dff.pha.drn.tai);
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            save(obj.fil_pat_rec, 'log_cel', 'dff_cel_win', '-append')

            rec_fil = matfile(obj.fil_pat_rec);
            fra = rec_fil.fra;
            log_cel = rec_fil.log_cel;
            n_cel = rec_fil.n_cel;
            fra.bou_non.exc = sum(log_cel.bou_non.srt.exc)/n_cel.all;
            fra.lig.exc = sum(log_cel.lig.srt.exc)/n_cel.all;
            fra.tap.exc = sum(log_cel.tap.srt.exc)/n_cel.all;
            fra.bou_non.inh = sum(log_cel.bou_non.srt.inh)/n_cel.all;
            fra.lig.inh = sum(log_cel.lig.srt.inh)/n_cel.all;
            fra.tap.inh = sum(log_cel.tap.srt.inh)/n_cel.all;
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            save(obj.fil_pat_rec, 'fra', '-append')
        end
        % in
        function app_par_som(obj)
            rec_fil = matfile(obj.fil_pat_rec);
            fra = rec_fil.fra;
            log_cel = rec_fil.log_cel;
            n_cel = rec_fil.n_cel;
            fra.bou_non.exc = sum(log_cel.bou_non.srt.exc)/n_cel.all;
            fra.lig.exc = sum(log_cel.lig.srt.exc)/n_cel.all;
            fra.tap.exc = sum(log_cel.tap.srt.exc)/n_cel.all;
            fra.bou_non.inh = sum(log_cel.bou_non.srt.inh)/n_cel.all;
            fra.lig.inh = sum(log_cel.lig.srt.inh)/n_cel.all;
            fra.tap.inh = sum(log_cel.tap.srt.inh)/n_cel.all;
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            save(obj.fil_pat_rec, 'fra', '-append')
        end
        %%%%%%
        function app_sui(obj)
            res_fil = matfile(obj.sui_fil);
            cel_row_col_pla = res_fil.neuronLabels;
            cel_row_col = squeeze(cel_row_col_pla(:, :, 1));
            cel_row_col = flip(cel_row_col);

            %cel_num = [14; 9; 12]';% esp247
            %cel_row_col = removeAndRenumber(cel_row_col, cel_num);

            radius = 5;
            smooth_radius = 3;
            ced_row_col = dilate_rois_no_overlap_smooth(cel_row_col, radius, smooth_radius);
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            save(obj.fil_pat_rec, 'ced_row_col', '-append')
            
            res_fil = matfile(obj.sui_fil);
            piv_cel_fra = res_fil.trace;
            %piv_fra_cel = (piv_cel_fra(1:35, 1:4047))';
            piv_fra_cel = (piv_cel_fra(1:28, 1:4047))';

            rec_fil = matfile(obj.fil_pat_rec);
            con_fil = matfile('\\home.ansatt.ntnu.no\kadiram\Documents\MATLAB\con_esp.mat');
            win_len = con_fil.win_len;
            bou_ons_bou = rec_fil.bou_ons_bou;% .all, sec
            fra_rat = con_fil.fra_rat;
            fra_rat = fra_rat.cal.eig;
            isi = con_fil.isi;
            % vibration type(bou_all), cell type
            [~, ~, ~, ~, ~, dff_ced_fra, ~, ~, ~, ~, ~, ~] = cal_rel_cha_uni_poi_tri(piv_fra_cel, ...
                win_len.dff.eig, bou_ons_bou.all, fra_rat, isi, win_len.dff.pha.drn.tai);
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            save(obj.fil_pat_rec, 'dff_ced_fra', '-append')
        end
        %
        function che_per_bin_edg(obj)
            mat_fil = matfile(obj.fil_pat_rec);
            piv_pla_row_col = mat_fil.piv_pla_row_col;
            piv_pla_row_col = piv_pla_row_col.ima;
            %obj.per_bin_edg = 30;
            %obj.per_bin_edg = 100;
            obj.per_bin_edg = 70;
            [~, fig_wid, fig_hei] = fig;
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            pla_num = 3;
            [high_in, low_in] = ext_hig_low.pea(piv_pla_row_col{pla_num}, obj.per_bin_edg);
            piv_row_col = piv_pla_row_col{pla_num};% uint16, max eg 2214
            piv_row_col = imadjust(piv_row_col, [low_in.rel high_in.rel]);% contrast limits, 
            imshow(piv_row_col, [])
        end
        function app_cel_row_col(obj)
            rec_fil = matfile(obj.fil_pat_rec);
            piv_pla_row_col = rec_fil.piv_pla_row_col;
            piv_pla_row_col = piv_pla_row_col.ima;
            %obj.per_bin_edg = 30;% esp247
            obj.per_bin_edg = 70;% esp249
            [cel_row_col, roiPositions] = ext_cel_row_col(piv_pla_row_col, obj.per_bin_edg);
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            save(obj.fil_pat_rec, 'cel_row_col', 'roiPositions', '-append')
        end
        function app_roiPositions(obj)
            figFile = "X:\kadiram\Data\Processed\esp247\cell_detection.fig";
            roiPositions = ext_roiPositions_from_fig(figFile);
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            save(obj.fil_pat_rec, 'roiPositions', '-append')
        end
        function cor_cel_row_col(obj)
            rec_fil = matfile(obj.fil_pat_rec);
            piv_pla_row_col = rec_fil.piv_pla_row_col;
            piv_pla_row_col = piv_pla_row_col.ima;
            obj.per_bin_edg = 30;% esp247
            roiPositions = rec_fil.roiPositions;
            [cel_row_col, roiPositions] = cor_cel_row_col(piv_pla_row_col, obj.per_bin_edg, ...
                roiPositions);
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            save(obj.fil_pat_rec, 'cel_row_col', 'roiPositions', '-append')
        end
        function app_dff_cem_fra(obj)
            rec_fil = matfile(obj.fil_pat_rec);
            fil_pat_cal_pla = obj.fil_pat_ima_cal_pla;
            pla = 3;
            obj.fil_pat_ima_cal = fil_pat_cal_pla{pla};
            cel_row_col = rec_fil.cel_row_col;
            piv_fra_cel = cal_piv_fra_cel(obj.fil_pat_ima_cal, cel_row_col);
            con_fil = matfile('\\home.ansatt.ntnu.no\kadiram\Documents\MATLAB\con_esp.mat');
            win_len = con_fil.win_len;
            bou_ons_bou = rec_fil.bou_ons_bou;% .all, sec
            fra_rat = con_fil.fra_rat;
            fra_rat = fra_rat.cal.eig;
            isi = con_fil.isi;
            % vibration type(bou_all), cell type
            [~, ~, ~, ~, ~, dff_cem_fra, ~, ~, ~, ~, ~, ~] = cal_rel_cha_uni_poi_tri(piv_fra_cel, ...
                win_len.dff.eig, bou_ons_bou.non, fra_rat, isi, win_len.dff.pha.drn.tai);
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            save(obj.fil_pat_rec, 'dff_cem_fra', '-append')
        end
        function app_dff_spo(obj)
            % rec_fil = matfile(obj.fil_pat_rec);
            % con_fil = matfile('\\home.ansatt.ntnu.no\kadiram\Documents\MATLAB\con_esp.mat');
            % cel_fie_pla_row_col = rec_fil.cel_fie_pla_row_col;
            % fra_rat = con_fil.fra_rat;
            % dff_pla_fra_cem = rec_fil.dff_pla_fra_cel;
            % pla = 3;
            % fil_pat_cal_pla = obj.fil_pat_ima_cal_pla;
            % obj.fil_pat_ima_cal = fil_pat_cal_pla{pla};
            % cel_row_col = rec_fil.cel_row_col;
            % piv_fra_cel = cal_piv_fra_cel(obj.fil_pat_ima_cal, cel_row_col);
            % %
            % cel_fie_pla_row_col.pla{pla} = cel_row_col;
            % cel_fie_pla_row_col.pla{pla}(cel_fie_pla_row_col.pla{pla} == 0) = nan;
            % dff_pla_fra_cem{pla} = cal_dff_fra_roi.sli(fra_rat.cal.eig, piv_fra_cel);
            % [~, ~, ~, x_cem, y_cem, z_cem, ~] = cal_xyz_cel(obj.factor_meter, ...
            %     obj.iniStruct, cel_fie_pla_row_col.pla);
            % %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            % save(obj.fil_pat_rec, 'dff_pla_fra_cem', 'x_cem', 'y_cem', 'z_cem', '-append')

            rec_fil = matfile(obj.fil_pat_rec);
            clu_cel_k = rec_fil.clu_cel_k;
            dff_pla_fra_cem = rec_fil.dff_pla_fra_cem;
            dff_fra_cem = [dff_pla_fra_cem{:}];% for spo
            met = 'sgolay';
            con_fil = matfile('\\home.ansatt.ntnu.no\kadiram\Documents\MATLAB\con_esp.mat');
            n_fra = con_fil.n_fra;
            dff_fra_cem = smoothdata(dff_fra_cem, met, n_fra.dff.eig.smo);
            log_fra = con_fil.log_fra;
            [clu_cel_k.ong_man, ~] = com_clu_cel_k(dff_fra_cem(log_fra.cal.eig.ong, :));% single per
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            save(obj.fil_pat_rec, 'dff_fra_cem', 'clu_cel_k', '-append')
        end
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% gab
        function app_gab(obj, thr)
            rec_fil = matfile(obj.fil_pat_rec);
            con_fil = matfile('\\home.ansatt.ntnu.no\kadiram\Documents\MATLAB\con_esp.mat');
            n_pla = con_fil.n_pla;
            fun_pla = con_fil.fun_pla;
            cel_fie_pla_row_col = rec_fil.cel_pla_row_col;
            n_cel_pla = rec_fil.n_cel_pla;
            n_cel_pla.raw(2) = 0;
            end_cel_pla = cumsum(n_cel_pla.raw);
            sta_cel_pla = [1; end_cel_pla(1:end - 1) + 1];
            n_cel = rec_fil.n_cel;
            piv_cel = nan(n_cel.all, 1);
            piv_pla_row_col = rec_fil.piv_pla_row_col;
            piv_pla_row_col.red_sub = cell(n_pla.neu.raw, 1);
            log_fie_fie_pla_row_col.all.all = cell(n_pla.neu.raw, 1);
            piv = con_fil.piv;
            if obj.ani == "esp257" || obj.ani == "esp258" || obj.ani == "esp259"
                cro_rat = 0.12;
                piv.off.red = piv.off.red.fir;
            else
                cro_rat = 0.07;
                piv.off.red = piv.off.red.sec;
            end
            for pla = fun_pla.raw
                cel_row_col = cel_fie_pla_row_col.pla{pla};
                log_fie_fie_pla_row_col.all.all{pla} = ~isnan(cel_row_col);
                piv_row_col = (piv_pla_row_col.red{pla} - piv.off.red) - ...
                    cro_rat*(piv_pla_row_col.gre{pla} - piv.off.gre);% uint16
                piv_pla_row_col.red_sub{pla} = piv_row_col;
                sta_cel = sta_cel_pla(pla);
                for cel = 1:n_cel_pla.raw(pla)
                    log_row_col = cel_row_col == cel;
                    piv_cel(sta_cel + cel - 1) = mean(piv_row_col(log_row_col));
                end
            end
            log_cel_pla = false(n_cel.all, n_pla.neu.raw);
            z_sco_cel = zscore(piv_cel);
            log_fie_fie_cel.gab.all = z_sco_cel > thr;
            n_cel.gab = sum(log_fie_fie_cel.gab.all);
            log_fie_fie_cel.non.all = ~log_fie_fie_cel.gab.all;
            gab_cel_num = find(log_fie_fie_cel.gab.all);
            non_cel_num = setdiff(1:n_cel.all, gab_cel_num);
            log_pla_cel.gab = cell(n_pla.neu.raw, 1);
            log_fie_fie_pla_row_col.gab.all = cell(n_pla.neu.raw, 1);
            log_fie_fie_pla_row_col.non.all = cell(n_pla.neu.raw, 1);
            for pla = fun_pla.raw
                log_cel_pla(sta_cel_pla(pla):end_cel_pla(pla), pla) = true;% stay !!!!
                log_pla_cel.gab{pla} = log_fie_fie_cel.gab.all(log_cel_pla(:, pla));
                cel_row_col = sta_cel_pla(pla) + cel_fie_pla_row_col.pla{pla} - 1;
                log_fie_fie_pla_row_col.gab.all{pla} = ismember(cel_row_col, gab_cel_num);
                log_fie_fie_pla_row_col.non.all{pla} = ismember(cel_row_col, non_cel_num);
            end
            log_fie_fie_pla_row_col.gab.srt.all = log_fie_fie_pla_row_col.gab.all;
            log_fie_fie_pla_row_col.non.srt.all = log_fie_fie_pla_row_col.non.all;
            log_fie_fie_pla_row_col.gab.zsc.all = log_fie_fie_pla_row_col.gab.all;
            log_fie_fie_pla_row_col.non.zsc.all = log_fie_fie_pla_row_col.non.all;
            %
            dff_pla_fra_cel = rec_fil.dff_pla_fra_cel;
            dff_fra_cel = [dff_pla_fra_cel{:}];
            met = 'sgolay';
            n_fra = con_fil.n_fra;
            log_fra = con_fil.log_fra;
            if obj.ani == "esp258"
                dff_fra_cel = enh_piv_fra_cel(dff_fra_cel);
                %dff_fra_cel(log_fra.cal.eig.ong, :) = fil_yak_all(dff_fra_cel(log_fra.cal.eig.ong, :));
                dff_fra_cel(log_fra.cal.eig.ong, :) = smoothdata(dff_fra_cel(log_fra.cal.eig.ong, :)...
                    , met, n_fra.dff.eig.smo);
            else
                %dff_fra_cel = fil_yak_all(dff_fra_cel);
                dff_fra_cel = smoothdata(dff_fra_cel, met, n_fra.dff.eig.smo);
                % tail-triggered responses
                bou_ons_bou = rec_fil.bou_ons_bou;% .all, sec
                piv_pla_fra_cel = rec_fil.piv_pla_fra_cel;
                coo_cel_dim = rec_fil.coo_cel_dim;
                [log_fie_fie_cel, log_fie_fie_pla_row_col, dff_cel_fra, fra_fie, fra_fie_fie_blo, ...
                    res_fie_cel] = cal_dff_cel_fra(bou_ons_bou, piv_pla_fra_cel, log_fie_fie_cel, ...
                    coo_cel_dim, cel_fie_pla_row_col, log_fie_fie_pla_row_col);
                %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
                save(obj.fil_pat_rec, 'dff_cel_fra', 'fra_fie', 'fra_fie_fie_blo', 'res_fie_cel', ...
                    '-append')
            end
            % clustering !
            k = 4;
            [clu_cel_k.ong, ~] = com_clu_cel_k(dff_fra_cel(log_fra.cal.eig.ong, :), k);
            [acc, xcc] = cal_acc_xcc(dff_fra_cel, log_fie_fie_cel.gab.all);% abs cor coe
            n_k = 5;
            clu_sel_k.gab = nan(n_k, 1);
            clu_sel_k.ran = nan(n_k, 1);
            log_fie_fie_cel.ran = false(n_cel.all, 1);
            clu_sel_k.gab(k) = cal_clu_sel(clu_cel_k.ong(log_fie_fie_cel.gab.all, k), k);
            n_ite = 100;
            clu_sel_ite = nan(n_ite, 1);
            for ite = 1:n_ite
                cel_num = randi(n_cel.all, n_cel.gab, 1);
                log_fie_fie_cel.ran(cel_num) = true;
                clu_sel_ite(ite) = cal_clu_sel(clu_cel_k.ong(log_fie_fie_cel.ran, k), k);
            end
            clu_sel_k.ran(k) = mean(clu_sel_ite);
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            save(obj.fil_pat_rec, 'piv_pla_row_col', 'n_cel', 'log_cel_pla', 'log_fie_fie_cel', ...
                'log_pla_cel', 'log_fie_fie_pla_row_col', 'cel_fie_pla_row_col', 'dff_fra_cel', ...
                'clu_cel_k', 'acc', 'xcc', 'clu_sel_k', '-append')

            rec_fil = matfile(obj.fil_pat_rec);
            piv_pla_fra_cel = rec_fil.piv_pla_fra_cel;
            piv_fra_cel = [piv_pla_fra_cel{:}];
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            save(obj.fil_pat_rec, 'piv_fra_cel', '-append')

            rec_fil = matfile(obj.fil_pat_rec);
            piv_fra_cel = rec_fil.piv_fra_cel;
            log_cel = rec_fil.log_cel;
            bou_ons_bou = rec_fil.bou_ons_bou;
            con_fil = matfile('\\home.ansatt.ntnu.no\kadiram\Documents\MATLAB\con_esp.mat');
            win_len = con_fil.win_len;
            pha_win_len = win_len.dff.pha.drn.gab;
            [dff_cel_fra, log_cel, res_fie_cel] = cal_dff_cel_fra.neu(piv_fra_cel, ...
                log_cel, bou_ons_bou, pha_win_len);
            fra_fie = cal_fra_fie.mod(log_cel);
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            save(obj.fil_pat_rec, 'dff_cel_fra', 'log_cel', 'res_fie_cel', 'fra_fie', '-append')

            rec_fil = matfile(obj.fil_pat_rec);
            n_cel = rec_fil.n_cel;
            n_cel.non = n_cel.all - n_cel.gab;
            fra_fie = rec_fil.fra_fie;
            fra_fie.gab = n_cel.gab/n_cel.all;
            fra_fie.non = n_cel.non/n_cel.all;
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            save(obj.fil_pat_rec, 'n_cel', 'fra_fie', '-append')

            rec_fil = matfile(obj.fil_pat_rec);
            con_fil = matfile('\\home.ansatt.ntnu.no\kadiram\Documents\MATLAB\con_esp.mat');
            n_pla = con_fil.n_pla;
            fun_pla = con_fil.fun_pla;
            cel_fie_pla_row_col = rec_fil.cel_pla_row_col;
            n_cel_pla = rec_fil.n_cel_pla;
            n_cel_pla.raw(2) = 0;
            end_cel_pla = cumsum(n_cel_pla.raw);
            sta_cel_pla = [1; end_cel_pla(1:end - 1) + 1];
            n_cel = rec_fil.n_cel;
            piv_cel = nan(n_cel.all, 1);
            piv_pla_row_col = rec_fil.piv_pla_row_col;
            piv_pla_row_col.red_sub = cell(n_pla.neu.raw, 1);
            log_fie_fie_pla_row_col.all.all = cell(n_pla.neu.raw, 1);
            piv = con_fil.piv;
            if obj.ani == "esp257" || obj.ani == "esp258" || obj.ani == "esp259"
                cro_rat = 0.12;
                piv.off.red = piv.off.red.fir;
            else
                cro_rat = 0.07;
                piv.off.red = piv.off.red.sec;
            end
            for pla = fun_pla.raw
                cel_row_col = cel_fie_pla_row_col.pla{pla};
                log_fie_fie_pla_row_col.all.all{pla} = ~isnan(cel_row_col);
                piv_row_col = (piv_pla_row_col.red{pla} - piv.off.red) - ...
                    cro_rat*(piv_pla_row_col.gre{pla} - piv.off.gre);% uint16
                piv_pla_row_col.red_sub{pla} = piv_row_col;
                sta_cel = sta_cel_pla(pla);
                for cel = 1:n_cel_pla.raw(pla)
                    log_row_col = cel_row_col == cel;
                    piv_cel(sta_cel + cel - 1) = mean(piv_row_col(log_row_col));
                end
            end
            z_sco_cel = zscore(piv_cel);
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            save(obj.fil_pat_rec, 'z_sco_cel', '-append')
        end
        % un
        function app_par_gab(obj)
            rec_fil = matfile(obj.fil_pat_rec);
            piv_fra_cel = rec_fil.piv_fra_cel;
            dff_cel_fra = rec_fil.dff_cel_fra;
            log_cel = rec_fil.log_cel;
            res_fie_cel = rec_fil.res_fie_cel;
            bou_ons_bou = rec_fil.bou_ons_bou;
            con_fil = matfile('\\home.ansatt.ntnu.no\kadiram\Documents\MATLAB\con_esp.mat');
            win_len = con_fil.win_len;
            pha_win_len = win_len.dff.pha.drn.gab;
            fra_rat = con_fil.fra_rat;
            fra_rat = fra_rat.cal.eig;
            isi = con_fil.isi;
            [~, ~, ~, ~, ~, dff_cel_fra.bou_non, ~, ~, log_cel.bou_non, ~, ~, ...
                res_fie_cel.bou_non] = cal_rel_cha_uni_poi_tri(piv_fra_cel, win_len.dff.eig, ...
                bou_ons_bou.non, fra_rat, isi, pha_win_len);
            fra_fie = rec_fil.fra_fie;
            fra_fie.bou_non = cal_fra_fie.reg(log_cel, 'bou_non');
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            save(obj.fil_pat_rec, 'dff_cel_fra', 'log_cel', 'res_fie_cel', 'fra_fie', '-append')
        end
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% spo
        function app_spo(obj)
            rec_fil = matfile(obj.fil_pat_rec);
            dff_pla_fra_cel = rec_fil.dff_pla_fra_cel;
            dis_pai = rec_fil.dis_pai;
            con_fil = matfile('\\home.ansatt.ntnu.no\kadiram\Documents\MATLAB\con_esp.mat');
            tim_fra = con_fil.tim_fra;
            tim_fra = tim_fra.cal.eig.ses.spo;
            mrp_ons = rec_fil.mrp_ons;
            mrp_off = rec_fil.mrp_off;
            [dff_fra_cel, ioi_kxx, ioi_shu_kxx, del_ioi_kxx, clu_cel, clu_fid, r_pai, pcc_blo, ...
                clu_cel_k, log_fra.ong] = cal_spo(tim_fra, dff_pla_fra_cel, dis_pai, mrp_ons, mrp_off);
            % clu_cel_k.ong - single per
            piv_pla_fra_cel = rec_fil.piv_pla_fra_cel;
            piv_fra_cel = [piv_pla_fra_cel{:}];
            mrp = rec_fil.mrp;
            ofr_win = cal_ofr_win(piv_fra_cel, mrp, mrp_ons);
            %
            spo_per_ons = mrp_ons - mrp;
            spo_per_off = mrp_ons + mrp;
            [clu_cel.tai_qui, log_fra.tai_qui] = det_clu_cel(dff_fra_cel, spo_per_ons, spo_per_off);
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            save(obj.fil_pat_rec, 'dff_fra_cel', 'ioi_kxx', 'ioi_shu_kxx', 'del_ioi_kxx', ...
                'clu_cel', 'clu_fid', 'r_pai', 'pcc_blo', 'clu_cel_k', 'log_fra', 'ofr_win', '-append')
        end
        % un
        function app_par_spo(obj)
            rec_fil = matfile(obj.fil_pat_rec);
            clu_cel_k = rec_fil.clu_cel_k;
            n_cel_clu = cal_n_cel_clu(clu_cel_k.ong(:, 4));
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            save(obj.fil_pat_rec, 'n_cel_clu', '-append')
        end
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% behavioral plots
        function plo_tai_ang_met(obj)
            con_fil = matfile('\\home.ansatt.ntnu.no\kadiram\Documents\MATLAB\con_esp.mat');
            tim_fra = con_fil.tim_fra;
            tim_fra = tim_fra.ani.ses.spo;%!!!!!!!!!!!!
            rec_fil = matfile(obj.fil_pat_rec);
            tai_ang_fra = rec_fil.tai_ang_uni;
            fig; plot(tim_fra, tai_ang_fra)
        end
        function h_fig = plo_con_tai_ang_met(obj)
            rec_fil = matfile(obj.fil_pat_rec);
            tai_ang_uni = rec_fil.tai_ang_uni;
            h_fig = plo_con_tai_ang(tai_ang_uni);
        end
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% neural plotting
        function plo_cel_met(obj)%region
            rec_fil = matfile(obj.fil_pat_rec);
            int_ref_row_col = rec_fil.int_ref_row_col;
            log_cel_reg = rec_fil.log_cel_reg;
            cel_lab_tel_chu_row_col = rec_fil.cel_lab_tel_chu_row_col;
            plo_cel(int_ref_row_col, log_cel_reg, cel_lab_tel_chu_row_col)
        end
        function h_fig = plo_ras_map_met(obj)
            rec_fil = matfile(obj.fil_pat_rec);
            h_fig = plo_ras_map(rec_fil.isort1, rec_fil.iclustup1, rec_fil.traces);
        end
        function h_fig = plo_ras_map_sub_met(obj)
            rec_fil = matfile(obj.fil_pat_rec);
            h_fig = plo_ras_map_sub(rec_fil.traces, rec_fil.log_cel_reg);
        end
        function h_fig = plo_clu_map_met(obj)
            rec_fil = matfile(obj.fil_pat_rec);
            h_fig = plo_clu_map(rec_fil.iclustup1, rec_fil.log_cel_reg, rec_fil.cel_lab_row_col);
        end
        function h_fig = plo_ras_map_sub_ver_met(obj, epo_num)
            rec_fil = matfile(obj.fil_pat_rec);
            h_fig = plo_ras_map_sub(rec_fil.act_reg_epo_fra_cel, epo_num);
        end
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% axo-cel
        function h_fig = plo_tai_com_met(obj)
            mat_fil = matfile(obj.fil_pat_rec);
            tai_ang_fra = mat_fil.tai_ang_fra;
            sco_fra_com = mat_fil.sco_fra_com;
            h_fig = plo_tai_com(tai_ang_fra.dow.raw, sco_fra_com.all);
        end
        function h_fig = plo_tai_com_dor_met(obj)
            mat_fil = matfile(obj.fil_pat_rec);
            sco_fra_com = mat_fil.sco_fra_com;
            h_fig = plo_tai_com(mat_fil.tai_ang_uni, mat_fil.fra_tim_uni, sco_fra_com.dor);
        end
        function h_fig = plo_tai_com_ven_met(obj)
            mat_fil = matfile(obj.fil_pat_rec);
            sco_fra_com = mat_fil.sco_fra_com;
            h_fig = plo_tai_com(mat_fil.tai_ang_uni, mat_fil.fra_tim_uni, sco_fra_com.ven);
        end
        function h_fig = plo_neu_axo_met(obj)
            rec_fil = matfile(obj.fil_pat_rec);
            h_fig = plo_neu_axo(rec_fil.piv_pla_row_col, rec_fil.dff_pla_con_row_col, obj.tit, obj.exp);
        end
        function h_fig = plo_axo_cel_sin_met(obj)
            rec_fil = matfile(obj.fil_pat_rec);
            piv_pla_row_col = rec_fil.piv_pla_row_col;
            dff_fra_roi = rec_fil.dff_roi_fra';
            log_pla_roi_row_col = rec_fil.log_pla_roi_row_col;
            dff_fra_cel = rec_fil.dff_cel_fra';
            cel_fie_pla_row_col = rec_fil.cel_fie_pla_row_col;
            h_fig = plo_axo_cel_sin(piv_pla_row_col.glu, dff_fra_roi, ...
                log_pla_roi_row_col, obj.per_bin_edg, dff_fra_cel, ...
                cel_fie_pla_row_col.pla);
        end
        function h_fig = plo_ses_met(obj)
            con_fil = matfile('\\home.ansatt.ntnu.no\kadiram\Documents\MATLAB\con_esp.mat');
            mat_fil = matfile(obj.fil_pat_rec);
            dff_fra_icx = mat_fil.dff_fra_icx;
            sti_ons_tri = con_fil.sti_ons_tri;
            fra_rat = con_fil.fra_rat;
            y_lab = con_fil.y_lab;
            h_fig = plo_ses(fra_rat.cal.eig, dff_fra_icx.sli, y_lab.dff, sti_ons_tri.vrs.sec);
        end
        function h_fig = plo_blu_met(obj)
            mat_fil = matfile(obj.fil_pat_rec);
            piv_pla_row_col = mat_fil.piv_pla_row_col;
            h_fig = plo_blu(piv_pla_row_col, obj.per_bin_edg);
        end
        function h_fig = plo_z_sco_met(obj)
            mat_fil = matfile(obj.fil_pat_rec);
            piv_pla_row_col = mat_fil.piv_pla_row_col;
            z_sco_pla_row_col = mat_fil.z_sco_pla_row_col;
            h_fig = plo_z_sco(piv_pla_row_col.glu, z_sco_pla_row_col.glu, obj.per_bin_edg);
        end
        function h_fig = plo_roi_met(obj)
            mat_fil = matfile(obj.fil_pat_rec);
            piv_pla_row_col = mat_fil.piv_pla_row_col;
            log_pla_icx_row_col = mat_fil.log_pla_icx_row_col;
            h_fig = plo_roi(piv_pla_row_col.glu, log_pla_icx_row_col.glu, obj.per_bin_edg, obj.ani);
        end
        function h_fig = plo_cor_map_met(obj)
            mat_fil = matfile(obj.fil_pat_rec);
            log_pla_icx_row_col = mat_fil.log_pla_icx_row_col;
            h_fig = plo_cor_map(mat_fil.r_pla_icx_row_col, log_pla_icx_row_col.glu);
        end
        function h_fig = plo_icx_res_met(obj)
            con_fil = matfile('\\home.ansatt.ntnu.no\kadiram\Documents\MATLAB\con_esp.mat');
            mat_fil = matfile(obj.fil_pat_rec);
            tim_fra = con_fil.tim_fra;
            h_fig = plo_icx_res(tim_fra.cal.eig.tri.dff, mat_fil.dff_icx_con_fra_tri, obj.ani);
        end
        function h_fig = plo_exc_inh_met(obj)
            sam_fil = matfile(obj.fil_pat_rec);
            log_pla_icx_row_col = sam_fil.log_pla_icx_row_col;
            h_fig = plo_exc_inh(sam_fil.r_pla_icx_row_col, log_pla_icx_row_col.glu);
        end% cor
        function h_fig = plo_cor_map_exc_inh_met(obj, fie)
            rec_fil = matfile(obj.fil_pat_rec);
            log_pla_roi_row_col = rec_fil.log_pla_roi_row_col;
            log_roi = rec_fil.log_roi;
            r_pla_icx_row_col = rec_fil.r_pla_icx_row_col;
            ind_pla_roi = rec_fil.ind_pla_roi;
            h_fig = plo_cor_map_exc_inh(r_pla_icx_row_col.(fie), log_pla_roi_row_col, log_roi, ...
                ind_pla_roi);
        end
        function h_fig = plo_cor_map_ove_met(obj, fie)
            rec_fil = matfile(obj.fil_pat_rec);
            log_pla_roi_row_col = rec_fil.log_pla_roi_row_col;
            log_roi = rec_fil.log_roi;
            r_pla_icx_row_col = rec_fil.r_pla_icx_row_col;
            ind_pla_roi = rec_fil.ind_pla_roi;
            h_fig = plo_cor_map_ove(r_pla_icx_row_col.(fie), log_pla_roi_row_col, log_roi, ...
                ind_pla_roi);
        end
        function h_fig = plo_inh_exc_sig_roi_met(obj)
            rec_fil = matfile(obj.fil_pat_rec);
            dff_roi_fra = rec_fil.dff_roi_fra;
            log_fie_roi = rec_fil.log_roi;
            con_fil = matfile('\\home.ansatt.ntnu.no\kadiram\Documents\MATLAB\con_esp.mat');
            win_len = con_fil.win_len;
            h_fig = plo_inh_exc_fie.raw(dff_roi_fra, log_fie_roi.all.zsc, win_len.dff.pha.drn.tai, ...
                win_len.dff.eig);
        end
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% axo-onl
        function h_fig = plo_axo_sin_met(obj)
            rec_fil = matfile(obj.fil_pat_rec);
            piv_pla_row_col = rec_fil.piv_pla_row_col;
            dff_bin_fra = rec_fil.dff_bin_fra;
            dff_fra_bin = dff_bin_fra.bou.all';
            ind_pla_bin = rec_fil.ind_pla_bin;
            log_pla_icx_row_col = rec_fil.log_pla_icx_row_col;

            % axo
            %piv_pla_row_col = piv_pla_row_col.glu;

            h_fig = plo_axo_sin(piv_pla_row_col, dff_fra_bin, ind_pla_bin, ...
                log_pla_icx_row_col.glu, obj.per_bin_edg);
        end
        function h_fig = plo_axo_sin_pix_met(obj)
            rec_fil = matfile(obj.fil_pat_rec);
            piv_pla_row_col = rec_fil.piv_pla_row_col;
            dff_pix_fra = rec_fil.dff_pix_fra;
            dff_fra_pix = dff_pix_fra.bou.all';
            ind_pla_pix = rec_fil.ind_pla_pix;
            log_pla_icx_row_col = rec_fil.log_pla_icx_row_col;
            per_bin_edg_dis = 25;
            h_fig = plo_axo_sin_pix(piv_pla_row_col.glu, dff_fra_pix, ind_pla_pix, ...
                log_pla_icx_row_col.glu, per_bin_edg_dis);
        end
        function h_fig = plo_tri_res_met(obj)
            con_fil = matfile('\\home.ansatt.ntnu.no\kadiram\Documents\MATLAB\con_esp.mat');
            mat_fil = matfile(obj.fil_pat_rec);
            tim_fra = con_fil.tim_fra;
            dff_rox_con_fra_tri = mat_fil.dff_rox_con_fra_tri;
            fig
            h_fig = plot(tim_fra.cal.eig.tri.dff, dff_rox_con_fra_tri{1, 3});
        end
        function h_fig = plo_inh_exc_sig_met(obj, con_num)
            mat_fil = matfile(obj.fil_pat_rec);
            h_fig = plo_inh_exc_sig(mat_fil.dff_con_pla_fra_pix, con_num, mat_fil.ind_con_pla_pix);
        end
        function h_fig = plo_exc_inh_sig_met(obj, con_num)
            mat_fil = matfile(obj.fil_pat_rec);
            h_fig = plo_exc_inh_sig(mat_fil.dff_con_pla_fra_pix, con_num, mat_fil.ind_con_pla_pix);
        end
        function h_fig = plo_exc_inh_sig_tes_met(obj, con_num)
            mat_fil = matfile(obj.fil_pat_rec);
            h_fig = plo_exc_inh_sig_tes(mat_fil.dff_con_pla_fra_pix, con_num);
        end
        function h_fig = plo_inh_exc_map_met(obj)
            mat_fil = matfile(obj.fil_pat_rec);
            h_fig = plo_inh_exc_map(mat_fil.res_pla_con_row_col);
        end
        function h_fig = plo_cor_dis_met(obj)
            mat_fil = matfile(obj.fil_pat_rec);
            pcc_blo = mat_fil.pcc_blo;
            h_fig = plo_cor_dis(pcc_blo);
        end
        function h_fig = plo_cel_clu_map_ani_mic_met(obj)
            rec_fil = matfile(obj.fil_pat_rec);
            clu_cel_k = rec_fil.clu_cel_k;
            k = 4;

            % x_cel.abs = rec_fil.x_cel;
            % y_cel.abs = rec_fil.y_cel;
            % z_cel.abs = rec_fil.z_cel;
            % clu_cel = clu_cel_k.ong(:, k);

            x_cel = rec_fil.x_cem;
            y_cel = rec_fil.y_cem;
            z_cel = rec_fil.z_cem;
            clu_cel = clu_cel_k.ong_man(:, k);
            % mapping !!!!!!!!!!!!!!!!!
            clu_cel = arrayfun(@(clu) map_vec.ong(clu), clu_cel);
            n_one = sum(clu_cel == 1);%21
            
            con_fil = matfile('\\home.ansatt.ntnu.no\kadiram\Documents\MATLAB\con_esp.mat');
            piv_col_pcx = con_fil.piv_col_pcx;
            h_fig = plo_clu_map_ani(x_cel, y_cel, z_cel, clu_cel, piv_col_pcx.fou.ong);
        end% order as in ms
        function h_fig = plo_inh_exc_spl_met(obj, fie_num)
            rec_fil = matfile(obj.fil_pat_rec);
            x_bin = rec_fil.x_bin;
            y_bin = rec_fil.y_bin;
            z_bin = rec_fil.z_bin;
            con_fil = matfile('\\home.ansatt.ntnu.no\kadiram\Documents\MATLAB\con_esp.mat');
            piv_col_pcx = con_fil.piv_col_pcx;
            res_bin = rec_fil.res_bin;
            res_bin = getfield(res_bin, fie_num{3:end});
            mar_siz.pix = 7;
            vie_ang_dir = [-120 30];
            h_fig = plo_clu_map_ani_spl(x_bin, y_bin, z_bin, piv_col_pcx.div, ...
                res_bin, mar_siz.pix, vie_ang_dir);
        end
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% cel-onl
        function h_fig = plo_neu_sin_met(obj)
            rec_fil = matfile(obj.fil_pat_rec);
            piv_pla_row_col = rec_fil.piv_pla_row_col;
            dff_fra_cel = rec_fil.dff_fra_cel;%entire including 1st min
            n_cel_pla = rec_fil.n_cel_pla;
            cel_pla_row_col = rec_fil.cel_pla_row_col;
            h_fig = plo_neu_sin(piv_pla_row_col.glu, dff_fra_cel, n_cel_pla.raw, cel_pla_row_col.pla);
        end
        function h_fig = plo_ong_two_met(obj)
            rec_fil = matfile(obj.fil_pat_rec);
            clu_cel = rec_fil.clu_cel;
            dff_fra_cel = rec_fil.dff_fra_cel;
            h_fig = plo_ong_two(clu_cel, dff_fra_cel);
        end
        function h_fig = plo_clu_map_ani_two_met(obj)
            rec_fil = matfile(obj.fil_pat_rec);
            x_cel = rec_fil.x_cel;
            y_cel = rec_fil.y_cel;
            z_cel = rec_fil.z_cel;
            clu_cel = rec_fil.clu_cel;
            con_fil = matfile('\\home.ansatt.ntnu.no\kadiram\Documents\MATLAB\con_esp.mat');
            piv_col_pcx = con_fil.piv_col_pcx;
            h_fig = plo_clu_map_ani_two(x_cel, y_cel, z_cel, clu_cel, piv_col_pcx.fou.ong);
        end
        function h_fig = plo_tai_dff_drn_met(obj)
            rec_fil = matfile(obj.fil_pat_rec);
            tai_ang_fra = rec_fil.tai_ang_uni;
            piv_fra_cel = rec_fil.dff_fra_cel;
            bou_ons_bou = rec_fil.bou_ons_bou;
            log_cel = rec_fil.log_cel;
            log_cel = log_cel.bou_all.neu.srt;
            h_fig = plo_tai_dff_drn(tai_ang_fra, piv_fra_cel, bou_ons_bou.all, log_cel);
        end
        function h_fig = plo_vis_tai_met(obj)
            rec_fil = matfile(obj.fil_pat_rec);
            piv_pla_row_col = rec_fil.piv_pla_row_col;
            dff_cel_fra = rec_fil.dff_cel_fra;
            n_cel_pla = rec_fil.n_cel_pla;
            cel_pla_row_col = rec_fil.cel_pla_row_col;
            h_fig = plo_vis_tai(piv_pla_row_col.glu, dff_cel_fra.bou_all, n_cel_pla.raw, ...
                cel_pla_row_col.pla);
        end
        function h_fig = plo_roi_ove_met(obj)
            mat_fil = matfile(obj.fil_pat_rec);
            piv_pla_row_col = mat_fil.piv_pla_row_col;
            log_pla_icx_row_col = mat_fil.log_pla_icx_row_col;
            
            cel_fie_pla_row_col = mat_fil.cel_fie_pla_row_col;
            cel_pla_row_col = cel_fie_pla_row_col.pla;
            cel_row_col = cel_pla_row_col{3};

            h_fig = plo_roi_ove(piv_pla_row_col.glu, log_pla_icx_row_col.glu, obj.per_bin_edg, ...
                obj.ani, cel_row_col);
        end
        function h_fig = plo_vis_reg_met(obj)
            rec_fil = matfile(obj.fil_pat_rec);
            clu_cel = rec_fil.clv_cel;
            dff_fra_cel = rec_fil.dfv_fra_cel;
            lov_fra = rec_fil.lov_fra;
            x_off_fra = rec_fil.x_off_fra;
            y_off_fra = rec_fil.y_off_fra;
            lot_fra = rec_fil.lot_fra;
            tai_ang_fra = rec_fil.tai_ang_uni;
            tai_ang_fra = tai_ang_fra(lot_fra);
            tim = 10;
            h_fig = plo_vis_reg(clu_cel, dff_fra_cel, x_off_fra(lov_fra), y_off_fra(lov_fra), ...
                tai_ang_fra, tim);
            % piv_row_col_pcx = ext_piv_row_col_pcx(clu_cel, dff_fra_cel, x_off_fra(lov_fra), ...
            %     y_off_fra(lov_fra), tai_ang_fra);
        end
        function h_fig = plo_roi_con_met(obj)
            rec_fil = matfile(obj.fil_pat_rec);
            piv_pla_row_col = rec_fil.piv_pla_row_col;
            dff_cel_fra = rec_fil.dff_cel_fra;
            dff_cel_fra = dff_cel_fra.bou_all;
            n_cel_pla = rec_fil.n_cel_pla;
            n_cel_pla = n_cel_pla.raw;
            cel_pla_row_col = rec_fil.cel_pla_row_col;
            cel_pla_row_col = cel_pla_row_col.pla;
            obj.per_bin_edg = 100;% checked, max pixel value taken as the upper limit.
            h_fig = plo_roi_con(piv_pla_row_col.glu, obj.per_bin_edg, ...
                obj.ani, obj.targetP, dff_cel_fra, n_cel_pla, cel_pla_row_col);
        end
        function h_fig = plo_roi_ove_sin_met(obj)
            rec_fil = matfile(obj.fil_pat_rec);
            piv_pla_row_col = rec_fil.piv_pla_row_col;
            %piv_row_col = piv_pla_row_col.glu;
            %piv_pla_row_col = piv_pla_row_col.raw;
            piv_pla_row_col = piv_pla_row_col.ima;
            
            % cel_fie_pla_row_col = mat_fil.cel_fie_pla_row_col;
            % cel_pla_row_col = cel_fie_pla_row_col.pla;
            % cel_row_col = cel_pla_row_col{3};

            %cel_row_col = rec_fil.ced_row_col;
            cel_row_col = rec_fil.cel_row_col;
            
            %obj.per_bin_edg = 100;
            %obj.per_bin_edg = 70;
            obj.per_bin_edg = 30;

            h_fig = plo_roi_ove_sin(piv_pla_row_col, obj.per_bin_edg, obj.ani, cel_row_col);
        end
        function h_fig = plo_roi_man_met(obj)
            rec_fil = matfile(obj.fil_pat_rec);
            piv_pla_row_col = rec_fil.piv_pla_row_col;
            piv_pla_row_col = piv_pla_row_col.ima;
            obj.per_bin_edg = 30;
            roiPositions = rec_fil.roiPositions;
            h_fig = plo_roi_man(piv_pla_row_col, obj.per_bin_edg, obj.ani, roiPositions);
        end
        function h_fig = plo_roi_con_sin_met(obj)
            rec_fil = matfile(obj.fil_pat_rec);
            piv_pla_row_col = rec_fil.piv_pla_row_col;
            % dff_cel_fra = rec_fil.dff_ced_fra;
            % ced_row_col = rec_fil.ced_row_col;
            % h_fig = plo_roi_con_sin(piv_pla_row_col.glu, obj.ani, dff_cel_fra, ced_row_col);
            dff_cel_fra = rec_fil.dff_cem_fra;
            cel_row_col = rec_fil.cel_row_col;
            h_fig = plo_roi_con_sin(piv_pla_row_col.ima, obj.ani, dff_cel_fra, cel_row_col, ...
                rec_fil.roiPositions);
        end
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% gab
        function h_fig = plo_gab_met(obj)
            rec_fil = matfile(obj.fil_pat_rec);
            piv_pla_row_col = rec_fil.piv_pla_row_col;
            log_pla_row_col = rec_fil.log_pla_row_col;
            h_fig = plo_gab(piv_pla_row_col, obj.ani, log_pla_row_col);
        end
        function h_fig = plo_gab_ong_met(obj, k)
            rec_fil = matfile(obj.fil_pat_rec);
            clu_cel_k = rec_fil.clu_cel_k;
            
            % clu_cel = clu_cel_k.ong(:, k);
            % dff_fra_cel = rec_fil.dff_fra_cel;

            clu_cel = clu_cel_k.ong_man(:, k);
            % mapping !!!!!!!!!!!!!!!!!
            clu_cel = arrayfun(@(clu) map_vec.ong(clu), clu_cel);
            dff_fra_cel = rec_fil.dff_fra_cem;
            
            con_fil = matfile('\\home.ansatt.ntnu.no\kadiram\Documents\MATLAB\con_esp.mat');
            log_fra = con_fil.log_fra;
            h_fig = plo_ong(clu_cel, dff_fra_cel(log_fra.cal.eig.ong, :));
        end% also for cel_onl, order as in ms
        function h_fig = plo_gab_clu_map_ani_mic_met(obj, k)
            rec_fil = matfile(obj.fil_pat_rec);
            x_cel = rec_fil.x_cel;
            y_cel = rec_fil.y_cel;
            z_cel = rec_fil.z_cel;
            clu_cel_k = rec_fil.clu_cel_k;
            con_fil = matfile('\\home.ansatt.ntnu.no\kadiram\Documents\MATLAB\con_esp.mat');
            piv_col_pcx = con_fil.piv_col_pcx;
            val_col_pcx = piv_col_pcx.fou.ong_gab;
            log_cel = rec_fil.log_cel;
            h_fig = plo_gab_clu(x_cel, y_cel, z_cel, clu_cel_k.ong(:, k), val_col_pcx, log_cel.gab.all);
        end% ongoing
        function h_fig = plo_gab_clu_onl_met(obj)
            rec_fil = matfile(obj.fil_pat_rec);
            x_cel = rec_fil.x_cel;
            y_cel = rec_fil.y_cel;
            z_cel = rec_fil.z_cel;
            clu_cel_k = rec_fil.clu_cel_k;
            k = 4;
            con_fil = matfile('\\home.ansatt.ntnu.no\kadiram\Documents\MATLAB\con_esp.mat');
            piv_col_pcx = con_fil.piv_col_pcx;
            val_col_pcx = piv_col_pcx.fou.ong_gab;
            log_cel = rec_fil.log_cel;
            h_fig = plo_gab_clu_onl(x_cel, y_cel, z_cel, clu_cel_k.ong(:, k), val_col_pcx, ...
                log_cel.gab.all);
        end% ongoing
        function h_fig = plo_z_sco_cel_met(obj)
            rec_fil = matfile(obj.fil_pat_rec);
            z_sco_cel = rec_fil.z_sco_cel;
            h_fig = plo_z_sco_cel(z_sco_cel, obj.ani);
        end
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% gli
        function h_fig = plo_tai_dff_met(obj, fie)
            rec_fil = matfile(obj.fil_pat_rec);
            tai_ang_fra = rec_fil.tai_ang_fra;
            piv_fra = rec_fil.piv_fra;
            %bou_ons_bou = rec_fil.bou_ons_bou;%editor
            %h_fig = plo_tai_dff(tai_ang_fra.dow.raw, piv_fra.(fie), bou_ons_bou.all);
            %h_fig = plo_tai_dff(tai_ang_fra.dow.raw, piv_fra.(fie), bou_ons_bou.non_hig);
            acb_ons_bou = rec_fil.acb_ons_bou;
            %h_fig = plo_tai_dff(tai_ang_fra.dow.raw, piv_fra.(fie), acb_ons_bou.all);
            dur_acb_bou = rec_fil.dur_acb_bou;
            acb_off_bou = rec_fil.acb_off_bou;
            h_fig = plo_tai_dff(tai_ang_fra.dow.raw, piv_fra.(fie), acb_ons_bou.all, dur_acb_bou.all...
                , acb_off_bou.all);
        end
        function h_fig = plo_bou_sig_met(obj, fie)
            rec_fil = matfile(obj.fil_pat_rec);
            dff_fra_bou = rec_fil.dff_fra_bou;
            % dur_acb_bou = rec_fil.dur_acb_bou;
            % h_fig = plo_bou_sig(dff_fra_bou.(fie), dur_acb_bou.non);
            dur_acb_bou = rec_fil.dur_pcb_bou;
            h_fig = plo_bou_sig(dff_fra_bou.(fie), dur_acb_bou.non);
        end
        function h_fig = plo_tri_sig_met(obj, fie)
            rec_fil = matfile(obj.fil_pat_rec);
            dff_fra_tri = rec_fil.dff_fra_tri;
            h_fig = plo_tri_sig(dff_fra_tri.(fie));
        end
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% spo
        function h_fig = plo_spo_met(obj)
            rec_fil = matfile(obj.fil_pat_rec);
            clu_cel_k = rec_fil.clu_cel_k;
            k = 4;
            dff_fra_cel = rec_fil.dff_fra_cel;
            log_fra = rec_fil.log_fra;
            mrp = rec_fil.mrp;
            h_fig = plo_spo(clu_cel_k.ong(:, k), dff_fra_cel(log_fra.ong, :), mrp);
        end
        function h_fig = plo_tai_qui_met(obj)
            rec_fil = matfile(obj.fil_pat_rec);
            clu_cel = rec_fil.clu_cel;
            dff_fra_cel = rec_fil.dff_fra_cel;
            log_fra = rec_fil.log_fra;
            mrp = rec_fil.mrp;
            tim_bin = rec_fil.tim_bin;
            rat_bin_par = rec_fil.rat_bin_par;
            log_tai_bin = rec_fil.log_tai_bin;
            h_fig = plo_tai_qui(clu_cel.tai_qui, dff_fra_cel(log_fra.tai_qui, :), 2*mrp, tim_bin...
                (log_tai_bin), rat_bin_par(log_tai_bin));
        end
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% figures
        function sav_fig_sti_cel_cor(obj) % save both
            sav_fig_sti_cel(obj)
            sav_fig_cor(obj)
        end
        function sav_fig_lst(obj)
            plo_lst_met(obj)
            export_fig(char(obj.fil_pat_fig_lst))
        end
        function sav_fig_neu_bou(obj)
            plo_bou_met(obj)
            export_fig(char(obj.fil_pat_fig_neu_bou))
        end
        function sav_fig_sum(obj) % sumbre
            plo_sum_hab_met(obj)
            export_fig(char(obj.fil_pat_fig_sum_hab))
            plo_sum_tel_met(obj)
            export_fig(char(obj.fil_pat_fig_sum_tel))
        end
        function sav_fig_sti_cel_tri(obj)
            plo_sti_cel_tri(obj)
            exp_sti_cel_tri(obj)
        end
        function sav_fig_cor_sta(obj)
            plo_cor_met(obj)
            export_fig(char(obj.fil_pat_fig_cor_sta))
        end
        %
        function sav_fig_res_map(obj)
            h_fig = plo_res_map_met(obj);
            fil_pat = char(obj.fil_pat_fig_res_map);
            exp_fig(h_fig, fil_pat)
        end
        function sav_fig_ras_map(obj)
            h_fig = plo_ras_map_met(obj);
            fil_pat = char(obj.fil_pat_fig_ras_map);
            exp_fig(h_fig, fil_pat)
        end
        function sav_fig_ras_map_sub(obj)
            h_fig = plo_ras_map_sub_met(obj);
            fil_pat = char(obj.fil_pat_fig_ras_map_sub);
            exp_fig(h_fig, fil_pat)
        end
        function sav_fig_clu_map(obj)
            h_fig = plo_clu_map_met(obj);
            fil_pat = char(obj.fil_pat_fig_clu_map);
            exp_fig(h_fig, fil_pat)
        end
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% axo cel
        function sav_fig_neu_axo(obj)
            h_fig = plo_neu_axo_met(obj);
            fil_pat = char(obj.fil_pat_fig_neu_axo);
            exp_fig(h_fig, fil_pat)
        end
        function sav_fig_blu(obj)
            h_fig = plo_blu_met(obj);
            fil_pat = char(obj.fil_pat_fig_blu);
            exp_fig(h_fig, fil_pat)
        end
        function sav_fig_z_sco(obj)
            h_fig = plo_z_sco_met(obj);
            fil_pat = char(obj.fil_pat_fig_z_sco);
            exp_fig(h_fig, fil_pat)
        end
        function sav_fig_roi(obj)
            h_fig = plo_roi_met(obj);
            fil_pat = char(obj.fil_pat_fig_roi);
            exp_fig(h_fig, fil_pat)
        end
        function sav_fig_axo_cel_sin(obj)
            h_fig = plo_axo_cel_sin_met(obj);
            exp_fig(h_fig, [char(obj.pro_dir) '\axo_cel_sin.png'])
        end
        function sav_fig_ses(obj)
            h_fig = plo_ses_met(obj);
            fil_pat = char(obj.fil_pat_fig_ses);
            exp_fig(h_fig, fil_pat)
        end
        function sav_fig_cor_map(obj)
            h_fig = plo_cor_map_met(obj);
            fil_pat = char(obj.fil_pat_fig_cor_map);
            exp_fig(h_fig, fil_pat)
        end
        function sav_fig_icx_res(obj)
            h_fig = plo_icx_res_met(obj);
            fil_pat = char(obj.fil_pat_fig_icx_res);
            exp_fig(h_fig, fil_pat)
        end
        function sav_fig_cor_map_exc_inh(obj)
            h_fig = plo_cor_map_exc_inh_met(obj, 'tai');
            exp_fig(h_fig, [char(obj.pro_dir) '\cor_map_exc_inh_tai.png'])
            %
            h_fig = plo_cor_map_exc_inh_met(obj, 'spo');
            exp_fig(h_fig, [char(obj.pro_dir) '\cor_map_exc_inh_spo.png'])
        end
        function sav_fig_cor_map_ove_tap(obj)
            h_fig = plo_cor_map_ove_met(obj, 'tap');
            exp_fig(h_fig, [char(obj.pro_dir) '\cor_map_ove_tap.png'])
        end
        function sav_fig_cor_map_ove(obj)
            % h_fig = plo_cor_map_ove_met(obj, 'tai');
            % exp_fig(h_fig, [char(obj.pro_dir) '\cor_map_exc_inh_tai.png'])
            h_fig = plo_cor_map_ove_met(obj, 'bou_non');
            exp_fig(h_fig, [char(obj.pro_dir) '\cor_map_exc_inh_bou_non.png'])
        end
        function sav_fig_cor_map_ove_spo(obj)
            % h_fig = plo_cor_map_ove_met(obj, 'spo');
            % exp_fig(h_fig, [char(obj.pro_dir) '\cor_map_exc_inh_spo.png'])
            h_fig = plo_cor_map_ove_met(obj, 'spo_bou_non');
            exp_fig(h_fig, [char(obj.pro_dir) '\cor_map_exc_inh_spo_bou_non.png'])
        end
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% axo onl
        function sav_fig_axo_sin(obj)
            h_fig = plo_axo_sin_met(obj);
            exp_fig(h_fig, [char(obj.pro_dir) '\axo_sin.png'])
        end
        function sav_fig_axo_sin_pix(obj)
            h_fig = plo_axo_sin_pix_met(obj);
            exp_fig(h_fig, [char(obj.pro_dir) '\axo_sin_pix.png'])
        end
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% cel onl
        function sav_fig_cel_onl(obj)
            sav_fig_roi(obj)
            sav_fig_pix_res(obj)
        end
        function sav_fig_cel_onl_neu_beh(obj)
            sav_fig_bou_ave_pix(obj)
            sav_fig_clu_map_pix(obj)
        end
        function sav_fig_neu_sin(obj)
            h_fig = plo_neu_sin_met(obj);
            %exp_fig(h_fig, [char(obj.pro_dir) '\neu_sin.png'])
            exp_fig(h_fig, [char(obj.pro_dir_tem) '\neu_sin.png'])
        end
        function sav_fig_clu_map_ani(obj)
            h_fig = plo_clu_map_ani_met(obj);
            exp_fig(h_fig, [char(obj.pro_dir) '\clu_map_ani.png'])
        end
        function sav_fig_ong_cel(obj)
            k = 4;
            h_fig = plo_gab_ong_met(obj, k);
            %exp_fig(h_fig, [char(obj.pro_dir) '\cel_ong.png'])
            exp_fig(h_fig, [char(obj.pro_dir) '\cel_ong_man.png'])
            
            h_fig = plo_cel_clu_map_ani_mic_met(obj);
            % exp_fig(h_fig, [char(obj.pro_dir) '\cel_clu_map_ani_mic.png'])
            exp_fig(h_fig, [char(obj.pro_dir) '\cel_clu_map_ani_mic_man.png'])
        end
        function sav_fig_tai_dff_drn(obj)
            h_fig = plo_tai_dff_drn_met(obj);
            exp_fig(h_fig, [char(obj.pro_dir) '\tai_dff_drn.png'])
        end
        function sav_fig_vis_tai(obj)
            h_fig = plo_vis_tai_met(obj);
            exp_fig(h_fig, [char(obj.pro_dir) '\vis_tai.png'])
        end
        function sav_fig_roi_ove(obj)
            h_fig = plo_roi_ove_met(obj);
            exp_fig(h_fig, [char(obj.pro_dir) '\roi_ove.png'])
        end
        function sav_fig_vis_reg(obj)
            h_fig = plo_vis_reg_met(obj);
            exp_fig(h_fig, [char(obj.pro_dir) '\vis_reg.png'])
        end
        function sav_fig_roi_con(obj)
            h_fig = plo_roi_con_met(obj);
            exp_fig(h_fig, [char(obj.pro_dir) '\roi_con.png'])
        end
        function sav_fig_roi_man(obj)
            h_fig = plo_roi_man_met(obj);
            exp_fig(h_fig, [char(obj.pro_dir) '\roi_man.png'])
        end
        function sav_fig_roi_con_sin(obj)
            h_fig = plo_roi_con_sin_met(obj);
            exp_fig(h_fig, [char(obj.pro_dir) '\roi_con_sin.png'])
        end
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% gab
        function sav_fig_gab(obj)
            h_fig = plo_gab_met(obj);
            exp_fig(h_fig, [char(obj.pro_dir) '\gab' '.png'])
        end
        function sav_fig_gab_clu(obj)
            h_fig = plo_gab_clu_met(obj);
            exp_fig(h_fig, [char(obj.pro_dir) '\gab_clu_.png'])
        end
        function sav_fig_gab_clu_onl(obj)
            h_fig = plo_gab_clu_onl_met(obj);
            exp_fig(h_fig, [char(obj.pro_dir) '\gab_clu_onl.png'])
        end
        function sav_fig_gab_ong(obj)
            % both
            %k = 3; changed to 5 for cluster selectivity
            k = 4;
            h_fig = plo_gab_ong_met(obj, k);
            exp_fig(h_fig, [char(obj.pro_dir) '\gab_ong_' sprintf('%d', k) '.png'])
            h_fig = plo_gab_clu_map_ani_mic_met(obj, k);
            exp_fig(h_fig, [char(obj.pro_dir) '\gab_clu_map_ani_mic_' sprintf('%d', k) '.png'])
        end
        function sav_fig_z_sco_cel(obj)
            h_fig = plo_z_sco_cel_met(obj);
            exp_fig(h_fig, [char(obj.pro_dir) '\z_sco_cel.png'])
        end
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% gli
        function sav_fig_tai_dff(obj)
            % fie = 'all';
            % h_fig = plo_tai_dff_met(obj, fie);
            % exp_fig(h_fig, [char(obj.pro_dir) '\tai_dff_' fie '.png'])
            % fie = 'dor';
            % h_fig = plo_tai_dff_met(obj, fie);
            % exp_fig(h_fig, [char(obj.pro_dir) '\tai_dff_' fie '.png'])
            % fie = 'ven_exc';
            % h_fig = plo_tai_dff_met(obj, fie);
            % exp_fig(h_fig, [char(obj.pro_dir) '\tai_dff_' fie '.png'])

            % fie = 'nhe_all';
            % h_fig = plo_tai_dff_met(obj, fie);
            % exp_fig(h_fig, [char(obj.pro_dir) '\tai_dff_' fie '.png'])
            % fie = 'nhe_dor';
            % h_fig = plo_tai_dff_met(obj, fie);
            % exp_fig(h_fig, [char(obj.pro_dir) '\tai_dff_' fie '.png'])
            % fie = 'nhe_ven_exc';
            % h_fig = plo_tai_dff_met(obj, fie);
            % exp_fig(h_fig, [char(obj.pro_dir) '\tai_dff_' fie '.png'])

            % fie = 'acb_all_all';
            % h_fig = plo_tai_dff_met(obj, fie);
            % exp_fig(h_fig, [char(obj.pro_dir) '\tai_dff_' fie '.png'])
            % h_fig = plo_bou_sig_met(obj, fie);
            % exp_fig(h_fig, [char(obj.pro_dir) '\bou_sig_' fie '.png'])
            % fie = 'acb_all_dor';
            % h_fig = plo_tai_dff_met(obj, fie);
            % exp_fig(h_fig, [char(obj.pro_dir) '\tai_dff_' fie '.png'])
            % h_fig = plo_bou_sig_met(obj, fie);
            % exp_fig(h_fig, [char(obj.pro_dir) '\bou_sig_' fie '.png'])
            % fie = 'acb_all_ven_exc';
            % h_fig = plo_tai_dff_met(obj, fie);
            % exp_fig(h_fig, [char(obj.pro_dir) '\tai_dff_' fie '.png'])
            % h_fig = plo_bou_sig_met(obj, fie);
            % exp_fig(h_fig, [char(obj.pro_dir) '\bou_sig_' fie '.png'])
            % 
            % fie = 'acb_exc_all';
            % h_fig = plo_tai_dff_met(obj, fie);
            % exp_fig(h_fig, [char(obj.pro_dir) '\tai_dff_' fie '.png'])
            % h_fig = plo_bou_sig_met(obj, fie);
            % exp_fig(h_fig, [char(obj.pro_dir) '\bou_sig_' fie '.png'])
            % fie = 'acb_exc_dor';
            % h_fig = plo_tai_dff_met(obj, fie);
            % exp_fig(h_fig, [char(obj.pro_dir) '\tai_dff_' fie '.png'])
            % h_fig = plo_bou_sig_met(obj, fie);
            % exp_fig(h_fig, [char(obj.pro_dir) '\bou_sig_' fie '.png'])
            fie = 'acb_exc_ven_exc';
            h_fig = plo_tai_dff_met(obj, fie);
            exp_fig(h_fig, [char(obj.pro_dir) '\tai_dff_' fie '.png'])
            h_fig = plo_bou_sig_met(obj, fie);
            exp_fig(h_fig, [char(obj.pro_dir) '\bou_sig_' fie '.png'])

            % fie = 'acb_inh_all';
            % h_fig = plo_tai_dff_met(obj, fie);
            % exp_fig(h_fig, [char(obj.pro_dir) '\tai_dff_' fie '.png'])
            % h_fig = plo_bou_sig_met(obj, fie);
            % exp_fig(h_fig, [char(obj.pro_dir) '\bou_sig_' fie '.png'])
            % fie = 'acb_inh_dor';
            % h_fig = plo_tai_dff_met(obj, fie);
            % exp_fig(h_fig, [char(obj.pro_dir) '\tai_dff_' fie '.png'])
            % h_fig = plo_bou_sig_met(obj, fie);
            % exp_fig(h_fig, [char(obj.pro_dir) '\bou_sig_' fie '.png'])
            % fie = 'acb_inh_ven_exc';
            % h_fig = plo_tai_dff_met(obj, fie);
            % exp_fig(h_fig, [char(obj.pro_dir) '\tai_dff_' fie '.png'])
            % h_fig = plo_bou_sig_met(obj, fie);
            % exp_fig(h_fig, [char(obj.pro_dir) '\bou_sig_' fie '.png'])
        end
        function sav_fig_bou_sig(obj)
            fie = 'pcb_exc_ven_exc';
            h_fig = plo_bou_sig_met(obj, fie);
            exp_fig(h_fig, [char(obj.pro_dir) '\bou_sig_' fie '.png'])
        end
        function sav_fig_tri_sig(obj)
            % fie = 'all';
            % h_fig = plo_tri_sig_met(obj, fie);
            % exp_fig(h_fig, [char(obj.pro_dir) '\tri_sig_' fie '.png'])
            % fie = 'dor';
            % h_fig = plo_tri_sig_met(obj, fie);
            % exp_fig(h_fig, [char(obj.pro_dir) '\tri_sig_' fie '.png'])
            % fie = 'ven_exc';
            % h_fig = plo_tri_sig_met(obj, fie);
            % exp_fig(h_fig, [char(obj.pro_dir) '\tri_sig_' fie '.png'])

            fie = 'lig';
            h_fig = plo_tri_sig_met(obj, fie);
            exp_fig(h_fig, [char(obj.pro_dir) '\tri_sig_' fie '.png'])
            fie = 'tap';
            h_fig = plo_tri_sig_met(obj, fie);
            exp_fig(h_fig, [char(obj.pro_dir) '\tri_sig_' fie '.png'])
        end
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% spo
        function sav_fig_spo(obj)
            h_fig = plo_spo_met(obj);
            exp_fig(h_fig, [char(obj.pro_dir) '\spo.png'])
            h_fig = plo_cel_clu_map_ani_mic_met(obj);
            exp_fig(h_fig, [char(obj.pro_dir) '\cel_clu_map_ani_mic.png'])
        end
        function sav_fig_tai_qui(obj)
            h_fig = plo_tai_qui_met(obj);
            exp_fig(h_fig, [char(obj.pro_dir) '\tai_qui.png'])
        end
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% general

        % videos
        function sav_vid_sim_sti(obj, sti_num)
            con_fil = matfile('\\home.ansatt.ntnu.no\kadiram\Documents\MATLAB\con_esp.mat');
            fra_rat = con_fil.fra_rat;
            fra_rat = fra_rat.cal.eig;
            
            %ima_seq = ext_sim_vid_sti(obj, sti_num);
            piv_row_col_fra = gen_piv_row_col_fra_met(obj, sti_num);
            [n_row, n_col, n_fra] = size(piv_row_col_fra);
            piv_row_col_xxx_fra = reshape(piv_row_col_fra, n_row, n_col, 1, n_fra);
            v = VideoWriter(obj.fil_pat_vid, 'MPEG-4');
            
            %v.FrameRate = round(fra_rat*5);
            v.FrameRate = round(fra_rat);
            
            piv_row_col_xxx_fra = repmat(piv_row_col_xxx_fra, 1, 1, 3, 1);

            open(v);
            writeVideo(v, piv_row_col_xxx_fra);
            close(v);
        end
        function piv_row_col_fra = gen_piv_row_col_fra_met(obj, sti_num)
            rec_fil = matfile(obj.fil_pat_rec);
            dff_fra_cel = rec_fil.dff_fra_cel;
            log_cel_pla = rec_fil.log_cel_pla;
            fix_pat_ima_cal_pla = obj.fil_pat_ima_cal_pla;
            load(obj.fil_pat_exp, 'sti_ons')
            sti_ons = sti_ons(sti_num);
            pla = 3;

            low_in_ani = rec_fil.low_in_ani;
            high_in_ani = rec_fil.high_in_ani;

            [piv_row_col_fra, ~, ~, ~, ~] = gen_piv_row_col_fra(...
                obj.fil_pat_ima_fis, fix_pat_ima_cal_pla{pla}, sti_ons, dff_fra_cel, log_cel_pla, ...
                low_in_ani.rel, high_in_ani.rel);
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            %save(obj.fil_pat_rec, 'dfv_fra_cel', 'clv_cel', 'lov_fra', 'lot_fra', '-append')
        end
        function int_row_col_pag = ext_sim_vid_sti(obj, sti_num)
            dev = 5;
            mul_fac = 1;
            dev = mul_fac*dev;
            load(obj.fil_pat_exp, 'sti_ons')
            sti_ons = sti_ons(sti_num);
            n_fra_sti = 4;
            mul_fac_sti = 5;
            int_row_col_pag = ext_sim_vid(obj.fil_pat_ima_fis, obj.fil_pat_rec, obj.fil_pat_ima_cal, ...
                sti_ons, dev, n_fra_sti*mul_fac_sti);
        end
        function sav_vid_ani(obj, sti_num)
            fix_pat_ima_cal_pla = obj.fil_pat_ima_cal_pla;
            load(obj.fil_pat_exp, 'sti_ons')
            sti_ons = sti_ons(sti_num);
            pla = 3;
            rec_fil = matfile(obj.fil_pat_rec);
            dff_fra_cel = rec_fil.dff_fra_cel;
            log_cel_pla = rec_fil.log_cel_pla;
            low_in_ani = rec_fil.low_in_ani;
            high_in_ani = rec_fil.high_in_ani;
            x_off_fra = rec_fil.x_off_fra;
            y_off_fra = rec_fil.y_off_fra;
            tim_syn_fra = rec_fil.tim_syn_fra;
            tai_ang_fra = rec_fil.tai_ang_uni;
            
            % lot_fra = rec_fil.lot_fra;
            % lov_fra = rec_fil.lov_fra;
            % tai_ang_fra = tai_ang_fra(lot_fra);
            % piv_row_col_pcx_fra = gen_piv_row_col_pcx_fra(obj.fil_pat_ima_fis, ...
            %     fix_pat_ima_cal_pla{pla}, sti_ons, dff_fra_cel, log_cel_pla, low_in_ani.rel, ...
            %     high_in_ani.rel, x_off_fra(lov_fra), y_off_fra(lov_fra), tai_ang_fra, tim_syn_fra);

            piv_row_col_pcx_fra = gen_piv_row_col_pcx_fra(obj.fil_pat_ima_fis, ...
                fix_pat_ima_cal_pla{pla}, sti_ons, dff_fra_cel, log_cel_pla, low_in_ani.rel, ...
                high_in_ani.rel, x_off_fra, y_off_fra, tai_ang_fra, tim_syn_fra);
            
            fil_pat_tif = strcat(obj.pro_dir, "\ani.tif");
            % Suppose your array is called img_seq (HxWx3xN)
            save_rgb_sequence_as_tif(piv_row_col_pcx_fra, fil_pat_tif);

            % con_fil = matfile('\\home.ansatt.ntnu.no\kadiram\Documents\MATLAB\con_esp.mat');
            % fra_rat = con_fil.fra_rat;
            % fra_rat = fra_rat.cal.eig;
            % fil_pat_via = strcat(obj.pro_dir, "\ani.mp4");
            % v = VideoWriter(fil_pat_via, 'MPEG-4');
            % %v.FrameRate = round(fra_rat*5);
            % v.FrameRate = round(fra_rat);
            % open(v);
            % writeVideo(v, piv_row_col_pcx_fra);
            % close(v);
        end
        function sav_vid_tai(obj, sti_num)
            load(obj.fil_pat_exp, 'sti_ons')
            sti_ons = sti_ons(sti_num);
            rec_fil = matfile(obj.fil_pat_rec);
            low_in_ani = rec_fil.low_in_ani;
            high_in_ani = rec_fil.high_in_ani;
            tim_syn_fra = rec_fil.tim_syn_fra;

            fix_pat_ima_cal_pla = obj.fil_pat_ima_cal_pla;
            pla = 3;

            piv_row_col_fra = tai_piv_row_col_fra(obj.fil_pat_ima_fis, sti_ons, low_in_ani.rel, ...
                high_in_ani.rel, tim_syn_fra, fix_pat_ima_cal_pla{pla});
            fil_pat_tif = strcat(obj.pro_dir, "\tai.tif");
            % Suppose your array is called img_seq (HxWx3xN)
            save_grayscale_sequence_as_tif(piv_row_col_fra, fil_pat_tif);
        end
        % analyses
        function [fra_tim_bro, tai_ang_bro] = ext_tai_dat_bro_met(obj)
            [fra_tim_bro, tai_ang_bro] = ext_tai_dat_bro(obj.fil_pat_tai, obj.fil_pat_rec, obj.fil_pat_ima_fis, obj.fil_pat_exp);
        end
        % general
        function isx_var(obj, var_nam)
            rec_fil = matfile(obj.fil_pat_rec);
            var = isprop(rec_fil, var_nam);
            disp(var)
        end
        function sav_var = ext_var_met(obj, var_nam)
            fie = 'fil_pat_rec';
            sav_var = ext_var(obj, fie, var_nam);
        end
        function ren_var_met(obj, cur_var_nam, new_var_nam)
            rec_fil = matfile(obj.fil_pat_rec, 'Writable', true);
            rec_fil.(new_var_nam) = rec_fil.(cur_var_nam);
            RemoveVariableFromMatFile(char(obj.fil_pat_rec), cur_var_nam)
        end
        %
        function add_var_ext_met(obj, var_ext, var_new)
            add_var_ext(obj.fil_pat_rec, var_ext, var_new);
        end
        %%%%%%%%%%%%
        function sav_dff(obj)
            rec_fil = matfile(obj.fil_pat_rec);
            n_fra_sel = 6000;
            n_cel_sel = 100;
            dF_traces = rec_fil.dff_sli_fra_cel(1:n_fra_sel, 1:n_cel_sel)'/100;
            save(obj.fil_pat_dff, 'dF_traces')
        end
        function che(obj)
            rec_fil = matfile(obj.fil_pat_rec);
            n_bou = rec_fil.n_bou;
            bou_off_bou = rec_fil.bou_off_bou;
            disp([n_bou.vib length(bou_off_bou.vib)]);
        end
    end
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% behavioral
function [man_sec, ini_del] = ext_syn_par(fil_pat_ima_fis, fil_pat_exp)% based on synch onsets !
exp_fil = matfile(fil_pat_exp);
syn_rel_tim = exp_fil.syn_rel_tim;
sta_tim = exp_fil.sta_tim;
fra_rat = exp_fil.fra_rat;
if isprop(exp_fil, 'end_tim')
    end_tim = exp_fil.end_tim;
else
    end_tim = exp_fil.dur_spo;
end
[fra_tim, n_fra] = ext_tem_fra_dat(fil_pat_ima_fis);
loa = load(fil_pat_ima_fis, 'data');
fra = loa.data;
clear loa
%
ave_int_fra = reshape(mean(mean(fra)), [n_fra 1]);
syn_ons = nan(2, 1);
% one
ave_int_fra_one = ave_int_fra(1:fra_rat*sta_tim);
mid_ave_int_fra = mean([min(ave_int_fra_one) max(ave_int_fra_one)]);
ind_one = find(ave_int_fra_one < mid_ave_int_fra, 1);
syn_ons(1) = fra_tim(ind_one);
% two
fra_num_sta_two = round(n_fra*(9/10));
ave_int_fra_two = ave_int_fra(fra_num_sta_two:end);
mid_ave_int_fra = mean([min(ave_int_fra_two) median(ave_int_fra_two)]);
ind_two = find(ave_int_fra_two < mid_ave_int_fra, 1);
syn_ons(2) = fra_tim(fra_num_sta_two + ind_two - 1);
% determine the relationship between the "second"s
rea_dur = end_tim;
man_dur = diff(syn_ons);
man_sec = rea_dur/man_dur;

% determine the initial delay - 30 - ... sec
ini_del = syn_rel_tim - syn_ons(1)*man_sec;
end

function [man_sec, ini_del] = ext_syn_par_axo(fil_pat_ima_fis, fil_pat_exp)% synch onsets !!!
load(fil_pat_exp, 'syn_rel_tim', 'end_tim', 'fra_rat')
[fra_tim, n_fra] = ext_tem_fra_dat(fil_pat_ima_fis);
loa = load(fil_pat_ima_fis, 'data');
fra = loa.data;
clear loa
%
ave_int_fra = reshape(mean(mean(fra)), [n_fra 1]);
syn_ons = nan(2, 1);
% one
dur_syn = 1;
fra_num_sta_one = find(fra_tim > syn_rel_tim/2, 1);
log_fra_one = fra_tim > syn_rel_tim/2 & fra_tim < syn_rel_tim + dur_syn;
ave_int_fra_one = ave_int_fra(log_fra_one);
log_fra_pre = fra_tim > 15 & fra_tim < 20;
ave_int_fra_pre = ave_int_fra(log_fra_pre);
mid_ave_int_fra = mean([min(ave_int_fra_one) max(ave_int_fra_pre)]);
ind_one = find(ave_int_fra_one < mid_ave_int_fra, 1);
syn_ons(1) = fra_tim(fra_num_sta_one + ind_one - 1);
% two
fra_num_sta_two = round(n_fra*(7/10));
ave_int_fra_two = ave_int_fra(fra_num_sta_two:end);
ave_int_fra_pos = ave_int_fra(fra_num_sta_two:fra_num_sta_two + fra_rat*5);
mid_ave_int_fra = mean([min(ave_int_fra_two) max(ave_int_fra_pos)]);
ind_two = find(ave_int_fra_two < mid_ave_int_fra, 1);
syn_ons(2) = fra_tim(fra_num_sta_two + ind_two - 1);
% determine the relationship between the "second"s
rea_dur = end_tim;
man_dur = diff(syn_ons);
man_sec = rea_dur/man_dur;

% determine the initial delay - 30 - ... sec
ini_del = syn_rel_tim - syn_ons(1)*man_sec;
end

function fra = ext_fra(fra_tim_vid, tim)
[~, fra] = fin_clo_val(fra_tim_vid, tim);
end

function sho_fra_tim(fra_tim_vid, fil_pat_ima, tim)
[~, fra_num] = fin_clo_val(fra_tim_vid, tim);
obj = matfile(fil_pat_ima);
fra_tim = obj.data(:, :, fra_num);
fig
imshow(fra_tim)
end

function [ima_cli, tim_fra] = ext_ima_cli(fra_tim, ima, sti_ons)
%dur = 7;
dur = 11;
fra_ind = fra_tim > sti_ons - dur & fra_tim < sti_ons + dur;
ima_cli = ima(:, :, fra_ind);
%
tim_fra = fra_tim(fra_ind);
end

% tail
function [tai_ang, tai_ang_spe, tai_ang_uni, fra_tim_uni, vir_spe_uni, fra_tim, ...
    tai_ang_fre, ind_bor_poi, vir_spe, fra_ind, fra_rat_get] = ext_tai_dat_seg(fil_pat_tai, ...
    fil_pat_rec, fil_pat_exp, fil_pat_ima_fis, seg_len, man_sec, ini_del, vir_spe_thr, vir_spe_new, ...
    fis_spe_pro)
% envelope, smooth, rectify
[fra_ind, fra_rat_get, fra_tim] = ext_tem_fra_dat_cut(fil_pat_ima_fis, fil_pat_exp, ...
    man_sec, ini_del);
exp_fil = matfile(fil_pat_exp);
sta_tim = exp_fil.sta_tim;
fra_rat = exp_fil.fra_rat;
if isprop(exp_fil, 'end_tim')
    end_tim = exp_fil.end_tim;
else
    end_tim = exp_fil.dur_spo;
end
n_fra = length(fra_ind);
%
load(fil_pat_tai, 'fish_angle0', 'fish_angle1', 'fish_speed')
tai_ang_one = fish_angle0(1:n_fra);
tai_ang_two = fish_angle1(1:n_fra);
tai_ang_sum = tai_ang_one + tai_ang_two;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[fra_ind_bro, fra_tim_bro] = ext_tem_fra_dat_cut_bro(fil_pat_ima_fis, fil_pat_exp, fil_pat_rec); %synch
tai_ang_bro = tai_ang_sum(fra_ind_bro); % synch
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
tai_ang_fre = nan;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
tai_ang_raw = tai_ang_sum(fra_ind);
% remove baseline dynamically
[tai_ang, ind_bor_poi] = rem_bas_dyn(fra_rat, tai_ang_raw, seg_len);
tai_ang = smo(tai_ang);
% speed
ord = 1;
tai_ang_spe = dif_sig(tai_ang_raw, ord)./dif_sig(fra_tim, ord);
tai_ang_spe = abs(tai_ang_spe);
%%%
vir_spe_raw = fish_speed(1:n_fra);
vir_spe_bro = vir_spe_raw(fra_ind_bro);
vir_spe = vir_spe_raw(fra_ind);
if vir_spe_new% only for esp273 by 11.06.25
    vir_spe_bro = rem_bas_dyn(fra_rat, vir_spe_bro, seg_len);
    vir_spe_bro = per_hal_wav_rec(vir_spe_bro);
    vir_spe = rem_bas_dyn(fra_rat, vir_spe, seg_len);
elseif fis_spe_pro
    vir_spe_bro = abs(dif_sig(tai_ang_bro, ord)./dif_sig(fra_tim_bro, ord));
    vir_spe = tai_ang_spe;
end
vir_spe_uni = smo_uni(fra_tim_bro, vir_spe_bro, sta_tim, end_tim, fra_rat);
vir_spe_uni = per_hal_wav_rec(vir_spe_uni);
%%%%%%%%%%%%%%%%%%%%%%%%%%%% remove baseline dynamically
tai_ang_bro = rem_bas_dyn(fra_rat, tai_ang_bro, seg_len);
env = vir_spe_bro > vir_spe_thr;
tai_ang_bro = tai_ang_bro.*env;
[tai_ang_uni, fra_tim_uni] = smo_uni(fra_tim_bro, tai_ang_bro, sta_tim, end_tim, fra_rat);%120 fps
tai_ang_uni = per_ful_wav_rec(tai_ang_uni);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
env = vir_spe > vir_spe_thr;
tai_ang = tai_ang.*env;% used for peak detection, rate
end

function tai_ang = cal_dow(fil_pat_tai, fil_pat_rec, fil_pat_exp, fil_pat_ima_fis, seg_len, ...
    man_sec, ini_del, fis_spe_pro)% for axo !!!!
% envelope, smooth, rectify
[fra_ind, ~, ~] = ext_tem_fra_dat_cut(fil_pat_ima_fis, fil_pat_exp, man_sec, ini_del);
load(fil_pat_exp, 'fra_rat')
n_fra = length(fra_ind);
%
load(fil_pat_tai, 'fish_angle0', 'fish_angle1', 'fish_speed')
tai_ang_one = fish_angle0(1:n_fra);
tai_ang_two = fish_angle1(1:n_fra);
tai_ang_sum = tai_ang_one + tai_ang_two;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[fra_ind_bro, fra_tim_bro] = ext_tem_fra_dat_cut_bro(fil_pat_ima_fis, fil_pat_exp, fil_pat_rec); %synch
tai_ang_bro = tai_ang_sum(fra_ind_bro); % synch
% speed
vir_spe_raw = fish_speed(1:n_fra);
vir_spe_bro = vir_spe_raw(fra_ind_bro);
ord = 1;
if fis_spe_pro
    vir_spe_bro = abs(dif_sig(tai_ang_bro, ord)./dif_sig(fra_tim_bro, ord));
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%
thr = 0.1;
% remove baseline dynamically
tai_ang_bro = rem_bas_dyn(fra_rat, tai_ang_bro, seg_len);
env = vir_spe_bro > thr;
tai_ang_bro = tai_ang_bro.*env;
con_fil = matfile('\\home.ansatt.ntnu.no\kadiram\Documents\MATLAB\con_esp.mat');
tim_fra = con_fil.tim_fra;
n_sam = length(tai_ang_bro);
wei = ones(n_sam, 1);
tai_ang = b_spline_smooth(fra_tim_bro, tai_ang_bro, tim_fra.cal.eig.ses.axo, wei, 2, 0);
tai_ang = per_ful_wav_rec(tai_ang);
end

function [fra_ind, fra_rat, tim_fra, tim_syn_fra] = ext_tem_fra_dat_cut(fil_pat_ima_fis, ...
    fil_pat_exp, man_sec, ini_del)
tim_raw_fra = ext_tem_fra_dat(fil_pat_ima_fis);
% synch
tim_syn_fra = syn(tim_raw_fra, man_sec, ini_del);
% cutting
exp_fil = matfile(fil_pat_exp);
sta_tim = exp_fil.sta_tim;
if isprop(exp_fil, 'end_tim')
    end_tim = exp_fil.end_tim;
else
    end_tim = exp_fil.dur_spo;
end
fra_ind = tim_syn_fra > sta_tim & tim_syn_fra <= end_tim;
tim_fra = tim_syn_fra(fra_ind);
%
n_fra = length(tim_fra);
dur = tim_fra(end) - tim_fra(1);
fra_rat = n_fra/dur;
end

function tim_fra = cal_tim_fra(fil_pat_ima_fis, man_sec, ini_del)
tim_fra = ext_tem_fra_dat(fil_pat_ima_fis);
% synch
tim_fra = syn(tim_fra, man_sec, ini_del);
end

function [tim_fra, n_fra, fra_rat] = ext_tem_fra_dat(fil_pat_ima_fis)
load(fil_pat_ima_fis, 'timestamps', 'time')
timestamps = double(timestamps)'/1000;
fra_per = timestamps(3) - timestamps(2);
tim_fra = timestamps - timestamps(1) + fra_per;
n_fra = length(tim_fra);
fra_rat = n_fra/double(time);
end

function [fra_tim_bro, tai_ang_bro] = ext_tai_dat_bro(fil_pat_tai, fil_pat_rec, ...
    fil_pat_ima_fis, fil_pat_exp)
load(fil_pat_rec, 'fra_ind')
n_fra = length(fra_ind);
load(fil_pat_tai, 'fish_angle0', 'fish_angle1')
tai_ang_one = fish_angle0(1:n_fra);
tai_ang_two = fish_angle1(1:n_fra);
tai_ang_sum = tai_ang_one + tai_ang_two;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[fra_ind_bro, fra_tim_bro] = ext_tem_fra_dat_cut_bro(fil_pat_ima_fis, fil_pat_exp, fil_pat_rec); % synch
tai_ang_bro = tai_ang_sum(fra_ind_bro); % synch
end

function [pcb_ons_bou, pcb_off_bou, dur_pcb_bou] = cal_pcb_ons_bou(acb_ons_bou, acb_off_bou)
n_acb = length(acb_off_bou);
n_pcb = n_acb - 1;
pcb_ons_bou = acb_off_bou(1:n_pcb);
pcb_off_bou = acb_ons_bou(2:end);
dur_pcb_bou = pcb_off_bou - pcb_ons_bou;
end

function tim = syn(tim, man_sec, ini_del)
tim = tim*man_sec + ini_del;
end

function [fra_ind_bro, fra_tim_bro] = ext_tem_fra_dat_cut_bro(fil_pat_ima_fis, fil_pat_exp, ...
    fil_pat_rec)
buf = 1;
fra_tim = ext_tem_fra_dat(fil_pat_ima_fis);
% synch
load(fil_pat_rec, 'man_sec', 'ini_del');
fra_tim = syn(fra_tim, man_sec, ini_del);
% cutting
exp_fil = matfile(fil_pat_exp);
sta_tim = exp_fil.sta_tim;
if isprop(exp_fil, 'end_tim')
    end_tim = exp_fil.end_tim;
else
    end_tim = exp_fil.dur_spo;
end
%
fra_ind_bro = fra_tim > sta_tim - buf & fra_tim <= end_tim + buf;
fra_tim_bro = fra_tim(fra_ind_bro);
end

function [fra_ind, fra_rat, fra_tim, fra_ind_bro, fra_tim_bro] = ...
    ext_tem_fra_dat_cut_nox_syn(fil_pat_ima_fis, fil_pat_exp)
buf = 1;
fra_tim = ext_tem_fra_dat(fil_pat_ima_fis);
% cutting
load(fil_pat_exp, 'sta_tim', 'end_tim');
%
fra_ind_bro = fra_tim > sta_tim - buf & fra_tim <= end_tim + buf;
fra_tim_bro = fra_tim(fra_ind_bro);
%
fra_ind = fra_tim > sta_tim & fra_tim <= end_tim;
fra_tim = fra_tim(fra_ind);
%
n_fra = length(fra_tim);
dur = fra_tim(end) - fra_tim(1);
fra_rat = n_fra/dur;
end
%%%
function [tai_bea, tai_sig, tai_bea_ang] = ext_tai_bea_seg(fra_tim, mph_tai, fra_mph_mpp, tai_ang)
% rectify
tai_sig = per_ful_wav_rec(tai_ang);
%
mpp_tai = fra_mph_mpp*mph_tai;
% find peaks
[tai_bea_ang, tai_bea] = findpeaks(tai_sig, 'MinPeakHeight', mph_tai, 'MinPeakProminence', ...
    mpp_tai);
tai_bea = fra_tim(tai_bea);
end

function [tai_bea, tai_bea_ang] = ext_tai_bea_acb(fra_tim, mph_tai, tai_ang)
% find peaks
[tai_bea_ang, tai_bea] = findpeaks(tai_ang, 'MinPeakHeight', mph_tai);
tai_bea = fra_tim(tai_bea);
end

function [bou_ons_bou, bou_off_bou, dur_bou] = ext_bou_ons(tim_bin, tai_rat_bin, tim_bea, bea_del)
% bea_del: since tai_bea is the peak, the beat starts earlier
log_tai_rat_bin = tai_rat_bin > 0;
dif_log_tai_rat_bin = [diff(log_tai_rat_bin); 0];
log_bou_ons_bin = dif_log_tai_rat_bin == 1;
log_bou_off_bin = dif_log_tai_rat_bin == -1;

[row_fir, ~, dif_fir] = find(dif_log_tai_rat_bin, 1);
if dif_fir == -1
    log_bou_off_bin(row_fir) = false;
end

bou_ons_rat_bou = tim_bin(log_bou_ons_bin);
bou_off_rat_bou = tim_bin(log_bou_off_bin);

n_bou = length(bou_off_rat_bou);% previously ons !!!!
bou_ons_bou = nan(n_bou, 1);
bou_off_bou = nan(n_bou, 1);
dur_bou = nan(n_bou, 1);
bin_siz = 1;
for bou = 1:n_bou
    ind_bou_ons_i = find(tim_bea > bou_ons_rat_bou(bou) - bin_siz/2, 1);
    bou_ons_bou(bou) = tim_bea(ind_bou_ons_i) - bea_del;
    %
    ind_bou_off_i = find(tim_bea < bou_off_rat_bou(bou), 1, 'last');
    bou_off_bou(bou) = tim_bea(ind_bou_off_i) + bea_del;
    %
    dur_bou(bou) = bou_off_bou(bou) - bou_ons_bou(bou);
end
end

function [bou_ons_bou, bou_off_bou, dur_bou] = ext_acb_ons(tim_bin, tai_rat_bin, tim_bea, bea_del)
% bea_del: since tai_bea is the peak, the beat starts earlier

% tai rat from original
log_tai_rat_bin = tai_rat_bin > 0;
dif_log_tai_rat_bin = [diff(log_tai_rat_bin); 0];
log_bou_ons_bin = dif_log_tai_rat_bin == 1;
log_bou_off_bin = dif_log_tai_rat_bin == -1;

[row_fir, ~, dif_fir] = find(dif_log_tai_rat_bin, 1);
if dif_fir == -1
    log_bou_off_bin(row_fir) = false;
end

bou_ons_rat_bou = tim_bin(log_bou_ons_bin);
bou_off_rat_bou = tim_bin(log_bou_off_bin);

sta_tim = 200;
bou_ons_rat_bou = bou_ons_rat_bou(bou_ons_rat_bou > sta_tim);
bou_off_rat_bou = bou_off_rat_bou(bou_off_rat_bou > bou_ons_rat_bou(1));

n_bou = length(bou_off_rat_bou);
bou_ons_bou = nan(n_bou, 1);
bou_off_bou = nan(n_bou, 1);
bin_siz = 1;
for bou = 1:n_bou
    ind_bou_ons_i = find(tim_bea > bou_ons_rat_bou(bou) - bin_siz/2, 1);
    
    % added after gfap done
    if tim_bea(ind_bou_ons_i) > bou_off_rat_bou(bou)
        ind_bou_ons_i = ind_bou_ons_i -1;
    end
    
    bou_ons_bou(bou) = tim_bea(ind_bou_ons_i) - bea_del;
    %
    ind_bou_off_i = find(tim_bea < bou_off_rat_bou(bou), 1, 'last');
    %ind_bou_off_i = find(tim_bea < bou_off_rat_bou(bou) + bin_siz/2, 1, 'last');
    bou_off_bou(bou) = tim_bea(ind_bou_off_i) + bea_del;
end
bou_ons_bou = unique(bou_ons_bou);
bou_off_bou = unique(bou_off_bou);
if bou_off_bou(end) < bou_ons_bou(end)
    bou_ons_bou(end) = [];
end
dur_bou = bou_off_bou - bou_ons_bou;
end

function [spo_bou_ons_bou, log_bou] = ide_spo_bou_ons(bou_ons_bou, spo_per_lim)
n_per = size(spo_per_lim, 1);
spo_bou_ons_per = cell(n_per, 1);
for per = 1:n_per
    log_box = isx_wit(bou_ons_bou, spo_per_lim(per, :));
    spo_bou_ons_per{per} = bou_ons_bou(log_box);
end
spo_bou_ons_bou = vertcat(spo_bou_ons_per{:});
log_bou = ismember(bou_ons_bou, spo_bou_ons_bou);
end

function [bea_lat_tri, bea_ang_tri] = ext_bea_lat_tri(sti_ons, tai_bea, tai_bea_ang)
n_tri = length(sti_ons);
bea_lat_tri = nan(n_tri, 1);
bea_ang_tri = nan(n_tri, 1);
for i = 1:n_tri
    sti_ons_i = sti_ons(i);
    [tai_bea_aft_i, ind_i] = fin_clo_val_big(tai_bea, sti_ons_i);
    bea_lat_tri(i) = tai_bea_aft_i - sti_ons_i;
    bea_ang_tri(i) = tai_bea_ang(ind_i);
end
end

function tra_shu = shu_tra(tra)
int = diff(tra);
int_shu = shu_vec(int);
tra_shu = cumsum([tra(1); int_shu]);
end

% function tai_ang_fra = cal_tai_ang_fra(tai_ang_uni, tau)
%     con_fil = matfile('\\home.ansatt.ntnu.no\kadiram\Documents\MATLAB\con_esp.mat');
%     ifi = con_fil.ifi;
%     tbin = ifi.man;
%     kernellength=round(2*tau/tbin);
%     kernel1=exp(-(0:kernellength-1)/(tau/tbin));%exponentially decaying kernel
%     tai_ang_fra = conv(tai_ang_uni, kernel1, 'same');
% end

function tai_ang_fra = cal_tai_ang_fra(tai_ang_uni, tau)
    con_fil = matfile('\\home.ansatt.ntnu.no\kadiram\Documents\MATLAB\con_esp.mat');
    ifi = con_fil.ifi;
    tbin = ifi.man;

    kernellength = round(2*tau/tbin);
    kernel1 = exp(-(0:kernellength-1)/(tau/tbin));  % exponential kernel
    
    % Full convolution
    y_full = conv(tai_ang_uni, kernel1, 'full');
    
    % Trim so the output starts at the same time as the input (causal)
    tai_ang_fra = y_full(1:length(tai_ang_uni));
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% behavioral plotting
function plo_eth_fil_nox_spo(fil_pat_exp, fil_pat_rec, col_tai, col_hea, col_ope, col_mou, ...
    col_eye, col_tai_sig, col_hea_sig, col_ope_sig, ...
    col_mou_sig, col_eye_sig, fon_siz, col_rob, col_dru, col_sti)
load(fil_pat_exp, 'sta_tim', 'end_tim', 'dru_ons', 'sti_ons')
load(fil_pat_rec, 'tai_bea', 'hea_bea', 'ope_bea', 'mou_bea', 'eye_bea', 'tai_sig', 'hea_sig', 'ope_sig', 'mou_sig', 'eye_sig', 'rat_tim', 'rat_tim_par',...
    'fra_tim', 'tim_rob', 'rat_rob');
% plot
fig
n_row = 1;
n_col = 1;
gap_ver = 0;
gap_hor = 0;
mar_bot = 0.075;
mar_top = 0;
mar_lef = 0.075;
mar_rig = 0.001;
hax_sub = tight_subplot(n_row, n_col, [gap_ver gap_hor], [mar_bot mar_top], [mar_lef mar_rig]);
plo_fis_ras_sig_rat(tai_bea, hea_bea, ope_bea, mou_bea, eye_bea, tai_sig, hea_sig, ope_sig, mou_sig, eye_sig, rat_tim, rat_tim_par, col_tai, col_hea,...
    col_ope, col_mou, col_eye, col_tai_sig, col_hea_sig, col_ope_sig, col_mou_sig, col_eye_sig, fon_siz, fra_tim, ...
    sta_tim, end_tim, tim_rob, rat_rob, col_rob)
if ~isempty(dru_ons)
    plo_ver_lin(dru_ons, hax_sub, col_dru)
end
plo_ver_lin(sti_ons, hax_sub, col_sti)
%%%%%%%%%%%%%%%%%%%
x_tic = [dru_ons; sti_ons(1:2:end)];
%if ~isempty(dru_ons)
    add_x_tic(x_tic)
%end
end

function plo_fis_ras_sig_rat(tai_bea, hea_bea, ope_bea, mou_bea, eye_bea, tai_sig, ...
    hea_sig, ope_sig, mou_sig, eye_sig, rat_tim, rat_tim_par, col_tai, col_hea, col_ope, ...
    col_mou, col_eye, col_tai_sig, col_hea_sig, col_ope_sig, col_mou_sig, col_eye_sig, ...
    fon_siz, fra_tim, sta_tim, end_tim, tim_rob, rat_rob, col_rob)
n_row = 10;
y_axi = 0.5;
x_lab = 'Time (min)';
%
tai_rat = rat_tim_par(:, 1);
hea_rat = rat_tim_par(:, 2);
ope_rat = rat_tim_par(:, 3);
mou_rat = rat_tim_par(:, 4);
eye_rat = rat_tim_par(:, 5);
%
min_eye_rat = min(eye_rat);
max_eye_rat = max(eye_rat);
mid_eye_rat = mean([min_eye_rat, max_eye_rat]);

min_mou_rat = min(mou_rat);
max_mou_rat = max(mou_rat);
mid_mou_rat = mean([min_mou_rat, max_mou_rat]);

min_ope_rat = min(ope_rat);
max_ope_rat = max(ope_rat);
mid_ope_rat = mean([min_ope_rat, max_ope_rat]);

min_hea_rat = min([min(hea_rat) min(rat_rob)]);
max_hea_rat = max([max(hea_rat) max(rat_rob)]);
mid_hea_rat = mean([min_hea_rat, max_hea_rat]);

min_tai_rat = min(tai_rat);
max_tai_rat = max(tai_rat);
mid_tai_rat = mean([min_tai_rat, max_tai_rat]);

par_lab = {num2str(min_eye_rat), num2str(mid_eye_rat), num2str(max_eye_rat), 'Eye', ...
    num2str(min_mou_rat), num2str(mid_mou_rat), num2str(max_mou_rat),...
    'Mouth', num2str(min_ope_rat), num2str(mid_ope_rat), num2str(max_ope_rat), 'Operculum', ...
    num2str(min_hea_rat), num2str(mid_hea_rat), num2str(max_hea_rat),...
    'Heart', num2str(min_tai_rat), num2str(mid_tai_rat), num2str(max_tai_rat), 'Tail'};
n_par_lab = length(par_lab);

%
y_axi = plo_rat(y_axi, rat_tim, eye_rat, col_eye);
hold on
y_axi = plo_beh_ras_sig({eye_bea}, y_axi, col_eye, fra_tim, eye_sig, col_eye_sig);
hold on
y_axi = plo_rat(y_axi, rat_tim, mou_rat, col_mou);
hold on
y_axi = plo_beh_ras_sig({mou_bea}, y_axi, col_mou, fra_tim, mou_sig, col_mou_sig);
hold on
y_axi = plo_rat(y_axi, rat_tim, ope_rat, col_ope);
hold on
y_axi = plo_beh_ras_sig({ope_bea}, y_axi, col_ope, fra_tim, ope_sig, col_ope_sig);
hold on
y_axi = plo_rat(y_axi, rat_tim, hea_rat, col_hea);
hold on
y_axi = plo_rat(y_axi - 1, tim_rob, rat_rob, col_rob);
hold on
y_axi = plo_beh_ras_sig({hea_bea}, y_axi, col_hea, fra_tim, hea_sig, col_hea_sig);
hold on
y_axi = plo_rat(y_axi, rat_tim, tai_rat, col_tai);
hold on
plo_beh_ras_sig({tai_bea}, y_axi, col_tai, fra_tim, tai_sig, col_tai_sig);

xlim([sta_tim end_tim])
ylim([0.5 n_row + 0.5])

y_tic = 0.5:0.5:n_par_lab + 0.5;
yticks(y_tic)
yticklabels(par_lab)

%
xlabel(x_lab);

pre_for_exp(fon_siz)
enl_num(fon_siz)
end

function y_axi = plo_beh_ras_sig(par, y_axi_bas, col, tim, sig, col_sig)
n_par = length(par);
y_axi = max(y_axi_bas) + n_par;
% rescale
sig = rescale(sig, y_axi_bas, y_axi);
%
bea = par{1};
log_bea = ismember(tim, bea);
siz = 30;
scatter(bea, sig(log_bea), siz, col, 'filled')
hold on
plot(tim, sig, col_sig)
end

function h_fig = plo_con_tai_ang(tai_ang_uni)
[h_fig, fig_wid, fig_hei] = fig;
n_row = 4;
n_col = 1;
gap_ver_row = 0.050*ones(n_row, 1);
gap_hor_row_col = 0.005*ones(n_row, n_col);
mar_bot = 0.050;
mar_top = 0.020;
mar_lef = 0.050;
mar_rig = 0.050;
n_sub = n_row*n_col;
asp_rat_axe = 7*ones(n_sub, 1);
wid = false;
sca_axe = 1*ones(n_sub, 1);
n_pix_ext = 0;
[hax_sub, ~, ~, ~, ~, ~] = tight_subplot_gen(n_row, n_col, ...
    gap_ver_row, gap_hor_row_col, mar_bot, mar_top, mar_lef, mar_rig, asp_rat_axe, fig_wid, ...
    fig_hei, wid, sca_axe, n_pix_ext);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
con_fil = matfile('\\home.ansatt.ntnu.no\kadiram\Documents\MATLAB\con_esp.mat');
tim_fra = con_fil.tim_fra;
plo_tim_fra = tim_fra.ani.ses.sti;
sti_ons_tri = con_fil.sti_ons_tri;
log_fra = plo_tim_fra > 60 & plo_tim_fra < sti_ons_tri.vrs.all(1);% for the spo
%
hax = hax_sub(1);
plot(hax, plo_tim_fra(log_fra), tai_ang_uni(log_fra))
hax.Box = "off";
%
tau_num = 8:2:12;
ite = 1;
for tau = tau_num
    ite = ite + 1;
    hax = hax_sub(ite);
    tai_ang_fra = cal_tai_ang_fra(tai_ang_uni, tau);
    plot(hax, plo_tim_fra(log_fra), tai_ang_fra(log_fra))
    hax.Box = "off";
end
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% neural

% preprocessing
% function sav_ali_mas(workingDir, readData, readMetadata, confPath, varargin)
% % starts motioncorrection for a whole dataset, currently estimating only translation
% % Parameters:
% %     folderPath - Path to data including separator a the end
% %     readData - function handle to read in a t-th time frame
% %     readMetadata - function handle to retrieve information about the dataset
% %     blockLength - length of time blocks in which alignment problem is split
% %     referenceSize - start Alignment with reference to the mean of the
% %                                                   first 'referenceSize' frames 
% %     confPath - path to configuration file.
% % varargin:
% %        refVol - array, has to have same dimension as data, is used as
% %        alignment reference
% %        ExperimentId - string that contains an ID ....different groups of
% %        raw data could be grouped like this.
% 
% % Read Metadata,Configfile and Parse varargin
% warning off
% metadata=readMetadata();
% params=loadjson(confPath);
% numberArgin=length(varargin);
% 
% % Check for ExpID
% if numberArgin>=1
%     metadata.ExperimentID=varargin{1};
% end
% 
% % Check whether reference volume is supplied, and set flag, so that we late
% % know this, if not assing empty array.
% metadata.Alignment.extRefVol=false;
% % Hardcoded Parameters
% mask_drawer_method = 0;
% mask_drawer = 1;
% 
% % Setup Folder
% if isempty(dir(workingDir))
%     mkdir(workingDir)
% end
% %  If wanted, the user draws alignment masks. also checks whether we already have masks 
% % and reuses them
% % get list of available masks
% masks_dir = struct2cell(dir([workingDir,'mask_roi*.mat']));
% available_masks = zeros(1,size(masks_dir,2));
% for i = 1:size(masks_dir,2)
%     str = masks_dir{1,i};
%     available_masks(1,i) = sscanf(str,'mask_roi%d.mat');
% end
% todo = 1:metadata.dim(3);
% todo = setdiff(todo,available_masks);
% sta_fra = 3600 + 1;
% end_fra = sta_fra + 99;
% fra = sta_fra:end_fra;
% if size(available_masks,2) < metadata.dim(3)
%     if params.Alignment.MaskAlignment
%         for i= todo
%             mask_total = [];
%             img = [];
%             disp('Drawing alignment masks...')
%             if mask_drawer_method == 0
%                 temp = readData(fra,i);
%                 if length(size(temp)) > 3
%                     img=mean(readData(fra,i),4);
%                 else
%                     img=mean(readData(fra,i),3);
%                 end
%             elseif mask_drawer_method == 1
%                 if length(size(temp)) > 3
%                     img=max(readData(fra,i),[],4);
%                 else
%                     img=max(readData(fra,i),[],3);
%                 end
%             end
%             if mask_drawer == 0
%                 while ~waitforbuttonpress
%                     img=delete_area(img);
%                 end
%                 mask_total = not(img==0);
%             elseif mask_drawer == 1
%                 orig = img;
%                 orig = orig-min(orig(:));
%                 orig = orig/max(orig(:));
%                 to_show = repmat(orig,[1 1 3]);
%                 mask_total = false(size(img));
%                 break_flag = 0;
%                 while true
%                     figure
%                     imagesc(to_show)
%                     axis image; 
%                     h = imfreehand(gca);
%                     wait(h);
%                     s = 'add -> a; subtract -> s; quit -> q : ';
%                     response = input(s,'s');
%                     mask = createMask(h);
%                     if response(1) == 'a'
%                         mask_total = mask_total|mask;
%                     elseif response(1) == 's'
%                         mask_total(mask) = 0;
%                     elseif response(1) == 'q'
%                         break_flag = 1;
%                         break;
%                     end
%                     to_show = repmat(orig,[1 1 3]);
%                     show_mask = false(size(mask_total,1),size(mask_total,2),3);
%                     show_mask(:,:,1) = ~mask_total;
%                     to_show(show_mask) = 0.1+orig(show_mask)/max(orig(show_mask));
%                     if (length(response)>1) && (response(2) == 'q')
%                         break;
%                     end
%                 end
%                 if break_flag
%                     break;
%                 end
%             end
%             mask = mask_total;
%             save ([workingDir,'mask_roi', num2str(i),'.mat'],'mask','-v7.3'); %adjust mask
%         end
%     else
%          for i= 1:metadata.dim(3)
%                     disp('Using no alignment masks...')
%                     mask = ones(metadata.dim(1),metadata.dim(2),'uint16');     
%                     save ([workingDir,'mask_roi', num2str(i),'.mat'],'mask','-v7.3'); %adjust mask
%          end      
%     end
% else
%     disp('Using previous alignment masks...')
% end
% 
% % Generate list of planes to align (try to resume from previous attempt)
% directoryList = dir(workingDir);
% directoryNames = {directoryList([directoryList.isdir]).name};
% finishedPlanes = [];
% for i = 1:length(directoryNames)
%     directoryName = cell2mat(directoryNames(i));
%     searchPlaneNumber = regexp(directoryName,'\d');
%     if ~isempty(searchPlaneNumber)
%         finishedPlanes = [finishedPlanes; ...
%             str2double(directoryName(searchPlaneNumber:length(directoryName)))];
%     end
% end
% planesToDo = 1:metadata.dim(3);
% planesToDo(finishedPlanes) = 0;
% planesToDo = planesToDo(planesToDo>0);
% disp('Alignment status:');
% disp('finished')
% finishedPlanes'
% disp('todo')
% planesToDo'
% end%ed

function [frameStart, frameStop] = ext_fra_sta_sto(metadata, mov_blo, blockLength)
n_mov = length(mov_blo);
n_chu = n_mov + 1;
if n_mov == 0
    frameStart = 1;
    frameStop = floor(metadata.dim(4));
    % meta data is output of alignment, independent of n_pla. dim(3)=n_pla.
else
    mov_poi_fra = blockLength*(mov_blo - 1);
    frameStart = nan(n_chu, 1);
    frameStop = nan(n_chu, 1);
    for i = 1:n_chu
        if i == 1
            frameStart(i) = 1;
            frameStop(i) = mov_poi_fra(1);
        elseif i == n_chu
            frameStart(i) = mov_poi_fra(end) + 1;
            frameStop(i) = metadata.dim(4);
        else
            frameStart(i) = mov_poi_fra(i - 1) + 1;
            frameStop(i) = mov_poi_fra(i);
        end
    end
end
end

function spe = ext_spe(mov_blo, reg, n_chu)
n_mov = length(mov_blo);
if n_mov == 0
    spe = reg;
else
    spe = cell(n_chu, 1);
    for i = 1:n_chu
        spe{i} = [reg sprintf('_%d', i)];
    end
end
spe = convertCharsToStrings(spe);
end

function [int_con_row_col, dff_raw_tri_row_col, dff_con_row_col] = ext_pix_dat(...
    int_row_col_fra, sti_ons, n_con, n_tri_con, fra_rat, neu_ref_dur, bas_dur_neu, res_dur_neu)
[n_row, n_col, ~] = size(int_row_col_fra);
n_fra_ref = round(fra_rat*neu_ref_dur);
n_fra_bas = round(fra_rat*bas_dur_neu);
n_fra_res = round(fra_rat*res_dur_neu);
n_tri = length(sti_ons);
dff_raw_tri_row_col = cell(n_tri, 1);
%
tri_con_ons = (1:n_tri_con:n_tri)';
int_con_row_col = cell(n_con, 1);
for i = 1:n_tri
    sti_ons_i = sti_ons(i);
    sti_ons_i_fra = round(fra_rat*sti_ons_i);
    fra_num_bas_i = sti_ons_i_fra - n_fra_bas:sti_ons_i_fra;
    fra_num_res_i = sti_ons_i_fra:sti_ons_i_fra + n_fra_res;
    fra_bas_i = int_row_col_fra(:, :, fra_num_bas_i);
    fra_res_i = int_row_col_fra(:, :, fra_num_res_i);
    ima_bas_i = mean(fra_bas_i, 3);
    ima_res_i = mean(fra_res_i, 3);
    
    [log_i, con_ind] = ismember(i, tri_con_ons);
    if log_i
        fra_num_ref = sti_ons_i_fra - n_fra_ref:sti_ons_i_fra;
        fra_ref = int_row_col_fra(:, :, fra_num_ref);
        int_con_row_col{con_ind} = mean(fra_ref, 3);
    end

    dff_raw_tri_row_col{i} = ((ima_res_i - ima_bas_i)./ima_bas_i)*100;
end
dff_con_row_col = cell(n_con, 1);
for i = 1:n_con
    dff_raw_row_col_tri_i = nan(n_row, n_col, n_tri_con);
    for j = 1:n_tri_con
        dff_raw_row_col_tri_i(:, :, j) = dff_raw_tri_row_col{(i - 1)*n_tri_con + j};
    end
    dff_con_row_col{i} = mean(dff_raw_row_col_tri_i, 3);
end
end

function h_fig = sho_pla(piv_pla_row_col, ~, pla)
[h_fig, fig_wid, fig_hei] = fig_por;
n_row_fig = 1;
con_fil = matfile('\\home.ansatt.ntnu.no\kadiram\Documents\MATLAB\con_esp.mat');
n_col_fig = 1;
gap_ver_row = 0.010*ones(n_row_fig, 1);
gap_hor_row_col = 0.001*ones(n_row_fig, n_col_fig);
mar_bot = 0.000;
mar_top = 0.000;
mar_lef = 0.000;
mar_rig = 0.000;
asp_rat = con_fil.asp_rat;
asp_rat_axe = asp_rat.cal.ori*ones(n_row_fig*n_col_fig);
wid = false;
sca_axe = 1;
n_pix_ext = 50;
[hax_sub, ~, ~, ~, ~, ~] = tight_subplot_gen(n_row_fig, n_col_fig, ...
    gap_ver_row, gap_hor_row_col, mar_bot, mar_top, mar_lef, mar_rig, asp_rat_axe, fig_wid, ...
    fig_hei, wid, sca_axe, n_pix_ext);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
low_in.rel = 0;
%high_in.rel = con_fil.con;
high_in.rel = 0.08;
hax = hax_sub(1);
piv_row_col = uint16(piv_pla_row_col.gre{pla});
piv_row_col = imadjust(piv_row_col, [low_in.rel high_in.rel]);
sho_ima.raw(hax, piv_row_col)
%ima = sho_ima.raw(hax, piv_row_col);
%showMaskAsOverlay(0.15, log_pla_row_col.all.all{pla}, [0 1 0], ima)
end
%%%%%%%%%%%%%%% cell-based
function ofr_win = cal_ofr_win(f_fra_cel, mrp, mrp_ons)
[~, n_cel] = size(f_fra_cel);
con_fil = matfile('\\home.ansatt.ntnu.no\kadiram\Documents\MATLAB\con_esp.mat');
tim_fra = con_fil.tim_fra;
tim_fra = tim_fra.cal.eig.ses.spo;
n_win = 2;
ons_ong_win = nan(n_win, 1);
ons_ong_win(1) = mrp_ons - mrp;
ons_ong_win(2) = mrp_ons;
off_ong_win = nan(n_win, 1);
off_ong_win(1) = mrp_ons;
off_ong_win(2) = mrp_ons + mrp;
osc_cel_win = nan(n_cel, n_win);
ofr_cel_win = nan(n_cel, n_win);
for cel = 1:n_cel
    f_fra = f_fra_cel(:, cel);
    [~, dec_fra] = deconvolveCa(f_fra, 'foopsi', 'ar1', 'smin', -2.5, 'optimize_pars', true, ...
        'optimize_b', true);
    spi_fra = logical(dec_fra);% false all if nan.
    tim_spi = tim_fra(spi_fra);
    for win = 1:n_win
        osc_cel_win(cel, win) = sum(tim_spi > ons_ong_win(win) & tim_spi < off_ong_win(win));
    end
    ofr_cel_win(cel, :) = osc_cel_win(cel, :)./mrp;
end
ofr_win = mean(ofr_cel_win);
end

function [bas_flu, bas_flu_cel] = ext_f_bas_win(f_fra_cel)
con_fil = matfile('\\home.ansatt.ntnu.no\kadiram\Documents\MATLAB\con_esp.mat');
log_fra = con_fil.log_fra;
bas_flu_cel = mean(f_fra_cel(log_fra.cal.one.ong, :));
bas_flu = mean(bas_flu_cel);
end

function [log_cel_pla, log_pla_row_col, cel_pla_row_col] = ext_log_cel_pla(n_cel, n_cel_pla, ...
    cel_pla_row_col)
% log_pla_row_col.all.all
con_fil = matfile('\\home.ansatt.ntnu.no\kadiram\Documents\MATLAB\con_esp.mat');
n_pla = con_fil.n_pla;
fun_pla = con_fil.fun_pla;
n_cel_pla.raw(2) = 0;
end_cel_pla = cumsum(n_cel_pla.raw);
sta_cel_pla = [1; end_cel_pla(1:end - 1) + 1];
log_cel_pla = false(n_cel.all, n_pla.neu.raw);
log_pla_row_col = cell(n_pla.neu.raw, 1);
cel_pla_row_col.ani = cell(n_pla.neu.raw, 1);
for pla = fun_pla.raw
    log_cel_pla(sta_cel_pla(pla):end_cel_pla(pla), pla) = true;
    cel_row_col = cel_pla_row_col.pla{pla};
    log_pla_row_col{pla} = ~isnan(cel_row_col);
    cel_pla_row_col.ani{pla} = sta_cel_pla(pla) + cel_pla_row_col.pla{pla} - 1;
end
end

function [cen_sub_cel_dim, dis_cel_cel] = ext_cen_sub_cel_dim(cel_lab_row_col, factor_meter)
% centroid index cell dimension
n_cel = max(cel_lab_row_col, [], 'all');
n_dim = 2;
cen_sub_cel_dim = nan(n_cel, n_dim);
pos_pix_cel_dim = nan(n_cel, n_dim);
con_fil = matfile('\\home.ansatt.ntnu.no\kadiram\Documents\MATLAB\con_esp.mat');
n_row = con_fil.n_row;
n_row_cax = n_row.cal;
for i = 1:n_cel
    [row_pix, col_pix] = find(cel_lab_row_col == i);
    cen_sub_cel_dim(i, 1) = round(mean(row_pix));
    cen_sub_cel_dim(i, 2) = round(mean(col_pix));
    %
    pos_pix_cel_dim(i, 1) = cen_sub_cel_dim(i, 2);
    pos_pix_cel_dim(i, 2) = n_row_cax - cen_sub_cel_dim(i, 1);% origin: bottom left
end
dis_pix_cel_cel = squareform(pdist(pos_pix_cel_dim));
dis_cel_cel = factor_meter*dis_pix_cel_cel;
end

function dff_con_row_col = com_dff_con_row_col(cel_lab_row_col, act_reg_con_win_cel, rem_cel_num)
n_cel = max(max(cel_lab_row_col));
%global n_con%editor
dff_con_row_col = cell(n_con, 1);
n_cel_rem = length(rem_cel_num);
for j = 1:n_con
    dff_con_row_col{j} = nan*cel_lab_row_col;
    if n_cel_rem > 0
        ele_ins_num = nan(n_cel_rem, 1);
        act_reg_con_win_cel.dff.raw.tri.all{1}{j, 2} = ...
            ins_int_vec(act_reg_con_win_cel.dff.raw.tri.all{1}{j, 2}, ele_ins_num, rem_cel_num);
    end
    for i = 1:n_cel
        log_lab_i = cel_lab_row_col == i;
        dff_con_row_col{j}(log_lab_i) = act_reg_con_win_cel.dff.raw.tri.all{1}{j, 2}(i);
    end
end
end

function act_cel_tri_win = cal_act_cel_tri_win(act_fra_cel, rem_cel_num, win_len, poi_tri_lim, ...
    tim_fra)
% act_fra_cel: entire session
act_fra_cel(:, rem_cel_num) = [];
n_cel = size(act_fra_cel, 2);
act_cel_tri_win = cell(n_cel, 1);
act_cel_fra_tri = cell(n_cel, 1);
con_fil = matfile('\\home.ansatt.ntnu.no\kadiram\Documents\MATLAB\con_esp.mat');
n_tri = con_fil.n_tri;
n_win = con_fil.n_win;
tri_len = con_fil.tri_len;
for cel = 1:n_cel
    act_cel_tri_win{cel} = nan(n_tri.vrs, n_win.tri);
    act_cel_fra_tri{cel} = nan(tri_len.dff.one.int + 1, n_tri.vrs);
    for tri = 1:n_tri.vrs
        act_cel_fra_tri{cel}(:, tri) = ...
            act_fra_cel(poi_tri_lim.fra(tri, 1):poi_tri_lim.fra(tri, 2), cel);
        act_cel_tri_win{cel}(tri, :) = com_ave_amp_uni_win(tim_fra, act_cel_fra_tri{cel}(:, tri), ...
            win_len);
    end
end
end

function [act_cel_tri_win, act_cel_fra_tri, act_cel_con_fra_tri, act_con_fra_cel, ...
    act_con_cel_win, act_win_cel_tri, act_reg_con_win_cel, act_reg_con_win, n_cel_reg, ...
    log_cel_con, act_reg_con_fra_cel, log_cel_reg, log_tot_cel_reg, n_tot_cel_reg, ...
    fra_reg_con] = ext_act(act_fra_cel, log_cel_reg, rem_cel_num, win_len, ...
    poi_tri_lim, tim_fra, log_tot_cel_reg, boo_tri_con)
% fra_reg_con: fraction region condition
%global n_tri n_win n_con dim_lef_rig n_reg_for dim_top_bot%editor
act_fra_cel(:, rem_cel_num) = [];
log_cel_reg(rem_cel_num, :) = [];
n_cel_reg = sum(log_cel_reg)';
log_tot_cel_reg(rem_cel_num, :) = [];
n_tot_cel_reg = sum(log_tot_cel_reg)';
%
n_cel = size(act_fra_cel, 2);
act_cel_tri_win = cell(n_cel, 1);
act_win_cel_tri = cellfun(@(ave_act_cel_tri) nan(n_cel, n_tri.vrs), cell(n_win.tri, 1), ...
    'UniformOutput', false);
act_cel_fra_tri = cell(n_cel, 1);
act_cel_con_fra_tri = cell(n_cel, n_con);
con_fil = matfile('\\home.ansatt.ntnu.no\kadiram\Documents\MATLAB\con_esp.mat');
tri_len = con_fil.tri_len;
for i = 1:n_cel
    act_cel_tri_win{i} = nan(n_tri.vrs, n_win.tri);
    act_cel_fra_tri{i} = nan(tri_len.dff.one.int + 1, n_tri.vrs);
    for j = 1:n_tri.vrs
        act_cel_fra_tri{i}(:, j) = ...
            act_fra_cel(poi_tri_lim.fra(j, 1):poi_tri_lim.fra(j, 2), i);
        act_cel_tri_win{i}(j, :) = com_ave_amp_uni_win...
            (tim_fra, act_cel_fra_tri{i}(:, j), win_len);
        for k = 1:n_win.tri
            act_win_cel_tri{k}(i, j) = act_cel_tri_win{i}(j, k);% ess. same
        end
    end
    for j = 1:n_con
        act_cel_con_fra_tri{i, j} = act_cel_fra_tri{i}(:, boo_tri_con(:, j)');
    end
end
[log_cel_con, ~] = ext_log_res_tes_cel_con(act_cel_tri_win);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% *first* trial-averaged activity
act_cel_con_fra = cellfun(@(act_fra_tri) mean(act_fra_tri, dim_lef_rig), act_cel_con_fra_tri, ...
    'UniformOutput', false);
% SMOOTHING TRIAL-AVERAGED RESPONSES
n_fra = con_fil.n_fra;
act_cel_con_fra = cellfun(@(sam_poi) smo_sam_poi_uni(sam_poi, n_fra.dff.one.bas, n_fra.dff.one.smo), ...
    act_cel_con_fra, 'UniformOutput', false);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% trial-averaged activity
log_con_cel_reg.all = cell(n_con, 1);
log_con_cel_reg.inh = cell(n_con, 1);
log_con_cel_reg.exc = cell(n_con, 1);
%
fra_reg_con.inh = nan(n_reg_for, n_con);
fra_reg_con.exc = nan(n_reg_for, n_con);
%
act_con_fra_cel.all = cell(n_con, 1);
act_con_fra_cel.inh = cell(n_con, 1);
act_con_fra_cel.exc = cell(n_con, 1);
% window-averaged activity
act_con_cel_win.all = cell(n_con, 1);
act_con_cel_win.inh = cell(n_con, 1);
act_con_cel_win.exc = cell(n_con, 1);
for i = 1:n_con
    log_con_cel_reg.all{i} = log_cel_reg;
    log_con_cel_reg.inh{i} = log_con_cel_reg.all{i}(log_cel_con.inh(:, i), :);% ?
    log_con_cel_reg.exc{i} = log_con_cel_reg.all{i}(log_cel_con.exc(:, i), :);
    fra_reg_con.inh(:, i) = (sum(log_con_cel_reg.inh{i}, dim_top_bot)'./n_cel_reg)*100;
    fra_reg_con.exc(:, i) = (sum(log_con_cel_reg.exc{i}, dim_top_bot)'./n_cel_reg)*100;
    %
    act_con_fra_cel.all{i} = nan(tri_len.dff.one.int + 1, n_cel);
    for j = 1:n_cel
        act_con_fra_cel.all{i}(:, j) = act_cel_con_fra{j, i};
    end
    act_con_fra_cel.inh{i} = act_con_fra_cel.all{i}(:, log_cel_con.inh(:, i));
    act_con_fra_cel.exc{i} = act_con_fra_cel.all{i}(:, log_cel_con.exc(:, i));
    % window averaging
    act_con_cel_win.all{i} = com_ave_amp_uni_win(tim_fra, act_con_fra_cel.all{i}, win_len);
    act_con_cel_win.inh{i} = act_con_cel_win.all{i}(log_cel_con.inh(:, i), :);
    act_con_cel_win.exc{i} = act_con_cel_win.all{i}(log_cel_con.exc(:, i), :);
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% region
% first two ouput !!!!
[act_reg_con_fra_cel.all, act_reg_con_win_cel.all, act_reg_con_win.all] = ...
    ext_act_reg(act_con_fra_cel.all, act_con_cel_win.all, log_con_cel_reg.all);
[act_reg_con_fra_cel.inh, act_reg_con_win_cel.inh, act_reg_con_win.inh] = ...
    ext_act_reg(act_con_fra_cel.inh, act_con_cel_win.inh, log_con_cel_reg.inh);
[act_reg_con_fra_cel.exc, act_reg_con_win_cel.exc, act_reg_con_win.exc] = ...
    ext_act_reg(act_con_fra_cel.exc, act_con_cel_win.exc, log_con_cel_reg.exc);
end

function act_reg_tri_win = cal_act_reg_tri_win(act_cel_tri_win, log_cel_reg)
%global n_reg_for%ed
act_reg_tri_win = cell(n_reg_for, 1);
for reg = 1:n_reg_for
    dff_cel_tri_win = act_cel_tri_win(log_cel_reg(:, reg));
    act_reg_tri_win{reg} = mean(cat(3, dff_cel_tri_win{:}), 3);
end
end

% function [log_cel_con, log_cel] =
% ext_log_res_tes_cel_con(act_cel_tri_win)%ed
% n_cel = length(act_cel_tri_win);
% %global n_con win_num_bas tri_num_tri_con win_num_ear%ed
% log_cel_con.res = false(n_cel, n_con);
% log_cel_con.inh = false(n_cel, n_con);
% log_cel_con.exc = false(n_cel, n_con);
% for cel = 1:n_cel
%     for con = 1:n_con
%         if ~isnan(act_cel_tri_win{cel}(tri_num_tri_con(1, con), win_num_bas))
%             [~, log_cel_con.res(cel, con)] = ...
%                 signrank(act_cel_tri_win{cel}(tri_num_tri_con(:, con), win_num_bas), ...
%                 act_cel_tri_win{cel}(tri_num_tri_con(:, con), win_num_ear));
%             [~, log_cel_con.inh(cel, con)] = ...
%                 signrank(act_cel_tri_win{cel}(tri_num_tri_con(:, con), win_num_bas), ...
%                 act_cel_tri_win{cel}(tri_num_tri_con(:, con), win_num_ear),  'tail', 'right');
%             [~, log_cel_con.exc(cel, con)] = ...
%                 signrank(act_cel_tri_win{cel}(tri_num_tri_con(:, con), win_num_bas), ...
%                 act_cel_tri_win{cel}(tri_num_tri_con(:, con), win_num_ear),  'tail', 'left');
%         end
%     end
% end
% log_cel = log_cel_con.res(:, 1) | log_cel_con.res(:, 2) | log_cel_con.res(:, 3);
% end

function [act_reg_con_fra_cel, act_reg_con_win_cel, act_reg_con_win] = ...
    ext_act_reg(act_con_fra_cel, act_con_cel_win, log_con_cel_reg)
%global n_win n_con n_reg_for%ed
act_reg_con_fra_cel = cell(n_reg_for, n_con);
act_reg_con_win_cel = cell(n_reg_for, 1);
act_reg_con_win = cell(n_reg_for, 1);
for k = 1:n_reg_for
    act_reg_con_win_cel{k} = cell(n_con, n_win.tri);
    act_reg_con_win{k} = nan(n_con, n_win.tri);
    for i = 1:n_con
        act_reg_con_fra_cel{k, i} = act_con_fra_cel{i}(:, log_con_cel_reg{i}(:, k));
        for l = 1:n_win.tri
            act_reg_con_win_cel{k}{i, l} = act_con_cel_win{i}(log_con_cel_reg{i}(:, k), l);
            act_reg_con_win{k}(i, l) = mean(act_reg_con_win_cel{k}{i, l}, 'omitnan');
        end
    end
end
end
%
function dff_con_win_cel = cal_dff_con_win_cel(dff_con_fra_cel)
con_fil = matfile('\\home.ansatt.ntnu.no\kadiram\Documents\MATLAB\con_esp.mat');
tim_fra = con_fil.tim_fra;
tim_fra = tim_fra.cal.one.tri.dff;
win_len = con_fil.win_len;
win_len = win_len.dff.one;
n_win = con_fil.n_win;
n_win = n_win.tri;
%global n_con%ed
dff_con_win_cel = cell(n_con, n_win);
dff_con_cel_win = cell(n_con, 1);
for i = 1:n_con
    dff_con_cel_win{i} = com_ave_amp_uni_win(tim_fra, dff_con_fra_cel{i}, win_len);
    for l = 1:n_win
        dff_con_win_cel{i, l} = dff_con_cel_win{i}(:, l);
    end
end
end

function [pcc_reg_xri_xri, pcc_reg_con, euc_dis_reg_xri_xri, euc_dis_reg_con] = ext_pcc_euc...
    (log_cel_reg, act_con_cel_win, act_win_cel_tri)
%global n_reg_for n_con n_win_tot dim_top_bot n_xri n_tri_con_mod
%n_tri_con%ed
act_reg_con_win_cel = cell(n_reg_for, 1);
act_reg_cel_tri = cell(n_reg_for, 1);
win_num = 2;
for k = 1:n_reg_for
    act_reg_con_win_cel{k} = cell(n_con, n_win_tot);
    for i = 1:n_con
        for l = 1:n_win_tot
            act_reg_con_win_cel{k}{i, l} = act_con_cel_win{i}(log_cel_reg(:, k), l);
        end
    end
    act_reg_cel_tri{k} = act_win_cel_tri{win_num}(log_cel_reg(:, k), :);
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
n_cel_reg = sum(log_cel_reg, dim_top_bot);
[pcc_reg_xri_xri, euc_dis_reg_xri_xri] = com_pcc_reg_xri_xri(n_cel_reg, act_reg_con_win_cel, ...
    act_reg_cel_tri);
%
log_con_row_col = cell(n_con, 1);
for i = 1:n_con
    log_con_row_col{i} = false(n_xri, n_xri);
    sta_ind_row = (i - 1)*n_tri_con_mod + 2;
    sta_ind_col = (i - 1)*n_tri_con_mod + 1;
    log_con_row_col{i}(sta_ind_row:sta_ind_row + n_tri_con - 2, ...
        sta_ind_col:sta_ind_col + n_tri_con - 2) = true;
    log_con_row_col{i} = triu(log_con_row_col{i}, 1);
end
%
pcc_reg_con = nan(n_reg_for, n_con);
euc_dis_reg_con = nan(n_reg_for, n_con);
for k = 1:n_reg_for
    for i = 1:n_con
        pcc_reg_con(k, i) = mean(pcc_reg_xri_xri{k}(log_con_row_col{i}));
        euc_dis_reg_con(k, i) = mean(euc_dis_reg_xri_xri{k}(log_con_row_col{i}));
    end
end
end

function [pcc_reg_xri_xri, euc_dis_reg_xri_xri] = com_pcc_reg_xri_xri(n_cel_reg, ...
    nfr_reg_con_win_cel, nfr_reg_cel_tri)
%global n_reg_for n_tri_con n_con%ed
nfr_reg_cel_xri = cell(n_reg_for, 1);
n_tri_con_mod = n_tri_con + 1;
n_xri = n_tri_con_mod*n_con;
pcc_reg_xri_xri = cell(n_reg_for, 1);
euc_dis_reg_xri_xri = cell(n_reg_for, 1);
for j = 1:n_reg_for
    n_cel = n_cel_reg(j);
    if n_cel > 1
        con_num = 0;
        nfr_reg_cel_xri{j} = nan(n_cel, n_xri);
        for i = 1:n_xri
            if mod(i, n_tri_con_mod) == 0
                con_num = i/n_tri_con_mod;
                nfr_reg_cel_xri{j}(:, i) = nfr_reg_con_win_cel{j}{con_num, 2};
            else
                nfr_reg_cel_xri{j}(:, i) = nfr_reg_cel_tri{j}(:, i - con_num);
            end
        end
        pcc_reg_xri_xri{j} = corrcoef(nfr_reg_cel_xri{j});
        euc_dis_reg_xri_xri{j} = pdist2(nfr_reg_cel_xri{j}', nfr_reg_cel_xri{j}');
    else
        pcc_reg_xri_xri{j} = nan(n_xri, n_xri);
        euc_dis_reg_xri_xri{j} = nan(n_xri, n_xri);
    end
end
end

% function [dff_reg_fra_cel, dff_reg_win_cel] = ext_dff_reg_fra_cel(dff_fra_cel, log_cel_reg)
% con_fil = matfile('\\home.ansatt.ntnu.no\kadiram\Documents\MATLAB\con_esp.mat');
% n_win = con_fil.n_win;
% n_reg_for = con_fil.n_reg_for;
% tim_fra = con_fil.tim_fra;
% win_len = con_fil.win_len;
% %
% dff_cel_win = com_ave_amp_uni_win(tim_fra.cal.one.tri.dff, dff_fra_cel, win_len.dff.one);
% %
% dff_reg_fra_cel = cell(n_reg_for, 1);
% dff_reg_win_cel = cell(n_reg_for, 1);
% for reg = 1:n_reg_for
%     dff_reg_win_cel{reg} = cell(1, n_win.tri);
%     dff_reg_fra_cel{reg, 1} = dff_fra_cel(:, log_cel_reg(:, reg));
%     for win = 1:n_win.tri
%         dff_reg_win_cel{reg}{1, win} = dff_cel_win(log_cel_reg(:, reg), win);
%     end
% end
% end

function res_row_col = ext_res_row_col(cel_row_col, res_cel)
n_cel = max(max(cel_row_col));
% generate cellular map data
[n_row, n_col] = size(cel_row_col);
res_row_col = zeros(n_row, n_col);
for i = 1:n_cel
    log_lab_i = cel_row_col == i;
    res_row_col(log_lab_i) = res_cel(i);
end
end

function [log_cel_reg, pcc_blo, acc_epo_xre, cor_coe_epo_reg_blo] = ext_thr_dat(obj, fie)
rec_fil = matfile(obj.fil_pat_rec);
res_reg_con_win_uni = rec_fil.act_reg_con_win_cel;
res_reg_con_win_uni = res_reg_con_win_uni.dff.raw.tri.all;
reg = 1;
res_con_win_uni = res_reg_con_win_uni{reg};
res_cel = res_con_win_uni{3, 2};
con_fil = matfile('\\home.ansatt.ntnu.no\kadiram\Documents\MATLAB\con_esp.mat');
res_thr = con_fil.res_thr;% calculated and saved through 'sam'!
n_reg_for = con_fil.n_reg_for;
log_raw_cel = res_cel > res_thr.low.(fie) & res_cel < res_thr.upp.(fie);
log_rec_cel_reg = rec_fil.log_cel_reg;
log_cel_reg = log_rec_cel_reg.rem & repmat(log_raw_cel, 1, n_reg_for);
log_cel = log_cel_reg(:, reg);
act_fra_cel = rec_fil.act_fra_cel;
dff_fra_cel = act_fra_cel.dff.raw.sli;
dff_fra_cel = dff_fra_cel(:, log_cel);% cell selection!
dis_cel_cel = rec_fil.dis_cel_cel;
dis_cel_cel = dis_cel_cel(log_cel, log_cel');
epo = 6;% during high intensity vibrations
pcc_blo = com_for_pcc_blo(dff_fra_cel, dis_cel_cel, epo);
%
log_tot_cel_reg = rec_fil.log_tot_cel_reg;
n_reg_tot = con_fil.n_reg_tot;
log_tot_cel_reg.thr = log_tot_cel_reg.rem & repmat(log_raw_cel, 1, n_reg_tot);
[~, cor_coe_epo_reg_blo, ~, ~, ~, ~, ~, acc_epo_xre] = com_syn(...
    act_fra_cel, log_cel_reg, obj, rec_fil.cel_lab_row_col, log_tot_cel_reg.thr);
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% elbow
function [ioi_kxx, ioi_shu_kxx, del_ioi_kxx] = ext_clu_ana(dff_fra_cel)
dff_cel_fra = dff_fra_cel';
con_fil = matfile('\\home.ansatt.ntnu.no\kadiram\Documents\MATLAB\con_esp.mat');
n_kxx = con_fil.n_kxx;
[n_cel, n_fra, ioi_kxx] = ext_clu(dff_cel_fra, n_kxx);
r_mat = zeros(n_cel, n_fra);
parfor i = 1:n_cel
    dff_sli_fra = dff_cel_fra(i, :);
    r_mat(i, :) = dff_sli_fra(randperm(n_fra));% per cell, frames are permuted.
end
[~, ~, ioi_shu_kxx] = ext_clu(r_mat, n_kxx);
del_ioi_kxx = ioi_shu_kxx - ioi_kxx;
end

% kmeans clustering
function [n_cel, n_fra, ioi_kxx] = ext_clu(dff_cel_fra, n_kxx)
[n_cel, n_fra] = size(dff_cel_fra);
ioi_kxx = nan(1, n_kxx);%intra over inter ?
parfor i = 1:n_kxx
    [~, ~, sum_dis_clu, D] = ...
        kmeans(dff_cel_fra, i, 'Distance', 'correlation', 'MaxIter', 100, 'replicates', 50);
    ioi_kxx(1, i) = sum(sum_dis_clu)/mean(sum(D));% per k, ioi is calculated.
end
end

function [acc_epo_reg_pai, cor_coe_epo_reg_blo, per_pai_epo_reg_bin, ske_epo_reg, acc_epo_reg, ...
    per_pai_epo_xre_bin, ske_epo_xre, acc_epo_xre, factor_meter, xcc_epo_blo, ...
    cor_coe_reg_blo, xcc_blo] = com_syn(act_fra_cel, log_cel_reg, obj, cel_lab_row_col, ...
    log_tot_cel_reg)
con_fil = matfile('\\home.ansatt.ntnu.no\kadiram\Documents\MATLAB\con_esp.mat');
n_reg_for = con_fil.n_reg_for;
n_cro_tot = con_fil.n_cro_tot;
reg_cro_ind = con_fil.reg_cro_ind;
n_epo = con_fil.n_epo;
fra_epo_sam = con_fil.fra_epo_sam;
fra_epo_sam = fra_epo_sam.one;
n_reg_tot = con_fil.n_reg_tot;
n_sid = con_fil.n_sid;
factor_meter = ext_factor_meter(obj.fil_pat_met_cal);
[~, dis_cel_cel] = ext_cen_sub_cel_dim(cel_lab_row_col, factor_meter);
[dis_reg_tot_cel_cel, dis_sid_cel_cel] = com_dis_reg_cel_cel(dis_cel_cel, log_tot_cel_reg);
% dis_reg_cel_cel distance, problem cell already removed !!!

% calc n_pai_reg beforehand !!!!! - can be done before sync, at

% distance.
cor_coe_epo_cel_cel = cell(n_epo.tot, 1);
cor_coe_epo_reg_tot_cel_cel = cell(n_epo.tot, n_reg_tot);
cor_coe_epo_sid_cel_cel = cell(n_epo.tot, n_sid);
%
cor_coe_epo_reg_cel_cel = cell(n_epo.tot, n_reg_for);
cor_coe_epo_reg_pai = cell(n_epo.tot, n_reg_for);
acc_epo_reg_pai = cell(n_epo.tot, n_reg_for);% absolute corr coe
cor_coe_epo_reg_blo.all = cell(n_epo.tot, n_reg_for);
cor_coe_epo_reg_blo.pos = cell(n_epo.tot, n_reg_for);
cor_coe_epo_reg_blo.neg = cell(n_epo.tot, n_reg_for);
%
xcc_epo_blo.all = cell(n_epo.tot, 1);
xcc_epo_blo.pos = cell(n_epo.tot, 1);
xcc_epo_blo.neg = cell(n_epo.tot, 1);
for j = 1:n_epo.tot
    cor_coe_epo_cel_cel{j} = corr(act_fra_cel(fra_epo_sam{j}, :));
    for i = 1:n_reg_tot
        cor_coe_epo_reg_tot_cel_cel{j, i} = cor_coe_epo_cel_cel{j}(log_tot_cel_reg(:, i), ...
            log_tot_cel_reg(:, i));
    end
    
    % for xcc, only pairs in different regions are considered
    [~, cor_coe_sid_cel_cel] = com_dis_reg_cel_cel(cor_coe_epo_cel_cel{j}, log_tot_cel_reg);%here!
    cor_coe_epo_sid_cel_cel{j, 1} = cor_coe_sid_cel_cel{1};
    cor_coe_epo_sid_cel_cel{j, 2} = cor_coe_sid_cel_cel{2};
    % in one hemisphere
    xcc_sin_blo = cal_xcc_sin_blo(dis_sid_cel_cel, cor_coe_epo_sid_cel_cel, j);
    xcc_epo_blo.all{j, 1} = xcc_sin_blo.all;
    xcc_epo_blo.pos{j, 1} = xcc_sin_blo.pos;
    xcc_epo_blo.neg{j, 1} = xcc_sin_blo.neg;
    %
    for i = 1:n_reg_for
        cor_coe_epo_reg_cel_cel{j, i} = cor_coe_epo_cel_cel{j}(log_cel_reg(:, i), ...
            log_cel_reg(:, i));
        cor_coe_epo_reg_pai{j, i} = ext_upp(cor_coe_epo_reg_cel_cel{j, i});
        acc_epo_reg_pai{j, i} = abs(cor_coe_epo_reg_pai{j, i});
        cor_coe_blo = com_cor_coe_blo(dis_reg_tot_cel_cel, cor_coe_epo_reg_tot_cel_cel, j, i);
        cor_coe_epo_reg_blo.all{j, i} = cor_coe_blo.all;
        cor_coe_epo_reg_blo.pos{j, i} = cor_coe_blo.pos;
        cor_coe_epo_reg_blo.neg{j, i} = cor_coe_blo.neg;
    end
end
cor_coe_reg_blo = cal_cor_coe_reg_blo(cor_coe_epo_reg_blo);
xcc_blo = cal_xcc_blo(xcc_epo_blo);
% abs cor coe
acc_epo_reg = cellfun(@mean, acc_epo_reg_pai);
[per_pai_epo_reg_bin, ske_epo_reg] = cellfun(@com_per_pai_bin, acc_epo_reg_pai, ...
    'UniformOutput', false);
%%%%%%%%%%%%% xre, for the diagram
cor_coe_epo_xre_cel_cel = cell(n_epo.tot, n_cro_tot);
cor_coe_epo_xre_pai = cell(n_epo.tot, n_cro_tot);
acc_epo_xre_pai = cell(n_epo.tot, n_cro_tot);
acc_epo_xre = nan(n_epo.tot, n_cro_tot);
for j = 1:n_epo.tot
    for i = 1:n_cro_tot
        cor_coe_epo_xre_cel_cel{j, i} = cor_coe_epo_cel_cel{j}(...
            log_tot_cel_reg(:, reg_cro_ind(i, 1)), log_tot_cel_reg(:, reg_cro_ind(i, 2)));
        cor_coe_epo_xre_pai{j, i} = ext_upp(cor_coe_epo_xre_cel_cel{j, i});
        acc_epo_xre_pai{j, i} = abs(cor_coe_epo_xre_pai{j, i});
        acc_epo_xre(j, i) = mean(acc_epo_xre_pai{j, i});
    end
end
[per_pai_epo_xre_bin, ske_epo_xre] = cellfun(@com_per_pai_bin, acc_epo_xre_pai, 'UniformOutput', false);
end

function [dis_reg_cel_cel, dis_sid_cel_cel] = com_dis_reg_cel_cel(dis_cel_cel, log_cel_reg)
[~, n_reg] = size(log_cel_reg);
dis_reg_cel_cel = cell(n_reg, 1);
dis_xre_cel_cel = dis_cel_cel;
for i = 1:n_reg
    dis_reg_cel_cel{i} = dis_cel_cel(log_cel_reg(:, i), log_cel_reg(:, i));
    dis_xre_cel_cel(log_cel_reg(:, i), log_cel_reg(:, i)) = nan;% here !
end
con_fil = matfile('\\home.ansatt.ntnu.no\kadiram\Documents\MATLAB\con_esp.mat');
n_sid = con_fil.n_sid;
dis_sid_cel_cel = cell(n_sid, 1);
log_cel_sid = ext_log_cel_sid(log_cel_reg);
dis_sid_cel_cel{1} = dis_xre_cel_cel(log_cel_sid(:, 1), log_cel_sid(:, 1));
dis_sid_cel_cel{2} = dis_xre_cel_cel(log_cel_sid(:, 2), log_cel_sid(:, 2));
end

function log_cel_sid = ext_log_cel_sid(log_tot_cel_reg)
con_fil = matfile('\\home.ansatt.ntnu.no\kadiram\Documents\MATLAB\con_esp.mat');
n_reg_for_cro = con_fil.n_reg_for_cro;
n_reg_tot = con_fil.n_reg_tot;
n_sid = con_fil.n_sid;
log_cel_sid = false(size(log_tot_cel_reg, 1), n_sid);
for i = 1:n_reg_tot
    if i <= n_reg_for_cro
        log_cel_sid(:, 1) = log_cel_sid(:, 1) | log_tot_cel_reg(:, i);
    else
        log_cel_sid(:, 2) = log_cel_sid(:, 2) | log_tot_cel_reg(:, i);
    end
end
end

% for one-plane rec
function pcc_blo = com_for_pcc_blo(act_fra_cel, dis_cel_cel, epo_num)
con_fil = matfile('\\home.ansatt.ntnu.no\kadiram\Documents\MATLAB\con_esp.mat');
dis_blo = con_fil.dis_blo;
fra_epo_sam = con_fil.fra_epo_sam;
n_blo = length(dis_blo.xre);
pcc_blo.all = nan(n_blo, 1);
pcc_blo.pos = nan(n_blo, 1);
pcc_blo.neg = nan(n_blo, 1);
if ~isempty(act_fra_cel)
    cor_coe_cel_cel = corr(act_fra_cel(fra_epo_sam.one{epo_num}, :));
    cor_coe_blo_pai = cal_cor_coe_blo_pai(dis_cel_cel, cor_coe_cel_cel, dis_blo.xre);
    for blo = 1:n_blo
        cor_coe_pai = cor_coe_blo_pai{blo};
        pcc_blo.all(blo) = mean(cor_coe_pai);
        pcc_blo.pos(blo) = mean(cor_coe_pai(cor_coe_pai > 0));
        pcc_blo.neg(blo) = mean(cor_coe_pai(cor_coe_pai < 0));
    end
end
end

function cor_coe_blo = com_cor_coe_blo(dis_reg_tot_cel_cel, cor_coe_epo_reg_tot_cel_cel, ...
    epo_num, reg_num)
if reg_num == 2 % hab
    reg_tot_num = 1;
elseif reg_num > 3
    reg_tot_num = reg_num - 2;
end
con_fil = matfile('\\home.ansatt.ntnu.no\kadiram\Documents\MATLAB\con_esp.mat');
dis_blo = con_fil.dis_blo;
ind_sub_reg = con_fil.ind_sub_reg;
n_blo = length(dis_blo.wre);
cor_coe_blo.all = nan(n_blo, 1);
cor_coe_blo.pos = nan(n_blo, 1);
cor_coe_blo.neg = nan(n_blo, 1);
if ismember(reg_num, ind_sub_reg)
    [cor_coe_lef_blo_pai, cor_coe_rig_blo_pai] = cal_lef_rig(dis_reg_tot_cel_cel, ...
        cor_coe_epo_reg_tot_cel_cel, epo_num, reg_tot_num);
    for i = 1:n_blo
        cor_coe_pai = [cor_coe_lef_blo_pai{i}; cor_coe_rig_blo_pai{i}];% left, right pairs are pooled.
        cor_coe_blo.all(i) = mean(cor_coe_pai);
        cor_coe_blo.pos(i) = mean(cor_coe_pai(cor_coe_pai > 0));
        cor_coe_blo.neg(i) = mean(cor_coe_pai(cor_coe_pai < 0));
    end
end
end

function [cor_coe_lef_blo_pai, cor_coe_rig_blo_pai] = cal_lef_rig(dis_reg_tot_cel_cel, ...
    cor_coe_epo_reg_tot_cel_cel, epo_num, reg_tot_num)
con_fil = matfile('\\home.ansatt.ntnu.no\kadiram\Documents\MATLAB\con_esp.mat');
ind_reg_sid = con_fil.ind_reg_sid;
dis_blo = con_fil.dis_blo;
cor_coe_lef_blo_pai = cal_cor_coe_blo_pai(dis_reg_tot_cel_cel{ind_reg_sid(reg_tot_num, 1)}, ...
    cor_coe_epo_reg_tot_cel_cel{epo_num, ind_reg_sid(reg_tot_num, 1)}, dis_blo.wre);
cor_coe_rig_blo_pai = cal_cor_coe_blo_pai(dis_reg_tot_cel_cel{ind_reg_sid(reg_tot_num, 2)}, ...
    cor_coe_epo_reg_tot_cel_cel{epo_num, ind_reg_sid(reg_tot_num, 2)}, dis_blo.wre);
end

function r_blo_pai = cal_cor_coe_blo_pai(dis_cel_cel, cor_coe_cel_cel, dis_blo)
n_blo = length(dis_blo);
r_blo_pai = cell(n_blo, 1);
for i = 1:n_blo
    if i == 1
        log_cel_cel = dis_cel_cel > 0 & dis_cel_cel <= dis_blo(i);
    else
        log_cel_cel = dis_cel_cel > dis_blo(i - 1) & dis_cel_cel <= dis_blo(i);
    end
    log_upp_cel_cel = triu(log_cel_cel, 1);
    r_blo_pai{i} = cor_coe_cel_cel(log_upp_cel_cel);
end
end

function xcc_sin_blo = cal_xcc_sin_blo(dis_sid_cel_cel, cor_coe_epo_sid_cel_cel, epo_num)
con_fil = matfile('\\home.ansatt.ntnu.no\kadiram\Documents\MATLAB\con_esp.mat');
dis_blo = con_fil.dis_blo;
n_blo = con_fil.n_blo;
cor_coe_lef_blo_pai = cal_cor_coe_blo_pai(dis_sid_cel_cel{1}, cor_coe_epo_sid_cel_cel{epo_num, 1}, ...
    dis_blo.xre);
cor_coe_rig_blo_pai = cal_cor_coe_blo_pai(dis_sid_cel_cel{2}, cor_coe_epo_sid_cel_cel{epo_num, 2}, ...
    dis_blo.xre);
xcc_sin_blo.all = nan(n_blo.xre, 1);
xcc_sin_blo.pos = nan(n_blo.xre, 1);
xcc_sin_blo.neg = nan(n_blo.xre, 1);
for i = 1:n_blo.xre
    cor_coe_pai = [cor_coe_lef_blo_pai{i}; cor_coe_rig_blo_pai{i}];% left, right pairs are pooled.
    xcc_sin_blo.all(i) = mean(cor_coe_pai);
    xcc_sin_blo.pos(i) = mean(cor_coe_pai(cor_coe_pai > 0));
    xcc_sin_blo.neg(i) = mean(cor_coe_pai(cor_coe_pai < 0));
end
end

function cor_coe_reg_blo = cal_cor_coe_reg_blo(cor_coe_epo_reg_blo)
con_fil = matfile('\\home.ansatt.ntnu.no\kadiram\Documents\MATLAB\con_esp.mat');
n_reg_for = con_fil.n_reg_for;
n_blo = con_fil.n_blo;
ind_fun_epo = con_fil.ind_fun_epo;
n_epo = con_fil.n_epo;
cor_coe_reg_blo.all = cell(1, n_reg_for);
cor_coe_reg_blo.pos = cell(1, n_reg_for);
cor_coe_reg_blo.neg = cell(1, n_reg_for);
%
cor_coe_reg_blo_epo.all = cell(1, n_reg_for);
cor_coe_reg_blo_epo.pos = cell(1, n_reg_for);
cor_coe_reg_blo_epo.neg = cell(1, n_reg_for);
for i = 1:n_reg_for
    cor_coe_reg_blo_epo.all{i} = nan(n_blo.wre, n_epo.fun);
    cor_coe_reg_blo_epo.pos{i} = nan(n_blo.wre, n_epo.fun);
    cor_coe_reg_blo_epo.neg{i} = nan(n_blo.wre, n_epo.fun);
    ite = 0;
    for j = ind_fun_epo
        ite = ite + 1;
        cor_coe_reg_blo_epo.all{i}(:, ite) = cor_coe_epo_reg_blo.all{j, i};
        cor_coe_reg_blo_epo.pos{i}(:, ite) = cor_coe_epo_reg_blo.pos{j, i};
        cor_coe_reg_blo_epo.neg{i}(:, ite) = cor_coe_epo_reg_blo.neg{j, i};
    end
    cor_coe_reg_blo.all{i} = mean(cor_coe_reg_blo_epo.all{i}, 2);
    cor_coe_reg_blo.pos{i} = mean(cor_coe_reg_blo_epo.pos{i}, 2);
    cor_coe_reg_blo.neg{i} = mean(cor_coe_reg_blo_epo.neg{i}, 2);
end
end

function xcc_blo = cal_xcc_blo(xcc_epo_blo)% averaging across epochs
con_fil = matfile('\\home.ansatt.ntnu.no\kadiram\Documents\MATLAB\con_esp.mat');
n_blo = con_fil.n_blo;
ind_fun_epo = con_fil.ind_fun_epo;
n_epo = con_fil.n_epo;
xcc_blo_epo.all = nan(n_blo.xre, n_epo.fun);
xcc_blo_epo.pos = nan(n_blo.xre, n_epo.fun);
xcc_blo_epo.neg = nan(n_blo.xre, n_epo.fun);
ite = 0;
for j = ind_fun_epo
    ite = ite + 1;
    xcc_blo_epo.all(:, ite) = xcc_epo_blo.all{j, 1};
    xcc_blo_epo.pos(:, ite) = xcc_epo_blo.pos{j, 1};
    xcc_blo_epo.neg(:, ite) = xcc_epo_blo.neg{j, 1};
end
xcc_blo.all = mean(xcc_blo_epo.all, 2);
xcc_blo.pos = mean(xcc_blo_epo.pos, 2);
xcc_blo.neg = mean(xcc_blo_epo.neg, 2);
end

function clu_sel = cal_clu_sel(clu_cel, k)
fre_clu = zeros(k, 1);
[B,BG,~] = groupcounts(clu_cel);
fre_clu(BG) = B;
clu_sel = cal_spa_ind(fre_clu);
end

function [slo_reg_cel, tac_sam, act_reg_sam_cel, coe_det_reg_cel] = cal_slo_reg_cel(tac_tri_win, ...
    act_cel_tri_win, n_cel_reg, log_cel_reg)
con_fil = matfile('\\home.ansatt.ntnu.no\kadiram\Documents\MATLAB\con_esp.mat');
n_reg = con_fil.n_reg_for_cro;
slo_reg_cel = cell(n_reg, 1);
coe_det_reg_cel = cell(n_reg, 1);
act_reg_sam_cel = cell(n_reg, 1);

log_tri_con = con_fil.log_tri_con;
log_tri_con = log_tri_con.vrs;
log_tri = log_tri_con(:, 3);

%log_tri = true(18, 1);

%log_tri = log_tri_con(:, 1) | log_tri_con(:, 3);

win = 2;
tac_tri = tac_tri_win(log_tri, win);
n_cel_reg = n_cel_reg.rem;
log_reg = con_fil.log_com_reg;
n_cel_reg = n_cel_reg(log_reg);
log_cel_reg = log_cel_reg.rem(:, log_reg);
%
n_sam = 100;
tac_sam = linspace(min(tac_tri), max(tac_tri), n_sam)';
for reg = 1:n_reg
    n_cel = n_cel_reg(reg);
    log_cel = log_cel_reg(:, reg);
    act_tem_cel_tri_win = act_cel_tri_win(log_cel);
    act_reg_sam_cel{reg} = nan(n_sam, n_cel);
    for cel = 1:n_cel
        act_tri = act_tem_cel_tri_win{cel}(log_tri, win);
        lmx = fitlm(tac_tri, act_tri);
        beta = lmx.Coefficients.Estimate;
        slo_reg_cel{reg}(cel) = beta(2);
        coe_det_reg_cel{reg}(cel) = lmx.Rsquared.Ordinary;
        act_reg_sam_cel{reg}(:, cel) = predict(lmx, tac_sam);
    end
end
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% axo-cel
function mean_per_block = cal_mean_per_block(readMetadata, blockLength, im)
% starts motioncorrection for plane specified by planeIndex, 
% currently estimating only translation
% Parameters:
%     workingDir - Path for saving the results
%     readData - function handle to read in a t-th time frame
%     readMetadata - function handle to retrieve information about the dataset
%     GPUflag - use GPU support (boolean)
%     blockLength - length of time blocks in which alignment problem is split
%     referenceSize - start Alignment with reference to the mean of the
%                                                   first 'referenceSize' frames 
%     refVol - array, has to habe same dimension as data, is used as
%         alignment reference, if emptz create own reference image by using
%         the begnning of the data
metadata = readMetadata();
n_fra = size(im, 3);
n_blo = ceil(n_fra/blockLength);
mean_per_block = zeros([metadata.dim(1:2) n_blo],'uint16');
for blo_num = 1:n_blo% kadir
    disp([num2str(blo_num) '/' num2str(n_blo) ' Blocks' ])
    tStart = (blo_num - 1)*blockLength + 1;
    tStop = min(blo_num*blockLength, n_fra);
    mean_per_block(:, :, blo_num) = mean(im(:, :, tStart:tStop), 3);
end
end

function ica_filters = ext_ica_filters(piv_row_col_fra, nPC)
flims = [];
dsamp = [];
badframes = 1;
[mixedsig, mixedfilters, CovEvals, ~, ~, ~] = CellsortPCA(piv_row_col_fra, flims, ...
    nPC, dsamp, badframes);
PCuse = 1:nPC;
mu = 0.5;
nIC = nPC;
ica_A_guess = [];
termtol = [];
maxrounds = [];
[~, ica_filters, ~, ~] = CellsortICA(mixedsig, mixedfilters, CovEvals, PCuse, mu, ...
    nIC, ica_A_guess, termtol, maxrounds);
end

function detectROI(workingDir, confPath, keyword, detectionTimepoint, windowSize, windowStep, ...
    planeIndex, includeMask, excludeMask)
%This is the main function for initiationg the cell detection 
% Inputs:
%     workingDir - Path to aligned data including separator at the end
%     keyword - keyword, is used to resume previous alignment attempts
%     confPath - path to configfiles (.json)
%     detectionTimepoint - (int), in which mean per block to detect cells
%     planeIndex - (int) which plane to use
%     windowSize - (int) how many mean per blocks to average for
%       templatematching
%% Creating folder, if previous Celldetection Found, set a resume flag
dirTemp=dir([workingDir filesep 'celldetection_' keyword '*']);
if isempty(dirTemp)
    mkdir([workingDir filesep 'celldetection_' keyword]);
    mkdir([workingDir 'celldetection_' keyword filesep 'celldetection_plane'  num2str(planeIndex)]);
    resumeFlag=false;
else
    if not(isempty(dir([workingDir 'celldetection_' keyword filesep 'celldetection_plane'  num2str(...
            planeIndex)])))
        disp('Previous celldetection found for this keyword, trying to resum celldetection....')
        resumeFlag=true;
    else
        mkdir([workingDir 'celldetection_' keyword filesep 'celldetection_plane'  num2str(planeIndex)]);
        resumeFlag=false;
    end
end
if not(resumeFlag)
    %load([workingDir 'metadata.mat']);%ed
    metadata.Plane(planeIndex).CellDetection.method='semi-automatic template matching';
    save([workingDir 'celldetection_' keyword filesep 'celldetection_plane'  num2str(planeIndex) ...
        filesep 'metadata_' num2str(planeIndex) '.mat'], 'metadata');
end
%% Start Finding ROIs
disp('Using semi-automatic method (template matching) to detect ROIS');
findROI(workingDir, confPath, keyword, detectionTimepoint, windowSize, windowStep, ...
    planeIndex, includeMask, excludeMask)
end

function findROI(workingDir, confPath, keyword, detectionTimepoint, windowSize, windowStep, ...
    planeIndex, includeMask, excludeMask)
% FINDROI - find ROIs from CalciumImaging Data by template matching
% Parameters:
%     workingDir - path to aligned data
%     keyword - keyword for saving and retrieving results
%     confPath - Path to json file, which cotains paramters for celldetection
%     detectionTimepoint - timepoint/\block which is used for templatematching
%     planeIndex - plane to be used in volumetric data
%     windowSize - average n images for celldetection
%% Load additional parameters from metadata and json file
celldetectionDir = ...
    [workingDir 'celldetection_' keyword filesep 'celldetection_plane'  num2str(planeIndex)];
load([celldetectionDir filesep 'metadata_' num2str(planeIndex) '.mat'], 'metadata'); % kadir
params = loadjson(confPath);
%% Read In Images to create the average image where the detection will be performed
end_ind = detectionTimepoint + windowSize - 1;
filename = [workingDir 'mean_per_block_plane', num2str(planeIndex), '.tiff'];
numimgs = size(imfinfo(filename), 1);
while end_ind > numimgs
    end_ind = end_ind - windowStep;
end
meanPerBlockSeries = zeros(metadata.dim(1), metadata.dim(2), windowSize/windowStep, 'uint16');
for i = detectionTimepoint:windowStep:end_ind
    meanPerBlockSeries(:, :, i) = imread(filename, i);
end
timeAverage = mean(meanPerBlockSeries, 3);
%% Filtering and Allocating
highpassFilter = fspecial('gaussian',ceil(params.Celldetection.SigmaHighpassFilter*5), ...
    params.Celldetection.SigmaHighpassFilter);
timeAverageFiltered = timeAverage./imFilter2(highpassFilter,timeAverage);
% mask where the NON-neurons will be save to do not re-detect them

ROImask = zeros(metadata.dim(1),metadata.dim(2)); % mask of the neurons, every time
refImg = uint16(65535./prctile(timeAverage(:), 99.5)*timeAverage(:, :, 1));
%Reference Image for Plotting ROI overlays

%if Highpass Filter FLag is set, use filtered image for templatematching
%(img) -- related to correlation map
if params.Celldetection.HighpassFilterImage
    img = timeAverageFiltered(:,:,1);
else
    img = timeAverage(:,:,1);
end
%% Start semiautomatical segmentation
templatesUsed = struct();
runIndex = 1;
%% Choose Shape To Use
% define function handles for template matching
TemplateMatchHandle=@(im,diam) TemplateMatchRING(im,diam);
shape='ring';
%% Choose Template Size
templateSize = 7; % Neuron diameter to focus on
if params.General.GPUflag
    correlationMap = TemplateMatchHandle(img, templateSize);
end
correlationMapThresholded=correlationMap>params.Celldetection.CorrelationMapThreshold;
% >0.65 almost no cells detected    ; > 0.40 too many cells detected
correlationMapROIsupport=imDilate2(correlationMap > ...
    params.Celldetection.CorrelationMapSupportThreshold,params.Celldetection.ErosionDiameter);
% >0.70 almost no cells detected    ; > 0.45 too many cells detected
correlationMapThresholded = correlationMapThresholded.* correlationMapROIsupport;
maskedImage = includeMask - excludeMask;
correlationMapThresholded = correlationMapThresholded.*maskedImage;
labeledROI = bwlabel(correlationMapThresholded);
labeledROI = imDilate2(labeledROI,params.Celldetection.ErosionDiameter);
labeledROI = labeledROI.*maskedImage;
%% Removing,Adding,Saving
if not(sum(labeledROI(:))==0)
    templatesUsed(runIndex).shape=shape;
    templatesUsed(runIndex).size=templateSize;
    excludeMask(labeledROI~=0)=1; % where there is a cell no cells will be detected anymore
    maskMaximum = max(max(ROImask));
    labeledROI = labeledROI + maskMaximum*ones(size(labeledROI));
    labeledROI(labeledROI==maskMaximum)=0;
    templatesUsed(runIndex).labeledROI=labeledROI;
    ROImask = ROImask + labeledROI;
    runIndex=runIndex+1;
end
showMaskAsOverlay(0.2, ROImask, [1 0 1], refImg);
save([celldetectionDir, filesep,'IM_cell.mat'],'ROImask','-v7.3');
save([celldetectionDir, filesep,'IM_no.mat'],'excludeMask','-v7.3');
save([celldetectionDir, filesep,'templatesUsed.mat'],'templatesUsed','runIndex','-v7.3');
%% ORGANIZE NEURONS:
timeAverage = timeAverageFiltered(:,:,1);
labeledROI = ROImask; %copy, just in case
mask_org = zeros(size(labeledROI));
cells_yes = unique(labeledROI);
cells_yes(1)=[]; 
for i=1:length(cells_yes)
  mask_org(labeledROI==cells_yes(i))=i;
end
labeledROI(mask_org~=0)=1;   %internal border
[gx,gy] = gradient(mask_org);
labeledROI((gx.^2+gy.^2)==0) = 0;
timeAverage2=timeAverage;
timeAverage2(labeledROI==1)=0;
[x,y] = find_center(timeAverage, mask_org);
figure('units','normalized','outerposition',[0 0 1 1]);  imagesc(timeAverage2),...
    set(gca,'XTick',[]),set(gca,'YTick',[]), box off, hold on, scatter(x,fliplr(y), 'filled', 'r'), ...
    hold off
save([celldetectionDir filesep 'mask_org', num2str(planeIndex) ,'.mat'],'mask_org','-v7.3');
%% Updata and Save dataset information into alignment folder
metadata.Plane(planeIndex).CellDetection.Flag=true;
metadata.Plane(planeIndex).CellDetection.templatesUsed=templatesUsed;
metadata.Plane(planeIndex).CellDetection.windowSize=windowSize;
metadata.Plane(planeIndex).CellDetection.sigmaHighpassFilter=params.Celldetection.SigmaHighpassFilter;
save([celldetectionDir filesep 'metadata_' num2str(planeIndex) '.mat'], 'metadata');
end

function roi_t = extractTraces(frameStart, frameStop, workingDir, keyword, planeIndex, ...
    fil_pat_ima_cal)
% extractTraces - extract raw fluroescent traces from after ROI detection
% Parameters:
%     workingDir - path to aligned data
%     keyword - keyword for saving and retrieving results
%     confPath - Path to json file, which cotains paramters for celldetection
%     planeIndex - plane to be used in volumetric data
%% Generate Paths And Get Previous Steps and related saved information
celldetectionDir = [workingDir 'celldetection_' keyword filesep 'celldetection_plane' ...
    num2str(planeIndex)];
mat_fil = matfile(fil_pat_ima_cal);
n_fra = size(mat_fil.im, 3);
if n_fra < frameStop
    frameStop = n_fra;
end
n_fra = frameStop - frameStart + 1;
%% NO tracking only
fil_pat = [celldetectionDir filesep 'mask_org' num2str(planeIndex) '.mat'];
mas_fil = matfile(fil_pat);
mask_org = mas_fil.mask_org;
% We assure that the mask starts labeling from 1

j=0;
mask_tmp = mask_org;
for i=0:(size(unique(mask_tmp))-1)
    mask_org(mask_tmp == i) = j;
    j=j+1;
end
clear mask_tmp
clear j
%% Attempt to extract traces
numberExcludedROIs=0;
n_roi = max(max(mask_org(:,:)));
ROIexcludeFlag = zeros(n_roi,1);
roi_t.traces = zeros(n_roi,n_fra);
sizeFrame = numel(mask_org(:,:));
disp('Loading frames');
loadedData = mat_fil.im(:,:,frameStart:frameStop);
loadedData(isnan(loadedData))=0;
for roi = 1:n_roi
    indices2D = find(mask_org==roi)';
    sizeROI = numel(indices2D);
    indices3D = repmat(indices2D,1,n_fra)+(ceil((1:(sizeROI*n_fra))/sizeROI)-1)*...
        sizeFrame;
    roi_t.traces(roi, 1:n_fra) = mean(reshape(loadedData(indices3D),sizeROI, n_fra),1);
    if any(isinf(roi_t.traces(roi,1:n_fra))+isnan(roi_t.traces(roi,...
            1:n_fra)))
        %if some of the roi of a neuron has infs or nans, the neuron is not considered
        ROIexcludeFlag(roi) = true;
        numberExcludedROIs = numberExcludedROIs + 1;
    end
end
disp (['amount of neurons skipped ',num2str(numberExcludedROIs)])
%% Saving
roi_t.raw = mean(loadedData,3);
roi_t.StartStopframes = frameStart:frameStop;
roi_t.neuronLabels=mask_org;
if  ~exist(celldetectionDir, 'dir')
    mkdir(celldetectionDir)
end
save ([celldetectionDir filesep 'roi_t.mat'],'roi_t','-v7.3');
end

function piv_fra_cel = cal_piv_fra_cel(fil_pat_ima_cal, cel_row_col)
% extractTraces - extract raw fluroescent traces from after ROI detection
% Parameters:
%     workingDir - path to aligned data
%     keyword - keyword for saving and retrieving results
%     confPath - Path to json file, which cotains paramters for celldetection
%     planeIndex - plane to be used in volumetric data
frameStart = 1;
frameStop = 4047;
mat_fil = matfile(fil_pat_ima_cal);
n_fra = size(mat_fil.im, 3);
if n_fra < frameStop
    frameStop = n_fra;
end
n_fra = frameStop - frameStart + 1;
j=0;
mask_tmp = cel_row_col;
for i=0:(size(unique(mask_tmp))-1)
    cel_row_col(mask_tmp == i) = j;
    j=j+1;
end
clear mask_tmp
clear j
%% Attempt to extract traces
n_roi = max(max(cel_row_col(:,:)));
piv_cel_fra = zeros(n_roi, n_fra);
sizeFrame = numel(cel_row_col(:,:));
disp('Loading frames');
loadedData = mat_fil.im(:,:,frameStart:frameStop);
loadedData(isnan(loadedData))=0;
for roi = 1:n_roi
    indices2D = find(cel_row_col==roi)';
    sizeROI = numel(indices2D);
    indices3D = repmat(indices2D,1,n_fra)+(ceil((1:(sizeROI*n_fra))/sizeROI)-1)*...
        sizeFrame;
    piv_cel_fra(roi, 1:n_fra) = mean(reshape(loadedData(indices3D),sizeROI, n_fra),1);
end
piv_fra_cel = piv_cel_fra';
end

function log_pla_row_col = ext_log_pla_row_col(piv_pla_row_col, per_bin_edg, thr)% to exclude
% can/should be programmed to take high_in, low_in as inputs.
con_fil = matfile('\\home.ansatt.ntnu.no\kadiram\Documents\MATLAB\con_esp.mat');
n_pla = con_fil.n_pla;
fun_pla = con_fil.fun_pla;
log_pla_row_col = cell(n_pla.neu.raw, 1);
[high_in, low_in] = ext_hig_low.pea(piv_pla_row_col{1}, per_bin_edg);% according to the 1st.
for j = fun_pla.raw
    piv_row_col = piv_pla_row_col{j};
    piv_row_col = imadjust(piv_row_col, [low_in.rel high_in.rel]);
    dou_row_col = im2double(piv_row_col);
    log_pla_row_col{j} = dou_row_col < thr;% to exclude
end
end

function [r_cel, per_cel_bin, r_pla_icx_row_col, cum_pro_bin, r] = cal_r_cel(dff_fra_cel, ...
    dff_fra, log_cel_pla, cel_pla_row_col)
r_cel.exc = corr(dff_fra_cel, dff_fra.exc);
r_cel.inh = corr(dff_fra_cel, dff_fra.inh);
con_fil = matfile('\\home.ansatt.ntnu.no\kadiram\Documents\MATLAB\con_esp.mat');
cor_coe_edg = con_fil.r_edg;
[per_cel_bin.exc, ~] = cal_per_uni_bin(r_cel.exc, cor_coe_edg);
[per_cel_bin.inh, ~] = cal_per_uni_bin(r_cel.inh, cor_coe_edg);
if nargin > 2
    r_pla_icx_row_col.exc = ext_r_pla_icx_row_col(log_cel_pla, r_cel.exc, cel_pla_row_col);
    r_pla_icx_row_col.inh = ext_r_pla_icx_row_col(log_cel_pla, r_cel.inh, cel_pla_row_col);
else
    r_pla_icx_row_col.exc = nan;
    r_pla_icx_row_col.inh = nan;
end
r_edg = con_fil.r_edg;
[cum_pro_bin.exc, ~] = histcounts(r_cel.exc, r_edg, 'Normalization', 'cdf');
[cum_pro_bin.inh, ~] = histcounts(r_cel.inh, r_edg, 'Normalization', 'cdf');
r.exc = mean(r_cel.exc);
r.inh = mean(r_cel.inh);
end

function r_pla_icx_row_col = ext_r_pla_icx_row_col(log_cel_pla, r_cel, cel_pla_row_col)
con_fil = matfile('\\home.ansatt.ntnu.no\kadiram\Documents\MATLAB\con_esp.mat');
n_pla = con_fil.n_pla;
fun_pla = con_fil.fun_pla;
r_pla_icx_row_col = cell(n_pla.neu.raw, con_fil.n_icx);
for pla = fun_pla.raw
    for j = 1:con_fil.n_icx
        r_pla_icx_row_col{pla, j} = ext_res_row_col(cel_pla_row_col{pla}, r_cel(log_cel_pla(:, pla)));
    end
end
end

% function [x_pla_roi, y_pla_roi, z_pla_roi, x_roi, y_roi, z_roi] = cal_xyz_roi(factor_meter, ...
%     iniStruct, log_pla_roi_row_col)
% con_fil = matfile('\\home.ansatt.ntnu.no\kadiram\Documents\MATLAB\con_esp.mat');
% fun_pla = con_fil.fun_pla;
% n_row = con_fil.n_row;
% n_col = con_fil.n_col;
% n_pla = con_fil.n_pla;
% x_pla_roi = cell(n_pla.neu.raw, 1);
% y_pla_roi = cell(n_pla.neu.raw, 1);
% z_pla_roi = cell(n_pla.neu.raw, 1);
% ite = 0;
% dist_z = str2num(iniStruct.total_z_distance_); %in micrometers
% step_z = dist_z/n_pla.neu.fun;
% for pla_num = fun_pla.raw
%     log_roi_row_col = log_pla_roi_row_col{pla_num};
%     n_roi = length(log_roi_row_col);
%     row_cel = nan(n_roi, 1);
%     col_cel = nan(n_roi, 1);
%     for i = 1:n_roi
%         [row_pix, col_pix] = find(log_roi_row_col{i});
%         row_cel(i) = round(mean(row_pix));
%         col_cel(i) = round(mean(col_pix));
%     end
%     x_pla_roi{pla_num} = (n_row.cal - row_cel + 1)*factor_meter; % rostro-caudal
%     y_pla_roi{pla_num} = (n_col.cal - col_cel + 1)*factor_meter;% origin: bottom right !
%     if pla_num == 1
%         % km: because sawtooth: % taking ratio of depth the same as you are in ypos
%         z_pla_roi{pla_num} = (x_pla_roi{pla_num}/n_row.cal)*step_z;
%     else
%         z_pla_roi{pla_num} = step_z*(n_pla.neu.fun - 1 - ite) + (x_pla_roi{pla_num}/n_row.cal)*step_z;
%         ite = ite + 1;
%     end
% end
% x_roi = vertcat(x_pla_roi{:});
% y_roi = vertcat(y_pla_roi{:});
% z_roi = vertcat(z_pla_roi{:});
% end%ed

function res_pla_row_col = ext_res_pla_row_col(log_pla_roi_row_col, res_roi)
con_fil = matfile('\\home.ansatt.ntnu.no\kadiram\Documents\MATLAB\con_esp.mat');
fun_pla = con_fil.fun_pla;
n_pla = con_fil.n_pla;
n_roi.tak = 0;
res_pla_row_col = cell(n_pla.neu.raw, 1);
n_row = 1536;
n_col = 850;
for pla = fun_pla.raw
    res_pla_row_col{pla} = zeros(n_row, n_col);
    log_roi_row_col = log_pla_roi_row_col{pla};
    n_roi.pla = length(log_roi_row_col);
    rea_roi = res_roi(n_roi.tak + 1:n_roi.tak + n_roi.pla);
    for roi = 1:n_roi.pla
        res_pla_row_col{pla} = res_pla_row_col{pla} + rea_roi(roi)*log_roi_row_col{roi};
    end
end
end

function [cor_fie_fie_roi_cel, r_fie_fie_pai] = cal_cor_fie_fie_roi_cel(dff_fra_roi, log_roi, ...
    dff_fra_cel, log_cel, log_fra, fie_mod, fie_cel)
log_cel_lef = log_cel.lef.all;
log_cel_rig = log_cel.rig.all;
if nargin > 6
    log_cel_lef = log_cel_lef(log_cel.(fie_mod).srt.(fie_cel));
    log_cel_rig = log_cel_rig(log_cel.(fie_mod).srt.(fie_cel));
end
cor_fie_fie_roi_cel.exc.lef = corr(dff_fra_roi(log_fra, log_roi.lef.(fie_mod).exc), dff_fra_cel(...
    log_fra, log_cel_lef));
n_roi = sum(log_roi.lef.(fie_mod).inh);
n_cel = sum(log_cel_lef);
cor_fie_fie_roi_cel.inh.lef = zeros(n_roi, n_cel);
if n_roi > 0
    cor_fie_fie_roi_cel.inh.lef = corr(dff_fra_roi(log_fra, log_roi.lef.(fie_mod).inh), dff_fra_cel(...
        log_fra, log_cel_lef));
end
cor_fie_fie_roi_cel.exc.rig = corr(dff_fra_roi(log_fra, log_roi.rig.(fie_mod).exc), dff_fra_cel(...
    log_fra, log_cel_rig));
cor_fie_fie_roi_cel.inh.rig = corr(dff_fra_roi(log_fra, log_roi.rig.(fie_mod).inh), dff_fra_cel(...
    log_fra, log_cel_rig));
r_fie_fie_pai.exc = [cor_fie_fie_roi_cel.exc.lef(:); cor_fie_fie_roi_cel.exc.rig(:)];
r_fie_fie_pai.inh = [cor_fie_fie_roi_cel.inh.lef(:); cor_fie_fie_roi_cel.inh.rig(:)];



cor_fie_fie_roi_cel.all.lef = corr(dff_fra_roi(log_fra, log_roi.lef.all), dff_fra_cel(...
    log_fra, log_cel_lef));
cor_fie_fie_roi_cel.all.rig = corr(dff_fra_roi(log_fra, log_roi.rig.all), dff_fra_cel(...
    log_fra, log_cel_rig));
r_fie_fie_pai.all = [cor_fie_fie_roi_cel.all.lef(:); cor_fie_fie_roi_cel.all.rig(:)];
end

function cor_fie_fie_blo = cal_cor_fie_fie_blo(dis_fie_pai, r_fie_pai)
con_fil = matfile('\\home.ansatt.ntnu.no\kadiram\Documents\MATLAB\con_esp.mat');
dis_blo = con_fil.dis_blo;
dis_blo = dis_blo.axo;% axo-cel
cor_fie_fie_blo.exc.dat = cal_pcc_blo(dis_fie_pai.exc, r_fie_pai.exc, dis_blo);
cor_fie_fie_blo.inh.dat = cal_pcc_blo(dis_fie_pai.inh, r_fie_pai.inh, dis_blo);
cor_fie_fie_blo.exc.shu = cal_r_blo_shu(dis_fie_pai.exc, r_fie_pai.exc, dis_blo);
cor_fie_fie_blo.inh.shu = cal_r_blo_shu(dis_fie_pai.inh, r_fie_pai.inh, dis_blo);



cor_fie_fie_blo.all.dat = cal_pcc_blo(dis_fie_pai.all, r_fie_pai.all, dis_blo);
cor_fie_fie_blo.all.shu = cal_r_blo_shu(dis_fie_pai.all, r_fie_pai.all, dis_blo);
end

function ind_pla_cel = ext_ind_pla_cel(n_cel_pla)
% log_pla_row_col.all.all
con_fil = matfile('\\home.ansatt.ntnu.no\kadiram\Documents\MATLAB\con_esp.mat');
n_pla = con_fil.n_pla;
fun_pla = con_fil.fun_pla;
n_cel_pla(2) = 0;
end_cel_pla = cumsum(n_cel_pla);
end_cel_pla = end_cel_pla(:);
%sta_cel_pla = [1; (end_cel_pla(1:end - 1) + 1)'];
sta_cel_pla = [1; end_cel_pla(1:end - 1) + 1];
ind_pla_cel = cell(n_pla.neu.raw, 1);
for pla = fun_pla.raw
    ind_pla_cel{pla} = sta_cel_pla(pla):end_cel_pla(pla);
end
end

function dis_fie_pai = cal_dis_fie_pai(coo_roi_dim, log_roi, coo_cel_dim, log_cel, fie_mod, fie_cel)
log_cel_lef = log_cel.lef.all;
log_cel_rig = log_cel.rig.all;
if nargin > 5
    log_cel_lef = log_cel_lef(log_cel.(fie_mod).srt.(fie_cel));
    log_cel_rig = log_cel_rig(log_cel.(fie_mod).srt.(fie_cel));
end
dis_fie_roi_cel.exc.lef = pdist2(coo_roi_dim(log_roi.lef.(fie_mod).exc, :), coo_cel_dim(...
    log_cel_lef, :));
dis_fie_roi_cel.exc.rig = pdist2(coo_roi_dim(log_roi.rig.(fie_mod).exc, :), coo_cel_dim(...
    log_cel_rig, :));
dis_fie_pai.(fie_mod).exc = [dis_fie_roi_cel.exc.lef(:); dis_fie_roi_cel.exc.rig(:)];
%
dis_fie_roi_cel.inh.lef = pdist2(coo_roi_dim(log_roi.lef.(fie_mod).inh, :), coo_cel_dim(...
    log_cel_lef, :));
dis_fie_roi_cel.inh.rig = pdist2(coo_roi_dim(log_roi.rig.(fie_mod).inh, :), coo_cel_dim(...
    log_cel_rig, :));
dis_fie_pai.(fie_mod).inh = [dis_fie_roi_cel.inh.lef(:); dis_fie_roi_cel.inh.rig(:)];
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% axo-onl
function log_pla_icx_row_col = ext_log_pla_icx_row_col(piv_pla_row_col, log_pla_row_col, low_in, ...
    per_bin_edg)
con_fil = matfile('\\home.ansatt.ntnu.no\kadiram\Documents\MATLAB\con_esp.mat');
n_pla = con_fil.n_pla;
fun_pla = con_fil.fun_pla;
log_pla_icx_row_col.glu = cell(n_pla.neu.raw, 1);
thr = 0.1;
log_pla_row_col.exc = ext_log_pla_row_col(piv_pla_row_col, per_bin_edg, thr);
for pla_num = fun_pla.raw
    log_pla_icx_row_col.glu{pla_num, 1} = (piv_pla_row_col{pla_num, 1}.*...
        uint16(log_pla_row_col.axo{pla_num, 1}) > low_in.abs);
    log_pla_icx_row_col.glu{pla_num, 1}(log_pla_row_col.exc{pla_num, 1}) = false;
end
end

function [n_pix_pla, n_pix] = ext_n_pix_pla(log_pla_icx_row_col)
    con_fil = matfile('\\home.ansatt.ntnu.no\kadiram\Documents\MATLAB\con_esp.mat');
    n_pla = con_fil.n_pla;
    fun_pla = con_fil.fun_pla;
    n_pix_pla = nan(n_pla.neu.raw, 1);
    for pla_num = fun_pla.raw
        n_pix_pla(pla_num) = sum(log_pla_icx_row_col{pla_num, 1}, "all");
    end
    n_pix = sum(n_pix_pla, "omitnan");
end

function [x_pla_pix, y_pla_pix, z_pla_pix] = ext_xyz_pla_pix(log_pla_icx_row_col, factor_meter, ...
    iniStruct)
con_fil = matfile('\\home.ansatt.ntnu.no\kadiram\Documents\MATLAB\con_esp.mat');
fun_pla = con_fil.fun_pla;
n_row = con_fil.n_row;
n_col = con_fil.n_col;
n_pla = con_fil.n_pla;
x_pla_pix = cell(n_pla.neu.raw, 1);
y_pla_pix = cell(n_pla.neu.raw, 1);
z_pla_pix = cell(n_pla.neu.raw, 1);
ite = 0;

dist_z = str2double(iniStruct.total_z_distance_); %in micrometers
step_z = dist_z/n_pla.neu.fun;
for pla_num = fun_pla.raw
    log_row_col = log_pla_icx_row_col{pla_num, 1};
    [row_pix, col_pix, ~] = find(log_row_col);%all row-col,with repetitions

    x_pla_pix{pla_num} = (n_row.cal - row_pix + 1)*factor_meter; % rostro-caudal
    y_pla_pix{pla_num} = (n_col.cal - col_pix + 1)*factor_meter;% origin: bottom right !

    if pla_num == 1
        % km: because sawtooth: % taking ratio of depth the same as you are in ypos
        z_pla_pix{pla_num} = (x_pla_pix{pla_num}/n_row.cal)*step_z;
    else
        z_pla_pix{pla_num} = step_z*(n_pla.neu.fun - 1 - ite) + (x_pla_pix{pla_num}/n_row.cal)*step_z;
        ite = ite + 1;
    end
end
end

function r_blo = cal_r_blo(dis_pai, r_pai, dis_blo)
r_blo.dat = cal_pcc_blo(dis_pai, r_pai, dis_blo);
r_blo.shu = cal_r_blo_shu(dis_pai, r_pai, dis_blo);
end

function r_blo = cal_pcc_blo(dis_pai, r_pai, dis_blo)
n_blo = length(dis_blo);
r_blo.all = nan(n_blo, 1);
r_blo.pos = nan(n_blo, 1);
r_blo.neg = nan(n_blo, 1);
for blo = 1:n_blo
    if blo == 1
        log_pai = dis_pai > 0 & dis_pai <= dis_blo(blo);
    else
        log_pai = dis_pai > dis_blo(blo - 1) & dis_pai <= dis_blo(blo);
    end
    pcc_pai = r_pai(log_pai);
    r_blo.all(blo) = mean(pcc_pai);
    r_blo.pos(blo) = mean(pcc_pai(pcc_pai > 0));
    r_blo.neg(blo) = mean(pcc_pai(pcc_pai < 0));
end
end

function r_blo = cal_r_blo_shu(dis_pai, r_pai, dis_blo)
n_blo = length(dis_blo);
n_ite = 10;
r_blo_ite.all = nan(n_blo, n_ite);
r_blo_ite.pos = nan(n_blo, n_ite);
r_blo_ite.neg = nan(n_blo, n_ite);
for ite = 1:n_ite
    pcc_blo = cal_pcc_blo(shu_var_row.ent(dis_pai), r_pai, dis_blo);
    r_blo_ite.all(:, ite) = pcc_blo.all;
    r_blo_ite.pos(:, ite) = pcc_blo.pos;
    r_blo_ite.neg(:, ite) = pcc_blo.neg;
end
r_blo.all = mean(r_blo_ite.all, 2);
r_blo.pos = mean(r_blo_ite.pos, 2);
r_blo.neg = mean(r_blo_ite.neg, 2);
end

% function loa_pla_pcx_row_col = ext_loa_pla_pcx_row_col(loa_pla_pix_com, log_pla_icx_row_col)
% con_fil = matfile('\\home.ansatt.ntnu.no\kadiram\Documents\MATLAB\con_esp.mat');
% n_pla = con_fil.n_pla;
% n_com = size(loa_pla_pix_com{1}, 2);
% fun_pla = con_fil.fun_pla;
% n_row = con_fil.n_row;
% n_col = con_fil.n_col;
% loa_pla_pcx_row_col = cell(n_pla.neu.raw, n_com);
% for pla_num = fun_pla.raw
%     for j = 1:n_com
%         loa_pla_pcx_row_col{pla_num, j} = nan(n_row.cal, n_col.cal);
%         loa_pla_pcx_row_col{pla_num, j}(log_pla_icx_row_col{pla_num}) = loa_pla_pix_com{pla_num}(:, j);
%     end
% end
% end

function num_row = ext_ele_row(ele_row, per)
n_row.all = length(ele_row);
n_row.ten = round(n_row.all*(per/100));
num_row.top = ele_row(1:n_row.ten);
num_row.bot = ele_row(end - n_row.ten:end);
end

% function clu_pla_k_row_col = ext_clu_pla_k_row_col(clu_pix_k, log_pla_icx_row_col)
% con_fil = matfile('\\home.ansatt.ntnu.no\kadiram\Documents\MATLAB\con_esp.mat');
% n_pla = con_fil.n_pla;
% [n_pix_pla, ~] = ext_n_pix_pla(log_pla_icx_row_col);
% clu_pla_pix_k = cell(n_pla.neu.raw, 1);
% fun_pla = con_fil.fun_pla;
% for pla_num = fun_pla.raw
%     clu_pla_pix_k{pla_num} = clu_pix_k(1:n_pix_pla(pla_num), :);
%     clu_pix_k(1:n_pix_pla(pla_num), :) = [];
% end
% clu_pla_k_row_col = ext_loa_pla_pcx_row_col(clu_pla_pix_k, log_pla_icx_row_col);
% end

% function [piv_pla_fra_bin, x_bin, y_bin, z_bin, dis_bin_bin, n_bin] = cal_piv_pla_fra_bin(...
%     piv_pla_fra_pix, log_pla_row_col, x_pla_pix, y_pla_pix, z_pla_pix)
% con_fil = matfile('\\home.ansatt.ntnu.no\kadiram\Documents\MATLAB\con_esp.mat');
% fun_pla = con_fil.fun_pla;
% n_fra = con_fil.n_fra;
% n_pla = con_fil.n_pla;
% piv_pla_fra_bin = cell(n_pla.neu.raw);
% 
% x_bin = [];
% y_bin = [];
% z_bin = [];
% for pla = fun_pla.raw
%     disp(pla)
%     piv_fra_pix = piv_pla_fra_pix{pla};
%     piv_fra_pix = piv_fra_pix(1:n_fra.cal.ses.eig, :);
%     [ind_bin_pix, n_bin] = cal_ind_bin_pix(log_pla_row_col{pla});
%     piv_pla_fra_bin{pla} = nan(n_fra.cal.ses.eig, n_bin);
% 
%     x_pix = x_pla_pix{pla};
%     x_bin_tem = nan(n_bin, 1);
%     y_pix = y_pla_pix{pla};
%     y_bin_tem = nan(n_bin, 1);
%     z_pix = z_pla_pix{pla};
%     z_bin_tem = nan(n_bin, 1);
%     for bin_num = 1:n_bin
%         ind_pix = ind_bin_pix{bin_num};
%         piv_pla_fra_bin{pla}(:, bin_num) = mean(piv_fra_pix(:, ind_pix), 2);
% 
%         x_bin_tem(bin_num) = mean(x_pix(ind_pix));
%         y_bin_tem(bin_num) = mean(y_pix(ind_pix));
%         z_bin_tem(bin_num) = mean(z_pix(ind_pix));
%     end
%     x_bin = [x_bin; x_bin_tem];
%     y_bin = [y_bin; y_bin_tem];
%     z_bin = [z_bin; z_bin_tem];
% end
% dis_bin_bin = squareform(pdist([x_bin y_bin z_bin]));
% n_bin = length(x_bin);
% end%ed

% function [ind_bin_pix, n_bin] = cal_ind_bin_pix(log_row_col)
% bin_siz = 10;
% n_row.cal = 1536;
% n_col.cal = 850;
% % Calculate the new size after binning
% newRows = floor(n_row.cal / bin_siz);
% newCols = floor(n_col.cal / bin_siz);
% % Initialize cell array to store linear indices for each bin
% binLinearIndices = cell(newRows, newCols);
% % Perform image binning and store linear indices
% for i = 1:newRows
%     for j = 1:newCols
%         % Define the indices of the current bin
%         rowIndices = (i-1)*bin_siz+1:i*bin_siz;
%         colIndices = (j-1)*bin_siz+1:j*bin_siz;
%         % Extract linear indices for the current bin
%         [colMesh, rowMesh] = meshgrid(colIndices, rowIndices);
%         binLinearIndices{i, j} = sub2ind([n_row.cal, n_col.cal], rowMesh(:), colMesh(:));
%     end
% end
% % Find the bins with at least one linear index from 'ind_pix'
% lin_ind_pix = find(log_row_col);% going through columns
% ind_bin_pix = cell(newRows, newCols);
% for i = 1:newRows
%     for j = 1:newCols
%         % Check if the current bin has any linear indices from 'ind_pix'
%         if any(ismember(binLinearIndices{i, j}, lin_ind_pix))
%             [~, ind_bin_pix{i, j}] = intersect(lin_ind_pix, binLinearIndices{i, j});
%         end
%     end
% end
% % Remove empty cells from the cell array
% ind_bin_pix = ind_bin_pix(~cellfun('isempty', ind_bin_pix));
% n_bin = length(ind_bin_pix);
% end%ed

function h_fig = plo_clu_map_ani_spl(x_pix, y_pix, z_pix, piv_col_pcx, clu_pix, mar_siz, ...
    vie_ang_dir)
% fie .srt !!!
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
[hax_sub, ~, ~, ~, ~, ~] = tight_subplot_gen(n_row, ...
    n_col, gap_ver_row, gap_hor_row_col, mar_bot, mar_top, mar_lef, mar_rig, ...
    asp_rat_axe, fig_wid, fig_hei, wid, sca_axe, n_pix_ext);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
x_lim = [min(x_pix) max(x_pix)];
y_lim = [min(y_pix) max(y_pix)];
z_lim = [min(z_pix) max(z_pix)];

gre = 0.1;
%gre = 0;

%tra = con_fil.tra;
%tra = 0.1;
tra_non = 0.03;


tra = 0.1;
ind_hax = 0;
for clu = [1 3]
    ind_hax = ind_hax + 1;
    hax = hax_sub(ind_hax);
    log_inh = clu_pix == clu;


    scatter3(hax, x_pix(~log_inh), y_pix(~log_inh), z_pix(~log_inh), mar_siz, [gre gre gre], ...
        'filled', 'MarkerEdgeAlpha', tra_non, 'MarkerFaceAlpha', tra_non)
    hold(hax, "on")


    
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
end
end

function pro_den_bin = cal_pro_den_bin(x_raw_bin, y_raw_bin, log_raw_bin, fie_num, coo_tar_bin_dim)
n_row = 2;
n_col = 2;

x_bin.all = x_raw_bin;
y_bin.all = y_raw_bin;
log_raw_bin.ven = ~log_raw_bin.dor;

x_bin.dor.all = x_bin.all(log_raw_bin.dor);% bins at diff z overlap
x_bin.ven.all = x_bin.all(log_raw_bin.ven);
y_bin.dor.all = y_bin.all(log_raw_bin.dor);
y_bin.ven.all = y_bin.all(log_raw_bin.ven);

boo_bin = getfield(log_raw_bin, fie_num{3:end});
log_bin.dor.exc = boo_bin.exc & log_raw_bin.dor;
log_bin.dor.inh = boo_bin.inh & log_raw_bin.dor;
log_bin.ven.exc = boo_bin.exc & log_raw_bin.ven;
log_bin.ven.inh = boo_bin.inh & log_raw_bin.ven;

for row = 1:n_row
    if row == 1
        fie = 'exc';
    elseif row == 2
        fie = 'inh';
    end
    for col = 1:n_col
        if col == 1
            loc = 'dor';
        elseif col == 2
            loc = 'ven';
        end
        n_bin.tar = size(coo_tar_bin_dim.(loc).(fie), 1);
        pro_den_bin.(loc).(fie) = zeros(n_bin.tar, 1);% if the bin is not evoked, den=0.
        x_bin.(loc).(fie) = x_bin.all(log_bin.(loc).(fie));% select bins taken
        y_bin.(loc).(fie) = y_bin.all(log_bin.(loc).(fie));
        coo_bin_dim = [x_bin.(loc).(fie) y_bin.(loc).(fie)];
        if ~isempty(coo_bin_dim)
            pro_den_bin.(loc).(fie) = ksdensity(coo_bin_dim, coo_tar_bin_dim.(loc).(fie));
        end
    end
end
end

function pro_den_sid_bin = cal_pro_den_sid_bin(x_raw_bin, z_raw_bin, log_raw_bin, fie_num, ...
    coo_tar_bin_dim)
n_row = 2;
x_bin.all = x_raw_bin;
z_bin.all = z_raw_bin;
boo_bin = getfield(log_raw_bin, fie_num{3:end});
for row = 1:n_row
    if row == 1
        fie = 'exc';
    elseif row == 2
        fie = 'inh';
    end
    n_bin.tar = size(coo_tar_bin_dim.(fie), 1);
    pro_den_sid_bin.(fie) = zeros(n_bin.tar, 1);% if the bin is not evoked, den=0.
    x_bin.(fie) = x_bin.all(boo_bin.(fie));% select bins taken
    z_bin.(fie) = z_bin.all(boo_bin.(fie));
    coo_bin_dim = [x_bin.(fie) z_bin.(fie)];
    if ~isempty(coo_bin_dim)
        pro_den_sid_bin.(fie) = ksdensity(coo_bin_dim, coo_tar_bin_dim.(fie));
    end
end
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% cel-onl
function [dff_fra_cel, ioi_kxx, ioi_shu_kxx, del_ioi_kxx, clu_cel, clu_fid, r_pai, pcc_blo, ...
    clu_cel_k, log_fra] = cal_spo(tim_fra, dff_pla_fra_cel, dis_pai, spo_per_ons, spo_per_off)
dff_fra_cel = [dff_pla_fra_cel{:}];
met = 'sgolay';
con_fil = matfile('\\home.ansatt.ntnu.no\kadiram\Documents\MATLAB\con_esp.mat');
n_fra = con_fil.n_fra;
dff_fra_cel = smoothdata(dff_fra_cel, met, n_fra.dff.eig.smo);
log_fra = tim_fra > spo_per_ons & tim_fra < spo_per_off;
[clu_cel_k.ong, ~] = com_clu_cel_k(dff_fra_cel(log_fra, :));% single per
[ioi_kxx, ioi_shu_kxx, del_ioi_kxx] = ext_clu_ana(dff_fra_cel(log_fra, :));
[clu_cel, clu_fid] = cal_clu_cel(dff_fra_cel);% ongoing activity is selected, 2 periods
% clu_cel.one, clu_cel.two
r_pai.ong = cal_r_pai.tog(dff_fra_cel(log_fra, :));
dis_blo = con_fil.dis_blo;
dis_blo = dis_blo.rap.thr;
pcc_blo.ong.dat = cal_pcc_blo(dis_pai, r_pai.ong, dis_blo);
pcc_blo.ong.shu = cal_r_blo_shu(dis_pai, r_pai.ong, dis_blo);
%
mid_poi = mean([spo_per_ons spo_per_off]);
log_fra_one = tim_fra > spo_per_ons & tim_fra < mid_poi;
r_pai.one.dat = cal_r_pai.tog(dff_fra_cel(log_fra_one, :));
r_pai.one.shu = shu_var_row.ent(r_pai.one.dat);
log_fra_two = tim_fra > mid_poi & tim_fra < spo_per_off;
r_pai.two.dat = cal_r_pai.tog(dff_fra_cel(log_fra_two, :));
r_pai.two.shu = shu_var_row.ent(r_pai.two.dat);
end

function [r_pai, r_blo] = cal_r_pai_r_blo(dff_cel_fra, dis_pai)
r_pai = cal_r_pai.tog(dff_cel_fra');
con_fil = matfile('\\home.ansatt.ntnu.no\kadiram\Documents\MATLAB\con_esp.mat');
dis_blo = con_fil.dis_blo;
dis_blo = dis_blo.rap.thr;
r_blo.dat = cal_pcc_blo(dis_pai, r_pai, dis_blo);
r_blo.shu = cal_r_blo_shu(dis_pai, r_pai, dis_blo);
end

% 2 periods
function [clu_cel, clu_fid] = cal_clu_cel(dff_fra_cel)
con_fil = matfile('\\home.ansatt.ntnu.no\kadiram\Documents\MATLAB\con_esp.mat');
log_fra = con_fil.log_fra;
k = 4;
options = statset('UseParallel', 1);
clu_cel.one = kmeans(dff_fra_cel(log_fra.cal.eig.ong_one, :)', k, 'Distance', 'correlation', ...
    'Replicates', 100, 'Options', options);

startpoint = [];
dff_cel_fra = dff_fra_cel(log_fra.cal.eig.ong_two, :)';
for i = 1:k
startpoint = cat(1, startpoint, mean(dff_cel_fra(clu_cel.one == i, :), 1));
end

clu_cel.two = kmeans(dff_cel_fra, k, 'Distance', 'correlation', 'Options', options, 'start', ...
    startpoint);
[clu_fid.dat, clu_fid.shu] = cal_clu_fid(clu_cel.one, clu_cel.two);
end

function [res, s_res] = cal_clu_fid(IDX_b, IDX_d)
out_b=[];
out_d=[];
for i=1:size(IDX_b,1)
    
    for k= 1: size(IDX_b,1)
    
        if IDX_b(i)==IDX_b(k)
            out_b=cat(1,out_b,1);
            if IDX_d(i)==IDX_d(k)
            out_d=cat(1,out_d,1);
            end 
        end
    end 
end
    res=100*(sum(out_d)/sum(out_b));
    
    
    
s_IDX_b=IDX_b(randperm(size(IDX_b,1)));
s_IDX_d=IDX_d(randperm(size(IDX_b,1)));

% s_IDX_b=IDX_b;
% s_IDX_d=IDX_d;


s_out_b=[];
s_out_d=[];
for i=1:size(s_IDX_b,1)
    
    for k= 1: size(s_IDX_b,1)
    
        if s_IDX_b(i)==s_IDX_b(k)
            s_out_b=cat(1,s_out_b,1);
            if s_IDX_d(i)==s_IDX_d(k)
            s_out_d=cat(1,s_out_d,1);
            end 
        end
    end 
end
    s_res=100*(sum(s_out_d)/sum(s_out_b));
end

function n_cel_clu = cal_n_cel_clu(clu_cel)
n_clu = max(clu_cel);
n_cel_clu = nan(n_clu, 1);
for clu = 1:n_clu
    log_cel = clu_cel == clu;
    n_cel_clu(clu) = sum(log_cel);
end
end

function [cel_row_col, roiPositions] = ext_cel_row_col(piv_pla_row_col, per_bin_edg)
[~, fig_wid, fig_hei] = fig;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
pla_num = 3;
[high_in, low_in] = ext_hig_low.pea(piv_pla_row_col{pla_num}, per_bin_edg);
piv_row_col = piv_pla_row_col{pla_num};% uint16, max eg 2214
piv_row_col = imadjust(piv_row_col, [low_in.rel high_in.rel]);% contrast limits, 
% output % uint16, max 65535 - grayscale
%sho_ima.gra(hax, piv_row_col)

imshow(piv_row_col, [])

% Initialize the indexed image
cel_row_col = zeros(size(piv_row_col,1), size(piv_row_col,2));

% Step 1: Let user draw ROIs
roiList = {};
keepDrawing = true;
while keepDrawing
    answer = input('Add another ROI? Type yes to confirm: ','s');
    if ~strcmpi(answer,'yes')
        disp('breaking');
        break;
    end

    h = drawfreehand('Color','r');
    if isempty(h) || isempty(h.Position)
        % If ROI is empty (e.g. Esc was pressed), skip
        delete(h);
        continue;
    end
    roiList{end+1} = h; %#ok<AGROW>
end

% Step 3: Remove invalid ROIs and build cel_row_col
roiList = roiList(isvalid([roiList{:}]));  % keep only valid handles
for k = 1:numel(roiList)
    mask = createMask(roiList{k});
    cel_row_col(mask) = k;
end

% Extract ROI positions before closing the figure
roiPositions = cellfun(@(h) h.Position, roiList(isvalid([roiList{:}])), 'UniformOutput', false);
end

function [cel_row_col, roiPositions] = cor_cel_row_col(piv_pla_row_col, per_bin_edg, roiPositions)
[~, fig_wid, fig_hei] = fig;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
pla_num = 3;
[high_in, low_in] = ext_hig_low.pea(piv_pla_row_col{pla_num}, per_bin_edg);
piv_row_col = piv_pla_row_col{pla_num}; % uint16, max eg 2214
piv_row_col = imadjust(piv_row_col, [low_in.rel high_in.rel]); % contrast limits
% output: uint16, max 65535 - grayscale

imshow(piv_row_col, [])

% Initialize the indexed image
cel_row_col = zeros(size(piv_row_col,1), size(piv_row_col,2));

hold on;
roiList = gobjects(numel(roiPositions),1);
for k = 1:numel(roiPositions)
    roiList(k) = drawfreehand('Position', roiPositions{k}, 'Color', 'r');
end

% Step 1: Let user draw ROIs interactively
while true
    answer = input('Add another ROI? Type yes to confirm: ','s');
    if ~strcmpi(answer,'yes')
        disp('breaking');
        break;
    end

    h = drawfreehand('Color','r');
    if isempty(h) || isempty(h.Position)
        % If ROI is empty (e.g. Esc was pressed), skip
        delete(h);
        continue;
    end
    roiList(end+1) = h; % <-- now works (gobjects array)
end

% Step 2: Remove invalid ROIs and build cel_row_col
roiList = roiList(isvalid(roiList)); % keep only valid handles
for k = 1:numel(roiList)
    mask = createMask(roiList(k));
    cel_row_col(mask) = k;
end

% Step 3: Extract ROI positions before closing the figure
roiPositions = arrayfun(@(h) h.Position, roiList(isvalid(roiList)), 'UniformOutput', false);
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% gab
function fra_blo = cal_fra_blo(coo_cel_dim, log_cel, dis_blo)
n_cel = length(log_cel.inh);
con_fil = matfile('\\home.ansatt.ntnu.no\kadiram\Documents\MATLAB\con_esp.mat');
dim_top_bot = con_fil.dim_top_bot;
coo_cel_dim(:, 1) = coo_cel_dim(:, 1) - min(coo_cel_dim(:, 1));
coo_cel_dim(:, 2) = coo_cel_dim(:, 2) - min(coo_cel_dim(:, 2));
coo_cel_dim(:, 3) = coo_cel_dim(:, 3) - min(coo_cel_dim(:, 3));
n_blo.ros_cau = length(dis_blo.ros_cau);
log_cel_blo.ros_cau.all = false(n_cel, n_blo.ros_cau);
for i = 1:n_blo.ros_cau
    if i == 1
        log_cel_blo.ros_cau.all(:, i) = coo_cel_dim(:, 1) <= dis_blo.ros_cau(i);
    else
        log_cel_blo.ros_cau.all(:, i) = coo_cel_dim(:, 1) > dis_blo.ros_cau(i - 1) & coo_cel_dim...
            (:, 1) <= dis_blo.ros_cau(i);
    end
end
n_blo.dor_ven = length(dis_blo.dor_ven);
log_cel_blo.dor_ven.all = false(n_cel, n_blo.dor_ven);
for i = 1:n_blo.dor_ven
    if i == 1
        log_cel_blo.dor_ven.all(:, i) = coo_cel_dim(:, 3) <= dis_blo.dor_ven(i);
    else
        log_cel_blo.dor_ven.all(:, i) = coo_cel_dim(:, 3) > dis_blo.dor_ven(i - 1) & coo_cel_dim...
            (:, 3) <= dis_blo.dor_ven(i);
    end
end
log_cel_blo.ros_cau.inh = log_cel_blo.ros_cau.all & log_cel.inh;
log_cel_blo.ros_cau.exc = log_cel_blo.ros_cau.all & log_cel.exc;
log_cel_blo.dor_ven.inh = log_cel_blo.dor_ven.all & log_cel.inh;
log_cel_blo.dor_ven.exc = log_cel_blo.dor_ven.all & log_cel.exc;
%
fra_blo.ros_cau.inh = (sum(log_cel_blo.ros_cau.inh, dim_top_bot)./sum(log_cel_blo.ros_cau.all, ...
    dim_top_bot))'*100;
fra_blo.ros_cau.exc = (sum(log_cel_blo.ros_cau.exc, dim_top_bot)./sum(log_cel_blo.ros_cau.all, ...
    dim_top_bot))'*100;
fra_blo.dor_ven.inh = (sum(log_cel_blo.dor_ven.inh, dim_top_bot)./sum(log_cel_blo.dor_ven.all, ...
    dim_top_bot))'*100;
fra_blo.dor_ven.exc = (sum(log_cel_blo.dor_ven.exc, dim_top_bot)./sum(log_cel_blo.dor_ven.all, ...
    dim_top_bot))'*100;
end

function [x_pla_cel, y_pla_cel, z_pla_cel, x_cel, y_cel, z_cel, coo_cel_dim] = cal_xyz_cel(...
    factor_meter, iniStruct, cel_pla_row_col)
con_fil = matfile('\\home.ansatt.ntnu.no\kadiram\Documents\MATLAB\con_esp.mat');
n_row = con_fil.n_row;
n_col = con_fil.n_col;
n_pla = length(cel_pla_row_col);
x_pla_cel = cell(n_pla, 1);
y_pla_cel = cell(n_pla, 1);
z_pla_cel = cell(n_pla, 1);
ite = 0;
if n_pla == 1
    dist_z = 0; %in micrometers
else
    dist_z = str2double(iniStruct.total_z_distance_); %in micrometers
end
step_z = dist_z/(n_pla - 1);

fun_pla = con_fil.fun_pla;
% for loop changed to n_pla for single plane rec 03.24
%for pla = n_pla
for pla = fun_pla.raw
    cel_row_col = cel_pla_row_col{pla};
    n_cel = max(cel_row_col, [], 'all');
    row_cel = nan(n_cel, 1);
    col_cel = nan(n_cel, 1);
    for i = 1:n_cel
        [row_pix, col_pix] = find(cel_row_col == i);
        row_cel(i) = round(mean(row_pix));
        col_cel(i) = round(mean(col_pix));
    end
    x_pla_cel{pla} = (n_row.cal - row_cel + 1)*factor_meter; % rostro-caudal
    y_pla_cel{pla} = (n_col.cal - col_cel + 1)*factor_meter;% origin: bottom right !
    if pla == 1
        % km: because sawtooth: % taking ratio of depth the same as you are in ypos
        z_pla_cel{pla} = (x_pla_cel{pla}/n_row.cal)*step_z;
    else
        z_pla_cel{pla} = step_z*(n_pla - 1 - 1 - ite) + (x_pla_cel{pla}/n_row.cal)*step_z;
        ite = ite + 1;
    end
end
x_cel.abs = vertcat(x_pla_cel{:});
y_cel.abs = vertcat(y_pla_cel{:});
z_cel.abs = vertcat(z_pla_cel{:});
coo_cel_dim = [x_cel.abs y_cel.abs z_cel.abs];% um
x_cel.res = rescale(x_cel.abs);
y_cel.res = rescale(y_cel.abs);
z_cel.res = rescale(z_cel.abs);
end

function piv_fra_cel = enh_piv_fra_cel(piv_fra_cel)
con_fil = matfile('\\home.ansatt.ntnu.no\kadiram\Documents\MATLAB\con_esp.mat');
n_fra = con_fil.n_fra;
[~, n_cel] = size(piv_fra_cel);
f_fra_cel = nan(n_fra.cal.ses.eig, n_cel);
fra_epo_sam = con_fil.fra_epo_sam;
n_fra_epo = con_fil.n_fra_epo;
f_fra_cel(fra_epo_sam.eig{1}, :) = piv_fra_cel(end - n_fra_epo.eig + 1:end, :);
piv_fra_cel = f_fra_cel;
end

function [acc, xcc] = cal_acc_xcc(act_fra_cel, log_cel)
con_fil = matfile('\\home.ansatt.ntnu.no\kadiram\Documents\MATLAB\con_esp.mat');
log_fra = con_fil.log_fra;
pcc_cel_cel = corr(act_fra_cel(log_fra.cal.eig.ong, log_cel));
acc_pai = abs(ext_upp(pcc_cel_cel));% abs cor coe
acc = mean(acc_pai);
%%%%%%%%%%%%% x
xcc_cel_cel = corr(act_fra_cel(log_fra.cal.eig.ong, log_cel), act_fra_cel(log_fra.cal.eig.ong, ...
    ~log_cel));
xcc_pai = abs(xcc_cel_cel(:));% abs cor coe
xcc = mean(xcc_pai);
end

function [clu_cel_k, ioi_k] = com_clu_cel_k(dff_fra_cel)
% for single k ...
n_pix = size(dff_fra_cel, 2);
n_k = 5;
clu_cel_k = nan(n_pix, n_k);
ioi_k = nan(n_k, 1);
dff_pix_fra = dff_fra_cel';
options = statset('UseParallel', 1);
k = 4;
[clu_cel_k(:, k), ~, sum_dis_clu, D] = kmeans(dff_pix_fra, k, 'Distance', 'correlation', ...
    'Replicates', 100, 'Options', options);
ioi_k(k) = sum(sum_dis_clu)/mean(sum(D));
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% spo
function [clu_cel, log_fra] = det_clu_cel(dff_fra_cel, spo_per_ons, spo_per_off)
con_fil = matfile('\\home.ansatt.ntnu.no\kadiram\Documents\MATLAB\con_esp.mat');
tim_fra = con_fil.tim_fra;
tim_fra = tim_fra.cal.eig.ses.spo;
log_fra = tim_fra > spo_per_ons & tim_fra < spo_per_off;
dff_pix_fra = dff_fra_cel(log_fra, :)';
options = statset('UseParallel', 1);
k = 4;
[clu_cel, ~, ~, ~] = kmeans(dff_pix_fra, k, 'Distance', 'correlation', 'Replicates', 100, ...
    'Options', options);
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% axo cel
function h_fig = plo_neu_axo(piv_pla_row_col, dff_pla_con_row_col, tit, exp)% pixel-based
[h_fig, fig_wid, ~] = fig;
n_row = 4;
con_fil = matfile('\\home.ansatt.ntnu.no\kadiram\Documents\MATLAB\con_esp.mat');
n_col = con_fil.n_col;
fun_pla = con_fil.fun_pla;
dis_lim = con_fil.dis_lim;
%col_lim = con_fil.col_lim;%ed
con_sti = con_fil.con_sti;
n_col.fig = 7;
mar_bot = 0.000;
mar_top = 0.030;
mar_lef = 0.050;
mar_rig = 0.000;
gap_ver = 0.025;
gap_hor = 0.000;
asp_rat = 850/1536;
n_pix_ext = 10;
[hax_sub, ~, ~, ~] = tight_subplot_ima(n_row, n_col.fig, [gap_ver gap_hor], ...
    [mar_bot mar_top], [mar_lef mar_rig], asp_rat, fig_wid, n_pix_ext);
red = 0.01;
col_map = con_fil.map;
for i = 1:n_row
    con_num = i - 1;
    for j = 1:n_col.fig
        ind_sub_i_j = (i - 1)*n_col.fig + j;
        hax = hax_sub(ind_sub_i_j);
        pla_num = fun_pla.plo(j);
        if i == 1
            piv_row_col = piv_pla_row_col.raw{pla_num, 1};
            sho_ima.gra_ran(hax, piv_row_col, dis_lim.(exp))
        else
            ima(hax, 1:n_col.cal, dff_pla_con_row_col{pla_num, con_num})
            xticks(hax, [])
            yticks(hax, [])
            %caxis(hax, col_lim.(exp))%ed
            colormap(hax, col_map)
            if j == n_col.fig
                h_bar = colorbar;
                pos_i_j = hax.Position;
                h_bar.Position = [pos_i_j(1) + pos_i_j(3) + 0.005 pos_i_j(2) + red 0.01 pos_i_j(4) ...
                    - 2*red];
                h_bar.Label.String = '\DeltaF/F (%)';
            elseif j == 1
                ylabel(hax, con_sti{con_num})
            end
        end
    end
end
title(hax_sub(4), tit)
end

function h_fig = plo_axo_cel_sin(piv_pla_row_col, dff_fra_roi, log_pla_roi_row_col, ...
    per_bin_edg, dff_fra_cel, cel_pla_row_col)
[h_fig, fig_wid, fig_hei] = fig;
n_row = 2;
con_fil = matfile('\\home.ansatt.ntnu.no\kadiram\Documents\MATLAB\con_esp.mat');
n_pla = con_fil.n_pla;
fun_pla = con_fil.fun_pla;
n_col = n_pla.neu.fun;
gap_ver_row = 0.001*ones(n_row, 1);
gap_hor_row_col = 0.001*ones(n_row, n_col);
mar_bot = 0.001;
mar_top = 0.050;
mar_lef = 0.001;
mar_rig = 0.070;
asp_rat = con_fil.asp_rat;
asp_rat_axe = asp_rat.cal.ori*ones(n_row*n_col);
wid = true;
sca_axe = 1;
n_pix_ext = 50;
[hax_sub, ~, ~, ~, ~, ~] = tight_subplot_gen(n_row, n_col, ...
    gap_ver_row, gap_hor_row_col, mar_bot, mar_top, mar_lef, mar_rig, asp_rat_axe, fig_wid, ...
    fig_hei, wid, sca_axe, n_pix_ext);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
tim_fra = con_fil.tim_fra;
win_len = con_fil.win_len;
dff_roi_win = com_ave_amp_uni_win(tim_fra.cal.eig.tri.dff, dff_fra_roi, win_len.dff.pha.drn.tai);
dff_roi = dff_roi_win(:, 2);
dff_pla_row_col = ext_res_pla_row_col(log_pla_roi_row_col, dff_roi);%log_pla_roi_row_col - {}{}
%
dff_cel_win = com_ave_amp_uni_win(tim_fra.cal.eig.tri.dff, dff_fra_cel, win_len.dff.pha.drn.tai);
dff_cel = dff_cel_win(:, 2);
%
col_lim = con_fil.col_lim;
col_lim = col_lim.sin;
col_lim = col_lim/2;

map = con_fil.map;
ang = -5;
gra = con_fil.gra;
for i = 1:n_row
    ind = 0;
    for pla = fun_pla.plo
        ind = ind + 1;
        hax = hax_sub((i - 1)*n_col + ind);
        if i == 1
            piv_row_col = piv_pla_row_col{pla};% uint16, max eg 2214
            piv_row_col = adj_con(piv_row_col, per_bin_edg);
            piv_row_col = imrotate(piv_row_col, ang);
            sho_ima.gra(hax, piv_row_col)
        else
            cel_row_col = cel_pla_row_col{pla};
            log_row_col.cel = ~isnan(cel_row_col);
            log_row_col_pcx.cel = repmat(log_row_col.cel, 1, 1, 3);

            dff_row_col = ext_res_row_col(cel_row_col, dff_cel);
            dff_row_col = dff_pla_row_col{pla} + dff_row_col;% roi + cel

            piv_row_col_pcx = ext_piv_row_col_pcx(dff_row_col, col_lim, map.asy);

            piv_row_col_pcx.abs(log_row_col_pcx.cel) = gra.lig(1);
            log_roi_row_col = log_pla_roi_row_col{pla};
            log_row_col.axo = logical(sum(cat(3, log_roi_row_col{:}), 3));
            log_row_col_pcx.axo = repmat(log_row_col.axo, 1, 1, 3);
            piv_row_col_pcx.abs(log_row_col_pcx.axo) = eps;

            piv_row_col_pcx.abs = imrotate(piv_row_col_pcx.abs, ang);
            piv_row_col_pcx = fix_piv_row_col_pcx(piv_row_col_pcx);
            sho_ima.rgb(hax, piv_row_col_pcx)
        end
    end
end
hax.FontSize = 30;
end

function h_fig = plo_ses(fra_rat, dff_fra_icx, y_lab, sti_ons_tri)
[h_fig, fig_wid, fig_hei] = fig;
n_row = 2;
n_col = 1;
gap_ver_row = 0.040*ones(n_row, 1);
gap_hor_row_col = [0.030; 0.030];
mar_bot = 0.100;
mar_top = 0.030;
mar_lef = 0.050;
mar_rig = 0.010;
asp_rat_axe = [4 4];
wid = false;
sca_axe = 1;
n_pix_ext = 50;
[hax_sub, ~, ~, ~, las_pix, rat_wid] = tight_subplot_gen(n_row, n_col, ...
    gap_ver_row, gap_hor_row_col, mar_bot, mar_top, mar_lef, mar_rig, asp_rat_axe, fig_wid, ...
    fig_hei, wid, sca_axe, n_pix_ext);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
n_poi = length(dff_fra_icx.raw(:, 1));
[tim_fra, ~] = cal_tim_poi(fra_rat, n_poi);
con_fil = matfile('\\home.ansatt.ntnu.no\kadiram\Documents\MATLAB\con_esp.mat');
log_fra = con_fil.log_fra;
hax = hax_sub(1);
plot(hax, tim_fra(log_fra.cal.eig.ses.cel, :), dff_fra_icx.raw(log_fra.cal.eig.ses.cel, :))
xlabel(hax, 'Time (s)')
ylabel(hax, y_lab)
lin_wid = 1;
plo_ver_lin(hax, sti_ons_tri, 'r', lin_wid, '-')
box(hax, "off")
hax.XAxis.Visible = 'off';
%
hax = hax_sub(2);
plot(hax, tim_fra(log_fra.cal.eig.ses.cel, :), dff_fra_icx.fil(log_fra.cal.eig.ses.cel, :))
xlabel(hax, 'Time (s)')
ylabel(hax, y_lab)
lin_wid = 1;
plo_ver_lin(hax, sti_ons_tri, 'r', lin_wid, '-')
box(hax, "off")
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
set(h_fig.Children, 'Units', 'pixels')
h_fig.Position(3) = las_pix;
h_fig.Renderer = 'painters';
h_fig.PaperSize(1) = rat_wid*h_fig.PaperSize(1);
h_fig.PaperUnits = 'normalized';
h_fig.PaperPosition = [0 0 1 1];
end

function h_fig = plo_piv(piv_pla_row_col, high_in, low_in)
[h_fig, fig_wid, fig_hei] = fig;
n_row = 2;
con_fil = matfile('\\home.ansatt.ntnu.no\kadiram\Documents\MATLAB\con_esp.mat');
n_pla = con_fil.n_pla;
fun_pla = con_fil.fun_pla;
n_col = n_pla.neu.fun;
gap_ver_row = 0.250*ones(n_row, 1);
gap_hor_row_col = 0.001*ones(n_row, n_col);
mar_bot = 0.001;
mar_top = 0.001;
mar_lef = 0.001;
mar_rig = 0.001;
asp_rat = con_fil.asp_rat;
asp_rat_axe = asp_rat.cal.ori*ones(n_row*n_col);
wid = true;
sca_axe = 1;
n_pix_ext = 50;
[hax_sub, ~, ~, ~, ~, ~] = tight_subplot_gen(n_row, n_col, ...
    gap_ver_row, gap_hor_row_col, mar_bot, mar_top, mar_lef, mar_rig, asp_rat_axe, fig_wid, ...
    fig_hei, wid, sca_axe, n_pix_ext);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
for i = 1:n_row
    ind = 0;
    for pla_num = fun_pla.plo
        ind = ind + 1;
        piv_row_col = piv_pla_row_col{pla_num};
        piv_row_col = imadjust(piv_row_col, [low_in.rel high_in.rel]);
        if i == 1
            sho_ima.gra(hax_sub((i - 1)*n_col + ind), piv_row_col)
        end
    end
end
end

function h_fig = plo_blu(piv_pla_row_col, per_bin_edg)
[h_fig, fig_wid, fig_hei] = fig;
n_row = 2;
con_fil = matfile('\\home.ansatt.ntnu.no\kadiram\Documents\MATLAB\con_esp.mat');
n_pla = con_fil.n_pla;
fun_pla = con_fil.fun_pla;
n_col = n_pla.neu.fun;
gap_ver_row = 0.010*ones(n_row, 1);
gap_hor_row_col = 0.001*ones(n_row, n_col);
mar_bot = 0.001;
mar_top = 0.001;
mar_lef = 0.001;
mar_rig = 0.001;
asp_rat = con_fil.asp_rat;
asp_rat_axe = asp_rat.cal.ori*ones(n_row*n_col);
wid = true;
sca_axe = 1;
n_pix_ext = 50;
[hax_sub, ~, ~, ~, ~, ~] = tight_subplot_gen(n_row, n_col, ...
    gap_ver_row, gap_hor_row_col, mar_bot, mar_top, mar_lef, mar_rig, asp_rat_axe, fig_wid, ...
    fig_hei, wid, sca_axe, n_pix_ext);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[high_in, low_in] = ext_hig_low.pea(piv_pla_row_col.glu{1}, per_bin_edg);
% all on the same scale
for i = 1:n_row
    ind = 0;
    for pla_num = fun_pla.plo
        ind = ind + 1;
        piv_row_col.raw = piv_pla_row_col.raw{pla_num};
        piv_row_col.raw = imadjust(piv_row_col.raw, [low_in.rel high_in.rel]);
        %
        piv_row_col.blu = piv_pla_row_col.glu{pla_num};
        piv_row_col.blu = imadjust(piv_row_col.blu, [low_in.rel high_in.rel]);
        if i == 1
            sho_ima.gra(hax_sub((i - 1)*n_col + ind), piv_row_col.raw)
        else
            sho_ima.gra(hax_sub((i - 1)*n_col + ind), piv_row_col.blu)
        end
    end
end
end

function h_fig = plo_z_sco(piv_pla_row_col, z_sco_pla_row_col, per_bin_edg)
[h_fig, fig_wid, fig_hei] = fig;
n_row = 2;
con_fil = matfile('\\home.ansatt.ntnu.no\kadiram\Documents\MATLAB\con_esp.mat');
n_pla = con_fil.n_pla;
fun_pla = con_fil.fun_pla;
n_col = n_pla.neu.fun;
gap_ver_row = 0.010*ones(n_row, 1);
gap_hor_row_col = 0.001*ones(n_row, n_col);
mar_bot = 0.001;
mar_top = 0.001;
mar_lef = 0.001;
mar_rig = 0.001;
asp_rat = con_fil.asp_rat;
asp_rat_axe = asp_rat.cal.ori*ones(n_row*n_col);
wid = true;
sca_axe = 1;
n_pix_ext = 50;
[hax_sub, ~, ~, ~, ~, ~] = tight_subplot_gen(n_row, n_col, ...
    gap_ver_row, gap_hor_row_col, mar_bot, mar_top, mar_lef, mar_rig, asp_rat_axe, fig_wid, ...
    fig_hei, wid, sca_axe, n_pix_ext);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[high_in, low_in] = ext_hig_low.pea(piv_pla_row_col{1}, per_bin_edg);
thresh = 0.7;
dis_lim = [0 thresh];
ind = 0;
for pla_num = fun_pla.plo
    ind = ind + 1;
    for i = 1:n_row
        piv_row_col = piv_pla_row_col{pla_num};
        piv_row_col = imadjust(piv_row_col, [low_in.rel high_in.rel]);
        hax = hax_sub((i - 1)*n_col + ind);
        if i == 1
            sho_ima.gra(hax, piv_row_col)
        else
            z_sco_row_col = z_sco_pla_row_col{pla_num, con_fil.icx_num};
            sho_ima.gra_ran(hax, z_sco_row_col, dis_lim)
        end
    end
end
end

function h_fig = plo_roi(piv_pla_row_col, log_pla_icx_row_col, per_bin_edg, ani)
[h_fig, fig_wid, fig_hei] = fig;
n_row = 2;
con_fil = matfile('\\home.ansatt.ntnu.no\kadiram\Documents\MATLAB\con_esp.mat');
n_pla = con_fil.n_pla;
fun_pla = con_fil.fun_pla;
n_col = n_pla.neu.fun;
gap_ver_row = 0.010*ones(n_row, 1);
gap_hor_row_col = 0.001*ones(n_row, n_col);
mar_bot = 0.001;
mar_top = 0.050;
mar_lef = 0.001;
mar_rig = 0.001;
asp_rat = con_fil.asp_rat;
asp_rat_axe = asp_rat.cal.ori*ones(n_row*n_col);
wid = true;
sca_axe = 1;
n_pix_ext = 50;
[hax_sub, ~, ~, ~, ~, ~] = tight_subplot_gen(n_row, n_col, ...
    gap_ver_row, gap_hor_row_col, mar_bot, mar_top, mar_lef, mar_rig, asp_rat_axe, fig_wid, ...
    fig_hei, wid, sca_axe, n_pix_ext);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[high_in, low_in] = ext_hig_low.pea(piv_pla_row_col{1}, per_bin_edg);
for i = 1:n_row
    ind = 0;
    for pla_num = fun_pla.plo
        ind = ind + 1;
        piv_row_col = piv_pla_row_col{pla_num};% uint16, max eg 2214
        piv_row_col = imadjust(piv_row_col, [low_in.rel high_in.rel]);% contrast limits, 
        % output % uint16, max 65535 - grayscale
        hax = hax_sub((i - 1)*n_col + ind);
        if i == 1
            sho_ima.gra(hax, piv_row_col)
        else
            sho_ima.gra(hax, log_pla_icx_row_col{pla_num, con_fil.icx_num})
        end
        if ind == 4
            title(hax, ani)
        end
    end
end
end

function h_fig = plo_roi_ove(piv_pla_row_col, log_pla_icx_row_col, per_bin_edg, ani, cel_row_col)
[h_fig, fig_wid, fig_hei] = fig;
n_row = 2;
con_fil = matfile('\\home.ansatt.ntnu.no\kadiram\Documents\MATLAB\con_esp.mat');
n_pla = con_fil.n_pla;
fun_pla = con_fil.fun_pla;
n_col = n_pla.neu.fun;
gap_ver_row = 0.010*ones(n_row, 1);
gap_hor_row_col = 0.001*ones(n_row, n_col);
mar_bot = 0.001;
mar_top = 0.050;
mar_lef = 0.001;
mar_rig = 0.001;
asp_rat = con_fil.asp_rat;
asp_rat_axe = asp_rat.cal.ori*ones(n_row*n_col);
wid = true;
sca_axe = 1;
n_pix_ext = 50;
[hax_sub, ~, ~, ~, ~, ~] = tight_subplot_gen(n_row, n_col, ...
    gap_ver_row, gap_hor_row_col, mar_bot, mar_top, mar_lef, mar_rig, asp_rat_axe, fig_wid, ...
    fig_hei, wid, sca_axe, n_pix_ext);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[high_in, low_in] = ext_hig_low.pea(piv_pla_row_col{1}, per_bin_edg);
for row = 1:n_row
    ind = 0;
    for pla_num = fun_pla.plo
        ind = ind + 1;
        piv_row_col = piv_pla_row_col{pla_num};% uint16, max eg 2214
        piv_row_col = imadjust(piv_row_col, [low_in.rel high_in.rel]);% contrast limits, 
        % output % uint16, max 65535 - grayscale
        hax = hax_sub((row - 1)*n_col + ind);
        if row == 1
            % OVERLAY % cell labels!, double, with numbers|90 deg turned
            showMaskAsOverlay_kadir(hax, 0.2, cel_row_col, [1 0 1], piv_row_col)
        else% for the 2nd row
            sho_ima.gra(hax, log_pla_icx_row_col{pla_num, con_fil.icx_num})
        end
        if ind == 4
            title(hax, ani)
        end
    end
end
end

function h_fig = plo_roi_ove_sin(piv_pla_row_col, per_bin_edg, ani, cel_row_col)
[h_fig, fig_wid, fig_hei] = fig;
n_row = 1;
con_fil = matfile('\\home.ansatt.ntnu.no\kadiram\Documents\MATLAB\con_esp.mat');
n_col = 1;
gap_ver_row = 0.010*ones(n_row, 1);
gap_hor_row_col = 0.001*ones(n_row, n_col);
mar_bot = 0.001;
mar_top = 0.050;
mar_lef = 0.001;
mar_rig = 0.001;
asp_rat = con_fil.asp_rat;
asp_rat_axe = asp_rat.cal.ori*ones(n_row*n_col);
wid = false;
sca_axe = 1;
n_pix_ext = 50;
[hax_sub, ~, ~, ~, ~, ~] = tight_subplot_gen(n_row, n_col, ...
    gap_ver_row, gap_hor_row_col, mar_bot, mar_top, mar_lef, mar_rig, asp_rat_axe, fig_wid, ...
    fig_hei, wid, sca_axe, n_pix_ext);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
pla_num = 3;
[high_in, low_in] = ext_hig_low.pea(piv_pla_row_col{pla_num}, per_bin_edg);
piv_row_col = piv_pla_row_col{pla_num};% uint16, max eg 2214
piv_row_col = imadjust(piv_row_col, [low_in.rel high_in.rel]);% contrast limits, 
% output % uint16, max 65535 - grayscale
hax = hax_sub(1);
cel_row_col(isnan(cel_row_col)) = 0;
% OVERLAY % cell labels!, double, with numbers|90 deg turned
%showMaskAsOverlay_kadir(hax, 0.2, cel_row_col, [1 0 1], piv_row_col)
showMaskContoursAsOverlay(hax, 0.2, cel_row_col, [1 0 1], piv_row_col)
title(hax, ani)
end

function h_fig = plo_roi_man(piv_pla_row_col, per_bin_edg, ani, roiPositions)
[h_fig, fig_wid, fig_hei] = fig;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
pla_num = 3;
[high_in, low_in] = ext_hig_low.pea(piv_pla_row_col{pla_num}, per_bin_edg);
piv_row_col = piv_pla_row_col{pla_num};% uint16, max eg 2214
piv_row_col = imadjust(piv_row_col, [low_in.rel high_in.rel]);% contrast limits, 
% output % uint16, max 65535 - grayscale


sta_row = 740;
sta_col = 270;
n_row = 400;
n_col = 200;
%piv_row_col = piv_row_col(sta_row:sta_row + n_row - 1, sta_col:sta_col + n_col  - 1);



h_ima = imshow(piv_row_col, []);
hold on
roiList = gobjects(numel(roiPositions),1);
for k = 1:numel(roiPositions)
    roiList(k) = drawfreehand('Position', roiPositions{k}, 'Color', 'r');
    roiList(k).FaceAlpha = 0;
    roiList(k).InteractionsAllowed = 'none';
end
%title(ani)

h_fig = crop_imshow_with_rois(h_fig, sta_row, sta_col, n_row, n_col);

end

function h_fig = plo_roi_con(piv_pla_row_col, per_bin_edg, ani, workingDir, dff_cel_fra, n_cel_pla,...
    cel_pla_row_col)
[h_fig, fig_wid, fig_hei] = fig;
n_row = 2;
con_fil = matfile('\\home.ansatt.ntnu.no\kadiram\Documents\MATLAB\con_esp.mat');
n_pla = con_fil.n_pla;
fun_pla = con_fil.fun_pla;
n_col = n_pla.neu.fun;
gap_ver_row = 0.010*ones(n_row, 1);
gap_hor_row_col = 0.001*ones(n_row, n_col);
mar_bot = 0.001;
mar_top = 0.050;
mar_lef = 0.001;
mar_rig = 0.001;
asp_rat = con_fil.asp_rat;
asp_rat_axe = asp_rat.cal.ori*ones(n_row*n_col);
wid = true;
sca_axe = 1;
n_pix_ext = 50;
[hax_sub, ~, ~, ~, ~, ~] = tight_subplot_gen(n_row, n_col, ...
    gap_ver_row, gap_hor_row_col, mar_bot, mar_top, mar_lef, mar_rig, asp_rat_axe, fig_wid, ...
    fig_hei, wid, sca_axe, n_pix_ext);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[cel_pla_row_col, piv_pla_row_col, row_num, col_num] = cropCellMatrices(cel_pla_row_col, ...
    piv_pla_row_col);% to get the cropped drn !

[high_in, low_in] = ext_hig_low.pea(piv_pla_row_col{1}, per_bin_edg);
alp = 1;
tim_fra = con_fil.tim_fra;
tim_fra = tim_fra.cal.eig.tri.dff;
win_len = con_fil.win_len;
pha_win_len = win_len.dff.pha.drn.tai;
col_lim = [-10 10];
map = con_fil.map;
map = map.sym;
for row = 1:n_row
    ind = 0;
    for pla = fun_pla.plo
        ind = ind + 1;
        piv_row_col = piv_pla_row_col{pla};% uint16, max eg 2214
        piv_row_col = imadjust(piv_row_col, [low_in.rel high_in.rel]);% contrast limits, 
        % output % uint16, max 65535 - grayscale
        
        celldetectionDir = [workingDir 'celldetection_rap\celldetection_plane' num2str(pla)];
        fil_pat = [celldetectionDir filesep 'IM_cell.mat'];
        mat_fil = matfile(fil_pat);
        ROImask = mat_fil.ROImask;
        ROImask = ROImask(row_num, col_num);
        hax = hax_sub((row - 1)*n_col + ind);
        if row == 1
            showMaskContoursAsOverlay(hax, alp, ROImask, [1 0 1], piv_row_col)
        else
            dff_fra_cel = dff_cel_fra(sum(n_cel_pla(1:pla - 1), "omitnan") + 1:sum(n_cel_pla(1:pla)...
                , "omitnan"), :)';
            dff_cel_win = com_ave_amp_uni_win(tim_fra, dff_fra_cel, pha_win_len);
            dff_cel = dff_cel_win(:, 2);
            dff_row_col = ext_res_row_col(cel_pla_row_col{pla}, dff_cel);
            dff_row_col(isnan(dff_row_col)) = 0;% double
            showMaskContoursAsOverlay(hax, alp, ROImask, [1 0 1], dff_row_col, col_lim)
            colormap(hax, map);
            
            % col_bar = colorbar(hax);
            % pos_i_j = hax.Position;
            % col_bar.Position = [pos_i_j(1) + pos_i_j(3) + 0.005 pos_i_j(2) + red ...
            %     0.01 pos_i_j(4) - 2*red];
            % col_bar.Label.String = '\DeltaF/F (%)';
            % hax.FontSize = fon_siz;
            hax.Visible = 'off';
        end
        if ind == 4
            title(hax, ani)
        end
    end
end
end

function h_fig = plo_roi_con_sin(piv_pla_row_col, ani, dff_cel_fra, cel_row_col, roiPositions)
[h_fig, fig_wid, fig_hei] = fig;
n_row = 2;
con_fil = matfile('\\home.ansatt.ntnu.no\kadiram\Documents\MATLAB\con_esp.mat');
n_col = 1;
gap_ver_row = 0.000*ones(n_row, 1);
gap_hor_row_col = 0.000*ones(n_row, n_col);
mar_bot = 0.000;
mar_top = 0.000;
mar_lef = 0.000;
mar_rig = 0.000;
asp_rat = con_fil.asp_rat;
asp_rat_axe = asp_rat.cal.ori*ones(n_row*n_col);
wid = false;
sca_axe = [1; 1];
n_pix_ext = 50;
[hax_sub, ~, ~, ~, ~, ~] = tight_subplot_gen(n_row, n_col, ...
    gap_ver_row, gap_hor_row_col, mar_bot, mar_top, mar_lef, mar_rig, asp_rat_axe, fig_wid, ...
    fig_hei, wid, sca_axe, n_pix_ext);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
pla = 3;
piv_row_col = piv_pla_row_col{pla};
per_bin_edg = 70;
piv_row_col = adj_con(piv_row_col, per_bin_edg);

roiList = gobjects(numel(roiPositions),1);

tim_fra = con_fil.tim_fra;
tim_fra = tim_fra.cal.eig.tri.dff;
win_len = con_fil.win_len;
pha_win_len = win_len.dff.pha.drn.tai;
col_lim = [-10 10];
map = con_fil.map;
map = map.sym;
for row = 1:n_row
    hax = hax_sub(row);
    if row == 1
        sho_ima.gra(hax, piv_row_col)
    else
        dff_fra_cel = dff_cel_fra';
        dff_cel_win = com_ave_amp_uni_win(tim_fra, dff_fra_cel, pha_win_len);
        dff_cel = dff_cel_win(:, 2);
        dff_row_col = ext_res_row_col(cel_row_col, dff_cel);
        dff_row_col(isnan(dff_row_col)) = 0;% double
        
        sho_ima.gra_ran(hax, dff_row_col, col_lim)

        colormap(hax, map);
        hax.Visible = 'off';
    end
    hold(hax, "on")
    for k = 1:numel(roiPositions)
        roiList(k) = drawfreehand(hax, 'Position', roiPositions{k}, 'Color', 'r');
        roiList(k).FaceAlpha = 0;
        roiList(k).InteractionsAllowed = 'none';
    end
end

% sta_row = 620;
% sta_col = 340;
% n_row = 350;
% n_col = 130;

sta_row = 630;
sta_col = 310;
n_row = 330;
n_col = 160;

h_fig = crop_two_images_with_rois(h_fig, sta_row, sta_col, n_row, n_col);
end

function h_fig = plo_cor_map(r_pla_icx_row_col, log_pla_icx_row_col)
[h_fig, fig_wid, fig_hei] = fig;
n_row = 1;
con_fil = matfile('\\home.ansatt.ntnu.no\kadiram\Documents\MATLAB\con_esp.mat');
n_pla = con_fil.n_pla;
fun_pla = con_fil.fun_pla;
n_col = n_pla.neu.fun;
gap_ver_row = 0.070;
gap_hor_row_col = 0.005*ones(1, n_col);
mar_bot = 0.070;
mar_top = 0.030;
mar_lef = 0.000;
mar_rig = 0.070;
asp_rat = con_fil.asp_rat;
asp_rat_axe = asp_rat.cal.ori*ones(1, n_col);
wid = true;
sca_axe = 1;
n_pix_ext = 110;
[hax_sub, ~, ~, ~, las_pix, rat_wid] = tight_subplot_gen(n_row, n_col, ...
    gap_ver_row, gap_hor_row_col, mar_bot, mar_top, mar_lef, mar_rig, asp_rat_axe, fig_wid, ...
    fig_hei, wid, sca_axe, n_pix_ext);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
lim_r = 0.2;
r_lim = [-lim_r lim_r];
centeredmap = con_fil.centeredmap;
y_lab = con_fil.y_lab;
for j = 1:n_col
    hax = hax_sub(j);
    pla_num = fun_pla.plo(1, j);
    piv_row_col_pcx = ext_piv_row_col_pcx(r_pla_icx_row_col{pla_num, 1}, r_lim, centeredmap);
    log_row_col_pcx.axo = log_pla_icx_row_col{pla_num, con_fil.icx_num};
    log_row_col_pcx.fal = false & log_row_col_pcx.axo;
    log_row_col_pcx.dar = cat(3, log_row_col_pcx.axo, log_row_col_pcx.fal, log_row_col_pcx.axo);
    piv_row_col_pcx.abs(log_row_col_pcx.dar) = 0;
    log_row_col_pcx.bri = cat(3, log_row_col_pcx.fal, log_row_col_pcx.axo, log_row_col_pcx.fal);
    piv_row_col_pcx.abs(log_row_col_pcx.bri) = 1;
    sho_ima.rgb(hax, piv_row_col_pcx)
end
hax.Colormap = centeredmap;
col = colorbar(hax);
col.Ticks = [0 0.5 1];
col.TickLabels = [-lim_r 0 lim_r];
col.Label.String = y_lab.cor;
col.Units = "pixels";
col.Position(1) = las_pix - n_pix_ext;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
set(h_fig.Children, 'Units', 'pixels')
h_fig.Position(3) = las_pix;
h_fig.Renderer = 'painters';
h_fig.PaperSize(1) = rat_wid*h_fig.PaperSize(1);
h_fig.PaperUnits = 'normalized';
h_fig.PaperPosition = [0 0 1 1];
end

function h_fig = plo_exc_inh(r_pla_icx_row_col, log_pla_icx_row_col)% for visualization?
[h_fig, fig_wid, fig_hei] = fig;
n_row = 1;
con_fil = matfile('\\home.ansatt.ntnu.no\kadiram\Documents\MATLAB\con_esp.mat');
n_pla = con_fil.n_pla;
fun_pla = con_fil.fun_pla;
n_col = n_pla.neu.fun;
gap_ver_row = 0.070;
gap_hor_row_col = 0.005*ones(1, n_col);
mar_bot = 0.070;
mar_top = 0.030;
mar_lef = 0.000;
mar_rig = 0.070;
asp_rat = con_fil.asp_rat;
asp_rat_axe = asp_rat.cal.ori*ones(1, n_col);
wid = true;
sca_axe = 1;
n_pix_ext = 110;
[hax_sub, ~, ~, ~, las_pix, rat_wid] = tight_subplot_gen(n_row, n_col, ...
    gap_ver_row, gap_hor_row_col, mar_bot, mar_top, mar_lef, mar_rig, asp_rat_axe, fig_wid, ...
    fig_hei, wid, sca_axe, n_pix_ext);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
lim_r = 0.2;
r_lim = [-lim_r lim_r];
centeredmap = con_fil.centeredmap;
y_lab = con_fil.y_lab;
piv_col_pcx = con_fil.piv_col_pcx;
for j = 1:n_col
    hax = hax_sub(j);
    pla_num = fun_pla.plo(1, j);
    ind_row_col = ext_piv_row_col_pcx(r_pla_icx_row_col{pla_num, 1}, r_lim, centeredmap);
    %
    log_row_col_pcx.axo = log_pla_icx_row_col{pla_num, con_fil.icx_num};
    log_row_col_pcx.fal = false & log_row_col_pcx.axo;
    log_row_col_pcx.dar = cat(3, log_row_col_pcx.axo, log_row_col_pcx.fal, log_row_col_pcx.axo);
    ind_row_col.abs(log_row_col_pcx.dar) = 0;
    log_row_col_pcx.bri = cat(3, log_row_col_pcx.fal, log_row_col_pcx.axo, log_row_col_pcx.fal);
    ind_row_col.abs(log_row_col_pcx.bri) = 1;
    sho_ima.ind(hax, ind_row_col, piv_col_pcx.div)
end
hax.Colormap = centeredmap;
col = colorbar(hax);
col.Ticks = [0 0.5 1];
col.TickLabels = [-lim_r 0 lim_r];
col.Label.String = y_lab.cor;
col.Units = "pixels";
col.Position(1) = las_pix - n_pix_ext;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
set(h_fig.Children, 'Units', 'pixels')
h_fig.Position(3) = las_pix;
h_fig.Renderer = 'painters';
h_fig.PaperSize(1) = rat_wid*h_fig.PaperSize(1);
h_fig.PaperUnits = 'normalized';
h_fig.PaperPosition = [0 0 1 1];
end

function h_fig = plo_cor_map_exc_inh(r_pla_icx_row_col, log_pla_roi_row_col, log_roi, ind_pla_roi)
[h_fig, fig_wid, fig_hei] = fig;
n_row_fig = 2;
con_fil = matfile('\\home.ansatt.ntnu.no\kadiram\Documents\MATLAB\con_esp.mat');
n_pla = con_fil.n_pla;
fun_pla = con_fil.fun_pla;
n_col_fig = n_pla.neu.fun;
gap_ver_row = 0.070*ones(n_row_fig, 1);
gap_hor_row_col = 0.005*ones(n_row_fig, n_col_fig);
mar_bot = 0.070;
mar_top = 0.030;
mar_lef = 0.000;
mar_rig = 0.070;
asp_rat = con_fil.asp_rat;
asp_rat_axe = asp_rat.cal.ori*ones(n_row_fig*n_col_fig, 1);
wid = true;
sca_axe = 1;
n_pix_ext = 110;
[hax_sub, ~, ~, ~, las_pix, rat_wid] = tight_subplot_gen(n_row_fig, n_col_fig, ...
    gap_ver_row, gap_hor_row_col, mar_bot, mar_top, mar_lef, mar_rig, asp_rat_axe, fig_wid, ...
    fig_hei, wid, sca_axe, n_pix_ext);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
log_roi.non = ~log_roi.inh & ~log_roi.exc;
lim_r = 0.5;
r_lim = [-lim_r lim_r];
centeredmap = con_fil.map;
y_lab = con_fil.y_lab;
n_row = con_fil.n_row;
n_col = con_fil.n_col;
log_row_col.tru = true(n_row.cal, n_col.cal);
log_row_col.fal = false(n_row.cal, n_col.cal);% all false, selecting nothing
for row = 1:n_row_fig
    if row == 1
        fie = 'exc';
    elseif row == 2
        fie = 'inh';
    end
    for col = 1:n_col_fig
        hax = hax_sub((row - 1)*n_col_fig + col);
        pla_num = fun_pla.plo(1, col);
        piv_row_col_pcx = ext_piv_row_col_pcx(r_pla_icx_row_col.(fie){pla_num, 1}, r_lim, centeredmap);

%         log_row_col_pcx.axo = log_pla_icx_row_col{pla_num, con_fil.icx_num};
%         log_row_col_pcx.fal = false & log_row_col_pcx.axo;% false anyway !!!

% selecting tha axonal pixels and setting red and blue 0 for them, then green 1 left ...
%         log_row_col_pcx.dar = cat(3, log_row_col_pcx.axo, log_row_col_pcx.fal, log_row_col_pcx.axo);
%         piv_row_col_pcx.abs(log_row_col_pcx.dar) = 0;

%         log_row_col_pcx.bri = cat(3, log_row_col_pcx.fal, log_row_col_pcx.axo, log_row_col_pcx.fal);
%         piv_row_col_pcx.abs(log_row_col_pcx.bri) = 1;

        log_roi_row_col = log_pla_roi_row_col{pla_num};
        log_row_col.axo = logical(sum(cat(3, log_roi_row_col{:}), 3));
          
%         log_row_col_pcx.dar = cat(3, log_row_col_pcx.axo, log_row_col_pcx.fal, log_row_col_pcx.axo);
%         piv_row_col_pcx.abs(log_row_col_pcx.dar) = 0;
% 
%         ind_roi = ind_pla_roi{pla_num};
%         log_row_col_pcx.tru = logical(sum(cat(3, log_roi_row_col{log_roi.exc(ind_roi)}), 3));
%         log_row_col_pcx.exc = cat(3, log_row_col_pcx.tru, log_row_col_pcx.axo, log_row_col_pcx.fal);
%         piv_row_col_pcx.abs(log_row_col_pcx.exc) = 1;
% 
%         log_row_col_pcx.tru = logical(sum(cat(3, log_roi_row_col{log_roi.inh(ind_roi)}), 3));
%         log_row_col_pcx.inh = cat(3, log_row_col_pcx.fal, log_row_col_pcx.axo, log_row_col_pcx.tru);
%         piv_row_col_pcx.abs(log_row_col_pcx.inh) = 1;


        ind_roi = ind_pla_roi{pla_num};
        log_row_col.exc = logical(sum(cat(3, log_roi_row_col{log_roi.exc(ind_roi)}), 3));
        %log_row_col_pcx.exc = cat(3, log_row_col.fal, log_row_col.fal, log_row_col.exc);
        log_row_col_pcx.exc = cat(3, log_row_col.fal, log_row_col.exc, log_row_col.exc);
        piv_row_col_pcx.abs(log_row_col_pcx.exc) = 0;

        log_row_col.inh = logical(sum(cat(3, log_roi_row_col{log_roi.inh(ind_roi)}), 3));
        %log_row_col_pcx.inh = cat(3, log_row_col.inh, log_row_col.fal, log_row_col.fal);
        log_row_col_pcx.inh = cat(3, log_row_col.inh, log_row_col.inh, log_row_col.fal);
        piv_row_col_pcx.abs(log_row_col_pcx.inh) = 0;

        log_row_col.non = logical(sum(cat(3, log_roi_row_col{log_roi.non(ind_roi)}), 3));
        log_row_col_pcx.non = cat(3, log_row_col.non, log_row_col.fal, log_row_col.non);
        piv_row_col_pcx.abs(log_row_col_pcx.non) = 0;

        sho_ima.rgb(hax, piv_row_col_pcx)
    end
    hax.Colormap = centeredmap;
    col = colorbar(hax);
    col.Ticks = [0 0.5 1];
    col.TickLabels = [-lim_r 0 lim_r];
    col.Label.String = y_lab.cor;
    col.Units = "pixels";
    col.Position(1) = las_pix - n_pix_ext;
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
set(h_fig.Children, 'Units', 'pixels')
h_fig.Position(3) = las_pix;
h_fig.Renderer = 'painters';
h_fig.PaperSize(1) = rat_wid*h_fig.PaperSize(1);
h_fig.PaperUnits = 'normalized';
h_fig.PaperPosition = [0 0 1 1];
end

function h_fig = plo_cor_map_ove(r_pla_icx_row_col, log_pla_roi_row_col, log_roi, ind_pla_roi)
[h_fig, ~, ~] = fig;
con_fil = matfile('\\home.ansatt.ntnu.no\kadiram\Documents\MATLAB\con_esp.mat');

n_col_fig = 2;
n_row_fig = 1;
n_pix_ext = 150;

gap_ver_row = 0.070*ones(n_row_fig, 1);
% gap_hor_row_col = 0.005*ones(n_row_fig, n_col_fig);
% mar_bot = 0.070;
% mar_top = 0.030;
% mar_lef = 0.000;
% mar_rig = 0.070;
% asp_rat = con_fil.asp_rat;
% asp_rat_axe = asp_rat.cal.ori*ones(n_row_fig*n_col_fig, 1);
% wid = false;
% sca_axe = 1;
% [hax_sub, pos_axe, hei_axe, dis_asp_rat, las_pix, rat_wid] = tight_subplot_gen(n_row_fig, n_col_fig, ...
%     gap_ver_row, gap_hor_row_col, mar_bot, mar_top, mar_lef, mar_rig, asp_rat_axe, fig_wid, ...
%     fig_hei, wid, sca_axe, n_pix_ext);

wid_axe = 3.2241*ones(n_row_fig, n_col_fig);% aspect ratio mismatch, fix, then crop height!
hei_axe = 5.275*ones(n_row_fig, n_col_fig);
gap_hor_row_col = 0.6*ones(n_row_fig, n_col_fig);
[hax_sub, ~, las_pix, rat_wid] = gen_mul_axe(h_fig, wid_axe, hei_axe, gap_hor_row_col, ...
    gap_ver_row, n_pix_ext);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
log_roi.non = ~log_roi.tai.srt.inh & ~log_roi.tai.srt.exc;
lim_r = 0.5;
r_lim = [-lim_r lim_r];
map = con_fil.map;
map = map.sym;
y_lab = con_fil.y_lab;
n_row = con_fil.n_row;
n_col = con_fil.n_col;
n_row = n_row.cal;
n_col = n_col.cal;
log_row_col.tru = true(n_row, n_col);
log_row_col.fal = false(n_row, n_col);% all false, selecting nothing
alp = 0.5;
ang = 0;
fie_ana = 'dor';
fun_pla = con_fil.fun_pla;
fon_siz = con_fil.fon_siz;
fon_siz = fon_siz.pub;
for row = 1:n_row_fig
    for col = 1:n_col_fig
        hax = hax_sub((row - 1)*n_col_fig + col);
        if col == 1
            fie = 'exc';
        elseif col == 2
            fie = 'inh';
        end
        for pla = fun_pla.(fie_ana)
            piv_row_col_pcx = ext_piv_row_col_pcx(r_pla_icx_row_col.(fie){pla, 1}, r_lim, map);
            log_roi_row_col = log_pla_roi_row_col{pla};
            log_row_col.axo = logical(sum(cat(3, log_roi_row_col{:}), 3));
            ind_roi = ind_pla_roi{pla};
            log_row_col.exc = logical(sum(cat(3, log_roi_row_col{log_roi.tai.srt.exc(ind_roi)}), 3));
            if isempty(log_row_col.exc)
                log_row_col.exc = false(n_row, n_col);
            end
            log_row_col_pcx.exc = cat(3, log_row_col.exc, log_row_col.exc, log_row_col.exc);
            piv_row_col_pcx.abs(log_row_col_pcx.exc) = 0;
            log_row_col.inh = logical(sum(cat(3, log_roi_row_col{log_roi.tai.srt.inh(ind_roi)}), 3));
            if isempty(log_row_col.inh)
                log_row_col.inh = false(n_row, n_col);
            end
            log_row_col_pcx.inh = cat(3, log_row_col.inh, log_row_col.inh, log_row_col.inh);
            piv_row_col_pcx.abs(log_row_col_pcx.inh) = 0;
            log_row_col.non = logical(sum(cat(3, log_roi_row_col{log_roi.non(ind_roi)}), 3));
            log_row_col_pcx.non = cat(3, log_row_col.non, log_row_col.non, log_row_col.non);
            piv_row_col_pcx.abs(log_row_col_pcx.non) = 0;
            piv_row_col_pcx.abs = imrotate(piv_row_col_pcx.abs, ang);

            log_row_col.zer = sum(piv_row_col_pcx.abs, 3) == 0;
            log_row_col_pcx.zer = repmat(log_row_col.zer, 1, 1, 3);
            log_row_col_pcx.zer(imrotate(log_row_col_pcx.exc, ang) | imrotate(log_row_col_pcx.inh, ...
                ang) | imrotate(log_row_col_pcx.non, ang)) = false;
            piv_row_col_pcx.abs(log_row_col_pcx.zer) = 1;

            ima = sho_ima.rgb(hax, piv_row_col_pcx);
            ima.AlphaData = alp;
            hold(hax, "on")
        end
        if col == 1
            title(hax, 'excited correlations', 'FontWeight', 'normal', 'FontSize', fon_siz)
        elseif col == 2
            title(hax, 'inhibited correlations', 'FontWeight', 'normal', 'FontSize', fon_siz)
        end
    end
    hax.Colormap = map;

    col = colorbar(hax);
    col.Ticks = [0 0.5 1];
    col.TickLabels = [-lim_r 0 lim_r];
    col.Label.String = y_lab.cor;
    col.Units = "pixels";
    col.Position(1) = las_pix - n_pix_ext;
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
h_fig = opt_h_fig(h_fig, las_pix, rat_wid, n_pix_ext);
end

function piv_row_col_pcx = fix_piv_row_col_pcx(piv_row_col_pcx)
log_row_col.zer = sum(piv_row_col_pcx.abs, 3) == 0;
log_row_col_pcx.zer = repmat(log_row_col.zer, 1, 1, 3);
piv_row_col_pcx.abs(log_row_col_pcx.zer) = 1;
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% axo onl
function h_fig = plo_axo_sin(piv_pla_row_col, dff_fra_bin, ind_pla_bin, log_pla_row_col, ...
    per_bin_edg)
[h_fig, fig_wid, fig_hei] = fig;
n_row = 2;
con_fil = matfile('\\home.ansatt.ntnu.no\kadiram\Documents\MATLAB\con_esp.mat');
n_pla = con_fil.n_pla;
fun_pla = con_fil.fun_pla;
n_col = n_pla.neu.fun;
gap_ver_row = 0.010*ones(n_row, 1);
gap_hor_row_col = 0.001*ones(n_row, n_col);
mar_bot = 0.001;
mar_top = 0.050;
mar_lef = 0.001;
mar_rig = 0.070;
asp_rat = con_fil.asp_rat;
asp_rat_axe = asp_rat.cal.ori*ones(n_row*n_col);
wid = true;
sca_axe = 1;
n_pix_ext = 50;
[hax_sub, ~, ~, ~, ~, ~] = tight_subplot_gen(n_row, n_col, ...
    gap_ver_row, gap_hor_row_col, mar_bot, mar_top, mar_lef, mar_rig, asp_rat_axe, fig_wid, ...
    fig_hei, wid, sca_axe, n_pix_ext);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
bin_siz = con_fil.bin_siz;
bin_siz = bin_siz.ima;
tim_fra = con_fil.tim_fra;
win_len = con_fil.win_len;
dff_bin_win = com_ave_amp_uni_win(tim_fra.cal.eig.tri.dff, dff_fra_bin, win_len.dff.pha.drn.tai);
dff_bin.all = dff_bin_win(:, 2);
col_lim = con_fil.col_lim;
col_lim = col_lim.sin;
map = con_fil.map;
map = map.asy;
red = 0.01;
for row = 1:n_row
    ind = 0;
    for pla = fun_pla.plo
        ind = ind + 1;
        hax = hax_sub((row - 1)*n_col + ind);
        if row == 1
            piv_row_col = piv_pla_row_col{pla};% uint16, max eg 2214
            piv_row_col = adj_con(piv_row_col, per_bin_edg);
            %piv_row_col = bin_ima(piv_row_col, bin_siz);
            sho_ima.gra(hax, piv_row_col)
        else
            log_row_col = log_pla_row_col{pla};
            piv_row_col = bin_ima(log_row_col, bin_siz);
            log_row_col = piv_row_col > 0;

            dff_bin.pla = dff_bin.all(ind_pla_bin{pla});

            dff_row_col = double(log_row_col);
            dff_row_col(log_row_col) = dff_bin.pla;

            sho_ima.gra_ran(hax, dff_row_col, col_lim)
            colormap(hax, map);
            if ind == n_col
                col_bar = colorbar(hax);
                pos_i_j = hax.Position;
                col_bar.Position = [pos_i_j(1) + pos_i_j(3) + 0.005 pos_i_j(2) + red ...
                    0.01 pos_i_j(4) - 2*red];
                col_bar.Label.String = '\DeltaF/F (%)';
            end
        end
    end
end
hax.FontSize = 30;
end

function h_fig = plo_axo_sin_pix(piv_pla_row_col, dff_fra_pix, ind_pla_pix, log_pla_row_col, ...
    per_bin_edg)
[h_fig, fig_wid, fig_hei] = fig;
n_row = 2;
con_fil = matfile('\\home.ansatt.ntnu.no\kadiram\Documents\MATLAB\con_esp.mat');
n_pla = con_fil.n_pla;
fun_pla = con_fil.fun_pla;
n_col = n_pla.neu.fun;
gap_ver_row = 0.010*ones(n_row, 1);
gap_hor_row_col = 0.001*ones(n_row, n_col);
mar_bot = 0.001;
mar_top = 0.050;
mar_lef = 0.001;
mar_rig = 0.070;
asp_rat = con_fil.asp_rat;
asp_rat_axe = asp_rat.cal.ori*ones(n_row*n_col);
wid = true;
sca_axe = 1;
n_pix_ext = 50;
[hax_sub, ~, ~, ~, ~, ~] = tight_subplot_gen(n_row, n_col, ...
    gap_ver_row, gap_hor_row_col, mar_bot, mar_top, mar_lef, mar_rig, asp_rat_axe, fig_wid, ...
    fig_hei, wid, sca_axe, n_pix_ext);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
tim_fra = con_fil.tim_fra;
win_len = con_fil.win_len;
dff_pix_win = com_ave_amp_uni_win(tim_fra.cal.eig.tri.dff, dff_fra_pix, win_len.dff.pha.drn.tai);
dff_pix.all = dff_pix_win(:, 2);
col_lim = con_fil.col_lim;
col_lim = col_lim.sin;
map = con_fil.map;
map = map.asy;
red = 0.01;
for i = 1:n_row
    ind = 0;
    for pla = fun_pla.plo
        ind = ind + 1;
        hax = hax_sub((i - 1)*n_col + ind);
        if i == 1
            piv_row_col = piv_pla_row_col{pla};% uint16, max eg 2214
            piv_row_col = adj_con(piv_row_col, per_bin_edg);
            sho_ima.gra(hax, piv_row_col)
        else
            log_row_col = log_pla_row_col{pla};
            dff_row_col = double(log_row_col);
            dff_pix.pla = dff_pix.all(ind_pla_pix{pla});
            dff_row_col(log_row_col) = dff_pix.pla;
            sho_ima.gra_ran(hax, dff_row_col, col_lim)
            colormap(hax, map);
            if ind == n_col
                col_bar = colorbar(hax);
                pos_i_j = hax.Position;
                col_bar.Position = [pos_i_j(1) + pos_i_j(3) + 0.005 pos_i_j(2) + red ...
                    0.01 pos_i_j(4) - 2*red];
                col_bar.Label.String = '\DeltaF/F (%)';
            end
        end
    end
end
hax.FontSize = 30;
end

function h_fig = plo_inh_exc_sig(dff_con_pla_fra_pix, con_num, ind_con_pla_pix)
col_lim = [-20 40];
col_cod = '\DeltaF/F (%)';
[h_fig, fig_wid, fig_hei] = fig;
n_row = 4;
n_col = 7;
mar_bot = 0.000;
mar_top = 0.040;
mar_lef = 0.040;
mar_rig = 0.030;
asp_rat_axe = ones(n_row*n_col, 1);
gap_ver_row = 0.070*ones(1, n_row);
gap_hor_row_col = 0.040*ones(n_row, n_col);
wid = true;
sca_axe = ones(n_row*n_col, 1);
n_pix_ext = 70;
[hax_sub, ~, ~, ~, ~, ~] = tight_subplot_gen(n_row, n_col, ...
    gap_ver_row, gap_hor_row_col, mar_bot, mar_top, mar_lef, mar_rig, asp_rat_axe, fig_wid, ...
    fig_hei, wid, sca_axe, n_pix_ext);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
linkaxes(hax_sub(1:7))
linkaxes(hax_sub(15:21))
col_han_pos = [0.97 0.380 0.005 0.150];
y_min_top = inf;
y_max_top = -inf;
y_min_bot = inf;
y_max_bot = -inf;
con_fil = matfile('\\home.ansatt.ntnu.no\kadiram\Documents\MATLAB\con_esp.mat');
fun_pla = con_fil.fun_pla;
ind = 0;
tim_fra = con_fil.tim_fra;
n_fra = con_fil.n_fra;
con_sti = con_fil.con_sti;
col = 'k';
log_smo = true;
%log_smo = false;
for pla_num = fun_pla.plo
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% signals
    ind = ind + 1;
    hax = hax_sub(ind);
    [~, ~] = plo_sha_gen(hax, tim_fra.cal.eig.tri.dff, dff_con_pla_fra_pix.inh...
        {con_num, pla_num}, col, log_smo, n_fra.dff.eig);
    [y_min_top, y_max_top, hax] = adj_y(hax, y_min_top, y_max_top);
    if pla_num == 6
        title(hax, con_sti{con_num})
    end
    hax = hax_sub(ind + 2*n_col);
    [~, ~] = plo_sha_gen(hax, tim_fra.cal.eig.tri.dff, dff_con_pla_fra_pix.exc...
        {con_num, pla_num}, col, log_smo, n_fra.dff.eig);
    [y_min_bot, y_max_bot, ~] = adj_y(hax, y_min_bot, y_max_bot);
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% images
    hax = hax_sub(ind + n_col);
    ima(hax, tim_fra.cal.eig.tri.dff, dff_con_pla_fra_pix.inh{con_num, pla_num}...
        (:, ind_con_pla_pix.inh{con_num, pla_num})')
    %caxis(hax, col_lim)%ed
    colormap(hax, hot)
    hax = hax_sub(ind + 3*n_col);
    ima(hax, tim_fra.cal.eig.tri.dff, dff_con_pla_fra_pix.exc{con_num, pla_num}...
        (:, ind_con_pla_pix.exc{con_num, pla_num})')
    %caxis(hax, col_lim)%ed
    colormap(hax, hot)
    if pla_num == fun_pla.plo(end)
        col_han = colorbar('Ticks', col_lim);
        col_han.Position = col_han_pos;
        col_han.Label.String = col_cod;
        col_han.Label.Units = 'normalized';
        col_han.Label.Position(1) = 1.5;
    end
end
end

function h_fig = plo_exc_inh_sig(dff_con_pla_fra_pix, con_num, ind_con_pla_pix)
col_cod = '\DeltaF/F (%)';
[h_fig, fig_wid, fig_hei] = fig;
n_row = 3;
n_col = 7;
mar_bot = 0.000;
mar_top = 0.040;
mar_lef = 0.045;
mar_rig = 0.035;
asp_rat_axe = ones(n_row*n_col, 1);
asp_rat_axe(8:14) = 0.5;
gap_ver_row = 0.070*ones(1, n_row);
gap_hor_row_col = 0.055*ones(n_row, n_col);
wid = true;
sca_axe = ones(n_row*n_col, 1);
n_pix_ext = 70;
[hax_sub, ~, ~, ~, ~, ~] = tight_subplot_gen(n_row, n_col, ...
    gap_ver_row, gap_hor_row_col, mar_bot, mar_top, mar_lef, mar_rig, asp_rat_axe, fig_wid, ...
    fig_hei, wid, sca_axe, n_pix_ext);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
linkaxes(hax_sub(1:7))
linkaxes(hax_sub(15:21))
col_han_pos = [0.97 0.380 0.005 0.150];
y_min_top = inf;
y_max_top = -inf;
y_min_bot = inf;
y_max_bot = -inf;
con_fil = matfile('\\home.ansatt.ntnu.no\kadiram\Documents\MATLAB\con_esp.mat');
fun_pla = con_fil.fun_pla;
ind = 0;
tim_fra = con_fil.tim_fra;
n_fra = con_fil.n_fra;
con_sti = con_fil.con_sti;
col = 'k';
log_smo = true;
per = 10;
col_lim = [-20 40];
for pla_num = fun_pla.plo
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% signals
    ind = ind + 1;
    hax = hax_sub(ind);
    ele_row = ind_con_pla_pix.all{con_num, pla_num};
    num_row = ext_ele_row(ele_row, per);
    [~, ~] = plo_sha_gen(hax, tim_fra.cal.eig.tri.dff, dff_con_pla_fra_pix.all...
        {con_num, pla_num}(:, num_row.top), col, log_smo, n_fra.dff.eig);
    [y_min_top, y_max_top, hax] = adj_y(hax, y_min_top, y_max_top);
    if pla_num == 6
        title(hax, con_sti{con_num})
    end
    hax = hax_sub(ind + 2*n_col);
    [~, ~] = plo_sha_gen(hax, tim_fra.cal.eig.tri.dff, dff_con_pla_fra_pix.all...
        {con_num, pla_num}(:, num_row.bot), col, log_smo, n_fra.dff.eig);
    [y_min_bot, y_max_bot, ~] = adj_y(hax, y_min_bot, y_max_bot);
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% image
    hax = hax_sub(ind + n_col);
    ima(hax, tim_fra.cal.eig.tri.dff, dff_con_pla_fra_pix.all{con_num, pla_num}...
        (:, ind_con_pla_pix.all{con_num, pla_num})')
    hax.YAxis.Exponent = 0;
    %caxis(hax, col_lim)%ed
    colormap(hax, hot)
    if pla_num == fun_pla.plo(end)
        col_han = colorbar(hax, 'Ticks', col_lim);
        col_han.Position = col_han_pos;
        col_han.Label.String = col_cod;
        col_han.Label.Units = 'normalized';
        col_han.Label.Position(1) = 1.5;
    end
end
end

function h_fig = plo_exc_inh_sig_tes(dff_con_pla_fra_pix, con_num)
col_lim = [-20 40];
col_cod = '\DeltaF/F (%)';
[h_fig, fig_wid, fig_hei] = fig;
n_row = 3;
n_col = 7;
mar_bot = 0.000;
mar_top = 0.040;
mar_lef = 0.045;
mar_rig = 0.035;
asp_rat_axe = ones(n_row*n_col, 1);
asp_rat_axe(8:14) = 0.5;
gap_ver_row = 0.070*ones(1, n_row);
gap_hor_row_col = 0.055*ones(n_row, n_col);
wid = true;
sca_axe = ones(n_row*n_col, 1);
n_pix_ext = 70;
[hax_sub, ~, ~, ~, ~, ~] = tight_subplot_gen(n_row, n_col, ...
    gap_ver_row, gap_hor_row_col, mar_bot, mar_top, mar_lef, mar_rig, asp_rat_axe, fig_wid, ...
    fig_hei, wid, sca_axe, n_pix_ext);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
con_fil = matfile('\\home.ansatt.ntnu.no\kadiram\Documents\MATLAB\con_esp.mat');
tim_fra = con_fil.tim_fra;
n_pla = con_fil.n_pla;
n_con = con_fil.n_con;
fun_pla = con_fil.fun_pla;
dff_con_pla_pix_win.all = cell(n_con, n_pla.neu.raw);
% window-averaged activity
for pla_num = fun_pla.raw
    n_pix = size(dff_con_pla_fra_pix.all{1, pla_num}, 2);
    for i = 1:n_con
        dff_con_pla_pix_win.all{i, pla_num} = nan(n_pix, 3);
        % window averaging
        log_pha = tim_fra.cal.eig.tri.dff > 0 & tim_fra.cal.eig.tri.dff < 10;
        dff_con_pla_pix_win.all{i, pla_num}(:, 1) = nan;
        dff_con_pla_pix_win.all{i, pla_num}(:, 2) = mean...
            (dff_con_pla_fra_pix.all{i, pla_num}(log_pha, :), 'omitnan');
        dff_con_pla_pix_win.all{i, pla_num}(:, 3) = nan;
    end
end
ind_con_pla_pix.all = cell(n_con, n_pla.neu.raw);
win_num = 2;
for con_nux = 1:n_con
    for pla_num = fun_pla.raw
        [~, ind_pix] = sort(dff_con_pla_pix_win.all{con_nux, pla_num}(:, win_num), 'descend');
        ind_con_pla_pix.all{con_nux, pla_num} = ind_pix;
    end
end
linkaxes(hax_sub(1:7))
linkaxes(hax_sub(15:21))
col_han_pos = [0.97 0.380 0.005 0.150];
y_min_top = inf;
y_max_top = -inf;
y_min_bot = inf;
y_max_bot = -inf;
ind = 0;
tim_fra = con_fil.tim_fra;
n_fra = con_fil.n_fra;
con_sti = con_fil.con_sti;
col = 'k';
log_smo = true;
per = 10;
for pla_num = fun_pla.plo
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% signals
    ind = ind + 1;
    hax = hax_sub(ind);
    ele_row = ind_con_pla_pix.all{con_num, pla_num};
    num_row = ext_ele_row(ele_row, per);
    [~, ~] = plo_sha_gen(hax, tim_fra.cal.eig.tri.dff, dff_con_pla_fra_pix.all...
        {con_num, pla_num}(:, num_row.top), col, log_smo, n_fra.dff.eig);
    [y_min_top, y_max_top, hax] = adj_y(hax, y_min_top, y_max_top);
    if pla_num == 6
        title(hax, con_sti{con_num})
    end
    hax = hax_sub(ind + 2*n_col);
    [~, ~] = plo_sha_gen(hax, tim_fra.cal.eig.tri.dff, dff_con_pla_fra_pix.all...
        {con_num, pla_num}(:, num_row.bot), col, log_smo, n_fra.dff.eig);
    [y_min_bot, y_max_bot, ~] = adj_y(hax, y_min_bot, y_max_bot);
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% image
    hax = hax_sub(ind + n_col);
    ima(hax, tim_fra.cal.eig.tri.dff, dff_con_pla_fra_pix.all{con_num, pla_num}...
        (:, ind_con_pla_pix.all{con_num, pla_num})')
    hax.YAxis.Exponent = 0;
    %caxis(hax, col_lim)%ed
    colormap(hax, hot)
    if pla_num == fun_pla.plo(end)
        col_han = colorbar('Ticks', col_lim);
        col_han.Position = col_han_pos;
        col_han.Label.String = col_cod;
        col_han.Label.Units = 'normalized';
        col_han.Label.Position(1) = 1.5;
    end
end
end

function h_fig = plo_inh_exc_map(res_pla_con_row_col)
[h_fig, fig_wid, fig_hei] = fig;
con_fil = matfile('\\home.ansatt.ntnu.no\kadiram\Documents\MATLAB\con_esp.mat');
n_row = con_fil.n_con;
n_pla = con_fil.n_pla;
fun_pla = con_fil.fun_pla;
n_col = n_pla.neu.fun;
gap_ver_row = 0.000*ones(n_row, 1);
gap_hor_row_col = 0.005*ones(n_row, n_col);
mar_bot = 0.000;
mar_top = 0.000;
mar_lef = 0.000;
mar_rig = 0.070;
asp_rat = con_fil.asp_rat;
asp_rat_axe = asp_rat.cal.ori*ones(1, n_row*n_col);
if n_row == 2
    wid = true;
else
    wid = false;
end
sca_axe = 1;
n_pix_ext = 130;
[hax_sub, ~, ~, ~, las_pix, rat_wid] = tight_subplot_gen(n_row, n_col, ...
    gap_ver_row, gap_hor_row_col, mar_bot, mar_top, mar_lef, mar_rig, asp_rat_axe, fig_wid, ...
    fig_hei, wid, sca_axe, n_pix_ext);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
lim_r = 1;
r_lim = [-lim_r lim_r];
%piv_col_pcx = con_fil.piv_col_pcx;

piv = 0.94;
piv_col_pcx = [0 0 1
    piv piv piv
    1 0 0];
for i = 1:n_row
    for j = 1:n_col
        hax = hax_sub((i - 1)*n_col + j);
        pla_num = fun_pla.plo(1, j);
        piv_row_col_pcx = ext_piv_row_col_pcx(res_pla_con_row_col{pla_num, i}, r_lim, piv_col_pcx);
        sho_ima.rgb(hax, piv_row_col_pcx)
    end
end
hax.Colormap = piv_col_pcx;
col = colorbar(hax);
col.Ticks = [0 0.5 1];
rou_lim = round(lim_r, 3);
col.TickLabels = [-rou_lim 0 rou_lim];
col.Units = "pixels";
col.Position(1) = las_pix - n_pix_ext + 10;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
set(h_fig.Children, 'Units', 'pixels')
h_fig.Position(3) = las_pix;
h_fig.Renderer = 'painters';
h_fig.PaperSize(1) = rat_wid*h_fig.PaperSize(1);
h_fig.PaperUnits = 'normalized';
h_fig.PaperPosition = [0 0 1 1];
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% cel onl
function h_fig = plo_neu_sin(piv_pla_row_col, dff_fra_cel, n_cel_pla, cel_pla_row_col)
[h_fig, fig_wid, fig_hei] = fig;
con_fil = matfile('\\home.ansatt.ntnu.no\kadiram\Documents\MATLAB\con_esp.mat');
n_row = 1;
n_col = 2;
gap_ver_row = 0.005*ones(n_row, 1);
gap_hor_row_col = 0.005*ones(n_row, n_col);
mar = 0.000;
mar_bot = 0.005;
mar_top = 0.050;
mar_lef = 0.005;
mar_rig = mar;
asp_rat = con_fil.asp_rat;
n_sub = n_row*n_col;
asp_rat_axe = asp_rat.cal.ori*ones(n_sub, 1);
wid = false;
sca_axe = 1;
n_pix_ext = 0;
[hax_sub, ~, ~, ~, ~, ~] = tight_subplot_gen(n_row, n_col, ...
    gap_ver_row, gap_hor_row_col, mar_bot, mar_top, mar_lef, mar_rig, asp_rat_axe, fig_wid, ...
    fig_hei, wid, sca_axe, n_pix_ext);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
pla = 3;
piv_row_col = piv_pla_row_col{pla};
per_bin_edg = 30;
piv_row_col = adj_con(piv_row_col, per_bin_edg);
red = 0.01;
fon_siz = 30;
dff_fra_cel = dff_fra_cel(:, sum(n_cel_pla(1:pla - 1), "omitnan") + 1:sum(n_cel_pla(1:pla), ...
    "omitnan"));
fra_rat = con_fil.fra_rat;
fra_rat = fra_rat.cal.eig;
dff_cel = mean(dff_fra_cel(ceil(fra_rat*60):ceil(fra_rat*65), :), 1);
col_lim = con_fil.col_lim;
col_lim = col_lim.sin;
map = con_fil.map;
map = map.asy;
for col = 1:n_col
    hax = hax_sub(col);
    if col == 1
        sho_ima.gra(hax, piv_row_col)
    else
        dff_row_col = ext_res_row_col(cel_pla_row_col{pla}, dff_cel);
        dff_row_col(isnan(dff_row_col)) = 0;
        sho_ima.gra_ran(hax, dff_row_col, col_lim)
        colormap(hax, map);
        col_bar = colorbar(hax);
        pos_i_j = hax.Position;
        col_bar.Position = [pos_i_j(1) + pos_i_j(3) + 0.005 pos_i_j(2) + red ...
            0.01 pos_i_j(4) - 2*red];
        col_bar.Label.String = '\DeltaF/F (%)';
    end
    hax.FontSize = fon_siz;
    hax.Visible = 'off';
end
end

function h_fig = plo_cor_dis(pcc_blo)
[h_fig, fig_wid, fig_hei] = fig;
con_fil = matfile('\\home.ansatt.ntnu.no\kadiram\Documents\MATLAB\con_esp.mat');
n_row = 1;
n_col = 1;
gap_ver_row = 0.000*ones(n_row, 1);
gap_hor_row_col = 0.005*ones(n_row, n_col);
mar_bot = 0.000;
mar_top = 0.000;
mar_lef = 0.000;
mar_rig = 0.070;
asp_rat = con_fil.asp_rat;
asp_rat_axe = asp_rat.cal.ori*ones(1, n_row*n_col);
if n_row == 2
    wid = true;
else
    wid = false;
end
sca_axe = 1;
n_pix_ext = 130;
[hax_sub, ~, ~, ~, las_pix, rat_wid] = tight_subplot_gen(n_row, n_col, ...
    gap_ver_row, gap_hor_row_col, mar_bot, mar_top, mar_lef, mar_rig, asp_rat_axe, fig_wid, ...
    fig_hei, wid, sca_axe, n_pix_ext);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
dis_blo = con_fil.dis_blo;
plot(hax_sub(1), dis_blo.wre, pcc_blo.pos)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
set(h_fig.Children, 'Units', 'pixels')
h_fig.Position(3) = las_pix;
h_fig.Renderer = 'painters';
h_fig.PaperSize(1) = rat_wid*h_fig.PaperSize(1);
h_fig.PaperUnits = 'normalized';
h_fig.PaperPosition = [0 0 1 1];
end

function h_fig = plo_ong(clu_cel, dff_fra_pix)
[h_fig, fig_wid, fig_hei] = fig;
con_fil = matfile('\\home.ansatt.ntnu.no\kadiram\Documents\MATLAB\con_esp.mat');
n_clu = max(clu_cel);
n_row = n_clu;
n_col = 1;

% gap_ver_row = 0.020*ones(n_row, 1);
% gap_hor_row_col = 0.000*ones(n_row, n_col);
% mar_bot = 0.050;
% mar_top = 0.050;
% mar_lef = 0.050;
% mar_rig = 0.000;

gap_ver_row = 0.005*ones(n_row, 1);
gap_hor_row_col = 0.000*ones(n_row, n_col);
mar_top = 0.200;
mar_bot = 0.050;
wid = 7;% ewelina
mar_lef = cal_mar_lef(wid);
mar_rig = 0.005;

asp_rat_axe = nan(n_row*n_col, 1);
n_fra = con_fil.n_fra;
n_cel_clu = cal_n_cel_clu(clu_cel);
for clu = 1:n_clu
    asp_rat_axe(clu) = n_fra.cal.eig.ong/n_cel_clu(clu);
end
wid = true;
sca_axe = 1;
n_pix_ext = 20;
[hax_sub, ~, ~, ~, las_pix, rat_wid] = tight_subplot_gen(n_row, n_col, ...
    gap_ver_row, gap_hor_row_col, mar_bot, mar_top, mar_lef, mar_rig, asp_rat_axe, fig_wid, ...
    fig_hei, wid, sca_axe, n_pix_ext);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
tim_epo_fra = con_fil.tim_epo_fra;
epo = 1;
col_lim = con_fil.col_lim;
y_lab = con_fil.y_lab;
y_lab.neu_num = 'N. #';
y_lab.dff_ = '\Delta. (%)';
x_lab = con_fil.x_lab;
fon_siz = con_fil.fon_siz;
map = con_fil.map;
for clu = 1:n_clu
    log_pix = clu_cel == clu;
    hax = hax_sub(clu);
    ima(hax, tim_epo_fra.cal.eig{epo}, dff_fra_pix(:, log_pix)')% no sorting
    clim(hax, col_lim.clu)
    colormap(hax, map.sym)
    if clu < n_clu
        hax.XAxis.Visible = 'off';
    else
        xlabel(hax, x_lab.tim)
    end
    hax.YAxis.Visible = 'off';
    hax = adj_hax(hax, fon_siz.pub);
end
shi = 0.002;
col = adj_col_han(hax, shi);
col.Position(3) = 0.002;
col.Label.String = y_lab.dff;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
set(h_fig.Children, 'Units', 'pixels')
h_fig.Position(3) = las_pix;
h_fig.Renderer = 'painters';
h_fig.PaperSize(1) = rat_wid*h_fig.PaperSize(1);
h_fig.PaperUnits = 'normalized';
h_fig.PaperPosition = [0 0 1 1];
end

function h_fig = plo_ong_two(clu_cel, dff_fra_cel)
[h_fig, fig_wid, fig_hei] = fig;
con_fil = matfile('\\home.ansatt.ntnu.no\kadiram\Documents\MATLAB\con_esp.mat');
n_clu = 4;
n_row = n_clu*2;
n_col = 1;

% gap_ver_row = 0.020*ones(n_row, 1);
% gap_ver_row(n_clu) = 0.070;
% gap_hor_row_col = 0.000*ones(n_row, n_col);
% mar_bot = 0.050;
% mar_top = 0.050;
% mar_lef = 0.050;
% mar_rig = 0.500;

gap_ver_row = 0.010*ones(n_row, 1);
gap_ver_row(n_clu) = 0.020;
gap_hor_row_col = 0.000*ones(n_row, n_col);
mar_top = 0.200;
mar_bot = 0.050;
wid = 7;% ewelina
mar_lef = cal_mar_lef(wid);
mar_rig = 0.022;

n_cel_clu.one = cal_n_cel_clu(clu_cel.one);
n_cel_clu.two = cal_n_cel_clu(clu_cel.two);
asp_rat = 10;
asp_rat_axe = asp_rat*ones(n_row*n_col, 1);
n_fra = con_fil.n_fra;
for row = 1:n_row
    if row <= n_clu
        asp_rat_axe(row) = n_fra.cal.eig.ong_two/n_cel_clu.one(row);
    else
        asp_rat_axe(row) = n_fra.cal.eig.ong_two/n_cel_clu.two(row - n_clu);
    end
end
wid = true;
sca_axe = 1;
n_pix_ext = 135;
[hax_sub, ~, ~, ~, las_pix, rat_wid] = tight_subplot_gen(n_row, n_col, ...
    gap_ver_row, gap_hor_row_col, mar_bot, mar_top, mar_lef, mar_rig, asp_rat_axe, fig_wid, ...
    fig_hei, wid, sca_axe, n_pix_ext);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
tim_fra = con_fil.tim_fra;
tim_fra = tim_fra.cal.eig.ong_one;
log_fra = con_fil.log_fra;
%col_lim = con_fil.col_lim;%ed
y_lab = con_fil.y_lab;
map = con_fil.map;
map = map.sym;
fon_siz = con_fil.fon_siz;
x_lab = con_fil.x_lab;
for row = 1:n_row
    hax = hax_sub(row);
    if row <= n_clu
        log_cel = clu_cel.one == row;
        ima(hax, tim_fra, dff_fra_cel(log_fra.cal.eig.ong_one, log_cel)')% no sorting
    else
        log_cel = clu_cel.two == row - n_clu;
        ima(hax, tim_fra, dff_fra_cel(log_fra.cal.eig.ong_two, log_cel)')% no sorting
    end
    %
    %caxis(hax, col_lim.clu)
    hax.Colormap = map;
    %
    if row < n_row
        hax.XAxis.Visible = 'off';
    else
        hax.XAxis.Label.String = x_lab.tim;
    end
    hax = adj_hax(hax, fon_siz.pub);
end
colorbar(hax)
shi = 0.002;
col = adj_col_han(hax, shi);
col.Position(3) = 0.002;
col.Label.String = y_lab.dff;
%
[~, h] = suplabel(y_lab.neu_num, 'y', [mar_lef + 0.022, mar_bot + 0.120, 1, 1]);
h.FontSize = fon_siz.pub;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
set(h_fig.Children, 'Units', 'pixels')
h_fig.Position(3) = las_pix;
h_fig.Renderer = 'painters';
h_fig.PaperSize(1) = rat_wid*h_fig.PaperSize(1);
h_fig.PaperUnits = 'normalized';
h_fig.PaperPosition = [0 0 1 1];
end

function h_fig = plo_clu_map_ani_two(x_cel, y_cel, z_cel, clu_cel, piv_col_pcx)
[h_fig, fig_wid, fig_hei] = fig;
con_fil = matfile('\\home.ansatt.ntnu.no\kadiram\Documents\MATLAB\con_esp.mat');
n_row = 2;
n_col = 1;
gap_ver_row = 0.000*ones(n_row, 1);
gap_hor_row_col = 0.000*ones(n_row, n_col);
mar = 0.000;
mar_bot = mar;
mar_top = mar;
mar_lef = mar;
mar_rig = mar;
asp_rat_axe = 1;
wid = false;
sca_axe = 1;
n_pix_ext = 0;
[hax_sub, ~, ~, ~, las_pix, rat_wid] = tight_subplot_gen(n_row, n_col, ...
    gap_ver_row, gap_hor_row_col, mar_bot, mar_top, mar_lef, mar_rig, asp_rat_axe, fig_wid, ...
    fig_hei, wid, sca_axe, n_pix_ext);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
mar_siz = 100;
xc = 0;
yc = 0;
zc = 0;
w = 50;
for row = 1:n_row
    hax = hax_sub(row);
    if row == 1
        scatter3(hax, x_cel, y_cel, z_cel, mar_siz, clu_cel.one, 'filled')
    else
        scatter3(hax, x_cel, y_cel, z_cel, mar_siz, clu_cel.two, 'filled')
    end
    asp_rat = con_fil.asp_rat;
    hax.PlotBoxAspectRatio = [1 asp_rat.cal.ori 1];
    colormap(hax, piv_col_pcx)
    view(hax, -120, 30)
    hax.XAxis.Visible = 'off';
    hax.YAxis.Visible = 'off';
    hax.ZAxis.Visible = 'off';
    axis(hax, 'equal')
    hax.XGrid = 'off';
    hax.YGrid = 'off';
    hax.ZGrid = 'off';
    scalebar_3d(hax, xc,yc,zc, w)
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
set(h_fig.Children, 'Units', 'pixels')
h_fig.Position(3) = las_pix;
h_fig.Renderer = 'painters';
h_fig.PaperSize(1) = rat_wid*h_fig.PaperSize(1);
h_fig.PaperUnits = 'normalized';
h_fig.PaperPosition = [0 0 1 1];
end

function h_fig = plo_tai_dff_drn(tai_ang_fra, piv_fra_cel, bou_ons_bou, log_cel)
[h_fig, fig_wid, fig_hei] = fig;
n_row = 2;
n_col = 1;
gap_ver_row = 0.020*ones(n_row, 1);
gap_hor_row_col = 0.030*ones(n_row, n_col);

% mar_bot = 0.080;
% mar_top = 0.010;
% mar_lef = 0.010;
% mar_rig = 0.015;
% asp_rat_axe = 7*ones(n_row*n_col, 1);
% wid = true;

hei = 6.45;
mar_top = cal_mar_top(hei);
mar_bot = 0.015;
mar_lef = 0.020;
mar_rig = 0.000;
asp_rat_axe = 3*ones(n_row*n_col, 1);
wid = false;

sca_axe = 1;
n_pix_ext = 50;
[hax_sub, ~, ~, ~, las_pix, rat_wid] = tight_subplot_gen(n_row, n_col, ...
    gap_ver_row, gap_hor_row_col, mar_bot, mar_top, mar_lef, mar_rig, asp_rat_axe, fig_wid, ...
    fig_hei, wid, sca_axe, n_pix_ext);
linkaxes(hax_sub, 'x')
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
hax = hax_sub(1);
con_fil = matfile('\\home.ansatt.ntnu.no\kadiram\Documents\MATLAB\con_esp.mat');
tim_fra = con_fil.tim_fra;
plo_tim_fra = tim_fra.ani.ses;
% tim_lim(1) = 60;
% tim_lim(2) = 1700;

tim_lim(1) = 120;
%tim_lim(2) = 550;
tim_lim(2) = 420;

plo_log_fra = (plo_tim_fra < tim_lim(2)) & (plo_tim_fra > tim_lim(1));
lin_wid_sig = 2;
plot(hax, plo_tim_fra(plo_log_fra), tai_ang_fra(plo_log_fra), 'LineWidth', lin_wid_sig)% axo

log_bou = (bou_ons_bou > tim_lim(1) & bou_ons_bou < tim_lim(2));
bou_ons_bou = bou_ons_bou(log_bou);

xline(hax, bou_ons_bou, '--k')
box(hax, 'off')
ylabel(hax, con_fil.y_lab_ang)
hax.XAxis.Visible = 'off';

fon_siz = con_fil.fon_siz;
mar_siz = con_fil.mar_siz;
mar_siz = mar_siz.pub;
log_lin_wid = true;
adj_hax(hax, fon_siz.pub, mar_siz, log_lin_wid)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
y_lab = con_fil.y_lab;
n_fra = con_fil.n_fra;

cax_tim_fra = tim_fra.cal.eig.ses.ent;
var_fra_cel.exc = piv_fra_cel(:, log_cel.exc);
var_fra_cel.inh = piv_fra_cel(:, log_cel.inh);

% fra_rat = con_fil.fra_rat;
% var_fra_cel.exc = resample(var_fra_cel.exc, cax_tim_fra, fra_rat.man);
% var_fra_cel.inh = resample(var_fra_cel.inh, cax_tim_fra, fra_rat.man);

hax = hax_sub(2);
col = 'r';
cax_log_fra = (cax_tim_fra < tim_lim(2)) & (cax_tim_fra > tim_lim(1));
plo_sha.smo_gen(hax, cax_tim_fra(cax_log_fra), var_fra_cel.exc(cax_log_fra, :), col, n_fra.dff.eig.smo)
hold(hax, "on")
plo_sha.smo_gen(hax, cax_tim_fra(cax_log_fra), var_fra_cel.inh(cax_log_fra, :), 'b', n_fra.dff.eig.smo)
xline(hax, bou_ons_bou, '--k')
box(hax, 'off')
ylabel(hax, y_lab.dff)
adj_hax(hax, fon_siz.pub, mar_siz, log_lin_wid)
align_Ylabels(h_fig, n_row)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
set(h_fig.Children, 'Units', 'pixels')
h_fig.Position(3) = las_pix;
h_fig.Renderer = 'painters';
h_fig.PaperSize(1) = rat_wid*h_fig.PaperSize(1);
h_fig.PaperUnits = 'normalized';
h_fig.PaperPosition = [0 0 1 1];
end

function h_fig = plo_vis_tai(piv_pla_row_col, dff_cel_fra, n_cel_pla, cel_pla_row_col)
[h_fig, fig_wid, fig_hei] = fig;
con_fil = matfile('\\home.ansatt.ntnu.no\kadiram\Documents\MATLAB\con_esp.mat');
n_row = 1;
n_col = 2;
gap_ver_row = 0.005*ones(n_row, 1);
gap_hor_row_col = 0.005*ones(n_row, n_col);
mar = 0.000;
mar_bot = 0.005;
mar_top = 0.050;
mar_lef = 0.005;
mar_rig = mar;
asp_rat = con_fil.asp_rat;
n_sub = n_row*n_col;
asp_rat_axe = asp_rat.cal.ori*ones(n_sub, 1);
wid = false;
sca_axe = 1;
n_pix_ext = 0;
[hax_sub, ~, ~, ~, ~, ~] = tight_subplot_gen(n_row, n_col, ...
    gap_ver_row, gap_hor_row_col, mar_bot, mar_top, mar_lef, mar_rig, asp_rat_axe, fig_wid, ...
    fig_hei, wid, sca_axe, n_pix_ext);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
pla = 3;
piv_row_col = piv_pla_row_col{pla};
per_bin_edg = 30;
piv_row_col = adj_con(piv_row_col, per_bin_edg);
red = 0.01;
fon_siz = 30;
dff_fra_cel = dff_cel_fra(sum(n_cel_pla(1:pla - 1), "omitnan") + 1:sum(n_cel_pla(1:pla), ...
    "omitnan"), :)';
tim_fra = con_fil.tim_fra;
tim_fra = tim_fra.cal.eig.tri.dff;
win_len = con_fil.win_len;
pha_win_len = win_len.dff.pha.drn.tai;
dff_cel_win = com_ave_amp_uni_win(tim_fra, dff_fra_cel, pha_win_len);
dff_cel = dff_cel_win(:, 2);
col_lim = [-10 10];
map = con_fil.map;
map = map.sym;
for col = 1:n_col
    hax = hax_sub(col);
    if col == 1
        sho_ima.gra(hax, piv_row_col)
    else
        dff_row_col = ext_res_row_col(cel_pla_row_col{pla}, dff_cel);
        dff_row_col(isnan(dff_row_col)) = 0;
        sho_ima.gra_ran(hax, dff_row_col, col_lim)
        colormap(hax, map);
        col_bar = colorbar(hax);
        pos_i_j = hax.Position;
        col_bar.Position = [pos_i_j(1) + pos_i_j(3) + 0.005 pos_i_j(2) + red ...
            0.01 pos_i_j(4) - 2*red];
        col_bar.Label.String = '\DeltaF/F (%)';
    end
    hax.FontSize = fon_siz;
    hax.Visible = 'off';
end
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% gab
function h_fig = plo_gab(piv_pla_row_col, ani, log_pla_row_col)
[h_fig, fig_wid, fig_hei] = fig;
n_row_fig = 2;
con_fil = matfile('\\home.ansatt.ntnu.no\kadiram\Documents\MATLAB\con_esp.mat');
n_pla = con_fil.n_pla;
fun_pla = con_fil.fun_pla;
n_col_fig = n_pla.neu.fun;
gap_ver_row = 0.010*ones(n_row_fig, 1);
gap_hor_row_col = 0.001*ones(n_row_fig, n_col_fig);
mar_bot = 0.001;
mar_top = 0.050;
mar_lef = 0.001;
mar_rig = 0.001;
asp_rat = con_fil.asp_rat;
asp_rat_axe = asp_rat.cal.ori*ones(n_row_fig*n_col_fig);
wid = true;
sca_axe = 1;
n_pix_ext = 50;
[hax_sub, ~, ~, ~, ~, ~] = tight_subplot_gen(n_row_fig, n_col_fig, ...
    gap_ver_row, gap_hor_row_col, mar_bot, mar_top, mar_lef, mar_rig, asp_rat_axe, fig_wid, ...
    fig_hei, wid, sca_axe, n_pix_ext);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
low_in.rel = 0;
%high_in.rel = con_fil.con;
high_in.rel = 0.03;
for i = 1:n_row_fig
    ind = 0;
    for pla_num = fun_pla.plo
        ind = ind + 1;
        hax = hax_sub((i - 1)*n_col_fig + ind);
        if i == 1
            piv_row_col = uint16(piv_pla_row_col.red_sub{pla_num});
            piv_row_col = imadjust(piv_row_col, [low_in.rel high_in.rel]);% red image
            % e.g. piv doesn't go up to high_in in the first plane, then max
            % piv is lower than 16bit max. output uint16.
            ima = sho_ima.raw(hax, piv_row_col);
            showMaskAsOverlay_kadir(0.2, log_pla_row_col.non.all{pla_num}, [0 1 0], ima)
            showMaskAsOverlay_kadir(0.2, log_pla_row_col.gab.all{pla_num}, [1 0 0], ima, false)
        else
            piv_row_col = uint16(piv_pla_row_col.gre{pla_num});
            piv_row_col = imadjust(piv_row_col, [low_in.rel high_in.rel]);
            ima = sho_ima.raw(hax, piv_row_col);
            showMaskAsOverlay_kadir(0.2, log_pla_row_col.non.all{pla_num}, [0 1 0], ima)
            showMaskAsOverlay_kadir(0.2, log_pla_row_col.gab.all{pla_num}, [1 0 0], ima, false)
        end
        if ind == 4 && i == 1
            title(hax, ani)
        end
    end
end
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% cell-based
function plo_cel(piv_ref_row_col, log_cel_reg, cel_lab_tel_chu_row_col)
    fig
    n_row = 1;
    n_col = 1;
    mar_bot = 0.000;
    mar_top = 0.070;
    mar_lef = 0.000;
    mar_rig = 0.000;
    gap_ver = 0.025;
    gap_hor = 0.000;
    asp_rat = 850/1536;
    tight_subplot_ima(n_row, n_col, [gap_ver gap_hor], [mar_bot mar_top], ...
        [mar_lef mar_rig], asp_rat)
    %
    piv_ref_row_col = imadjust(piv_ref_row_col);
    piv_ref_row_col = im2double(piv_ref_row_col);
    piv_red_row_col = piv_ref_row_col;
    piv_gre_row_col = piv_ref_row_col;
    piv_blu_row_col = piv_ref_row_col;
    %
    log_cel_reg_row_col = ext_log_cel_reg_row_col(cel_lab_tel_chu_row_col, log_cel_reg);
    % global n_reg_for
    % global int_reg_cha%ed
    for i = 4:n_reg_for
        piv_red_row_col(log_cel_reg_row_col{i}) = int_reg_cha(i, 1);
        piv_gre_row_col(log_cel_reg_row_col{i}) = int_reg_cha(i, 2);
        piv_blu_row_col(log_cel_reg_row_col{i}) = int_reg_cha(i, 3);
    end
    %
    piv_row_col_cha = cat(3, piv_red_row_col, piv_gre_row_col, piv_blu_row_col);
    imshow(piv_row_col_cha)
end

function log_cel_reg_row_col = ext_log_cel_reg_row_col(cel_lab_tel_chu_row_col, log_cel_reg)
%global n_reg_for%ed
log_cel_reg_row_col = cell(n_reg_for, 1);
cel_lab_tel_row_col = cel_lab_tel_chu_row_col{1};
for i = 4:n_reg_for
    cel_lab_reg_num = find(log_cel_reg(:, i));
    log_cel_reg_row_col{i} = ismember(cel_lab_tel_row_col, cel_lab_reg_num);
end
end

function h_fig = plo_ras_map(isort1, iclustup1, traces)
[h_fig, fig_wid, fig_hei] = fig;
n_row = 1;
n_col = 2;
gap = 0.040;
gap_ver_row = gap*ones(n_row, 1);
gap_hor_row_col = gap*ones(n_row, n_col);
mar_bot = 0.001;
mar_top = 0.040;
mar_lef = 0.030;
mar_rig = 0.001;
asp_rat_axe = [1 1.5];
wid = true;
sca_axe = [0.030 1.5];
n_pix_ext = 33;
[hax_sub, ~, ~, ~, ~, ~] = tight_subplot_gen(n_row, n_col, ...
    gap_ver_row, gap_hor_row_col, mar_bot, mar_top, mar_lef, mar_rig, asp_rat_axe, fig_wid, ...
    fig_hei, wid, sca_axe, n_pix_ext);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
x_lab ='Time (s)';
con_fil = matfile('\\home.ansatt.ntnu.no\kadiram\Documents\MATLAB\con_esp.mat');
sti_ons_tri = con_fil.sti_ons_tri;
tim_fra = con_fil.tim_fra;
log_fra = con_fil.log_fra;

sorted_idx=sort(iclustup1); %sort the cluster index for colorbar
%max_idx=max(iclustup1); %finding the max cluster index for colorbar%ed

ind = 1;
num = (ind - 1)*2 + 1;
hax = hax_sub(num);
imagesc(hax, sorted_idx);
set(hax,'xtick',[],'ytick',[],'ztick',[]);
colormap(hax,'jet');
%caxis(hax, [1 max_idx]);%ed
ylabel(hax, 'Cluster identity')

hax = hax_sub(num + 1);
ima(hax, tim_fra.cal.one.ses(log_fra.cal.one.ses), traces(isort1,:));
%caxis(hax, [-10 20]);%ed
colormap (hax, 'jet');
y = ylabel(hax, 'Neuron #');
y.Units = 'normalized';
y.Position(1) = y.Position(1) + 0.040;
xlabel(hax, 'Time (s)');
grid off

lef = hax.Position(1) + hax.Position(3) + 0.003;
col_han = colorbar;
col_han.Position(1) = lef;
col_han.Position(3) = hax_sub(1).Position(3);
col_han.Label.String = '\DeltaF/F (%)';

%set(hax, 'ytick', [], 'yticklabel', [])
xlabel(hax, x_lab)
lin_wid = 2;
plo_ver_lin(hax, round(sti_ons_tri.vrs.one.fra/18.61), 'k', lin_wid, '-')

box(hax, 'off')
%title(hax, 'Control')
%title(hax, 'Ablated')
end

% function h_fig = plo_ras_map_sub(traces, log_cel_reg)
% [h_fig, fig_wid, fig_hei] = fig;
% n_row = 1;
% n_col = 2;
% gap = 0.040;
% gap_ver_row = gap*ones(n_row, 1);
% gap_hor_row_col = gap*ones(n_row, n_col);
% mar_bot = 0.001;
% mar_top = 0.040;
% mar_lef = 0.030;
% mar_rig = 0.001;
% asp_rat_axe = [1 1.5];
% wid = true;
% sca_axe = [0.030 1.5];
% n_pix_ext = 33;
% [hax_sub, ~, ~, ~, ~, ~] = tight_subplot_gen(n_row, n_col, ...
%     gap_ver_row, gap_hor_row_col, mar_bot, mar_top, mar_lef, mar_rig, asp_rat_axe, fig_wid, ...
%     fig_hei, wid, sca_axe, n_pix_ext);
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ops.nC = 6; % number of clusters, default: 30
% ops.isort = []; % default is []
% ops.useGPU = 0; % if use GPU, set to 1
% ops.upsamp = 100; %upscaling factor, default is 100
% ops.sigUp = 1;
% %
% x_lab ='Time (s)';
% con_fil = matfile('\\home.ansatt.ntnu.no\kadiram\Documents\MATLAB\con_esp.mat');
% sti_ons_tri = con_fil.sti_ons_tri;
% tim_fra = con_fil.tim_fra;
% % log_fra = con_fil.log_fra;
% % log_cel = logical(sum(log_cel_reg.raw(:, con_fil.ind_sub_reg), 2));
% % traces = act_fra_cel.dff.raw.sli';
% % traces = traces(log_cel, log_fra.cal.one.ses);
% % log_cel_reg.raw = log_cel_reg.raw(log_cel, :);
% % n_cel = size(traces, 1);
% % 
% % parfor i = 1:n_cel
% %     traces(i, :) = fil_yak(traces(i, :));
% % end
% n_cel = size(traces, 1);
% log_fra = con_fil.log_fra;
% 
% max_npc = min(n_cel, 100);
% ops.iPC =1:max_npc; % number of principal component, default: 100
% [isort1, ~, iclustup1, ~, ~] = mapTmap(traces, ops);
% 
% 
% sorted_idx=sort(iclustup1); %sort the cluster index for colorbar
% %max_idx=max(iclustup1); %finding the max cluster index for colorbar%ed
% 
% sorted_traces = traces(isort1, :);
% sorted_log_cel_reg = log_cel_reg.raw(isort1, :);
% ind_cel = [];
% for i = con_fil.ind_sub_reg
%     ind_cel = [ind_cel; find(sorted_log_cel_reg(:, i))];
% end
% 
% ind = 1;
% num = (ind - 1)*2 + 1;
% hax = hax_sub(num);
% imagesc(hax, sorted_idx(ind_cel))
% set(hax,'xtick',[],'ytick',[],'ztick',[])
% colormap(hax,'jet')
% %caxis(hax, [1 max_idx])%ed
% %ylabel(hax, 'Cluster identity')
% 
% hax = hax_sub(num + 1);
% ima(hax, tim_fra.cal.one.ses(log_fra.cal.one.ses), sorted_traces(ind_cel, :));
% %caxis(hax, [-10 20]);%ed
% colormap (hax, 'jet');
% 
% set(hax, 'ytick', [], 'yticklabel', [])
% %y = ylabel(hax, 'Neuron #');
% %y.Units = 'normalized';
% %y.Position(1) = y.Position(1) + 0.040;
% 
% xlabel(hax, 'Time (s)');
% grid off
% 
% lef = hax.Position(1) + hax.Position(3) + 0.003;
% col_han = colorbar;
% col_han.Position(1) = lef;
% col_han.Position(3) = hax_sub(1).Position(3);
% col_han.Label.String = '\DeltaF/F (%)';
% 
% xlabel(hax, x_lab)
% lin_wid = 2;
% plo_ver_lin(hax, round(sti_ons_tri.vrs.one.fra/18.61), 'g', lin_wid, '-')
% 
% box(hax, 'off')
% title(hax, 'Control')
% %title(hax, 'Ablated')
% end

function h_fig = plo_clu_map(iclustup1, log_cel_reg, cel_lab_row_col)
[h_fig, fig_wid, fig_hei] = fig;
n_row = 1;
n_col = 1;
gap = 0.003;
gap_ver_row = gap*ones(n_row, 1);
gap_hor_row_col = gap*ones(n_row, n_col);
mar_bot = 0.001;
mar_top = 0.040;
mar_lef = 0.030;
mar_rig = 0.001;
asp_rat_axe = 1;
wid = false;
sca_axe = 1;
n_pix_ext = 33;
[hax, ~, ~, ~, ~, ~] = tight_subplot_gen(n_row, n_col, ...
    gap_ver_row, gap_hor_row_col, mar_bot, mar_top, mar_lef, mar_rig, asp_rat_axe, fig_wid, ...
    fig_hei, wid, sca_axe, n_pix_ext);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
con_fil = matfile('\\home.ansatt.ntnu.no\kadiram\Documents\MATLAB\con_esp.mat');
log_cel = logical(sum(log_cel_reg.raw(:, con_fil.ind_sub_reg), 2));
max_idx=max(iclustup1); %finding the max cluster index for colorbar
res_row_col = ext_ras_row_col(cel_lab_row_col, iclustup1, log_cel);
r_lim = [1 max_idx];
piv_row_col_pcx = ext_piv_row_col_pcx(flip(res_row_col), r_lim, jet);
sho_ima.rgb(hax, piv_row_col_pcx)
%ima = sho_ima.rgb(hax, flip(piv_row_col_pcx, 1));

%title(hax, 'Control')
%title(hax, 'Ablated')
end

function res_row_col = ext_ras_row_col(cel_row_col, res_cel, log_cel)
n_cel = max(max(cel_row_col));
% generate cellular map data
res_row_col = nan*cel_row_col;
ind = 0;
for i = 1:n_cel
    if log_cel(i)
        ind = ind + 1;
        log_lab_i = cel_row_col == i;
        res_row_col(log_lab_i) = res_cel(ind);
    end
end
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% gli
function h_fig = plo_tri_sig(dff_fra_tri)
[h_fig, fig_wid, fig_hei] = fig;
n_row = 2;
n_col = 1;
gap_ver_row = 0.005*ones(n_row, 1);
gap_hor_row_col = 0.005*ones(n_row, n_col);

% mar_bot = 0.040;
% mar_top = 0.040;
% mar_lef = 0.040;
% mar_rig = 0.000;

hei = 4.126;
mar_top = cal_mar_top(hei);
mar_bot = 0.030;
mar_lef = 0.020;
mar_rig = 0.000;

asp_rat_axe = [1*ones(n_col, 1); 1*ones(n_col, 1)];
wid = false;
sca_axe = ones(n_row*n_col, 1);
n_pix_ext = 200;
[hax_sub, ~, ~, ~, las_pix, rat_wid] = tight_subplot_gen(n_row, n_col, ...
    gap_ver_row, gap_hor_row_col, mar_bot, mar_top, mar_lef, mar_rig, asp_rat_axe, fig_wid, ...
    fig_hei, wid, sca_axe, n_pix_ext);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
con_fil = matfile('\\home.ansatt.ntnu.no\kadiram\Documents\MATLAB\con_esp.mat');
tim_fra = con_fil.tim_fra;
tim_fra = tim_fra.cal.eig.tri.dff;
col_han_pos = [0.31 0.380 0.005 0.150];
hax = hax_sub(1);
lim = 5;
col_lim = [-lim lim];
map = con_fil.map;
map = map.sym;

log_fra = tim_fra < 10;
tim_fra = tim_fra(log_fra);
dff_fra_tri = dff_fra_tri(log_fra, :);
n_fra = con_fil.n_fra;
dff_fra_tri_hea = smo_sam_poi_var(dff_fra_tri, n_fra.dff.eig.bas, n_fra.dff.eig.smo);
ima(hax, tim_fra, dff_fra_tri_hea')
hax.XAxis.Visible = 'off';
lin_wid = con_fil.lin_wid;
xline(hax, 0, '--k', 'LineWidth', lin_wid.two)
ylabel(hax, 'Trial')
%caxis(hax, col_lim)
hax.Colormap = map;
col_han = colorbar('Ticks', col_lim);
col_han.Position = col_han_pos;
col_cod = '\DeltaF/F (%)';
col_han.Label.String = col_cod;
col_han.Label.Units = 'normalized';
col_han.Label.Position(1) = 1.5;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% bar
col = colorbar(hax);
col.Units = "pixels";
%col.Position(1) = 600;
col.Position(1) = 100;
y_lab = con_fil.y_lab;
col.Label.String = y_lab.dff;

fon_siz = con_fil.fon_siz;
mar_siz = con_fil.mar_siz;
mar_siz = mar_siz.pub;
log_lin_wid = true;
adj_hax(hax, fon_siz.pub, mar_siz, log_lin_wid)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% sig
hax = hax_sub(2);
[~, ~] = plo_sha.smo_tri(hax, tim_fra, dff_fra_tri, [0 1 0], n_fra.dff.eig.bas, ...
    n_fra.dff.eig.smo);
%h = yline(hax_sig, 0, 'LineWidth', lin_wid.two);
xline(hax, 0, '--k', 'LineWidth', lin_wid.two)

% hax.XAxis.Visible = 'off';
% scalebarLength = 5;  % scalebar will be 10 micrometer long
% h_bar = scalebar(hax, 'x', scalebarLength, ' s', 'Location', 'southwestoutside');
% hax.YAxis.Visible = 'off';
% scalebarLength = 5;  % scalebar will be 10 micrometer long
% h_bar = scalebar(hax, 'y', scalebarLength, '%', 'Location', 'southwestoutside');

adj_hax(hax, fon_siz.pub, mar_siz, log_lin_wid)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
set(h_fig.Children, 'Units', 'pixels')
h_fig.Position(3) = las_pix;
h_fig.Renderer = 'painters';
h_fig.PaperSize(1) = rat_wid*h_fig.PaperSize(1);
h_fig.PaperUnits = 'normalized';
h_fig.PaperPosition = [0 0 1 1];
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% spo
function h_fig = plo_spo(clu_cel, dff_fra_pix, dur)
[h_fig, fig_wid, fig_hei] = fig;
con_fil = matfile('\\home.ansatt.ntnu.no\kadiram\Documents\MATLAB\con_esp.mat');
n_clu = max(clu_cel);
n_row = n_clu;
n_col = 1;

gap_ver_row = 0.020*ones(n_row, 1);
gap_hor_row_col = 0.000*ones(n_row, n_col);
mar_bot = 0.050;
mar_top = 0.050;
mar_lef = 0.010;
mar_rig = 0.050;

asp_rat_axe = nan(n_row*n_col, 1);
n_fra = con_fil.n_fra;
n_cel_clu = cal_n_cel_clu(clu_cel);
for clu = 1:n_clu
    asp_rat_axe(clu) = n_fra.cal.eig.ong/n_cel_clu(clu);
end
wid = true;
sca_axe = 1;
n_pix_ext = 200;
[hax_sub, ~, ~, ~, las_pix, rat_wid] = tight_subplot_gen(n_row, n_col, ...
    gap_ver_row, gap_hor_row_col, mar_bot, mar_top, mar_lef, mar_rig, asp_rat_axe, fig_wid, ...
    fig_hei, wid, sca_axe, n_pix_ext);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
ifi = con_fil.ifi;
tim_fra = (ifi.cal.eig:ifi.cal.eig:dur)';
%col_lim = con_fil.col_lim;
y_lab = con_fil.y_lab;
y_lab.neu_num = 'N. #';
y_lab.dff_ = '\Delta. (%)';
x_lab = con_fil.x_lab;
map = con_fil.map;
for clu = 1:n_clu
    log_pix = clu_cel == clu;
    hax = hax_sub(clu);
    ima(hax, tim_fra, dff_fra_pix(:, log_pix)')% no sorting
    %caxis(hax, col_lim.clu)
    colormap(hax, map.sym)
    if clu < n_clu
        hax.XAxis.Visible = 'off';
    else
        xlabel(hax, x_lab.tim)
    end
    hax.YAxis.Visible = 'off';
end
shi = 0.002;
col = adj_col_han(hax, shi);
col.Position(3) = 0.002;
col.Label.String = y_lab.dff;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
set(h_fig.Children, 'Units', 'pixels')
h_fig.Position(3) = las_pix;
h_fig.Renderer = 'painters';
h_fig.PaperSize(1) = rat_wid*h_fig.PaperSize(1);
h_fig.PaperUnits = 'normalized';
h_fig.PaperPosition = [0 0 1 1];
end

function h_fig = plo_tai_qui(clu_cel, dff_fra_pix, dur, tim_bin, rat_bin_par)
[h_fig, fig_wid, fig_hei] = fig;
con_fil = matfile('\\home.ansatt.ntnu.no\kadiram\Documents\MATLAB\con_esp.mat');
n_clu = max(clu_cel);
n_row = n_clu + 1;
n_col = 1;

gap_ver_row = 0.020*ones(n_row, 1);
gap_hor_row_col = 0.000*ones(n_row, n_col);
mar_bot = 0.050;
mar_top = 0.050;
mar_lef = 0.070;
mar_rig = 0.050;

asp_rat_axe = nan(n_row*n_col, 1);
n_fra = con_fil.n_fra;
n_cel_clu = cal_n_cel_clu(clu_cel);
asp_rat_axe(1) = n_fra.cal.eig.ong/50;
for clu = 1:n_clu
    asp_rat_axe(1 + clu) = n_fra.cal.eig.ong/n_cel_clu(clu);
end
wid = true;
sca_axe = 1;
n_pix_ext = 200;
[hax_sub, ~, ~, ~, las_pix, rat_wid] = tight_subplot_gen(n_row, n_col, ...
    gap_ver_row, gap_hor_row_col, mar_bot, mar_top, mar_lef, mar_rig, asp_rat_axe, fig_wid, ...
    fig_hei, wid, sca_axe, n_pix_ext);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
ifi = con_fil.ifi;
tim_fra = (ifi.cal.eig:ifi.cal.eig:dur)';

hax = hax_sub(1);
lin_wid_sig = 2;
rat_bin_par(end - 1:end) = 0;
plot(hax, tim_bin, rat_bin_par, 'LineWidth', lin_wid_sig)
hax.Box = 'off';
hax.XLim = [tim_bin(1) tim_bin(end)];
hax.XAxis.Visible = 'off';
y_lab = con_fil.y_lab;
ylabel(hax, y_lab.tai_rat)
%col_lim = con_fil.col_lim;
y_lab = con_fil.y_lab;
y_lab.neu_num = 'N. #';
y_lab.dff_ = '\Delta. (%)';
x_lab = con_fil.x_lab;
map = con_fil.map;
for clu = 1:n_clu
    log_pix = clu_cel == clu;
    hax = hax_sub(1 +clu);
    ima(hax, tim_fra, dff_fra_pix(:, log_pix)')% no sorting
    %caxis(hax, col_lim.clu)
    colormap(hax, map.sym)
    if clu < n_clu
        hax.XAxis.Visible = 'off';
    else
        xlabel(hax, x_lab.tim)
    end
    hax.YAxis.Visible = 'off';
end
shi = 0.002;
col = adj_col_han(hax, shi);
col.Position(3) = 0.002;
col.Label.String = y_lab.dff;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
set(h_fig.Children, 'Units', 'pixels')
h_fig.Position(3) = las_pix;
h_fig.Renderer = 'painters';
h_fig.PaperSize(1) = rat_wid*h_fig.PaperSize(1);
h_fig.PaperUnits = 'normalized';
h_fig.PaperPosition = [0 0 1 1];
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% neurobehavioral plotting
function y_axi = plo_rat(y_axi_bas, tim, rat, col)
% y axis 
n_par = 1;
y_axi = max(y_axi_bas) + n_par;

% rescale
rat = rescale(rat, y_axi_bas, y_axi);
hold on
plot(tim, rat, 'Color', col)
end

function ima_seq = ext_sim_vid(fil_pat_ima_fis, fil_pat_rec, fil_pat_ima_cal, tim, dev, ...
    n_fra_sti)
    load(fil_pat_rec, 'fra_tim_vid', 'fra_tim_cal')
    n_fra_blo = 19;
    [cal_ima_seq, n_fra_ext] = ext_ima_cal_ext(fra_tim_cal, fil_pat_ima_cal, tim, dev, n_fra_blo);
    ani_ima_seq = ext_ima_int(fra_tim_vid, fil_pat_ima_fis, tim, dev);
    cal_ima_seq = imrotate(cal_ima_seq, 270);
    [n_row, n_col, n_fra_cal_raw] = size(cal_ima_seq);
    ani_ima_seq = imresize(ani_ima_seq, [n_row n_col]);
    [~, ~, n_fra_ani] = size(ani_ima_seq);
    piv_row_col_fra = cal_ima_seq;
    for fra = n_fra_ext + 1:n_fra_cal_raw - n_fra_ext
        piv_row_col_fra(:, :, fra) = mean(cal_ima_seq(:, :, fra - n_fra_ext:fra + n_fra_ext), 3);
    end
    piv_row_col_fra(:, :, 1:n_fra_ext) = [];
    piv_row_col_fra(:, :, end - n_fra_ext + 1:end) = [];
    [~, ~, n_fra_cal] = size(piv_row_col_fra);
    piv_row_col_fra = im2uint8(piv_row_col_fra);
    for fra = 1:n_fra_cal
        piv_row_col_fra(:, :, fra) = imadjust(piv_row_col_fra(:, :, fra));
    end
    %%%%%%%%%%%% smooth
    sta_dev = 1.5;
    piv_row_col_fra = imgaussfilt3(piv_row_col_fra, sta_dev);
    %%%%%%%%%%%%%%%%%%% animal image
    fac = round(n_fra_ani/n_fra_cal);
    ani_ima_seq = ani_ima_seq(:, :, round(fac/2):fac:end);
    [~, ~, n_fra_ani] = size(ani_ima_seq);
    dif = n_fra_ani - n_fra_cal;
    if dif > 0
        arm = round(dif/2);
        ani_ima_seq = ani_ima_seq(:, :, arm + 1:n_fra_ani - arm);
    elseif dif < 0
        ani_ima_seq = cat(3, ani_ima_seq, repmat(ani_ima_seq(:, :, end), 1, 1, dif)); % not sure
    end
    %
    [~, ~, n_fra_ani] = size(ani_ima_seq);
    dif = n_fra_ani - n_fra_cal;
    if dif > 0
        ani_ima_seq = ani_ima_seq(:, :, 1:n_fra_cal);
    elseif dif < 0
        ani_ima_seq = cat(3, ani_ima_seq, repmat(ani_ima_seq(:, :, end), 1, 1, abs(dif)));
    end
    %
    ima_seq = [ani_ima_seq; piv_row_col_fra];
    ima_seq = reshape(ima_seq, [2*n_row, n_col, 1, n_fra_cal]);
    ima_seq = cat(3, ima_seq, ima_seq, ima_seq);
    %
    mid = round(n_fra_cal/2);
    n_row_sti = 100;
    ima_seq(1:n_row_sti, :, 1, mid:mid + n_fra_sti - 1) = 255;
    ima_seq(1:n_row_sti, :, 2:3, mid:mid + n_fra_sti - 1) = 0;
end

function piv_row_col_pcx_fra = gen_piv_row_col_pcx_fra(fil_pat_ima_fis, fil_pat_ima_cal, tim, ...
    dff_fra_cel, log_cel_pla, low_in_ani, high_in_ani, x_off_fra, y_off_fra, tai_ang_fra, tim_syn_fra)
% f, dff videos
[piv_row_col_pcx_fra, dff_fra_cel, clu_cel, lov_fra, lot_fra] = gen_piv_row_col_fra...
    (fil_pat_ima_fis, fil_pat_ima_cal, tim, dff_fra_cel, log_cel_pla, low_in_ani, high_in_ani, ...
    tim_syn_fra);
% matlab figure
[n_row, ~, ~, ~] = size(piv_row_col_pcx_fra);% 400 x 400 x 140---
tai_ang_fra = tai_ang_fra(lot_fra);
x_off_fra = x_off_fra(lov_fra);
y_off_fra = y_off_fra(lov_fra);
pif_row_col_pcx_fra = ext_fig_piv_row_col_pcx(clu_cel, dff_fra_cel, x_off_fra, y_off_fra, tai_ang_fra);
pif_row_col_pcx_fra = resizeImageStack(pif_row_col_pcx_fra, n_row);
%
dim = 2;
piv_row_col_pcx_fra = cat(dim, piv_row_col_pcx_fra, pif_row_col_pcx_fra);
end

function [piv_row_col_pcx_fra, dff_fra_cel, clu_cel, log_fra, lot_fra] = gen_piv_row_col_fra...
    (fil_pat_ima_fis, fil_pat_ima_cal, tim, dff_fra_cel, log_cel_pla, low_in_ani, high_in_ani, ...
    tim_syn_fra)
%dev = 30;
%dev = 60;
dev = 90;
n_fra_blo = 5;
[pif_row_col_fra, n_fra_ext, log_fra] = ext_ima_cal_ext(fil_pat_ima_cal, tim, dev, n_fra_blo);

% cropping
sta_row = 740;
sta_col = 270;
n_row = 400;
n_col = 200;
pic_row_col_fra = pif_row_col_fra(sta_row:sta_row + n_row - 1, sta_col:sta_col + n_col  - 1, :);

%fig; hax = axes;ima = sho_ima.gra(hax, mean(pic_row_col_fra, 3));
[n_row, n_col, n_fra_cal_raw] = size(pic_row_col_fra);
pim_row_col_fra = pic_row_col_fra;

% averaging over 5 frames!
for fra = n_fra_ext + 1:n_fra_cal_raw - n_fra_ext
    pim_row_col_fra(:, :, fra) = mean(pic_row_col_fra(:, :, fra - n_fra_ext:fra + n_fra_ext), 3);
end
% no contrast adjustment, i think.
pim_row_col_fra(:, :, 1:n_fra_ext) = [];
pim_row_col_fra(:, :, end - n_fra_ext + 1:end) = [];
log_fra = trimTrueEdges(log_fra, n_fra_ext);
%
[~, ~, n_fra_cal] = size(pim_row_col_fra);
pim_row_col_fra = im2uint8(pim_row_col_fra);
low_piv_lim = cal_low_piv_lim(pim_row_col_fra(:, :, 1));
low_in = low_piv_lim/255;
high_in = 0.3;
for fra = 1:n_fra_cal
    pim_row_col_fra(:, :, fra) = imadjust(pim_row_col_fra(:, :, fra), [low_in high_in]);
end
%%%%%%%%%%%% blur !
sta_dev = 1.5;
pim_row_col_fra = imgaussfilt3(pim_row_col_fra, sta_dev);
%
pix_row_col = max(pim_row_col_fra, [], 3);
%min_piv_vis = 10;
min_piv_vis = 15;
%min_piv_vis = 20;

log_row_col = pix_row_col < min_piv_vis;
lop_row_col = ~log_row_col;
n_pix_thr = 50;
lop_row_col = removeSmallROIs(lop_row_col, n_pix_thr);
log_row_col = ~lop_row_col;

log_row_col_fra = repmat(log_row_col, 1, 1, n_fra_cal);
%
pim_row_col_pcx_fra = convertToRGB(pim_row_col_fra);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% dff image
dff_row_col_fra = compute_dff(pic_row_col_fra);

% averaging over 5 frames!
dfm_row_col_fra = dff_row_col_fra;
for fra = n_fra_ext + 1:n_fra_cal_raw - n_fra_ext
    dfm_row_col_fra(:, :, fra) = mean(dff_row_col_fra(:, :, fra - n_fra_ext:fra + n_fra_ext), 3);
end
dfm_row_col_fra(:, :, 1:n_fra_ext) = [];
dfm_row_col_fra(:, :, end - n_fra_ext + 1:end) = [];
dfm_row_col_fra = imgaussfilt3(dfm_row_col_fra, sta_dev);
%
dfm_row_col_fra(log_row_col_fra) = 0;
dff_max = 20;
dff_lim = [-dff_max dff_max];
con_fil = matfile('\\home.ansatt.ntnu.no\kadiram\Documents\MATLAB\con_esp.mat');
map = con_fil.map;
map = map.sym;
pff_row_col_pcx_fra = nan(n_row, n_col, 3, n_fra_cal);
for fra = 1:n_fra_cal
    tem_row_col_pcx = ext_piv_row_col_pcx(squeeze(dfm_row_col_fra(:, :, fra)), dff_lim, map);
    pff_row_col_pcx_fra(:, :, :, fra) = tem_row_col_pcx.abs;
end

% Expand log_row_col to match dimensions
mask = repmat(log_row_col, [1 1 size(pff_row_col_pcx_fra, 3) size(pff_row_col_pcx_fra, 4)]);
pff_row_col_pcx_fra(mask) = 0;

pff_row_col_pcx_fra = im2uint8(pff_row_col_pcx_fra);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% animal image
[pia_row_col_fra, lot_fra] = ext_ima_int(fil_pat_ima_fis, tim, dev, tim_syn_fra);
pia_row_col_fra = imrotate(pia_row_col_fra, 270);
pia_row_col_fra = imresize(pia_row_col_fra, [n_row n_col]);
[~, ~, n_fra_ani] = size(pia_row_col_fra);
fac = round(n_fra_ani/n_fra_cal);
pia_row_col_fra = pia_row_col_fra(:, :, round(fac/2):fac:end);% DOWNSAMPLING
[~, ~, n_fra_ani] = size(pia_row_col_fra);
dif = n_fra_ani - n_fra_cal;
if dif > 0
    arm = round(dif/2);
    pia_row_col_fra = pia_row_col_fra(:, :, arm + 1:n_fra_ani - arm);
elseif dif < 0
    pia_row_col_fra = cat(3, pia_row_col_fra, repmat(pia_row_col_fra(:, :, end), 1, 1, dif));
    % not sure
end
%
[~, ~, n_fra_ani] = size(pia_row_col_fra);
dif = n_fra_ani - n_fra_cal;
if dif > 0
    pia_row_col_fra = pia_row_col_fra(:, :, 1:n_fra_cal);
elseif dif < 0
    pia_row_col_fra = cat(3, pia_row_col_fra, repmat(pia_row_col_fra(:, :, end), 1, 1, abs(dif)));
end
%

% piv_row_col = pia_row_col_fra(:, :, 1);
% pix_row_col = imadjust(piv_row_col, [], [], 0.5);
% fig; imshow(pix_row_col)
% 
% pix_row_col = imadjust(piv_row_col, [low_in_ani high_in_ani]);
% fig; imshow(pix_row_col)
% 
% pix_row_col = imadjust(piv_row_col, [low_in_ani high_in_ani], [0 1], 0.7);
% fig; imshow(pix_row_col)

%
for fra = 1:n_fra_ani
    % pia_row_col_fra(:, :, fra) = imadjust(pia_row_col_fra(:, :, fra), [low_in_ani high_in_ani], ...
    %     [0 1], 0.7);

    piv_row_col = pia_row_col_fra(:, :, fra);
    piv_row_col = imadjust(piv_row_col, [low_in_ani high_in_ani], ...
        [0 1], 0.7);
    n_lev = 50;
    piv_row_col = adj_bri(piv_row_col, n_lev);
    pia_row_col_fra(:, :, fra) = piv_row_col;
end
pia_row_col_pcx_fra = convertToRGB(pia_row_col_fra);
%
piv_row_col_pcx_fra = [pim_row_col_pcx_fra pff_row_col_pcx_fra pia_row_col_pcx_fra];
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
pla = 3;
dff_fra_cel = dff_fra_cel(log_fra, log_cel_pla(:, pla));
[clu_cel_k, ~] = com_clu_cel_k(dff_fra_cel);
clu_cel = clu_cel_k(:, 4);% only the cells in plane 3 !!!
end

function piv_row_col_fra = tai_piv_row_col_fra(fil_pat_ima_fis, tim, low_in_ani, high_in_ani, ...
    tim_syn_fra, fil_pat_ima_cal)
dev = 60;
n_row = 400;
n_col = 200;
%
n_fra_blo = 5;
[pif_row_col_fra, n_fra_ext, ~] = ext_ima_cal_ext(fil_pat_ima_cal, tim, dev, n_fra_blo);
pif_row_col_fra(:, :, 1:n_fra_ext) = [];
pif_row_col_fra(:, :, end - n_fra_ext + 1:end) = [];
[~, ~, n_fra_cal] = size(pif_row_col_fra);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% animal image
[piv_row_col_fra, ~] = ext_ima_int(fil_pat_ima_fis, tim, dev, tim_syn_fra);
piv_row_col_fra = imrotate(piv_row_col_fra, 270);
piv_row_col_fra = imresize(piv_row_col_fra, [n_row n_col]);
[~, ~, n_fra_ani] = size(piv_row_col_fra);
fac = round(n_fra_ani/n_fra_cal);
piv_row_col_fra = piv_row_col_fra(:, :, round(fac/2):fac:end);% DOWNSAMPLING
[~, ~, n_fra_ani] = size(piv_row_col_fra);
dif = n_fra_ani - n_fra_cal;
if dif > 0
    arm = round(dif/2);
    piv_row_col_fra = piv_row_col_fra(:, :, arm + 1:n_fra_ani - arm);
elseif dif < 0
    piv_row_col_fra = cat(3, piv_row_col_fra, repmat(piv_row_col_fra(:, :, end), 1, 1, dif));
    % not sure
end
%
[~, ~, n_fra_ani] = size(piv_row_col_fra);
dif = n_fra_ani - n_fra_cal;
if dif > 0
    piv_row_col_fra = piv_row_col_fra(:, :, 1:n_fra_cal);
elseif dif < 0
    piv_row_col_fra = cat(3, piv_row_col_fra, repmat(piv_row_col_fra(:, :, end), 1, 1, abs(dif)));
end
%
for fra = 1:n_fra_ani

    piv_row_col = piv_row_col_fra(:, :, fra);
    


    piv_row_col = imadjust(piv_row_col, [low_in_ani high_in_ani], ...
        [0 1], 0.7);


    n_lev = 50;
    piv_row_col = adj_bri(piv_row_col, n_lev);



    piv_row_col_fra(:, :, fra) = piv_row_col;
end
end

function [piv_row_col_fra, log_fra] = ext_ima_int(fil_pat_ima, tim, dev, tim_syn_fra)
[~, fra_num_min] = fin_clo_val(tim_syn_fra, tim - dev);% we need the sync time for this animal!
[~, fra_num_max] = fin_clo_val(tim_syn_fra, tim + dev);
ima_fil = matfile(fil_pat_ima);
piv_row_col_fra = ima_fil.data(:, :, fra_num_min:fra_num_max);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
con_fil = matfile('\\home.ansatt.ntnu.no\kadiram\Documents\MATLAB\con_esp.mat');
tim_fra = con_fil.tim_fra;
tim_fra = tim_fra.ani.ses.sti;

[~, fra_num_min] = fin_clo_val(tim_fra, tim - dev);
[~, fra_num_max] = fin_clo_val(tim_fra, tim + dev);

n_fra = length(tim_fra);
log_fra = false(n_fra, 1);
log_fra(fra_num_min:fra_num_max) = true;
end

function piv_row_col_pcx_fra = convertToRGB(piv_row_col_fra)
% convertToRGB Convert grayscale image sequence to RGB image sequence
%
%   rgb_row_col_fra = convertToRGB(piv_row_col_fra)
%
%   Input:
%       piv_row_col_fra - 3D array (rows × cols × frames), grayscale sequence
%
%   Output:
%       rgb_row_col_fra - 4D array (rows × cols × 3 × frames), RGB sequence

    % Get size of input
    [rows, cols, frames] = size(piv_row_col_fra);
    
    % Preallocate output (rows × cols × 3 × frames)
    piv_row_col_pcx_fra = zeros(rows, cols, 3, frames, 'like', piv_row_col_fra);
    
    % Copy grayscale values into R, G, and B channels
    for f = 1:frames
        grayFrame = piv_row_col_fra(:, :, f);
        piv_row_col_pcx_fra(:, :, 1, f) = grayFrame; % Red channel
        piv_row_col_pcx_fra(:, :, 2, f) = grayFrame; % Green channel
        piv_row_col_pcx_fra(:, :, 3, f) = grayFrame; % Blue channel
    end
end

function piv_row_col_pcx_fra = ext_fig_piv_row_col_pcx(clu_cel, dff_fra_cel, x_off_fra, y_off_fra, ...
    tai_ang_fra)
con_fil = matfile('\\home.ansatt.ntnu.no\kadiram\Documents\MATLAB\con_esp.mat');
ifi = con_fil.ifi;
n_fra = size(dff_fra_cel, 1);
tim_fra = (ifi.cal.eig:ifi.cal.eig:n_fra*ifi.cal.eig)';
piv_row_col_pcx_fra = uint8(zeros(1080, 1924, 3, n_fra));
for fra = 1:n_fra
    h_fig = plo_vis_reg(clu_cel, dff_fra_cel, x_off_fra, y_off_fra, tai_ang_fra, tim_fra(fra));
    fig_dat = getframe(h_fig);
    piv_row_col_pcx_fra(:, :, :, fra) = fig_dat.cdata;
    close(h_fig)
end
end

function h_fig = plo_vis_reg(clu_cel, dff_fra_cel, x_off_fra, y_off_fra, tai_ang_fra, tim)
[h_fig, fig_wid, fig_hei] = fig;
con_fil = matfile('\\home.ansatt.ntnu.no\kadiram\Documents\MATLAB\con_esp.mat');
n_clu = max(clu_cel);
n_plo = 3;
n_row = n_clu + n_plo;
n_col = 1;

gap_ver_row = [0.020*ones(n_clu, 1); 0.060*ones(n_plo, 1)];
gap_hor_row_col = 0.000*ones(n_row, n_col);
mar_bot = 0.030;
mar_top = 0.001;
mar_lef = 0.070;
mar_rig = 0.050;

asp_rat_axe = nan(n_row*n_col, 1);
n_fra = con_fil.n_fra;
n_cel_clu = cal_n_cel_clu(clu_cel);
for row = 1:n_row
    if row <= n_clu
        asp_rat_axe(row) = n_fra.cal.eig.ong/n_cel_clu(row);
    else
        asp_rat_axe(row) = n_fra.cal.eig.ong/50;
    end
end
wid = true;
sca_axe = 1;
%n_pix_ext = 200;
n_pix_ext = 100;
[hax_sub, ~, ~, ~, las_pix, rat_wid] = tight_subplot_gen(n_row, n_col, ...
    gap_ver_row, gap_hor_row_col, mar_bot, mar_top, mar_lef, mar_rig, asp_rat_axe, fig_wid, ...
    fig_hei, wid, sca_axe, n_pix_ext);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
ifi = con_fil.ifi;
n_fra = size(dff_fra_cel, 1);
tim_fra = (ifi.cal.eig:ifi.cal.eig:n_fra*ifi.cal.eig)';
y_lab = con_fil.y_lab;
y_lab.neu_num = 'N. #';
y_lab.dff_ = '\Delta. (%)';
x_lab = con_fil.x_lab;
map = con_fil.map;
col_lim = con_fil.col_lim;
for row = 1:n_clu
    log_pix = clu_cel == row;
    hax = hax_sub(row);
    ima(hax, tim_fra, dff_fra_cel(:, log_pix)')% no sorting
    clim(hax, col_lim.clu)
    colormap(hax, map.sym)
    hax.XAxis.Visible = 'off';
    hax.YAxis.Visible = 'off';
    xline(hax, tim, 'g')
end
% shi = 0.002;
% col = adj_col_han(hax, shi);
% col.Position(3) = 0.002;
% col.Label.String = y_lab.dff;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
hax = hax_sub(n_clu + 1);
lin_wid_sig = 2;
plot(hax, tim_fra, x_off_fra, 'LineWidth', lin_wid_sig)
hax.Box = 'off';
hax.XAxis.Visible = 'off';
ylabel(hax, 'x correction (\mum)')
xline(hax, tim, 'g')
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
hax = hax_sub(n_clu + 2);
lin_wid_sig = 2;
plot(hax, tim_fra, y_off_fra, 'LineWidth', lin_wid_sig)
hax.Box = 'off';
hax.XAxis.Visible = 'off';
ylabel(hax, 'y correction (\mum)')
xline(hax, tim, 'g')


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
hax = hax_sub(n_clu + 3);
n_fra = size(tai_ang_fra, 1);
tim_fra = (ifi.man:ifi.man:n_fra*ifi.man)';% NO DOWNSAMPLING !
plot(hax, tim_fra, tai_ang_fra, 'LineWidth', lin_wid_sig)
hax.Box = 'off';
ylabel(hax, 'Tail angle (rad)')
xlabel(hax, x_lab.tim)
xline(hax, tim, 'g')
linkaxes(hax_sub, 'x')

align_Ylabels(h_fig, n_row)

hax = hax_sub(n_clu);

%hax.XLim(2) = 65;
hax.XLim(2) = ceil(tim_fra(end));

shi = 0.002;
col = adj_col_han(hax, shi);
col.Position(1) = 0.95;
col.Position(3) = 0.002;
col.Position(4) = 0.13;
col.Label.String = y_lab.dff;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
set(h_fig.Children, 'Units', 'pixels')
h_fig.Position(3) = las_pix;
h_fig.Renderer = 'painters';
h_fig.PaperSize(1) = rat_wid*h_fig.PaperSize(1);
h_fig.PaperUnits = 'normalized';
h_fig.PaperPosition = [0 0 1 1];
end

function [piv_row_col_fra, n_fra_ext, log_fra] = ext_ima_cal_ext(fil_pat_ima, tim, dev, n_fra_blo)
ima_fil = matfile(fil_pat_ima);
con_fil = matfile('\\home.ansatt.ntnu.no\kadiram\Documents\MATLAB\con_esp.mat');
tim_fra = con_fil.tim_fra;
tim_fra = tim_fra.cal.eig.ses.ent;
n_fra = length(tim_fra);
[~, fra_num_min] = fin_clo_val(tim_fra, tim - dev); % deviation
[~, fra_num_max] = fin_clo_val(tim_fra, tim + dev);

n_fra_ext = (n_fra_blo - 1)/2;
% fra_num_min = fra_num_min - n_fra_ext;
% fra_num_max = fra_num_max + n_fra_ext;

piv_row_col_fra = ima_fil.im(:, :, fra_num_min - n_fra_ext:fra_num_max + n_fra_ext);
log_fra = false(n_fra, 1);
log_fra(fra_num_min - n_fra_ext:fra_num_max + n_fra_ext) = true;
end

function dff_row_col_fra = compute_dff(piv_row_col_fra)
% compute_dff Computes the dF/F image sequence from raw calcium imaging data
%
%   dff_row_col_fra = compute_dff(piv_row_col_fra)
%
%   INPUT:
%       piv_row_col_fra : [rows x cols x frames] raw calcium image sequence
%
%   OUTPUT:
%       dff_row_col_fra : [rows x cols x frames] dF/F image sequence

    % Validate input
    if ndims(piv_row_col_fra) ~= 3
        error('Input must be a 3D array [rows x cols x frames].');
    end

    % Convert to double to avoid integer overflow or truncation
    piv_row_col_fra = double(piv_row_col_fra);

    % Compute baseline F0: mean over time at each pixel
    F0 = mean(piv_row_col_fra, 3);

    % Avoid division by zero: add a small constant where F0 == 0
    epsilon = 1e-6;
    F0(F0 == 0) = epsilon;

    % Preallocate output array
    [rows, cols, frames] = size(piv_row_col_fra);
    dff_row_col_fra = zeros(rows, cols, frames);

    % Compute dF/F for each frame
    for t = 1:frames
        dff_row_col_fra(:,:,t) = (piv_row_col_fra(:,:,t) - F0) ./ F0;
    end

    dff_row_col_fra = 100*dff_row_col_fra;
end

% function uint8_row_col_fra = scale_dff_to_uint8(dff_row_col_fra, dff_max)
% % scale_dff_to_uint8 Maps dF/F image sequence to uint8 for visualization
% %
% %   uint8_row_col_fra = scale_dff_to_uint8(dff_row_col_fra)
% %
% %   INPUT:
% %       dff_row_col_fra : [rows x cols x frames] dF/F image sequence
% %
% %   OUTPUT:
% %       uint8_row_col_fra : [rows x cols x frames] uint8 image sequence
% %                           where 0 -> dF/F=0, 255 -> dF/F=0.2
% 
%     % Validate input
%     if ndims(dff_row_col_fra) ~= 3
%         error('Input must be a 3D array [rows x cols x frames].');
%     end
% 
%     % Scale and clip
%     scaled = (dff_row_col_fra / dff_max) * 255;
%     scaled(scaled < 0) = 0;
%     scaled(scaled > 255) = 255;
% 
%     % Convert to uint8
%     uint8_row_col_fra = uint8(round(scaled));
% 
% end

% function h_fig = plo_bou_ave(sco_com_fra_bou, ani, dur_bou)
% [h_fig, fig_wid, fig_hei] = fig;
% n_row = length(sco_com_fra_bou);
% n_col = 3;
% gap_ver_row = 0.025*ones(n_row, 1);
% gap_hor_row_col = 0.030*ones(n_row, n_col);
% mar_bot = 0.080;
% mar_top = 0.100;
% mar_lef = 0.060;
% mar_rig = 0.001;
% asp_rat_axe = 1*ones(n_row*n_col, 1);
% if n_row == 1
%     wid = true;
% else
%     wid = false;
% end
% sca_axe = 1;
% n_pix_ext = 0;
% [hax_sub, ~, ~, ~, las_pix, rat_wid] = tight_subplot_gen(n_row, n_col, ...
%     gap_ver_row, gap_hor_row_col, mar_bot, mar_top, mar_lef, mar_rig, asp_rat_axe, fig_wid, ...
%     fig_hei, wid, sca_axe, n_pix_ext);
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% con_fil = matfile('\\home.ansatt.ntnu.no\kadiram\Documents\MATLAB\con_esp.mat');
% tim_fra = con_fil.tim_fra;
% y_lab = con_fil.y_lab;
% n_fra = con_fil.n_fra;
% [nam_fie, n_fie] = ext_fie(sco_com_fra_bou);
% col = 'k';
% log_smo = true;
% lin_wid = 1;
% for com_num = 1:n_row
%     linkaxes(hax_sub((com_num - 1)*n_col + 1:com_num*n_col))
%     y_min = inf;
%     y_max = -inf;
%     for fie_num = 1:n_fie
%         hax = hax_sub((com_num - 1)*n_col + fie_num);
%         [~, ~] = plo_sha_gen(hax, tim_fra.cal.eig.tri.dff, sco_com_fra_bou.(nam_fie...
%             {fie_num}){com_num}, col, log_smo, n_fra.dff.eig);
%         [y_min, y_max, hax] = adj_y(hax, y_min, y_max);
%         box(hax, 'off')
%         xlabel(hax, 'Time (s)')
%         if n_row == 1
%             ylabel(hax, y_lab.dff)
%         else
%             ylabel(hax, y_lab.com(com_num))
%         end
%         if com_num == 1 && fie_num == 2
%             title(hax, ani)
%         end
%         if com_num == 1
%             subtitle(hax, nam_fie{fie_num})
%         end
%         if fie_num > 1
%             hax.YAxis.Visible = 'off';
%         end
%     end
% end
% for com_num = 1:n_row
%     for fie_num = 1:n_fie
%         hax = hax_sub((com_num - 1)*n_col + fie_num);
%         yline(hax, 0, 'LineWidth', lin_wid)
%         xline(hax, 0, 'Color', 'g', 'LineWidth', lin_wid)
%         xline(hax, mean(dur_bou.(nam_fie{fie_num})), 'Color', 'r', 'LineWidth', lin_wid)
%     end
% end
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% set(h_fig.Children, 'Units', 'pixels')
% h_fig.Position(3) = las_pix;
% h_fig.Renderer = 'painters';
% h_fig.PaperSize(1) = rat_wid*h_fig.PaperSize(1);
% h_fig.PaperUnits = 'normalized';
% h_fig.PaperPosition = [0 0 1 1];
% end

function h_fig = plo_clu_map_ani(x_pix, y_pix, z_pix, clu_pix, piv_col_pcx)
[h_fig, fig_wid, fig_hei] = fig;
con_fil = matfile('\\home.ansatt.ntnu.no\kadiram\Documents\MATLAB\con_esp.mat');
n_row = 1;
n_col = 1;
gap_ver_row = 0.000*ones(n_row, 1);
gap_hor_row_col = 0.000*ones(n_row, n_col);
mar = 0.000;
mar_bot = mar;
mar_top = mar;
mar_lef = mar;
mar_rig = mar;
asp_rat_axe = 1;
wid = false;
sca_axe = 1;
n_pix_ext = 0;
[hax_sub, ~, ~, ~, las_pix, rat_wid] = tight_subplot_gen(n_row, n_col, ...
    gap_ver_row, gap_hor_row_col, mar_bot, mar_top, mar_lef, mar_rig, asp_rat_axe, fig_wid, ...
    fig_hei, wid, sca_axe, n_pix_ext);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
mar_siz = 300;
xc = 0;
yc = 0;
zc = 0;
w = 50;
hax = hax_sub(1);
scatter3(hax, x_pix.abs, y_pix.abs, z_pix.abs, mar_siz, clu_pix, 'filled')% no transparency
asp_rat = con_fil.asp_rat;
hax.PlotBoxAspectRatio = [1 asp_rat.cal.ori 1];
colormap(hax, piv_col_pcx)
view(hax, -120, 30)
hax.XAxis.Visible = 'off';
hax.YAxis.Visible = 'off';
hax.ZAxis.Visible = 'off';
axis(hax, 'equal')
hax.XGrid = 'off';
hax.YGrid = 'off';
hax.ZGrid = 'off';
scalebar_3d(hax, xc,yc,zc, w)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
set(h_fig.Children, 'Units', 'pixels')
h_fig.Position(3) = las_pix;
h_fig.Renderer = 'painters';
h_fig.PaperSize(1) = rat_wid*h_fig.PaperSize(1);
h_fig.PaperUnits = 'normalized';
h_fig.PaperPosition = [0 0 1 1];
end

function h_fig = plo_gab_clu(x_pix, y_pix, z_pix, clu_pix, piv_col_pcx, log_cel)
[h_fig, fig_wid, fig_hei] = fig;
con_fil = matfile('\\home.ansatt.ntnu.no\kadiram\Documents\MATLAB\con_esp.mat');
n_row = 1;
n_col = 2;

% gap_ver_row = 0.005*ones(n_row, 1);
% gap_hor_row_col = 0.005*ones(n_row, n_col);
% mar = 0.000;
% mar_bot = mar;
% mar_top = 0.050;
% mar_lef = 0.005;
% mar_rig = mar;

gap_ver_row = 0.000*ones(n_row, 1);
gap_hor_row_col = 0.000*ones(n_row, n_col);
mar = 0.000;
mar_bot = mar;
mar_top = mar;
mar_lef = mar;
mar_rig = mar;

asp_rat_axe = [1; 1];
wid = false;
sca_axe = [1; 1];
n_pix_ext = 0;
[hax_sub, ~, ~, ~, las_pix, rat_wid] = tight_subplot_gen(n_row, n_col, ...
    gap_ver_row, gap_hor_row_col, mar_bot, mar_top, mar_lef, mar_rig, asp_rat_axe, fig_wid, ...
    fig_hei, wid, sca_axe, n_pix_ext);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
mar_siz = 200;
asp_rat = con_fil.asp_rat;
xc = 0;
yc = 0;
zc = 0;
w = 50;
%
hax = hax_sub(1);
%
scatter3(hax, x_pix, y_pix, z_pix, mar_siz, clu_pix, 'filled')
hax.PlotBoxAspectRatio = [1 asp_rat.cal.ori 1];
colormap(hax, piv_col_pcx)
view(hax, -120, 30)
hax.XAxis.Visible = 'off';
hax.YAxis.Visible = 'off';
hax.ZAxis.Visible = 'off';
axis(hax, 'equal')
hax.XGrid = 'off';
hax.YGrid = 'off';
hax.ZGrid = 'off';
scalebar_3d(hax, xc,yc,zc, w)
%
hax = hax_sub(2);
%
scatter3(hax, x_pix(~log_cel), y_pix(~log_cel), z_pix(~log_cel), mar_siz, 'k', 'filled')
hold(hax, "on")
scatter3(hax, x_pix(log_cel), y_pix(log_cel), z_pix(log_cel), mar_siz, 'm', 'filled')
hax.PlotBoxAspectRatio = [1 asp_rat.cal.ori 1];
view(hax, -120, 30)
hax.XAxis.Visible = 'off';
hax.YAxis.Visible = 'off';
hax.ZAxis.Visible = 'off';
axis(hax, 'equal')
hax.XGrid = 'off';
hax.YGrid = 'off';
hax.ZGrid = 'off';
scalebar_3d(hax, xc,yc,zc, w)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
set(h_fig.Children, 'Units', 'pixels')
h_fig.Position(3) = las_pix;
h_fig.Renderer = 'painters';
h_fig.PaperSize(1) = rat_wid*h_fig.PaperSize(1);
h_fig.PaperUnits = 'normalized';
h_fig.PaperPosition = [0 0 1 1];
end

function h_fig = plo_gab_clu_onl(x_pix, y_pix, z_pix, clu_pix, piv_col_pcx, log_cel)
[h_fig, fig_wid, fig_hei] = fig;
con_fil = matfile('\\home.ansatt.ntnu.no\kadiram\Documents\MATLAB\con_esp.mat');
n_row = 1;
n_col = 1;
gap_ver_row = 0.000*ones(n_row, 1);
gap_hor_row_col = 0.000*ones(n_row, n_col);
mar = 0.000;
mar_bot = mar;
mar_top = mar;
mar_lef = mar;
mar_rig = mar;
asp_rat_axe = [1; 1];
wid = false;
sca_axe = [1; 1];
n_pix_ext = 0;
[hax_sub, ~, ~, ~, las_pix, rat_wid] = tight_subplot_gen(n_row, n_col, ...
    gap_ver_row, gap_hor_row_col, mar_bot, mar_top, mar_lef, mar_rig, asp_rat_axe, fig_wid, ...
    fig_hei, wid, sca_axe, n_pix_ext);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
mar_siz = 200;
asp_rat = con_fil.asp_rat;
xc = 0;
yc = 0;
zc = 0;
w = 50;
%
hax = hax_sub(1);
%
gre = 0.1;
tra = 0.1;
scatter3(hax, x_pix(~log_cel), y_pix(~log_cel), z_pix(~log_cel), mar_siz, [gre gre gre], 'filled', ...
    'MarkerEdgeAlpha', tra, 'MarkerFaceAlpha', tra)
hold(hax, "on")
tra = 0.7;
scatter3(hax, x_pix(log_cel), y_pix(log_cel), z_pix(log_cel), mar_siz, clu_pix(log_cel), 'filled', ...
    'MarkerEdgeAlpha', tra, 'MarkerFaceAlpha', tra)
hax.PlotBoxAspectRatio = [1 asp_rat.cal.ori 1];
colormap(hax, piv_col_pcx)
view(hax, -120, 30)
hax.XAxis.Visible = 'off';
hax.YAxis.Visible = 'off';
hax.ZAxis.Visible = 'off';
axis(hax, 'equal')
hax.XGrid = 'off';
hax.YGrid = 'off';
hax.ZGrid = 'off';
scalebar_3d(hax, xc,yc,zc, w)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
set(h_fig.Children, 'Units', 'pixels')
h_fig.Position(3) = las_pix;
h_fig.Renderer = 'painters';
h_fig.PaperSize(1) = rat_wid*h_fig.PaperSize(1);
h_fig.PaperUnits = 'normalized';
h_fig.PaperPosition = [0 0 1 1];
end

% function h_fig = plo_cor_del(r_pla_row_col, ani, tim_del_pla_row_col)
% [h_fig, fig_wid, fig_hei] = fig;
% con_fil = matfile('\\home.ansatt.ntnu.no\kadiram\Documents\MATLAB\con_esp.mat');
% n_row = 2;
% n_pla = con_fil.n_pla;
% fun_pla = con_fil.fun_pla;
% n_col = n_pla.neu.fun;
% gap_ver_row = 0.005*ones(n_row, 1);
% gap_hor_row_col = 0.005*ones(n_row, n_col);
% mar_bot = 0.000;
% mar_top = 0.040;
% mar_lef = 0.000;
% mar_rig = 0.050;
% asp_rat = con_fil.asp_rat;
% asp_rat_axe = asp_rat.cal.ori*ones(n_row*n_col, 1);
% if n_row == 2
%     wid = true;
% else
%     wid = false;
% end
% sca_axe = ones(n_row*n_col, 1);
% n_pix_ext = 100;
% [hax_sub, pos_axe, ~, ~, las_pix, rat_wid] = tight_subplot_gen(n_row, n_col, ...
%     gap_ver_row, gap_hor_row_col, mar_bot, mar_top, mar_lef, mar_rig, asp_rat_axe, fig_wid, ...
%     fig_hei, wid, sca_axe, n_pix_ext);
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% lim_r = 0.05;
% r_lim = [-lim_r lim_r];
% centeredmap = con_fil.map;
% y_lab = con_fil.y_lab;
% lim_tim_del = 2;
% tim_del_lim = [-lim_tim_del lim_tim_del];
% for row_num = 1:n_row
%     for col_num = 1:n_col
%         axe_num = (row_num - 1)*n_col + col_num;
%         hax = hax_sub((row_num - 1)*n_col + col_num);
%         pla_num = fun_pla.plo(1, col_num);
%         if row_num == 1
%             piv_row_col_pcx = ext_piv_row_col_pcx(r_pla_row_col{pla_num}, r_lim, centeredmap);
%             sho_ima.rgb(hax, piv_row_col_pcx)
%             hax.Colormap = centeredmap;
%             if col_num == 4
%                 title(hax, ani)
%             end
%         else
%             piv_row_col_pcx = ext_piv_row_col_pcx(tim_del_pla_row_col{pla_num}, tim_del_lim, ...
%                 centeredmap);
%             sho_ima.rgb(hax, piv_row_col_pcx)
%             hax.Colormap = centeredmap;
%         end
%     end
%     if row_num == 1
%         hax.Colormap = centeredmap;
%         col = colorbar(hax);
%         col.Ticks = [0 0.5 1];
%         col.TickLabels = [-lim_r 0 lim_r];
%         col.Label.String = y_lab.cor;
%         col.Position(1) = pos_axe{axe_num}(1) + pos_axe{axe_num}(3);
%         col.Label.Units = "pixels";
%         lef = col.Label.Position(1) - 50;
%         col.Label.Position(1) = col.Label.Position(1) - 50;
%     else
%         hax.Colormap = centeredmap;
%         col = colorbar(hax);
%         col.Ticks = [0 0.5 1];
%         col.TickLabels = [-lim_tim_del 0 lim_tim_del];
%         col.Label.String = y_lab.tim_del;
%         col.Position(1) = pos_axe{axe_num}(1) + pos_axe{axe_num}(3);
%         col.Label.Units = "pixels";
%         col.Label.Position(1) = lef;
%     end
% end
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% set(h_fig.Children, 'Units', 'pixels')
% h_fig.Position(3) = las_pix;
% h_fig.Renderer = 'painters';
% h_fig.PaperSize(1) = rat_wid*h_fig.PaperSize(1);
% h_fig.PaperUnits = 'normalized';
% h_fig.PaperPosition = [0 0 1 1];
% end

function h_fig = plo_tai_com(tai_ang_fra, sco_fra_com)
[h_fig, fig_wid, fig_hei] = fig;
n_row = 4;
n_col = 1;
gap_ver_row = 0.020*ones(n_row, 1);
gap_hor_row_col = 0.030*ones(n_row, n_col);
mar_bot = 0.080;
mar_top = 0.010;
mar_lef = 0.060;
mar_rig = 0.001;
asp_rat_axe = 7*ones(n_row*n_col, 1);
wid = false;
sca_axe = 1;
n_pix_ext = 50;
[hax_sub, ~, ~, ~, las_pix, rat_wid] = tight_subplot_gen(n_row, n_col, ...
    gap_ver_row, gap_hor_row_col, mar_bot, mar_top, mar_lef, mar_rig, asp_rat_axe, fig_wid, ...
    fig_hei, wid, sca_axe, n_pix_ext);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
hax = hax_sub(1);
con_fil = matfile('\\home.ansatt.ntnu.no\kadiram\Documents\MATLAB\con_esp.mat');
tim_fra = con_fil.tim_fra;
unu_per = con_fil.unu_per;
log_poi = tim_fra.ani.dow > unu_per.axo;
lin_wid_sig = 2;
plot(hax, tim_fra.ani.dow(log_poi), tai_ang_fra, 'LineWidth', lin_wid_sig)
box(hax, 'off')
xlabel(hax, 'Time (s)')
ylabel(hax, con_fil.y_lab_ang)
hax.XAxis.Visible = 'off';
%
tim_fra = con_fil.tim_fra;
log_fra = con_fil.log_fra;
y_lab = con_fil.y_lab;
n_fra = con_fil.n_fra;
for com_num = 1:con_fil.n_com
    hax = hax_sub(1 + com_num);
    plot(hax, tim_fra.cal.eig.ses.axo, smoothdata(sco_fra_com(...
        log_fra.cal.eig.ses.axo, com_num), 'sgolay', n_fra.dff.eig.smo), 'LineWidth', lin_wid_sig)
    box(hax, 'off')
    xlabel(hax, 'Time (s)')
    ylabel(hax, y_lab.com(com_num))
    if com_num < con_fil.n_com
        hax.XAxis.Visible = 'off';
    end
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
set(h_fig.Children, 'Units', 'pixels')
h_fig.Position(3) = las_pix;
h_fig.Renderer = 'painters';
h_fig.PaperSize(1) = rat_wid*h_fig.PaperSize(1);
h_fig.PaperUnits = 'normalized';
h_fig.PaperPosition = [0 0 1 1];
end

function h_fig = plo_tai_dff(tai_ang_fra, piv_fra, bou_ons_bou, dur_bou, bou_off_bou)
[h_fig, fig_wid, fig_hei] = fig;
n_row = 2;
n_col = 1;
gap_ver_row = 0.025*ones(n_row, 1);
gap_hor_row_col = 0.030*ones(n_row, n_col);

mar_bot = 0.080;
mar_top = 0.010;
mar_lef = 0.070;
mar_rig = 0.015;

%asp_rat_axe = 7*ones(n_row*n_col, 1);
%wid = true;

% hei = 3.3;
% mar_top = cal_mar_top(hei);
% mar_bot = 0.030;
% mar_lef = 0.020;
% mar_rig = 0.000;

asp_rat_axe = 2*ones(n_row*n_col, 1);
wid = false;
sca_axe = 1;
n_pix_ext = 50;
[hax_sub, ~, ~, ~, ~, rat_wid] = tight_subplot_gen(n_row, n_col, ...
    gap_ver_row, gap_hor_row_col, mar_bot, mar_top, mar_lef, mar_rig, asp_rat_axe, fig_wid, ...
    fig_hei, wid, sca_axe, n_pix_ext);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
hax = hax_sub(1);
con_fil = matfile('\\home.ansatt.ntnu.no\kadiram\Documents\MATLAB\con_esp.mat');
tim_fra = con_fil.tim_fra;
unu_per = con_fil.unu_per;
log_poi = tim_fra.ani.dow > unu_per.axo;
plo_tim_fra = tim_fra.ani.dow(log_poi);
% tim_lim(1) = 300;
% tim_lim(2) = tim_lim(1) + 400;
tim_lim(1) = 365;
tim_lim(2) = 510;
plo_log_fra = (plo_tim_fra < tim_lim(2)) & (plo_tim_fra > tim_lim(1));
lin_wid_sig = 2;
plot(hax, plo_tim_fra(plo_log_fra), tai_ang_fra(plo_log_fra), 'LineWidth', lin_wid_sig)% axo
% log_bou = (bou_ons_bou > unu_per.axo & bou_ons_bou < tim_lim) & (bou_off_bou > unu_per.axo & ...
%     bou_off_bou < tim_lim);
log_bou = (bou_ons_bou > tim_lim(1) & bou_ons_bou < tim_lim(2)) & (bou_off_bou > tim_lim(1) & ...
    bou_off_bou < tim_lim(2));

dur_bou = dur_bou(log_bou);
bou_ons_bou = bou_ons_bou(log_bou);
bou_off_bou = bou_off_bou(log_bou);
col_con = 'r';
xline(hax, bou_ons_bou, 'r')
plo_sti_sub_tri(hax, dur_bou, bou_off_bou, col_con)
box(hax, 'off')
ylabel(hax, con_fil.y_lab_ang)
hax.XAxis.Visible = 'off';

% fon_siz = con_fil.fon_siz;
% mar_siz = con_fil.mar_siz;
% mar_siz = mar_siz.pub;
% log_lin_wid = true;
% hax = adj_hax(hax, fon_siz.pub, mar_siz, log_lin_wid);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
tim_fra = con_fil.tim_fra;
log_fra = con_fil.log_fra;
y_lab = con_fil.y_lab;
n_fra = con_fil.n_fra;

cax_tim_fra = tim_fra.cal.eig.ses.axo;
piv_fra = piv_fra(log_fra.cal.eig.ses.axo);
cax_log_fra = (cax_tim_fra < tim_lim(2)) & (cax_tim_fra > tim_lim(1));

hax = hax_sub(2);
plot(hax, cax_tim_fra(cax_log_fra), smoothdata(piv_fra(...
    cax_log_fra), 'sgolay', n_fra.dff.eig.smo), 'LineWidth', lin_wid_sig, 'Color', 'g')
xline(hax, bou_ons_bou, 'r')
box(hax, 'off')
%xlabel(hax, 'Time (s)')
ylabel(hax, y_lab.piv)

% hax.XAxis.Visible = 'off';
% scalebarLength = 10;  % scalebar will be 10 micrometer long
% h_bar = scalebar(hax, 'x', scalebarLength, ' s', 'Location', 'southeastoutside');

%hax = adj_hax(hax, fon_siz.pub, mar_siz, log_lin_wid);

align_Ylabels(h_fig, n_row)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% set(h_fig.Children, 'Units', 'pixels')
% h_fig.Position(3) = las_pix;
h_fig.Renderer = 'painters';
h_fig.PaperSize(1) = rat_wid*h_fig.PaperSize(1);
h_fig.PaperUnits = 'normalized';
h_fig.PaperPosition = [0 0 1 1];
end

function h_fig = plo_bou_sig(dff_fra_bou, dur_bou)
col_lim = [-10 10];
col_cod = '\DeltaF/F (%)';
[h_fig, fig_wid, fig_hei] = fig;
n_row = 1;
n_col = 1;
mar_bot = 0.050;
mar_top = 0.040;
mar_lef = 0.045;
mar_rig = 0.035;
asp_rat_axe = 0.5;
gap_ver_row = 0.070*ones(1, n_row);
gap_hor_row_col = 0.055*ones(n_row, n_col);
wid = false;
sca_axe = ones(n_row*n_col, 1);
n_pix_ext = 70;
[hax_sub, ~, ~, ~, ~, ~] = tight_subplot_gen(n_row, n_col, ...
    gap_ver_row, gap_hor_row_col, mar_bot, mar_top, mar_lef, mar_rig, asp_rat_axe, fig_wid, ...
    fig_hei, wid, sca_axe, n_pix_ext);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
con_fil = matfile('\\home.ansatt.ntnu.no\kadiram\Documents\MATLAB\con_esp.mat');
[dur_bou, ind_bou] = sort(dur_bou, 'ascend');
tim_fra = con_fil.tim_fra;
tim_fra = tim_fra.cal.eig.tri.dff;
col_han_pos = [0.31 0.380 0.005 0.150];
hax = hax_sub(1);
dff_bou_fra = dff_fra_bou(:, ind_bou)';

dur_bou(end) = [];
dff_bou_fra(end, :) = [];
log_fra = tim_fra < 20;
tim_fra = tim_fra(log_fra);
dff_bou_fra = dff_bou_fra(:, log_fra);

n_fra = con_fil.n_fra;
dff_fra_bou = smo_sam_poi_uni(dff_bou_fra', n_fra.dff.eig.bas, n_fra.dff.eig.smo);
map = con_fil.map;
map = map.sym;
piv_row_col_pcx = ext_piv_row_col_pcx(dff_fra_bou', col_lim, map);% no smoothing
fra_bou = fin_ind_bou(tim_fra, dur_bou);
n_bou = length(fra_bou);
n_fra = length(tim_fra);
log_row_col = false(n_bou, n_fra);
for bou = 1:n_bou
    if dur_bou(bou) <= tim_fra(end)
        log_row_col(bou, fra_bou(bou)) = true;
    end
end
log_row_col_pcx.axo = repmat(log_row_col, 1, 1, 3);
piv_row_col_pcx.abs(log_row_col_pcx.axo) = eps;
ima = sho_ima.rgb(hax, piv_row_col_pcx);
ima.XData = tim_fra;
hax.XLim = [tim_fra(1) tim_fra(end)];
yticks(hax, [1 n_bou])
hax.XAxis.Visible = 'on';
hax.YAxis.Visible = 'on';
lin_wid = con_fil.lin_wid;
xline(hax, 0, '--k', 'LineWidth', lin_wid.two)
%caxis(hax, col_lim)
hax.Colormap = map;
col_han = colorbar('Ticks', col_lim);
col_han.Position = col_han_pos;
col_han.Label.String = col_cod;
col_han.Label.Units = 'normalized';
col_han.Label.Position(1) = 1.5;
end

function varargout = showMaskAsOverlay_kadir(hax, opacity, mask, overlaycolor, varargin)
% Copyright 2010 The MathWorks, Inc.

% Show segmentation (mask) with user-specified transparency/color as overlay on image
%
% Using optional input DELEMASK argument, one can
% easily show multiple segmentation masks on a single image. 
%
% SYNTAX:
%
% SHOWMASKASOVERLAY(OPACITY, MASK, OVERLAYCOLOR)
%     Operates on the image in the current figure, overlays a
%     MASK of opacity OPACITY and of color OVERLAYCOLOR.
%
% SHOWMASKASOVERLAY(OPACITY, MASK, OVERLAYCOLOR, IMG)
%     Takes a handle to an image, or an image itself.
%
% SHOWMASKASOVERLAY(OPACITY, MASK, OVERLAYCOLOR, IMG, DELEMASKS)
%     DELEMASKS is a logical binary, indicating whether existing masks
%     should be deleted before new masks are displayed. Default is TRUE.
%
% SHOWMASKOVERLAY(OPACITY)
%     If an overlayed mask already exists in the current figure,
%     this shorthand command will modify its opacity.
%
% IMGOUT = SHOWMASKASOVERLAY(...)
%     Returns an RGB image of class double, capturing the combined IMG
%     and OVERLAY(s) as image IMGOUT.
%
% [IMGOUT, HNDLS] = SHOWMASKASOVERLAY(...)
%     Also returns a structure of handles to the original image and
%     generated overlays in the current axes.
%
% INPUTS:
%
%     OPACITY       The complement of transparency; a variable on [0,1]
%                   describing how opaque the overlay should be. A
%                   mask of opacity of 0 is 100% transparent. A mask
%                   of opacity 1 is completely solid.
%     MASK          A binary image to be shown on the image of
%                   interest. (Must be the same size as the image operated
%                   on.)
%     OVERLAYCOLOR  A triplet of [R G B] value indicating the color
%                   of the overlay. (Standard "color strings"
%                   like 'r','g','b','m' are supported.) Default
%                   is red.
%     IMG           (Optional) A handle to an image, or an image. By
%                   default, SHOWIMAGEASOVERLAY operates on the image
%                   displayed in the current axes. (If this argument is
%                   omitted, or if the current axes does not contain an
%                   image, an error will be thrown.)
%
%                   Alternatively, IMG may be an image, in which case a new
%                   figure is generated, the image is displayed, and the
%                   overlay is generated on top of it.
%
%     DELEMASKS     Delete previously displayed masks?
%                   This operates at a figure-level. (Default = 1.) 
%
% OUTPUTS:
%
%     HNDLS         A structure containing handles of all images (including
%                   overlays) in the current axes. The structure will have
%                   fields:
%                      Original:   The underlying (non-overlaid) image in
%                                  the parent axes.
%                      Overlays:   All overlays created by
%                                  SHOWMASKASOVERLAY.
%
% EXAMPLES:
% 1)
%                   I = imread('rice.png');
%                   I2 = imtophat(I, ones(15, 15));
%                   I2 = im2bw(I2, graythresh(I2));
%                   I2 = bwareaopen(I2, 5);
%                   figure;
%                   imshow(I);
%                   showMaskAsOverlay(0.4,I2)
%                   title('showMaskAsOverlay')
%
% 2)          
%                   I = imread('rice.png');
%                   AllGrains = imtophat(I, ones(15, 15));
%                   AllGrains = im2bw(AllGrains, graythresh(AllGrains));
%                   AllGrains = bwareaopen(AllGrains, 5);
%                   PeripheralGrains = AllGrains -imclearborder(AllGrains);
%                   InteriorGrains = AllGrains - PeripheralGrains;
%                   figure;
%                   subplot(2,2,1.5)
%                   imshow(I); title('Original')
%                   subplot(2,2,3)
%                   imshow(I)
%                   showMaskAsOverlay(0.4,AllGrains)
%                   title('All grains')
%                   subplot(2,2,4)
%                   imshow(I)
%                   % Note: I set DELEMASKS explicity to 0 here so  
%                   % 'AllGrains' mask is not cleared from figure 
%                   showMaskAsOverlay(0.4,InteriorGrains,[1 1 0],[],0)
%                   showMaskAsOverlay(0.4,PeripheralGrains,'g',[],0)
%                   title('Interior and Peripheral Grains')

% Brett Shoelson, PhD
% brett.shoelson@mathworks.com
% V 1.0 07/05/2007

narginchk(1,5);
if nargin >= 4
    if ~isempty(varargin{1})
        if ishandle(varargin{1})
            imgax = varargin{1};
        else
            %figure;
            %imshow(hax, varargin{1});
            piv_row_col = varargin{1};
            sho_ima.gra(hax, piv_row_col)
            imgax = imgca;
        end
    else
        imgax = imgca;
    end
    fig = get(imgax,'parent');
else
    fig = gcf;
end

if nargin == 6
    deleMasks = logical(varargin{2});
else
    deleMasks = true;
end

iptcheckinput(opacity, {'double'},{'scalar'}, mfilename, 'opacity', 1);
iptcheckinput(deleMasks, {'logical'}, {'nonempty'}, mfilename, 'deleMasks', 5);

if nargin == 1
    overlay = findall(gcf,'tag','opaqueOverlay');
    if isempty(overlay)
        error('SHOWMASKASOVERLAY: No opaque mask found in current figure.');
    end
    mask = get(overlay,'cdata');
    newmask = max(0,min(1,double(any(mask,3))*opacity));
    set(overlay,'alphadata',newmask);
    figure(fig);
    return
else
    iptcheckinput(mask, {'double','logical'},{'nonempty'}, mfilename, 'mask', 2);
end

% If the user doesn't specify the color, use red.
DEFAULT_COLOR = [1 0 0];
if nargin < 3
    overlaycolor = DEFAULT_COLOR;
elseif ischar(overlaycolor)
    switch overlaycolor
        case {'y','yellow'}
            overlaycolor = [1 1 0];
        case {'m','magenta'}
            overlaycolor = [1 0 1];
        case {'c','cyan'}
            overlaycolor = [0 1 1];
        case {'r','red'}
            overlaycolor = [1 0 0];
        case {'g','green'}
            overlaycolor = [0 1 0];
        case {'b','blue'}
            overlaycolor = [0 0 1];
        case {'w','white'}
            overlaycolor = [1 1 1];
        case {'k','black'}
            overlaycolor = [0 0 0];
        otherwise
            disp('Unrecognized color specifier; using default.');
            overlaycolor = DEFAULT_COLOR;
    end
end

tmp = imhandles(fig);
if isempty(tmp)
    error('There doesn''t appear to be an image in the current figure.');
end
try
    a = imattributes(tmp(1));
catch 
    error('There doesn''t appear to be an image in the current figure.');
end
imsz = [str2num(a{2,2}),str2num(a{1,2})]; %#ok

if ~isequal(imsz,size(mask(:,:,1)))
    error('Size mismatch');
end
% if deleMasks
%     delete(findall(fig,'tag','opaqueOverlay'))
% end

overlaycolor = im2double(overlaycolor);
% Ensure that mask is logical
mask = logical(mask);

if size(mask,3) == 1
    newmaskR = zeros(imsz);
    newmaskG = newmaskR;
    newmaskB = newmaskR;
    %Note: I timed this with logical indexing (as currently implemented),
    %with FIND, and with logical indexing after converting the mask to type
    %logical. All three were roughly equivalent in terms of performance.
    newmaskR(mask) = overlaycolor(1);
    newmaskG(mask) = overlaycolor(2);
    newmaskB(mask) = overlaycolor(3);
elseif size(mask,3) == 3
    newmaskR = mask(:,:,1);
    newmaskG = mask(:,:,2);
    newmaskB = mask(:,:,3);
else
    beep;
    disp('Unsupported masktype in showImageAsOverlay.');
    return
end

newmask = cat(3, newmaskR, newmaskG, newmaskB);
%hold(fig, 'on')
hold(hax, 'on')
%h = imshow(newmask, 'Parent', fig);
piv_row_col_pcx.abs = 255*newmask;
h = sho_ima.rgb(hax, piv_row_col_pcx);
set(h, 'alphadata', double(mask)*opacity, 'tag', 'opaqueOverlay');
if nargout > 0
    varargout{1} = imhandles(imgca);
end
if nargout > 1
    varargout{2} = getframe;
    varargout{2} = varargout{2}.cdata;
end
end

function varargout = showMaskContoursAsOverlay(hax, opacity, cel_row_col, overlaycolor, varargin)
% Show binary mask contours (only lines, no fill) with specified opacity and color as overlay
%
% SYNTAX:
%   showMaskContoursOnlyAsOverlay_kadir(hax, opacity, mask, overlaycolor)
%   showMaskContoursOnlyAsOverlay_kadir(hax, opacity, mask, overlaycolor, img)
%   showMaskContoursOnlyAsOverlay_kadir(hax, opacity, mask, overlaycolor, img, deleMasks)
%
% INPUTS:
%   hax           Axes handle to overlay on.
%   opacity       Opacity of contour lines [0–1].
%   mask          Binary mask.
%   overlaycolor  RGB triplet or color char ('r','g',...).
%   img           (optional) image data or handle to display if needed.
%   deleMasks     (optional, default = true) delete previous contours.
%
% OUTPUTS:
%   varargout{1}  Handles of contour line objects.
%   varargout{2}  Captured RGB image of figure.
%
% Author: Adapted by Kadir (2025) from Brett Shoelson original
% ------------------------------------------------------------

narginchk(4,6);

if nargin >= 5 && ~isempty(varargin) && ~isempty(varargin{1})
    % if ishandle(varargin{1})
    %     imgax = varargin{1};
    % else
        if nargin >= 6
            imshow(varargin{1}, varargin{2}, 'Parent', hax);% --- shown!
        else
            imshow(varargin{1}, 'Parent', hax);% --- shown!
        end
        imgax = hax;
    % end
else
    imgax = hax;
end

deleMasks = true;
iptcheckinput(opacity, {'double'}, {'scalar', '>=',0,'<=',1}, mfilename, 'opacity', 2);
iptcheckinput(cel_row_col, {'double','logical'}, {'nonempty'}, mfilename, 'mask', 3);
iptcheckinput(deleMasks, {'logical'}, {'scalar'}, mfilename, 'deleMasks', 6);

% Determine overlay color
DEFAULT_COLOR = [1 0 0];
if isempty(overlaycolor)
    overlaycolor = DEFAULT_COLOR;
elseif ischar(overlaycolor)
    overlaycolor = colorSpecToRGB(overlaycolor);
end

overlaycolor = im2double(overlaycolor);


ancestor(imgax, 'figure')
if deleMasks
    delete(findall(imgax, 'Tag', 'maskContourOverlay'));
end

holdState = ishold(imgax);
hold(imgax, 'on');

% mask = logical(mask);
% % Find object boundaries
% boundaries = bwboundaries(mask);
% 
% % Plot each contour
% for k = 1:length(boundaries)
%     boundary = boundaries{k};
%     plot(hax, boundary(:,2), boundary(:,1), '-', ...
%         'Color', overlaycolor, 'LineWidth', 0.5);
% end


% Get the number of objects
numObjects = max(cel_row_col(:));

% Initialize binary image for edges
edges = false(size(cel_row_col));

% Loop over each object and get its perimeter
for k = 1:numObjects
    mask = cel_row_col == k;
    % Get perimeter of object
    perim = bwperim(mask);
    % Add to edges image
    edges = edges | perim;
end

visboundaries(hax, edges, 'Color', overlaycolor, 'LineWidth', 0.5);


if ~holdState
    hold(imgax, 'off');
end

if nargout >= 1
    varargout{1} = lineHandles;
end

if nargout >= 2
    F = getframe(imgax);
    varargout{2} = F.cdata;
end

end
% Utility function: convert char color to RGB
function rgb = colorSpecToRGB(c)
switch lower(c)
    case {'y','yellow'}
        rgb = [1 1 0];
    case {'m','magenta'}
        rgb = [1 0 1];
    case {'c','cyan'}
        rgb = [0 1 1];
    case {'r','red'}
        rgb = [1 0 0];
    case {'g','green'}
        rgb = [0 1 0];
    case {'b','blue'}
        rgb = [0 0 1];
    case {'w','white'}
        rgb = [1 1 1];
    case {'k','black'}
        rgb = [0 0 0];
    otherwise
        warning('Unrecognized color specifier; using default red.');
        rgb = [1 0 0];
end
end

function [cropped_cel_pla_row_col, cropped_piv_pla_row_col, row_num, col_num] = cropCellMatrices(...
    cel_pla_row_col, piv_pla_row_col)
% cropCellMatrices crops all matrices in a cell array identically such that
% no non-NaN data is lost, and the cropped area contains all non-NaN values
% from all matrices, eliminating as many NaNs as possible.
%
% INPUT:
%   cel_pla_row_col : cell array where each cell contains a matrix with NaNs
%
% OUTPUT:
%   cropped_cel_pla_row_col : same-sized cell array, with cropped matrices

    % Determine size of cell array
    [n1, n2, n3] = size(cel_pla_row_col);

    % Initialize cropping indices
    min_row = inf; max_row = -inf;
    min_col = inf; max_col = -inf;

    % First pass: find the bounding box of all non-NaN elements
    for i1 = 1:n1
        for i2 = 1:n2
            for i3 = 1:n3
                mat = cel_pla_row_col{i1,i2,i3};
                [rows, cols] = find(~isnan(mat));
                if ~isempty(rows)
                    min_row = min(min_row, min(rows));
                    max_row = max(max_row, max(rows));
                    min_col = min(min_col, min(cols));
                    max_col = max(max_col, max(cols));
                end
            end
        end
    end

    % Check if all matrices are fully NaN
    if isinf(min_row) || isinf(min_col)
        error('All matrices appear to be fully NaN.');
    end

    mar = 50;
    row_num = min_row - mar:max_row + mar;
    col_num = min_col - mar:max_col + mar;

    % Second pass: crop all matrices
    cropped_cel_pla_row_col = cell(size(cel_pla_row_col));
    cropped_piv_pla_row_col = cell(size(cel_pla_row_col));

    for i1 = 1:n1
        for i2 = 1:n2
            for i3 = 1:n3
                mat = cel_pla_row_col{i1,i2,i3};
                if ~isempty(mat)
                    cropped_cel_pla_row_col{i1,i2,i3} = ...
                        mat(row_num, col_num);
                    %
                    mat = piv_pla_row_col{i1,i2,i3};
                    cropped_piv_pla_row_col{i1,i2,i3} = ...
                        mat(row_num, col_num);
                end
            end
        end
    end
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% signal processing
function [sig, sam_tim_new] = smo_uni(sam_tim, sig, sta_tim, end_tim, fra_rat)
ifi = 1/fra_rat;
sam_tim_new = (sta_tim + ifi:ifi:end_tim)';
n_sam = length(sig);
wei = ones(n_sam, 1);
sig = b_spline_smooth(sam_tim, sig, sam_tim_new, wei, 2, 0);
end

function [sig, sam_tim_new] = smo_uni_cor(sam_tim, sig, sta_tim, end_tim, fra_rat)
ifi = 1/fra_rat;
sam_tim_new = (sta_tim + ifi:ifi:end_tim)';
if min(sam_tim_new) < min(sam_tim)
    sam_tim = [min(sam_tim_new); sam_tim];
    sig = [sig(1); sig];
end
if max(sam_tim_new) > max(sam_tim)
    sam_tim = [sam_tim; max(sam_tim_new)];
    sig = [sig; sig(end)];
end
n_sam = length(sig);
wei = ones(n_sam, 1);
sig = b_spline_smooth(sam_tim, sig, sam_tim_new, wei, 2, 0);
end

function [sig, ind_bor_poi] = rem_bas_dyn(sam_rat, sig, seg_len)
[sam_ind_seg, ~, n_sam_sig, ind_bor_poi] = seg_sig(sig, seg_len);
n_sam_seg = size(sam_ind_seg, 1);
bas_seg = com_bas_seg(sam_rat, sam_ind_seg);
sam_ind_seg = sam_ind_seg - repmat(bas_seg', n_sam_seg, 1);
%
res = sig(n_sam_sig + 1:end);
res = res - bas_seg(end);
%
sig = [sam_ind_seg(:); res];
end

function bas_seg = com_bas_seg(sam_rat, sam_ind_seg)
n_seg = size(sam_ind_seg, 2);
bas_seg = nan(n_seg, 1);
for i = 1:n_seg
    sig_i = sam_ind_seg(:, i);
    [~, amp_i] = com_amp_spe(sam_rat, sig_i);
    bas_seg(i) = amp_i(1);
end
end

function [sam_ind_seg, n_seg, n_sam_sig, ind_bor_poi] = seg_sig(sig, seg_len)
% PURPOSE: segment signal
%---------------------------------------------------
% USAGE:
% where:
% seg_len: segment length. Should be a power of 2. If you want fft.
%---------------------------------------------------
% RETURNS: a vector of output arguments composed of:
% x = 1.2
% --------------------------------------------------
% SEE ALSO: f(results)
%---------------------------------------------------
% REFERENCES: 
%---------------------------------------------------
% REMARKS:
%---------------------------------------------------

% Written by: Kadir Mutlu

[n_sam, n_sig] = size(sig);

% n_seg per individual signal
n_seg = fix(n_sam/seg_len);

% Pre-process X
rowindex = (1:seg_len)';
colindex = 1 + (0:(n_seg - 1))*seg_len;
%
ind_bor_poi = [colindex' [colindex(2:end)' - 1; colindex(end) - 1 + seg_len]];

% n_sam in the new signal
n_sam_sig = seg_len*n_seg;

% Put x into columns of xin with the proper offset
sam_ind_seg = nan(seg_len, n_seg, n_sig);
for i = 1:n_sig
    sig_i = sig(:, i);
    % the end residues of the signal are sacrified %%%%%%%%%%%%%%%
    sam_ind_seg((i - 1)*n_sam_sig + 1:i*n_sam_sig) = sig_i(rowindex(:, ones(1, n_seg)) + colindex(ones(seg_len, 1), :) - 1);
end
end

function [fre, amp] = com_amp_spe(sam_rat, sig)
% PURPOSE: compute amplitude spectrum
%---------------------------------------------------
% USAGE:
% where: varargin = vector of input variables
%---------------------------------------------------
% RETURNS: a vector of output arguments composed of:
% x = 1.2
% --------------------------------------------------
% SEE ALSO: f(results)
%---------------------------------------------------
% REFERENCES: 
%---------------------------------------------------
% REMARKS: Make sure that the length of the signal is power of 2.
%---------------------------------------------------

% Written by: Kadir Mutlu

nyq_fre = sam_rat/2;
fre_ran = [0 nyq_fre];
fre_min = fre_ran(1);
fre_max = fre_ran(2);

n_sam = size(sig, 1);
hal = n_sam/2;

% fre
fre_res = nyq_fre/hal;
fre_ind_raw = fix(fre_ran/fre_res);
if fre_min == 0
    fre_ran_2 = fre_ind_raw*fre_res;
else
    % + 1 is due to the fact that we want to take the next frequency to be
    % in the range.
    fre_ran_2 = [fre_ind_raw(1) + 1 fre_ind_raw(2)]*fre_res;
end
fre = (fre_ran_2(1):fre_res:fre_ran_2(2))';

% amp
dft = fft(sig)/n_sam;

fre_ind = 1 + fre_ind_raw;

% + 1 is due to the fact that we want to take the next frequency to be in
% the range.
fre_ind_min = fre_ind(1) + 1;
fre_ind_max = fre_ind(2);

nyq_ind = hal + 1;

if fre_min == 0 && fre_max == nyq_fre
    % offset + other (symmetric) amplitudes, therefore doubled + nyquist point (point of symmetry)
    amp = [dft(1, :, :); 2*abs(dft(2:hal, :, :)); dft(nyq_ind, :, :)];
elseif fre_min == 0
    amp = [dft(1, :, :); 2*abs(dft(2:fre_ind_max, :, :))];
elseif fre_max == nyq_fre
    amp = [2*abs(dft(fre_ind_min:hal, :, :)); dft(nyq_ind, :, :)];
else
    amp = 2*abs(dft(fre_ind_min:fre_ind_max, :, :));
end
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% general
function [clo_val, ind] = fin_clo_val_big(vec, tar)
% PURPOSE: find closest value
%---------------------------------------------------
% USAGE: [clo_val, num] = fin_clo_val(vec, tar)
% where: varargin = vector of input variables
%---------------------------------------------------
% RETURNS: a vector of output arguments composed of:
% x = 1.2
% --------------------------------------------------
% SEE ALSO: f(results)
%---------------------------------------------------
% REFERENCES: 
%---------------------------------------------------
% REMARKS: works for monotonically increasing
%---------------------------------------------------

% Written by: Kadir Mutlu

dif = vec - tar;
dif_abs = abs(dif);
[~, ind] = min(dif_abs);
clo_val = vec(ind);
% bigger
if clo_val < tar && ind < length(vec)
    ind = ind + 1;
    clo_val = vec(ind);
elseif clo_val < tar
    clo_val = nan;
end
end

function vec_shu = shu_vec(vec)
n = length(vec);
vec_shu = vec(randperm(n));
end

function [per_pai_bin, ske] = com_per_pai_bin(acc_pai)
con_fil = matfile('\\home.ansatt.ntnu.no\kadiram\Documents\MATLAB\con_esp.mat');
acc_edg = con_fil.acc_edg;
cou_bin = histcounts(acc_pai, acc_edg);
%n_pai = length(cor_coe_pai);
per_pai_bin = 100*(cou_bin./sum(cou_bin));
%kur = kurtosis(cor_coe_pai);
ske = skewness(acc_pai);
end

% function [nam_fie, n_fie] = ext_fie(str)
% nam_fie = fieldnames(str);
% n_fie = length(nam_fie);
% end
