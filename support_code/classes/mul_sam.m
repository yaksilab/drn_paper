classdef mul_sam
    properties
        mul_sam_idx
        sam
        poo_dir
        tit_sam
        tit_sam_cha
        tit_lon_sam
        tit_n_sam
        tit_n_bri_sam
        tit_n_tai_sam
        tit_lon_n_sam
        tit_sho_sam
        tit_sho_sam_cha
        tit_sup_sho_sam
        tit_sup_sho_sam_cha
        n_sam
        fil_pat_exp
        fil_pat_mul_sam
        fil_pat_sam
        %
        fil_pat_fig_tai_ang
        fil_pat_fig_tai_ang_xep
        fil_pat_fig_tai_ang_xsa
        fil_pat_fig_ang
        fil_pat_fig_ang_win
        fil_pat_fig_ang_wit
        fil_pat_fig_ang_cro
        fil_pat_fig_nta_win
        fil_pat_fig_nta_wit
        fil_pat_fig_nta_cro
        fil_pat_fig_spe_pha
        fil_pat_fig_ang_ton
        fil_pat_fig_spe_wit
        fil_pat_fig_spe_cro
        fil_pat_fig_ang_pre
        fil_pat_fig_mat_ang_pre
        fil_pat_fig_mat_ang_cro
        fil_pat_fig_ang_cro_raw
        fil_pat_fig_pro
        fil_pat_fig_pro_sim
        fil_pat_fig_mat_pro
        fil_pat_fig_mat_pro_sim
        fil_pat_fig_tai_rat_hig
        fil_pat_fig_bea_ang
        fil_pat_fig_tai_bea
        fil_pat_fig_tai_wit
        fil_pat_fig_tai_cro
        fil_pat_fig_abs
        fil_pat_fig_spe
        %
        fil_pat_fig_neu
        fil_pat_fig_beh
        fil_pat_fig_pla
        fil_pat_fig_beh_mod
        fil_pat_fig_mat_beh_mod
        fil_pat_fig_spo_hab_tru
        fil_pat_fig_spo_hab_low
        fil_pat_fig_spo_hab_mod
        fil_pat_fig_spo_hab_hig
        fil_pat_fig_spo_tel_tru
        fil_pat_fig_spo_tel_low
        fil_pat_fig_spo_tel_mod
        fil_pat_fig_spo_tel_hig
        fil_pat_fig_spo_sta_hab_tru
        fil_pat_fig_spo_sta_hab_low
        fil_pat_fig_spo_sta_hab_mod
        fil_pat_fig_spo_sta_hab_hig
        fil_pat_fig_spo_sta_tel_tru
        fil_pat_fig_spo_sta_tel_low
        fil_pat_fig_spo_sta_tel_mod
        fil_pat_fig_spo_sta_tel_hig
        fil_pat_fig_den_cor
        fil_pat_fig_cor_smi
        fil_pat_fig_neu_com
        fil_pat_fig_sta_neu_com
        fil_pat_fig_res_neu_com
        fil_pat_fig_res_poo_neu_com
        fil_pat_fig_tai_rat_spo
        fil_pat_fig_tai_rat_sti
        fil_pat_fig_tai_rat_sti_hal
        fil_pat_fig_neu_ton
        fil_pat_fig_neu_all
        fil_pat_fig_neu_all_pri
        fil_pat_fig_neu_wit
        fil_pat_fig_neu_wit_pri
        fil_pat_fig_neu_cro
        fil_pat_fig_neu_cro_pri
        fil_pat_fig_neu_reg
        fil_pat_fig_hab_all_pri
        fil_pat_fig_hab_wit_pri
        fil_pat_fig_hab_cro_pri
        fil_pat_fig_tel_all_pri
        fil_pat_fig_tel_wit_pri
        fil_pat_fig_tel_cro_pri
        %
        fil_pat_fig_hab_rat_all_pri
        fil_pat_fig_hab_rat_wit_pri
        fil_pat_fig_hab_rat_cro_pri
        fil_pat_fig_tel_rat_all_pri
        fil_pat_fig_tel_rat_wit_pri
        fil_pat_fig_tel_rat_cro_pri
        %
        fil_pat_fig_hab_nor_rat_all_pri
        fil_pat_fig_hab_nor_rat_wit_pri
        fil_pat_fig_hab_nor_rat_cro_pri
        fil_pat_fig_tel_nor_rat_all_pri
        fil_pat_fig_tel_nor_rat_wit_pri
        fil_pat_fig_tel_nor_rat_cro_pri
        %
        fil_pat_fig_hab_ong_fir_rat_com
        fil_pat_fig_tel_ong_fir_rat_com
        fil_pat_fig_ofr_com
        fil_pat_fig_ofr_com_dat
        fil_pat_fig_ofr_fig
        %%%%%%%%%% reg
        fil_pat_fig_all_reg
        fil_pat_fig_wit_reg
        fil_pat_fig_cro_reg
        fil_pat_fig_evo_vis_all
        fil_pat_fig_evo_vis_reg
        fil_pat_fig_inh_exc_reg
        %
        fil_pat_fig_dff_inh
        fil_pat_fig_dff_exc
        fil_pat_fig_frc_inh
        fil_pat_fig_frc_exc
        fil_pat_fig_inh_exc
        %
        fil_pat_fig_evo_xsa_dff_cel
        fil_pat_fig_evo_xsa_dff_ani
        fil_pat_fig_evo_xsa_frc_cel
        fil_pat_fig_evo_xsa_frc_ani
        %
        fil_pat_fig_act_tac_dff
        fil_pat_fig_act_tac_frc
        fil_pat_fig_act_tac_tri
        %%%
        fil_pat_fig_cor
        fil_pat_fig_pcc_xsa
        fil_pat_fig_euc_dis
        fil_pat_fig_euc_dis_xsa
        %
        fil_pat_fig_cor_dff
        fil_pat_fig_pcc_dff_xsa
        fil_pat_fig_euc_dis_dff
        fil_pat_fig_euc_dis_dff_xsa
        %
        fil_pat_fig_cor_dff_den_sli_res
        fil_pat_fig_pcc_dff_den_sli_res_xsa
        fil_pat_fig_euc_dis_dff_den_sli_res
        fil_pat_fig_euc_dis_dff_den_sli_res_xsa
        %
        fil_pat_fig_cor_dff_den_sli_res_zsc_tes
        fil_pat_fig_pcc_dff_den_sli_res_zsc_tes_xsa
        fil_pat_fig_euc_dis_dff_den_sli_res_zsc_tes
        fil_pat_fig_euc_dis_dff_den_sli_res_zsc_tes_xsa
        %%%
        fil_pat_fig_ofr_xsa
        %
        fil_pat_fig_spo_cor
        fil_pat_fig_clu
        fil_pat_fig_bri_com
        fil_pat_fig_cor_dis
        fil_pat_fig_ave_cor_dis
        fil_pat_fig_ave_xcc_dis
        fil_pat_fig_cor_his
        fil_pat_fig_cor_kld
        fil_pat_fig_cro_cor_his_one
        fil_pat_fig_cro_cor_his_two
        fil_pat_fig_cro_cor_kld_one
        fil_pat_fig_cro_cor_kld_two
        %
        fil_pat_fig_mag_cor_his
        fil_pat_fig_cor_ske_com
        fil_pat_fig_mag_cro_cor_his_one
        fil_pat_fig_mag_cro_cor_his_two
        fil_pat_fig_cro_cor_ske_com_one
        fil_pat_fig_cro_cor_ske_com_two
        %
        fil_pat_fig_cor_xsa
        fil_pat_fig_cor_xsa_sim
        fil_pat_fig_cro_cor_xsa
        fil_pat_fig_dia
        fil_pat_fig_dia_sig
        fil_pat_fig_dia_mag
        fil_pat_fig_dia_mag_sig
        fil_pat_fig_dia_com
        fil_pat_fig_dia_all
        fil_pat_fig_dia_acc
        %%%
        col_ang_sig
        col_sti
        ani_ind_sam
        n_ani_sam
        n_ani_bri_sam
        n_ani_tai_sam
        n_par
        log_sam_ani
        log_tai_sam_ani
        ind_sam
        %col_sam
        col_sam_con
        % freely moving
        fil_pat_fig_ntt
        fil_pat_fig_tap_fre
        % zan
        fil_pat_fig_y_pos
        fil_pat_fig_occ_map
        % nov
        fil_pat_fig_ses
        fil_pat_fig_occ_map_ann
        fil_pat_fig_occ_map_ann_con
        fil_pat_fig_occ_map_ann_abl
        fil_pat_fig_ypc
        fil_pat_fig_ypc_tog
        fil_pat_fig_y_pos_tog
        fil_pat_fig_trm
        fil_pat_fig_abs_ypc_tog
        fil_pat_fig_abs_trm
        fil_pat_fig_ntt_tim
        fil_pat_fig_ntt_sca
        fil_pat_fig_ntt_sca_ear
        fil_pat_fig_ntt_occ
        fil_pat_fig_ntt_occ_hea
        fil_pat_fig_ntt_occ_sca
        fil_pat_fig_spe_sca
        fil_pat_fig_cor_dis_epo
        fil_pat_fig_ras_map_epo_reg
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        fil_pat_fig_tac
        fil_pat_fig_tai
        fil_pat_fig_hig_com
        fil_pat_fig_abs_cor_xsa
    end
    methods
        function obj = spe(obj)
            obj.n_par = 5;
            obj.n_sam = length(obj.sam);
            obj.fil_pat_sam = strings(obj.n_sam, 1);
            for i = 1:obj.n_sam
                obj.fil_pat_sam(i) = strcat("X:\kadiram\Data\Pooled\", obj.sam(i), "\", ...
                    obj.sam(i), ".mat");
            end
            obj.poo_dir = strcat("X:\kadiram\Data\Pooled\", obj.mul_sam_idx);
            if exist(obj.poo_dir, 'dir') == 0
                mkdir(obj.poo_dir);
            end
            obj.fil_pat_mul_sam = strcat(obj.poo_dir, "\", obj.mul_sam_idx, ".mat");
            obj.fil_pat_fig_tai_ang = strcat(obj.poo_dir, "\tai_ang.png");
            obj.fil_pat_fig_tai_ang_xep = strcat(obj.poo_dir, "\tai_ang_xep.png");
            obj.fil_pat_fig_tai_ang_xsa = strcat(obj.poo_dir, "\tai_ang_xsa.png");
            obj.fil_pat_fig_ang = strcat(obj.poo_dir, "\ang.png");
            obj.fil_pat_fig_ang_win = strcat(obj.poo_dir, "\ang_win.png");
            obj.fil_pat_fig_ang_wit = strcat(obj.poo_dir, "\ang_wit.png");
            obj.fil_pat_fig_ang_cro = strcat(obj.poo_dir, "\ang_cro.png");
            obj.fil_pat_fig_nta_win = strcat(obj.poo_dir, "\nta_win.png");
            obj.fil_pat_fig_nta_wit = strcat(obj.poo_dir, "\nta_wit.png");
            obj.fil_pat_fig_nta_cro = strcat(obj.poo_dir, "\nta_cro.png");
            obj.fil_pat_fig_spe_pha = strcat(obj.poo_dir, "\spe_pha.png");
            obj.fil_pat_fig_ang_ton = strcat(obj.poo_dir, "\ang_ton.png");
            obj.fil_pat_fig_spe_wit = strcat(obj.poo_dir, "\spe_wit.png");
            obj.fil_pat_fig_spe_cro = strcat(obj.poo_dir, "\spe_cro.png");
            obj.fil_pat_fig_ang_pre = strcat(obj.poo_dir, "\ang_pre.png");
            obj.fil_pat_fig_mat_ang_pre = strcat(obj.poo_dir, "\ang_pre.fig");
            obj.fil_pat_fig_mat_ang_cro = strcat(obj.poo_dir, "\ang_cro.fig");
            obj.fil_pat_fig_pro = strcat(obj.poo_dir, "\pro.png");
            obj.fil_pat_fig_pro_sim = strcat(obj.poo_dir, "\pro_sim.png");
            obj.fil_pat_fig_mat_pro = strcat(obj.poo_dir, "\pro.fig");
            obj.fil_pat_fig_mat_pro_sim = strcat(obj.poo_dir, "\pro_sim.fig");
            obj.fil_pat_fig_ang_cro_raw = strcat(obj.poo_dir, "\ang_cro_raw.png");
            obj.fil_pat_fig_tai_rat_hig = strcat(obj.poo_dir, "\tai_rat_hig.png");
            obj.fil_pat_fig_neu = strcat(obj.poo_dir, "\neu.png");
            obj.fil_pat_fig_pla = strcat(obj.poo_dir, "\pla.png");
            obj.fil_pat_fig_beh = strings(obj.n_par - 1, 1);
            obj.fil_pat_fig_beh_mod = strcat(obj.poo_dir, "\beh_mod.png");
            obj.fil_pat_fig_mat_beh_mod = strcat(obj.poo_dir, "\beh_mod.fig");
            obj.fil_pat_fig_spo_hab_tru = strcat(obj.poo_dir, "\spo_hab_tru.png");
            obj.fil_pat_fig_spo_hab_low = strcat(obj.poo_dir, "\spo_hab_low.png");
            obj.fil_pat_fig_spo_hab_mod = strcat(obj.poo_dir, "\spo_hab_mod.png");
            obj.fil_pat_fig_spo_hab_hig = strcat(obj.poo_dir, "\spo_hab_hig.png");
            obj.fil_pat_fig_spo_tel_tru = strcat(obj.poo_dir, "\spo_tel_tru.png");
            obj.fil_pat_fig_spo_tel_low = strcat(obj.poo_dir, "\spo_tel_low.png");
            obj.fil_pat_fig_spo_tel_mod = strcat(obj.poo_dir, "\spo_tel_mod.png");
            obj.fil_pat_fig_spo_tel_hig = strcat(obj.poo_dir, "\spo_tel_hig.png");
            obj.fil_pat_fig_spo_sta_hab_tru = strcat(obj.poo_dir, "\spo_sta_hab_tru.png");
            obj.fil_pat_fig_spo_sta_hab_low = strcat(obj.poo_dir, "\spo_sta_hab_low.png");
            obj.fil_pat_fig_spo_sta_hab_mod = strcat(obj.poo_dir, "\spo_sta_hab_mod.png");
            obj.fil_pat_fig_spo_sta_hab_hig = strcat(obj.poo_dir, "\spo_sta_hab_hig.png");
            obj.fil_pat_fig_spo_sta_tel_tru = strcat(obj.poo_dir, "\spo_sta_tel_tru.png");
            obj.fil_pat_fig_spo_sta_tel_low = strcat(obj.poo_dir, "\spo_sta_tel_low.png");
            obj.fil_pat_fig_spo_sta_tel_mod = strcat(obj.poo_dir, "\spo_sta_tel_mod.png");
            obj.fil_pat_fig_spo_sta_tel_hig = strcat(obj.poo_dir, "\spo_sta_tel_hig.png");
            obj.fil_pat_fig_den_cor = strcat(obj.poo_dir, "\den_cor.png");
            obj.fil_pat_fig_cor_smi = strcat(obj.poo_dir, "\cor_smi.png");
            obj.fil_pat_fig_neu_com = strcat(obj.poo_dir, "\neu_com.png");
            obj.fil_pat_fig_sta_neu_com = strcat(obj.poo_dir, "\sta_neu_com.png");
            obj.fil_pat_fig_res_neu_com = strcat(obj.poo_dir, "\res_neu_com.png");
            obj.fil_pat_fig_res_poo_neu_com = strcat(obj.poo_dir, "\res_poo_neu_com.png");
            obj.fil_pat_fig_tai_rat_spo = strcat(obj.poo_dir, "\tai_rat_spo.png");
            obj.fil_pat_fig_tai_rat_sti = strcat(obj.poo_dir, "\tai_rat_sti.png");
            obj.fil_pat_fig_tai_rat_sti_hal = strcat(obj.poo_dir, "\tai_rat_sti_hal.png");
            obj.fil_pat_fig_neu_ton = strcat(obj.poo_dir, "\neu_ton.png");
            obj.fil_pat_fig_bea_ang = strcat(obj.poo_dir, "\bea_ang.png");
            obj.fil_pat_fig_neu_all = strcat(obj.poo_dir, "\neu_all.png");
            obj.fil_pat_fig_neu_all_pri = strcat(obj.poo_dir, "\neu_all_pri.png");
            obj.fil_pat_fig_neu_wit = strcat(obj.poo_dir, "\neu_wit.png");
            obj.fil_pat_fig_neu_wit_pri = strcat(obj.poo_dir, "\neu_wit_pri.png");
            obj.fil_pat_fig_neu_cro = strcat(obj.poo_dir, "\neu_cro.png");
            obj.fil_pat_fig_neu_cro_pri = strcat(obj.poo_dir, "\neu_cro_pri.png");
            obj.fil_pat_fig_neu_reg = strcat(obj.poo_dir, "\neu_reg.png");
            obj.fil_pat_fig_tai_bea = strcat(obj.poo_dir, "\tai_bea.png");
            obj.fil_pat_fig_tai_wit = strcat(obj.poo_dir, "\tai_wit.png");
            obj.fil_pat_fig_tai_cro = strcat(obj.poo_dir, "\tai_cro.png");
            obj.fil_pat_fig_abs = strcat(obj.poo_dir, "\abs.png");
            obj.fil_pat_fig_spe = strcat(obj.poo_dir, "\spe.png");
            obj.fil_pat_fig_tac = strcat(obj.poo_dir, "\tac.png");
            obj.fil_pat_fig_tai = strcat(obj.poo_dir, "\tai.png");

            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            
            obj.fil_pat_fig_hab_all_pri = strcat(obj.poo_dir, "\hab_all_pri.png");
            obj.fil_pat_fig_hab_wit_pri = strcat(obj.poo_dir, "\hab_wit_pri.png");
            obj.fil_pat_fig_hab_cro_pri = strcat(obj.poo_dir, "\hab_cro_pri.png");
            obj.fil_pat_fig_tel_all_pri = strcat(obj.poo_dir, "\tel_all_pri.png");
            obj.fil_pat_fig_tel_wit_pri = strcat(obj.poo_dir, "\tel_wit_pri.png");
            obj.fil_pat_fig_tel_cro_pri = strcat(obj.poo_dir, "\tel_cro_pri.png");
            %
            obj.fil_pat_fig_hab_rat_all_pri = strcat(obj.poo_dir, "\hab_rat_all_pri.png");
            obj.fil_pat_fig_hab_rat_wit_pri = strcat(obj.poo_dir, "\hab_rat_wit_pri.png");
            obj.fil_pat_fig_hab_rat_cro_pri = strcat(obj.poo_dir, "\hab_rat_cro_pri.png");
            obj.fil_pat_fig_tel_rat_all_pri = strcat(obj.poo_dir, "\tel_rat_all_pri.png");
            obj.fil_pat_fig_tel_rat_wit_pri = strcat(obj.poo_dir, "\tel_rat_wit_pri.png");
            obj.fil_pat_fig_tel_rat_cro_pri = strcat(obj.poo_dir, "\tel_rat_cro_pri.png");
            %
            obj.fil_pat_fig_hab_nor_rat_all_pri = strcat(obj.poo_dir, "\hab_nor_rat_all_pri.png");
            obj.fil_pat_fig_hab_nor_rat_wit_pri = strcat(obj.poo_dir, "\hab_nor_rat_wit_pri.png");
            obj.fil_pat_fig_hab_nor_rat_cro_pri = strcat(obj.poo_dir, "\hab_nor_rat_cro_pri.png");
            obj.fil_pat_fig_tel_nor_rat_all_pri = strcat(obj.poo_dir, "\tel_nor_rat_all_pri.png");
            obj.fil_pat_fig_tel_nor_rat_wit_pri = strcat(obj.poo_dir, "\tel_nor_rat_wit_pri.png");
            obj.fil_pat_fig_tel_nor_rat_cro_pri = strcat(obj.poo_dir, "\tel_nor_rat_cro_pri.png");
            %
            obj.fil_pat_fig_bri_com = strcat(obj.poo_dir, "\bri_com.png");
            obj.fil_pat_fig_hab_ong_fir_rat_com = strcat(obj.poo_dir, "\hab_ong_fir_rat_com.png");
            obj.fil_pat_fig_tel_ong_fir_rat_com = strcat(obj.poo_dir, "\tel_ong_fir_rat_com.png");
            obj.fil_pat_fig_ofr_com = strcat(obj.poo_dir, "\ofr_com.png");
            obj.fil_pat_fig_ofr_com_dat = strcat(obj.poo_dir, "\ofr_com_dat.png");
            obj.fil_pat_fig_ofr_fig = strcat(obj.poo_dir, "\ofr.fig");
            %
            obj.fil_pat_fig_dff_inh = strcat(obj.poo_dir, "\dff_inh.png");
            obj.fil_pat_fig_dff_exc = strcat(obj.poo_dir, "\dff_exc.png");
            obj.fil_pat_fig_frc_inh = strcat(obj.poo_dir, "\frc_inh.png");
            obj.fil_pat_fig_frc_exc = strcat(obj.poo_dir, "\frc_exc.png");
            obj.fil_pat_fig_inh_exc = strcat(obj.poo_dir, "\inh_exc.png");
            %
            obj.fil_pat_fig_evo_vis_all = strcat(obj.poo_dir, "\evo_vis_all.png");
            %
            obj.fil_pat_fig_evo_xsa_dff_cel = strcat(obj.poo_dir, "\evo_xsa_dff_cel.png");
            obj.fil_pat_fig_evo_xsa_dff_ani = strcat(obj.poo_dir, "\evo_xsa_dff_ani.png");
            obj.fil_pat_fig_evo_xsa_frc_cel = strcat(obj.poo_dir, "\evo_xsa_frc_cel.png");
            obj.fil_pat_fig_evo_xsa_frc_ani = strcat(obj.poo_dir, "\evo_xsa_frc_ani.png");
            %
            obj.fil_pat_fig_act_tac_dff = strcat(obj.poo_dir, "\act_tac_dff.png");
            obj.fil_pat_fig_act_tac_frc = strcat(obj.poo_dir, "\act_tac_frc.png");
            obj.fil_pat_fig_act_tac_tri = strcat(obj.poo_dir, "\act_tac_tri.png");
            %%%
            obj.fil_pat_fig_cor = strcat(obj.poo_dir, "\cor.png");
            obj.fil_pat_fig_pcc_xsa = strcat(obj.poo_dir, "\pcc_xsa.png");
            obj.fil_pat_fig_euc_dis = strcat(obj.poo_dir, "\euc_dis.png");
            obj.fil_pat_fig_euc_dis_xsa = strcat(obj.poo_dir, "\euc_dis_xsa.png");
            %
            obj.fil_pat_fig_cor_dff = strcat(obj.poo_dir, "\cor_dff.png");
            obj.fil_pat_fig_pcc_dff_xsa = strcat(obj.poo_dir, "\pcc_dff_xsa.png");
            obj.fil_pat_fig_euc_dis_dff = strcat(obj.poo_dir, "\euc_dis_dff.png");
            obj.fil_pat_fig_euc_dis_dff_xsa = strcat(obj.poo_dir, "\euc_dis_dff_xsa.png");
            %
            obj.fil_pat_fig_cor_dff_den_sli_res = strcat(obj.poo_dir, "\cor_dff_den_sli_res.png");
            obj.fil_pat_fig_pcc_dff_den_sli_res_xsa = ...
                strcat(obj.poo_dir, "\pcc_dff_den_sli_res_xsa.png");
            obj.fil_pat_fig_euc_dis_dff_den_sli_res = ...
                strcat(obj.poo_dir, "\euc_dis_dff_den_sli_res.png");
            obj.fil_pat_fig_euc_dis_dff_den_sli_res_xsa = ...
                strcat(obj.poo_dir, "\euc_dis_dff_den_sli_res_xsa.png");
            %
            obj.fil_pat_fig_cor_dff_den_sli_res_zsc_tes = ...
                strcat(obj.poo_dir, "\cor_dff_den_sli_res_zsc_tes.png");
            obj.fil_pat_fig_pcc_dff_den_sli_res_zsc_tes_xsa = ...
                strcat(obj.poo_dir, "\pcc_dff_den_sli_res_zsc_tes_xsa.png");
            obj.fil_pat_fig_euc_dis_dff_den_sli_res_zsc_tes = ...
                strcat(obj.poo_dir, "\euc_dis_dff_den_sli_res_zsc_tes.png");
            obj.fil_pat_fig_euc_dis_dff_den_sli_res_zsc_tes_xsa = ...
                strcat(obj.poo_dir, "\euc_dis_dff_den_sli_res_zsc_tes_xsa.png");
            %%%
            obj.fil_pat_fig_ofr_xsa = strcat(obj.poo_dir, "\ofr_xsa.png");
            %%%
            obj.fil_pat_fig_spo_cor = strcat(obj.poo_dir, "\spo_cor.png");
            obj.fil_pat_fig_clu = strcat(obj.poo_dir, "\clu.png");
            obj.fil_pat_fig_cor_dis = strcat(obj.poo_dir, "\cor_dis.png");
            obj.fil_pat_fig_cor_dis_epo = strcat(obj.poo_dir, "\cor_dis_epo.png");
            obj.fil_pat_fig_ave_cor_dis = strcat(obj.poo_dir, "\ave_cor_dis.png");
            obj.fil_pat_fig_ave_xcc_dis = strcat(obj.poo_dir, "\ave_xcc_dis.png");
            obj.fil_pat_fig_cor_his = strcat(obj.poo_dir, "\cor_his.png");
            obj.fil_pat_fig_cor_kld = strcat(obj.poo_dir, "\cor_kld.png");
            obj.fil_pat_fig_cro_cor_his_one = strcat(obj.poo_dir, "\cro_cor_his_one.png");
            obj.fil_pat_fig_cro_cor_his_two = strcat(obj.poo_dir, "\cro_cor_his_two.png");
            obj.fil_pat_fig_cro_cor_kld_one = strcat(obj.poo_dir, "\cro_cor_kld_one.png");
            obj.fil_pat_fig_cro_cor_kld_two = strcat(obj.poo_dir, "\cro_cor_kld_two.png");
            %
            obj.fil_pat_fig_mag_cor_his = strcat(obj.poo_dir, "\mag_cor_his.png");
            obj.fil_pat_fig_cor_ske_com = strcat(obj.poo_dir, "\cor_ske_com.png");
            obj.fil_pat_fig_mag_cro_cor_his_one = strcat(obj.poo_dir, "\mag_cro_cor_his_one.png");
            obj.fil_pat_fig_mag_cro_cor_his_two = strcat(obj.poo_dir, "\mag_cro_cor_his_two.png");
            obj.fil_pat_fig_cro_cor_ske_com_one = strcat(obj.poo_dir, "\cro_cor_ske_com_one.png");
            obj.fil_pat_fig_cro_cor_ske_com_two = strcat(obj.poo_dir, "\cro_cor_ske_com_two.png");
            %
            obj.fil_pat_fig_cor_xsa = strcat(obj.poo_dir, "\cor_xsa.png");
            obj.fil_pat_fig_cor_xsa_sim = strcat(obj.poo_dir, "\cor_xsa_sim.png");
            obj.fil_pat_fig_cro_cor_xsa = strcat(obj.poo_dir, "\cro_cor_xsa.png");
            obj.fil_pat_fig_dia = strcat(obj.poo_dir, "\dia.png");
            obj.fil_pat_fig_dia_sig = strcat(obj.poo_dir, "\dia_sig.png");
            obj.fil_pat_fig_dia_mag = strcat(obj.poo_dir, "\dia_mag.png");
            obj.fil_pat_fig_dia_mag_sig = strcat(obj.poo_dir, "\dia_mag_sig.png");
            obj.fil_pat_fig_dia_com = strcat(obj.poo_dir, "\dia_com.png");
            obj.fil_pat_fig_dia_all = strcat(obj.poo_dir, "\dia_all.png");
            obj.fil_pat_fig_dia_acc = strcat(obj.poo_dir, "\dia_acc.png");
            % freely moving
            obj.fil_pat_fig_ntt = strcat(obj.poo_dir, "\ntt.png");
            obj.fil_pat_fig_tap_fre = strcat(obj.poo_dir, "\tap_fre.png");
            % zan
            obj.fil_pat_fig_y_pos = strcat(obj.poo_dir, "\y_pos.png");
            obj.fil_pat_fig_occ_map = strcat(obj.poo_dir, "\occ_map.png");
            % nov - two
            obj.fil_pat_fig_ses = strcat(obj.poo_dir, "\ses.png");
            obj.fil_pat_fig_occ_map_ann = strcat(obj.poo_dir, "\occ_map_ann.png");
            obj.fil_pat_fig_occ_map_ann_con = strcat(obj.poo_dir, "\occ_map_ann_con.png");
            obj.fil_pat_fig_occ_map_ann_abl = strcat(obj.poo_dir, "\occ_map_ann_abl.png");
            obj.fil_pat_fig_ypc = strcat(obj.poo_dir, "\ypc.png");
            obj.fil_pat_fig_ypc_tog = strcat(obj.poo_dir, "\ypc_tog.png");
            obj.fil_pat_fig_y_pos_tog = strcat(obj.poo_dir, "\y_pos_tog.png");
            obj.fil_pat_fig_trm = strcat(obj.poo_dir, "\trm.png");
            obj.fil_pat_fig_abs_ypc_tog = strcat(obj.poo_dir, "\abs_ypc_tog.png");
            obj.fil_pat_fig_abs_trm = strcat(obj.poo_dir, "\abs_trm.png");
            obj.fil_pat_fig_ntt_tim = strcat(obj.poo_dir, "\ntt_tim.png");
            obj.fil_pat_fig_ntt_sca = strcat(obj.poo_dir, "\ntt_sca.png");
            obj.fil_pat_fig_ntt_sca_ear = strcat(obj.poo_dir, "\ntt_sca_ear.png");
            obj.fil_pat_fig_ntt_occ = strcat(obj.poo_dir, "\ntt_occ.png");
            obj.fil_pat_fig_ntt_occ_hea = strcat(obj.poo_dir, "\ntt_occ_hea.png");
            obj.fil_pat_fig_ntt_occ_sca = strcat(obj.poo_dir, "\ntt_occ_sca.png");
            obj.fil_pat_fig_spe_sca = strcat(obj.poo_dir, "\spe_sca.png");
            obj.fil_pat_fig_hig_com = strcat(obj.poo_dir, "\hig_com.png");
            obj.fil_pat_fig_abs_cor_xsa = strcat(obj.poo_dir, "\abs_cor_xsa.png");
            %%%
            global n_reg_for nam_sho_reg
            obj.fil_pat_fig_all_reg = strings(n_reg_for, 1);
            obj.fil_pat_fig_wit_reg = strings(n_reg_for, 1);
            obj.fil_pat_fig_cro_reg = strings(n_reg_for, 1);
            obj.fil_pat_fig_evo_vis_reg = strings(n_reg_for, 1);
            obj.fil_pat_fig_inh_exc_reg = strings(n_reg_for, 1);
            for i = 1:n_reg_for
                obj.fil_pat_fig_all_reg(i) = strcat(obj.poo_dir, "\", nam_sho_reg(i), "_all.png");
                obj.fil_pat_fig_wit_reg(i) = strcat(obj.poo_dir, "\", nam_sho_reg(i), "_wit.png");
                obj.fil_pat_fig_cro_reg(i) = strcat(obj.poo_dir, "\", nam_sho_reg(i), "_cro.png");
                obj.fil_pat_fig_evo_vis_reg(i) = ...
                    strcat(obj.poo_dir, "\", nam_sho_reg(i), "_evo_vis.png");
                obj.fil_pat_fig_inh_exc_reg(i) = ...
                    strcat(obj.poo_dir, "\", nam_sho_reg(i), "_inh_exc.png");
            end
            %
            con_fil = matfile('\\home.ansatt.ntnu.no\kadiram\Documents\MATLAB\con_esp.mat');
            n_epo = con_fil.n_epo;
            obj.fil_pat_fig_ras_map_epo_reg = strings(n_epo.tot, n_reg_for);
            for j = 1:n_epo.tot
                for i = 1:n_reg_for
                    obj.fil_pat_fig_ras_map_epo_reg(j, i) = strcat(obj.poo_dir, "\ras_map", num2str(j), ...
                        nam_sho_reg(i), ".png");
                end
            end
            %
            for i = 1:obj.n_par - 1
                obj.fil_pat_fig_beh(i) = strcat(obj.poo_dir, "\beh_", string(i), ".png");
            end
            obj.col_ang_sig = 'k';
            obj.col_sti = 'red';
            obj.n_ani_sam = nan(obj.n_sam, 1); % changed from cell to vector!
            obj.n_ani_bri_sam = nan(obj.n_sam, 1);
            obj.n_ani_tai_sam = nan(obj.n_sam, 1);
            obj.log_sam_ani = cell(obj.n_sam, 1);
            obj.log_tai_sam_ani = cell(obj.n_sam, 1);
            for i = 1:obj.n_sam
                sam_fun_i = ...
                    str2func(['sam_fun.' convertStringsToChars(strcat(obj.sam(i), "_fun"))]);
                sam_obj = sam_fun_i();
                obj.n_ani_sam(i) = sam_obj.n_ani;
                obj.n_ani_bri_sam(i) = sam_obj.n_ani_bri; % also cel_det
                obj.n_ani_tai_sam(i) = sam_obj.n_ani_tai;
                obj.log_sam_ani{i} = sam_obj.bri_ani & sam_obj.cel_det_ani;
                obj.log_tai_sam_ani{i} = sam_obj.tai_ani;
            end
            obj.tit_n_sam = strings(obj.n_sam, 1);
            obj.tit_n_bri_sam = strings(obj.n_sam, 1);
            obj.tit_n_tai_sam = strings(obj.n_sam, 1);
            obj.tit_lon_n_sam = strings(obj.n_sam, 1);
            for i = 1:obj.n_sam
                obj.tit_n_sam(i) = strcat(obj.tit_sam(i), " n = ", ...
                    sprintf('%d', obj.n_ani_tai_sam(i)));
                obj.tit_n_bri_sam(i) = strcat(obj.tit_sam(i), ...
                    sprintf(' %d', obj.n_ani_bri_sam(i)), " animals");
                obj.tit_n_tai_sam(i) = strcat(obj.tit_sam(i), ...
                    sprintf(' %d', obj.n_ani_tai_sam(i)), " animals");
                if ~isempty(obj.tit_lon_sam)
                    obj.tit_lon_n_sam(i) = strcat(obj.tit_lon_sam(i), " n = ", ...
                        sprintf('%d', obj.n_ani_tai_sam(i)));
                end
            end
        end
        function sav_dat_mul_sam(obj)
            save(obj.fil_pat_mul_sam, 'obj', '-v7.3')
        end
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% data
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% freely-moving
        function app_fre_dat(obj)
            ric_fil = matfile("X:\kadiram\from\ricarda\variables_1sec_bin.mat");
            %%%%%%%%%%%%%%%%%%%%%%%%%% ntt
            tim_ntt_bin = (1:1800)';
            dur = 4;
            [mea_dis_ntt_tim_gro, sem_dis_ntt_tim_gro, ave_dis_ntt_win_cox_sam_ani, ...
                p_dis_ntt_win, p_dis_ntt_rst_win, pro_ntt_sam_win_row_col, foc_ntt_win_cox_sam_ani, ...
                p_foc_ntt_win, p_foc_ntt_rst_win] = ext_ntt_dat(...
                ric_fil.y_position_nacre_tph2_NTT, ric_fil.heatmaps_nacre_tph2_NTT, dur);
            %%%%%%%%%%%%%%%%%%%%%%%%% tap
            off = 8;
            tim_tap_bin = (1750:3360)';
            [mea_dis_tap_tim_gro, sem_dis_tap_tim_gro, ave_dis_tap_win_cox_sam_ani, p_dis_tap_win] ...
                = ext_fre_tap_dat(ric_fil.y_position_nacre_tph2_taps, off, tim_tap_bin);
            %%%%%
            [~, ~, ~, ~, ~, ~, pro_tap_sam_win_row_col, foc_tap_win_cox_sam_ani, p_foc_tap_win] = ...
                read_behaviour_EY_heatmaps_2_taps_km(ric_fil.heatmaps_nacre_tph2_taps);
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            save(obj.fil_pat_mul_sam, 'tim_ntt_bin', 'mea_dis_ntt_tim_gro', 'sem_dis_ntt_tim_gro', ...
                'ave_dis_ntt_win_cox_sam_ani', 'p_dis_ntt_win', ...
                'pro_ntt_sam_win_row_col', 'foc_ntt_win_cox_sam_ani', 'p_foc_ntt_win', ...
                'p_dis_ntt_rst_win', 'p_foc_ntt_rst_win', ...%
                'tim_tap_bin', 'mea_dis_tap_tim_gro', 'sem_dis_tap_tim_gro', ...
                'ave_dis_tap_win_cox_sam_ani', 'p_dis_tap_win', ...
                'pro_tap_sam_win_row_col', 'foc_tap_win_cox_sam_ani', 'p_foc_tap_win', ...%
                '-append')
        end
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% zan
        function app_zan_dat(obj)
            mat_fil_obj = matfile("X:\kadiram\Data\Pooled\zan\Tph2_Vibration_2022_data.mat");
            [y_pos_bas_sam_fra_ani, y_pos_bas_sam_ani, p_y_pos_bas_xsa, ...
                y_pos_con_sam_fra_ani, y_pos_win_con_sam_ani, p_y_pos_win_con_xsa, ...
                bas_spe_sam_bin_ani, p_bas_spe_xsa, spe_con_sam_bin_ani, p_spe_win_con_xsa, ...
                pro_sam_epo_row_col, foc_epo_cox_sam_ani, p_foc_epo] = ext_zan_dat...
                (mat_fil_obj.all_fish);
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            save(obj.fil_pat_mul_sam, 'y_pos_bas_sam_fra_ani', 'y_pos_bas_sam_ani', ...
                'p_y_pos_bas_xsa', 'y_pos_con_sam_fra_ani', 'y_pos_win_con_sam_ani', ...
                'p_y_pos_win_con_xsa', 'bas_spe_sam_bin_ani', 'p_bas_spe_xsa', ...
                'spe_con_sam_bin_ani', 'p_spe_win_con_xsa', 'pro_sam_epo_row_col', ...
                'foc_epo_cox_sam_ani', 'p_foc_epo', '-append')
        end
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% nov
        function app_nov_dat(obj)
            mat_fil = matfile("X:\kadiram\Data\Pooled\nov\Tph2_NT_Vibration_2022_data.mat");
            [mea_y_pos_tim_gro, sem_y_pos_tim_gro, y_pos_win_cox_sam_ani, p_y_pos_win, ...
                mea_spe_tim_gro, sem_spe_tim_gro, spe_win_cox_sam_ani, p_spe_win, ypc_sam_fra_ani, ...
                ypc_wix_con_sam_ani, p_ypc_wix_con_xsa, p_ypc_xsa, ypc_sam_ani, spe_sam_fra_ani] = ...
                ext_nov_dat...
                (mat_fil.all_fish, mat_fil.x_values, mat_fil.change_yposition_1, ...
                mat_fil.change_yposition_2);
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            save(obj.fil_pat_mul_sam, 'mea_y_pos_tim_gro', 'sem_y_pos_tim_gro', ...
                'y_pos_win_cox_sam_ani', 'p_y_pos_win', 'mea_spe_tim_gro', 'sem_spe_tim_gro', ...
                'spe_win_cox_sam_ani', 'p_spe_win', 'ypc_sam_fra_ani', 'ypc_wix_con_sam_ani', ...
                'p_ypc_wix_con_xsa', 'p_ypc_xsa', 'ypc_sam_ani', '-append')
        end
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% two
        function app_two_dat(obj)
            mat_fil = matfile("X:\kadiram\Data\Pooled\two\Tph2_NTT_VibrAdapt_2022_data.mat");
            num_sam = [2 1 3];
            pro_sam_row_col_win_ani = mat_fil.pro_sam_row_col_win_ani;
            [mea_y_pos_tim_gro, sem_y_pos_tim_gro, y_pos_win_cox_sam_ani, p_y_pos_win_cox_xsa, ...
                p_ypc_xsa, ypc_sam_ani, tim_fra, ...
                p_y_pos_xsa, y_pos_sam_ani, ypc_sam_ani_tri, p_abs_ypc_xsa, abs_ypc_sam_ani, ...
                abs_ypc_sam_ani_tri, foc_win_cox_sam_ani, p_foc_win_cox_xsa, p_spx_win_cox_xsa, ...
                spx_win_cox_sam_ani, spx_win_cox_sam_ani_tri] = ext_two_dat(...
                mat_fil.all_fish, mat_fil.x_values, mat_fil.change_yposition_1, ...
                mat_fil.change_yposition_2, mat_fil.change_yposition_3, mat_fil.yposition_1, ...
                mat_fil.yposition_2, mat_fil.yposition_3, pro_sam_row_col_win_ani(num_sam'), ...
                mat_fil.x_values_velo, mat_fil.change_velo_1, mat_fil.change_velo_2, ...
                mat_fil.change_velo_3);
            sti_ons_tri = mat_fil.stim_times;
            pro_win_sam_row_col = mat_fil.pro_win_sam_row_col;
            pro_win_sam_row_col = pro_win_sam_row_col(:, num_sam);
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            save(obj.fil_pat_mul_sam, 'mea_y_pos_tim_gro', 'sem_y_pos_tim_gro', ...
                'y_pos_win_cox_sam_ani', 'p_y_pos_win_cox_xsa', 'p_ypc_xsa', ...
                'ypc_sam_ani', 'tim_fra', 'sti_ons_tri', 'p_y_pos_xsa', 'y_pos_sam_ani', ...
                'ypc_sam_ani_tri', 'p_abs_ypc_xsa', 'abs_ypc_sam_ani', 'abs_ypc_sam_ani_tri', ...
                'pro_win_sam_row_col', 'foc_win_cox_sam_ani', 'p_foc_win_cox_xsa', ...
                'p_spx_win_cox_xsa', 'spx_win_cox_sam_ani', 'spx_win_cox_sam_ani_tri', '-append')
        end
        %
        function app_par_two_dat(obj)
            mat_fil = matfile("X:\kadiram\Data\Pooled\two\Tph2_NTT_VibrAdapt_2022_data.mat");
            all_fish = mat_fil.all_fish;
            [~, ~, spe_win_cox_sam_ani, p_spe_win_cox_xsa] = ext_spe_dat(all_fish);
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            save(obj.fil_pat_mul_sam, 'spe_win_cox_sam_ani', 'p_spe_win_cox_xsa', '-append')
        end
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% behavioral
        function app_tai_dat_omn(obj)
            app_mul_tai_dat_seg_all(obj)
            app_tai_dat_all(obj)
            app_tai_dat(obj)
        end
        function app_tai_dat_sam_mul(obj)
            app_tai_dat_all(obj)
            app_tai_dat(obj)
        end
        function app_tai_dat(obj)
            abs_sam_ani = cell(1, obj.n_sam);
            bea_lat_sam_ani_tri = cell(obj.n_sam, 1);
            bea_ang_sam_ani_tri = cell(obj.n_sam, 1);
            global n_con n_win n_epo
            pro_win_con_sam_ani = cell(1, n_con);
            lat_win_con_sam_ani = cell(1, n_con);
            ang_win_con_sam_ani = cell(1, n_con);
            per_pro_shu_sam_ani = cell(obj.n_sam, 1);
            p_sam_cro = cell(obj.n_sam, 1); % within-sample
            p_lat_sam_cro = cell(obj.n_sam, 1);
            p_ang_sam_cro = cell(obj.n_sam, 1);
            %
            ang_sam_fra_sta_con = cell(obj.n_sam, 1);
            nta_sam_fra_sta_con = cell(obj.n_sam, 1);
            spe_sam_fra_sta_con = cell(obj.n_sam, 1);
            %%%%%%%%%%%%%%%%%%%
            p_nta_sam_con_xwi = cell(obj.n_sam, 1);
            p_nta_sam_win_xco = cell(obj.n_sam, 1);
            %
            p_ave_ang_sam_xep = cell(obj.n_sam, 1);
            %
            ang_sam_fra_ani = cell(obj.n_sam, 1);
            for i = 1:obj.n_sam
                sam_fil = matfile(obj.fil_pat_sam(i));
                bea_lat_sam_ani_tri{i} = sam_fil.bea_lat_ani_tri;
                bea_ang_sam_ani_tri{i} = sam_fil.bea_ang_ani_tri;
                per_pro_shu_sam_ani{i} = sam_fil.per_pro_ani_shu;
                p_sam_cro{i} = sam_fil.p_cro;
                p_lat_sam_cro{i} = sam_fil.p_lat_cro;
                p_ang_sam_cro{i} = sam_fil.p_ang_cro;
                %
                abs_sam_ani{i} = sam_fil.abs_ani;
                ang_fra_sta_con = sam_fil.ang_fra_sta_con;
                ang_sam_fra_sta_con{i} = ang_fra_sta_con;
                nta_fra_sta_con = sam_fil.nta_fra_sta_con;
                nta_sam_fra_sta_con{i} = nta_fra_sta_con;
                spe_sam_fra_sta_con{i} = sam_fil.spe_fra_sta_con;
                %%%%
                p_nta_sam_con_xwi{i} = sam_fil.p_nta_con_xwi;
                p_nta_sam_win_xco{i} = sam_fil.p_nta_win_xco;
                %
                p_ave_ang_sam_xep{i} = sam_fil.p_ave_ang_xep;
                %
                ang_sam_fra_ani{i} = sam_fil.ang_fra_ani;
            end
            %
            nta_win_con_sam_ani = cell(n_win.tri, n_con);
            for k = 1:n_win.tri
                for i = 1:n_con
                    for j = 1:obj.n_sam
                        sam_fil = matfile(obj.fil_pat_sam(j));
                        ave_nta_con_win_ani = sam_fil.ave_nta_con_win_ani;
                        nta_win_con_sam_ani{k, i}{j} = ave_nta_con_win_ani{i, k};
                        if k == 1
                            pro_win_con_sam_ani{k, i}{j} = sam_fil.per_pro_ani_con(:, i);
                            lat_win_con_sam_ani{k, i}{j} = sam_fil.bea_lat_ani_con(:, i);
                            ang_win_con_sam_ani{k, i}{j} = sam_fil.bea_ang_ani_con(:, i);
                        end
                    end
                end
            end
            %
            p_abs_cro = com_p_xsa(abs_sam_ani);
            %
            ave_ang_epo_sam_ani = cell(n_epo.ong, 1);
            for i = 1:n_epo.ong
                for j = 1:obj.n_sam
                    sam_fil = matfile(obj.fil_pat_sam(j));
                    ave_ang_epo_ani = sam_fil.ave_ang_epo_ani;
                    ave_ang_epo_sam_ani{i}{j} = ave_ang_epo_ani{i};
                end
            end
            p_ave_ang_epo_xsa = com_p_var_win_con_xsa(ave_ang_epo_sam_ani);
            %
            p_pro_win_con_xsa = com_p_var_win_con_xsa(pro_win_con_sam_ani);
            p_lat_win_con_xsa = com_p_var_win_con_xsa(lat_win_con_sam_ani);
            p_ang_win_con_xsa = com_p_var_win_con_xsa(ang_win_con_sam_ani);
            p_nta_win_con_xsa = com_p_var_win_con_xsa(nta_win_con_sam_ani);
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            save(obj.fil_pat_mul_sam, 'bea_lat_sam_ani_tri', ...
                'per_pro_shu_sam_ani', 'p_sam_cro', ...
                'p_lat_sam_cro', 'ang_sam_fra_sta_con', 'spe_sam_fra_sta_con', ...
                'bea_ang_sam_ani_tri', ...
                'p_ang_sam_cro', ... % should be related to beat angle
                'nta_sam_fra_sta_con', 'nta_win_con_sam_ani', ...
                'p_nta_sam_con_xwi', 'p_nta_sam_win_xco', 'p_nta_win_con_xsa', ...
                'abs_sam_ani', 'p_abs_cro', 'ang_sam_fra_ani', ...%%%%
                'pro_win_con_sam_ani', 'lat_win_con_sam_ani', 'ang_win_con_sam_ani', ...
                'p_pro_win_con_xsa', 'p_lat_win_con_xsa', 'p_ang_win_con_xsa', ...
                'ave_ang_epo_sam_ani', 'p_ave_ang_sam_xep', 'p_ave_ang_epo_xsa', ...
                '-append')
        end
        % unincorporated
        function app_par_tai(obj)
            tac_sam_tri_win = cell(obj.n_sam, 1);
            for sam_num = 1:obj.n_sam
                sam_fil = matfile(obj.fil_pat_sam(sam_num));
                tac_tri_win = sam_fil.tac_tri_win;
                tac_sam_tri_win{sam_num} = tac_tri_win;
            end
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            save(obj.fil_pat_mul_sam, 'tac_sam_tri_win', '-append')
        end
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% neural
        function app_pix_omn(obj)
            app_mul_dff_bra_chu_fra_cel_all(obj)
            app_ave_neu_all(obj)
            app_all_sam(obj)
        end
        function app_pix_sam_mul(obj)
            app_ave_neu_all(obj)
            app_all_sam(obj)
        end
        %
        function app_all_omn(obj)
            app_mul_dff_bra_chu_fra_cel_all(obj)
            app_dff_all_sam_ave_all(obj)
            app_all_sam(obj)
        end
        function app_all_sam_mul(obj)
            app_dff_all_sam_ave_all(obj)
            app_all_sam(obj)
        end
        function app_all_sam(obj)
            tic
            global n_reg_for n_cro_tot n_win n_con n_epo
            n_cel_reg_sam.raw = nan(n_reg_for, obj.n_sam);
            n_cel_reg_sam.rem = nan(n_reg_for, obj.n_sam);
            for i = 1:obj.n_sam
                sam_fil = matfile(obj.fil_pat_sam(i));
                n_cel_reg = sam_fil.n_cel_reg;
                n_cel_reg_sam.raw(:, i) = n_cel_reg.raw;
                n_cel_reg_sam.rem(:, i) = n_cel_reg.rem;
            end
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            fie_cas_num = {{'dff'; 'raw'; 'tri'; 'all'}; ...
                {'dff'; 'raw'; 'tri'; 'inh'}; ...
                {'dff'; 'raw'; 'tri'; 'exc'}};
            [act_reg_sam_con_fra_cel, act_reg_sam_fra_sta_con] = ext_act_reg_sam_con_fra_cel(obj, ...
                fie_cas_num);
            %%%%%%%%%%% - work on this!
            act_reg_win_con_sam_uni.dff.raw.tri.cel = cell(n_reg_for, 1);
            p_act_reg_win_con_xsa.dff.raw.tri.cel = cell(n_reg_for, 1);
            %
            act_reg_win_con_sam_uni.dff.raw.tri.ani = cell(n_reg_for, 1);
            p_act_reg_win_con_xsa.dff.raw.tri.ani = cell(n_reg_for, 1);
            for l = 1:n_reg_for
                for k = 1:n_win.tri
                    for i = 1:n_con
                        for j = 1:obj.n_sam
                            sam_fil = matfile(obj.fil_pat_sam(j));
                            act_reg_con_win_uni = sam_fil.act_reg_con_win_uni;
                            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
                            act_reg_win_con_sam_uni.dff.raw.tri.cel{l}{k, i}{j} = ...
                                act_reg_con_win_uni.dff.raw.tri.cel{l}{i, k};
                            %
                            act_reg_win_con_sam_uni.dff.raw.tri.ani{l}{k, i}{j} = ...
                                act_reg_con_win_uni.dff.raw.tri.ani{l}{i, k};
                        end
                    end
                end
                p_act_reg_win_con_xsa.dff.raw.tri.cel{l} = ...
                    com_p_var_win_con_xsa(act_reg_win_con_sam_uni.dff.raw.tri.cel{l});
                %
                p_act_reg_win_con_xsa.dff.raw.tri.ani{l} = ...
                    com_p_var_win_con_xsa(act_reg_win_con_sam_uni.dff.raw.tri.ani{l});
            end
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            fra_reg_con_sam_ani.dff.raw.tri.inh = cell(n_reg_for, n_con);
            fra_reg_con_sam_ani.dff.raw.tri.exc = cell(n_reg_for, n_con);
            for k = 1:n_reg_for
                for i = 1:n_con
                    fra_reg_con_sam_ani.dff.raw.tri.inh{k, i} = cell(obj.n_sam, 1);
                    fra_reg_con_sam_ani.dff.raw.tri.exc{k, i} = cell(obj.n_sam, 1);
                    for j = 1:obj.n_sam
                        sam_fil = matfile(obj.fil_pat_sam(j));
                        fra_reg_con_ani = sam_fil.fra_reg_con_ani;
                        fra_reg_con_sam_ani.dff.raw.tri.inh{k, i}{j} = ...
                            fra_reg_con_ani.dff.raw.tri.inh{k, i};
                        fra_reg_con_sam_ani.dff.raw.tri.exc{k, i}{j} = ...
                            fra_reg_con_ani.dff.raw.tri.exc{k, i};
                    end
                end
            end
            p_fra_reg_con_xsa.dff.raw.tri.inh = ...
                com_p_var_win_con_xsa(fra_reg_con_sam_ani.dff.raw.tri.inh);
            p_fra_reg_con_xsa.dff.raw.tri.exc = ...
                com_p_var_win_con_xsa(fra_reg_con_sam_ani.dff.raw.tri.exc);
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            fie_num = {'dff'; 'raw'; 'tri'; 'all'};
            [pcc_reg_sam_xri_xri.dff.raw.tri.all, ...
                pcc_ave_reg_con_sam_ani.dff.raw.tri.all, ...
                p_pcc_reg_con_xsa.dff.raw.tri.all, ...
                euc_dis_reg_sam_xri_xri.dff.raw.tri.all, ...
                euc_dis_ave_reg_con_sam_ani.dff.raw.tri.all, ...
                p_euc_dis_reg_con_xsa.dff.raw.tri.all] = ...
                ext_pcc_reg_sam_xri_xri(obj.fil_pat_sam, fie_num);
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% ongoing
            ofr_reg_win_sam_ani = cell(n_reg_for, 1);
            for i = 1:n_reg_for
                ofr_reg_win_sam_ani{i} = cell(n_epo.ong, 1);
                for l = 1:n_epo.ong
                    ofr_reg_win_sam_ani{i}{l} = cell(obj.n_sam, 1);
                end
            end
            for k = 1:n_reg_for
                for i = 1:obj.n_sam
                    sam_fil = matfile(obj.fil_pat_sam(i));
                    %%%
                    ofr_reg_win_ani = sam_fil.ofr_reg_win_ani;
                    for l = 1:n_epo.ong
                        ofr_reg_win_sam_ani{k}{l}{i} = ofr_reg_win_ani{k, l};
                    end
                end
            end
            p_ofr_reg_win_xsa = cell(n_reg_for, 1);
            for k = 1:n_reg_for
                p_ofr_reg_win_xsa{k} = com_p_var_win_con_xsa(ofr_reg_win_sam_ani{k});
            end
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% synch
            per_pai_epo_reg_sam_bin_ani = gen_var_rox_cox_roq_coq(n_epo.tot, n_reg_for, obj.n_sam, 1);
            ske_epo_reg_sam_ani = gen_var_rox_cox_roq_coq(n_epo.tot, n_reg_for, obj.n_sam, 1);
            acc_epo_reg_sam_ani = gen_var_rox_cox_roq_coq(n_epo.tot, n_reg_for, obj.n_sam, 1);
            %
            cor_coe_epo_reg_sam_blo_ani.all = gen_var_rox_cox_roq_coq(n_epo.tot, n_reg_for, ...
                obj.n_sam, 1);
            cor_coe_epo_reg_sam_blo_ani.pos = gen_var_rox_cox_roq_coq(n_epo.tot, n_reg_for, ...
                obj.n_sam, 1);
            cor_coe_epo_reg_sam_blo_ani.neg = gen_var_rox_cox_roq_coq(n_epo.tot, n_reg_for, ...
                obj.n_sam, 1);
            for j = 1:n_epo.tot
                for k = 1:n_reg_for
                    for i = 1:obj.n_sam
                        sam_fil = matfile(obj.fil_pat_sam(i));
                        per_pai_epo_reg_bin_ani = sam_fil.per_pai_epo_reg_bin_ani;
                        per_pai_epo_reg_sam_bin_ani{j, k}{i} = per_pai_epo_reg_bin_ani{j, k};
                        %
                        ske_epo_reg_ani = sam_fil.ske_epo_reg_ani;
                        ske_epo_reg_sam_ani{j, k}{i} = ske_epo_reg_ani{j, k};
                        %
                        acc_epo_reg_ani = sam_fil.acc_epo_reg_ani;
                        acc_epo_reg_sam_ani{j, k}{i} = acc_epo_reg_ani{j, k};
                        %%%
                        cor_coe_epo_reg_blo_ani = sam_fil.cor_coe_epo_reg_blo_ani;
                        cor_coe_epo_reg_sam_blo_ani.all{j, k}{i} = cor_coe_epo_reg_blo_ani.all{j, k};
                        cor_coe_epo_reg_sam_blo_ani.pos{j, k}{i} = cor_coe_epo_reg_blo_ani.pos{j, k};
                        cor_coe_epo_reg_sam_blo_ani.neg{j, k}{i} = cor_coe_epo_reg_blo_ani.neg{j, k};
                    end
                end
            end
            %
            p_ske_epo_reg_xsa = com_p_var_win_con_xsa(ske_epo_reg_sam_ani);
            p_acc_epo_reg_xsa = com_p_var_win_con_xsa(acc_epo_reg_sam_ani);
            %%%
            p_epo_reg_fac.all = cal_p_epo_reg_fac(cor_coe_epo_reg_sam_blo_ani.all);
            p_epo_reg_fac.pos = cal_p_epo_reg_fac(cor_coe_epo_reg_sam_blo_ani.pos);
            p_epo_reg_fac.neg = cal_p_epo_reg_fac(cor_coe_epo_reg_sam_blo_ani.neg);
            %%%%%%%%%%%%
            cor_coe_reg_sam_blo_ani.all = gen_var_rox_cox_roq_coq(1, n_reg_for, obj.n_sam, 1);
            cor_coe_reg_sam_blo_ani.pos = gen_var_rox_cox_roq_coq(1, n_reg_for, obj.n_sam, 1);
            cor_coe_reg_sam_blo_ani.neg = gen_var_rox_cox_roq_coq(1, n_reg_for, obj.n_sam, 1);
            for k = 1:n_reg_for
                for i = 1:obj.n_sam
                    sam_fil = matfile(obj.fil_pat_sam(i));
                    cor_coe_reg_blo_ani = sam_fil.cor_coe_reg_blo_ani;
                    cor_coe_reg_sam_blo_ani.all{1, k}{i} = cor_coe_reg_blo_ani.all{1, k};
                    cor_coe_reg_sam_blo_ani.pos{1, k}{i} = cor_coe_reg_blo_ani.pos{1, k};
                    cor_coe_reg_sam_blo_ani.neg{1, k}{i} = cor_coe_reg_blo_ani.neg{1, k};
                end
            end
            %%%
            p_reg_fac.all = cal_p_epo_reg_fac(cor_coe_reg_sam_blo_ani.all);
            p_reg_fac.pos = cal_p_epo_reg_fac(cor_coe_reg_sam_blo_ani.pos);
            p_reg_fac.neg = cal_p_epo_reg_fac(cor_coe_reg_sam_blo_ani.neg);
            %%%%%%%%%%%%%%____________________
            xcc_epo_sam_blo_ani.all = gen_var_rox_cox_roq_coq(n_epo.tot, 1, obj.n_sam, 1);
            xcc_epo_sam_blo_ani.pos = gen_var_rox_cox_roq_coq(n_epo.tot, 1, obj.n_sam, 1);
            xcc_epo_sam_blo_ani.neg = gen_var_rox_cox_roq_coq(n_epo.tot, 1, obj.n_sam, 1);
            for j = 1:n_epo.tot
                for i = 1:obj.n_sam
                    sam_fil = matfile(obj.fil_pat_sam(i));
                    xcc_epo_blo_ani = sam_fil.xcc_epo_blo_ani;
                    xcc_epo_sam_blo_ani.all{j, 1}{i} = xcc_epo_blo_ani.all{j, 1};
                    xcc_epo_sam_blo_ani.pos{j, 1}{i} = xcc_epo_blo_ani.pos{j, 1};
                    xcc_epo_sam_blo_ani.neg{j, 1}{i} = xcc_epo_blo_ani.neg{j, 1};
                end
            end
            p_epo_fac.all = cal_p_epo_fac(xcc_epo_sam_blo_ani.all);
            p_epo_fac.pos = cal_p_epo_fac(xcc_epo_sam_blo_ani.pos);
            p_epo_fac.neg = cal_p_epo_fac(xcc_epo_sam_blo_ani.neg);
            %%%%%%%%%%%%%
            xcc_sam_blo_ani.all = cell(obj.n_sam, 1);
            xcc_sam_blo_ani.pos = cell(obj.n_sam, 1);
            xcc_sam_blo_ani.neg = cell(obj.n_sam, 1);
            for i = 1:obj.n_sam
                sam_fil = matfile(obj.fil_pat_sam(i));
                xcc_blo_ani = sam_fil.xcc_blo_ani;
                xcc_sam_blo_ani.all{i} = xcc_blo_ani.all;
                xcc_sam_blo_ani.pos{i} = xcc_blo_ani.pos;
                xcc_sam_blo_ani.neg{i} = xcc_blo_ani.neg;
            end
            %%%
            p_fac.all = cal_p_fac(xcc_sam_blo_ani.all);
            p_fac.pos = cal_p_fac(xcc_sam_blo_ani.pos);
            p_fac.neg = cal_p_fac(xcc_sam_blo_ani.neg);
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            per_pai_epo_xre_sam_bin_ani = gen_var_rox_cox_roq_coq(n_epo.tot, n_cro_tot, obj.n_sam, 1);
            ske_epo_xre_sam_ani = gen_var_rox_cox_roq_coq(n_epo.tot, n_cro_tot, obj.n_sam, 1);
            acc_epo_xre_sam_ani = gen_var_rox_cox_roq_coq(n_epo.tot, n_cro_tot, obj.n_sam, 1);
            p_ske_epo_xre_xsa = cell(n_epo.tot, n_cro_tot);
            p_acc_epo_xre_xsa = cell(n_epo.tot, n_cro_tot);
            dif_ske_epo_xre_sam = cell(n_epo.tot, 1);
            dif_acc_epo_xre_sam = cell(n_epo.tot, 1);
            for k = 1:n_epo.tot
                for j = 1:n_cro_tot
                    for i = 1:obj.n_sam
                        sam_fil = matfile(obj.fil_pat_sam(i));
                        per_pai_epo_xre_bin_ani = sam_fil.per_pai_epo_xre_bin_ani;
                        per_pai_epo_xre_sam_bin_ani{k, j}{i} = per_pai_epo_xre_bin_ani{k, j};
                        ske_epo_xre_ani = sam_fil.ske_epo_xre_ani;
                        ske_epo_xre_sam_ani{k, j}{i} = ske_epo_xre_ani{k, j};
                        acc_epo_xre_ani = sam_fil.acc_epo_xre_ani;
                        acc_epo_xre_sam_ani{k, j}{i} = acc_epo_xre_ani{k, j};
                    end
                    p_ske_epo_xre_xsa{k, j} = com_p_xsa(ske_epo_xre_sam_ani{k, j});
                    p_acc_epo_xre_xsa{k, j} = com_p_xsa(acc_epo_xre_sam_ani{k, j});
                end
                ske_xre_sam_ani = ext_ske_xre_sam_ani(ske_epo_xre_sam_ani, k);
                dif_ske_epo_xre_sam{k} = com_dif_ske_xre_sam(ske_xre_sam_ani, obj.ind_sam);
                acc_xre_sam_ani = ext_ske_xre_sam_ani(acc_epo_xre_sam_ani, k);
                dif_acc_epo_xre_sam{k} = com_dif_ske_xre_sam(acc_xre_sam_ani, obj.ind_sam);
            end
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            save(obj.fil_pat_mul_sam, 'n_cel_reg_sam', ...
                'fra_reg_con_sam_ani', 'p_fra_reg_con_xsa', ...
                ...
                'act_reg_sam_con_fra_cel', 'act_reg_sam_fra_sta_con', ...
                'act_reg_win_con_sam_uni', 'p_act_reg_win_con_xsa', ...
                ...
                'pcc_reg_sam_xri_xri', 'pcc_ave_reg_con_sam_ani', 'p_pcc_reg_con_xsa', ...
                'euc_dis_reg_sam_xri_xri', 'euc_dis_ave_reg_con_sam_ani', ...
                'p_euc_dis_reg_con_xsa', ...
                ...%%%%%%%%%%%%%%%%%%%%%%%
                'ofr_reg_win_sam_ani', 'p_ofr_reg_win_xsa', ...
                ...
                'per_pai_epo_reg_sam_bin_ani', ...
                'ske_epo_reg_sam_ani', 'p_ske_epo_reg_xsa', ...
                'acc_epo_reg_sam_ani', 'p_acc_epo_reg_xsa', ...
                'per_pai_epo_xre_sam_bin_ani', ...
                'ske_epo_xre_sam_ani', 'p_ske_epo_xre_xsa', 'dif_ske_epo_xre_sam', ...
                'acc_epo_xre_sam_ani', 'p_acc_epo_xre_xsa', 'dif_acc_epo_xre_sam', ...
                ...
                'cor_coe_epo_reg_sam_blo_ani', 'p_epo_reg_fac', ...
                'cor_coe_reg_sam_blo_ani', 'p_reg_fac', ...
                ...
                'xcc_epo_sam_blo_ani', 'p_epo_fac', 'xcc_sam_blo_ani', 'p_fac', ....
                '-append')
            toc


            con_fil = matfile('\\home.ansatt.ntnu.no\kadiram\Documents\MATLAB\con_esp.mat');
            n_reg_for = con_fil.n_reg_for;
            act_sam_reg_tri_win = cell(obj.n_sam, n_reg_for);
            for sam_num = 1:obj.n_sam
                sam_fil = matfile(obj.fil_pat_sam(sam_num));
                act_reg_tri_win = sam_fil.act_reg_tri_win;
                for reg = 1:n_reg_for
                    act_sam_reg_tri_win{sam_num, reg} = act_reg_tri_win{reg};
                end
            end
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            save(obj.fil_pat_mul_sam, 'act_sam_reg_tri_win', '-append')

            x_sam_cel = cell(obj.n_sam, 1);
            y_sam_cel = cell(obj.n_sam, 1);
            for sam_num = 1:obj.n_sam
                sam_fil = matfile(obj.fil_pat_sam(sam_num));
                x_sam_cel{sam_num} = sam_fil.x_cel;
                y_sam_cel{sam_num} = sam_fil.y_cel;
            end
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            save(obj.fil_pat_mul_sam, 'x_sam_cel', 'y_sam_cel', '-append')


            mul_fil = matfile(obj.fil_pat_mul_sam);
            x_sam_cel.abs = mul_fil.x_sam_cel;
            y_sam_cel.abs = mul_fil.y_sam_cel;
            x_sam_cel.rel = cell(obj.n_sam, 1);
            y_sam_cel.rel = cell(obj.n_sam, 1);
            for sam_num = 1:obj.n_sam
                sam_fil = matfile(obj.fil_pat_sam(sam_num));
                coo_cel = sam_fil.x_cel;
                x_sam_cel.rel{sam_num} = coo_cel.rel;
                coo_cel = sam_fil.y_cel;
                y_sam_cel.rel{sam_num} = coo_cel.rel;
            end
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            save(obj.fil_pat_mul_sam, 'x_sam_cel', 'y_sam_cel', '-append')

            mul_fil = matfile(obj.fil_pat_mul_sam);
            x_sam_cel = mul_fil.x_sam_cel;
            y_sam_cel = mul_fil.y_sam_cel;
            x_sam_cel.res = cell(obj.n_sam, 1);
            y_sam_cel.res = cell(obj.n_sam, 1);
            for sam_num = 1:obj.n_sam
                sam_fil = matfile(obj.fil_pat_sam(sam_num));
                coo_cel = sam_fil.x_cel;
                x_sam_cel.res{sam_num} = coo_cel.res;
                coo_cel = sam_fil.y_cel;
                y_sam_cel.res{sam_num} = coo_cel.res;
            end
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            save(obj.fil_pat_mul_sam, 'x_sam_cel', 'y_sam_cel', '-append')

            log_sam_cel_con.exc = cell(obj.n_sam, 1);
            log_sam_cel_con.inh = cell(obj.n_sam, 1);
            for sam_num = 1:obj.n_sam
                sam_fil = matfile(obj.fil_pat_sam(sam_num));
                log_cel_con = sam_fil.log_cel_con;
                log_sam_cel_con.exc{sam_num} = log_cel_con.exc;
                log_sam_cel_con.inh{sam_num} = log_cel_con.inh;
            end
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            save(obj.fil_pat_mul_sam, 'log_sam_cel_con', '-append')
        end
        %%%%%%%%%%%%%%%% unincorporated
        function app_par(obj)
            pcc_sam_blo_ani.all = cell(obj.n_sam, 1);
            pcc_sam_blo_ani.pos = cell(obj.n_sam, 1);
            pcc_sam_blo_ani.neg = cell(obj.n_sam, 1);
            for i = 1:obj.n_sam
                sam_fil = matfile(obj.fil_pat_sam(i));
                pcc_blo_ani = sam_fil.pcc_blo_ani;
                pcc_sam_blo_ani.all{i} = pcc_blo_ani.all;
                pcc_sam_blo_ani.pos{i} = pcc_blo_ani.pos;
                pcc_sam_blo_ani.neg{i} = pcc_blo_ani.neg;
            end
            p_ent_fac.all = cal_p_fac(pcc_sam_blo_ani.all);
            p_ent_fac.pos = cal_p_fac(pcc_sam_blo_ani.pos);
            p_ent_fac.neg = cal_p_fac(pcc_sam_blo_ani.neg);
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            save(obj.fil_pat_mul_sam, 'pcc_sam_blo_ani', 'p_ent_fac', '-append')
        end
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% neurobeh
        function app_neu_beh(obj)
            global n_reg_for n_win
            dff_reg_sam_fra_cel.bou.all = cell(n_reg_for, 1);
            for k = 1:n_reg_for
                dff_reg_sam_fra_cel.bou.all{k} = cell(obj.n_sam, 1);
                for i = 1:obj.n_sam
                    sam_fil = matfile(obj.fil_pat_sam(i));
                    dff_reg_fra_cel = sam_fil.dff_reg_fra_cel;
                    dff_reg_sam_fra_cel.bou.all{k}{i} = dff_reg_fra_cel.bou.all{k};
                end
            end
            %
            dff_reg_win_sam_cel.bou.all = cell(n_reg_for, 1);
            p_dff_reg_win_xsa.bou.all = cell(n_reg_for, 1);
            for l = 1:n_reg_for
                for k = 1:n_win.tri
                    for j = 1:obj.n_sam
                        sam_fil = matfile(obj.fil_pat_sam(j));
                        dff_reg_win_cel = sam_fil.dff_reg_win_cel;
                        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
                        dff_reg_win_sam_cel.bou.all{l}{k}{j} = dff_reg_win_cel.bou.all{l}{k};
                    end
                end
                p_dff_reg_win_xsa.bou.all{l} = com_p_var_win_con_xsa(dff_reg_win_sam_cel.bou.all{l});
            end
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            save(obj.fil_pat_mul_sam, 'dff_reg_sam_fra_cel', 'dff_reg_win_sam_cel', ...
                'p_dff_reg_win_xsa', '-append')


            mul_fil = matfile(obj.fil_pat_mul_sam);
            dff_reg_sam_fra_cel = mul_fil.dff_reg_sam_fra_cel;
            dff_reg_win_sam_cel = mul_fil.dff_reg_win_sam_cel;
            p_dff_reg_win_xsa = mul_fil.p_dff_reg_win_xsa;
            global n_reg_for n_win
            dff_reg_sam_fra_cel.bou.spo = cell(n_reg_for, 1);
            for k = 1:n_reg_for
                dff_reg_sam_fra_cel.bou.spo{k} = cell(obj.n_sam, 1);
                for i = 1:obj.n_sam
                    sam_fil = matfile(obj.fil_pat_sam(i));
                    dff_reg_fra_cel = sam_fil.dff_reg_fra_cel;
                    dff_reg_sam_fra_cel.bou.spo{k}{i} = dff_reg_fra_cel.bou.spo{k};
                end
            end
            %
            dff_reg_win_sam_cel.bou.spo = cell(n_reg_for, 1);
            p_dff_reg_win_xsa.bou.spo = cell(n_reg_for, 1);
            for l = 1:n_reg_for
                dff_reg_win_sam_cel.bou.spo{l} = cell(n_win.tri, 1);
                for k = 1:n_win.tri
                    for j = 1:obj.n_sam
                        sam_fil = matfile(obj.fil_pat_sam(j));
                        dff_reg_win_cel = sam_fil.dff_reg_win_cel;
                        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
                        dff_reg_win_sam_cel.bou.spo{l}{k}{j} = dff_reg_win_cel.bou.spo{l}{k};
                    end
                end
                p_dff_reg_win_xsa.bou.spo{l} = com_p_var_win_con_xsa(dff_reg_win_sam_cel.bou.spo{l});
            end
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            save(obj.fil_pat_mul_sam, 'dff_reg_sam_fra_cel', 'dff_reg_win_sam_cel', ...
                'p_dff_reg_win_xsa', '-append')
        end
        % unincorporated
        function app_par_neu_beh(obj)
            log_sam_cel.bou_spo.srt.exc = cell(obj.n_sam, 1);
            log_sam_cel.bou_spo.srt.inh = cell(obj.n_sam, 1);
            for sam_num = 1:obj.n_sam
                sam_fil = matfile(obj.fil_pat_sam(sam_num));
                log_cel = sam_fil.log_cel;
                log_sam_cel.bou_spo.srt.exc{sam_num} = log_cel.bou_spo.srt.exc;
                log_sam_cel.bou_spo.srt.inh{sam_num} = log_cel.bou_spo.srt.inh;
            end
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            save(obj.fil_pat_mul_sam, 'log_sam_cel', '-append')
        end
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% plotting
        
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% freely-moving
        function h_fig = plo_ntt_met(obj)
            mat_fil = matfile(obj.fil_pat_mul_sam);
            global tim_fra
            y_lab = 'y position (mm)';
            h_fig = plo_ntt(tim_fra.nov.ntt, mat_fil.mea_y_pos_tim_gro, ...
                mat_fil.sem_y_pos_tim_gro, mat_fil.y_pos_win_cox_sam_ani, ...
                mat_fil.p_y_pos_win, nan, ...
                nan, nan, y_lab);
        end
        function h_fig = plo_tap_fre_met(obj)
            mat_mul_sam = matfile(obj.fil_pat_mul_sam);
            h_fig = plo_tap_fre(mat_mul_sam.tim_tap_bin, mat_mul_sam.mea_dis_tap_tim_gro, ...
                mat_mul_sam.sem_dis_tap_tim_gro, mat_mul_sam.ave_dis_tap_win_cox_sam_ani, ...
                mat_mul_sam.p_dis_tap_win, mat_mul_sam.pro_tap_sam_win_row_col, ...
                mat_mul_sam.foc_tap_win_cox_sam_ani, mat_mul_sam.p_foc_tap_win);
        end
        function h_fig = plo_sig_fre_met(obj)
            mat_mul_sam = matfile(obj.fil_pat_mul_sam);
            h_fig = plo_sig_fre(mat_mul_sam.tim_tap_bin, mat_mul_sam.mea_dis_tap_tim_gro, ...
                mat_mul_sam.sem_dis_tap_tim_gro);
        end
        function h_fig = plo_dis_fre_met(obj)
            mat_mul_sam = matfile(obj.fil_pat_mul_sam);
            h_fig = plo_dis_fre(mat_mul_sam.ave_dis_tap_win_cox_sam_ani, mat_mul_sam.p_dis_tap_win);
        end
        function h_fig = plo_foc_fre_met(obj)
            mat_mul_sam = matfile(obj.fil_pat_mul_sam);
            h_fig = plo_foc_fre(mat_mul_sam.foc_tap_win_cox_sam_ani, mat_mul_sam.p_foc_tap_win);
        end
        %%%%%%%%%%%%%%%%%%%%%%%%% zan
        function h_fig = plo_y_pos_met(obj)
            mat_fil = matfile(obj.fil_pat_mul_sam);
            h_fig = plo_y_pos(mat_fil.y_pos_bas_sam_fra_ani, ...
                mat_fil.p_y_pos_bas_xsa, mat_fil.y_pos_con_sam_fra_ani, mat_fil.p_y_pos_win_con_xsa, ...
                mat_fil.bas_spe_sam_bin_ani, mat_fil.p_bas_spe_xsa, mat_fil.spe_con_sam_bin_ani, ...
                mat_fil.p_spe_win_con_xsa);
        end
        function h_fig = plo_occ_map_met(obj)
            mat_fil = matfile(obj.fil_pat_mul_sam);
            h_fig = plo_occ_map(mat_fil.pro_sam_epo_row_col, mat_fil.foc_epo_cox_sam_ani, ...
                mat_fil.p_foc_epo);
        end
        %%%%%%%%%%%%%%%%%%%%%%%%% nov
        function h_fig = plo_ses_met(obj)
            mat_fil = matfile(obj.fil_pat_mul_sam);
            y_lab = 'y position (mm)';
            h_fig = plo_ses(mat_fil.tim_fra, mat_fil.mea_y_pos_tim_gro, mat_fil.sem_y_pos_tim_gro, ...
                y_lab, mat_fil.sti_ons_tri, obj.tit_sho_sam);
        end
        function h_fig = plo_ypc_met(obj)
            mat_fil = matfile(obj.fil_pat_mul_sam);
            h_fig = plo_ypc(mat_fil.ypc_wix_con_sam_ani, mat_fil.p_ypc_wix_con_xsa);
        end
        function h_fig = plo_ypc_tog_met(obj)
            mat_fil = matfile(obj.fil_pat_mul_sam);
            y_lab = 'y position change (mm)';
            h_fig = plo_ypc_tog(mat_fil.ypc_sam_ani, mat_fil.p_ypc_xsa, obj.ind_sam, y_lab);
        end
        function h_fig = plo_y_pos_tog_met(obj)
            mat_fil = matfile(obj.fil_pat_mul_sam);
            y_lab = 'y position (mm)';
            h_fig = plo_ypc_tog(mat_fil.y_pos_sam_ani, mat_fil.p_y_pos_xsa, obj.ind_sam, y_lab);
        end
        %%%%%%%%%%%%%%%%%%%%%%%%% two
        function h_fig = plo_abs_ypc_tog_met(obj)
            mat_fil = matfile(obj.fil_pat_mul_sam);
            y_lab = 'Absolute y position change (mm)';
            h_fig = plo_ypc_tog(mat_fil.abs_ypc_sam_ani, mat_fil.p_abs_ypc_xsa, obj.ind_sam, y_lab);
        end
        function h_fig = plo_trm_met(obj)
            mat_fil = matfile(obj.fil_pat_mul_sam);
            y_lab = 'y position change (mm)';
            h_fig = plo_trm(mat_fil.ypc_sam_ani_tri, obj.tit_sam, obj.ind_sam, y_lab);
        end
        function h_fig = plo_abs_trm_met(obj)
            mat_fil = matfile(obj.fil_pat_mul_sam);
            y_lab = 'Absolute y position change (mm)';
            h_fig = plo_trm(mat_fil.abs_ypc_sam_ani_tri, obj.tit_sam, obj.ind_sam, y_lab);
        end
        function h_fig = plo_ntt_tim_met(obj)
            % timecourse
            mat_fil = matfile(obj.fil_pat_mul_sam);
            mea_y_pos_tim_gro = mat_fil.mea_y_pos_tim_gro;
            sem_y_pos_tim_gro = mat_fil.sem_y_pos_tim_gro;
            con_fil = matfile('\\home.ansatt.ntnu.no\kadiram\Documents\MATLAB\con_esp.mat');
            tim_fra = con_fil.tim_fra;
            log_fra = con_fil.log_fra;
            len_win = con_fil.len_win;
            h_fig = plo_ntt_tim(tim_fra.two.ses(log_fra.two.ntt), mea_y_pos_tim_gro...
                (log_fra.two.ntt, :), sem_y_pos_tim_gro(log_fra.two.ntt, :), len_win.ntt.sec);
        end
        function h_fig = plo_ntt_sca_met(obj)
            mat_fil = matfile(obj.fil_pat_mul_sam);
            p_y_pos_win_cox_xsa = mat_fil.p_y_pos_win_cox_xsa;
            h_fig = plo_ntt_sca(mat_fil.y_pos_win_cox_sam_ani, p_y_pos_win_cox_xsa.lme);
        end
        function h_fig = plo_ntt_sca_ear_met(obj)
            mat_fil = matfile(obj.fil_pat_mul_sam);
            p_y_pos_win_cox_xsa = mat_fil.p_y_pos_win_cox_xsa;
            h_fig = plo_ntt_sca_ear(mat_fil.y_pos_win_cox_sam_ani, p_y_pos_win_cox_xsa.lme);
        end
        function h_fig = plo_ntt_occ_met(obj)
            mat_fil = matfile(obj.fil_pat_mul_sam);
            h_fig = plo_ntt_occ(mat_fil.pro_win_sam_row_col, mat_fil.foc_win_cox_sam_ani, ...
                mat_fil.p_foc_win_cox_xsa);
        end
        function h_fig = plo_ntt_occ_hea_met(obj)
            mat_fil = matfile(obj.fil_pat_mul_sam);
            h_fig = plo_ntt_occ_hea(mat_fil.pro_win_sam_row_col);
        end
        function h_fig = plo_ntt_occ_sca_met(obj)
            mat_fil = matfile(obj.fil_pat_mul_sam);
            h_fig = plo_ntt_occ_sca(mat_fil.foc_win_cox_sam_ani, mat_fil.p_foc_win_cox_xsa);
        end
        function h_fig = plo_spe_sca_met(obj)%vib
            mat_fil = matfile(obj.fil_pat_mul_sam);
            p_spx_win_cox_xsa = mat_fil.p_spx_win_cox_xsa;
            h_fig = plo_spe_sca(mat_fil.spx_win_cox_sam_ani, p_spx_win_cox_xsa);
        end
        function h_fig = plo_bas_spe_met(obj)
            mat_fil = matfile(obj.fil_pat_mul_sam);
            p_spe_win_cox_xsa = mat_fil.p_spe_win_cox_xsa;% ind_win = 2; after the novelty effect
            h_fig = plo_bas_spe(mat_fil.spe_win_cox_sam_ani, p_spe_win_cox_xsa.lme);
        end
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% behavioral
        function h_fig = plo_abs_met(obj)
            mat_mul_sam = matfile(obj.fil_pat_mul_sam);
            h_fig = plo_abs({mat_mul_sam.abs_sam_ani}, obj.tit_sam_cha, obj.n_sam, ...
                mat_mul_sam.p_abs_cro, obj.ind_sam);
        end
        %
        function plo_ave_ang_xep_met(obj)
            mat_mul_sam = matfile(obj.fil_pat_mul_sam);
            plo_ave_ang_xep(mat_mul_sam.ave_ang_epo_sam_ani, obj.tit_n_sam, obj.n_sam, ...
                mat_mul_sam.p_ave_ang_sam_xep, obj.ind_sam, obj.col_sam)
        end
        function plo_ave_ang_xsa_met(obj)
            mat_fil_mul_sam = matfile(obj.fil_pat_mul_sam);
            nta_sam_fra_sta_con = mat_fil_mul_sam.nta_sam_fra_sta_con;
            %
            %global y_lab_nta log_fra
            global y_lab_nta tim_fra win_len
            log_fra = tim_fra.ani.tri > -win_len.tai.sec & tim_fra.ani.tri < 15;
            %
            mat_fil_obj_raw = matfile("X:\kadiram\Data\Raw\esp090\tap.mat");
            n_con = mat_fil_obj_raw.n_con;
            %
            p_nta_win_con_xsa = mat_fil_mul_sam.p_nta_win_con_xsa;
            h_fig = plo_ave_ang_xsa(nta_sam_fra_sta_con, y_lab_nta, obj.n_sam, n_con, ...
                p_nta_win_con_xsa, obj.ind_sam, obj.col_sam_con, log_fra);
        end
        %
        function plo_nta_num_met(obj)
            mat_fil_obj_pro = matfile("X:\kadiram\Data\Processed\esp090\tap.mat");
            tim_tri_uni_fra = mat_fil_obj_pro.tim_tri_uni_fra;
            %
            mat_fil_obj_mul_sam = matfile(obj.fil_pat_mul_sam);
            nta_sam_fra_sta_con = mat_fil_obj_mul_sam.nta_sam_fra_sta_con;
            %
            col_tai_sig_con = ["red"; "black"; "blue"];
            fon_siz = 20;
            col_sti_cro = 'green';
            global con_int
            global y_lab_nta
            global y_lab_ave_nor_ang
            %
            mat_fil_obj_raw = matfile("X:\kadiram\Data\Raw\esp090\tap.mat");
            n_con = mat_fil_obj_raw.n_con;
            %
            nta_sam_con_ani_win = mat_fil_obj_mul_sam.nta_sam_con_ani_win;
            p_nta_win_con_cro = mat_fil_obj_mul_sam.p_nta_win_con_cro;
            global dur_tai
            pri = false;
            tit = 'Tail angle comparison across the groups';
            pre = true;
            ton = false;
            plo_nta_num(fon_siz, obj.n_sam, n_con, nta_sam_con_ani_win, y_lab_ave_nor_ang)
        end% animal number, for debugging
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        function plo_tai_wit_met(obj)% probability, latency
            mat_mul_sam = matfile(obj.fil_pat_mul_sam);
            p_lat_sam_cro = mat_mul_sam.p_lat_sam_cro;
            per_pro_shu_sam_ani = mat_mul_sam.per_pro_shu_sam_ani;
            p_sam_cro = mat_mul_sam.p_sam_cro;
            pre = true;
            plo_tai_wit(mat_mul_sam.bea_lat_sam_ani_tri, mat_mul_sam.lat_win_con_sam_ani, ...
                obj.tit_sam, obj.n_sam, ...
                p_lat_sam_cro, mat_mul_sam.pro_win_con_sam_ani, per_pro_shu_sam_ani, p_sam_cro, ...
                pre, obj.log_tai_sam_ani, obj.ind_sam, obj.col_sam_con)
        end
        function plo_tai_cro_met(obj)
            mat_mul_sam = matfile(obj.fil_pat_mul_sam);
            bea_lat_sam_ani_tri = mat_mul_sam.bea_lat_sam_ani_tri;
            pre = true;
            plo_tai_cro(bea_lat_sam_ani_tri, mat_mul_sam.lat_win_con_sam_ani, ...
                obj.tit_sho_sam, obj.n_sam, mat_mul_sam.p_lat_win_con_xsa, ...
                mat_mul_sam.pro_win_con_sam_ani, obj.ind_sam, ...
                mat_mul_sam.p_pro_win_con_xsa, pre, obj.log_tai_sam_ani, obj.col_sam_con)
        end
        %
        function plo_bea_ang_met(obj)
            mat_mul_sam = matfile(obj.fil_pat_mul_sam);
            bea_ang_sam_ani_tri = mat_mul_sam.bea_ang_sam_ani_tri;
            bea_ang_sam_ani_con = mat_mul_sam.bea_ang_sam_ani_con;
            p_ang_sam_cro = mat_mul_sam.p_ang_sam_cro;
            p_ang_con_cro = mat_mul_sam.p_ang_con_cro;
            global y_lab_ang
            plo_beh_mod(bea_ang_sam_ani_tri, bea_ang_sam_ani_con, obj.tit_sam, ...
                obj.n_ani_sam, obj.n_sam, p_ang_sam_cro, p_ang_con_cro, y_lab_ang)
        end
        function plo_tai_rat_spo_met(obj)
            dru_ons = [];
            mat_fil_obj_raw = matfile("X:\kadiram\Data\Raw\esp090\tap.mat");
            sti_ons = mat_fil_obj_raw.sti_ons;
            sta_tim = mat_fil_obj_raw.sta_tim;
            end_tim = mat_fil_obj_raw.end_tim;
            n_tri_con = mat_fil_obj_raw.n_tri_con;
            mat_fil_obj_pro = matfile("X:\kadiram\Data\Processed\esp090\tap.mat");
            tim_bin = mat_fil_obj_pro.tim_bin;
            mat_fil_obj_mul_sam = matfile(obj.fil_pat_mul_sam);
            ave_rat_sam_win_ani_par = mat_fil_obj_mul_sam.ave_rat_sam_win_ani_par;
            p_sam_com_par = mat_fil_obj_mul_sam.p_sam_com_par;
            num_par = 1;
            rat_ave_sam_bin_par = mat_fil_obj_mul_sam.rat_ave_sam_bin_par;
            rat_sem_sam_bin_par = mat_fil_obj_mul_sam.rat_sem_sam_bin_par;
            plo_rat_spo(dru_ons, sti_ons, sta_tim, end_tim, n_tri_con, tim_bin, ...
                ave_rat_sam_win_ani_par, p_sam_com_par, num_par, rat_ave_sam_bin_par, ...
                rat_sem_sam_bin_par, obj.tit_sam, obj.n_ani_sam)
        end
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% paper
        function h_fig = plo_tac_met(obj)
            mat_fil_obj_pro = matfile("X:\kadiram\Data\Processed\esp090\tap.mat");
            tim_tri_uni_fra = mat_fil_obj_pro.tim_tri_uni_fra;
            %
            mat_fil_mul_sam = matfile(obj.fil_pat_mul_sam);
            nta_sam_fra_sta_con = mat_fil_mul_sam.nta_sam_fra_sta_con;
            %
            global fon_siz y_lab_nta y_lab_ave_nor_ang dur_tai
            %
            mat_fil_obj_raw = matfile("X:\kadiram\Data\Raw\esp090\tap.mat");
            n_con = mat_fil_obj_raw.n_con;
            %
            pri = false;
            pre = true;
            p_nta_win_con_xsa = mat_fil_mul_sam.p_nta_win_con_xsa;
            h_fig = plo_tac(tim_tri_uni_fra, nta_sam_fra_sta_con, fon_siz, ...
                y_lab_nta, obj.n_sam, n_con, obj.tit_sho_sam_cha, ...
                mat_fil_mul_sam.nta_win_con_sam_ani, ...
                p_nta_win_con_xsa.lme, ...
                dur_tai, pri, obj.ind_sam, y_lab_ave_nor_ang, pre, obj.col_sam_con, ...
                mat_fil_mul_sam.p_nta_sam_win_xco);
        end
        function h_fig = plo_tai_met(obj)
            mat_mul_sam = matfile(obj.fil_pat_mul_sam);
            p_lat_sam_cro = mat_mul_sam.p_lat_sam_cro;
            per_pro_shu_sam_ani = mat_mul_sam.per_pro_shu_sam_ani;
            p_sam_cro = mat_mul_sam.p_sam_cro;
            h_fig = plo_tai(mat_mul_sam.bea_lat_sam_ani_tri, mat_mul_sam.lat_win_con_sam_ani, ...
                obj.tit_sam_cha, obj.n_sam, ...
                p_lat_sam_cro, mat_mul_sam.pro_win_con_sam_ani, per_pro_shu_sam_ani, p_sam_cro, ...
                obj.tit_sho_sam_cha, obj.log_tai_sam_ani, obj.ind_sam, obj.col_sam_con, ...
                mat_mul_sam.p_pro_win_con_xsa, mat_mul_sam.p_lat_win_con_xsa);
        end
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% neural
        
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% evoked
        function h_fig = plo_neu_met(obj)
            global n_con col_sca_ste
            cal_ima_ref_sam_row_col_con = cell(obj.n_sam, 1);
            dff_bou_sam_row_col = cell(obj.n_sam, 1);
            dff_sam_con_row_col = cell(obj.n_sam, n_con);
            fac_met_sam = nan(obj.n_sam, 1);
            for i = 1:obj.n_sam
                sam_fun_i = str2func(['sam_fun.' convertStringsToChars(strcat(obj.sam(i), ...
                    "_fun"))]);
                sam_obj = sam_fun_i();
                rec_fun_i = str2func(['rec_fun.' ...
                    convertStringsToChars(sam_obj.ani(obj.ani_ind_sam(i)))]);
                sti = rec_fun_i();
                %
                load(sti.fil_pat_rec, 'cal_ima_ref_con', ...
                    'dff_ave_spo_bou_row_col', 'dff_con_row_col', 'factor_meter')
                cal_ima_ref_sam_row_col_con{i} = cal_ima_ref_con;
                dff_bou_sam_row_col{i} = dff_ave_spo_bou_row_col;
                for j = 1:n_con
                    dff_sam_con_row_col{i, j} = dff_con_row_col{j};
                end
                fac_met_sam(i) = factor_meter;
            end
            col_map = 'jet';
            hax_sub = [];
            las = true;
            [h_fig, wid_mon, hei_mon] = fig;
            [hax_sub, pos_axe, las_pix, rat_wid] = plo_neu_sin...
                (cal_ima_ref_sam_row_col_con(obj.ind_sam), ...
                dff_bou_sam_row_col(obj.ind_sam), ...
                dff_sam_con_row_col(obj.ind_sam, :), obj.tit_sam_cha(obj.ind_sam), ...
                col_sca_ste, col_map, hax_sub, las, wid_mon, fac_met_sam);
            h_fig = opt_h_fig(h_fig, las_pix, rat_wid);
        end% single animal responses
        function h_fig = plo_ras_map_met(obj, reg_num, epo_num)
            con_fil = matfile('\\home.ansatt.ntnu.no\kadiram\Documents\MATLAB\con_esp.mat');
            for i = 1
                sam_fun_i = str2func(['sam_fun.' convertStringsToChars(strcat(obj.sam(i), ...
                    "_fun"))]);
                sam_obj = sam_fun_i();
                rec_fun_i = str2func(['rec_fun.' ...
                    convertStringsToChars(sam_obj.ani(obj.ani_ind_sam(i)))]);
                sti = rec_fun_i();
                %
                load(sti.fil_pat_rec, 'n_cel_reg')
            end
            [h_fig, fig_wid, fig_hei] = fig;
            n_row = 2;
            n_col = 2;
            gap_ver_row = 0.010*ones(n_row, 1);
            gap_hor_row_col = 0.005*ones(n_row, n_col);
            mar_bot = 0.001;
            mar_top = 0.001;
            mar_lef = 0.001;
            mar_rig = 0.001;
            asp_rat_axe([1 3]) = 1;
            epo_num_con = 1;
            asp_rat_axe(2) = con_fil.n_fra_epo(epo_num_con, 1)/n_cel_reg.raw(reg_num);
            for i = 2
                sam_fun_i = str2func(['sam_fun.' convertStringsToChars(strcat(obj.sam(i), ...
                    "_fun"))]);
                sam_obj = sam_fun_i();
                rec_fun_i = str2func(['rec_fun.' ...
                    convertStringsToChars(sam_obj.ani(obj.ani_ind_sam(i)))]);
                sti = rec_fun_i();
                %
                load(sti.fil_pat_rec, 'n_cel_reg')
            end
            asp_rat_axe(4) = con_fil.n_fra_epo(epo_num_con, 1)/n_cel_reg.raw(reg_num);
            wid = true;
            if epo_num == 1
                %sca.map = 0.5;
                sca.map = 1.5;
            else
                sca.map = 1.5;
            end
            sca_axe = [0.030 sca.map 0.030 sca.map];
            n_pix_ext = 33;
            [hax_sub, pos_axe, hei_axe, dis_asp_rat, las_pix, rat_wid] = tight_subplot_gen(n_row, ...
                n_col, gap_ver_row, gap_hor_row_col, mar_bot, mar_top, mar_lef, mar_rig, ...
                asp_rat_axe, fig_wid, fig_hei, wid, sca_axe, n_pix_ext);
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            for i = 1
                sam_fun_i = str2func(['sam_fun.' convertStringsToChars(strcat(obj.sam(i), ...
                    "_fun"))]);
                sam_obj = sam_fun_i();
                rec_fun_i = str2func(['rec_fun.' ...
                    convertStringsToChars(sam_obj.ani(obj.ani_ind_sam(i)))]);
                sti = rec_fun_i();
                %
                load(sti.fil_pat_rec, 'isort1', 'iclustup1', 'traces', 'log_cel_reg', 'n_cel_reg')
                sorted_idx=sort(iclustup1); %sort the cluster index for colorbar
                max_idx=max(iclustup1); %finding the max cluster index for colorbar
                sorted_traces = traces(isort1, :);
                sorted_log_cel_reg = log_cel_reg.raw(isort1, :);
                ind_cel = find(sorted_log_cel_reg(:, reg_num));
            end
            hax = hax_sub(1);
            imagesc(hax, sorted_idx(ind_cel))
            set(hax,'xtick',[],'ytick',[],'ztick',[])
            colormap(hax,'jet')
            caxis(hax, [1 max_idx])
            %
            hax = hax_sub(2);
            tim_epo_fra = con_fil.tim_epo_fra;

            tim_fra = con_fil.tim_fra;
            log_fra = con_fil.log_fra;
            epo_con_num = con_fil.epo_num;
            tpx_fra = tim_fra.cal.one.ses(log_fra.cal.one.ses);
            log_poi = tpx_fra > 60*epo_con_num{epo_num}(1) & tpx_fra < 60*epo_con_num{epo_num}(2);

            ima(hax, tim_epo_fra{epo_num}, sorted_traces(ind_cel, log_poi));
            caxis(hax, [-10 20]);
            colormap (hax, 'jet');
            set(hax, 'ytick', [], 'xtick', [])
            %%%%%%%%%%%%
            for i = 2
                sam_fun_i = str2func(['sam_fun.' convertStringsToChars(strcat(obj.sam(i), ...
                    "_fun"))]);
                sam_obj = sam_fun_i();
                rec_fun_i = str2func(['rec_fun.' ...
                    convertStringsToChars(sam_obj.ani(obj.ani_ind_sam(i)))]);
                sti = rec_fun_i();
                %
                load(sti.fil_pat_rec, 'isort1', 'iclustup1', 'traces', 'log_cel_reg', 'n_cel_reg')
                sorted_idx=sort(iclustup1); %sort the cluster index for colorbar
                max_idx=max(iclustup1); %finding the max cluster index for colorbar
                sorted_traces = traces(isort1, :);
                sorted_log_cel_reg = log_cel_reg.raw(isort1, :);
                ind_cel = find(sorted_log_cel_reg(:, reg_num));
            end
            hax = hax_sub(3);
            imagesc(hax, sorted_idx(ind_cel))
            set(hax,'xtick',[],'ytick',[],'ztick',[])
            colormap(hax,'jet')
            caxis(hax, [1 max_idx])
            %
            hax = hax_sub(4);
            tim_epo_fra = con_fil.tim_epo_fra;
            ima(hax, tim_epo_fra{epo_num}, sorted_traces(ind_cel, log_poi));
            caxis(hax, [-10 20]);
            colormap (hax, 'jet');
            set(hax, 'ytick', [])
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            if reg_num == 8
                xlabel(hax, 'Time (s)');
            else
                set(hax, 'xtick', [])
            end
            h_fig = opt_h_fig(h_fig, las_pix, rat_wid);
        end% single animal responses
        %
        function h_fig = plo_inh_exc_met(obj)
            mat_fil = matfile(obj.fil_pat_mul_sam);
            fie_num = {'dff'; 'raw'; 'tri'};
            h_fig = plo_inh_exc(getfield(mat_fil.fra_reg_con_sam_ani, fie_num{:}), ...
                getfield(mat_fil.p_fra_reg_con_xsa, fie_num{:}), ...
                obj.ind_sam, obj.tit_sup_sho_sam_cha);
        end%fra_cel
        function h_fig = plo_inh_exc_hig_met(obj)
            mat_fil = matfile(obj.fil_pat_mul_sam);
            fie_num = {'dff'; 'raw'; 'tri'};
            h_fig = plo_inh_exc_hig(getfield(mat_fil.fra_reg_con_sam_ani, fie_num{:}), ...
                getfield(mat_fil.p_fra_reg_con_xsa, fie_num{:}), ...
                obj.ind_sam, obj.tit_sup_sho_sam_cha);
        end
        function h_fig = plo_evo_vis_all_met(obj)
            mul_fil = matfile(obj.fil_pat_mul_sam);
            fie_num = {'dff'; 'raw'; 'tri'; 'all'};
            h_fig = plo_evo_vis_all(mul_fil.act_reg_sam_fra_sta_con, mul_fil.p_act_reg_win_con_xsa, ...
                fie_num);
        end% all regions
        function h_fig = plo_hig_com_met(obj)
            mul_fil = matfile(obj.fil_pat_mul_sam);
            fie_num = {'dff'; 'raw'; 'tri'; 'all'};
            h_fig = plo_hig_com.sho(mul_fil.act_reg_sam_fra_sta_con, mul_fil.p_act_reg_win_con_xsa, ...
                fie_num);
        end
        function h_fig = plo_hig_com_lon_met(obj)
            mul_fil = matfile(obj.fil_pat_mul_sam);
            fie_num = {'dff'; 'raw'; 'tri'; 'all'};
            h_fig = plo_hig_com.lon(mul_fil.act_reg_sam_fra_sta_con, mul_fil.p_act_reg_win_con_xsa, ...
                fie_num);
        end
        %
        function h_fig = plo_evo_xsa_met(obj, fie_num)
            mat_fil = matfile(obj.fil_pat_mul_sam);
            p_act_reg_win_con_xsa = mat_fil.p_act_reg_win_con_xsa;
            n_cel_reg_sam = mat_fil.n_cel_reg_sam;
            global y_lab_ave_dff y_lab_ave_nor_fir
            if strcmp(fie_num{1}, 'dff')
                y_lab = y_lab_ave_dff;
            else
                y_lab = y_lab_ave_nor_fir;
            end
            if strcmp(fie_num{end}, 'cel')
                dat = false;
            else
                dat = true;
            end
            h_fig = plo_evo_xsa(getfield(mat_fil.act_reg_win_con_sam_uni, fie_num{:}), y_lab, ...
                getfield(p_act_reg_win_con_xsa, fie_num{:}), obj.n_ani_bri_sam, ...
                n_cel_reg_sam.rem, obj.ind_sam, obj.tit_sho_sam_cha, dat);
        end
        function h_fig = plo_res_met(obj)
            mat_fil = matfile(obj.fil_pat_mul_sam);
            x_sam_cel = mat_fil.x_sam_cel;
            y_sam_cel = mat_fil.y_sam_cel;
            act_reg_win_con_sam_uni = mat_fil.act_reg_win_con_sam_uni;
            act_reg_win_con_sam_uni = act_reg_win_con_sam_uni.dff.raw.tri.cel;
            h_fig = plo_res(x_sam_cel.res, y_sam_cel.res, act_reg_win_con_sam_uni);
        end
        function h_fig = plo_spa_den_bou_spo_met(obj)
            mat_fil = matfile(obj.fil_pat_mul_sam);
            x_sam_cel = mat_fil.x_sam_cel;
            y_sam_cel = mat_fil.y_sam_cel;
            log_sam_cel = mat_fil.log_sam_cel;
            h_fig = plo_spa_den(x_sam_cel.res, y_sam_cel.res, log_sam_cel.bou_spo.srt);
        end
        function h_fig = plo_spa_den_met(obj)
            mat_fil = matfile(obj.fil_pat_mul_sam);
            x_sam_cel = mat_fil.x_sam_cel;
            y_sam_cel = mat_fil.y_sam_cel;
            log_sam_cel_con = mat_fil.log_sam_cel_con;
            h_fig = plo_spa_den(x_sam_cel.res, y_sam_cel.res, log_sam_cel_con);
        end
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% ong
        function plo_ofr_xsa_met(obj)
            mat_fil = matfile(obj.fil_pat_mul_sam);
            y_lab = 'OFR (s^{-1})';
            plo_ofr_xsa(mat_fil.ofr_reg_win_sam_ani, y_lab, mat_fil.p_ofr_reg_win_xsa, ...
                obj.n_ani_bri_sam, obj.ind_sam, obj.tit_sam, obj.col_sam)
        end
        % corr dis
        function h_fig = plo_cor_dis_met(obj)
            mat_fil = matfile(obj.fil_pat_mul_sam);
            h_fig = plo_cor_dis(mat_fil.cor_coe_epo_reg_sam_blo_ani, mat_fil.p_epo_reg_fac);
        end
        function h_fig = plo_cor_dis_epo_met(obj, epo_num)
            mat_fil = matfile(obj.fil_pat_mul_sam);
            h_fig = plo_cor_dis_epo(mat_fil.cor_coe_epo_reg_sam_blo_ani, mat_fil.p_epo_reg_fac, ...
                epo_num);
        end
        function h_fig = plo_cor_dis_ent_met(obj)
            mat_fil = matfile(obj.fil_pat_mul_sam);
            pcc_sam_blo_ani = mat_fil.pcc_sam_blo_ani;
            p_ent_fac = mat_fil.p_ent_fac;
            h_fig = plo_cor_dis_ent(pcc_sam_blo_ani, p_ent_fac);
        end
        function h_fig = plo_ave_cor_dis_met(obj)%?
            mat_fil = matfile(obj.fil_pat_mul_sam);
            h_fig = plo_ave_cor_dis(mat_fil.cor_coe_reg_sam_blo_ani, mat_fil.p_reg_fac);
        end
        function h_fig = plo_ave_xcc_dis_met(obj)
            mat_fil = matfile(obj.fil_pat_mul_sam);
            h_fig = plo_ave_xcc_dis(mat_fil.xcc_sam_blo_ani, mat_fil.p_fac);
        end
        %%%%%%%%%%% corr his
        function h_fig = plo_cor_xsa_met(obj, epo_num)
            mat_fil = matfile(obj.fil_pat_mul_sam);
            h_fig = plo_cor_xsa(mat_fil.per_pai_epo_reg_sam_bin_ani, mat_fil.ske_epo_reg_sam_ani, ...
                mat_fil.p_ske_epo_reg_xsa, mat_fil.acc_epo_reg_sam_ani, ...
                mat_fil.p_acc_epo_reg_xsa, obj.ind_sam, obj.col_sam, obj.tit_sho_sam_cha, epo_num);
        end
        function h_fig = plo_abs_cor_xsa_met(obj, epo_num)
            mat_fil = matfile(obj.fil_pat_mul_sam);
            con_fil = matfile('\\home.ansatt.ntnu.no\kadiram\Documents\MATLAB\con_esp.mat');
            col_sam = con_fil.col_sam;
            h_fig = plo_abs_cor_xsa(mat_fil.acc_epo_reg_sam_ani, ...
                mat_fil.p_acc_epo_reg_xsa, obj.ind_sam, col_sam, obj.tit_sup_sho_sam_cha, epo_num);
        end
        function plo_cro_cor_xsa_met(obj)
            mat_fil = matfile(obj.fil_pat_mul_sam);
            global y_lab_ave_nor_fir
            plo_cro_cor_xsa(mat_fil.per_pai_xre_sam_bin_mag_ani, mat_fil.ske_xre_sam_ani, ...
                y_lab_ave_nor_fir, mat_fil.p_ske_xre_xsa)
        end
        %%% diagram
        function plo_dia_met(obj)
            mat_fil = matfile(obj.fil_pat_mul_sam);
            sig = false;
            plo_dia(mat_fil.dif_ske_xre_sam, obj.tit_n_bri_sam, mat_fil.p_ske_xre_tot_xsa, ...
                sig, obj.ind_sam)
        end
        function plo_dia_sig_met(obj)
            mat_fil = matfile(obj.fil_pat_mul_sam);
            sig = true;
            plo_dia(mat_fil.dif_ske_xre_sam, obj.tit_n_bri_sam, mat_fil.p_ske_xre_tot_xsa, ...
                sig, obj.ind_sam)
        end
        %
        function plo_dia_mag_met(obj)
            mat_fil = matfile(obj.fil_pat_mul_sam);
            sig = false;
            plo_dia(mat_fil.dif_mag_cor_coe_xre_sam, obj.tit_n_bri_sam, ...
                mat_fil.p_mag_cor_coe_xre_xsa, sig, obj.ind_sam)
        end
        function plo_dia_mag_sig_met(obj)
            mat_fil = matfile(obj.fil_pat_mul_sam);
            sig = true;
            plo_dia(mat_fil.dif_mag_cor_coe_xre_sam, obj.tit_n_bri_sam, ...
                mat_fil.p_mag_cor_coe_xre_xsa, sig, obj.ind_sam)
        end
        %
        function h_fig = plo_dia_com_met(obj)
            mat_fil = matfile(obj.fil_pat_mul_sam);
            h_fig = plo_dia_com(mat_fil.dif_ske_xre_sam, obj.tit_n_bri_sam, ...
                mat_fil.p_ske_xre_tot_xsa, mat_fil.dif_mag_cor_coe_xre_sam, ...
                mat_fil.p_mag_cor_coe_xre_xsa);
        end
        function h_fig = plo_dia_all_met(obj)
            mat_fil = matfile(obj.fil_pat_mul_sam);
            h_fig = plo_dia_all(mat_fil.dif_ske_epo_xre_sam, obj.tit_n_bri_sam, ...
                mat_fil.p_ske_epo_xre_xsa, mat_fil.dif_acc_epo_xre_sam, ...
                mat_fil.p_acc_epo_xre_xsa);
        end
        %
        function h_fig = plo_dia_acc_met(obj, epo_num)
            mat_fil = matfile(obj.fil_pat_mul_sam);
            h_fig = plo_dia_acc(mat_fil.dif_acc_epo_xre_sam, mat_fil.p_acc_epo_xre_xsa, epo_num);
        end
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% neurobehavioral
        function h_fig = plo_act_tac_met(obj, fie_num)
            mat_fil = matfile(obj.fil_pat_mul_sam);
            act_reg_win_con_sam_uni = mat_fil.act_reg_win_con_sam_uni;
            nta_win_con_sam_ani = mat_fil.nta_win_con_sam_ani;% non-tai treated nan, similar for neuro
            h_fig = plo_neu_beh(nta_win_con_sam_ani, getfield(act_reg_win_con_sam_uni, fie_num{:}), ...
                obj.ind_sam);
        end
        function h_fig = plo_act_tac_tri_met(obj)
            mat_fil = matfile(obj.fil_pat_mul_sam);
            tac_sam_tri_win = mat_fil.tac_sam_tri_win;
            global y_lab_ave_nor_ang y_lab_ave_dff
            x_lab = y_lab_ave_nor_ang;
            y_lab = y_lab_ave_dff;
            act_sam_reg_tri_win = mat_fil.act_sam_reg_tri_win;
            h_fig = plo_neu_beh_tri(tac_sam_tri_win, act_sam_reg_tri_win, x_lab, y_lab, obj.ind_sam);
        end
        function h_fig = plo_tai_tri_com_met(obj)
            mul_fil = matfile(obj.fil_pat_mul_sam);
            dff_reg_sam_fra_cel = mul_fil.dff_reg_sam_fra_cel;
            p_dff_reg_win_xsa = mul_fil.p_dff_reg_win_xsa;
            h_fig = plo_hig_com.sho_sim(dff_reg_sam_fra_cel.bou.all, p_dff_reg_win_xsa.bou.all);
        end
        function h_fig = plo_tai_tri_com_spo_met(obj)
            mul_fil = matfile(obj.fil_pat_mul_sam);
            dff_reg_sam_fra_cel = mul_fil.dff_reg_sam_fra_cel;
            p_dff_reg_win_xsa = mul_fil.p_dff_reg_win_xsa;
            h_fig = plo_hig_com.sho_sim(dff_reg_sam_fra_cel.bou.spo, p_dff_reg_win_xsa.bou.spo);
            %h_fig = plo_hig_com.sho_sim_raw(dff_reg_sam_fra_cel.bou.spo, p_dff_reg_win_xsa.bou.spo);
        end
        function h_fig = plo_evo_xsa_tai_met(obj, fie_num)
            mat_fil = matfile(obj.fil_pat_mul_sam);
            dff_reg_win_sam_cel = mat_fil.dff_reg_win_sam_cel;
            p_dff_reg_win_xsa = mat_fil.p_dff_reg_win_xsa;
            global y_lab_ave_dff
            y_lab = y_lab_ave_dff;
            if strcmp(fie_num{end}, 'cel')
                dat = false;
            else
                dat = true;
            end
            dff_reg_win_sam_cel = getfield(dff_reg_win_sam_cel, fie_num{:});
            p_dff_reg_win_xsa = getfield(p_dff_reg_win_xsa, fie_num{:});
            h_fig = plo_evo_xsa.one(dff_reg_win_sam_cel, y_lab, p_dff_reg_win_xsa, obj.ind_sam, ...
                obj.tit_sho_sam_cha, dat);
        end
        function h_fig = plo_tai_tri_com_spo_lon_met(obj)
            mul_fil = matfile(obj.fil_pat_mul_sam);
            dff_reg_sam_fra_cel = mul_fil.dff_reg_sam_fra_cel;
            p_dff_reg_win_xsa = mul_fil.p_dff_reg_win_xsa;
            h_fig = plo_hig_com.lon_sim(dff_reg_sam_fra_cel.bou.spo, p_dff_reg_win_xsa.bou.spo);
        end
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% figures
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% freely moving
        function sav_fig_ntt(obj)
            h_fig = plo_ntt_met(obj);
            fil_pat = char(obj.fil_pat_fig_ntt);
            export_fig(fil_pat)
            saveas(h_fig, fil_pat(1:end - 4), 'pdf')
        end
        function sav_fig_tap_fre(obj)
            h_fig = plo_tap_fre_met(obj);
            fil_pat = char(obj.fil_pat_fig_tap_fre);
            exp_fig(h_fig, fil_pat)
        end
        function sav_fig_sig_fre(obj)
            h_fig = plo_sig_fre_met(obj);
            exp_fig(h_fig, [char(obj.poo_dir) '\sig_fre.png'])
        end
        function sav_fig_dis_fre(obj)
            h_fig = plo_dis_fre_met(obj);
            exp_fig(h_fig, [char(obj.poo_dir) '\dis_fre.png'])
        end
        function sav_fig_foc_fre(obj)
            h_fig = plo_foc_fre_met(obj);
            exp_fig(h_fig, [char(obj.poo_dir) '\foc_fre.png'])
        end
        % zan
        function sav_fig_y_pos(obj)
            h_fig = plo_y_pos_met(obj);
            fil_pat = char(obj.fil_pat_fig_y_pos);
            exp_fig(h_fig, fil_pat)
        end
        function sav_fig_occ_map(obj)
            h_fig = plo_occ_map_met(obj);
            fil_pat = char(obj.fil_pat_fig_occ_map);
            exp_fig(h_fig, fil_pat)
        end
        % nov - ann
        function sav_fig_ses(obj)
            h_fig = plo_ses_met(obj);
            fil_pat = char(obj.fil_pat_fig_ses);
            exp_fig(h_fig, fil_pat)
        end
        function sav_fig_occ_map_ann(obj)
            mat_fil = matfile("X:\kadiram\Data\Pooled\nov\Tph2_NT_Vibration_2022_data.mat");
            h_fig = AO_ploting_noveltank_heatmaps_over_fish(mat_fil.all_fish, mat_fil.group1, ...
                mat_fil.name_group1);
            fil_pat = char(obj.fil_pat_fig_occ_map_ann_abl);
            exp_fig(h_fig, fil_pat)
            h_fig = AO_ploting_noveltank_heatmaps_over_fish(mat_fil.all_fish, mat_fil.group2, ...
                mat_fil.name_group2);
            fil_pat = char(obj.fil_pat_fig_occ_map_ann_con);
            exp_fig(h_fig, fil_pat)
        end
        function sav_fig_ypc(obj)
            h_fig = plo_ypc_met(obj);
            fil_pat = char(obj.fil_pat_fig_ypc);
            exp_fig(h_fig, fil_pat)
        end
        function sav_fig_ypc_tog(obj)
            h_fig = plo_ypc_tog_met(obj);
            fil_pat = char(obj.fil_pat_fig_ypc_tog);
            exp_fig(h_fig, fil_pat)
        end
        function sav_fig_y_pos_tog(obj)
            h_fig = plo_y_pos_tog_met(obj);
            fil_pat = char(obj.fil_pat_fig_y_pos_tog);
            exp_fig(h_fig, fil_pat)
        end
        % two
        function sav_fig_trm(obj)
            h_fig = plo_trm_met(obj);
            fil_pat = char(obj.fil_pat_fig_trm);
            exp_fig(h_fig, fil_pat)
        end
        function sav_fig_abs_ypc_trm(obj)
            h_fig = plo_abs_ypc_tog_met(obj);
            fil_pat = char(obj.fil_pat_fig_abs_ypc_tog);
            exp_fig(h_fig, fil_pat)
            h_fig = plo_abs_trm_met(obj);
            fil_pat = char(obj.fil_pat_fig_abs_trm);
            exp_fig(h_fig, fil_pat)
        end
        function sav_fig_ntt_tim(obj)
            h_fig = plo_ntt_tim_met(obj);
            fil_pat = char(obj.fil_pat_fig_ntt_tim);
            exp_fig(h_fig, fil_pat)
        end
        function sav_fig_ntt_sca(obj)
            h_fig = plo_ntt_sca_met(obj);
            fil_pat = char(obj.fil_pat_fig_ntt_sca);
            exp_fig(h_fig, fil_pat)
        end
        function sav_fig_ntt_sca_ear(obj)
            h_fig = plo_ntt_sca_ear_met(obj);
            fil_pat = char(obj.fil_pat_fig_ntt_sca_ear);
            exp_fig(h_fig, fil_pat)
        end
        function sav_fig_bas_spe(obj)
            h_fig = plo_bas_spe_met(obj);
            exp_fig(h_fig, [char(obj.poo_dir) '\bas_spe.png'])
        end
        function sav_fig_ntt_occ(obj)
            h_fig = plo_ntt_occ_met(obj);
            fil_pat = char(obj.fil_pat_fig_ntt_occ);
            exp_fig(h_fig, fil_pat)
        end
        function sav_fig_ntt_occ_hea(obj)
            h_fig = plo_ntt_occ_hea_met(obj);
            fil_pat = char(obj.fil_pat_fig_ntt_occ_hea);
            exp_fig(h_fig, fil_pat)
        end
        function sav_fig_ntt_occ_sca(obj)
            h_fig = plo_ntt_occ_sca_met(obj);
            fil_pat = char(obj.fil_pat_fig_ntt_occ_sca);
            exp_fig(h_fig, fil_pat)
        end
        function sav_fig_spe_sca(obj)
            h_fig = plo_spe_sca_met(obj);
            fil_pat = char(obj.fil_pat_fig_spe_sca);
            exp_fig(h_fig, fil_pat)
        end
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% behavioral
        function sav_fig_tai_dat(obj)
            sav_fig_abs(obj)
            %
            sav_fig_nta(obj)
            sav_fig_tai_sep(obj)
        end
        %
        function sav_fig_abs(obj)
            h_fig = plo_abs_met(obj);
            fil_pat = char(obj.fil_pat_fig_abs);
            exp_fig(h_fig, fil_pat)
        end
        function sav_fig_ave_tai_ang_xsa(obj)
            plo_ave_ang_xsa_met(obj)
            export_fig(char(obj.fil_pat_fig_tai_ang_xsa))
        end
        %
        function sav_fig_nta(obj)
            plo_nta_win_met(obj)
            export_fig(char(obj.fil_pat_fig_nta_win))
            %
            plo_nta_wit_met(obj)
            export_fig(char(obj.fil_pat_fig_nta_wit))
            %
            plo_nta_cro_met(obj)
            export_fig(char(obj.fil_pat_fig_nta_cro))
        end
        function sav_fig_tai_sep(obj)
            plo_tai_wit_met(obj)
            export_fig(char(obj.fil_pat_fig_tai_wit))
            %
            plo_tai_cro_met(obj)
            export_fig(char(obj.fil_pat_fig_tai_cro))
        end
        %
        function sav_fig_pro_sim(obj)
            plo_pro_sim_met(obj)
            export_fig(char(obj.fil_pat_fig_pro_sim))
            savefig(char(obj.fil_pat_fig_mat_pro_sim))
        end
        function sav_fig_pro_sim_two(obj)
            plo_pro_sim_two_met(obj)
            exp_pro_sim(obj)
        end
        function sav_fig_beh_mod(obj)
            plo_beh_mod_met(obj)
            export_fig(char(obj.fil_pat_fig_beh_mod))
            export_fig(char(obj.fil_pat_fig_mat_beh_mod))
        end
        function sav_fig_bea_ang(obj)
            plo_bea_ang_met(obj)
            export_fig(char(obj.fil_pat_fig_bea_ang))
        end
        function sav_fig_tai_rat_hig(obj)
            plo_tai_rat_hig_met(obj)
            export_fig(char(obj.fil_pat_fig_tai_rat_hig))
        end
        function sav_fig_ang_pre(obj)
            plo_ang_pre_met(obj)
            export_fig(char(obj.fil_pat_fig_ang_pre))
            savefig(char(obj.fil_pat_fig_mat_ang_pre))
        end
        function sav_fig_lat_two(obj)
            plo_lat_two_met(obj)
            exp_beh_mod(obj)
        end
        function sav_fig_tai_two(obj)
            sav_fig_ang(obj)
            sav_fig_ang_cro(obj)
            sav_fig_pro_sim_two(obj)
            sav_fig_lat_two(obj)
        end
        function sav_fig_tai_rat_spo(obj)
            plo_tai_rat_spo_met(obj)
            export_fig(char(obj.fil_pat_fig_tai_rat_spo))
        end
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% poster
        function sav_fig_tac(obj)
            h_fig = plo_tac_met(obj);
            fil_pat = char(obj.fil_pat_fig_tac);
            exp_fig(h_fig, fil_pat)
        end
        function sav_fig_tai(obj)
            h_fig = plo_tai_met(obj);
            fil_pat = char(obj.fil_pat_fig_tai);
            exp_fig(h_fig, fil_pat)
        end
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% neural
        function sav_fig_neu_met(obj)% single animal responses
            h_fig = plo_neu_met(obj);
            fil_pat = char(obj.fil_pat_fig_neu);
            exp_fig(h_fig, fil_pat)
        end
        function sav_fig_ras_map(obj)
            global ind_sub_reg
            for i = [1 6]
                for ind_reg = ind_sub_reg
                    plo_ras_map_met(obj, ind_reg, i)
                    export_fig(char(obj.fil_pat_fig_ras_map_epo_reg(i, ind_reg)))
                end
            end
        end
        %
        function sav_fig_neu_all(obj)% all figures
            %sav_fig_evo_xsa(obj)
            sav_fig_ofr_xsa(obj)
            sav_fig_cor_xsa(obj)
            %sav_fig_cor_xsa_sim(obj)
            sav_fig_dia(obj)
            sav_fig_dia_sig(obj)
            sav_fig_dia_mag(obj)
            sav_fig_dia_mag_sig(obj)
        end
        %
        function sav_fig_inh_exc(obj)
            h_fig = plo_inh_exc_met(obj);
            fil_pat = char(obj.fil_pat_fig_inh_exc);
            exp_fig(h_fig, fil_pat)
        end% fraction of cells
        function sav_fig_inh_exc_hig(obj)
            h_fig = plo_inh_exc_hig_met(obj);
            exp_fig(h_fig, [char(obj.poo_dir) '\inh_exc_hig.png'])
        end% fraction of cells
        function sav_fig_evo_vis_all(obj)
            h_fig = plo_evo_vis_all_met(obj);
            fil_pat = char(obj.fil_pat_fig_evo_vis_all);
            exp_fig(h_fig, fil_pat)
        end
        function sav_fig_hig_com(obj)
            h_fig = plo_hig_com_met(obj);
            fil_pat = char(obj.fil_pat_fig_hig_com);
            exp_fig(h_fig, fil_pat)
        end
        function sav_fig_hig_com_lon(obj)
            h_fig = plo_hig_com_lon_met(obj);
            exp_fig(h_fig, [char(obj.poo_dir) '\hig_com_lon.png'])
        end
        function sav_fig_evo_vis(obj, fie_cas_num)
            global ind_sub_reg
            for ind_reg = ind_sub_reg
                plo_evo_vis_met(obj, ind_reg, fie_cas_num)
                export_fig(char(obj.fil_pat_fig_inh_exc_reg(ind_reg)))
            end
        end
        function sav_fig_evo_xsa(obj)
            fie_num = {'dff'; 'raw'; 'tri'; 'cel'};
            h_fig = plo_evo_xsa_met(obj, fie_num);
            fil_pat = char(obj.fil_pat_fig_evo_xsa_dff_cel);
            exp_fig(h_fig, fil_pat)
        end
        function sav_fig_ofr_xsa(obj)
            plo_ofr_xsa_met(obj)
            export_fig(char(obj.fil_pat_fig_ofr_xsa))
        end
        %
        function sav_fig_den_cor(obj)
            plo_den_cor_met(obj)
            export_fig(char(obj.fil_pat_fig_den_cor))
        end
        function sav_fig_cor_smi(obj)
            plo_cor_smi_met(obj)
            export_fig(char(obj.fil_pat_fig_cor_smi))
        end
        function sav_fig_neu_rat_all(obj)
            pri = true;
            den = false;
            rat = true;
            
            reg = "hab";
            plo_neu_all_met(obj, pri, reg, den, rat)
            export_fig(char(obj.fil_pat_fig_hab_rat_all_pri))
            plo_neu_wit_met(obj, pri, reg, den, rat)
            export_fig(char(obj.fil_pat_fig_hab_rat_wit_pri))
            plo_neu_cro_met(obj, pri, reg, den, rat)
            export_fig(char(obj.fil_pat_fig_hab_rat_cro_pri))
            
            reg = "tel";
            plo_neu_all_met(obj, pri, reg, den, rat)
            export_fig(char(obj.fil_pat_fig_tel_rat_all_pri))
            plo_neu_wit_met(obj, pri, reg, den, rat)
            export_fig(char(obj.fil_pat_fig_tel_rat_wit_pri))
            plo_neu_cro_met(obj, pri, reg, den, rat)
            export_fig(char(obj.fil_pat_fig_tel_rat_cro_pri))
        end
        function sav_fig_neu_nor_rat_all(obj)
            pri = true;
            rat = false;
            nor_rat = true;
            
            reg = "hab";
            plo_neu_all_met(obj, pri, reg, rat, nor_rat)
            export_fig(char(obj.fil_pat_fig_hab_nor_rat_all_pri))
            plo_neu_wit_met(obj, pri, reg, rat, nor_rat)
            export_fig(char(obj.fil_pat_fig_hab_nor_rat_wit_pri))
            plo_neu_cro_met(obj, pri, reg, rat, nor_rat)
            export_fig(char(obj.fil_pat_fig_hab_nor_rat_cro_pri))
            
            reg = "tel";
            plo_neu_all_met(obj, pri, reg, rat, nor_rat)
            export_fig(char(obj.fil_pat_fig_tel_nor_rat_all_pri))
            plo_neu_wit_met(obj, pri, reg, rat, nor_rat)
            export_fig(char(obj.fil_pat_fig_tel_nor_rat_wit_pri))
            plo_neu_cro_met(obj, pri, reg, rat, nor_rat)
            export_fig(char(obj.fil_pat_fig_tel_nor_rat_cro_pri))
        end
        function sav_fig_ong_fir_rat_com(obj)
            plo_ong_fir_rat_com_met(obj, 'hab')
            export_fig(char(obj.fil_pat_fig_hab_ong_fir_rat_com))
            %
            plo_ong_fir_rat_com_met(obj, 'tel')
            export_fig(char(obj.fil_pat_fig_tel_ong_fir_rat_com))
        end
        % robustness
        function sav_fig_cor(obj)
            plo_cor_met(obj)
            export_fig(char(obj.fil_pat_fig_cor))
        end
        function sav_fig_pcc_xsa(obj)
            plo_pcc_xsa_met(obj)
            export_fig(char(obj.fil_pat_fig_pcc_xsa))
        end
        function sav_fig_euc_dis(obj)
            plo_euc_dis_met(obj)
            export_fig(char(obj.fil_pat_fig_euc_dis))
            %
            plo_euc_dis_xsa_met(obj)
            export_fig(char(obj.fil_pat_fig_euc_dis_xsa))
        end
        function sav_fig_pcc_dff(obj)
            plo_cor_dff_met(obj)
            export_fig(char(obj.fil_pat_fig_cor_dff))
            %
            plo_pcc_dff_xsa_met(obj)
            export_fig(char(obj.fil_pat_fig_pcc_dff_xsa))
        end
        function sav_fig_euc_dis_dff(obj)
            plo_euc_dis_dff_met(obj)
            export_fig(char(obj.fil_pat_fig_euc_dis_dff))
            %
            plo_euc_dis_dff_xsa_met(obj)
            export_fig(char(obj.fil_pat_fig_euc_dis_dff_xsa))
        end
        function sav_fig_pcc_euc_dff_den_sli_res(obj)
            fie_num = {'dff'; 'den'; 'sli'; 'res'};
            plo_cor_met(obj, fie_num)
            export_fig(char(obj.fil_pat_fig_cor_dff_den_sli_res))
            %
            plo_pcc_xsa_met(obj, fie_num)
            export_fig(char(obj.fil_pat_fig_pcc_dff_den_sli_res_xsa))
            %%%%%%%
            plo_euc_dis_met(obj, fie_num)
            export_fig(char(obj.fil_pat_fig_euc_dis_dff_den_sli_res))
            %
            plo_euc_dis_xsa_met(obj, fie_num)
            export_fig(char(obj.fil_pat_fig_euc_dis_dff_den_sli_res_xsa))
        end
        function sav_fig_pcc_euc_dff_den_sli_res_zsc_tes(obj)
            fie_num = {'dff'; 'den'; 'sli'; 'res_zsc_tes'};
            max_val = 1;
            plo_cor_met(obj, fie_num, max_val)
            export_fig(char(obj.fil_pat_fig_cor_dff_den_sli_res_zsc_tes))
            %
            plo_pcc_xsa_met(obj, fie_num)
            export_fig(char(obj.fil_pat_fig_pcc_dff_den_sli_res_zsc_tes_xsa))
            %%%%%%%
            max_val = 1000;
            plo_euc_dis_met(obj, fie_num, max_val)
            export_fig(char(obj.fil_pat_fig_euc_dis_dff_den_sli_res_zsc_tes))
            %
            plo_euc_dis_xsa_met(obj, fie_num)
            export_fig(char(obj.fil_pat_fig_euc_dis_dff_den_sli_res_zsc_tes_xsa))
        end
        function sav_fig_pcc_euc(obj)
            %fie_num = {'dff'; 'raw'; 'tri'; 'all'};
            fie_num = {'frc'; 'all'};
            %
            max_val = 1;
            plo_cor_met(obj, fie_num, max_val)
            export_fig(char(obj.fil_pat_fig_cor))
            %
            plo_pcc_xsa_met(obj, fie_num)
            export_fig(char(obj.fil_pat_fig_pcc_xsa))
            %%%%%%%
            %max_val = 600;
            max_val = 15;
            %
            plo_euc_dis_met(obj, fie_num, max_val)
            export_fig(char(obj.fil_pat_fig_euc_dis))
            %
            plo_euc_dis_xsa_met(obj, fie_num)
            export_fig(char(obj.fil_pat_fig_euc_dis_xsa))
        end
        %%% corr
        function sav_fig_cor_xsa(obj)
            global ind_fun_epo
            for i = ind_fun_epo
                h_fig = plo_cor_xsa_met(obj, i);
                fil_pat = char(obj.fil_pat_fig_cor_xsa);
                fil_pat = [fil_pat(1:end - 4) '_' sprintf('%d', i) '.png'];
                exp_fig(h_fig, fil_pat)
            end
        end
        function sav_fig_abs_cor_xsa(obj, epo_num)
            h_fig = plo_abs_cor_xsa_met(obj, epo_num);
            fil_pat = char(obj.fil_pat_fig_abs_cor_xsa);
            exp_fig(h_fig, fil_pat)
        end
        function sav_fig_dia_acc(obj, epo_num)
            h_fig = plo_dia_acc_met(obj, epo_num);
            fil_pat = char(obj.fil_pat_fig_dia_acc);
            exp_fig(h_fig, fil_pat)
        end
        %
        function sav_fig_cor_dis(obj)
            h_fig = plo_cor_dis_met(obj);
            fil_pat = char(obj.fil_pat_fig_cor_dis);
            exp_fig(h_fig, fil_pat)
        end
        function sav_fig_cor_dis_epo(obj, epo_num)
            h_fig = plo_cor_dis_epo_met(obj, epo_num);
            fil_pat = char(obj.fil_pat_fig_cor_dis_epo);
            exp_fig(h_fig, fil_pat)
        end
        function sav_fig_ave_cor_dis(obj)
            h_fig = plo_ave_cor_dis_met(obj);
            fil_pat = char(obj.fil_pat_fig_ave_cor_dis);
            exp_fig(h_fig, fil_pat)
        end
        function sav_fig_ave_xcc_dis(obj)
            h_fig = plo_ave_xcc_dis_met(obj);
            fil_pat = char(obj.fil_pat_fig_ave_xcc_dis);
            exp_fig(h_fig, fil_pat)
        end
        function sav_fig_cor_dis_ent(obj)
            h_fig = plo_cor_dis_ent_met(obj);
            exp_fig(h_fig, [char(obj.poo_dir) '\cor_dis_ent.png'])
        end
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% neurobehavioral
        function sav_fig_act_tac(obj)
            fie_num = {'dff'; 'raw'; 'tri'; 'ani'};
            h_fig = plo_act_tac_met(obj, fie_num);
            exp_fig(h_fig, [char(obj.poo_dir) '\act_tac.png'])
        end
        function sav_fig_act_tac_tri(obj)
            h_fig = plo_act_tac_tri_met(obj);
            fil_pat = char(obj.fil_pat_fig_act_tac_tri);
            export_fig(fil_pat)
            saveas(h_fig, fil_pat(1:end - 4), 'pdf')
        end
        function sav_fig_tai_tri_com(obj)
            h_fig = plo_tai_tri_com_met(obj);
            exp_fig(h_fig, [char(obj.poo_dir) '\tai_tri_com.png'])
        end
        function sav_fig_tai_tri_spo_com(obj)
            h_fig = plo_tai_tri_com_spo_met(obj);
            exp_fig(h_fig, [char(obj.poo_dir) '\tai_tri_com_spo.png'])
        end
        function sav_fig_tai_tri_spo_lon_com(obj)
            h_fig = plo_tai_tri_com_spo_lon_met(obj);
            exp_fig(h_fig, [char(obj.poo_dir) '\tai_tri_com_spo_lon.png'])
        end
        function sav_fig_spa_den_bou_spo(obj)
            h_fig = plo_spa_den_bou_spo_met(obj);
            exp_fig(h_fig, [char(obj.poo_dir) '\spa_den_bou_spo.png'])
        end
        function sav_fig_spa_den(obj)
            h_fig = plo_spa_den_met(obj);
            exp_fig(h_fig, [char(obj.poo_dir) '\spa_den.png'])
        end
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% data mul all
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% behavioral
        function app_mul_tai_dat_seg_all(obj)
            sta_ani = 1;
            for i = 1:obj.n_sam
                sam_fun_i = str2func(['sam_fun.' convertStringsToChars(strcat(obj.sam(i), ...
                    "_fun"))]);
                sam_obj = sam_fun_i();
                app_tai_dat_seg_all(sam_obj, sta_ani)
            end
        end
        function app_mul_tai_dat_fre_all(obj)
            for i = 1:obj.n_sam
                sam_fun_i = str2func(['sam_fun.' convertStringsToChars(strcat(obj.sam(i), "_fun"))]);
                sam_obj = sam_fun_i();
                app_tai_dat_fre_all(sam_obj)
            end
        end
        function app_mul_ave_ang_epo_all(obj)
            for i = 1:obj.n_sam
                sam_fun_i = str2func(['sam_fun.' convertStringsToChars(strcat(obj.sam(i), ...
                    "_fun"))]);
                sam_obj = sam_fun_i();
                app_ave_ang_epo_all(sam_obj)
            end
        end
        function app_mul_par_tai_all(obj)
            nam_sam = cell(obj.n_sam, 1);
            for i = 1:obj.n_sam
                nam_sam{i} = convertStringsToChars(strcat(obj.sam(i), "_fun"));
            end
            %parfor i = 1:obj.n_sam
            for i = 1:obj.n_sam
                sam_fun_i = str2func(['sam_fun.' nam_sam{i}]);
                sam_obj = sam_fun_i();
                app_par_tai_all(sam_obj)
            end
        end
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% neural
        function app_mul_ext_all(obj)
            nam_sam = cell(obj.n_sam, 1);
            for i = 1:obj.n_sam
                nam_sam{i} = convertStringsToChars(strcat(obj.sam(i), "_fun"));
            end
            parfor i = 1:obj.n_sam
            %for i = 1:obj.n_sam
                sam_fun_i = str2func(['sam_fun.' nam_sam{i}]);
                sam_obj = sam_fun_i();
                app_ext_all(sam_obj)
            end
        end
        %
        function app_mul_fra_sta_sto_all(obj)
            nam_sam = cell(obj.n_sam, 1);
            for i = 1:obj.n_sam
                nam_sam{i} = convertStringsToChars(strcat(obj.sam(i), "_fun"));
            end
            parfor i = 1:obj.n_sam
            %for i = 1:obj.n_sam
                sam_fun_i = str2func(['sam_fun.' nam_sam{i}]);
                sam_obj = sam_fun_i();
                app_fra_sta_sto_all(sam_obj)
            end
        end
        function app_mul_par_roi_all(obj)
            nam_sam = cell(obj.n_sam, 1);
            for i = 1:obj.n_sam
                nam_sam{i} = convertStringsToChars(strcat(obj.sam(i), "_fun"));
            end
            %parfor i = 1:obj.n_sam
            for i = 1:obj.n_sam
                sam_fun_i = str2func(['sam_fun.' nam_sam{i}]);
                sam_obj = sam_fun_i();
                app_par_roi_all(sam_obj)
            end
        end
        %
        function app_mul_cel_dat_all(obj)
            for i = 1:obj.n_sam
                sam_fun_i = str2func(['sam_fun.' convertStringsToChars(strcat(obj.sam(i), ...
                    "_fun"))]);
                sam_obj = sam_fun_i();
                app_cel_dat_all(sam_obj)
            end
        end
        function app_mul_dff_bra_chu_fra_cel_all(obj)
            for i = 1:obj.n_sam
                disp(i)
                sam_fun_i = str2func(['sam_fun.' convertStringsToChars(strcat(obj.sam(i), ...
                    "_fun"))]);
                sam_obj = sam_fun_i();
                sta_ani = 1;
                app_dff_bra_chu_fra_cel_all(sam_obj, sta_ani)
            end
        end
        function app_mul_ave_nfr_cel_tri_all(obj)
            for i = 1:obj.n_sam
                sam_fun_i = str2func(['sam_fun.' convertStringsToChars(strcat(obj.sam(i), ...
                    "_fun"))]);
                sam_obj = sam_fun_i();
                app_ave_nfr_cel_tri_all(sam_obj)
            end
        end
        function app_mul_par_all(obj)
            nam_sam = cell(obj.n_sam, 1);
            for i = 1:obj.n_sam
                nam_sam{i} = convertStringsToChars(strcat(obj.sam(i), "_fun"));
            end
            %parfor i = 1:obj.n_sam
            for i = 1:obj.n_sam
                sam_fun_i = str2func(['sam_fun.' nam_sam{i}]);
                sam_obj = sam_fun_i();
                app_par_all(sam_obj)
            end
        end
        %
        function app_mul_xre_all(obj)
            for i = 1:obj.n_sam
                sam_fun_i = str2func(['sam_fun.' convertStringsToChars(strcat(obj.sam(i), ...
                    "_fun"))]);
                sam_obj = sam_fun_i();
                app_xre_all(sam_obj)
            end
        end
        function app_mul_mag_all(obj)
            for i = 1:obj.n_sam
                sam_fun_i = str2func(['sam_fun.' convertStringsToChars(strcat(obj.sam(i), ...
                    "_fun"))]);
                sam_obj = sam_fun_i();
                app_mag_all(sam_obj)
            end
        end
        function app_mul_fun_all(obj, fun)% ****
            for i = 1:obj.n_sam
                sam_fun_i = str2func(['sam_fun.' convertStringsToChars(strcat(obj.sam(i), ...
                    "_fun"))]);
                sam_obj = sam_fun_i();
                fun(sam_obj)
            end
        end
        %%%
        function app_mul_ofr_win_all(obj)
            for i = 1:obj.n_sam
                disp(i)
                sam_fun_i = str2func(['sam_fun.' convertStringsToChars(strcat(obj.sam(i), ...
                    "_fun"))]);
                sam_obj = sam_fun_i();
                app_ofr_win_all(sam_obj)
            end
        end
        function app_mul_log_tri_con_all(obj)
            for i = 1:obj.n_sam
                sam_fun_i = str2func(['sam_fun.' convertStringsToChars(strcat(obj.sam(i), "_fun"))]);
                sam_obj = sam_fun_i();
                app_log_tri_con_all(sam_obj)
            end
        end
        function app_mul_neu_dat_raw_all(obj)
            for i = 1:obj.n_sam
                sam_fun_i = str2func(['sam_fun.' convertStringsToChars(strcat(obj.sam(i), "_fun"))]);
                sam_obj = sam_fun_i();
                app_neu_dat_raw_all(sam_obj)
            end
        end
        function app_mul_rec_tai_ang_fre_fra_sta_con_all(obj)
            for i = 1:obj.n_sam
                sam_fun_i = str2func(['sam_fun.' convertStringsToChars(strcat(obj.sam(i), "_fun"))]);
                sam_obj = sam_fun_i();
                app_rec_tai_ang_fre_fra_sta_con_all(sam_obj)
            end
        end
        function app_mul_eth_dat_all(obj)
            for i = 1:obj.n_sam
                sam_fun_i = str2func(['sam_fun.' convertStringsToChars(strcat(obj.sam(i), "_fun"))]);
                sam_obj = sam_fun_i();
                app_eth_dat_all(sam_obj)
            end
        end
        function app_mul_uni_sig_all(obj)
            for i = 1:obj.n_sam
                sam_fun_i = str2func(['sam_fun.' convertStringsToChars(strcat(obj.sam(i), "_fun"))]);
                sam_obj = sam_fun_i();
                app_uni_sig_all(sam_obj)
            end
        end
        function app_mul_rec_pcx_uni_par_fra_sta_con_all(obj)
            for i = 1:obj.n_sam
                sam_fun_i = str2func(['sam_fun.' convertStringsToChars(strcat(obj.sam(i), "_fun"))]);
                sam_obj = sam_fun_i();
                app_rec_pcx_uni_par_fra_sta_con_all(sam_obj)
            end
        end
        function app_mul_per_thr_pla_sti_all(obj)
            for i = 1:obj.n_sam
                sam_fun_i = str2func(['sam_fun.' convertStringsToChars(strcat(obj.sam(i), "_fun"))]);
                sam_obj = sam_fun_i();
                app_per_thr_pla_sti_all(sam_obj)
            end
        end
        function app_mul_n_cel_all(obj)
            for i = 1:obj.n_sam
                sam_fun_i = str2func(['sam_fun.' convertStringsToChars(strcat(obj.sam(i), "_fun"))]);
                sam_obj = sam_fun_i();
                app_n_cel_all(sam_obj)
            end
        end
        function per_mul_spo_all(obj)
            for i = 1:obj.n_sam
                sam_fun_i = str2func(['sam_fun.' convertStringsToChars(strcat(obj.sam(i), "_fun"))]);
                sam_obj = sam_fun_i();
                per_spo_all(sam_obj)
            end
        end
        function app_mul_lab_cel_all(obj)
            for i = 1:obj.n_sam
                sam_fun_i = str2func(['sam_fun.' convertStringsToChars(strcat(obj.sam(i), ...
                    "_fun"))]);
                sam_obj = sam_fun_i();
                app_lab_cel_all(sam_obj)
            end
        end
        function app_mul_dff_fra_sta_con_all(obj)
            for i = 1:obj.n_sam
                sam_fun_i = str2func(['sam_fun.' convertStringsToChars(strcat(obj.sam(i), ...
                    "_fun"))]);
                sam_obj = sam_fun_i();
                app_dff_fra_sta_con_all(sam_obj)
            end
        end
        function app_mul_dff_res_fra_sta_con_all(obj)
            for i = 1:obj.n_sam
                sam_fun_i = str2func(['sam_fun.' convertStringsToChars(strcat(obj.sam(i), ...
                    "_fun"))]);
                sam_obj = sam_fun_i();
                app_dff_res_fra_sta_con_all(sam_obj)
            end
        end
        function app_mul_res_typ_cel_sti_all(obj)
            for i = 1:obj.n_sam
                sam_fun_i = str2func(['sam_fun.' convertStringsToChars(strcat(obj.sam(i), ...
                    "_fun"))]);
                sam_obj = sam_fun_i();
                app_res_typ_cel_sti_all(sam_obj)
            end
        end
        function app_mul_pcc_res_xri_xri_all(obj)
            for i = 1:obj.n_sam
                sam_fun_i = str2func(['sam_fun.' convertStringsToChars(strcat(obj.sam(i), ...
                    "_fun"))]);
                sam_obj = sam_fun_i();
                app_pcc_res_xri_xri_all(sam_obj)
            end
        end
        % spike
        function app_mul_spi_dat_all(obj)
            for i = 1:obj.n_sam
                sam_fun_i = str2func(['sam_fun.' convertStringsToChars(strcat(obj.sam(i), ...
                    "_fun"))]);
                sam_obj = sam_fun_i();
                app_spi_dat_all(sam_obj)
            end
        end
        function app_mul_spi_dat_dff_all(obj)
            parfor i = 1:obj.n_sam
                sam_fun_i = str2func(['sam_fun.' convertStringsToChars(strcat(obj.sam(i), ...
                    "_fun"))]);
                sam_obj = sam_fun_i();
                if strcmp(sam_obj.sam_idx, "ong_viv")
                    viv = true;
                else
                    viv = false;
                end
                app_spi_dat_dff_all(sam_obj, viv)
            end
        end
        function app_mul_spi_dat_deb_all(obj)
            for i = 1:obj.n_sam
                sam_fun_i = str2func(['sam_fun.' convertStringsToChars(strcat(obj.sam(i), ...
                    "_fun"))]);
                sam_obj = sam_fun_i();
                app_spi_dat_deb_all(sam_obj)
            end
        end
        function app_mul_dff_den_chu_fra_cel_all(obj)
            for i = 1:obj.n_sam
                sam_fun_i = str2func(['sam_fun.' convertStringsToChars(strcat(obj.sam(i), ...
                    "_fun"))]);
                sam_obj = sam_fun_i();
                app_dff_den_chu_fra_cel_all(sam_obj)
            end
        end
        % clustering
        function app_mul_clu_ana_all(obj)
            nam_sam = cell(obj.n_sam, 1);
            for i = 1:obj.n_sam
                nam_sam{i} = convertStringsToChars(strcat(obj.sam(i), "_fun"));
            end
            parfor i = 1:obj.n_sam
                sam_fun_i = str2func(['sam_fun.' nam_sam{i}]);
                sam_obj = sam_fun_i();
                app_clu_ana_all(sam_obj)
            end
        end
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% neurobeh
        function app_mul_par_tai_cel_all(obj)
            nam_sam = cell(obj.n_sam, 1);
            for i = 1:obj.n_sam
                nam_sam{i} = convertStringsToChars(strcat(obj.sam(i), "_fun"));
            end
            for i = 1:obj.n_sam
                sam_fun_i = str2func(['sam_fun.' nam_sam{i}]);
                sam_obj = sam_fun_i();
                app_par_tai_cel_all(sam_obj)
            end
        end
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% data all
        function sav_dat_sam_all(obj)
            for i = 1:obj.n_sam
                sam_fun_i = ...
                    str2func(['sam_fun.' convertStringsToChars(strcat(obj.sam(i), "_fun"))]);
                sam_obj = sam_fun_i();
                sav_dat_sam(sam_obj)
            end
        end
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% behavioral
        function app_tai_dat_all(obj)
            for i = 1:obj.n_sam
                sam_fun_i = str2func(['sam_fun.' convertStringsToChars(strcat(obj.sam(i), ...
                    "_fun"))]);
                sam_obj = sam_fun_i();
                app_tai_dat(sam_obj)
            end
        end
        function app_ave_ang_all(obj)
            for i = 1:obj.n_sam
                sam_fun_i = str2func(['sam_fun.' convertStringsToChars(strcat(obj.sam(i), ...
                    "_fun"))]);
                sam_obj = sam_fun_i();
                app_ave_ang(sam_obj)
            end
        end
        function app_rat_con_bin_sta_par_all(obj)
            for i = 1:obj.n_sam
                sam_fun_i = str2func(['sam_fun.' convertStringsToChars(strcat(obj.sam(i), "_fun"))]);
                sam_obj = sam_fun_i();
                app_rat_con_bin_sta_par(sam_obj)
            end
        end
        function app_tai_rat_hig_bin_sta_all(obj)
            for i = 1:obj.n_sam
                sam_fun_i = str2func(['sam_fun.' convertStringsToChars(strcat(obj.sam(i), "_fun"))]);
                sam_obj = sam_fun_i();
                app_tai_rat_hig_bin_sta(sam_obj)
            end
        end
        function app_rat_sti_win_all(obj)
            parfor i = 1:obj.n_sam
                sam_fun_i = str2func(['sam_fun.' convertStringsToChars(strcat(obj.sam(i), "_fun"))]);
                sam_obj = sam_fun_i();
                app_rat_sti_win(sam_obj)
            end
        end
        function app_pcx_ave_all(obj)
            parfor i = 1:obj.n_sam
                sam_fun_i = str2func(['sam_fun.' convertStringsToChars(strcat(obj.sam(i), "_fun"))]);
                sam_obj = sam_fun_i();
                app_pcx_ave(sam_obj)
            end
        end
        function app_par_tai_all(obj)
            for i = 1:obj.n_sam
                sam_fun_i = ...
                    str2func(['sam_fun.' convertStringsToChars(strcat(obj.sam(i), "_fun"))]);
                sam_obj = sam_fun_i();
                app_par_tai(sam_obj)
            end
        end
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% neural
        function app_ave_neu_all(obj)
            nam_sam = strings(obj.n_sam, 1);
            for i = 1:obj.n_sam
                nam_sam(i) = obj.sam(i);
            end
            parfor i = 1:obj.n_sam
            %for i = 1:obj.n_sam
                sam_fun_i = str2func(['sam_fun.' convertStringsToChars(strcat(nam_sam(i), ...
                    "_fun"))]);
                sam_obj = sam_fun_i();
                app_ave_neu(sam_obj)
            end
        end
        function app_dff_all_sam_ave_all(obj)
            nam_sam = strings(obj.n_sam, 1);
            for i = 1:obj.n_sam
                nam_sam(i) = obj.sam(i);
            end
            %for i = 1:obj.n_sam
            parfor i = 1:obj.n_sam
                disp(i)
                sam_fun_i = str2func(['sam_fun.' convertStringsToChars(strcat(nam_sam(i), ...
                    "_fun"))]);
                sam_obj = sam_fun_i();
                if sam_obj.n_ani_sta > 0
                    app_dff_all_sam_ave(sam_obj)
                end
            end
        end
        function app_par_all(obj)
            for i = 1:obj.n_sam
                sam_fun_i = ...
                    str2func(['sam_fun.' convertStringsToChars(strcat(obj.sam(i), "_fun"))]);
                sam_obj = sam_fun_i();
                app_par(sam_obj)
            end
        end
        function app_n_cel_all(obj)
            for i = 1:obj.n_sam
                sam_fun_i = str2func(['sam_fun.' convertStringsToChars(strcat(obj.sam(i), "_fun"))]);
                sam_obj = sam_fun_i();
                app_n_cel(sam_obj)
            end
        end
        function app_bea_lat_ani_con_all(obj)
            for i = 1:obj.n_sam
                sam_fun_i = str2func(['sam_fun.' convertStringsToChars(strcat(obj.sam(i), "_fun"))]);
                sam_obj = sam_fun_i();
                app_bea_lat_ani_con(sam_obj)
            end
        end
        function app_dff_sam_ave_all(obj)
            for i = 1:obj.n_sam
                sam_fun_i = str2func(['sam_fun.' convertStringsToChars(strcat(obj.sam(i), "_fun"))]);
                sam_obj = sam_fun_i();
                app_dff_sam_ave(sam_obj)
            end
        end
        function app_res_typ_cel_sti_all(obj)
            for i = 1:obj.n_sam
                sam_fun_i = str2func(['sam_fun.' convertStringsToChars(strcat(obj.sam(i), "_fun"))]);
                sam_obj = sam_fun_i();
                app_res_typ_cel_sti(sam_obj)
            end
        end
        function app_dff_sta_sam_ave_all(obj)
            for i = 1:obj.n_sam
                sam_fun_i = str2func(['sam_fun.' convertStringsToChars(strcat(obj.sam(i), "_fun"))]);
                sam_obj = sam_fun_i();
                if sam_obj.n_ani_sta > 0
                    app_dff_sta_sam_ave(sam_obj)
                end
            end
        end
        function app_dff_res_sam_ave_all(obj)
            for i = 1:obj.n_sam
                sam_fun_i = str2func(['sam_fun.' convertStringsToChars(strcat(obj.sam(i), "_fun"))]);
                sam_obj = sam_fun_i();
                if sam_obj.n_ani_sta > 0
                    app_dff_res_sam_ave(sam_obj)
                end
            end
        end
        function app_pcc_ave_xri_xri_all(obj)
            for i = 1:obj.n_sam
                sam_fun_i = str2func...
                    (['sam_fun.' convertStringsToChars(strcat(obj.sam(i), "_fun"))]);
                sam_obj = sam_fun_i();
                if sam_obj.n_ani_sta > 0
                    app_pcc_ave_xri_xri(sam_obj)
                end
            end
        end
        function app_ofr_all(obj)
            for i = 1:obj.n_sam
                sam_fun_i = ...
                    str2func(['sam_fun.' convertStringsToChars(strcat(obj.sam(i), "_fun"))]);
                sam_obj = sam_fun_i();
                if sam_obj.n_ani_sta > 0
                    app_ofr(sam_obj)
                end
            end
        end
        % spike
        function app_spi_dat_all(obj)
            nam_sam = strings(obj.n_sam, 1);
            for i = 1:obj.n_sam
                nam_sam(i) = obj.sam(i);
            end
            parfor i = 1:obj.n_sam
            %for i = 1:obj.n_sam
                sam_fun_i = str2func(['sam_fun.' convertStringsToChars(strcat(nam_sam(i), ...
                    "_fun"))]);
                sam_obj = sam_fun_i();
                app_spi_dat(sam_obj)
            end
        end
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% neurobeh
        function app_neu_beh_all(obj)
            nam_sam = strings(obj.n_sam, 1);
            for i = 1:obj.n_sam
                nam_sam(i) = obj.sam(i);
            end
            parfor i = 1:obj.n_sam
            %for i = 1:obj.n_sam
                sam_fun_i = str2func(['sam_fun.' convertStringsToChars(strcat(nam_sam(i), ...
                    "_fun"))]);
                sam_obj = sam_fun_i();
                app_neu_beh(sam_obj)
            end
        end
        function app_par_neu_beh_all(obj)
            nam_sam = strings(obj.n_sam, 1);
            for i = 1:obj.n_sam
                nam_sam(i) = obj.sam(i);
            end
            parfor i = 1:obj.n_sam
            %for i = 1:obj.n_sam
                sam_fun_i = str2func(['sam_fun.' convertStringsToChars(strcat(nam_sam(i), ...
                    "_fun"))]);
                sam_obj = sam_fun_i();
                app_par_neu_beh(sam_obj)
            end
        end
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% figures all
        % behavioral
        function sav_fig_lat_map_all(obj)
            for i = 1:obj.n_sam
                sam_fun_i = str2func(['sam_fun.' convertStringsToChars(strcat(obj.sam(i), "_fun"))]);
                sam_obj = sam_fun_i();
                sav_fig_lat_map(sam_obj)
            end
        end
        function sav_fig_mul_neu_pix_sti_all(obj)
            for i = 1:obj.n_sam
                sam_fun_i = str2func(['sam_fun.' convertStringsToChars(strcat(obj.sam(i), "_fun"))]);
                sam_obj = sam_fun_i();
                sav_fig_neu_pix_sti_all(sam_obj)
            end
        end
        function sav_fig_mul_neu_pix_sti_raw_all(obj)
            for i = 1:obj.n_sam
                sam_fun_i = str2func(['sam_fun.' convertStringsToChars(strcat(obj.sam(i), "_fun"))]);
                sam_obj = sam_fun_i();
                sav_fig_neu_pix_sti_raw_all(sam_obj)
            end
        end
        function sav_fig_eth_spo_all(obj)
            for i = 1:obj.n_sam
                sam_fun_i = str2func(['sam_fun.' convertStringsToChars(strcat(obj.sam(i), "_fun"))]);
                sam_obj = sam_fun_i();
                sav_fig_eth_spo(sam_obj)
            end
        end
        function sav_fig_eth_sti_all(obj)
            for i = 1:obj.n_sam
                sam_fun_i = str2func(['sam_fun.' convertStringsToChars(strcat(obj.sam(i), "_fun"))]);
                sam_obj = sam_fun_i();
                sav_fig_eth_sti(sam_obj)
            end
        end
        function sav_fig_ave_pcx_all(obj)
            for i = 1:obj.n_sam
                sam_fun_i = str2func(['sam_fun.' convertStringsToChars(strcat(obj.sam(i), "_fun"))]);
                sam_obj = sam_fun_i();
                sav_fig_ave_pcx(sam_obj)
            end
        end
        % neural
        function sav_fig_sum_all(obj)
            for i = 1:obj.n_sam
                sam_fun_i = ...
                    str2func(['sam_fun.' convertStringsToChars(strcat(obj.sam(i), "_fun"))]);
                sam_obj = sam_fun_i();
                sav_fig_sum(sam_obj)
            end
        end
        function sav_fig_mul_sum_all(obj)
            for i = 1:obj.n_sam
                sam_fun_i = str2func(['sam_fun.' convertStringsToChars(strcat(obj.sam(i), "_fun"))]);
                sam_obj = sam_fun_i();
                sav_fig_sum_all(sam_obj)
            end
        end
        function sav_fig_mul_cor_sta_all(obj)
            for i = 1:obj.n_sam
                sam_fun_i = str2func(['sam_fun.' convertStringsToChars(strcat(obj.sam(i), "_fun"))]);
                sam_obj = sam_fun_i();
                sav_fig_cor_sta_all(sam_obj)
            end
        end
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% general
        function sav_var = ext_var_mul(obj, var_nam)
            fie = 'fil_pat_mul_sam';
            sav_var = ext_var(obj, fie, var_nam);
        end
        function isx_var(obj, var_nam)
            mat_fil = matfile(obj.fil_pat_mul_sam);
            var = isprop(mat_fil, var_nam);
            disp(var)
        end
    end
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% data freely-moving
function [mea_dis_ntt_tim_gro, sem_dis_ntt_tim_gro, ave_dis_ntt_win_cox_sam_ani, ...
    p_dis_ntt_win, p_dis_ntt_rst_win, pro_ntt_sam_win_row_col, foc_ntt_win_cox_sam_ani, ...
    p_foc_ntt_win, p_foc_ntt_rst_win] = ext_ntt_dat(y_position_nacre_tph2_NTT, ...
    heatmaps_nacre_tph2_NTT, dur)
off = 8;
tim_ntt_bin = (1:1800)';
[mea_dis_ntt_tim_gro, sem_dis_ntt_tim_gro, ave_dis_ntt_win_cox_sam_ani, p_dis_ntt_win, ...
    ~, p_dis_ntt_rst_win] = ext_fre_dat(y_position_nacre_tph2_NTT, tim_ntt_bin, off, dur);
[pro_ntt_sam_win_row_col, foc_ntt_win_cox_sam_ani, p_foc_ntt_win, p_foc_ntt_rst_win] = ...
    read_behaviour(heatmaps_nacre_tph2_NTT, dur);
end

function [mea_dis_ntt_tim_gro, sem_dis_ntt_tim_gro, ave_dis_ntt_win_cox_sam_ani, ...
    p_dis_ntt_win, p_dis_ntt_sam, p_dis_ntt_rst_win] = ext_fre_dat(dis_ntt_gro, tim_ntt_bin, off, dur)
[~, ~, dis_ntt_nac_tim_ani, dis_ntt_tph_tim_ani] = read_behaviour_EY_2(dis_ntt_gro);
%
dis_ntt_nac_tim_ani = dis_ntt_nac_tim_ani + off;
[mea_dis_ntt_nac_tim, ~, sem_dis_ntt_nac_tim] = com_sta(dis_ntt_nac_tim_ani, 2);
%
dis_ntt_tph_tim_ani = dis_ntt_tph_tim_ani + off;
[mea_dis_ntt_tph_tim, ~, sem_dis_ntt_tph_tim] = com_sta(dis_ntt_tph_tim_ani, 2);
%%%%%%%%%%%%%%%%%%%%%%%%
mea_dis_ntt_tim_gro = ...
    [mea_dis_ntt_nac_tim(tim_ntt_bin) mea_dis_ntt_tph_tim(tim_ntt_bin)];
sem_dis_ntt_tim_gro = ...
    [sem_dis_ntt_nac_tim(tim_ntt_bin) sem_dis_ntt_tph_tim(tim_ntt_bin)];
%
siz_win = dur*[60; 60];
poi = 60*[1 + dur 29];
[ave_dis_ntt_tph_ani_win, n_win] = ...
    com_ave_dis_ntt_tph_ani_win(dis_ntt_tph_tim_ani, siz_win, poi);
ave_dis_ntt_nac_ani_win = ...
    com_ave_dis_ntt_tph_ani_win(dis_ntt_nac_tim_ani, siz_win, poi);
p_dis_ntt_win = nan(n_win, 1);
p_dis_ntt_rst_win = nan(n_win, 1);
for i = 1:n_win
    p_dis_ntt_win(i) = lme(ave_dis_ntt_tph_ani_win(:, i), ave_dis_ntt_nac_ani_win(:, i));
    p_dis_ntt_rst_win(i) = ranksum(ave_dis_ntt_tph_ani_win(:, i), ave_dis_ntt_nac_ani_win(:, i));
end
ave_dis_ntt_sam_ani_win = {ave_dis_ntt_nac_ani_win; ave_dis_ntt_tph_ani_win};
ave_dis_ntt_win_cox_sam_ani = tra(ave_dis_ntt_sam_ani_win);
% compare early vs late within sample
n_sam = length(dis_ntt_gro);
p_dis_ntt_sam = nan(n_sam, 1);
for i = 1:n_sam
    p_dis_ntt_sam(i) = signrank(ave_dis_ntt_sam_ani_win{i}(:, 1), ...
        ave_dis_ntt_sam_ani_win{i}(:, 2));
end
end

function [pro_ntt_sam_win_row_col, foc_ntt_win_cox_sam_ani, p_foc_ntt_win, p_foc_ntt_rst_win] = ...
    read_behaviour(heatmaps_nacre_tph2_NTT, dur)
wdt = heatmaps_nacre_tph2_NTT(1);
wdt = wdt{1,1};
output_wdt=zeros([size(wdt{1,1}) size(wdt)]);
for i=1:size(wdt,1)-25
    for k=1:size(wdt,2)
        output_wdt(:,:,i,k)=cell2mat(wdt(i,k));
    end 
end
%% NTT analysis
% bin the data
ser=1:60:841;
binned_wdt=zeros(size(output_wdt,1),size(output_wdt,2),size(ser,2),size(output_wdt,4));
delta=59;
for i=1:size(ser,2)
    for k=1:size(output_wdt,4)
        binned_wdt(:,:,i,k)= squeeze(mean(output_wdt(:,:,ser(i):ser(i)+delta,k),3));
    end 
end
n_sam = 2;
n_win = 2;
pro_ntt_sam_win_row_col = cell(n_sam, n_win);
pro_ntt_sam_win_row_col{1, 1} = squeeze(mean(mean(binned_wdt(:,:, 2:2 + dur,:),3),4));
pro_ntt_sam_win_row_col{1, 2} = squeeze(mean(mean(binned_wdt(:,:,15 - dur:15,:),3),4));
%
%%
tph2=heatmaps_nacre_tph2_NTT(2);
tph2= tph2{1,1};
output_tph2=zeros([size(tph2{1,1}) size(tph2)]);
for i=1:size(tph2,1)-25
    for k=1:size(tph2,2)
        output_tph2(:,:,i,k)=cell2mat(tph2(i,k));
    end 
end
binned_tph2=zeros(size(output_tph2,1),size(output_tph2,2),size(ser,2),size(output_tph2,4));
for i=1:size(ser,2)
    for k=1:size(output_tph2,4)
        binned_tph2(:,:,i,k)= squeeze(mean(output_tph2(:,:,ser(i):ser(i)+delta,k),3));
    end 
end
win_ear = 2:2 + dur;
win_lat = 15 - dur:15;
pro_ntt_sam_win_row_col{2, 1} = squeeze(mean(mean(binned_tph2(:,:,win_ear,:),3),4));
pro_ntt_sam_win_row_col{2, 2} = squeeze(mean(mean(binned_tph2(:,:,win_lat,:),3),4));
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%     
%% calculate binned focality during NTT
binned_wdt2=cat(3,mean(binned_wdt(:,:,win_ear,:),3),mean(binned_wdt(:,:,win_lat,:),3));
binned_tph22=cat(3,mean(binned_tph2(:,:,win_ear,:),3),mean(binned_tph2(:,:,win_lat,:),3));

foc_wdt2=zeros(size(binned_wdt2,3),size(binned_wdt2,4));
for i=1:size(binned_wdt2,3)
    for k=1:size(binned_wdt2,4)
    foc_wdt2(i,k)=Focality_forVegard_EY(binned_wdt2(:,:,i,k));
    end 
end 

foc_tph22=zeros(size(binned_tph22,3),size(binned_tph22,4));
for i=1:size(binned_tph22,3)
    for k=1:size(binned_tph22,4)
    foc_tph22(i,k)=Focality_forVegard_EY(binned_tph22(:,:,i,k));
    end 
end
% diff window - thesis
foc_ntt_sam_ani_win = cell(n_sam, 1);
foc_ntt_sam_ani_win{1} = foc_wdt2';
foc_ntt_sam_ani_win{2} = foc_tph22';
%
p_foc_ntt_win = nan(n_win, 1);
p_foc_ntt_win(1) = lme(foc_ntt_sam_ani_win{1}(:, 1), foc_ntt_sam_ani_win{2}(:, 1));
p_foc_ntt_win(2) = lme(foc_ntt_sam_ani_win{1}(:, 2), foc_ntt_sam_ani_win{2}(:, 2));
%
p_foc_ntt_rst_win = nan(n_win, 1);
p_foc_ntt_rst_win(1) = ranksum(foc_ntt_sam_ani_win{1}(:, 1), foc_ntt_sam_ani_win{2}(:, 1));
p_foc_ntt_rst_win(2) = ranksum(foc_ntt_sam_ani_win{1}(:, 2), foc_ntt_sam_ani_win{2}(:, 2));
%
foc_ntt_win_cox_sam_ani = tra(foc_ntt_sam_ani_win);
end

function [ave_dis_ntt_tph_ani_win, n_win] = com_ave_dis_ntt_tph_ani_win(dis_ntt_tph_tim_ani, ...
    siz_win, poi)
n_win = length(siz_win);
[~, n_ani] = size(dis_ntt_tph_tim_ani);
ave_dis_ntt_tph_ani_win = nan(n_ani, n_win);
for i = 1:n_win
    ave_dis_ntt_tph_ani_win(:, i) = mean(dis_ntt_tph_tim_ani(poi(i) - siz_win(i):poi(i), :))';
end
end
% tap
function [mea_dis_tap_tim_gro, sem_dis_tap_tim_gro, ave_dis_tap_win_cox_sam_ani, p_dis_tap_win] ...
    = ext_fre_tap_dat(dis_tap_gro, off, tim_tap_bin)
    [~, ~, dis_tap_nac_tim_ani, dis_tap_tph_tim_ani] = read_behaviour_EY_2(dis_tap_gro);
    %
    dis_tap_tph_tim_ani = dis_tap_tph_tim_ani + off;
    [mea_dis_ntt_tph_tim, ~, sem_dis_ntt_tph_tim] = com_sta(dis_tap_tph_tim_ani, 2);
    dis_tap_nac_tim_ani = dis_tap_nac_tim_ani + off;
    [mea_dis_ntt_nac_tim, ~, sem_dis_ntt_nac_tim] = com_sta(dis_tap_nac_tim_ani, 2);
    %%%%%%%%%%%%%%%%%%%%%%%%
    mea_dis_tap_tim_gro = [mea_dis_ntt_nac_tim(tim_tap_bin) mea_dis_ntt_tph_tim(tim_tap_bin)];
    sem_dis_tap_tim_gro = [sem_dis_ntt_nac_tim(tim_tap_bin) sem_dis_ntt_tph_tim(tim_tap_bin)];
    %
    [~, n_ani_nac] = size(dis_tap_nac_tim_ani);
    [~, n_ani_tph] = size(dis_tap_tph_tim_ani);
    n_win = 4;
    ave_dis_ntt_nac_ani_win = nan(n_ani_nac, n_win);
    ave_dis_ntt_tph_ani_win = nan(n_ani_tph, n_win);
    siz_win = 10;
    fir = 1800;
    poi = fir - 20;% end poi
    ave_dis_ntt_nac_ani_win(:, 1) = com_ave_dis_ntt_tph_ani_win(dis_tap_nac_tim_ani, siz_win, poi);
    ave_dis_ntt_tph_ani_win(:, 1) = com_ave_dis_ntt_tph_ani_win(dis_tap_tph_tim_ani, siz_win, poi);
    sti_ons_tri = [1800:60:2100 2340:60:2640 2880:60:3180]';
    siz_win = 10*ones(18, 1);
    poi = sti_ons_tri + 30;% end poi, for trial-ave !!!!
    ave_dis_ntt_nac_ani_tri = com_ave_dis_ntt_tph_ani_win(dis_tap_nac_tim_ani, siz_win, poi);
    ave_dis_ntt_tph_ani_tri = com_ave_dis_ntt_tph_ani_win(dis_tap_tph_tim_ani, siz_win, poi);
    global n_con n_tri_con
    for i = 1:n_con
        ave_dis_ntt_nac_ani_win(:, 1 + i) = ...
            mean(ave_dis_ntt_nac_ani_tri(:, (i - 1)*n_tri_con + 1:i*n_tri_con), 2);
        ave_dis_ntt_tph_ani_win(:, 1 + i) = ...
            mean(ave_dis_ntt_tph_ani_tri(:, (i - 1)*n_tri_con + 1:i*n_tri_con), 2);
    end
    p_dis_tap_win = nan(n_win, 1);
    for i = 1:n_win
        p_dis_tap_win(i) = ...
            lme(ave_dis_ntt_nac_ani_win(:, i), ave_dis_ntt_tph_ani_win(:, i));
    end
    ave_dis_ntt_sam_ani_win = {ave_dis_ntt_nac_ani_win; ave_dis_ntt_tph_ani_win};
    ave_dis_tap_win_cox_sam_ani = tra(ave_dis_ntt_sam_ani_win);
end
%%%%%%%%%%%%%%%%%%%%%%%%%
function ave_dis_ntt_win_cox_sam_ani = tra(ave_dis_ntt_sam_ani_win)
[~, n_win] = size(ave_dis_ntt_sam_ani_win{1});
n_sam = 2;
ave_dis_ntt_win_cox_sam_ani = cell(n_win, 1);
for i = 1:n_win
    for j = 1:n_sam
        ave_dis_ntt_win_cox_sam_ani{i, 1}{j} = ave_dis_ntt_sam_ani_win{j}(:, i);
    end
end
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% zan
function [y_pos_bas_sam_fra_ani, y_pos_bas_sam_ani, p_y_pos_bas_xsa, y_pos_con_sam_fra_ani, ...
    y_pos_win_con_sam_ani, p_y_pos_win_con_xsa, bas_spe_sam_bin_ani, p_bas_spe_xsa, ...
    spe_con_sam_bin_ani, p_spe_win_con_xsa, pro_sam_epo_row_col, foc_epo_cox_sam_ani, p_foc_epo] = ...
    ext_zan_dat(all_fish)
global n_sam win_len poi_bas_lim n_con n_tri_con n_fra poi_tri_lim dim_lef_rig n_win log_fra_win ...
    bin_bas_lim n_bin bin_tri_lim log_bin_win n_fun_epo
[n_ani_sam, ani_num_sam_ind, y_pos_sam_fra_ani, spe_sam_bin_ani] = ext_n_ani_sam(all_fish);
y_pos_bas_sam_fra_ani = cell(n_sam, 1);
y_pos_bas_sam_ani = cell(n_sam, 1);
for i = 1:n_sam
    n_ani = n_ani_sam(i);
    y_pos_bas_sam_fra_ani{i} = nan(win_len.zan.int + 1, n_ani);
    y_pos_bas_sam_ani{i} = nan(n_ani, 1);
    for j = 1:n_ani
        y_pos_bas_sam_fra_ani{i}(:, j) = y_pos_sam_fra_ani{i}(poi_bas_lim.zan.fra(1):...
            poi_bas_lim.zan.fra(2), j);
        y_pos_bas_sam_ani{i}(j) = mean(y_pos_bas_sam_fra_ani{i}(:, j));
    end
end
p_y_pos_bas_xsa = com_p_xsa(y_pos_bas_sam_ani);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
y_pos_con_sam_fra_ani = cell(n_con, n_sam);
y_pos_win_con_sam_ani = cell(n_win, n_con);
for i = 1:n_con
    for j = 1:n_sam
        n_ani = n_ani_sam(j);
        y_pos_con_sam_fra_ani{i, j} = nan(n_fra.zan.tri, n_ani);
        for k = 1:n_ani
            y_pos_fra_tri = nan(n_fra.zan.tri, n_tri_con.zan);
            for q = 1:n_tri_con.zan
                tri_ind = (i - 1)*n_tri_con.zan + q;
                y_pos_fra_tri(:, q) = y_pos_sam_fra_ani{j}...
                    (poi_tri_lim.zan.fra(tri_ind, 1):poi_tri_lim.zan.fra(tri_ind, 2), k);
            end
            y_pos_con_sam_fra_ani{i, j}(:, k) = mean(y_pos_fra_tri, dim_lef_rig);
        end
    end
end
%
for i = 1:n_win
    for j = 1:n_con
        y_pos_win_con_sam_ani{i, j} = cell(n_sam, 1);
        for k = 1:n_sam
            n_ani = n_ani_sam(k);
            y_pos_win_con_sam_ani{i, j}{k} = nan(n_ani, 1);
            for q = 1:n_ani
                y_pos_win_con_sam_ani{i, j}{k}(q) = mean(y_pos_con_sam_fra_ani{j, k}...
                    (log_fra_win.zan.tri(:, i), q));
            end
        end
    end
end
p_y_pos_win_con_xsa = com_p_var_win_con_xsa(y_pos_win_con_sam_ani);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% spe
bas_spe_sam_bin_ani = cell(n_sam, 1);
bas_spe_sam_ani = cell(n_sam, 1);
for i = 1:n_sam
    n_ani = n_ani_sam(i);
    bas_spe_sam_bin_ani{i} = nan(win_len.zan.siz + 1, n_ani);
    bas_spe_sam_ani{i} = nan(n_ani, 1);
    for j = 1:n_ani
        bas_spe_sam_bin_ani{i}(:, j) = spe_sam_bin_ani{i}(bin_bas_lim(1):bin_bas_lim(2), j);
        bas_spe_sam_ani{i}(j) = mean(bas_spe_sam_bin_ani{i}(:, j));
    end
end
p_bas_spe_xsa = com_p_xsa(bas_spe_sam_ani);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
spe_con_sam_bin_ani = cell(n_con, n_sam);
spe_sam_ani_bin_tri = cell(n_sam, 1);
for i = 1:n_con
    for j = 1:n_sam
        n_ani = n_ani_sam(j);
        spe_con_sam_bin_ani{i, j} = nan(n_bin.zan.tri, n_ani);
        spe_sam_ani_bin_tri{j} = cell(n_ani, 1);
        for k = 1:n_ani
            spe_bin_tri = nan(n_bin.zan.tri, n_tri_con.zan);
            for q = 1:n_tri_con.zan
                tri_ind = (i - 1)*n_tri_con.zan + q;
                spe_bin_tri(:, q) = spe_sam_bin_ani{j}(bin_tri_lim(tri_ind, 1):...
                    bin_tri_lim(tri_ind, 2), k);
            end
            spe_con_sam_bin_ani{i, j}(:, k) = mean(spe_bin_tri, dim_lef_rig);
            spe_sam_ani_bin_tri{j}{k} = spe_bin_tri;% depends on con!
        end
    end
end
spe_win_con_sam_ani = cell(n_win, n_con);
for i = 1:n_win
    for j = 1:n_con
        spe_win_con_sam_ani{i, j} = cell(n_sam, 1);
        for k = 1:n_sam
            n_ani = n_ani_sam(k);
            spe_win_con_sam_ani{i, j}{k} = nan(n_ani, 1);
            for q = 1:n_ani
                spe_win_con_sam_ani{i, j}{k}(q) = mean(spe_con_sam_bin_ani{j, k}...
                    (log_bin_win.zan.tri(:, i), q));
            end
        end
    end
end
p_spe_win_con_xsa = com_p_var_win_con_xsa(spe_win_con_sam_ani);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% pro
n_row = 21;
n_col = 14;
pro_sam_epo_row_col = cell(n_sam, n_fun_epo);
foc_epo_cox_sam_ani = cell(n_fun_epo, 1);
for i = 1:n_sam
    n_ani = n_ani_sam(i);
    pro_row_col_per_con = nan([n_row, n_col, 2, n_con]); % 2 for before and after
    for k = 1:n_con
       pro_row_col_per_ani = nan([n_row, n_col, 2, n_ani]);
       if k == 1
           foc_epo_cox_sam_ani{1, 1}{i} = nan(n_ani, 1);
       end
       foc_epo_cox_sam_ani{1 + k, 1}{i} = nan(n_ani, 1);
       for j = 1:n_ani
            pro_row_col_per_ani(:, :, :, j) = all_fish{ani_num_sam_ind{i}(j)}.avgstimPDF(:, :, :, k);
            if k == 1
                foc_epo_cox_sam_ani{1, 1}{i}(j) = ...
                    Focality_forVegard_EY(pro_row_col_per_ani(:, :, 1, j));
            end
            foc_epo_cox_sam_ani{1 + k, 1}{i}(j) = ...
                Focality_forVegard_EY(pro_row_col_per_ani(:, :, 2, j));
        end
       pro_row_col_per_con(:, :, 1, k) = nanmean(pro_row_col_per_ani(:, :, 1, :), 4); % before
       pro_row_col_per_con(:, :, 2, k) = nanmean(pro_row_col_per_ani(:, :, 2, :), 4); % after
       if k == 1
           pro_sam_epo_row_col{i, 1} = squeeze(pro_row_col_per_con(:, :, 1, k));
       end
       pro_sam_epo_row_col{i, 1 + k} = squeeze(pro_row_col_per_con(:, :, 2, k));
    end
end
p_foc_epo = nan(n_fun_epo, 1);
for i = 1:n_fun_epo
    p_foc_epo(i) = ranksum(foc_epo_cox_sam_ani{i, 1}{1}, foc_epo_cox_sam_ani{i, 1}{2});
end
end

function sti_ons_tri = ext_sti_ons_tri(vib_ons)
    global isi
    ibi = 240;
    n_blo = 3;
    n_tri_blo = 10;
    n_tri = n_blo*n_tri_blo;
    sti_ons_tri = nan(n_blo*n_tri_blo, 1);
    for i = 1:n_tri
        blo_num = ceil(i/n_tri_blo);
        sti_ons_tri(i) = vib_ons + (i - 1)*isi + (blo_num - 1)*ibi;
    end
end
%%%%%%%%%%%%%%%%%%%%% nov
function [mea_y_pos_tim_gro, sem_y_pos_tim_gro, y_pos_win_cox_sam_ani, p_y_pos_win, ...
    mea_spe_tim_gro, sem_spe_tim_gro, spe_win_cox_sam_ani, p_spe_win, ypc_con_sam_fra_ani, ...
    ypc_wix_con_sam_ani, p_ypc_wix_con_xsa, p_ypc_xsa, ypc_sam_ani, spe_sam_fra_ani] = ext_nov_dat...
    (all_fish, x_values, change_yposition_1, change_yposition_2)
exp = 'nov';
[n_ani_sam, ~, y_pos_sam_fra_ani, spe_sam_bin_ani, ~, spe_sam_fra_ani] = ext_n_ani_sam(all_fish, exp);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% ntt
global n_sam n_win ind_fra_win ind_bin_win las_bin n_con log_tri_con n_fra
%%%%%%%%%%%% y pos
mea_y_pos_tim_gro = nan(n_fra.nov.ses, n_sam);
sem_y_pos_tim_gro = nan(n_fra.nov.ses, n_sam);
dim = 2;
for i = 1:n_sam
    [mea_y_pos_tim_gro(:, i), ~, sem_y_pos_tim_gro(:, i), ~] = com_sta(y_pos_sam_fra_ani{i}...
        (1:n_fra.nov.ses, :), dim);
end
%
y_pos_win_cox_sam_ani = cell(n_win.ntt, 1);
p_y_pos_win = nan(n_win.ntt, 1);
for i = 1:n_win.ntt
    y_pos_win_cox_sam_ani{i, 1} = cell(n_sam, 1);
    for j = 1:n_sam
        y_pos_win_cox_sam_ani{i, 1}{j} = nan(n_ani_sam(j), 1);
        for k = 1:n_ani_sam(j)
            y_pos_win_cox_sam_ani{i, 1}{j}(k) = mean(y_pos_sam_fra_ani{j}(ind_fra_win(:, i), k));
        end
    end
    p_y_pos_win(i) = lme(y_pos_win_cox_sam_ani{i, 1}{1}, y_pos_win_cox_sam_ani{i, 1}{2});%!!!
end
%%%%%%%%%%%% dis
%%%%%%%%%%%% spe
mea_spe_tim_gro = nan(las_bin, n_sam); % for ntt
sem_spe_tim_gro = nan(las_bin, n_sam);
dim = 2;
for i = 1:n_sam
    [mea_spe_tim_gro(:, i), ~, sem_spe_tim_gro(:, i), ~] = com_sta(spe_sam_bin_ani{i}...
        (1:las_bin, :), dim);
end
spe_win_cox_sam_ani = cell(n_win.ntt, 1);
p_spe_win = nan(n_win.ntt, 1);
for i = 1:n_win.ntt
    spe_win_cox_sam_ani{i, 1} = cell(n_sam, 1);
    for j = 1:n_sam
        spe_win_cox_sam_ani{i, 1}{j} = nan(n_ani_sam(j), 1);
        for k = 1:n_ani_sam(j)
            spe_win_cox_sam_ani{i, 1}{j}(k) = mean(spe_sam_bin_ani{j}(ind_bin_win(:, i), k));% ntt
        end
    end
    p_spe_win(i) = lme(spe_win_cox_sam_ani{i, 1}{1}, spe_win_cox_sam_ani{i, 1}{2});%!!!
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% tap
[n_fra_ann, ~, ~] = size(change_yposition_1);
% y position change
ypc_con_sam_fra_ani = cell(n_con, n_sam);
for i = 1:n_con
    for j = 1:n_sam
        ypc_con_sam_fra_ani{i, j} = nan(n_fra_ann, n_ani_sam(j));
        if j == 1
            ypc_fra_ani_tri = change_yposition_2;%%%%!!!!!!!!!!!!!!!!!!!!!!!!!!!
        elseif j == 2
            ypc_fra_ani_tri = change_yposition_1;
        end
        for k = 1:n_ani_sam(j)
            ypc_con_sam_fra_ani{i, j}(:, k) = squeeze(mean(ypc_fra_ani_tri...
                (:, k, log_tri_con.zan(:, i)), 3));
        end
    end
end
%
ypc_wix_con_sam_ani = cell(1, n_con);
tim_fra = x_values';
log_fra = tim_fra > 45 & tim_fra <= 55;
for i = 1:n_con
    ypc_wix_con_sam_ani{1, i} = cell(n_sam, 1);
    for j = 1:n_sam
        ypc_wix_con_sam_ani{1, i}{j} = nan(n_ani_sam(j), 1);
        for k = 1:n_ani_sam(j)
            ypc_wix_con_sam_ani{1, i}{j}(k) = mean(ypc_con_sam_fra_ani{i, j}(log_fra, k));
        end
    end
end
p_ypc_wix_con_xsa = com_p_var_win_con_xsa(ypc_wix_con_sam_ani);
%%%%%%%%%%%%%%%%%%%%%
ypc_sam_fra_ani = cell(1, n_sam);
for j = 1:n_sam
    ypc_sam_fra_ani{1, j} = nan(n_fra_ann, n_ani_sam(j));
    if j == 1
        ypc_fra_ani_tri = change_yposition_2;%%%%!!!!!!!!!!!!!!!!!!!!!!!!!!!
    elseif j == 2
        ypc_fra_ani_tri = change_yposition_1;
    end
    for k = 1:n_ani_sam(j)
        ypc_sam_fra_ani{1, j}(:, k) = squeeze(mean(ypc_fra_ani_tri(:, k, :), 3));
    end
end
%
ypc_sam_ani = cell(n_sam, 1);
log_fra = tim_fra > 50 & tim_fra <= 55;
for j = 1:n_sam
    ypc_sam_ani{j} = nan(n_ani_sam(j), 1);
    for k = 1:n_ani_sam(j)
        ypc_sam_ani{j}(k) = mean(ypc_sam_fra_ani{1, j}(log_fra, k));
    end
end
p_ypc_xsa = com_p_xsa(ypc_sam_ani);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% spe
% spe_con_sam_fra_ani = 
% var_rox_cox_row_col = ini_cel_arr(n_con, n_sam, n_row, n_col);
end
%%%%%%%%%%%%%%%%%%%%% two
function [mea_y_pos_tim_gro, sem_y_pos_tim_gro, y_pos_win_cox_sam_ani, p_y_pos_win_cox_xsa, ...
    p_ypc_xsa, ypc_sam_ani, tim_fra, p_y_pos_xsa, y_pos_sam_ani, ypc_sam_ani_tri, ...
    p_abs_ypc_xsa, abs_ypc_sam_ani, abs_ypc_sam_ani_tri, foc_win_cox_sam_ani, p_foc_win_cox_xsa, ...
    p_spx_win_cox_xsa, spx_win_cox_sam_ani, spx_win_cox_sam_ani_tri] = ...
    ext_two_dat(all_fish, x_values, change_yposition_1, change_yposition_2, change_yposition_3, ...
    yposition_1, yposition_2, yposition_3, pro_sam_row_col_win_ani, x_values_velo, change_velo_1, ...
    change_velo_2, change_velo_3)
% win_len.ntt.sec
exp = 'two';
[n_ani_sam, ~, y_pos_sam_fra_ani] = ext_n_ani_sam(all_fish, exp);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% ntt - incomplete !!! maybe
t = all_fish{1, 1}.t; % time from excel file
fra_rat.zan = 15;
n_fra_bef = round(fra_rat.zan*t(1)) - 1;
n_fra = size(t, 1) - 50; % double check why you floor it, k: excluding the last 50 frames
tim_fra = [nan(n_fra_bef, 1); t(1:n_fra)];
n_fra = n_fra + n_fra_bef;
n_sam = 3;
mea_y_pos_tim_gro = nan(n_fra, n_sam);
sem_y_pos_tim_gro = nan(n_fra, n_sam);
dim = 2;
for i = 1:n_sam
    [mea_y_pos_tim_gro(:, i), ~, sem_y_pos_tim_gro(:, i), ~] = com_sta(y_pos_sam_fra_ani{i}...
        (1:n_fra, :), dim);
end
%
n_win.ntt = 2;
y_pos_win_cox_sam_ani = cell(n_win.ntt, 1);
con_fil = matfile('\\home.ansatt.ntnu.no\kadiram\Documents\MATLAB\con_esp.mat');
log_fra_win = con_fil.log_fra_win;
foc_win_cox_sam_ani = cell(n_win.ntt, 1);
for i = 1:n_win.ntt
    y_pos_win_cox_sam_ani{i, 1} = cell(n_sam, 1);
    foc_win_cox_sam_ani{i, 1} = cell(n_sam, 1);
    for j = 1:n_sam
        y_pos_win_cox_sam_ani{i, 1}{j} = nan(n_ani_sam(j), 1);
        foc_win_cox_sam_ani{i, 1}{j} = nan(n_ani_sam(j), 1);
        for k = 1:n_ani_sam(j)
            y_pos_win_cox_sam_ani{i, 1}{j}(k) = mean(y_pos_sam_fra_ani{j}(log_fra_win.ntt...
                (:, i), k));
            foc_win_cox_sam_ani{i, 1}{j}(k) = Focality_forVegard_EY(pro_sam_row_col_win_ani{j}...
                (:, :, i, k));
        end
    end
end
p_y_pos_win_cox_xsa = com_p_var_win_con_xsa(y_pos_win_cox_sam_ani);
p_foc_win_cox_xsa = com_p_var_win_con_xsa(foc_win_cox_sam_ani);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% vibration
win_lim = [30 40];
[p_ypc_xsa, ypc_sam_ani, ypc_sam_ani_tri] = ext_y_dat(all_fish, x_values, change_yposition_1, ...
    change_yposition_2, change_yposition_3, win_lim);
[p_abs_ypc_xsa, abs_ypc_sam_ani, abs_ypc_sam_ani_tri] = ext_y_dat(all_fish, x_values, ...
    per_ful_wav_rec(change_yposition_1), per_ful_wav_rec(change_yposition_2), ...
    per_ful_wav_rec(change_yposition_3), win_lim);
[p_y_pos_xsa, y_pos_sam_ani] = ext_y_dat(all_fish, x_values, yposition_1, yposition_2, yposition_3, ...
    win_lim);
%
n_win = 2;
p_spx_win_cox_xsa.lme = cell(n_win, 1);
p_spx_win_cox_xsa.rst = cell(n_win, 1);
spx_win_cox_sam_ani = cell(n_win, 1);
spx_win_cox_sam_ani_tri = cell(n_win, 1);
win_lim = [60 65];
[p_spx_xsa, spx_win_cox_sam_ani{1, 1}, spx_win_cox_sam_ani_tri{1, 1}] = ext_y_dat...
    (all_fish, x_values_velo, change_velo_1, change_velo_2, change_velo_3, win_lim);
p_spx_win_cox_xsa.lme{1, 1} = p_spx_xsa.lme;
p_spx_win_cox_xsa.rst{1, 1} = p_spx_xsa.rst;
win_lim = [65 90];
[p_spx_xsa, spx_win_cox_sam_ani{2, 1}, spx_win_cox_sam_ani_tri{2, 1}] = ext_y_dat...
    (all_fish, x_values_velo, change_velo_1, change_velo_2, change_velo_3, win_lim);
p_spx_win_cox_xsa.lme{2, 1} = p_spx_xsa.lme;
p_spx_win_cox_xsa.rst{2, 1} = p_spx_xsa.rst;
end

function [p_ypc_xsa, ypc_sam_ani, ypc_sam_ani_tri] = ext_y_dat(all_fish, x_values, ...
    change_yposition_1, change_yposition_2, change_yposition_3, win_lim)
exp = 'two';
[n_ani_sam, ~, ~] = ext_n_ani_sam(all_fish, exp);
[n_fra_ann, ~, ~] = size(change_yposition_1);
% y position change
n_sam = 3;
ypc_sam_fra_ani = cell(1, n_sam);
ypc_sam_ani_tri = cell(n_sam, 1);
tim_tri_fra = x_values';
log_fra = tim_tri_fra > win_lim(1) & tim_tri_fra <= win_lim(2);
for j = 1:n_sam
    n_ani = n_ani_sam(j);
    ypc_sam_fra_ani{1, j} = nan(n_fra_ann, n_ani);
    if j == 1
        ypc_fra_ani_tri = change_yposition_2;%%%%!!!!!!!!!!!!!!!!!!!!!!!!!! sham
    elseif j == 2
        ypc_fra_ani_tri = change_yposition_1;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% abl
    elseif j == 3
        ypc_fra_ani_tri = change_yposition_3;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% mtz
    end
    for k = 1:n_ani
        ypc_sam_fra_ani{1, j}(:, k) = squeeze(mean(ypc_fra_ani_tri(:, k, :), 3));
    end
    ypc_sam_ani_tri{j} = squeeze(mean(ypc_fra_ani_tri(log_fra, :, :), 1));
end
%
ypc_sam_ani = cell(n_sam, 1);
for j = 1:n_sam
    ypc_sam_ani{j} = nan(n_ani_sam(j), 1);
    for k = 1:n_ani_sam(j)
        ypc_sam_ani{j}(k) = mean(ypc_sam_fra_ani{1, j}(log_fra, k));
    end
end
p_ypc_xsa = com_p_xsa(ypc_sam_ani);%%%%%%%%%%%%%%!!!!!!!!!!!!!!!!!!!!!!!!!!
end

function fra_num_fra_win = cal_ind_fra_win(win_len)
% win_len.sec
% win_len in sec, n_fra in the window, n_int in the window
n_win.ntt = 2;
fra_rat.zan = 15;
n_fra.nov.ntt = fra_rat.zan*win_len;
%
fra_num_fra_win = nan(n_fra.nov.ntt, n_win.ntt);% indices for the ntt windows
fra_num_fra_win(:, 1) = (fra_rat.zan*60 + 1:fra_rat.zan*60 + n_fra.nov.ntt)';
fra_num_fra_win(:, 2) = (fra_rat.zan*24*60 - n_fra.nov.ntt + 1:fra_rat.zan*24*60)';
end

function [n_ani_sam, ani_num_sam_ind, y_pos_sam_fra_ani] = ext_n_ani_sam(all_fish, exp)
if strcmp(exp, 'zan')
    proper_exp = [10:19 21];
    n_sam  = 2;
elseif strcmp(exp, 'nov')
    proper_exp = 1:12;
    n_sam  = 2;
elseif strcmp(exp, 'two')
    proper_exp = 1:28;
    n_sam  = 3;
end
ani_num_two_ind = [];
ani_num_one_ind = [];
ani_num_thr_ind = [];
for fish = 1:size(all_fish, 1)
    if ismember(all_fish{fish, 1}.exp, proper_exp)
        if all_fish{fish, 1}.stability == 1
            if all_fish{fish, 1}.selected == 1
                if all_fish{fish, 1}.group == 1 % ablated
                    ani_num_two_ind = [ani_num_two_ind; all_fish{fish, 1}.realNum]; % two !
                elseif all_fish{fish, 1}.group == 2 % control
                    ani_num_one_ind = [ani_num_one_ind; all_fish{fish, 1}.realNum];
                elseif all_fish{fish, 1}.group == 3 % mtz
                    ani_num_thr_ind = [ani_num_thr_ind; all_fish{fish, 1}.realNum];
                end
            end
        end
    end
end
con_fil = matfile('\\home.ansatt.ntnu.no\kadiram\Documents\MATLAB\con_esp.mat');
n_fra_bef = con_fil.n_fra_bef;
cri_ind = con_fil.cri_ind;
n_ani_sam = nan(n_sam, 1);
n_ani_sam(1) = length(ani_num_one_ind);
n_ani_sam(2) = length(ani_num_two_ind);
if strcmp(exp, 'zan') || strcmp(exp, 'nov')
    ani_num_sam_ind = {ani_num_one_ind; ani_num_two_ind};
elseif strcmp(exp, 'two')
    n_ani_sam(3) = length(ani_num_thr_ind);
    ani_num_sam_ind = {ani_num_one_ind; ani_num_two_ind; ani_num_thr_ind};
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% y_pos_sam_fra_ani
numExp = size(all_fish, 1)/6;
for i = 1:numExp
    lowerRow(i*3 - (3 - 1):i*3) = [4 5 6] + 6*(i - 1); % make an array for the lower row of ROIs
end
y = all_fish{ani_num_sam_ind{1}(1), 1}.y;
len_y_trace = size(y, 1) - 50; % double check why you floor it, k: excluding the last 50 frames
collected_yposition_1 = nan([len_y_trace, n_ani_sam(1)]);
collected_yposition_2 = nan([len_y_trace, n_ani_sam(2)]);
if strcmp(exp, 'two')
    collected_yposition_3 = nan([len_y_trace, n_ani_sam(3)]);
end
ind_one = 0;
ind_two = 0;
ind_thr = 0;
n_ani = size(all_fish, 1);
for fish = 1:n_ani
    if ismember(fish, ani_num_sam_ind{1})
        ind_one = ind_one + 1;
        if ismember(fish, lowerRow)
            y = all_fish{fish, 1}.y;
            temp_y = -y; 
            collected_yposition_1(:, ind_one) = temp_y(1:len_y_trace) + 168;
        else
            y = all_fish{fish, 1}.y;
            temp_y = -y;
            collected_yposition_1(:, ind_one) = temp_y(1:len_y_trace) + 26;
        end
    end
    %
    if ismember(fish, ani_num_sam_ind{2})
        ind_two = ind_two + 1;
       if ismember(fish, lowerRow)
           y = all_fish{fish, 1}.y;
           temp_y = -y; 
           collected_yposition_2(:, ind_two) = temp_y(1:len_y_trace) + 168;
       else
           y = all_fish{fish, 1}.y;
           temp_y = -y;
           collected_yposition_2(:, ind_two) = temp_y(1:len_y_trace) + 26;
       end
    end
    %%%%%%%%%%%%%%%
    if strcmp(exp, 'two') && ismember(fish, ani_num_sam_ind{3})
        ind_thr = ind_thr + 1;
       if ismember(fish, lowerRow)
           y = all_fish{fish, 1}.y;
           temp_y = -y; 
           collected_yposition_3(:, ind_thr) = temp_y(1:len_y_trace) + 168;
       else
           y = all_fish{fish, 1}.y;
           temp_y = -y;
           collected_yposition_3(:, ind_thr) = temp_y(1:len_y_trace) + 26;
       end
    end
end
if strcmp(exp, 'zan') || strcmp(exp, 'nov')
    y_pos_sam_fra_ani = {[nan(n_fra_bef.(exp), n_ani_sam(1)); ...
    collected_yposition_1(cri_ind.(exp):end, :)]; ...
    [nan(n_fra_bef.(exp), n_ani_sam(2)); collected_yposition_2(cri_ind.(exp):end, :)]};
elseif strcmp(exp, 'two')
    y_pos_sam_fra_ani = {[nan(n_fra_bef.(exp), n_ani_sam(1)); ...
    collected_yposition_1(cri_ind.(exp):end, :)]; ...
    [nan(n_fra_bef.(exp), n_ani_sam(2)); collected_yposition_2(cri_ind.(exp):end, :)]; ...
    [nan(n_fra_bef.(exp), n_ani_sam(3)); collected_yposition_3(cri_ind.(exp):end, :)]};
end
end

function [mea_spe_tim_gro, sem_spe_tim_gro, spe_win_cox_sam_ani, p_spe_win_cox_xsa] = ...
    ext_spe_dat(all_fish)
% win_len.ntt.sec
exp = 'two';
[n_ani_sam, ~, spe_sam_fra_ani] = ext_spe(all_fish, exp);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% ntt - incomplete !!! maybe
t = all_fish{1, 1}.t; % time from excel file
fra_rat.zan = 15;
n_fra_bef = round(fra_rat.zan*t(1)) - 1;
n_fra = size(t, 1) - 50; % double check why you floor it, k: excluding the last 50 frames
n_fra = n_fra + n_fra_bef;
n_sam = 3;
mea_spe_tim_gro = nan(n_fra, n_sam);
sem_spe_tim_gro = nan(n_fra, n_sam);
dim = 2;
for i = 1:n_sam
    [mea_spe_tim_gro(:, i), ~, sem_spe_tim_gro(:, i), ~] = com_sta(spe_sam_fra_ani{i}...
        (1:n_fra, :), dim);
end
%
n_win.ntt = 2;
spe_win_cox_sam_ani = cell(n_win.ntt, 1);
con_fil = matfile('\\home.ansatt.ntnu.no\kadiram\Documents\MATLAB\con_esp.mat');
log_fra_win = con_fil.log_fra_win;
for i = 1:n_win.ntt
    spe_win_cox_sam_ani{i, 1} = cell(n_sam, 1);
    for j = 1:n_sam
        spe_win_cox_sam_ani{i, 1}{j} = nan(n_ani_sam(j), 1);
        for k = 1:n_ani_sam(j)
            spe_win_cox_sam_ani{i, 1}{j}(k) = mean(spe_sam_fra_ani{j}(log_fra_win.ntt...
                (:, i), k));
        end
    end
end
p_spe_win_cox_xsa = com_p_var_win_con_xsa(spe_win_cox_sam_ani);
end

function [n_ani_sam, ani_num_sam_ind, spe_sam_fra_ani] = ext_spe(all_fish, exp)
if strcmp(exp, 'zan')
    proper_exp = [10:19 21];
    n_sam  = 2;
elseif strcmp(exp, 'nov')
    proper_exp = 1:12;
    n_sam  = 2;
elseif strcmp(exp, 'two')
    proper_exp = 1:28;
    n_sam  = 3;
end
ani_num_two_ind = [];
ani_num_one_ind = [];
ani_num_thr_ind = [];
for fish = 1:size(all_fish, 1)
    if ismember(all_fish{fish, 1}.exp, proper_exp)
        if all_fish{fish, 1}.stability == 1
            if all_fish{fish, 1}.selected == 1
                if all_fish{fish, 1}.group == 1 % ablated
                    ani_num_two_ind = [ani_num_two_ind; all_fish{fish, 1}.realNum]; % two !
                elseif all_fish{fish, 1}.group == 2 % control
                    ani_num_one_ind = [ani_num_one_ind; all_fish{fish, 1}.realNum];
                elseif all_fish{fish, 1}.group == 3 % mtz
                    ani_num_thr_ind = [ani_num_thr_ind; all_fish{fish, 1}.realNum];
                end
            end
        end
    end
end
con_fil = matfile('\\home.ansatt.ntnu.no\kadiram\Documents\MATLAB\con_esp.mat');
n_fra_bef = con_fil.n_fra_bef;
cri_ind = con_fil.cri_ind;
n_ani_sam = nan(n_sam, 1);
n_ani_sam(1) = length(ani_num_one_ind);
n_ani_sam(2) = length(ani_num_two_ind);
if strcmp(exp, 'zan') || strcmp(exp, 'nov')
    ani_num_sam_ind = {ani_num_one_ind; ani_num_two_ind};
elseif strcmp(exp, 'two')
    n_ani_sam(3) = length(ani_num_thr_ind);
    ani_num_sam_ind = {ani_num_one_ind; ani_num_two_ind; ani_num_thr_ind};
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% y_pos_sam_fra_ani
numExp = size(all_fish, 1)/6;
for i = 1:numExp
    lowerRow(i*3 - (3 - 1):i*3) = [4 5 6] + 6*(i - 1); % make an array for the lower row of ROIs
end
y = all_fish{ani_num_sam_ind{1}(1), 1}.y;
len_y_trace = size(y, 1) - 50; % double check why you floor it, k: excluding the last 50 frames
collected_spe_1 = nan([len_y_trace, n_ani_sam(1)]);
collected_spe_2 = nan([len_y_trace, n_ani_sam(2)]);
if strcmp(exp, 'two')
    collected_spe_3 = nan([len_y_trace, n_ani_sam(3)]);
end
ind_one = 0;
ind_two = 0;
ind_thr = 0;
n_ani = size(all_fish, 1);
for fish = 1:n_ani
    speed_over_time = [0 all_fish{fish, 1}.speed_over_time]';
    if ismember(fish, ani_num_sam_ind{1})
        ind_one = ind_one + 1;
        collected_spe_1(:, ind_one) = speed_over_time(1:len_y_trace);
    end
    %
    if ismember(fish, ani_num_sam_ind{2})
       ind_two = ind_two + 1;
       collected_spe_2(:, ind_two) = speed_over_time(1:len_y_trace);
    end
    %%%%%%%%%%%%%%%
    if strcmp(exp, 'two') && ismember(fish, ani_num_sam_ind{3})
       ind_thr = ind_thr + 1;
       collected_spe_3(:, ind_thr) = speed_over_time(1:len_y_trace);
    end
end
if strcmp(exp, 'zan') || strcmp(exp, 'nov')
    spe_sam_fra_ani = {[nan(n_fra_bef.(exp), n_ani_sam(1)); ...
    collected_spe_1(cri_ind.(exp):end, :)]; ...
    [nan(n_fra_bef.(exp), n_ani_sam(2)); collected_spe_2(cri_ind.(exp):end, :)]};
elseif strcmp(exp, 'two')
    spe_sam_fra_ani = {[nan(n_fra_bef.(exp), n_ani_sam(1)); ...
    collected_spe_1(cri_ind.(exp):end, :)]; ...
    [nan(n_fra_bef.(exp), n_ani_sam(2)); collected_spe_2(cri_ind.(exp):end, :)]; ...
    [nan(n_fra_bef.(exp), n_ani_sam(3)); collected_spe_3(cri_ind.(exp):end, :)]};
end
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% data neural
function [sig_lev, kld_xsa] = com_kld(per_pai_reg_sam_bin_ani, ind_reg, ind_sam)
kld_xsa = nan(1, 2);
global cor_coe_bin
[per_pai_sha_bin, sig_lev] = com_sig_lev(per_pai_reg_sam_bin_ani{ind_reg, ind_sam(1)});
kld_xsa(1) = kldiv(cor_coe_bin, per_pai_sha_bin, ...
    mean(per_pai_reg_sam_bin_ani{ind_reg, 1}, 2, 'omitnan')/100 + eps);
kld_xsa(2) = kldiv(cor_coe_bin, per_pai_sha_bin, ...
    mean(per_pai_reg_sam_bin_ani{ind_reg, 2}, 2, 'omitnan')/100 + eps);
end

function dif_ske_xre_sam = com_dif_ske_xre_sam(ske_xre_sam_ani, ind_sam)
global n_cro_tot
ref_ske_xre = nan(n_cro_tot, 1);
[~, n_sam] = size(ske_xre_sam_ani);
dif_ske_xre_sam = nan(n_cro_tot, n_sam - 1);
for i = 1:n_cro_tot
    ref_ske_xre(i) = mean(ske_xre_sam_ani{i, ind_sam(1)}, 'omitnan');
    dif_ske_xre_sam(i, 1) = ...
        mean(ske_xre_sam_ani{i, ind_sam(2)}, 'omitnan') - ref_ske_xre(i);
    if n_sam == 3
        dif_ske_xre_sam(i, 2) = ...
            mean(ske_xre_sam_ani{i, ind_sam(3)}, 'omitnan') - ref_ske_xre(i);
    end
end
end

function [act_reg_sam_con_fra_cel, act_reg_sam_fra_sta_con] = ext_act_reg_sam_con_fra_cel(obj, ...
    fie_cas_num)
global n_reg_for n_con
n_cas = length(fie_cas_num);
act_sam_reg_con_fra_cel = cell(obj.n_sam, 1);
act_sam_reg_fra_sta_con = cell(obj.n_sam, 1);
for i = 1:obj.n_sam
    sam_fil = matfile(obj.fil_pat_sam(i));
    act_sam_reg_con_fra_cel{i} = sam_fil.act_reg_con_fra_cel;
    act_sam_reg_fra_sta_con{i} = sam_fil.act_reg_fra_sta_con;
end
% initialization
mul_sam_fil = matfile(obj.fil_pat_mul_sam);
if isprop(mul_sam_fil, 'act_reg_sam_con_fra_cel') && isprop(mul_sam_fil, 'act_reg_sam_fra_sta_con')
    act_reg_sam_con_fra_cel = mul_sam_fil.act_reg_sam_con_fra_cel;
    act_reg_sam_fra_sta_con = mul_sam_fil.act_reg_sam_fra_sta_con;
else
    act_reg_sam_con_fra_cel = [];
    act_reg_sam_fra_sta_con = [];
end
for j = 1:n_cas
    var_reg_sam_con_fra_cel = cell(n_reg_for, 1);
    var_reg_sam_fra_sta_con = cell(n_reg_for, 1);
    for k = 1:n_reg_for
        var_reg_sam_con_fra_cel{k} = cell(obj.n_sam, n_con);
        var_reg_sam_fra_sta_con{k} = cell(obj.n_sam, 1);
        for i = 1:obj.n_sam
            act_reg_con_fra_cel = getfield(act_sam_reg_con_fra_cel{i}, fie_cas_num{j}{:});
            var_reg_sam_con_fra_cel{k}(i, :) = act_reg_con_fra_cel(k, :);
            %
            act_reg_fra_sta_con = getfield(act_sam_reg_fra_sta_con{i}, fie_cas_num{j}{:});
            var_reg_sam_fra_sta_con{k}{i} = act_reg_fra_sta_con{k};
        end
    end
    act_reg_sam_con_fra_cel = ...
        setfield(act_reg_sam_con_fra_cel, fie_cas_num{j}{:}, var_reg_sam_con_fra_cel);
    act_reg_sam_fra_sta_con = ...
        setfield(act_reg_sam_fra_sta_con, fie_cas_num{j}{:}, var_reg_sam_fra_sta_con);
end
end

function [pcc_reg_sam_xri_xri, pcc_ave_reg_con_sam_ani, p_pcc_reg_con_xsa, ...
    euc_dis_reg_sam_xri_xri, euc_dis_ave_reg_con_sam_ani, p_euc_dis_reg_con_xsa] = ...
    ext_pcc_reg_sam_xri_xri(fil_pat_sam, fie_num)
global n_reg_for n_con
n_sam = length(fil_pat_sam);
pcc_reg_sam_xri_xri = cell(n_reg_for, n_sam);
pcc_ave_reg_con_sam_ani = cell(n_reg_for, n_con);
%
euc_dis_reg_sam_xri_xri = cell(n_reg_for, n_sam);
euc_dis_ave_reg_con_sam_ani = cell(n_reg_for, n_con);
for k = 1:n_reg_for
    for i = 1:n_sam
        sam_fil = matfile(fil_pat_sam(i));
        pcc_mea_reg_xri_xri = sam_fil.pcc_mea_reg_xri_xri;
        pcc_mea_reg_xri_xri = ext_var_fie(pcc_mea_reg_xri_xri, fie_num);
        pcc_reg_sam_xri_xri{k, i} = pcc_mea_reg_xri_xri{k};
        %
        euc_dis_mea_reg_xri_xri = sam_fil.euc_dis_mea_reg_xri_xri;
        euc_dis_mea_reg_xri_xri = ext_var_fie(euc_dis_mea_reg_xri_xri, fie_num);
        euc_dis_reg_sam_xri_xri{k, i} = euc_dis_mea_reg_xri_xri{k};
    end
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    for i = 1:n_con
        for j = 1:n_sam
            sam_fil = matfile(fil_pat_sam(j));
            pcc_ave_reg_con_ani = sam_fil.pcc_ave_reg_con_ani;
            pcc_ave_reg_con_ani = ext_var_fie(pcc_ave_reg_con_ani, fie_num);
            pcc_ave_reg_con_sam_ani{k, i}{j} = pcc_ave_reg_con_ani{k, i};
            %
            euc_dis_ave_reg_con_ani = sam_fil.euc_dis_ave_reg_con_ani;
            euc_dis_ave_reg_con_ani = ext_var_fie(euc_dis_ave_reg_con_ani, fie_num);
            euc_dis_ave_reg_con_sam_ani{k, i}{j} = euc_dis_ave_reg_con_ani{k, i};
        end
    end
end
p_pcc_reg_con_xsa = com_p_var_win_con_xsa(pcc_ave_reg_con_sam_ani);
p_euc_dis_reg_con_xsa = com_p_var_win_con_xsa(euc_dis_ave_reg_con_sam_ani);
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% plot freely-moving
function h_fig = plo_ntt(tim_uni, mea_val_pos_tim_gro, sem_val_pos_tim_gro, ...
    val_pos_win_cox_sam_ani, p_val_pos_win, pro_ntt_sam_win_row_col, foc_ntt_win_cox_sam_ani, ...
    p_foc_ntt_win, y_lab)
[h_fig, fig_wid, fig_hei] = fig;
n_row = 3;
n_col = 3;
gap_ver_row = [0.070 0.020 0.050];
gap_hor_row_col = [0.030 0.030 0.030; ...
    0.010 0.100 0.030; ...
    0.010 0.100 0.030];
mar_bot = 0.040;
mar_top = 0.030;
mar_lef = 0.030;
mar_rig = 0.001;
global col_sam fon_siz mar_siz gro_two_cro
asp_rat_bar = 0.5;
asp_rat_are = 11.5/8;
asp_rat_axe = [asp_rat_are asp_rat_bar asp_rat_bar ...
    asp_rat_are asp_rat_are asp_rat_bar ...
    asp_rat_are asp_rat_are asp_rat_bar];
wid = false;
sca = 0.900;
sca_axe = [1 1 1 ...
    sca sca 1 ...
    sca sca 1];
n_pix_ext = 0;
[hax_sub, pos_axe, hei_axe, dis_asp_rat, las_pix, rat_wid] = tight_subplot_gen(n_row, n_col, ...
    gap_ver_row, gap_hor_row_col, mar_bot, mar_top, mar_lef, mar_rig, asp_rat_axe, fig_wid, fig_hei, ...
    wid, sca_axe, n_pix_ext);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% distance
hax = hax_sub(1);
log_smo = false;
plo_sha(hax, tim_uni, mea_val_pos_tim_gro, sem_val_pos_tim_gro, col_sam, log_smo)
dur = 4;
siz_win = dur*[60; 60];
poi = 60*[1 + dur 29];
col_con = ["ash grey"; "ash grey"];
plo_sti_sub_tri(hax, siz_win, poi, col_con)
xlabel(hax, 'Time (s)')
ylabel(hax, y_lab)
xtl_abl = ['\color[rgb]{1,0,0} ', 'Abl'];
%
linkaxes(hax_sub(2:3))
y_min = inf;
y_max = -inf;
hax = hax_sub(2);
ind_con = 1;
ind_win = 1;
ind_sam = [1 2];
dat = true;
[h_plo, n_uni_sam] = plo_dat_err_xsa(hax, val_pos_win_cox_sam_ani, ind_win, ind_con, mar_siz, ...
    col_sam, ind_sam, dat);
[y_min, y_max, hax] = adj_y(hax, y_min, y_max);
hax.XTickLabels = {'Con'; ['\color[rgb]{1,0,0} ', 'Abl']};
%
hax = hax_sub(3);
ind_con = 1;
ind_win = 2;
[h_plo, n_uni_sam] = plo_dat_err_xsa(hax, val_pos_win_cox_sam_ani, ind_win, ind_con, mar_siz, ...
    col_sam, ind_sam, dat);
[y_min, y_max, hax] = adj_y(hax, y_min, y_max);
hax.YAxis.Visible = 'off';
hax.XTickLabels = {'Con'; xtl_abl};
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% sig
hax = hax_sub(2);
axes(hax)
off_non = 0.070;
y_lim_pre = ylim;
mou = 0.030;
sep = off_non + mou + 0.040;
ext_hei = -(sep + mou);
ind_win = 1;
[~, y_lim] = sigstar_lim(hax, gro_two_cro, fon_siz, off_non, y_lim_pre, sep, mou, ext_hei, ...
    p_val_pos_win(ind_win));
[y_min, y_max, hax] = adj_y(hax, y_min, y_max);
hax.FontSize = fon_siz;
title(hax, 'Early', 'FontWeight','normal')
%
hax = hax_sub(3);
axes(hax)
y_lim_pre = ylim;
ind_win = 2;
[~, y_lim] = sigstar_lim(hax, gro_two_cro, fon_siz, off_non, y_lim_pre, sep, mou, ext_hei, ...
    p_val_pos_win(ind_win));
[y_min, y_max, hax] = adj_y(hax, y_min, y_max);
hax.FontSize = fon_siz;
title(hax, 'Late', 'FontWeight','normal')
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% heatmaps
ind_var_col = nan;
hax = hax_sub(4);
ima(hax, ind_var_col, pro_ntt_sam_win_row_col{1, 1})
colormap(jet)
clim([0 0.01])
hax.XTickLabels = [];
hax.YTickLabels = [];
ylabel(hax, 'Early')
title(hax, 'Control', FontWeight='normal')
%
hax = hax_sub(5);
axes(hax)
ima(hax, ind_var_col, pro_ntt_sam_win_row_col{2, 1})
colormap(jet)
clim([0 0.01])
hax.XTickLabels = [];
hax.YTickLabels = [];
title(hax, 'Ablated', FontWeight='normal', Color = 'r')
%
hax = hax_sub(7);
axes(hax)
ima(hax, ind_var_col, pro_ntt_sam_win_row_col{1, 2})
colormap(jet)
clim([0 0.01])
hax.XTickLabels = [];
hax.YTickLabels = [];
ylabel(hax, 'Late')
%
hax = hax_sub(8);
ima(hax, ind_var_col, pro_ntt_sam_win_row_col{2, 2})
colormap(jet)
clim([0 0.01])
hax.XTickLabels = [];
hax.YTickLabels = [];
h = colorbar;
h.Ticks = [0 0.01];
h.Position(3) = 0.003;
h.Position(1) = hax.Position(1) + hax.Position(3) + 0.010;
h.Label.String = 'probability';
h.Label.Position(1) = 4;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% scatter
linkaxes(hax_sub([6 9]))
y_min = inf;
y_max = -inf;
hax = hax_sub(6);
ind_con = 1;
ind_win = 1;
[h_plo, n_uni_sam] = plo_dat_err_xsa(hax, foc_ntt_win_cox_sam_ani, ind_win, ind_con, mar_siz, ...
    col_sam, ind_sam, dat);
[y_min, y_max, hax] = adj_y(hax, y_min, y_max);
hax.XAxis.Visible = 'off';
ylabel(hax, 'Focality')
%
hax = hax_sub(9);
axes(hax)
ind_con = 1;
ind_win = 2;
[h_plo, n_uni_sam] = plo_dat_err_xsa(hax, foc_ntt_win_cox_sam_ani, ind_win, ind_con, mar_siz, ...
    col_sam, ind_sam, dat);
[y_min, y_max, hax] = adj_y(hax, y_min, y_max);
hax.XTickLabels = {'Con'; xtl_abl};
ylabel(hax, 'Focality')
%%%%%%%%%%%%%%%%%%%%%%%%%%%% sig
hax = hax_sub(6);
axes(hax)
y_lim_pre = ylim;
ind_win = 1;
[~, y_lim] = sigstar_lim(hax, gro_two_cro, fon_siz, off_non, y_lim_pre, sep, mou, ext_hei, ...
    p_foc_ntt_win(ind_win));
[y_min, y_max, hax] = adj_y(hax, y_min, y_max);
hax.FontSize = fon_siz;
%
hax = hax_sub(9);
axes(hax)
y_lim_pre = ylim;
ind_win = 2;
[~, y_lim] = sigstar_lim(hax, gro_two_cro, fon_siz, off_non, y_lim_pre, sep, mou, ext_hei, ...
    p_foc_ntt_win(ind_win));
[y_min, y_max, hax] = adj_y(hax, y_min, y_max);
hax.FontSize = fon_siz;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
set(h_fig.Children, 'Units', 'pixels')
h_fig.Position(3) = las_pix;
h_fig.Renderer = 'painters';
h_fig.PaperSize(1) = rat_wid*h_fig.PaperSize(1);
h_fig.PaperUnits = 'normalized';
h_fig.PaperPosition = [0 0 1 1];
end
function h_fig = plo_tap_fre(tim_bin, mea_dis_tim_gro, sem_dis_tim_gro, ...
    ave_dis_tap_win_cox_sam_ani, p_dis_tap_win, pro_tap_sam_win_row_col, foc_tap_win_cox_sam_ani, ...
    p_foc_tap_win)
[h_fig, fig_wid, fig_hei] = fig;
n_row = 4;
n_col = 5;
gap_ver_row = [0.000 0.000 0.010 0.050];
mar_bot = 0.054;
mar_top = 0.046;
mar_lef = 0.050;
mar_rig = 0.001;
global col_sam fon_siz mar_siz gro_two_cro lin_wid_min xtl_abl
asp_rat_bar = 0.5;
asp_rat_are = 11.5/8;
gap_hor_col = [0.030 0.030 0.030 0.030 0.030];
gap_hor_row_col = repmat(gap_hor_col, n_row, 1);
asp_rat_axe = [asp_rat_are asp_rat_bar asp_rat_bar asp_rat_bar asp_rat_bar ...
    asp_rat_are asp_rat_are asp_rat_are asp_rat_are asp_rat_are ...
    asp_rat_are asp_rat_are asp_rat_are asp_rat_are asp_rat_are ...
    asp_rat_bar asp_rat_bar asp_rat_bar asp_rat_bar asp_rat_bar];
sca = 0.610;
sca_axe = [1 1 1 1 1 ...
    sca sca sca sca sca ...
    sca sca sca sca sca ...
    1 1 1 1 1];
wid = false;
[hax_sub, pos_axe, hei_axe, dis_asp_rat, las_pix, rat_wid] = tight_subplot_gen(n_row, n_col, ...
    gap_ver_row, gap_hor_row_col, mar_bot, mar_top, mar_lef, mar_rig, asp_rat_axe, fig_wid, fig_hei, ...
    wid, sca_axe);
for i = 16:20
    hax_sub(i).Position(1) = hax_sub(i - n_col).Position(1);
end
delete([hax_sub(10) hax_sub(15) hax_sub(20)])
[las_pix, rat_wid] = ext_las_pix_del(pos_axe, fig_wid, [10 15 20]);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% distance
hax = hax_sub(1);
plo_sha(hax, tim_bin, mea_dis_tim_gro, sem_dis_tim_gro, col_sam)
siz_win = [10; 10; 10; 10];
fir = 1800;
poi = [fir - 20, fir + 30, 2340 + 30, 2880 + 30];% end poi
col_con = ["ash grey"; "ash grey"; "ash grey"; "ash grey"];
plo_sti_sub_tri(hax, siz_win, poi, col_con)
%
sti_ons_tri = [1800:60:2100 2340:60:2640 2880:60:3180]';
h = plo_ver_lin(hax, sti_ons_tri, 'k', lin_wid_min, '-');
%
xlabel(hax, 'Time (s)')
ylabel(hax, 'Dis. from the bottom (cm)')
%%%%
linkaxes(hax_sub(2:5))
linkaxes(hax_sub(16:19))
y_min = inf;
y_max = -inf;
n_win = 4;
ind_con = 1;
ind_sam = [1 2];
dat = true;
ind_var_col = nan;
con_int = {'Baseline'; 'Low'; 'Medium'; 'High'};
for ind_win = 1:n_win
    hax = hax_sub(1 + ind_win);
    plo_dat_err_xsa(hax, ave_dis_tap_win_cox_sam_ani, ind_win, ind_con, mar_siz, col_sam, ...
        ind_sam, dat);
    [y_min, y_max, hax] = adj_y(hax, y_min, y_max);
    hax.XTickLabels = {'Con'; xtl_abl};
    if ind_win > 1
        hax.YAxis.Visible = 'off';
    end
    %%%%%%%%%%%%%%%%%%%%%% heatmaps
    hax = hax_sub(5 + ind_win);
    ima(hax, ind_var_col, pro_tap_sam_win_row_col{1, ind_win})
    colormap(hax, jet)
    clim(hax, [0 0.01])
    hax.XTickLabels = [];
    hax.YTickLabels = [];
    %
    hax = hax_sub(10 + ind_win);
    ima(hax, ind_var_col, pro_tap_sam_win_row_col{2, ind_win})
    colormap(hax, jet)
    clim(hax, [0 0.01])
    hax.XTickLabels = [];
    hax.YTickLabels = [];
    h = title(hax, con_int{ind_win}, 'FontWeight', 'normal');
    h.Units = 'normalized';
    h.Position(2) = 1.250;
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% sig
off_non = 0.070;
y_lim_pre = ylim;
mou = 0.030;
sep = off_non + mou + 0.040;
ext_hei = -(sep + mou);
for ind_win = 1:n_win
    hax = hax_sub(1 + ind_win);
    [~, y_lim] = sigstar_lim(hax, gro_two_cro, fon_siz, off_non, y_lim_pre, sep, mou, ext_hei, ...
    p_dis_tap_win(ind_win));
    [y_min, y_max, hax] = adj_y(hax, y_min, y_max);
    hax.FontSize = fon_siz;
    title(hax, con_int{ind_win}, 'FontWeight', 'normal')
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% heatmaps
ylabel(hax_sub(6), 'Control')
ylabel(hax_sub(11), 'Ablated', 'Color', 'r')
h = colorbar(hax_sub(14));
h.Ticks = [0 0.01];
h.Position(3) = 0.003;
h.Label.String = 'probability';
h.Label.Position(1) = 4;
h.Position(1) = 0.580;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% scatter
y_min = inf;
y_max = -inf;
for ind_win = 1:n_win
    hax = hax_sub(15 + ind_win);
    plo_dat_err_xsa(hax, foc_tap_win_cox_sam_ani, ind_win, ind_con, mar_siz, col_sam, ind_sam, dat);
    [y_min, y_max, hax] = adj_y(hax, y_min, y_max);
    hax.XTickLabels = {'Con'; xtl_abl};
    if ind_win == 1
        ylabel(hax, 'Focality')
    else
        hax.YAxis.Visible = 'off';
    end
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%% sig
y_lim_pre = ylim;
for ind_win = 1:n_win
    hax = hax_sub(15 + ind_win);
    [~, y_lim] = sigstar_lim(hax, gro_two_cro, fon_siz, off_non, y_lim_pre, sep, mou, ext_hei, ...
    p_foc_tap_win(ind_win));
    [y_min, y_max, hax] = adj_y(hax, y_min, y_max);
    hax.FontSize = fon_siz;
end
h_fig = opt_h_fig(h_fig, las_pix, rat_wid);
end
function h_fig = plo_sig_fre(tim_bin, mea_dis_tim_gro, sem_dis_tim_gro)
[h_fig, fig_wid, fig_hei] = fig;
n_row = 1;
n_col = 1;
gap_ver_row = [0.000 0.000 0.010 0.050];
% mar_bot = 0.070;
% mar_top = 0.046;
% mar_lef = 0.050;
% mar_rig = 0.001;

hei = 4.5;
mar_top = cal_mar_top(hei);
mar_bot = 0.017;
mar_lef = 0.012;
mar_rig = 0.001;

global lin_wid_min
asp_rat_bar = 0.5;
asp_rat_are = 11.5/8;
gap_hor_col = [0.030 0.030 0.030 0.030 0.030];
gap_hor_row_col = repmat(gap_hor_col, n_row, 1);
asp_rat_axe = [1];
sca = 0.610;
sca_axe = [1];
wid = false;

n_pix_ext = 30;
[hax_sub, pos_axe, hei_axe, dis_asp_rat, las_pix, rat_wid] = tight_subplot_gen(n_row, n_col, ...
    gap_ver_row, gap_hor_row_col, mar_bot, mar_top, mar_lef, mar_rig, asp_rat_axe, fig_wid, fig_hei, ...
    wid, sca_axe, n_pix_ext);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% distance
hax = hax_sub(1);

log_bin = tim_bin <= 2160;
con_fil = matfile('\\home.ansatt.ntnu.no\kadiram\Documents\MATLAB\con_esp.mat');
col_sam = con_fil.col_sam;
col_sam = col_sam([3 2]');

plo_sha.fun(hax, tim_bin(log_bin), mea_dis_tim_gro(log_bin, :), sem_dis_tim_gro(log_bin, :), col_sam)
siz_win = [10; 10; 10; 10];
fir = 1800;
poi = [fir - 20, fir + 30, 2340 + 30, 2880 + 30];% end poi
col_con = ["ash grey"; "ash grey"; "ash grey"; "ash grey"];
plo_sti_sub_tri(hax, siz_win, poi, col_con)
%
sti_ons_tri = [1800:60:2100 2340:60:2640 2880:60:3180]';
%h = plo_ver_lin(hax, sti_ons_tri, 'k', lin_wid_min, '-');
h = xline(hax, sti_ons_tri, 'Color', [0.5 0.5 0.5], 'LineWidth', lin_wid_min, 'LineStyle', '--');
%
xlabel(hax, 'Time (s)')
ylabel(hax, 'Distance from bottom (cm)')

fon_siz = con_fil.fon_siz;
mar_siz = con_fil.mar_siz;
hax = adj_hax(hax, fon_siz.pub, mar_siz.pub);

h_fig = opt_h_fig(h_fig, las_pix, rat_wid);
end
function h_fig = plo_dis_fre(ave_dis_tap_win_cox_sam_ani, p_dis_tap_win)
[h_fig, fig_wid, fig_hei] = fig;
n_row = 1;
n_col = 2;
gap_ver_row = [0.000 0.000 0.010 0.050];
% mar_bot = 0.054;
% mar_top = 0.046;
% mar_lef = 0.050;
% mar_rig = 0.001;

hei = 4.5;
mar_top = cal_mar_top(hei);
mar_bot = 0.010;
mar_lef = 0.012;
mar_rig = 0.001;
gap_hor_col = 0.012*ones(1, n_col);

global gro_two_cro
asp_rat_bar = 0.5;
gap_hor_row_col = repmat(gap_hor_col, n_row, 1);
asp_rat_axe = [asp_rat_bar asp_rat_bar];
sca = 0.610;
sca_axe = [1 1];
wid = false;
n_pix_ext = 30;
[hax_sub, pos_axe, hei_axe, dis_asp_rat, las_pix, rat_wid] = tight_subplot_gen(n_row, n_col, ...
    gap_ver_row, gap_hor_row_col, mar_bot, mar_top, mar_lef, mar_rig, asp_rat_axe, fig_wid, fig_hei, ...
    wid, sca_axe, n_pix_ext);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% distance
y_min = inf;
y_max = -inf;
n_win = 2;
ind_con = 1;
ind_sam = [1 2];
dat = true;
con_int = {'Baseline'; 'Vibration'; 'Medium'; 'High'};
con_fil = matfile('\\home.ansatt.ntnu.no\kadiram\Documents\MATLAB\con_esp.mat');
col_sam = con_fil.col_sam;
col_sam = col_sam([3 2]');
xtl_sam = con_fil.xtl_sam;
xtl_sam = xtl_sam([3 2]');
mar_siz = con_fil.mar_siz;
for ind_win = 1:n_win
    hax = hax_sub(ind_win);
    plo_dat_err_xsa(hax, ave_dis_tap_win_cox_sam_ani, ind_win, ind_con, mar_siz.pub, col_sam, ...
        ind_sam, dat);
    [y_min, y_max, hax] = adj_y(hax, y_min, y_max);
    hax.XTickLabels = xtl_sam;
    if ind_win > 1
        hax.YAxis.Visible = 'off';
    end
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% sig, fon_siz
off_non = 0.020;
y_lim_pre = ylim;
mou = 0.020;
sep = off_non + mou + 0.020;
ext_hei = -(sep + mou);
fon_siz = con_fil.fon_siz;
for ind_win = 1:n_win
    hax = hax_sub(ind_win);
    [~, y_lim] = sigstar.sig(hax, gro_two_cro, y_lim_pre, sep, mou, ext_hei, off_non, ...
    round(p_dis_tap_win(ind_win), 2));
    [y_min, y_max, hax] = adj_y(hax, y_min, y_max);
    title(hax, con_int{ind_win}, 'FontWeight', 'normal')
    if ind_win == 1
        ylabel(hax, 'Distance from bottom (cm)')
    end
    hax = adj_hax(hax, fon_siz.pub, mar_siz.pub);
end
h_fig = opt_h_fig(h_fig, las_pix, rat_wid);
end
function h_fig = plo_foc_fre(foc_tap_win_cox_sam_ani, p_foc_tap_win)
[h_fig, fig_wid, fig_hei] = fig;
n_row = 1;
n_col = 2;
gap_ver_row = [0.000 0.000 0.010 0.050];
% mar_bot = 0.054;
% mar_top = 0.046;
% mar_lef = 0.050;
% mar_rig = 0.001;

hei = 4;
mar_top = cal_mar_top(hei);
mar_bot = 0.010;
mar_lef = 0.017;
mar_rig = 0.001;
gap_hor_col = 0.010*ones(1, n_col);

global gro_two_cro
asp_rat_bar = 0.5;
gap_hor_row_col = repmat(gap_hor_col, n_row, 1);
asp_rat_axe = [asp_rat_bar asp_rat_bar];
sca = 0.610;
sca_axe = [1 1];
wid = false;
n_pix_ext = 30;
[hax_sub, pos_axe, hei_axe, dis_asp_rat, las_pix, rat_wid] = tight_subplot_gen(n_row, n_col, ...
    gap_ver_row, gap_hor_row_col, mar_bot, mar_top, mar_lef, mar_rig, asp_rat_axe, fig_wid, fig_hei, ...
    wid, sca_axe, n_pix_ext);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% distance
y_min = inf;
y_max = -inf;
n_win = 2;
ind_con = 1;
ind_sam = [1 2];
dat = true;
con_int = {'Baseline'; 'Vibration'; 'Medium'; 'High'};
con_fil = matfile('\\home.ansatt.ntnu.no\kadiram\Documents\MATLAB\con_esp.mat');
col_sam = con_fil.col_sam;
col_sam = col_sam([3 2]');
xtl_sam = con_fil.xtl_sam;
xtl_sam = xtl_sam([3 2]');
mar_siz = con_fil.mar_siz;
for ind_win = 1:n_win
    hax = hax_sub(ind_win);
    plo_dat_err_xsa(hax, foc_tap_win_cox_sam_ani, ind_win, ind_con, mar_siz.pub, col_sam, ...
        ind_sam, dat);
    [y_min, y_max, hax] = adj_y(hax, y_min, y_max);
    hax.XTickLabels = xtl_sam;
    if ind_win > 1
        hax.YAxis.Visible = 'off';
    end
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% sig, fon_siz
off_non = 0.020;
y_lim_pre = ylim;
mou = 0.020;
sep = off_non + mou + 0.020;
ext_hei = -(sep + mou);
fon_siz = con_fil.fon_siz;
for ind_win = 1:n_win
    hax = hax_sub(ind_win);
    [~, y_lim] = sigstar.sig(hax, gro_two_cro, y_lim_pre, sep, mou, ext_hei, off_non, ...
    round(p_foc_tap_win(ind_win), 2));
    [y_min, y_max, hax] = adj_y(hax, y_min, y_max);
    title(hax, con_int{ind_win}, 'FontWeight', 'normal')
    if ind_win == 1
        ylabel(hax, 'Focality')
    end
    hax = adj_hax(hax, fon_siz.pub, mar_siz.pub);
end
h_fig = opt_h_fig(h_fig, las_pix, rat_wid);
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% zan
function h_fig = plo_y_pos(y_pos_bas_sam_fra_ani, p_y_pos_bas_xsa, ...
    y_pos_con_sam_fra_ani, p_y_pos_win_con_xsa, bas_spe_sam_bin_ani, p_bas_spe_xsa, ...
    spe_con_sam_bin_ani, p_spe_win_con_xsa)
n_row = 2;
n_col = 4;
[h_fig, fig_wid, fig_hei] = fig;
gap_ver_row = 0.070*[1; 1];
mar_bot = 0.000;
mar_top = 0.010;
mar_lef = 0.043;
mar_rig = 0.010;
gap_hor_row_col = 0.025*[1 1 1 1; ...
    1 1 1 1];
global asp_rat_sig n_con col_sam n_sam tim_fra col_sam_con win_len tim_bin
asp_rat_axe = asp_rat_sig*[1 1 1 1 ...
    1 1 1 1];
sca_axe = 0.4*[1 1 1 1];
wid = true;
n_pix_ext = 15;
[hax_sub, pos_axe, hei_axe, dis_asp_rat, las_pix, rat_wid] = tight_subplot_gen(n_row, n_col, ...
    gap_ver_row, gap_hor_row_col, mar_bot, mar_top, mar_lef, mar_rig, asp_rat_axe, fig_wid, ...
    fig_hei, wid, sca_axe, n_pix_ext);
linkaxes(hax_sub(1:n_col), 'y')
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% POS
y_min = inf;
y_max = -inf;
hax = hax_sub(1);
log_smo = true;
for i = 1:n_sam
    h_bas = plo_sha_gen(hax, tim_fra.zan.bas, y_pos_bas_sam_fra_ani{i}, col_sam{i}, log_smo);
end
[y_min, y_max, hax] = adj_y(hax, y_min, y_max);
x_lab = 'Time (s)';
y_lab = 'y position (mm)';
xlabel(hax, x_lab)
ylabel(hax, y_lab)
nor_x = 0.5;
nor_y = 0.7;
log_all = true;
pri_sig(hax, nor_x, nor_y, p_y_pos_bas_xsa.lme, log_all)
%
h_con = cell(n_con, 1);
hax_tap = [];
for j = 1:n_con
    hax = hax_sub(1 + j);
    for i = 1:n_sam
        h_con_i = plo_sha_gen(hax, tim_fra.zan.tri, y_pos_con_sam_fra_ani{j, i}, col_sam_con{i, j}, ...
            log_smo);
        [y_min, y_max, hax] = adj_y(hax, y_min, y_max);
        hold on
        h_con{j} = [h_con{j}; h_con_i];
    end
    xlabel(hax, x_lab)
    hax.YAxis.Visible = 'off';
    hax_tap = [hax_tap; hax];
    if j == n_con
        hax.XTickLabel = hax_tap(end - 1).XTickLabel;
    end
end
%
for j = 1:n_con
    hax = hax_sub(1 + j);
    plo_lin_sub_tri(hax, win_len.zan.sec)
    pri_sig(hax, nor_x, nor_y, p_y_pos_win_con_xsa.lme{2, j}, log_all)
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
y_min = inf;
y_max = -inf;
hax = hax_sub(n_col + 1);
for i = 1:n_sam
    h_bas = plo_sha_gen(hax, tim_bin.zan.bas, bas_spe_sam_bin_ani{i}, col_sam{i}, log_smo);
end
[y_min, y_max, hax] = adj_y(hax, y_min, y_max);
x_lab = 'Time (s)';
y_lab = 'Speed (a. u.)';
xlabel(hax, x_lab)
ylabel(hax, y_lab)
nor_x = 0.5;
nor_y = 0.7;
pri_sig(hax, nor_x, nor_y, p_bas_spe_xsa.lme, log_all)
%
log_smo = false;
h_con = cell(n_con, 1);
hax_tap = [];
for j = 1:n_con
    hax = hax_sub(n_col + 1 + j);
    for i = 1:n_sam
        h_con_i = plo_sha_gen(hax, tim_bin.zan.tri, spe_con_sam_bin_ani{j, i}, col_sam_con{i, j}, ...
            log_smo);
        [y_min, y_max, hax] = adj_y(hax, y_min, y_max);
        hold on
        h_con{j} = [h_con{j}; h_con_i];
    end
    xlabel(hax, x_lab)
    hax.YAxis.Visible = 'off';
    hax_tap = [hax_tap; hax];
    if j == n_con
        hax.XTickLabel = hax_tap(end - 1).XTickLabel;
    end
end
%
linkaxes(hax_sub(n_col + 1:end), 'y')
%
for j = 1:n_con
    hax = hax_sub(n_col + 1 + j);
    plo_lin_sub_tri(hax, win_len.zan.sec)
    pri_sig(hax, nor_x, nor_y, p_spe_win_con_xsa.lme{2, j}, log_all)
end
h_fig = opt_h_fig(h_fig, las_pix, rat_wid);
end
function h_fig = plo_occ_map(pro_sam_epo_row_col, foc_epo_cox_sam_ani, p_foc_epo)
[h_fig, fig_wid, fig_hei] = fig;
n_row = 3;
n_col = 4;
gap_ver_row = [0.000 0.030 0.000];
mar_bot = 0.054;
mar_top = 0.046;
mar_lef = 0.050;
mar_rig = 0.001;
global col_sam fon_siz mar_siz gro_two_cro xtl_abl
asp_rat_bar = 0.5;
asp_rat_are = 10/9;
gap_hor_col = [0.030 0.030 0.030 0.030];
gap_hor_row_col = repmat(gap_hor_col, n_row, 1);
asp_rat_axe = [asp_rat_are asp_rat_are asp_rat_are asp_rat_are ...
               asp_rat_are asp_rat_are asp_rat_are asp_rat_are ...
               asp_rat_bar asp_rat_bar asp_rat_bar asp_rat_bar];
sca = 0.610;
sca_axe = [sca sca sca sca ...
           sca sca sca sca ...
            1   1   1   1     ];
wid = false;
n_pix_ext = 130;
[hax_sub, ~, ~, ~, las_pix, rat_wid] = tight_subplot_gen(n_row, n_col, gap_ver_row, ...
    gap_hor_row_col, mar_bot, mar_top, mar_lef, mar_rig, asp_rat_axe, fig_wid, fig_hei, wid, ...
    sca_axe, n_pix_ext);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
n_win = 4;
ind_con = 1;
ind_sam = [1 2];
dat = true;
ind_var_col = nan;
con_int = {'Baseline'; 'Low'; 'Medium'; 'High'};
for ind_win = 1:n_win
    hax = hax_sub(ind_win);
    ima(hax, ind_var_col, pro_sam_epo_row_col{1, ind_win})
    colormap(hax, jet)
    clim(hax, [0 0.01])
    hax.XTickLabels = [];
    hax.YTickLabels = [];
    %
    hax = hax_sub(n_col + ind_win);
    ima(hax, ind_var_col, pro_sam_epo_row_col{2, ind_win})
    colormap(hax, jet)
    clim(hax, [0 0.01])
    hax.XTickLabels = [];
    hax.YTickLabels = [];
    h = title(hax, con_int{ind_win}, 'FontWeight', 'normal');
    h.Units = 'normalized';
    h.Position(2) = 1.250;
end
ylabel(hax_sub(1), 'Control')
ylabel(hax_sub(n_col + 1), 'Ablated', 'Color', 'r')
h = colorbar(hax_sub(2*n_col));
h.Ticks = [0 0.01];
h.Position(3) = 0.003;
h.Label.String = 'probability';
h.Label.Position(1) = 4;
h.Position(1) = 0.580;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% scatter
y_min = inf;
y_max = -inf;
for ind_win = 1:n_win
    hax = hax_sub(2*n_col + ind_win);
    plo_dat_err_xsa(hax, foc_epo_cox_sam_ani, ind_win, ind_con, mar_siz, col_sam, ...
        ind_sam, dat);
    [y_min, y_max, hax] = adj_y(hax, y_min, y_max);
    hax.XTickLabels = {'Con'; xtl_abl};
    if ind_win == 1
        ylabel(hax, 'Focality')
    else
        hax.YAxis.Visible = 'off';
    end
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%% sig
off_non = 0.070;
y_lim_pre = ylim;
mou = 0.030;
sep = off_non + mou + 0.040;
ext_hei = -(sep + mou);
for ind_win = 1:n_win
    hax = hax_sub(2*n_col + ind_win);
    [~, y_lim] = sigstar_lim(hax, gro_two_cro, fon_siz, off_non, y_lim_pre, sep, mou, ext_hei, ...
    p_foc_epo(ind_win));
    [y_min, y_max, hax] = adj_y(hax, y_min, y_max);
    hax.FontSize = fon_siz;
end
h_fig = opt_h_fig(h_fig, las_pix, rat_wid);
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% nov
function h_fig = plo_ses(tim_poi, mea_val_pos_tim_gro, sem_val_pos_tim_gro, y_lab, stim_times, ...
    lab_sam)
[h_fig, fig_wid, fig_hei] = fig;
n_row = 1;
n_col = 1;
gap_ver_row = 0.070;
gap_hor_row_col = 0.030;
mar_bot = 0.070;
mar_top = 0.030;
mar_lef = 0.050;
mar_rig = 0.001;
col_sam = {'k'; 'r'; 'b'};
asp_rat_axe = 1.85;
wid = false;
sca_axe = 1;
n_pix_ext = 10;
[hax_sub, pos_axe, hei_axe, dis_asp_rat, las_pix, rat_wid] = tight_subplot_gen(n_row, n_col, ...
    gap_ver_row, gap_hor_row_col, mar_bot, mar_top, mar_lef, mar_rig, asp_rat_axe, fig_wid, ...
    fig_hei, wid, sca_axe, n_pix_ext);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
log_poi = ~isnan(tim_poi);
hax = hax_sub(1);
log_smo = false;
tim_poi = tim_poi(log_poi);
mea_val_pos_tim_gro = mea_val_pos_tim_gro(log_poi, :);
sem_val_pos_tim_gro = sem_val_pos_tim_gro(log_poi, :);
lin_sam = plo_sha(hax, tim_poi(1:5:end), mea_val_pos_tim_gro(1:5:end, :), sem_val_pos_tim_gro...
    (1:5:end, :), col_sam, log_smo);
legend(lin_sam, lab_sam)
xlabel(hax, 'Time (s)')
ylabel(hax, y_lab)
lin_wid = 1;
h = plo_ver_lin(hax, stim_times, 'g', lin_wid, '-');
legend(lin_sam, lab_sam)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
set(h_fig.Children, 'Units', 'pixels')
h_fig.Position(3) = las_pix;
h_fig.Renderer = 'painters';
h_fig.PaperSize(1) = rat_wid*h_fig.PaperSize(1);
h_fig.PaperUnits = 'normalized';
h_fig.PaperPosition = [0 0 1 1];
end
function h_fig = plo_ypc(ypc_wix_con_sam_ani, p_ypc_wix_con_xsa)
n_row = 1;
n_col = 3;
[h_fig, fig_wid, fig_hei] = fig;
gap_ver_row = 0.070*[1; 1];
mar_bot = 0.000;
mar_top = 0.010;
mar_lef = 0.043;
mar_rig = 0.010;
gap_hor_row_col = 0.025*[1 1 1];
global asp_rat_bar n_con col_sam xtl_abl gro_two_cro fon_siz mar_siz
asp_rat_axe = asp_rat_bar*[1 1 1];
sca_axe = 1*[1 1 1];
wid = false;
n_pix_ext = 15;
[hax_sub, pos_axe, hei_axe, dis_asp_rat, las_pix, rat_wid] = tight_subplot_gen(n_row, n_col, ...
    gap_ver_row, gap_hor_row_col, mar_bot, mar_top, mar_lef, mar_rig, asp_rat_axe, fig_wid, ...
    fig_hei, wid, sca_axe, n_pix_ext);
linkaxes(hax_sub(1:n_col), 'y')
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
y_min = inf;
y_max = -inf;
y_lab = 'y position change (mm)';
hax_tap = [];
ind_win = 1;
ind_sam = [1 2];
dat = true;
for j = 1:n_con
    hax = hax_sub(j);
    plo_dat_err_xsa(hax, ypc_wix_con_sam_ani, ind_win, j, mar_siz, col_sam, ind_sam, dat);
    [y_min, y_max, hax] = adj_y(hax, y_min, y_max);
    hax.XTickLabels = {'Con'; xtl_abl};
    if j == 1
        ylabel(hax, y_lab)
    else
        hax.YAxis.Visible = 'off';
    end
end
off_non = 0.070;
y_lim_pre = ylim;
mou = 0.030;
sep = off_non + mou + 0.040;
ext_hei = -(sep + mou);
for j = 1:n_con
    hax = hax_sub(j);
    [~, y_lim] = sigstar_lim_duo(hax, gro_two_cro, fon_siz, off_non, y_lim_pre, sep, mou, ext_hei, ...
    p_ypc_wix_con_xsa.lme{ind_win, j}, p_ypc_wix_con_xsa.rst{ind_win, j});
    [y_min, y_max, hax] = adj_y(hax, y_min, y_max);
    hax.FontSize = fon_siz;
end
h_fig = opt_h_fig(h_fig, las_pix, rat_wid);
end
function h_fig = plo_ypc_tog(ypc_sam_ani, p_ypc_xsa, ind_sam, y_lab)
n_row = 1;
n_col = 1;
[h_fig, fig_wid, fig_hei] = fig;
gap_ver_row = 0.070*[1; 1];
mar_bot = 0.000;
mar_top = 0.010;
mar_lef = 0.050;
mar_rig = 0.010;
gap_hor_row_col = 0.025*[1 1 1];
global asp_rat_bar xtl_abl fon_siz mar_siz
asp_rat_axe = asp_rat_bar*[1 1 1];
sca_axe = 1*[1 1 1];
wid = false;
n_pix_ext = 15;
[hax_sub, pos_axe, hei_axe, dis_asp_rat, las_pix, rat_wid] = tight_subplot_gen(n_row, n_col, ...
    gap_ver_row, gap_hor_row_col, mar_bot, mar_top, mar_lef, mar_rig, asp_rat_axe, fig_wid, ...
    fig_hei, wid, sca_axe, n_pix_ext);
linkaxes(hax_sub(1:n_col), 'y')
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
y_min = inf;
y_max = -inf;
dat = true;
hax = hax_sub(1);
col_sam = {'k'; 'r'; 'b'};
[h_plo, n_uni_sam] = plo_dat_err_xsa_sim(hax, ypc_sam_ani, mar_siz, col_sam, ind_sam, dat);
[y_min, y_max, hax] = adj_y(hax, y_min, y_max);
xtl_mtz = ['\color[rgb]{0, 0, 1} ', 'MTZ'];
hax.XTickLabels = {'Sha'; xtl_abl; xtl_mtz};
ylabel(hax, y_lab)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
n_sam = length(ypc_sam_ani);
[sam_cro_ind, n_cro, gro_xsa_ind] = ext_sam_cro_ind(n_sam);
off_non = 0.070;
y_lim_pre = ylim;
mou = 0.030;
sep = off_non + mou + 0.040;
ext_hei = -(sep + mou);
[~, y_lim] = sigstar_lim_duo(hax, gro_xsa_ind, fon_siz, off_non, y_lim_pre, sep, mou, ext_hei, ...
p_ypc_xsa.lme, p_ypc_xsa.rst);
[y_min, y_max, hax] = adj_y(hax, y_min, y_max);
hax.FontSize = fon_siz;
h_fig = opt_h_fig(h_fig, las_pix, rat_wid);
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% two
function h_fig = plo_trm(ypc_sam_ani_tri, tit_n_sam, ind_sam, y_lab)
% trial-response map
n_sam = length(tit_n_sam);
[h_fig, fig_wid, fig_hei] = fig;
n_row = 1;
n_col = 3;
gap_ver = 0.100;
gap_hor_col = 0.050*ones(1, n_col);
mar_bot = 0.065;
mar_top = 0.065;
mar_lef = 0.040;
mar_rig = 0.001;
n_tri = 15;
asp_rat_map = 1;
asp_rat_axe = [asp_rat_map asp_rat_map asp_rat_map];
wid = 1;
sca_axe = 0.9*ones(1, n_col);
n_pix_ext = 10;
[hax_sub, pos_axe, hei_axe, dis_asp_rat, las_pix, rat_wid] = tight_subplot_gen(n_row, n_col, ...
    gap_ver, gap_hor_col, mar_bot, mar_top, mar_lef, mar_rig, asp_rat_axe, fig_wid, fig_hei, wid, ...
    sca_axe, n_pix_ext);
%
x_lab = 'Trial #';
fon_siz = 20;
for i = 1:n_sam
    hax = hax_sub(i);
    ind = ind_sam(i);
    ima(hax, 1:n_tri, ypc_sam_ani_tri{ind})
    colormap(hax, 'cool')
    %clim(hax, [-7 7])
    if i == 1
        ylabel(hax, 'Animal #')
    end
    %
    col_han = colorbar;
    col_han.Position(1) = col_han.Position(1) + 0.03;
    col_han.Label.String = y_lab;
    col_han.FontSize = fon_siz;
    % sample title
    tit = tit_n_sam(ind);
    h = title(hax, tit, 'FontWeight', 'normal');
    xlabel(hax, x_lab)
end
end
function h_fig = plo_ntt_tim(tim_poi, mea_y_pos_poi_gro, sem_y_pos_poi_gro, win_len_win)
[h_fig, fig_wid, fig_hei] = fig;
%[h_fig, fig_wid, fig_hei] = fig_mac;
n_row = 1;
n_col = 1;
gap_ver_row = 0.070;
gap_hor_row_col = 0.030;
mar_bot = 0.028;
con_fil = matfile('\\home.ansatt.ntnu.no\kadiram\Documents\MATLAB\con_esp.mat');
hei = con_fil.hei;
mar_top = cal_mar_top(hei);
mar_lef = 0.022;
mar_rig = 0.000;
asp_rat_axe = 1;
wid = false;
sca_axe = 1;
n_pix_ext = 7;
[hax_sub, pos_axe, hei_axe, dis_asp_rat, las_pix, rat_wid] = tight_subplot_gen(n_row, n_col, ...
    gap_ver_row, gap_hor_row_col, mar_bot, mar_top, mar_lef, mar_rig, asp_rat_axe, fig_wid, ...
    fig_hei, wid, sca_axe, n_pix_ext);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% distance
hax = hax_sub(1);
tim_poi = tim_poi(1:5:end, :);
log_poi = tim_poi <= 800;
tim_poi = tim_poi(log_poi);
mea_poi_gro.raw = mea_y_pos_poi_gro(1:5:end, :);
sem_poi_gro.raw = sem_y_pos_poi_gro(1:5:end, :);
mea_poi_gro.raw = mea_poi_gro.raw(log_poi, :);
sem_poi_gro.raw = sem_poi_gro.raw(log_poi, :);
met = 'sgolay';
n_fra = 30;
mea_poi_gro.smo = smoothdata(mea_poi_gro.raw, met, n_fra);
sem_poi_gro.smo = smoothdata(sem_poi_gro.raw, met, n_fra);

lin_gro = plo_sha.fun(hax, tim_poi, mea_poi_gro.smo, sem_poi_gro.smo, con_fil.col_sam);
hax.LineWidth = 0.5;

end_poi_win = 60 + win_len_win(1);
col_con = "ash grey";
plo_sti_sub_tri(hax, win_len_win, end_poi_win, col_con)

x_lab = xlabel(hax, 'Time (s)');
ylabel(hax, 'y position (mm)')
fon_siz = 8;
hax = adj_hax(hax, fon_siz);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
set(h_fig.Children, 'Units', 'pixels')
h_fig.Position(3) = las_pix;
h_fig.Position(4) = hax.Position(2) + hax.Position(4) + n_pix_ext;
h_fig.Renderer = 'painters';
h_fig.PaperSize(1) = rat_wid*h_fig.PaperSize(1);
h_fig.PaperUnits = 'normalized';
h_fig.PaperPosition = [0 0 1 1];
end
function h_fig = plo_ntt_sca(val_pos_win_cox_sam_ani, p_y_pos_win_cox_xsa)
[h_fig, fig_wid, fig_hei] = fig;
n_row = 1;
n_col = 2;
gap_ver_row = 0.070;
gap_hor_row_col = 0.010*ones(n_row, n_col);
mar_bot = 0.022;
hei = 5;
mar_top = cal_mar_top(hei);
mar_lef = 0.021;
mar_rig = 0.001;
asp_rat_bar = 0.5;
asp_rat_axe = [asp_rat_bar asp_rat_bar];
wid = false;
sca_axe = [1 1];
n_pix_ext = 3;
[hax_sub, pos_axe, hei_axe, dis_asp_rat, las_pix, rat_wid] = tight_subplot_gen(n_row, n_col, ...
    gap_ver_row, gap_hor_row_col, mar_bot, mar_top, mar_lef, mar_rig, asp_rat_axe, fig_wid, ...
    fig_hei, wid, sca_axe, n_pix_ext);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% distance
y_lab = 'y position (mm)';
linkaxes(hax_sub)
y_min = inf;
y_max = -inf;
hax = hax_sub(1);
ind_con = 1;
ind_win = 1;
con_fil = matfile('\\home.ansatt.ntnu.no\kadiram\Documents\MATLAB\con_esp.mat');
fon_siz = con_fil.fon_siz;
ind_sam = 1:3;
dat = true;
[h_plo, n_uni_sam] = plo_dat_err_xsa(hax, val_pos_win_cox_sam_ani, ind_win, ind_con, ...
    fon_siz.pub, con_fil.col_sam, ind_sam, dat);
[y_min, y_max, hax] = adj_y(hax, y_min, y_max);
hax.XTickLabels = con_fil.xtl_sam;
%
hax = hax_sub(2);
ind_con = 1;
ind_win = 2;
[h_plo, n_uni_sam] = plo_dat_err_xsa(hax, val_pos_win_cox_sam_ani, ind_win, ind_con, ...
    fon_siz.pub, con_fil.col_sam, ind_sam, dat);
[y_min, y_max, hax] = adj_y(hax, y_min, y_max);
hax.YAxis.Visible = 'off';
hax.XTickLabels = con_fil.xtl_sam;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% sig
hax = hax_sub(1);
axes(hax)
y_lim_pre = ylim;
mou = 0.010;
sep = mou + 0.040;
ext_hei = -(sep + mou);
ind_win = 1;
ind_sig.sig(hax, con_fil.gro_thr_cro, y_lim_pre, sep, mou, ext_hei, p_y_pos_win_cox_xsa{ind_win, 1})
[y_min, y_max, hax] = adj_y(hax, y_min, y_max);
hax.FontSize = fon_siz.pub;
title(hax, 'Early', 'FontWeight','normal')
ylabel(y_lab)
hax = adj_hax(hax);
%
hax = hax_sub(2);
axes(hax)
y_lim_pre = ylim;
ind_win = 2;
ind_sig.sig(hax, con_fil.gro_thr_cro, y_lim_pre, sep, mou, ext_hei, p_y_pos_win_cox_xsa{ind_win, 1})
[y_min, y_max, hax] = adj_y(hax, y_min, y_max);
hax.FontSize = fon_siz.pub;
title(hax, 'Late', 'FontWeight','normal')
hax = adj_hax(hax);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
set(h_fig.Children, 'Units', 'pixels')
h_fig.Position(3) = las_pix;
h_fig.Renderer = 'painters';
h_fig.PaperSize(1) = rat_wid*h_fig.PaperSize(1);
h_fig.PaperUnits = 'normalized';
h_fig.PaperPosition = [0 0 1 1];
end
function h_fig = plo_ntt_sca_ear(val_pos_win_cox_sam_ani, p_y_pos_win_cox_xsa)
[h_fig, fig_wid, fig_hei] = fig;
n_row = 1;
n_col = 1;
gap_ver_row = 0.070;
gap_hor_row_col = 0.010*ones(n_row, n_col);
mar_bot = 0.022;
con_fil = matfile('\\home.ansatt.ntnu.no\kadiram\Documents\MATLAB\con_esp.mat');
hei = con_fil.hei;
mar_top = cal_mar_top(hei);
mar_lef = 0.021;
mar_rig = 0.001;
asp_rat_bar = 0.5;
asp_rat_axe = asp_rat_bar;
wid = false;
sca_axe = 1;
n_pix_ext = 20;
[hax_sub, pos_axe, hei_axe, dis_asp_rat, las_pix, rat_wid] = tight_subplot_gen(n_row, n_col, ...
    gap_ver_row, gap_hor_row_col, mar_bot, mar_top, mar_lef, mar_rig, asp_rat_axe, fig_wid, ...
    fig_hei, wid, sca_axe, n_pix_ext);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% distance
y_lab = 'y position (mm)';
y_min = inf;
y_max = -inf;
hax = hax_sub(1);
ind_con = 1;
ind_win = 1;
con_fil = matfile('\\home.ansatt.ntnu.no\kadiram\Documents\MATLAB\con_esp.mat');
fon_siz = con_fil.fon_siz;
ind_sam = 1:3;
dat = true;
[h_plo, n_uni_sam, tic_sam] = plo_dat_err_xsa(hax, val_pos_win_cox_sam_ani, ind_win, ind_con, ...
    fon_siz.pub, con_fil.col_sam, ind_sam, dat);
[y_min, y_max, hax] = adj_y(hax, y_min, y_max);
hax.XTickLabels = con_fil.xtl_sam;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% sig
hax = hax_sub(1);
y_lim_pre = ylim;
mou = 0.010;
sep = mou + 0.040;
ext_hei = -(sep + mou);
ind_win = 1;
gro_thr_cro = gen_gro_thr_cro(tic_sam);
ind_sig.sig(hax, gro_thr_cro, y_lim_pre, sep, mou, ext_hei, p_y_pos_win_cox_xsa{ind_win, 1})
[y_min, y_max, hax] = adj_y(hax, y_min, y_max);
hax.FontSize = fon_siz.pub;
ylabel(y_lab)
fon_siz = 8;
mar_siz = con_fil.mar_siz;
log_lin_wid = true;
hax = adj_hax(hax, fon_siz, mar_siz.pub, log_lin_wid);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
set(h_fig.Children, 'Units', 'pixels')
h_fig.Position(3) = las_pix;
h_fig.Renderer = 'painters';
h_fig.PaperSize(1) = rat_wid*h_fig.PaperSize(1);
h_fig.PaperUnits = 'normalized';
h_fig.PaperPosition = [0 0 1 1];
end
function gro_thr_cro = gen_gro_thr_cro(tic_sam)
gro_thr_cro = {[tic_sam(1) tic_sam(2)]; [tic_sam(1) tic_sam(3)]; [tic_sam(2) tic_sam(3)]};
end
function h_fig = plo_bas_spe(val_pos_win_cox_sam_ani, p_y_pos_win_cox_xsa)
[h_fig, fig_wid, fig_hei] = fig;
n_row = 1;
n_col = 1;
gap_ver_row = 0.070;
gap_hor_row_col = 0.010*ones(n_row, n_col);
mar_bot = 0.022;
con_fil = matfile('\\home.ansatt.ntnu.no\kadiram\Documents\MATLAB\con_esp.mat');
hei = con_fil.hei;
mar_top = cal_mar_top(hei);
mar_lef = 0.021;
mar_rig = 0.001;
asp_rat_bar = 0.5;
asp_rat_axe = asp_rat_bar;
wid = false;
sca_axe = 1;
n_pix_ext = 3;
[hax_sub, pos_axe, hei_axe, dis_asp_rat, las_pix, rat_wid] = tight_subplot_gen(n_row, n_col, ...
    gap_ver_row, gap_hor_row_col, mar_bot, mar_top, mar_lef, mar_rig, asp_rat_axe, fig_wid, ...
    fig_hei, wid, sca_axe, n_pix_ext);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% distance
y_lab = 'Baseline speed (mm/s)';
y_min = inf;
y_max = -inf;
hax = hax_sub(1);
ind_con = 1;
ind_win = 2;
con_fil = matfile('\\home.ansatt.ntnu.no\kadiram\Documents\MATLAB\con_esp.mat');
fon_siz = con_fil.fon_siz;
ind_sam = 1:3;
dat = true;
[h_plo, n_uni_sam, tic_sam] = plo_dat_err_xsa(hax, val_pos_win_cox_sam_ani, ind_win, ind_con, ...
    fon_siz.pub, con_fil.col_sam, ind_sam, dat);
[y_min, y_max, hax] = adj_y(hax, y_min, y_max);
hax.XTickLabels = con_fil.xtl_sam;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% sig
hax = hax_sub(1);
gro_thr_cro = gen_gro_thr_cro(tic_sam);
y_lim_pre = ylim;
mou = 0.010;
sep = mou + 0.040;
ext_hei = -(sep + mou);
ind_sig.sig(hax, gro_thr_cro, y_lim_pre, sep, mou, ext_hei, p_y_pos_win_cox_xsa{ind_win, 1})
[y_min, y_max, hax] = adj_y(hax, y_min, y_max);
hax.FontSize = fon_siz.pub;
ylabel(y_lab)
mar_siz = con_fil.mar_siz;
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
function h_fig = plo_ntt_occ_hea(pro_win_sam_row_col)
[h_fig, fig_wid, fig_hei] = fig;
n_row = 2;
n_col = 3;
gap_gap = 0.003;
gap_ver_row = gap_gap*ones(n_row, 1);
gap_hor_row_col = repmat([gap_gap gap_gap gap_gap], n_row, 1);
mar_bot = 0.025;
hei = 5;
mar_top = cal_mar_top(hei);
mar_lef = 0.008;
mar_rig = 0.001;
asp_rat_bar = 0.5;
asp_rat_are = 2/3;% 21 x 14 image (top 4 rows empty)
asp_rat_axe = [asp_rat_are asp_rat_are asp_rat_are ...
    asp_rat_are asp_rat_are asp_rat_are];
wid = false;
sca = 0.900;
sca_axe = [sca sca sca sca sca sca];
n_pix_ext = 33;
[hax_sub, pos_axe, hei_axe, dis_asp_rat, las_pix, rat_wid] = tight_subplot_gen(n_row, n_col, ...
    gap_ver_row, gap_hor_row_col, mar_bot, mar_top, mar_lef, mar_rig, asp_rat_axe, fig_wid, ...
    fig_hei, wid, sca_axe, n_pix_ext);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% heatmaps
con_fil = matfile('\\home.ansatt.ntnu.no\kadiram\Documents\MATLAB\con_esp.mat');
tit_sam = con_fil.tit_sam;
fon_siz = con_fil.fon_siz;
%pro_lim = [0 0.05];
%pro_lim = [0 0.03];
pro_lim = [0 0.02];
for i = 1:n_row
    for j = 1:n_col
        hax = hax_sub((i - 1)*n_col + j);
        ima = sho_ima.gra(hax, pro_win_sam_row_col{i, j}(5:end, :));
        colormap(hax, 'jet')
        clim(hax, pro_lim)
        if i == 1
            title(hax, tit_sam(j), FontWeight = 'normal', FontSize = fon_siz.pub)
        end
    end
end
lab.ear = ylabel(hax_sub(1), 'Early', FontSize = fon_siz.pub);
lab.ear.Position(1) = 0;
lab.lat = ylabel(hax_sub(1 + n_col), 'Late', FontSize = fon_siz.pub);
lab.lat.Position(1) = 0;
lef = hax.Position(1) + hax.Position(3) + 0.001;
h = colorbar(hax);
h.Ticks = pro_lim;
h.Label.String = 'probability';
h.Position(1) = lef;
h.Position(2) = hax.Position(2);
h.Position(3) = 0.001;
h.Position(4) = hax.Position(4);
h.FontSize = fon_siz.pub;
h.Label.Position(1) = 3;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
set(h_fig.Children, 'Units', 'pixels')
h_fig.Position(3) = las_pix;
h_fig.Renderer = 'painters';
h_fig.PaperSize(1) = rat_wid*h_fig.PaperSize(1);
h_fig.PaperUnits = 'normalized';
h_fig.PaperPosition = [0 0 1 1];
end
function h_fig = plo_ntt_occ(pro_win_sam_row_col, foc_ntt_win_cox_sam_ani, p_foc_win_cox_xsa)
[h_fig, fig_wid, fig_hei] = fig;
n_row = 2;
n_col = 4;
gap_gap = 0.003;
gap_ver_row = gap_gap*ones(n_row, 1);
gap_hor_row_col = repmat([gap_gap gap_gap 0.030 0.030], n_row, 1);
mar_bot = 0.025;
hei = 5;
mar_top = cal_mar_top(hei);
mar_lef = 0.008;
mar_rig = 0.001;
asp_rat_bar = 0.5;
asp_rat_are = 2/3;% 21 x 14 image (top 4 rows empty)
asp_rat_axe = [asp_rat_are asp_rat_are asp_rat_are asp_rat_bar ...
    asp_rat_are asp_rat_are asp_rat_are asp_rat_bar];
wid = false;
sca = 0.900;
sca_axe = [sca sca sca 1 sca sca sca 1];
n_pix_ext = 3;
[hax_sub, pos_axe, hei_axe, dis_asp_rat, las_pix, rat_wid] = tight_subplot_gen(n_row, n_col, ...
    gap_ver_row, gap_hor_row_col, mar_bot, mar_top, mar_lef, mar_rig, asp_rat_axe, fig_wid, ...
    fig_hei, wid, sca_axe, n_pix_ext);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% heatmaps
con_fil = matfile('\\home.ansatt.ntnu.no\kadiram\Documents\MATLAB\con_esp.mat');
tit_sam = con_fil.tit_sam;
fon_siz = con_fil.fon_siz;
pro_lim = [0 0.05];
for i = 1:n_row
    for j = 1:n_col - 1
        hax = hax_sub((i - 1)*n_col + j);
        ima = sho_ima.gra(hax, pro_win_sam_row_col{i, j}(5:end, :));
        colormap(hax, 'jet')
        clim(hax, pro_lim)
        if i == 1
            title(hax, tit_sam(j), FontWeight = 'normal', FontSize = fon_siz.pub)
        end
    end
end
lab.ear = ylabel(hax_sub(1), 'Early', FontSize = fon_siz.pub);
lab.ear.Position(1) = 0;
lab.lat = ylabel(hax_sub(1 + n_col), 'Late', FontSize = fon_siz.pub);
lab.lat.Position(1) = 0;
lef = hax.Position(1) + hax.Position(3) + 0.001;
h = colorbar(hax);
h.Ticks = pro_lim;
h.Label.String = 'probability';
h.Position(1) = lef;
h.Position(2) = hax.Position(2);
h.Position(3) = 0.001;
h.Position(4) = hax.Position(4);
h.FontSize = fon_siz.pub;
h.Label.Position(1) = 3;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% scatter
linkaxes(hax_sub([n_col n_row*n_col]))
y_min = inf;
y_max = -inf;
hax = hax_sub(n_col);
ind_con = 1;
ind_win = 1;
ind_sam = 1:3;
dat = true;
[h_plo, n_uni_sam] = plo_dat_err_xsa(hax, foc_ntt_win_cox_sam_ani, ind_win, ind_con, ...
    con_fil.mar_siz, con_fil.col_sam, ind_sam, dat);
[y_min, y_max, hax] = adj_y(hax, y_min, y_max);
hax.XAxis.Visible = 'off';
ylabel(hax, 'Focality')
%
hax = hax_sub(n_row*n_col);
axes(hax)
ind_con = 1;
ind_win = 2;
[h_plo, n_uni_sam] = plo_dat_err_xsa(hax, foc_ntt_win_cox_sam_ani, ind_win, ind_con, ...
    con_fil.mar_siz, con_fil.col_sam, ind_sam, dat);
[y_min, y_max, hax] = adj_y(hax, y_min, y_max);
hax.XTickLabels = con_fil.xtl_sam;
ylabel(hax, 'Focality')
%%%%%%%%%%%%%%%%%%%%%%%%%%%% sig
hax = hax_sub(n_col);
y_lim_pre = ylim(hax);
ind_win = 1;
% [~, y_lim] = sigstar_lim(hax, con_fil.gro_thr_cro, fon_siz, off_non, y_lim_pre, sep, mou, ext_hei, ...
%     p_foc_win_cox_xsa.lme{ind_win, 1});

mou = 0.010;
sep = mou + 0.040;
ext_hei = -(sep + mou);
ind_sig.sig(hax, con_fil.gro_thr_cro, y_lim_pre, sep, mou, ext_hei, p_foc_win_cox_xsa.rst{ind_win, 1})

[y_min, y_max, hax] = adj_y(hax, y_min, y_max);
hax = adj_hax(hax);
%
hax = hax_sub(n_row*n_col);
y_lim_pre = ylim(hax);
ind_win = 2;
% [~, y_lim] = sigstar_lim(hax, con_fil.gro_thr_cro, fon_siz, off_non, y_lim_pre, sep, mou, ext_hei, ...
%     p_foc_win_cox_xsa.lme{ind_win, 1});

ind_sig.sig(hax, con_fil.gro_thr_cro, y_lim_pre, sep, mou, ext_hei, p_foc_win_cox_xsa.rst{ind_win, 1})

[y_min, y_max, hax] = adj_y(hax, y_min, y_max);
hax = adj_hax(hax);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
set(h_fig.Children, 'Units', 'pixels')
h_fig.Position(3) = las_pix;
h_fig.Renderer = 'painters';
h_fig.PaperSize(1) = rat_wid*h_fig.PaperSize(1);
h_fig.PaperUnits = 'normalized';
h_fig.PaperPosition = [0 0 1 1];
end
function h_fig = plo_ntt_occ_sca(foc_ntt_win_cox_sam_ani, p_foc_win_cox_xsa)
[h_fig, fig_wid, fig_hei] = fig;
n_row = 1;
n_col = 2;
gap_ver_row = 0.070;
gap_hor_row_col = 0.010*ones(n_row, n_col);
mar_bot = 0.022;
con_fil = matfile('\\home.ansatt.ntnu.no\kadiram\Documents\MATLAB\con_esp.mat');
hei = con_fil.hei;
mar_top = cal_mar_top(hei);
mar_lef = 0.021;
mar_rig = 0.001;
asp_rat_bar = 0.5;
asp_rat_axe = [asp_rat_bar asp_rat_bar];
wid = false;
sca_axe = [1 1];
n_pix_ext = 3;
[hax_sub, pos_axe, hei_axe, dis_asp_rat, las_pix, rat_wid] = tight_subplot_gen(n_row, n_col, ...
    gap_ver_row, gap_hor_row_col, mar_bot, mar_top, mar_lef, mar_rig, asp_rat_axe, fig_wid, ...
    fig_hei, wid, sca_axe, n_pix_ext);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% scatter
linkaxes(hax_sub)
y_min = inf;
y_max = -inf;
hax = hax_sub(1);
ind_con = 1;
con_fil = matfile('\\home.ansatt.ntnu.no\kadiram\Documents\MATLAB\con_esp.mat');
ind_win = 1;
ind_sam = 1:3;
dat = true;
mar_siz = con_fil.mar_siz;
[h_plo, n_uni_sam, tic_sam] = plo_dat_err_xsa(hax, foc_ntt_win_cox_sam_ani, ind_win, ind_con, ...
    mar_siz.pub, con_fil.col_sam, ind_sam, dat);
[y_min, y_max, hax] = adj_y(hax, y_min, y_max);
hax.XTickLabels = con_fil.xtl_sam;
ylabel(hax, 'Focality')
%
hax = hax_sub(2);
ind_con = 1;
ind_win = 2;
[h_plo, n_uni_sam] = plo_dat_err_xsa(hax, foc_ntt_win_cox_sam_ani, ind_win, ind_con, ...
    mar_siz.pub, con_fil.col_sam, ind_sam, dat);
[y_min, y_max, hax] = adj_y(hax, y_min, y_max);
hax.XTickLabels = con_fil.xtl_sam;
hax.YAxis.Visible = 'off';
%%%%%%%%%%%%%%%%%%%%%%%%%%%% sig
hax = hax_sub(1);
gro_thr_cro = gen_gro_thr_cro(tic_sam);
y_lim_pre = ylim(hax);
ind_win = 1;
mou = 0.010;
sep = mou + 0.040;
ext_hei = -(sep + mou);
ind_sig.sig(hax, gro_thr_cro, y_lim_pre, sep, mou, ext_hei, p_foc_win_cox_xsa.rst{ind_win, 1})

[y_min, y_max, hax] = adj_y(hax, y_min, y_max);
fon_siz = 8;
mar_siz = con_fil.mar_siz;
log_lin_wid = true;
hax = adj_hax(hax, fon_siz, mar_siz.pub, log_lin_wid);
%
hax = hax_sub(2);
y_lim_pre = ylim(hax);
ind_win = 2;
ind_sig.sig(hax, gro_thr_cro, y_lim_pre, sep, mou, ext_hei, p_foc_win_cox_xsa.rst{ind_win, 1})
[y_min, y_max, hax] = adj_y(hax, y_min, y_max);
hax = adj_hax(hax, fon_siz, mar_siz.pub, log_lin_wid);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
set(h_fig.Children, 'Units', 'pixels')
h_fig.Position(3) = las_pix;
h_fig.Renderer = 'painters';
h_fig.PaperSize(1) = rat_wid*h_fig.PaperSize(1);
h_fig.PaperUnits = 'normalized';
h_fig.PaperPosition = [0 0 1 1];
end
function h_fig = plo_spe_sca(val_pos_win_cox_sam_ani, p_y_pos_win_cox_xsa)
[h_fig, fig_wid, fig_hei] = fig;
n_row = 1;
n_col = 2;
gap_ver_row = 0.070;
gap_hor_row_col = 0.010*ones(n_row, n_col);
mar_bot = 0.050;
%hei = 5;
%mar_top = cal_mar_top(hei);
mar_top = 0.050;
mar_lef = 0.050;
mar_rig = 0.001;
asp_rat_bar = 0.5;
asp_rat_axe = [asp_rat_bar asp_rat_bar];
wid = false;
sca_axe = [1 1];
n_pix_ext = 3;
[hax_sub, pos_axe, hei_axe, dis_asp_rat, las_pix, rat_wid] = tight_subplot_gen(n_row, n_col, ...
    gap_ver_row, gap_hor_row_col, mar_bot, mar_top, mar_lef, mar_rig, asp_rat_axe, fig_wid, ...
    fig_hei, wid, sca_axe, n_pix_ext);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% distance
y_lab = 'Speed change (a.u.)';
linkaxes(hax_sub)
y_min = inf;
y_max = -inf;
hax = hax_sub(1);
ind_con = 1;
ind_win = 1;
con_fil = matfile('\\home.ansatt.ntnu.no\kadiram\Documents\MATLAB\con_esp.mat');
fon_siz = con_fil.fon_siz;
mar_siz = con_fil.mar_siz;
ind_sam = 1:3;
dat = true;
[h_plo, n_uni_sam] = plo_dat_err_xsa(hax, val_pos_win_cox_sam_ani, ind_win, ind_con, ...
    mar_siz.pre, con_fil.col_sam, ind_sam, dat);
[y_min, y_max, hax] = adj_y(hax, y_min, y_max);
hax.XTickLabels = con_fil.xtl_sam;
%
hax = hax_sub(2);
ind_con = 1;
ind_win = 2;
[h_plo, n_uni_sam] = plo_dat_err_xsa(hax, val_pos_win_cox_sam_ani, ind_win, ind_con, ...
    mar_siz.pre, con_fil.col_sam, ind_sam, dat);
[y_min, y_max, hax] = adj_y(hax, y_min, y_max);
hax.YAxis.Visible = 'off';
hax.XTickLabels = con_fil.xtl_sam;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% sig
hax = hax_sub(1);
fon_siz_non = 18;
off_non = 0.020;
y_lim_pre = ylim;
mou = 0.010;
sep = mou + 0.040;
%sep = mou + 0.100;
ext_hei = -(sep + mou);
ind_win = 1;
ind_sig.duo(hax, con_fil.gro_thr_cro, fon_siz_non, off_non, y_lim_pre, sep, mou, ext_hei, ...
    p_y_pos_win_cox_xsa.lme{ind_win, 1}, p_y_pos_win_cox_xsa.rst{ind_win, 1})
[y_min, y_max, hax] = adj_y(hax, y_min, y_max);
hax.FontSize = fon_siz.pre;
title(hax, 'Early', 'FontWeight','normal')
ylabel(y_lab)
%hax = adj_hax(hax);
%
hax = hax_sub(2);
y_lim_pre = ylim;
ind_win = 2;
ind_sig.duo(hax, con_fil.gro_thr_cro, fon_siz_non, off_non, y_lim_pre, sep, mou, ext_hei, ...
    p_y_pos_win_cox_xsa.lme{ind_win, 1}, p_y_pos_win_cox_xsa.rst{ind_win, 1})
[y_min, y_max, hax] = adj_y(hax, y_min, y_max);
hax.FontSize = fon_siz.pre;
title(hax, 'Late', 'FontWeight','normal')
%hax = adj_hax(hax);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
set(h_fig.Children, 'Units', 'pixels')
h_fig.Position(3) = las_pix;
h_fig.Renderer = 'painters';
h_fig.PaperSize(1) = rat_wid*h_fig.PaperSize(1);
h_fig.PaperUnits = 'normalized';
h_fig.PaperPosition = [0 0 1 1];
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% behavioral plotting
function h_fig = plo_abs(abs_sam_ani, tit_sam, n_sam, p_abs_cro, ind_sam)
[h_fig, wid_mon, hei_mon] = fig;
n_row = 1;
n_col = 1;
gap_hor_col = 0.030;
% mar_bot = 0.060;
% mar_top = 0.017;
% mar_lef = 0.100;
% mar_rig = 0.001;

mar_bot = 0.015;
hei = 2.5;
mar_top = cal_mar_top(hei);
mar_lef = 0.025;
mar_rig = 0.001;

asp_rat_bar = 0.7;
asp_rat_axe = asp_rat_bar;
%
mar_siz = 20;
off_non = 0.015;
mou = 0.010;
sep = off_non + mou + 0.010;
fon_siz = 40;
gap_ver_row = 0.050*ones(n_row, 1);
gap_hor_row_col = repmat(gap_hor_col, n_row, 1);
wid = false;
sca_axe = ones(1, n_row*n_col);
n_pix_ext = 0;
[hax_sub, pos_axe, axh, dis_asp_rat, las_pix, rat_wid] = tight_subplot_gen(n_row, n_col, ...
    gap_ver_row, gap_hor_row_col, ...
    mar_bot, mar_top, mar_lef, mar_rig, asp_rat_axe, wid_mon, hei_mon, wid, sca_axe, n_pix_ext);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% across groups
hax = hax_sub(1);
axes(hax)
cro = ext_cro(ind_sam);
ind_con = 1;
tit_sam = tit_sam(ind_sam);
ind_win = 1;
dat = true;
con_fil = matfile('\\home.ansatt.ntnu.no\kadiram\Documents\MATLAB\con_esp.mat');
col_sam = con_fil.col_sam;
[~, n_ani_tai_sam, tic_sam] = ...
    plo_dat_err_xsa(hax, abs_sam_ani, ind_win, ind_con, mar_siz, col_sam, ind_sam, dat);
hax.XTick = 1:n_sam;
hax.TickLength = [0 0];
%hax.XTickLabel = tit_sam;
xtl_sam = con_fil.xtl_sam;

xticks(hax, tic_sam)
hax.XTickLabels = xtl_sam(1:2);

hax.FontSize = fon_siz;
y_lim_pre = ylim;
ext_hei = -(sep + mou);
%sigstar_lim(hax, cro, fon_siz, off_non, y_lim_pre, sep, mou, ext_hei, p_abs_cro.lme)
%ylabel('Average baseline speed (a. u.)')
%ylabel('Baseline speed (a. u.)')
ylabel(sprintf('Baseline speed \n (a. u.)'))
nor_x = 1.100;
n_cel_reg_sam = nan;
nor_y = 0.700;
wri_sam_siz(n_ani_tai_sam, n_cel_reg_sam, nor_x, ind_sam, tit_sam, nor_y)
fon_siz = con_fil.fon_siz;
mar_siz = con_fil.mar_siz;
log_lin_wid = true;
hax = adj_hax(hax, fon_siz.pub, mar_siz.pub, log_lin_wid);
h_fig = opt_h_fig(h_fig, las_pix, rat_wid);
end

function plo_ave_ang_xep(ave_ang_epo_sam_ani, tit_n_sam, n_sam, p_ave_ang_sam_xep, ...
    ind_sam, col_sam)
[~, wid_mon, hei_mon] = fig;
n_row = 1;
n_col = n_sam;
gap_ver = 0.050;
gap_hor_col = 0.030*ones(n_col, 1);
mar_bot = 0.100;
mar_top = 0.100;
mar_lef = 0.050;
mar_rig = 0.001;
asp_rat_axe = ones(n_col, 1);
hax_sub = tight_subplot_gen(n_row, n_col, gap_ver, gap_hor_col, mar_bot, mar_top, ...
    mar_lef, mar_rig, asp_rat_axe, wid_mon, hei_mon);
linkaxes(hax_sub)
%
off_non = 0.015;
mou = 0.010;
sep = off_non + mou + 0.010;
global fon_siz siz n_win_ong nam_win
col_sam_con = {"k", "k", "k", "k"; "k", "k", "k", "k"};
y_min = inf;
y_max = -inf;
tit_n_sam = tit_n_sam(ind_sam);
for i = 1:n_sam
    hax = hax_sub(i);
    ind_win = 1;
    ind = ind_sam(i);
    h_plo = plo_dat_err_xco(hax, ave_ang_epo_sam_ani, ind_win, ind, siz, col_sam_con);
    [y_min, y_max, hax] = adj_y(hax, y_min, y_max);
    title(hax, tit_n_sam(ind), 'FontWeight', 'Normal')
    hax.XTick = 1:n_win_ong;
    hax.TickLength = [0 0];
    hax.XTickLabel = nam_win;
    hax.FontSize = fon_siz;
end
%
n_com = n_win_ong - 1;
com_cel = cell(n_com, 1);
for i = 1:n_com
    com_cel{i} = [i i + 1];
end
for i = 1:n_sam
    hax = hax_sub(i);
    y_lim_pre = ylim(hax);
    ext_hei = -(sep + mou);
    ind = ind_sam(i);
    sigstar_lim(hax, com_cel, fon_siz, off_non, y_lim_pre, sep, mou, ext_hei, ...
        p_ave_ang_sam_xep{ind})
end
ylabel(hax_sub(1), 'Average tail angle (rad)')
end

function h_fig = plo_ave_ang_xsa(nta_sam_fra_sta_con, y_lab, n_sam, n_con, p_nta_win_con_xsa, ...
    ind_sam, col_sam_con, log_fra)
n_row = 1;
n_col = 3;
[h_fig, fig_wid, fig_hei] = fig;
gap_ver_row = 0.030;
mar_bot = 0.040;
mar_top = 0.015;
mar_lef = 0.055;
mar_rig = 0.001;
global asp_rat_sig tim_fra win_len
gap_hor_row_col = [0.015 0.015 0.015];
asp_rat_axe = [asp_rat_sig asp_rat_sig asp_rat_sig];
sca_axe = [1 1 1];
wid = true;
n_pix_ext = 10;
[hax_sub, ~, ~, ~, las_pix, rat_wid] = tight_subplot_gen(n_row, n_col, ...
    gap_ver_row, gap_hor_row_col, mar_bot, mar_top, mar_lef, mar_rig, asp_rat_axe, fig_wid, ...
    fig_hei, wid, sca_axe, n_pix_ext);
linkaxes(hax_sub)
y_min = inf;
y_max = -inf;
h_con = cell(n_con, 1);
x_lab = 'Time (s)';
hax_tap = [];
for j = 1:n_con
    hax = hax_sub(j);
    for i = 1:n_sam
        ind = ind_sam(i);

        [mea_dep_var_sam, sem_dep_var_sam] = smo_mea_sem(nta_sam_fra_sta_con{ind}(log_fra, 1, j), ...
            nta_sam_fra_sta_con{ind}(log_fra, 2, j), win_len.tai);

        h_con_i = plo_sha(hax, tim_fra.ani.tri(log_fra), ...
            mea_dep_var_sam, ...
            sem_dep_var_sam, col_sam_con(ind, j));
        h_con{j} = [h_con{j}; h_con_i];
    end
    [y_min, y_max, hax] = adj_y(hax, y_min, y_max);
    xlabel(hax, x_lab)
    if j == 1
        ylabel(hax, y_lab)
    else
        hax.YAxis.Visible = 'off';
    end
    hax_tap = [hax_tap; hax];
end
nor_x = 0.5;
nor_y = 0.7;
log_all = true;
nor_x_two = 2.5/3;
for j = 1:n_con
    plo_lin_sub_tri(hax_tap(j), win_len.tai.sec)
    pri_sig_duo(hax_sub(j), nor_x, nor_y, p_nta_win_con_xsa.lme{2, j}, p_nta_win_con_xsa.rst{2, j}, ...
        log_all)
    pri_sig_duo(hax_sub(j), nor_x_two, nor_y, p_nta_win_con_xsa.lme{3, j}, ...
        p_nta_win_con_xsa.rst{3, j}, log_all)
end
h_fig = opt_h_fig(h_fig, las_pix, rat_wid);
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function plo_tai_wit(bea_lat_sam_ani_tri, lat_win_con_sam_ani, tit_n_sam, n_sam, ...
    p_lat_sam_cro, pro_win_con_sam_ani, per_pro_shu_sam_ani, ...
    p_sam_cro, pre, log_sam_ani, ind_sam, col_sam_con)
[~, fig_wid, fig_hei] = fig;
n_row = n_sam;
n_col = 3;
if pre
    gap_ver = 0.100;
else
    gap_ver = 0.030;
end
gap_hor_col = [0.130 0.070 0.070];
mar_bot = 0.065;
mar_top = 0.065;
mar_lef = 0.040;
mar_rig = 0.001;
asp_rat_map_sam = nan(n_sam, 1);
global n_tri
for i = 1:n_sam
    n_ani = sum(log_sam_ani{i});
    asp_rat_map_sam(i) = n_tri/n_ani;
end
asp_rat_map = 1;
asp_rat_bar = 0.5;
asp_rat_axe = [asp_rat_map asp_rat_bar asp_rat_bar...
    asp_rat_map asp_rat_bar asp_rat_bar...
    asp_rat_map asp_rat_bar asp_rat_bar];
hax_sub = tight_subplot_gen(n_row, n_col, gap_ver, gap_hor_col, mar_bot, mar_top, ...
    mar_lef, mar_rig, asp_rat_axe, fig_wid, fig_hei);
hax_pro_ele = [];
hax_lat_ele = [];
for i = 1:n_sam
    hax_pro_ele = [hax_pro_ele hax_sub(2 + (i - 1)*n_col)];
    %
    hax_lat_ele = [hax_lat_ele hax_sub(3 + (i - 1)*n_col)];
end
linkaxes(hax_pro_ele)
linkaxes(hax_lat_ele)
%
bea_lat_ani_tri = [];
for i = 1:n_sam
    bea_lat_ani_tri = [bea_lat_ani_tri; bea_lat_sam_ani_tri{i}];
end
global mil
min_par = min(bea_lat_ani_tri, [], 'all')/mil;
max_par = max(bea_lat_ani_tri, [], 'all')/mil;
%
siz = 10;
global con_sup_sho_int
y_min = inf;
y_max = -inf;
off_non = 0.100;
mou = 0.050;
sep = off_non + mou + 0.050;
global y_lab_lat
global fon_siz
global n_tri_con
log_tex = true;
cha = false;
ext_hei = -(sep + mou);
ind_win = 1;
x_lab = 'Trial #';
for i = 1:n_sam
    ind_i = (i - 1)*n_col + 1;
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% image
    hax_i = hax_sub(ind_i);
    axes(hax_i)
    ind = ind_sam(i);
    bea_par_ani_tri = bea_lat_sam_ani_tri{ind}(log_sam_ani{ind}, :)/mil;
    plo_par_map_mul(bea_par_ani_tri, hax_sub(ind_i), min_par, max_par, true)
    %
    ylabel('Animal #')
    %
    col_han = colorbar;
    col_han.Position(1) = col_han.Position(1) + 0.03;
    col_han.Label.String = y_lab_lat;
    col_han.FontSize = fon_siz;
    %
    if i == 1
        x = 3;
        nor_y = 1 + 0.060;
        text(gca, x/n_tri, nor_y, 'Low', 'HorizontalAlignment', 'center', 'Units', 'normalized')
        text(gca, (x + n_tri_con)/n_tri, nor_y, 'Medium', 'HorizontalAlignment', 'center', ...
            'Units', 'normalized')
        text(gca, (x + 2*n_tri_con)/n_tri, nor_y, 'High', 'HorizontalAlignment', 'center', ...
            'Units', 'normalized')
    end
    % sample title
    tit = tit_n_sam(ind);
    h = title(tit, 'FontWeight', 'normal');
    h.Units = 'normalized';
    if i == 1
        h.Position(2) = 1 + 0.100;
    else
        h.Position(2) = 1 + 0.010;
    end
    if pre
        xlabel(x_lab)
    elseif i == n_sam
        xlabel(x_lab)
    end
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% probability
    hax_pro_i = hax_sub(ind_i + 1);
    plo_pro_onl(pro_win_con_sam_ani, per_pro_shu_sam_ani, ...
        hax_pro_i, p_sam_cro, off_non, sep, mou, log_tex, ind, ...
        cha, ext_hei)
    y_lab = '%tailbeat probability';
    h_lab_bot = ylabel(y_lab);
    h_lab_bot.Units = 'inches';
    hax_pro_i.FontSize = fon_siz;
    if pre
        xticklabels(con_sup_sho_int)
        h = title(tit, 'FontWeight', 'normal');
        h.Units = 'normalized';
        if i == 1
            h.Position(2) = 1 + 0.100;
        else
            h.Position(2) = 1 + 0.010;
        end
    else
        if i == n_sam
            xticklabels(con_sup_sho_int)
        else
            xticks([])
            set(hax_sub(ind_i + 1), 'xcolor', 'w')
        end
    end
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% latency
    hax_pro_i = hax_sub(ind_i + 2);
    plo_dat_err_xco(hax_pro_i, cellfun(@mul_kil_cel, lat_win_con_sam_ani, 'UniformOutput', ...
        false), ind_win, ind, siz, col_sam_con)
    xlim([1 - 0.3 3 + 0.3])%%%%%%%%%%%%%%%%%%%%%%
    [y_min, y_max, hax_pro_i] = adj_y(hax_pro_i, y_min, y_max);
    h_lab_bot = ylabel(y_lab_lat);
    h_lab_bot.Units = 'inches';
    hax_pro_i.FontSize = fon_siz;
    if pre
        xticklabels(con_sup_sho_int)
        h = title(tit, 'FontWeight', 'normal');
        h.Units = 'normalized';
        if i == 1
            h.Position(2) = 1 + 0.100;
        else
            h.Position(2) = 1 + 0.010;
        end
    else
        if i == n_sam
            xticklabels(con_sup_sho_int)
        else
            xticks([])
            set(hax_sub(ind_i + 2), 'xcolor', 'w')
        end
    end
end
global gro_thr_cro
y_min = inf;
y_max = -inf;
for i = 1:n_sam
    ind_i = (i - 1)*n_col + 1;
    hax_pro_i = hax_sub(ind_i + 2);
    axes(hax_pro_i)
    y_lim_pre = ylim;
    sigstar_lim(hax_pro_i, gro_thr_cro, fon_siz, off_non, y_lim_pre, sep, mou, ext_hei, ...
        p_lat_sam_cro{ind_sam(i)})
    [y_min, y_max, hax_pro_i] = adj_y(hax_pro_i, y_min, y_max);
    [off_non, sep, mou, ext_hei] = adj_sig(y_lim_pre, hax_pro_i, off_non, sep, mou, ext_hei);
end
end

function plo_par_map_mul(hax, var_ani_tri, min_val, max_val, lin)
n_col_ori = 256;
n_col_tot = n_col_ori + 1;
var_ani_tri(isnan(var_ani_tri)) = max_val + (max_val - min_val)/(n_col_tot - 2);

ind_var_col = nan;
ima(hax, ind_var_col, var_ani_tri)

map_mat = [cool(n_col_ori); [0 0 0]];
colormap(map_mat);
%%%%%%%%%%%%%
col = 'red';
if lin
    lin_wid = 2.25;
    lin_sty = '-';
    plo_ver_lin(hax, 12.5, col, lin_wid, lin_sty)
    plo_ver_lin(hax, 6.5, col, lin_wid, lin_sty)
end
fon_siz = 20;
enl_num(fon_siz)
end

function plo_tai_cro(bea_lat_sam_ani_tri, lat_win_con_sam_ani, tit_sam, n_sam, ...
    p_lat_win_con_xsa, pro_win_con_sam_ani, ind_sam, ...
    p_pro_win_con_xsa, pre, log_sam_ani, col_sam_con)
[~, fig_wid, fig_hei] = fig;
n_row = 3;
n_bar_plo = 2;
n_col = n_sam + n_bar_plo;
if pre
    gap_ver = 0.100;
else
    gap_ver = 0.050;
end
gap_hor_col = [0.020*ones(1, n_sam - 1) [0.120 0.060 0.060]];
mar_bot = 0.065;
mar_top = 0.070;
mar_lef = 0.040;
mar_rig = 0.001;
global mil
asp_rat_map = 1;
asp_rat_bar = 0.5;
n_con = 3;
asp_rat_map_axe = asp_rat_map*ones(1, n_sam);
asp_rat_bar_axe = asp_rat_bar*ones(1, n_bar_plo);
asp_rat_axe = [asp_rat_map_axe asp_rat_bar_axe];
asp_rat_axe = repmat(asp_rat_axe, 1, n_row);
hax_sub = tight_subplot_gen(n_row, n_col, gap_ver, gap_hor_col, mar_bot, mar_top, ...
    mar_lef, mar_rig, asp_rat_axe, fig_wid, fig_hei);
poi_pro = n_sam + 1;
poi_lat = poi_pro + 1;
hax_pro_ele = hax_sub(poi_pro:n_col:end);
hax_lat_ele = hax_sub(poi_lat:n_col:end);
linkaxes(hax_pro_ele)
linkaxes(hax_lat_ele)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% across groups
siz = 10;
cro = ext_cro(ind_sam);
global con_int
fon_siz_non = 18;
off_non = 0.070;
mou = 0.050;
sep = off_non + mou + 0.050;
ext_hei = -0.070;
global fon_siz
global y_lab_pro
global y_lab_lat
global log_con_tri
[min_par, max_par] = ext_min_max(bea_lat_sam_ani_tri);
dat = true;
y_min_pro = inf;
y_max_pro = -inf;
y_min_lat = inf;
y_max_lat = -inf;
ind_win = 1;
for i = 1:n_con
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% maps
    for j = 1:n_sam
        hax_map = hax_sub((i - 1)*n_col + j);
        axes(hax_map)
        ind = ind_sam(j);
        bea_par_ani_tri = bea_lat_sam_ani_tri{ind}(log_sam_ani{ind}, log_con_tri(i, :))/mil;
        plo_par_map_mul(bea_par_ani_tri, hax_map, min_par, max_par, false)
        if i == 1
            tit = tit_sam{ind};
        else
            tit = ' ';
        end
        if j == 1
            ylabel('Animal #')
            %sub_tit = ' ';
        elseif j == n_sam
            col_han = colorbar;
            col_han.Position(1) = col_han.Position(1) + 0.03;
            col_han.Label.String = y_lab_lat;
            col_han.FontSize = fon_siz;
            %sub_tit = ' ';
%         else
%             sub_tit = con_int{i};
        end
        xlabel('Trial #')
        sub_tit = con_int{i};
        title(tit, sub_tit, 'FontWeight', 'normal', 'FontSize', fon_siz)
    end
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% bars
    for j = 1:2 % pro and lat
        if j == 1
            hax_cro = hax_sub((i - 1)*n_col + poi_pro);
        else
            hax_cro = hax_sub((i - 1)*n_col + poi_lat);
        end
        axes(hax_cro)
        if j == 1
            plo_dat_err_xsa(hax_cro, pro_win_con_sam_ani, ind_win, i, siz, col_sam_con, ...
                ind_sam, dat)
        else
            plo_dat_err_xsa(hax_cro, ...
                cellfun(@mul_kil_cel, lat_win_con_sam_ani, 'UniformOutput', false), ...
                ind_win, i, siz, col_sam_con, ind_sam, dat)
        end
        xlim([1 - 0.3 n_sam + 0.3])
        if pre
            hax_cro.XTickLabel = tit_sam(ind_sam);
        else
            if i == n_con
                hax_cro.XTickLabel = tit_sam(ind_sam);
            else
                set(hax_cro, 'xcolor', 'w')
            end
        end
    end
end
%
for i = 1:n_con
    for j = 1:2 % pro and lat
        if j == 1
            hax_cro = hax_sub((i - 1)*n_col + poi_pro);
        else
            hax_cro = hax_sub((i - 1)*n_col + poi_lat);
        end
        axes(hax_cro)
        y_lim_pre = ylim;
        if j == 1
            [y_min_pro, y_max_pro, hax_cro] = adj_y(hax_cro, y_min_pro, y_max_pro);
            sigstar_lim(hax_cro, cro, fon_siz_non, off_non, y_lim_pre, sep, mou, ext_hei, ...
                p_pro_win_con_xsa{ind_win, i})
            ylabel(y_lab_pro)
        else
            [y_min_lat, y_max_lat, hax_cro] = adj_y(hax_cro, y_min_lat, y_max_lat);
            sigstar_lim(hax_cro, cro, fon_siz_non, off_non, y_lim_pre, sep, mou, ext_hei, ...
                p_lat_win_con_xsa{ind_win, i})
            ylabel(y_lab_lat)
        end
        title(con_int{i}, 'FontWeight', 'normal');
    end
end
%
for i = 1:n_con
    for j = 1:2 % pro and lat
        if j == 1
            hax_cro = hax_sub((i - 1)*n_col + poi_pro);
        else
            hax_cro = hax_sub((i - 1)*n_col + poi_lat);
        end
        axes(hax_cro)
        %hax_cro.FontSize = 18;
        hax_cro.FontSize = fon_siz;
    end
end
end
%
function plo_pro_sam_sim(bea_lat_sam_ani_tri, per_pro_sam_ani_con, per_pro_shu_sam_ani, ...
    fon_siz, tit_sam, n_sam, p_sam_cro, sim, p_con_cro, tit_sho_sam)
y_lab = 'Animal';
fig
gap_ver = 0.1;
gap_hor = 0.005;
mar_bot = 0.04;
mar_top = 0.043;
mar_lef = 0.047;
if sim == true
    mar_rig = 0.005;
else
    mar_rig = 0.065;
end
n_row = 3;
n_sub_one = 7;
n_col = n_sam*n_sub_one;
hax_sub = tight_subplot(n_row, n_col, [gap_ver gap_hor], [mar_bot mar_top], [mar_lef mar_rig]);
linkaxes(hax_sub(n_col + 1:end), 'y')
global con_int % low, mod, hig
off_non = 0.070;
mou = 0.030;
sep = off_non + mou + 0.040;
log_tex = true;
global col_sam_con
ext_hei = -(sep + mou);
for i = 1:n_sam
    ind_i = (i - 1)*n_sub_one + 1;
    pos_end = hax_sub(ind_i + n_sub_one - 1).Position;
    delete(hax_sub(ind_i + 1:ind_i + n_sub_one - 1))
    hax_sub(ind_i).Position(3) = pos_end(1) + pos_end(3) - hax_sub(ind_i).Position(1);
    hax_i = hax_sub(ind_i);
    axes(hax_i)
    plo_log_map(bea_lat_sam_ani_tri{i}, hax_sub(ind_i))
    if i == 1
        h_lab = ylabel(y_lab);
        h_lab.Units = 'inches';
    elseif i == n_sam && sim == false
        col_han = colorbar;
        col_han.Position(1) = col_han.Position(1) + 0.03;
        col_han.Label.String = 'Latency (ms)';
        hax_i.YColor = 'none';
    else
        hax_i.YColor = 'none';
    end
    h = title(tit_sam(i), 'FontWeight', 'normal');
    h.Units = 'normalized';
    h.Position(2) = 1 + 0.06;
    %%%%%%%%%%%%%%%%%%%
    ind_end = ind_i + n_col + n_sub_one - 2;
    pos_end = hax_sub(ind_end).Position; % must be here
    delete(hax_sub(ind_i + n_col + 1:ind_end))
    hax_pro_i = hax_sub(ind_i + n_col);
    hax_pro_i.Position(3) = pos_end(1) + pos_end(3) - hax_pro_i.Position(1);
    plo_pro_onl(per_pro_sam_ani_con{i}, per_pro_shu_sam_ani{i}, ...
        hax_pro_i, p_sam_cro{i}, ...
        off_non, sep, mou, log_tex, col_sam_con(i, :), false, ext_hei)
    y_lab = '%tailbeat probability';
    if i == 1
        h_lab_bot = ylabel(y_lab);
        h_lab_bot.Units = 'inches';
    else
        yticks([])
        set(hax_pro_i, 'ycolor', 'w')
    end
    %%%%%%%%%%%%%%%%%%%%%%
    y_lim = ylim;
    y_min = y_lim(1);
    y_max = y_lim(2);
    hax = hax_sub(ind_i + n_col + n_sub_one - 1);
    axes(hax)
    plo_cha_lev(per_pro_shu_sam_ani{i})
    hax.YLim = [y_min y_max];
    set(hax_sub(ind_i + n_col + n_sub_one - 1), 'ycolor', 'w')
end
h_lab.Position(1) = h_lab_bot.Position(1);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
siz = 70;
global n_con
cro = com_cro(n_sam);
for i = 1:n_con
    ind_i = 2*n_sub_one*n_sam + (i - 1)*n_sub_one + 1;
    pos_end = hax_sub(ind_i + n_sub_one - 1).Position;
    delete(hax_sub(ind_i + 1:ind_i + n_sub_one - 1))
    hax_sub(ind_i).Position(3) = pos_end(1) + pos_end(3) - hax_sub(ind_i).Position(1);
    hax_pro_i = hax_sub(ind_i);
    axes(hax_pro_i)
    h_plo = plo_bar_dat_mul(per_pro_sam_ani_con, i, siz, true);
    y_lab = '%tailbeat probability';
    if i == 1
        h_lab_bot = ylabel(y_lab);
        h_lab_bot.Units = 'inches';
    else
        yticks([])
        set(hax_pro_i, 'ycolor', 'w')
    end
    hax_pro_i.XTickLabel = tit_sho_sam;
    hax_pro_i.FontSize = fon_siz;
    y_lim_pre = ylim;
    sigstar_lim(cro, fon_siz, off_non, y_lim_pre, sep, mou, ext_hei, p_con_cro(i, :))
    title(con_int{i}, 'FontWeight', 'normal')
end
end

function plo_pro_sam_sim_two(bea_lat_sam_ani_tri, per_pro_sam_ani_con, ...
    per_pro_shu_sam_ani, fon_siz, tit_sam, n_ani_sam, n_sam, p_sam_cro, sim, p_con_cro)
y_lab = 'Animal';
fig
gap_ver = 0.070;
gap_hor = 0.005;
mar_bot = 0.040;
mar_top = 0.047;
mar_lef = 0.047;
if sim == true
    mar_rig = 0.005;
else
    mar_rig = 0.065;
end
n_row = 2;
n_sub_one = 7;
global n_con
n_sub_pro = 4;
n_col = n_sam*n_sub_one + n_sub_pro*n_con;
hax_sub = tight_subplot(n_row, n_col, [gap_ver gap_hor], [mar_bot mar_top], [mar_lef mar_rig]);
linkaxes(hax_sub(n_col + 1:end), 'y')
con_int_sho = {'L'; 'M'; 'H'};
off_non = 0.040;
mou = 0.030;
sep = off_non + mou + 0.030;
for i = 1:n_sam
    ind_i = (i - 1)*(n_col/2) + 1;
    pos_end = hax_sub(ind_i + n_col/2 - 1).Position;
    delete(hax_sub(ind_i + 1:ind_i + n_col/2 - 1))
    hax_sub(ind_i).Position(3) = pos_end(1) + pos_end(3) - hax_sub(ind_i).Position(1);
    hax_i = hax_sub(ind_i);
    axes(hax_i)
    plo_lat_map_sim(bea_lat_sam_ani_tri{i}, hax_sub(ind_i), sim);
    if i == 1
        h_lab = ylabel(y_lab);
        h_lab.Units = 'inches';
    elseif i == n_sam && sim == false
        col_han = colorbar;
        col_han.Position(1) = col_han.Position(1) + 0.03;
        col_han.Label.String = 'Latency (ms)';
        hax_i.YColor = 'none';
    else
        hax_i.YColor = 'none';
    end
    tit = strcat(tit_sam{i}, "; n = ", sprintf('%d', n_ani_sam{i}));
    h = title(tit, 'FontWeight', 'normal');
    h.Units = 'normalized';
    h.Position(2) = 1 + 0.050;
    %%%%%%%%%%%%%%%%%%%
    if i == 1
        ind_add = n_col;
    else
        ind_add = n_col/2 + n_sub_one;
    end
    pos_end = hax_sub(ind_i + ind_add + n_sub_one - 2).Position; % must be here
    delete(hax_sub(ind_i + ind_add + 1:ind_i + ind_add + n_sub_one - 2))
    hax_pro_i = hax_sub(ind_i + ind_add);
    hax_pro_i.Position(3) = pos_end(1) + pos_end(3) - hax_pro_i.Position(1);
    plo_pro_onl(per_pro_sam_ani_con{i}, per_pro_shu_sam_ani{i}, ...
        hax_pro_i, p_sam_cro{i}, ...
        off_non, con_int_sho, sep, mou, false)
    y_lab = '%tailbeat probability';
    if i == 1
        h_lab_bot = ylabel(y_lab);
        h_lab_bot.Units = 'inches';
    else
        yticks([])
        set(hax_pro_i, 'ycolor', 'w')
    end
    %%%%%%%%%%%%%%%%%%%%%%
    axes(hax_sub(ind_i + ind_add + n_sub_one - 1))
    plo_cha_lev(per_pro_shu_sam_ani{i})
    set(hax_sub(ind_i + ind_add + n_sub_one - 1), 'ycolor', 'w')
    %
    axes(hax_sub(ind_i + ind_add))
    h = title(tit, 'FontWeight', 'normal');
    h.Units = 'normalized';
    h.Position(2) = 1 + 0.050;
end
h_lab.Position(1) = h_lab_bot.Position(1);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
siz = 70;
cro = com_cro(n_sam);
global con_int % low, mod, hig
for i = 1:n_con
    ind_i = n_col + n_sub_one*n_sam + (i - 1)*n_sub_pro + 1;
    pos_end = hax_sub(ind_i + n_sub_pro - 1).Position;
    delete(hax_sub(ind_i + 1:ind_i + n_sub_pro - 1))
    hax_sub(ind_i).Position(3) = pos_end(1) + pos_end(3) - hax_sub(ind_i).Position(1);
    hax_pro_i = hax_sub(ind_i);
    axes(hax_pro_i)
    h_plo = plo_bar_dat_mul(per_pro_sam_ani_con, i, siz);
    y_lab = '%tailbeat probability';
    yticks([])
    set(hax_pro_i, 'ycolor', 'w')
    hax_pro_i.XTickLabel = {'tph2', 'Control'};
    hax_pro_i.FontSize = fon_siz;
    y_lim_pre = ylim;
    sigstar_lim(cro, fon_siz - 0, off_non, y_lim_pre, sep, mou, p_con_cro(i, :))
    title(con_int{i}, 'FontWeight', 'normal')
end
end

function plo_lat_two(bea_lat_sam_ani_tri, bea_lat_sam_ani_con, ...
    fon_siz, tit_sam, n_ani_sam, n_sam, p_lat_sam_cro, p_lat_con_cro)
y_lab_ima = 'Animal';
fig
gap_ver = 0.085;
gap_hor = 0.005;
mar_bot = 0.040;
mar_top = 0.047;
mar_lef = 0.047;
sim = false;
if sim == true
    mar_rig = 0.005;
else
    mar_rig = 0.065;
end
n_row = 2;
n_sub_one = 3;
global n_con
n_sub_pro = 2;
n_col = n_sam*n_sub_one + n_sub_pro*n_con;
hax_sub = tight_subplot(n_row, n_col, [gap_ver gap_hor], [mar_bot mar_top], [mar_lef mar_rig]);
linkaxes(hax_sub(n_col + 1:end), 'y')
con_int_sho = {'L'; 'M'; 'H'};
off_non = 0.040;
mou = 0.030;
sep = off_non + mou + 0.030;
y_lab = 'Latency (ms)';
global mil
y_max = -inf;
dat_max_sam = nan(1, n_sam);
siz = 70;
col_con = ["black"; "black"; "black"];
for i = 1:n_sam
    ind_i = (i - 1)*(n_col/2) + 1;
    pos_end = hax_sub(ind_i + n_col/2 - 1).Position;
    delete(hax_sub(ind_i + 1:ind_i + n_col/2 - 1))
    hax_sub(ind_i).Position(3) = pos_end(1) + pos_end(3) - hax_sub(ind_i).Position(1);
    hax_i = hax_sub(ind_i);
    axes(hax_i)
    plo_lat_map_sim(bea_lat_sam_ani_tri{i}, hax_sub(ind_i), sim);
    if i == 1
        h_lab = ylabel(y_lab_ima);
        h_lab.Units = 'inches';
    elseif i == n_sam && sim == false
        col_han = colorbar;
        col_han.Position(1) = col_han.Position(1) + 0.03;
        col_han.Label.String = 'Latency (ms)';
        hax_i.YColor = 'none';
    else
        hax_i.YColor = 'none';
    end
    tit = strcat(tit_sam{i}, "; n = ", sprintf('%d', n_ani_sam{i}));
    h = title(tit, 'FontWeight', 'normal');
    h.Units = 'normalized';
    h.Position(2) = 1 + 0.050;
    %%%%%%%%%%%%%%%%%%%
    if i == 1
        ind_add = n_col;
    else
        ind_add = n_col/2 + n_sub_one;
    end
    pos_end = hax_sub(ind_i + ind_add + n_sub_one - 1).Position; % must be here
    delete(hax_sub(ind_i + ind_add + 1:ind_i + ind_add + n_sub_one - 1))
    hax_pro_i = hax_sub(ind_i + ind_add);
    hax_pro_i.Position(3) = pos_end(1) + pos_end(3) - hax_pro_i.Position(1);
    axes(hax_sub(ind_i + ind_add))
    bea_lat_sam_ani_con{i} = bea_lat_sam_ani_con{i}/mil;
    dat_max_sam(i) = max(bea_lat_sam_ani_con{i}, [], 'all');
    plo_bar_dat(bea_lat_sam_ani_con{i}, col_con, siz);
    y_lim = hax_pro_i.YLim;
    if y_lim(2) < y_max
        hax_pro_i.YLim(2) = y_max;
    end
    if i == 1
        h_lab_bot = ylabel(y_lab);
        h_lab_bot.Units = 'inches';
    else
        yticks([])
        set(hax_pro_i, 'ycolor', 'w')
    end
    %%%%%%%%%%%%%%%%%%%%%%
    h = title(tit, 'FontWeight', 'normal');
    h.Units = 'normalized';
    h.Position(2) = 1 + 0.050;
    %
    xticklabels(con_int_sho)
    hax_sub(ind_i + ind_add).XAxis.TickLength = [0 0];
end
h_lab.Position(1) = h_lab_bot.Position(1);
%
y_min = inf;
for i = 1:n_con
    ind_i = n_col + n_sub_one*n_sam + (i - 1)*n_sub_pro + 1;
    pos_end = hax_sub(ind_i + n_sub_pro - 1).Position;
    delete(hax_sub(ind_i + 1:ind_i + n_sub_pro - 1))
    hax_sub(ind_i).Position(3) = pos_end(1) + pos_end(3) - hax_sub(ind_i).Position(1);
    hax_pro_i = hax_sub(ind_i);
    axes(hax_pro_i)
    h_plo = plo_bar_dat_mul(bea_lat_sam_ani_con, i, siz);
    yticks([])
    set(hax_pro_i, 'ycolor', 'w')
    hax_pro_i.XTickLabel = {'tph2', 'Control'};
    hax_pro_i.FontSize = fon_siz;
    [y_min, y_max, hax_pro_i] = adj_y(hax_pro_i, y_min, y_max);
    hax_pro_i.XAxis.TickLength = [0 0];
end
%
[~, ind] = sort(dat_max_sam, 'descend');
y_lim_pre = hax_pro_i.YLim;
cro = com_cro(n_con);
for i = ind
    if i == 1
        ind_add = n_col;
    else
        ind_add = n_col/2 + n_sub_one;
    end
    ind_i = (i - 1)*(n_col/2) + 1;
    hax_pro_i = hax_sub(ind_i + ind_add);
    axes(hax_pro_i)
    sigstar_lim(cro, fon_siz, off_non, y_lim_pre, sep, mou, p_lat_sam_cro{i})
end
%
cro = com_cro(n_sam);
global con_int % low, mod, hig
for i = 1:n_con
    ind_i = n_col + n_sub_one*n_sam + (i - 1)*n_sub_pro + 1;
    hax_pro_i = hax_sub(ind_i);
    axes(hax_pro_i)
    y_lim_pre = ylim;
    sigstar_lim(cro, fon_siz - 0, off_non, y_lim_pre, sep, mou, p_lat_con_cro(i, :))
    h = title(con_int{i}, 'FontWeight', 'normal');
    h.Units = 'normalized';
    h.Position(2) = 1 + 0.050;
end
end

function plo_beh_mod(bea_lat_sam_ani_tri, bea_lat_sam_ani_con, ...
    tit_sam, n_ani_sam, n_sam, p_lat_sam_cro, p_lat_con_cro, y_lab)
global fon_siz
n_row = 3;
n_con = 3;
n_col = 3;
y_lab_ima = 'Animal';
fig
gap_ver = 0.070;
gap_hor = 0.003;
mar_bot = 0.040;
mar_top = 0.045;
mar_lef = 0.045;
sim = false;
if sim == true
    mar_rig = 0.005;
else
    mar_rig = 0.060;
end
%
bea_lat_ani_tri = [];
for i = 1:n_sam
    bea_lat_ani_tri = [bea_lat_ani_tri; bea_lat_sam_ani_tri{i}];
end
min_par = min(bea_lat_ani_tri, [], 'all');
max_par = max(bea_lat_ani_tri, [], 'all');
global y_lab_lat
%
hax_sub = tight_subplot(n_row, n_col, [gap_ver gap_hor], [mar_bot mar_top], [mar_lef mar_rig]);
linkaxes(hax_sub(n_col + 1:n_row*n_col))
siz = 70;
col_con = ["black"; "black"; "black"];
cro = com_cro(n_sam);
global con_int
global mil
y_min = inf;
y_max = -inf;
dat_max_sam = nan(1, n_sam);
off_non = 0.100;
mou = 0.050;
sep = off_non + mou + 0.050;
global lin_wid
for i = 1:n_sam
    ind_i = i;
    hax_i = hax_sub(ind_i);
    pos_end = hax_i.Position;
    hax_i.Position(3) = pos_end(1) + pos_end(3) - hax_sub(ind_i).Position(1);
    axes(hax_i)
    plo_par_map(bea_lat_sam_ani_tri{i}, hax_sub(ind_i), y_lab, min_par, max_par)
    if i == 1
        h_lab = ylabel(y_lab_ima);
        h_lab.Units = 'inches';
    elseif i == n_sam && sim == false
        col_han = colorbar;
        col_han.Position(1) = col_han.Position(1) + 0.03;
        col_han.Label.String = y_lab;
        hax_i.YColor = 'none';
    else
        hax_i.YColor = 'none';
    end
    tit = strcat(tit_sam(i), " n = ", sprintf('%d', n_ani_sam(i)));
    h = title(tit, 'FontWeight', 'normal');
    h.Units = 'normalized';
    h.Position(2) = 1 + 0.075;
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    hax_pro_i = hax_sub(i + n_col);
    axes(hax_pro_i)
    if strcmp(y_lab, y_lab_lat)
        bea_lat_sam_ani_con{i} = bea_lat_sam_ani_con{i}/mil;
    end
    dat_max_sam(i) = max(bea_lat_sam_ani_con{i},[],'all');
    plo_bar_dat(bea_lat_sam_ani_con{i}, col_con, siz, lin_wid);
    [y_min, y_max, hax_pro_i] = adj_y(hax_pro_i, y_min, y_max);
    xticklabels(con_int)
    if i == 1
        h_lab_bot = ylabel(y_lab);
        h_lab_bot.Units = 'inches';
    else
        yticks([])
        set(hax_pro_i, 'ycolor', 'w')
    end
    hax_pro_i.FontSize = fon_siz;
end
y_min = inf;
y_max = -inf;
ext_hei = -(sep + mou);
for i = 1:n_sam
    hax_pro_i = hax_sub(i + n_col);
    axes(hax_pro_i)
    y_lim_pre = ylim;
    sigstar_lim(cro, fon_siz, off_non, y_lim_pre, sep, mou, ext_hei, p_lat_sam_cro{i})
    [y_min, y_max, hax_pro_i] = adj_y(hax_pro_i, y_min, y_max);
    [off_non, sep, mou, ext_hei] = adj_sig(y_lim_pre, hax_pro_i, off_non, sep, mou, ext_hei);
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
y_lim = hax_pro_i.YLim;
for i = 1:n_con
    hax_pro_i = hax_sub(i + 2*n_col);
    axes(hax_pro_i)
    h_plo = plo_bar_dat_mul(bea_lat_sam_ani_con, i, siz, true);
    hax_pro_i.YLim = y_lim;
    if i == 1
        h_lab_bot = ylabel(y_lab);
        h_lab_bot.Units = 'inches';
    else
        yticks([])
        set(hax_pro_i, 'ycolor', 'w')
    end
    hax_pro_i.XTickLabel = tit_sam;
    hax_pro_i.FontSize = fon_siz;
    sigstar_lim(cro, fon_siz, off_non, y_lim, sep, mou, ext_hei, p_lat_con_cro(i, :))
    hax_pro_i.YLim = y_lim;
    title(con_int{i}, 'FontWeight', 'normal')
end
h_lab.Position(1) = h_lab_bot.Position(1);
end

function plo_rat_spo(dru_ons, sti_ons, sta_tim, end_tim, n_tri_con, tim_bin, ...
    ave_rat_sam_win_ani_par, p_sam_com_par, num_par, rat_ave_sam_bin_par, ...
    rat_sem_sam_bin_par, tit_sam, n_ani_sam)
[n_com, ~] = size(p_sam_com_par{1});
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
com_cel_rat = cell(n_com, 1);
poi = [dru_ons; sti_ons(1:n_tri_con:end); end_tim];
win_siz = 120;
for i = 1:n_com
    com_cel_rat{i} = [poi(i) - win_siz(1)/2 poi(i + 1) - win_siz(1)/2];
end
fon_siz_non = 20;
n_sam = length(ave_rat_sam_win_ani_par);
fig
n_row = n_sam;
n_col = 3;
gap_ver = 0.023;
gap_hor = 0.015;
mar_bot = 0.070;
mar_top = 0.055;
mar_lef = 0.030;
mar_rig = 0.001;
[hax_sub, ~, axh] = tight_subplot(n_row, n_col, [gap_ver gap_hor], [mar_bot mar_top], [mar_lef mar_rig]);
linkaxes(hax_sub([1 1 + n_col 1 + 2*n_col]))
linkaxes(hax_sub([n_col n_col + n_col n_col + 2*n_col]))
col_sig = 'k';
global abb_par
h_lab_sam = [];
x_sam = nan(n_sam, 1);
col_dru = 'b';
col_sti = 'magenta';
lin_wid = 0.5;
[n_win, ~, ~] = size(ave_rat_sam_win_ani_par{1});
siz_win = win_siz*ones(n_win, 1);
col_win = ["red"; "green (color wheel) (x11 green)"; "turquoise"; "cyan"; "blue gray"];
isi = 60; % !!!!!!!!!!!!!!!!!!!!!!
n_con = 3;
y_min = inf;
y_max = -inf;
for i = 1:n_sam
    ind_lef = (i - 1)*n_col + 1;
    ind_mid = ind_lef + 1;
    pos_mid = hax_sub(ind_mid).Position;
    delete(hax_sub(ind_mid))
    hax_i = hax_sub(ind_lef);
    hax_i.Position(3) = pos_mid(1) + pos_mid(3) - hax_i.Position(1);
    axes(hax_i)
    plo_sha(tim_bin, rat_ave_sam_bin_par{i}(:, num_par), ...
        rat_sem_sam_bin_par{i}(:, num_par), col_sig)
    xlim([sta_tim end_tim])
    xticks([])
    [y_min, y_max, hax_i] = adj_y(hax_i, y_min, y_max);
end
off_non = 0.050;
for i = 1:n_sam
    ind_lef = (i - 1)*n_col + 1;
    hax_i = hax_sub(ind_lef);
    axes(hax_i)
    hax = gca;
    if ~isempty(dru_ons)
        plo_ver_lin(dru_ons, hax, col_dru)
    end
    plo_ver_lin(sti_ons, hax, col_sti, lin_wid)
    plo_sti_sub_tri(hax, siz_win, poi, col_win)
    [H, y_lim] = sigstar(com_cel_rat, fon_siz_non, off_non, p_sam_com_par{i}(:, num_par));
    if i == n_row
        xticks(x_tic)
        xticklabels(x_tic_cha)
        xlabel('Time (min)')
    else
        hax_sub(ind_lef).XColor = 'none';
        h = gca;
        h.XColor = 'none';
    end
end
hax.YLim = y_lim;
for i = 1:n_sam
    ind_lef = (i - 1)*n_col + 1;
    hax_i = hax_sub(ind_lef);
    axes(hax_i)
    h_lab = ylabel(abb_par{num_par});
    h_lab_sam = [h_lab_sam; h_lab];
    x_sam(i) = h_lab.Position(1);
    yli = ylim;
    if i == 1
        per_abv = 15;
        text(sti_ons(n_tri_con/2:n_tri_con:end) + isi/2, ...
            yli(2)*ones(n_con, 1)*((100 + per_abv)/100), x_tic_bar(2:end)) % text on top
    end
end
wri_sam_rat(tit_sam, n_ani_sam, n_sam, gap_ver, mar_top, axh)
x_min = min(x_sam);
for i = 1:n_sam
    h_lab_sam(i).Position(1) = x_min;
end
%
com_cel = cell(n_com, 1);
for i = 1:n_com
    com_cel{i} = [i i + 1];
end
% bar plots
global mar_siz
y_min = inf;
y_max = -inf;
global lin_wid
for i = 1:n_sam
    ind_rig = (i - 1)*n_col + 3;
    hax_i = hax_sub(ind_rig);
    axes(hax_i)
    [~, n_ani, ~] = size(ave_rat_sam_win_ani_par{i});
    plo_bar_dat(reshape(ave_rat_sam_win_ani_par{i}(:, :, num_par), n_win, n_ani)', col_win, ...
        mar_siz, lin_wid);
    xlim([0.5 n_win + 0.5])
    [y_min, y_max, hax_i] = adj_y(hax_i, y_min, y_max);
    if i == n_row
        xticks(1:n_com + 1)
        xticklabels(x_tic_bar)
    else
        xticks([])
    end
end
y_min = inf;
y_max = -inf;
for i = 1:n_sam
    ind_rig = (i - 1)*n_col + 3;
    hax_i = hax_sub(ind_rig);
    axes(hax_i)
    sigstar(com_cel, fon_siz_non, off_non, p_sam_com_par{i}(:, num_par));
    [y_min, y_max, hax_i] = adj_y(hax_i, y_min, y_max);
end
end

function plo_rat_sti(dru_ons, sti_ons, sta_tim, end_tim, n_tri_con, tim_bin, ...
    ave_rat_bas_sam_win_ani_par, ave_rat_sti_sam_win_ani_par, p_sti_sam_com_par, num_par, ...
    rat_ave_sam_bin_par, rat_sem_sam_bin_par, tit_sam, n_ani_sam, poi_sti, win_siz_sti)
global col_win_bas col_win_sti
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
[n_com, ~] = size(p_sti_sam_com_par{1});
poi_bas = [dru_ons; sti_ons(1:n_tri_con:end); end_tim];
win_siz_bas = 120;
com_cel_rat = cell(n_com, 1);
for i = 1:n_com
    com_cel_rat{i} = [poi_bas(i) - win_siz_bas/2 poi_sti(i) - win_siz_sti/2];
end
fon_siz_non = 20;
n_sam = length(ave_rat_bas_sam_win_ani_par);
fig
n_row = n_sam;
n_col = 2*n_com;
gap_ver = 0.035;
gap_hor = 0.015;
mar_bot = 0.070;
mar_top = 0.030;
mar_lef = 0.030;
mar_rig = 0.001;
[hax_sub, pos_sub, axh] = tight_subplot(n_row, n_col, [gap_ver gap_hor], [mar_bot mar_top], ...
    [mar_lef mar_rig]);
linkaxes(hax_sub([1 1 + n_col 1 + 2*n_col]))
linkaxes(hax_sub([4 5 6 10 11 12 16 17 18]))
col_sig = 'k';
global abb_par
h_lab_sam = [];
x_sam = nan(n_sam, 1);
col_dru = 'b';
off_non = 0.050;
col_sti = 'magenta';
lin_wid = 0.5;
%
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
%
isi = 60; % !!!!!!!!!!!!!!!!!!!!!!
n_con = 3;
y_min = inf;
y_max = -inf;
for i = 1:n_sam
    ind_lef = (i - 1)*n_col + 1;
    hax_sub_eth_i = hax_sub((i - 1)*n_col + 1);
    ind_end = (i - 1)*n_col + n_com;
    delete(hax_sub((i - 1)*n_col + 2:ind_end))
    pos_end = pos_sub{ind_end};
    hax_sub_eth_i.Position(3) = pos_end(1) + pos_end(3) - hax_sub_eth_i.Position(1);
    axes(hax_sub_eth_i)
    plo_sha(tim_bin, rat_ave_sam_bin_par{i}(:, num_par), ...
        rat_sem_sam_bin_par{i}(:, num_par), col_sig)
    xlim([sta_tim end_tim])
    hax = gca;
    if ~isempty(dru_ons)
        plo_ver_lin(dru_ons, hax, col_dru)
    end
    [y_min, y_max, hax] = adj_y(hax, y_min, y_max);
end
for i = 1:n_sam
    ind_lef = (i - 1)*n_col + 1;
    hax_sub_eth_i = hax_sub((i - 1)*n_col + 1);
    ind_end = (i - 1)*n_col + n_com;
    axes(hax_sub_eth_i)
    hax = gca;
    xticks([])
    plo_ver_lin(sti_ons, hax, col_sti, lin_wid)
    plo_sti_sub_tri(hax, siz_win, poi_win, col_win)
    [~, y_lim] = sigstar(com_cel_rat, fon_siz_non, off_non, p_sti_sam_com_par{i}(:, num_par));
    if i == n_row
        xticks(x_tic)
        xticklabels(x_tic_cha)
        xlabel('Time (min)')
    else
        hax_sub(ind_lef).XColor = 'none';
        h = gca;
        h.XColor = 'none';
    end
    yli = ylim;
    if i == 1
        per_abv = 15;
        tex_top = text(sti_ons(n_tri_con/2:n_tri_con:end) + isi/2, ...
            yli(2)*ones(n_con, 1)*((100 + per_abv)/100), x_tic_bar(2:end)); % text on top
    end
end
hax.YLim = y_lim;
for i = 1:n_sam
    ind_lef = (i - 1)*n_col + 1;
    hax_sub_eth_i = hax_sub((i - 1)*n_col + 1);
    axes(hax_sub_eth_i)
    hax = gca;
    h_lab = ylabel(abb_par{num_par});
    h_lab_sam = [h_lab_sam; h_lab];
    x_sam(i) = h_lab.Position(1);
end
wri_sam_rat(tit_sam, n_ani_sam, n_sam, gap_ver, mar_top, axh)
x_min = min(x_sam);
for i = 1:n_sam
    h_lab_sam(i).Position(1) = x_min;
end
% % bar plots
global mar_siz
mou = 0.030;
sep = off_non + mou + 0.040;
global con_int
global fon_siz
y_min = inf;
y_max = -inf;
global lin_wid
for i = 1:n_sam
    [~, n_ani, ~] = size(ave_rat_bas_sam_win_ani_par{i});
    for j = 1:n_com
        ind_rig = (i - 1)*n_col + n_com + j;
        hax = hax_sub(ind_rig);
        axes(hax)
        plo_bar_dat([reshape(ave_rat_bas_sam_win_ani_par{i}(j, :, num_par), n_ani, 1) reshape(ave_rat_sti_sam_win_ani_par{i}(j, :, num_par), n_ani, 1)], ...
            [col_win_bas col_win_sti], mar_siz, lin_wid);
        [y_min, y_max, hax] = adj_y(hax, y_min, y_max);
    end
end
y_min = inf;
y_max = -inf;
for i = 1:n_sam
    for j = 1:n_com
        ind_rig = (i - 1)*n_col + n_com + j;
        hax = hax_sub(ind_rig);
        axes(hax)
        y_lim_pre = ylim;
        [H, y_lim] = sigstar_lim([1 2], fon_siz_non, off_non, y_lim_pre, sep, mou, p_sti_sam_com_par{i}(j, num_par));
        [y_min, y_max, hax] = adj_y(hax, y_min, y_max);
        if i == n_row
            xticks(1:n_com + 1)
            xticklabels({'Bas', 'Sti'})
        else
            xticks([])
        end
        if j > 1
            yticks([])
            hax_sub_com_i.YColor = 'w';
        end
        if i == 1
            tit = title(con_int{j}, 'FontWeight', 'normal', 'FontSize', fon_siz);
            tit.Units = 'pixels';
            tex_top(j).Units = 'pixels';
            tex_top(j).Position(2) = tit.Position(2);
            tex_top(j).VerticalAlignment = 'bottom';
        end
        if j > 1
            hax.YColor = 'w';
        end
    end
end
end
%%%%%%%%%%%%% paper
function h_fig = plo_tac(tim_tri_uni_fra, nta_sam_fra_sta_con, fon_siz, y_lab, n_sam, n_con, ...
    tit_sam, nta_win_con_sam_ani, p_nta_win_con_xsa, dur_tai, pri, ind_sam, y_lab_ave, pre, ...
    col_sam_con, p_nta_sam_win_xco)
n_row = 3;
n_col = 4;
[h_fig, fig_wid, fig_hei] = fig;
gap_ver_row = [0.030 0.070 0.010];
mar_bot = 0.040;
mar_top = 0.010;
mar_lef = 0.050;
mar_rig = 0.001;
global asp_rat_sig asp_rat_bar con_int con_sho_int gro_thr_cro con_sup_sho_int
gap_hor_row_col = [0.015 0.055 0.015 0.015; ...
    0.015 0.015 0.015 0.015; ...
    0.015 0.015 0.015 0.015];
asp_rat_axe = [asp_rat_sig asp_rat_sig asp_rat_bar asp_rat_bar ...
    asp_rat_sig asp_rat_sig asp_rat_sig asp_rat_sig ...
    asp_rat_bar asp_rat_bar asp_rat_bar asp_rat_bar];
sca_axe = [1 1 1 1 ...
    1 1 1 1 ...
    1 1 1 1];
wid = false;
[hax_sub, pos_axe, hei_axe, dis_asp_rat, las_pix, rat_wid] = tight_subplot_gen(n_row, n_col, ...
    gap_ver_row, gap_hor_row_col, mar_bot, mar_top, mar_lef, mar_rig, asp_rat_axe, fig_wid, ...
    fig_hei, wid, sca_axe);
delete([hax_sub(8) hax_sub(end)])
hax_sub(10).Position(1) = hax_sub(6).Position(1);
hax_sub(11).Position(1) = hax_sub(7).Position(1);
linkaxes(hax_sub([1 2 5 6 7]))
linkaxes(hax_sub([3 4]))
linkaxes(hax_sub([9 10 11]))
[las_pix, rat_wid] = ext_las_pix_del(pos_axe, fig_wid, [8 12]);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% signals
log_tai = tim_tri_uni_fra > -dur_tai & tim_tri_uni_fra < 2*dur_tai;
h_sam = cell(n_sam, 1);
y_min = inf;
y_max = -inf;
hax_tap = [];
if pre
    con = con_sho_int;
else
    con = con_int;
end
for i = 1:n_sam
    hax = hax_sub(i);
    ind = ind_sam(i);
    for j = 1:n_con
        h_sam_j = plo_sha(hax, tim_tri_uni_fra(log_tai), ...
            nta_sam_fra_sta_con{ind}(log_tai, 1, j), ...
            nta_sam_fra_sta_con{ind}(log_tai, 2, j), col_sam_con(ind, j));
        hold on
        h_sam{ind} = [h_sam{ind}; h_sam_j];
    end
    %
    hax.XAxis.Visible = 'off';
    [y_min, y_max, hax] = adj_y(hax, y_min, y_max);
    hax_tap = [hax_tap; hax];
    if i == 1
        ylabel(hax, y_lab)
    else
        hax.YAxis.Visible = 'off';
    end
end
% vertical lines
for i = 1:n_sam
    plo_lin_sub_tri(hax_tap(i))
    leg = legend(hax_sub(i), flip(h_sam{ind_sam(i)}), flip(con));
    leg.Box = 'off';
end
%%%%%%%%%%%%%%%%%%%%%%%%%%% ave
ind_win = 2;
siz = 10;
y_min_ave = inf;
y_max_ave = -inf;
for i = 1:n_sam
    ind = ind_sam(i);
    for j = 1
        hax = hax_sub(n_sam + i);
        if pri
            plo_err_win(nta_win_con_sam_ani, ind_sam(i), j + 1);
        else
            plo_dat_err_xco(hax, nta_win_con_sam_ani, ind_win, ind, siz, col_sam_con)
        end
        hax.FontSize = fon_siz;
        [y_min_ave, y_max_ave] = adj_y(hax, y_min_ave, y_max_ave);
        if i == 1
            ylabel(hax, y_lab_ave)
        else
            hax.YAxis.Visible = 'off';
        end
        xlim([1 - 0.3 3 + 0.3])
        xticks(1:n_con)
        xticklabels(con_sup_sho_int)
    end
end
% significance
fon_siz_non = fon_siz;
mou = 0.030;
off_non = 0.070;
sep = off_non + mou + 0.040;
ext_hei = -(sep + mou);
for i = 1:n_sam
    ind = ind_sam(i);
    for j = 1
        hax = hax_sub(n_sam + i);
        y_lim_pre = ylim(hax);
        sigstar_lim(hax, gro_thr_cro, fon_siz_non, off_non, y_lim_pre, sep, mou, ...
            ext_hei, p_nta_sam_win_xco{ind}(j + 1, :))
        [y_min_ave, y_max_ave, hax] = adj_y(hax, y_min, y_max_ave);
        [off_non, sep, mou, ext_hei] = ...
            adj_sig(y_lim_pre, hax, off_non, sep, mou, ext_hei);
    end
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% cro
%%%%%%%%%%% signals
h_con = cell(n_con, 1);
x_lab = 'Time (s)';
hax_tap = [];
for j = 1:n_con
    hax = hax_sub(n_col + j);
    for i = 1:n_sam
        ind = ind_sam(i);
        h_con_i = plo_sha(hax, tim_tri_uni_fra(log_tai), ...
            nta_sam_fra_sta_con{ind}(log_tai, 1, j), ...
            nta_sam_fra_sta_con{ind}(log_tai, 2, j), col_sam_con(ind, j));
        [y_min, y_max, hax] = adj_y(hax, y_min, y_max);
        hold on
        h_con{j} = [h_con{j}; h_con_i];
    end
    xlabel(hax, x_lab)
    if j == 1
        ylabel(hax, y_lab)
    else
        hax.YAxis.Visible = 'off';
    end
    hax_tap = [hax_tap; hax];
end
nor_x = 0.5;
nor_y = 0.7;
for j = 1:n_con
    plo_lin_sub_tri(hax_tap(j))
    if p_nta_win_con_xsa{2, j} < 0.05
        text(hax_tap(j), nor_x, nor_y, '*', 'Units', 'normalized')
    end
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% averages
siz = 10;
dat = true;
tit_sam = tit_sam(ind_sam);
for i = 1:n_con
    for j = 1
        hax = hax_sub(2*n_col + i);
        [~, n_ani_sam] = plo_dat_err_xsa(hax, nta_win_con_sam_ani, j + 1, i, siz, col_sam_con, ...
            ind_sam, dat);
        [y_min_ave, y_max_ave] = adj_y(hax, y_min_ave, y_max_ave);
        %
        if i == 1
            ylabel(hax, y_lab_ave)
        else
            hax.YAxis.Visible = 'off';
        end
        xlim([1 - 0.3 n_sam + 0.3])
        xticks(1:n_sam)
        xticklabels(tit_sam)
        hax.FontSize = fon_siz;
    end
end
% significance
cro = ext_cro(ind_sam);
mou = 0.030;
off_non = 0.070;
sep = off_non + mou + 0.040;
ext_hei = -(sep + mou);
for i = 1:n_con
    for j = 1
        hax = hax_sub(2*n_col + i);
        y_lim_pre = ylim(hax);
        sigstar_lim(hax, cro, fon_siz, off_non, y_lim_pre, sep, mou, ext_hei, ...
            p_nta_win_con_xsa{j + 1, i})
        [y_min_ave, y_max_ave] = adj_y(hax, y_min_ave, y_max_ave);
        [off_non, sep, mou, ext_hei] = ...
            adj_sig(y_lim_pre, hax, off_non, sep, mou, ext_hei);
    end
end
h_fig = opt_h_fig(h_fig, las_pix, rat_wid);
end

function h_fig = plo_tai(bea_lat_sam_ani_tri, lat_win_con_sam_ani, tit_n_sam, n_sam, ...
    p_lat_sam_cro, pro_win_con_sam_ani, per_pro_shu_sam_ani, ...
    p_sam_cro, tit_sho_sam, log_sam_ani, ind_sam, col_sam_con, p_pro_win_con_xsa, p_lat_win_con_xsa)
n_row = 5;
n_col = 4;
gap_ver_row = [0.030 0.070 0.030 0.030 0.030];
gap_hor_row_col = [0.070 0.050 0.050 0.050; ...
    0.070 0.050 0.050 0.050; ...
    0.025 0.110 0.050 0.050; ...
    0.025 0.110 0.050 0.050; ...
    0.025 0.110 0.050 0.050];
mar_bot = 0.065;
mar_top = 0.020;
mar_lef = 0.040;
mar_rig = 0.001;
asp_rat_map = 1;
asp_rat_bar = 0.5;
asp_rat_axe = [asp_rat_map asp_rat_bar asp_rat_bar asp_rat_bar...
    asp_rat_map asp_rat_bar asp_rat_bar asp_rat_bar...
    asp_rat_map asp_rat_map asp_rat_bar asp_rat_bar...
    asp_rat_map asp_rat_map asp_rat_bar asp_rat_bar...
    asp_rat_map asp_rat_map asp_rat_bar asp_rat_bar];
[h_fig, fig_wid, fig_hei] = fig;
sca_axe = [1 1 1 1 ...
    1 1 1 1 ...
    1 1 1 1 ...
    1 1 1 1 ...
    1 1 1 1];
wid = false;
[hax_sub, pos_axe, hei_axe, dis_asp_rat, las_pix, rat_wid] = tight_subplot_gen(n_row, n_col, ...
    gap_ver_row, gap_hor_row_col, mar_bot, mar_top, mar_lef, mar_rig, asp_rat_axe, fig_wid, ...
    fig_hei, wid, sca_axe);
delete([hax_sub(4) hax_sub(8)])
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
hax_pro_ele = [2 6];
hax_lat_ele = hax_pro_ele + 1;
linkaxes(hax_sub(hax_pro_ele))
linkaxes(hax_sub(hax_lat_ele))
%
hax_pro_ele = [11 15 19];
hax_lat_ele = hax_pro_ele + 1;
linkaxes(hax_sub(hax_pro_ele))
linkaxes(hax_sub(hax_lat_ele))
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
bea_lat_ani_tri = [];
for i = 1:n_sam
    bea_lat_ani_tri = [bea_lat_ani_tri; bea_lat_sam_ani_tri{i}];
end
global mil con_sup_sho_int fon_siz n_tri_con n_tri gro_thr_cro con_int log_con_tri n_con
y_lab_lat = 'Latency (ms)';
min_par = min(bea_lat_ani_tri, [], 'all')/mil;
max_par = max(bea_lat_ani_tri, [], 'all')/mil;
%
siz = 10;
y_min = inf;
y_max = -inf;
off_non = 0.100;
mou = 0.050;
sep = off_non + mou + 0.050;
log_tex = true;
cha = false;
ext_hei = -(sep + mou);
ind_win = 1;
for i = 1:n_sam
    ind_sub = (i - 1)*n_col + 1;
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% image
    hax_map = hax_sub(ind_sub);
    ind = ind_sam(i);
    bea_par_ani_tri = bea_lat_sam_ani_tri{ind}(log_sam_ani{ind}, :)/mil;
    plo_par_map_mul(hax_map, bea_par_ani_tri, min_par, max_par, true)
    y_lab = ylabel(hax_map, [char(tit_n_sam(ind)) newline ['\color[rgb]{0, 0, 0} ', 'Animal #']]);
    y_lab.Position(1) = 0;
    %
    if i == 1
        x = 3;
        nor_y = 1 + 0.060;
        text(hax_map, x/n_tri, nor_y, 'Low', 'HorizontalAlignment', 'center', 'Units', 'normalized')
        text(hax_map, (x + n_tri_con)/n_tri, nor_y, 'Med', 'HorizontalAlignment', 'center', ...
            'Units', 'normalized')
        text(hax_map, (x + 2*n_tri_con)/n_tri, nor_y, 'High', 'HorizontalAlignment', 'center', ...
            'Units', 'normalized')
    end
    if i == n_sam
    else
        hax_map.XAxis.Visible = 'off';
    end
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% probability
    hax_pro = hax_sub(ind_sub + 1);
    plo_pro_onl(pro_win_con_sam_ani, per_pro_shu_sam_ani, ...
        hax_pro, p_sam_cro, off_non, sep, mou, log_tex, ind, ...
        cha, ext_hei)
    y_lab_pro = '%probability';
    h_lab_bot = ylabel(y_lab_pro);
    h_lab_bot.Units = 'inches';
    hax_pro.FontSize = fon_siz;
    if i == n_sam
        xticklabels(con_sup_sho_int)
    else
        hax_pro.XAxis.Visible = 'off';
    end
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% latency
    hax_lat = hax_sub(ind_sub + 2);
    plo_dat_err_xco(hax_lat, cellfun(@mul_kil_cel, lat_win_con_sam_ani, 'UniformOutput', ...
        false), ind_win, ind, siz, col_sam_con)
    xlim(hax_lat, [1 - 0.3 3 + 0.3])%%%%%%%%%%%%%%%%%%%%%%
    [y_min, y_max, hax_lat] = adj_y(hax_lat, y_min, y_max);
    h_lab_bot = ylabel(hax_lat, y_lab_lat);
    h_lab_bot.Units = 'inches';
    hax_lat.FontSize = fon_siz;
    if i == n_sam
        xticklabels(con_sup_sho_int)
    else
        hax_lat.XAxis.Visible = 'off';
    end
end
y_min = inf;
y_max = -inf;
for i = 1:n_sam
    ind = (i - 1)*n_col + 1;
    hax_lat = hax_sub(ind + 2);
    y_lim_pre = ylim;
    sigstar_lim(hax_lat, gro_thr_cro, fon_siz, off_non, y_lim_pre, sep, mou, ext_hei, ...
        p_lat_sam_cro{ind_sam(i)})
    [y_min, y_max, hax_lat] = adj_y(hax_lat, y_min, y_max);
    [off_non, sep, mou, ext_hei] = adj_sig(y_lim_pre, hax_lat, off_non, sep, mou, ext_hei);
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
poi_pro = n_sam + 1;
poi_lat = poi_pro + 1;
cro = ext_cro(ind_sam);
y_min_pro = inf;
y_max_pro = -inf;
y_min_lat = inf;
y_max_lat = -inf;
ind_win = 1;
dat = true;
for i = 1:n_con
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% maps
    for j = 1:n_sam
        hax_map = hax_sub(2*n_col + (i - 1)*n_col + j);
        ind = ind_sam(j);
        bea_par_ani_tri = bea_lat_sam_ani_tri{ind}(log_sam_ani{ind}, log_con_tri(i, :))/mil;
        plo_par_map_mul(hax_map, bea_par_ani_tri, min_par, max_par, false)
        if i == 1
            tit = tit_n_sam{ind};
            hax_map.XAxis.Visible = 'off';
        else
            if i == n_con
                xlabel(hax_map, 'Trial #')
            else
                hax_map.XAxis.Visible = 'off';
            end
            tit = ' ';
        end
        if j == 1
            y_lab = ylabel(hax_map, [con_int{i} newline 'Animal #']);
            y_lab.Position(1) = 0;
        elseif i == n_con && j == n_sam
            col_han = colorbar(hax_map);
            col_han.Position(1) = col_han.Position(1) + 0.03;
            col_han.Label.String = y_lab_lat;
            col_han.FontSize = fon_siz;
        end
        title(hax_map, tit, 'FontWeight', 'normal', 'FontSize', fon_siz)
    end
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% bars
    for j = 1:2 % pro and lat
        if j == 1
            hax_cro = hax_sub(2*n_col + (i - 1)*n_col + poi_pro);
        else
            hax_cro = hax_sub(2*n_col + (i - 1)*n_col + poi_lat);
        end
        if j == 1
            plo_dat_err_xsa(hax_cro, pro_win_con_sam_ani, ind_win, i, siz, col_sam_con, ...
                ind_sam, dat)
        else
            plo_dat_err_xsa(hax_cro, ...
                cellfun(@mul_kil_cel, lat_win_con_sam_ani, 'UniformOutput', false), ...
                ind_win, i, siz, col_sam_con, ind_sam, dat)
        end
        xlim(hax_cro, [1 - 0.3 n_sam + 0.3])
        if i == n_con
            hax_cro.XTickLabel = tit_sho_sam(ind_sam);
        else
            set(hax_cro, 'xcolor', 'w')
        end
    end
end
%
for i = 1:n_con
    for j = 1:2 % pro and lat
        if j == 1
            hax_cro = hax_sub(2*n_col + (i - 1)*n_col + poi_pro);
        else
            hax_cro = hax_sub(2*n_col + (i - 1)*n_col + poi_lat);
        end
        y_lim_pre = ylim(hax_cro);
        if j == 1
            [y_min_pro, y_max_pro, hax_cro] = adj_y(hax_cro, y_min_pro, y_max_pro);
            sigstar_lim(hax_cro, cro, fon_siz, off_non, y_lim_pre, sep, mou, ext_hei, ...
                p_pro_win_con_xsa.lme{ind_win, i})
            ylabel(hax_cro, y_lab_pro)
        else
            [y_min_lat, y_max_lat, hax_cro] = adj_y(hax_cro, y_min_lat, y_max_lat);
            sigstar_lim(hax_cro, cro, fon_siz, off_non, y_lim_pre, sep, mou, ext_hei, ...
                p_lat_win_con_xsa.lme{ind_win, i})
            ylabel(hax_cro, y_lab_lat)
        end
    end
end
%
for i = 1:n_con
    for j = 1:2 % pro and lat
        if j == 1
            hax_cro = hax_sub(2*n_col + (i - 1)*n_col + poi_pro);
        else
            hax_cro = hax_sub(2*n_col + (i - 1)*n_col + poi_lat);
        end
        hax_cro.FontSize = fon_siz;
    end
end
h_fig = opt_h_fig(h_fig, las_pix, rat_wid);
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% neural plotting
% evoked
function h_fig = plo_inh_exc(fra_reg_con_sam_ani, p_fra_reg_con_xsa, ind_sam, tit_sam)
global n_con ind_sub_reg nam_com_reg col_sam_con n_reg_for_cro
n_row = 2;
n_col = n_con*n_reg_for_cro;
gap_ver_row = 0.130*ones(n_row, 1);
gap_hor_ave = 0.005;
gap_hor_col = [gap_hor_ave gap_hor_ave gap_hor_ave gap_hor_ave gap_hor_ave gap_hor_ave];
gap_hor_row_col = repmat(gap_hor_col, n_row, n_con);
mar_bot = 0.000;
mar_top = 0.040;
mar_lef = 0.043;
mar_rig = 0.000;
asp_rat_bar = 0.5;
asp_rat_axe = asp_rat_bar*ones(1, n_row*n_col);
[h_fig, wid_mon, hei_mon] = fig;
wid = true;
sca_axe = ones(1, n_row*n_col);
n_pix_ext = 0;
[hax_sub, pos_axe, axh, dis_asp_rat, las_pix, rat_wid] = tight_subplot_gen...
    (n_row, n_col, ...
    gap_ver_row, gap_hor_row_col, mar_bot, mar_top, mar_lef, mar_rig, asp_rat_axe, wid_mon, ...
    hei_mon, wid, sca_axe, n_pix_ext);
linkaxes(hax_sub)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% excitation
y_min = inf;
y_max = -inf;
nam_sam = tit_sam(ind_sam);
ind_ite = 0;
dat = true;
con_fil = matfile('\\home.ansatt.ntnu.no\kadiram\Documents\MATLAB\con_esp.mat');
mar_siz = con_fil.mar_siz;
mar_siz = mar_siz.pre;
fon_siz = con_fil.fon_siz;
fon_siz = fon_siz.pre;
for i = ind_sub_reg
    ind_ite = ind_ite + 1;
    for j = 1:n_con
        ind = (j - 1)*n_reg_for_cro + ind_ite;
        hax = hax_sub(ind);
        plo_dat_err_xsa(hax, fra_reg_con_sam_ani.exc, i, j, mar_siz, col_sam_con, ind_sam, dat)
        [y_min, y_max, hax] = adj_y(hax, y_min, y_max);
        hax.FontSize = fon_siz;
        title(hax, nam_com_reg(ind_ite), 'FontWeight', 'normal')
        xticklabels(hax, [])
        xticklabels(hax, nam_sam)
        %
        hax.XAxis.Color = 'w';
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
        ind = (j - 1)*n_reg_for_cro + ind_ite;
        hax = hax_sub(ind);
        y_lim_pre = ylim(hax);
        [~, y_lim] = sigstar_lim(hax, cro, fon_siz, off_non, y_lim_pre, sep, mou, ...
            ext_hei, p_fra_reg_con_xsa.exc.lme{i, j});
        [y_min, y_max, hax] = adj_y(hax, y_min, y_max);
        %
        if ind == 1
        else
            hax.YAxis.Visible = 'off';
        end
    end
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% inhibition
ind_ite = 0;
dat = true;
for i = ind_sub_reg
    ind_ite = ind_ite + 1;
    for j = 1:n_con
        ind = n_col + (j - 1)*n_reg_for_cro + ind_ite;
        hax = hax_sub(ind);
        plo_dat_err_xsa(hax, fra_reg_con_sam_ani.inh, i, j, mar_siz, col_sam_con, ind_sam, dat)
        [y_min, y_max, hax] = adj_y(hax, y_min, y_max);
        hax.FontSize = fon_siz;
        hax.XAxis.Visible = 'off';
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
        ind = n_col + (j - 1)*n_reg_for_cro + ind_ite;
        hax = hax_sub(ind);
        y_lim_pre = ylim(hax);
        [han_bar_com, y_lim] = sigstar_lim(hax, cro, fon_siz, off_non, y_lim_pre, sep, mou, ...
            ext_hei, p_fra_reg_con_xsa.inh.lme{i, j});
        [y_min, y_max, hax] = adj_y(hax, y_min, y_max);
        hax.YDir = 'reverse';
        if ~isnan(han_bar_com(1, 2))
            set(han_bar_com(1, 2), 'Position', [1.5 75 0])
        end
        if ind == n_col + 1
        else
            hax.YAxis.Visible = 'off';
        end
    end
end
%%%%%%%%%%%%%%%%%%%%
y_lab = 'vibration-modulated cells in FOR (%)';
supAxes = [mar_lef 0 1 1];
[ax, h] = suplabel(y_lab, 'y', supAxes);
h.Units = 'normalized';
h.Position(2) = 0.77;
%%%%%%%%%%%%%%
nor_x = -1.1;
nor_y = 0.4;
h = text(hax_sub(2), nor_x, nor_y, 'excitation', 'units', 'normalized');
%
nor_y = 0.6;
h = text(hax_sub(n_col + 2), nor_x, nor_y, 'inhibition', 'units', 'normalized');
%
h_fig = opt_h_fig(h_fig, las_pix, rat_wid);
end

function h_fig = plo_inh_exc_hig(fra_reg_con_sam_ani, p_fra_reg_con_xsa, ind_sam, tit_sam)
global ind_sub_reg nam_com_reg col_sam_con n_reg_for_cro
n_row = 2;
n_con = 1;
n_col = n_con*n_reg_for_cro;

% gap_ver_row = 0.050*ones(n_row, 1);
% gap_hor_ave = 0.001;
% gap_hor_col = [gap_hor_ave gap_hor_ave gap_hor_ave gap_hor_ave gap_hor_ave gap_hor_ave];
% gap_hor_row_col = repmat(gap_hor_col, n_row, n_con);
% mar_bot = 0.040;
% mar_top = 0.040;
% mar_lef = 0.050;
% mar_rig = 0.000;

gap_ver_row = 0.015*ones(n_row, 1);
gap_hor_ave = 0.001;
gap_hor_col = [gap_hor_ave gap_hor_ave gap_hor_ave gap_hor_ave gap_hor_ave gap_hor_ave];
gap_hor_row_col = repmat(gap_hor_col, n_row, n_con);
mar_bot = 0.005;
hei = 4.5;%ewelina
mar_top = cal_mar_top(hei);
mar_lef = 0.015;
mar_rig = 0.012;

asp_rat_bar = 0.5;
n_sub = n_row*n_col;
asp_rat_axe = asp_rat_bar*ones(1, n_row*n_col);
[h_fig, wid_mon, hei_mon] = fig;
wid = false;
sca_axe = ones(1, n_row*n_col);
n_pix_ext = 0;
[hax_sub, pos_axe, axh, dis_asp_rat, las_pix, rat_wid] = tight_subplot_gen(n_row, n_col, ...
    gap_ver_row, gap_hor_row_col, mar_bot, mar_top, mar_lef, mar_rig, asp_rat_axe, wid_mon, ...
    hei_mon, wid, sca_axe, n_pix_ext);
linkaxes(hax_sub(1:n_col))
linkaxes(hax_sub(n_col + 1:end))
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% excitation
y_min = inf;
y_max = -inf;
nam_sam = tit_sam(ind_sam);
ind_ite = 0;
dat = true;
con_fil = matfile('\\home.ansatt.ntnu.no\kadiram\Documents\MATLAB\con_esp.mat');
mar_siz = con_fil.mar_siz;
mar_siz = mar_siz.pre;
fon_siz = con_fil.fon_siz;
for i = ind_sub_reg
    ind_ite = ind_ite + 1;
    for con = 3
        ind = ind_ite;
        hax = hax_sub(ind);
        plo_dat_err_xsa(hax, fra_reg_con_sam_ani.exc, i, con, mar_siz, col_sam_con, ind_sam, dat)
        [y_min, y_max, hax] = adj_y(hax, y_min, y_max);
        hax.FontSize = fon_siz.pre;
        title(hax, nam_com_reg(ind_ite), 'FontWeight', 'normal')
        xticklabels(hax, [])
        xticklabels(hax, nam_sam)
        %
        hax.XAxis.Color = 'w';
    end
end
%
[cro, n_sam] = ext_cro(ind_sam);
mou = 0.030;
sep = mou + 0.080;
ext_hei = -(sep + mou);
offset = 0.200;% for star!
ind_ite = 0;
for i = ind_sub_reg
    ind_ite = ind_ite + 1;
    for con = 3
        ind = ind_ite;
        hax = hax_sub(ind);
        y_lim_pre = ylim(hax);
        [~, y_lim] = sigstar.sig(hax, cro, y_lim_pre, sep, mou, ext_hei, offset, ...
            p_fra_reg_con_xsa.exc.lme{i, con});
        [y_min, y_max, hax] = adj_y(hax, y_min, y_max);
        %
        if ind == 1
        else
            hax.YAxis.Visible = 'off';
        end
    end
    hax = adj_hax(hax, fon_siz.pub);
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% inhibition
ind_ite = 0;
dat = true;
y_min = inf;
y_max = -inf;
for i = ind_sub_reg
    ind_ite = ind_ite + 1;
    for con = 3
        ind = n_col + ind_ite;
        hax = hax_sub(ind);
        plo_dat_err_xsa(hax, fra_reg_con_sam_ani.inh, i, con, mar_siz, col_sam_con, ind_sam, dat)
        [y_min, y_max, hax] = adj_y(hax, y_min, y_max);
        hax.FontSize = fon_siz.pre;
        hax.XAxis.Visible = 'off';
    end
end
%
ind_ite = 0;
for i = ind_sub_reg
    ind_ite = ind_ite + 1;
    for con = 3
        ind = n_col + ind_ite;
        hax = hax_sub(ind);
        y_lim_pre = ylim(hax);
        [han_bar_com, y_lim] = sigstar.sig(hax, cro, y_lim_pre, sep, mou, ext_hei, offset, ...
            p_fra_reg_con_xsa.inh.lme{i, con});
%         if ~isnan(han_bar_com(1, 2))
%             set(han_bar_com(1, 2), 'Position', [1.5 47 0])%%% manual position for star !!!!
%         end
        [y_min, y_max, hax] = adj_y(hax, y_min, y_max);
        hax.YDir = 'reverse';
        if ind == n_col + 1
        else
            hax.YAxis.Visible = 'off';
        end
    end
    hax = adj_hax(hax, fon_siz.pub);
end

hei = (hax_sub(1).Position(4))*(hax.YLim(2)/hax_sub(1).YLim(2));
for col = 7:n_sub
    hax_sub(col).Position(4) = hei;
    hax_sub(col).Position(2) = hax_sub(col).Position(2) + ((hax_sub(1).Position(4)) - hei);
end

%%%%%%%%%%%%%%%%%%%%
% y_lab = 'vibration-modulated cells in FOR (%)';
% supAxes = [mar_lef 0 1 1];
% [ax, h] = suplabel(y_lab, 'y', supAxes);
% h.Units = 'normalized';
% h.Position(2) = 0.77;
% %%%%%%%%%%%%%%
% nor_x = -1.1;
% nor_y = 0.4;
% h = text(hax_sub(2), nor_x, nor_y, 'excitation', 'units', 'normalized');
% %
% nor_y = 0.6;
% h = text(hax_sub(n_col + 2), nor_x, nor_y, 'inhibition', 'units', 'normalized');
%
h_fig = opt_h_fig(h_fig, las_pix, rat_wid);
end

function h_fig = plo_evo_vis_all(act_reg_sam_fra_sta_con, p_act_reg_win_con_xsa, fie_num)
global n_con n_reg_for_cro ind_sub_reg fon_siz nam_reg y_lab_dff col_sam_con con_int
n_row = n_con;
n_col = n_reg_for_cro;
gap_ver_row = 0.050*ones(n_row, 1);
gap_hor_ave = 0.010;
gap_hor_col = [gap_hor_ave gap_hor_ave gap_hor_ave gap_hor_ave gap_hor_ave gap_hor_ave];
gap_hor_row_col = repmat(gap_hor_col, n_row, 1);
mar_bot = 0.070;
mar_top = 0.070;
mar_lef = 0.040;
mar_rig = 0.003;
asp_rat_bar = 1;
asp_rat_axe = [asp_rat_bar asp_rat_bar asp_rat_bar asp_rat_bar asp_rat_bar asp_rat_bar ...
asp_rat_bar asp_rat_bar asp_rat_bar asp_rat_bar asp_rat_bar asp_rat_bar ...
asp_rat_bar asp_rat_bar asp_rat_bar asp_rat_bar asp_rat_bar asp_rat_bar];
[h_fig, wid_mon, hei_mon] = fig;
wid = false;
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
log_smo = true;
con_fil = matfile('\\home.ansatt.ntnu.no\kadiram\Documents\MATLAB\con_esp.mat');
tim_fra = con_fil.tim_fra;
for i = ind_sub_reg
    ind_ite = ind_ite + 1;
    for j = 1:n_con
        ind = (j - 1)*n_col + ind_ite;
        hax = hax_sub(ind);
        plo_sha(hax, tim_fra.cal.one.tri.(fie_num{1}), ...
                    [var_reg_sam_fra_sta_con{i}{1}(:, 1, j) ...
                    var_reg_sam_fra_sta_con{i}{2}(:, 1, j)], ...
                    [var_reg_sam_fra_sta_con{i}{1}(:, 2, j) ...
                    var_reg_sam_fra_sta_con{i}{2}(:, 2, j)], ...
                    col_sam_con(:, j), log_smo);
        [y_min, y_max, hax] = adj_y(hax, y_min, y_max);
        hax.FontSize = fon_siz;
        %
        if ind_ite == 1
            ylabel(hax, y_lab_dff)
        else
            hax.YAxis.Visible = 'off';
        end
        if j == 1
            title(hax, nam_reg(i), 'FontWeight', 'normal')
            subtitle(hax, ' ')
            hax.XAxis.Visible = 'off';
        elseif j == n_con
            xlabel(hax, 'Time (s)')
        else
            hax.XAxis.Visible = 'off';
        end
    end
end
num = 4;
lef_bia = 0.000;
[~, ~] = wri_sam_rat(con_int, gap_ver_row, mar_top, axh, gap_hor_col, pos_axe, num, lef_bia);
%
nor_x = 0.5;
nor_y = 0.9;
ind_ite = 0;
log_all = true;
nor_x_two = 2.7/3;
for i = ind_sub_reg
    ind_ite = ind_ite + 1;
    for j = 1:n_con
        ind = (j - 1)*n_col + ind_ite;
        hax = hax_sub(ind);
        plo_lin_sub_tri(hax, 5)
        pri_sig_duo(hax, nor_x, nor_y, p_var_reg_win_con_xsa{i}.lme{2, j}, ...
            p_var_reg_win_con_xsa{i}.rst{2, j}, ...
        log_all)
        pri_sig_duo(hax, nor_x_two, nor_y, p_var_reg_win_con_xsa{i}.lme{3, j}, ...
        p_var_reg_win_con_xsa{i}.rst{3, j}, log_all)
    end
end
h_fig = opt_h_fig(h_fig, las_pix, rat_wid);
end

function plo_neu_com(dff_sam_thr_fra_sta_con, per_cel_sam_thr_ani_con, res_sam_typ_cel_sti, ...
    p_val_sam_thr_cro, cor_coe_ave_sam_cro, cor_coe_sem_sam_cro, tim_tri_fra, ...
    dff_sam_con_fra_cel)
thr_num = 2;
col_con = ["blue"; "brown (traditional)"; "black"];
res_dur_neu = 2; % response in the 3d plot should be based on 5 s ...
sti_dur_con = [0.200; 0.200; 0.200];
per_ver = 1; % percent vertical
n_sam = 2;
n_con = 3;
sca_bar = 10;
sca_bar_neu = 1000;
col_lim = [-5 50];
col_cod = '\DeltaF/F (%)';
tit_sam = {'tph2'; 'GCamp6s'};
c = @cmu.colors;
hax_cro = [];
hax_bar = [];
fig
n_row = 3;
n_col = 9;
gap_ver = 0.030;
gap_hor = 0.010;
mar_bot = 0.035;
mar_top = 0.030;
mar_lef = 0.035;
mar_rig = 0.050;
[hax_sub, ~, ~] = tight_subplot(n_row, n_col, [gap_ver gap_hor], [mar_bot mar_top], ...
    [mar_lef mar_rig]);
col_han_pos = [0.96 0.4 0.01 0.2];
nor_y_sti = 0.65;
fon_siz = 8;
global siz
for i = 1:n_sam
    for j = 1:n_con
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%% signals
        hax_i_j = hax_sub((i - 1)*n_con + j);
        axes(hax_i_j)
        plo_sha(tim_tri_fra, dff_sam_thr_fra_sta_con{i, thr_num}(:, 1, j), ...
            dff_sam_thr_fra_sta_con{i, thr_num}(:, 2, j), c(col_con(j)));
        set(hax_i_j, 'xcolor', 'w', 'ycolor', 'w')
        box off
        if j == 2
            title(tit_sam(i))
        end
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% images
        hax_i_j_ima = hax_sub(n_col + (i - 1)*n_con + j);
        axes(hax_i_j_ima)
        dff_sor_i_j = sor_mat(tim_tri_fra, dff_sam_con_fra_cel{i, j}, res_dur_neu);
        n_cel_i = size(dff_sor_i_j, 1);
        imagesc(tim_tri_fra, 1:n_cel_i, smo_ima(dff_sor_i_j))
        caxis(col_lim)
        colormap(jet)
        set(hax_i_j_ima, 'ytick', [], 'yticklabel', [], 'xtick', [], 'xticklabel', [])
        if i == n_sam && j == n_con
            col_han = colorbar('Ticks', col_lim);
            col_han.Position = col_han_pos;
            col_han.Label.String = col_cod;
            col_han.Label.String = col_cod;
        end
        %
        box off
        hold on
        axes('Position', hax_i_j_ima.Position, 'YColor', 'w', 'Color', 'none', 'XTick', [], 'YTick', [], 'XTickLabel', [], 'YTickLabel', []);
        lin_wid = 2;
        add_hor_sca_bar_out(hax_i_j_ima, sti_dur_con(j), c(col_con(j)), nor_y_sti, lin_wid);
        if j == 1
            hold on
            axes('Position', hax_i_j_ima.Position, 'XColor', 'w', 'YColor', 'w', 'Color', 'none', 'XTick', [], 'YTick', [], 'XTickLabel', [], 'YTickLabel', []);
            add_ver_sca_bar_top(hax_i_j_ima, sca_bar_neu, 'k');
            if i == 1
                nor_x = -0.03;
                nor_y = 0.855;
                tx = text(nor_x, nor_y, 'Neurons', 'units', 'normalized', 'FontSize', fon_siz);
                set(tx,'Rotation',90);
            end
        end
    end
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% n cells
    hax_i_j_cel = hax_sub(2*n_col + i);
    axes(hax_i_j_cel)
    per_cel_ani_con = per_cel_sam_thr_ani_con{i, thr_num};
    hax_bar_i = plo_bar_dat(per_cel_ani_con, col_con, siz);
    hax_bar = [hax_bar hax_bar_i];
    set(gca, 'XTick', [], 'XTickLabel', [])
    xlabel(tit_sam(i), 'FontSize', fon_siz)
    if i == 1
        pre_for_exp_y_lab('number of cells (%)', fon_siz)
    else
        set(hax_i_j_cel, 'ytick', [], 'yticklabel', [], 'YColor', 'w')
        box off
    end
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% cro
    h_cro = subplot(n_row, n_col, 2*n_col + n_con + (i - 1)*2 + 1:2*n_col + n_con + (i - 1)*2 + 2);
    fon_siz_cro = 7;
    plo_cro_res_thr_dim(res_sam_typ_cel_sti(i, :), tit_sam(i), fon_siz_cro, siz)
    h_cro.FontSize = fon_siz_cro;
    hax_cro = [hax_cro h_cro];
end
linkaxes(hax_sub(1:n_col), 'y')
hold on
axes('Position', hax_sub(1).Position, 'XColor', 'w', 'YColor', 'w', 'Color', 'none', 'XTick', [], 'YTick', [], 'XTickLabel', [], 'YTickLabel', []);
add_ver_sca_bar(hax_sub(1), sca_bar, 'k', per_ver);
%
hold on
axes('Position', hax_sub(n_col + 1).Position, 'XColor', 'w', 'YColor', 'w', 'Color', 'none', 'XTick', [], 'YTick', [], 'XTickLabel', [], 'YTickLabel', []);
bas_dur = 2;
nor_y = 0.34;
add_hor_sca_bar_bel(hax_sub(n_col + 1), bas_dur, 'k', nor_y); % below
nor_x = 0.08;
nor_y = -0.3;
tx = text(nor_x, nor_y, '2s', 'units', 'normalized', 'FontSize', fon_siz);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
linkaxes(hax_sub(2*n_col + 1:2*n_col + n_con), 'y')
n_cro = 3;
ind_cro_con = nchoosek(1:n_con, 2); % index cross condition
for j = 1:n_cro
    cro{j} = ind_cro_con(j, :);
end
off_non = 0.03;
for i = 1:n_sam
    hax_i_j_cel = hax_sub(2*n_col + i);
    axes(hax_i_j_cel)
    ylim([0 95])
    sigstar(cro, fon_siz, off_non, p_val_sam_thr_cro{i, thr_num});
    if i == n_sam
        leg = legend(hax_i_j_cel, hax_bar(:, i), 'LOW', 'MODERATE', 'HIGH', 'Location', 'none');
        legend('boxoff')
        leg.Position = [0.245 0.27 0.1 0.05];
        leg.FontSize = fon_siz;
    end
    ylim([0 95])
end
%%%%%%%%%%%%%%%%
lim_axi_dir = connectaxes2(hax_cro);
for i = 1:n_sam
    axes(hax_cro(i))
    tex_thr_dim(cor_coe_ave_sam_cro{i}, fon_siz_cro, lim_axi_dir, cor_coe_sem_sam_cro{i})
    if i == 1
        zlabel('Low (\Delta(\DeltaF/F))')
    end
    ylabel('Moderate')
    xlabel('High')
    title(tit_sam(i))
end
view(120, 30)
end

function plo_sta_neu_com(dff_sam_thr_fra_sta_con, per_cel_sam_thr_ani_con, res_sam_typ_cel_sti, ...
    p_val_sam_thr_cro, cor_coe_ave_sam_cro, cor_coe_sem_sam_cro, tim_tri_fra, ...
    dff_sam_con_fra_cel)
thr_num = 2;
col_con = ["blue"; "brown (traditional)"; "black"];
res_dur_neu = 2;
sti_dur_con = [0.200; 0.200; 0.200];
per_ver = 1; % percent vertical
n_sam = 2;
n_con = 3;
sca_bar = 10;
sca_bar_neu = 1000;
col_lim = [-5 50];
col_cod = '\DeltaF/F (%)';
tit_sam = {'tph2:Gal4:UAS:NTR-mCherry//HuC:GCamp6s + MTZ'; 'HuC:GCamp6s + MTZ'};
lab_sam = {'tph2 + MTZ'; 'GCamp6s + MTZ'};
c = @cmu.colors;
hax_cro = [];
hax_bar = [];
%fig_big
fig
n_row = 3;
n_col = 9;
gap_ver = 0.030;
gap_hor = 0.010;
mar_bot = 0.035;
mar_top = 0.030;
mar_lef = 0.035;
mar_rig = 0.050;
[hax_sub, ~, axh] = tight_subplot(n_row, n_col, [gap_ver gap_hor], [mar_bot mar_top], ...
    [mar_lef mar_rig]);
col_han_pos = [0.96 0.4 0.01 0.2];
nor_y_sti = 0.65;
fon_siz = 8;
%siz = 7;
global siz
for i = 1:n_sam
    [~, ord_i] = sor_mat(tim_tri_fra, dff_sam_con_fra_cel{i, 1}, res_dur_neu);
    for j = 1:n_con
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%% signals
        hax_i_j = hax_sub((i - 1)*n_con + j);
        axes(hax_i_j)
        plo_sha(tim_tri_fra, smo(dff_sam_thr_fra_sta_con{i, thr_num}(:, 1, j)), ...
            smo(dff_sam_thr_fra_sta_con{i, thr_num}(:, 2, j)), c(col_con(j)));
        set(hax_i_j, 'xcolor', 'w', 'ycolor', 'w')
        box off
        if j == 2
            title(tit_sam(i), 'FontWeight', 'normal')
        end
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% images
        hax_i_j_ima = hax_sub(n_col + (i - 1)*n_con + j);
        axes(hax_i_j_ima)
        dff_i_j = dff_sam_con_fra_cel{i, j}';
        dff_sor_i_j = dff_i_j(ord_i, :);
        n_cel_i = size(dff_sor_i_j, 1);
        imagesc(tim_tri_fra, 1:n_cel_i, smo_ima(dff_sor_i_j))
        caxis(col_lim)
        colormap(jet)
        set(hax_i_j_ima, 'ytick', [], 'yticklabel', [], 'xtick', [], 'xticklabel', [])
        if i == n_sam && j == n_con
            col_han = colorbar('Ticks', col_lim);
            col_han.Position = col_han_pos;
            col_han.Label.String = col_cod;
            col_han.Label.String = col_cod;
        end
        %
        box off
        hold on
        axes('Position', hax_i_j_ima.Position, 'YColor', 'w', 'Color', 'none', 'XTick', [], 'YTick', [], 'XTickLabel', [], 'YTickLabel', []);
        lin_wid = 2;
        add_hor_sca_bar_out(hax_i_j_ima, sti_dur_con(j), c(col_con(j)), nor_y_sti, lin_wid);
        x_lim = hax_i_j_ima.XLim;
        nor_y = 1.5;
        if j == 1
            hold on
            axes('Position', hax_i_j_ima.Position, 'XColor', 'w', 'YColor', 'w', 'Color', 'none', 'XTick', [], 'YTick', [], 'XTickLabel', [], 'YTickLabel', []);
            add_ver_sca_bar_top(hax_i_j_ima, sca_bar_neu, 'k', lin_wid);
            if i == 1
                nor_x = -0.03;
                nor_y = 0.855;
                tx = text(nor_x, nor_y, 'Neurons', 'units', 'normalized', 'FontSize', fon_siz);
                set(tx,'Rotation',90);
            end
        end
    end
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% n cells
    hax_i_j_cel = hax_sub(2*n_col + i);
    axes(hax_i_j_cel)
    per_cel_ani_con = per_cel_sam_thr_ani_con{i, thr_num};
    hax_bar_i = plo_bar_dat(per_cel_ani_con, col_con, siz);
    hax_bar = [hax_bar hax_bar_i];
    set(gca, 'XTick', [], 'XTickLabel', [])
    xlabel(lab_sam(i), 'FontSize', fon_siz)
    if i == 1
        pre_for_exp_y_lab('number of cells (%)', fon_siz)
    else
        set(hax_i_j_cel, 'ytick', [], 'yticklabel', [], 'YColor', 'w')
        box off
    end
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% cro
    h_cro = subplot(n_row, n_col, 2*n_col + n_con + (i - 1)*2 + 1:2*n_col + n_con + (i - 1)*2 + 2);
    fon_siz_cro = 7;
    plo_cro_res_thr_dim(res_sam_typ_cel_sti(i, :), tit_sam(i), fon_siz_cro, siz)
    h_cro.FontSize = fon_siz_cro;
    hax_cro = [hax_cro h_cro];
end
linkaxes(hax_sub(1:n_col), 'y')
hold on
axes('Position', hax_sub(1).Position, 'XColor', 'w', 'YColor', 'w', 'Color', 'none', 'XTick', [], 'YTick', [], 'XTickLabel', [], 'YTickLabel', []);
add_ver_sca_bar(hax_sub(1), sca_bar, 'k', per_ver);
%
hold on
axes('Position', hax_sub(n_col + 1).Position, 'XColor', 'w', 'YColor', 'w', 'Color', 'none', 'XTick', [], 'YTick', [], 'XTickLabel', [], 'YTickLabel', []);
bas_dur = 2;
nor_y = 0.34;
add_hor_sca_bar_bel(hax_sub(n_col + 1), bas_dur, 'k', nor_y);
nor_x = 0.08;
nor_y = -0.3;
tx = text(nor_x, nor_y, '2s', 'units', 'normalized', 'FontSize', fon_siz);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
linkaxes(hax_sub(2*n_col + 1:2*n_col + n_con), 'y')
n_cro = 3;
ind_cro_con = nchoosek(1:n_con, 2); % index cross condition
for j = 1:n_cro
    cro{j} = ind_cro_con(j, :);
end
off_non = 0.03;
for i = 1:n_sam
    hax_i_j_cel = hax_sub(2*n_col + i);
    axes(hax_i_j_cel)
    ylim([0 95])
    sigstar(cro, fon_siz, off_non, p_val_sam_thr_cro{i, thr_num});
    if i == n_sam
        leg = legend(hax_i_j_cel, hax_bar(:, i), 'LOW', 'MODERATE', 'HIGH', 'Location', 'none');
        legend('boxoff')
        leg.Position = [0.245 0.27 0.1 0.05];
        leg.FontSize = fon_siz;
    end
    ylim([0 95])
end
%%%%%%%%%%%%%%%%
lim_axi_dir = connectaxes2(hax_cro);
for i = 1:n_sam
    axes(hax_cro(i))
    tex_thr_dim(cor_coe_ave_sam_cro{i}, fon_siz_cro, lim_axi_dir, cor_coe_sem_sam_cro{i})
    if i == 1
        zlabel('Low (\Delta(\DeltaF/F))')
    end
    ylabel('Moderate')
    xlabel('High')
    title(tit_sam(i), 'FontWeight', 'normal')
end
view(120, 30)
end

function plo_cor(pcc_reg_sam_xri_xri, n_ani_bri_sam, ind_sam, tit_sam, dis, max_val)
n_row = 2;
n_col = 3;
gap_ver = 0.035;
gap_hor = 0.005;
mar_bot = 0.045;
mar_top = 0.035;
mar_lef = 0.025;
mar_rig = 0.015;
asp_rat = 1;
gap_hor_col = [gap_hor gap_hor gap_hor gap_hor gap_hor gap_hor];
asp_rat_axe = [asp_rat asp_rat asp_rat asp_rat ...
asp_rat asp_rat asp_rat asp_rat ...
asp_rat asp_rat asp_rat asp_rat];
[~, wid_mon, hei_mon] = fig;
[hax_sub, pos_axe, axh, dis_asp_rat] = tight_subplot_gen(n_row, n_col, gap_ver, gap_hor_col, ...
    mar_bot, mar_top, mar_lef, mar_rig, asp_rat_axe, wid_mon, hei_mon);
linkaxes(hax_sub)
%
pcc_reg_xri_xri = com_pcc_reg_xri_xri(pcc_reg_sam_xri_xri);
%
global ind_sub_reg
global lab_xri
global nam_reg
ind = 0;
%
%lim = fin_glo_ext(pcc_reg_xri_xri);
if dis
%     if dff
%         max_val = 5000;
%     else
%         max_val = 10;
%     end
    col_str = 'Euclidean distance';
else
    %max_val = 1;
    col_str = 'Correlation coefficient';
end
for i = ind_sub_reg
    ind = ind + 1;
    n_row_ima = plo_cor_sin(hax_sub(ind), pcc_reg_xri_xri{i});
    caxis(hax_sub(ind), [0 max_val])
    title(hax_sub(ind), nam_reg(i), 'FontWeight', 'normal')
    if ind == 1 || ind == n_col + 1
        hax_sub(ind).YTick = 1:n_row_ima;
        hax_sub(ind).YAxis.TickLength = [0 0];
        hax_sub(ind).YTickLabels = lab_xri;
    end
    if ind > n_col
        hax_sub(ind).XTickLabels = lab_xri;
    end
    %
    if ind == n_col || ind == 2*n_col
        col_han = colorbar(hax_sub(ind));
        col_han.Position(1) = col_han.Position(1) + 0.03;
        col_han.Label.String = col_str;
        col_han.FontSize = 20;
    end
end
%
n_cel_reg_sam = nan;
nor_x = 0.840;
nor_y = 0.600;
wri_sam_siz(n_ani_bri_sam, n_cel_reg_sam, nor_x, ind_sam, tit_sam, nor_y)
%
nor_y = 0.685;
nor_edg = 0.157;
hax = axes('Units', 'Normal', 'Position', ...
    [nor_x nor_y nor_edg nor_edg*dis_asp_rat], 'Visible', 'off', 'tag', 'suplabel');
axes(hax)
int_row_col = ...
    insertShape(uint8(255*ones(100, 100)), 'Rectangle', [1 1 100 100], 'Color', 'black');
int_row_col = ...
    insertShape(int_row_col, 'Line', [1 1 100 100], 'Color', 'black');
him = imshow(int_row_col);
text(hax, 30 - 20, 70, tit_sam(1))
text(hax, 30 + 20, 30, tit_sam(2))
end

function pcc_reg_xri_xri = com_pcc_reg_xri_xri(pcc_reg_sam_xri_xri)
global n_reg_for
pcc_reg_xri_xri = cell(n_reg_for, 1);
for k = 1:n_reg_for
    pcc_reg_xri_xri{k} = tril(pcc_reg_sam_xri_xri{k, 1}) + triu(pcc_reg_sam_xri_xri{k, 2}, 1);
end
end

function plo_pcc_xsa(pcc_ave_reg_con_sam_ani, y_lab_ave, p_pcc_reg_con_xsa, ...
    n_ani_bri_sam, ind_sam, tit_sam, col_sam_con)
global n_con
n_row = n_con;
global n_reg_for_cro
n_col = n_reg_for_cro;
gap_ver = 0.050;
gap_hor_ave = 0.030;
gap_hor_col = [gap_hor_ave gap_hor_ave gap_hor_ave gap_hor_ave gap_hor_ave gap_hor_ave];
mar_bot = 0.070;
mar_top = 0.070;
mar_lef = 0.070;
mar_rig = 0.003;
asp_rat_bar = 0.5;
asp_rat_axe = [asp_rat_bar asp_rat_bar asp_rat_bar asp_rat_bar asp_rat_bar asp_rat_bar ...
asp_rat_bar asp_rat_bar asp_rat_bar asp_rat_bar asp_rat_bar asp_rat_bar ...
asp_rat_bar asp_rat_bar asp_rat_bar asp_rat_bar asp_rat_bar asp_rat_bar];
[~, wid_mon, hei_mon] = fig;
[hax_sub, pos_axe, axh] = tight_subplot_gen(n_row, n_col, gap_ver, gap_hor_col, ...
    mar_bot, mar_top, mar_lef, mar_rig, asp_rat_axe, wid_mon, hei_mon);
linkaxes(hax_sub)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
global ind_sub_reg
y_min = inf;
y_max = -inf;
nam_sam = tit_sam(ind_sam);
global fon_siz
global nam_reg
%
ind_ite = 0;
global siz
dat = true;
for i = ind_sub_reg
    ind_ite = ind_ite + 1;
    for j = 1:n_con
        ind = (j - 1)*n_col + ind_ite;
        hax = hax_sub(ind);
        axes(hax)
        %
        plo_dat_err_xsa(hax, pcc_ave_reg_con_sam_ani, i, j, siz, col_sam_con, ind_sam, dat)
        [y_min, y_max, hax] = adj_y(hax, y_min, y_max);
        hax.FontSize = fon_siz;
        %
        if ind_ite == 1
            ylabel(y_lab_ave)
        else
            yticklabels([])
        end
        if j == 1
            title(nam_reg(i), 'FontWeight', 'normal')
            subtitle(' ')
            xticklabels([])
        elseif j == n_con
            xticklabels(nam_sam)
            fix_xticklabels
        else
            xticklabels([])
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
        axes(hax)
        %
        y_lim_pre = ylim;
        [~, y_lim] = sigstar_lim(hax, cro, fon_siz, off_non, y_lim_pre, sep, mou, ...
            ext_hei, p_pcc_reg_con_xsa{i, j});
        [y_min, y_max, hax] = adj_y(hax, y_min, y_max);
    end
end
%
global con_int
num = 4;
lef_bia = 0.000;
[tex_sam, hax] = ...
    wri_sam_rat(con_int, gap_ver, mar_top, axh, gap_hor_col, pos_axe, num, lef_bia);
nor_x = 0.650;
if n_sam == 3
    nor_y = 0.500;
else
    nor_y = 0.900;
end
n_cel_reg_sam = nan;
wri_sam_siz(n_ani_bri_sam, n_cel_reg_sam, nor_x, ind_sam, tit_sam, nor_y)
end

function h_fig = plo_res(x_sam_cel, y_sam_cel, act_reg_win_con_sam_uni)
n_row = 1;
n_col = 2;
gap_ver_row = 0.050*ones(n_row, 1);
gap_hor_row_col = 0.030*ones(n_row, n_col);
mar_bot = 0.070;
mar_top = 0.030;
mar_lef = 0.060;
mar_rig = 0.001;
con_fil = matfile('\\home.ansatt.ntnu.no\kadiram\Documents\MATLAB\con_esp.mat');
asp_rat = con_fil.asp_rat;
asp_rat_axe = asp_rat.cal.ori*ones(n_row*n_col, 1);
wid = false;
sca_axe = ones(n_row*n_col, 1);
n_pix_ext = 30;
[h_fig, fig_wid, fig_hei] = fig;
[hax_sub, pos_axe, hei_axe, dis_asp_rat, las_pix, rat_wid] = tight_subplot_gen(n_row, n_col, ...
    gap_ver_row, gap_hor_row_col, mar_bot, mar_top, mar_lef, mar_rig, asp_rat_axe, fig_wid, fig_hei, ...
    wid, sca_axe, n_pix_ext);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
mar_siz = 7;
x_uni.all = vertcat(x_sam_cel{:});
y_uni.all = vertcat(y_sam_cel{:});
x_lim = [min(y_uni.all) max(y_uni.all)];
y_lim = [min(x_uni.all) max(x_uni.all)];
col_sca_ste = con_fil.col_sca_ste;
reg = 1;
win = 2;
con = 3;
for col = 1:n_col
    hax = hax_sub(col);

    act_cel = act_reg_win_con_sam_uni{reg}{win, con}{col};
    act_cel(act_cel < col_sca_ste(1)) = col_sca_ste(1);
    act_cel(act_cel > col_sca_ste(2)) = col_sca_ste(2);

    h = scatter(hax, y_sam_cel{col}, x_sam_cel{col}, mar_siz, act_cel, 'filled');%!! n_cel mismatch
    set(hax, 'XDir', 'reverse')
    set(hax, 'YDir', 'reverse')
    hax.PlotBoxAspectRatio = [1 asp_rat.cal.ori 1];
    axis(hax, 'equal')
    hax.XLim = x_lim;
    hax.YLim = y_lim;
end
colorbar(hax)
end

function h_fig = plo_spa_den(x_sam_cel, y_sam_cel, log_sam_cel_con)
n_row = 2;
n_col = 2;
gap_ver_row = 0.000*ones(n_row, 1);
gap_hor_row_col = 0.010*ones(n_row, n_col);
mar_bot = 0.000;
mar_top = 0.000;
mar_lef = 0.010;
mar_rig = 0.001;
con_fil = matfile('\\home.ansatt.ntnu.no\kadiram\Documents\MATLAB\con_esp.mat');
asp_rat = con_fil.asp_rat;
n_sub = n_row*n_col;
asp_rat_axe = asp_rat.cal.ori*ones(n_row*n_col, 1);
wid = false;
sca_axe = ones(n_row*n_col, 1);
n_pix_ext = 30;
[h_fig, fig_wid, fig_hei] = fig;
%[h_fig, fig_wid, fig_hei] = fig_mac;
[hax_sub, pos_axe, hei_axe, dis_asp_rat, las_pix, rat_wid] = tight_subplot_gen(n_row, n_col, ...
    gap_ver_row, gap_hor_row_col, mar_bot, mar_top, mar_lef, mar_rig, asp_rat_axe, fig_wid, fig_hei, ...
    wid, sca_axe, n_pix_ext);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%mar_siz = 7;
mar_siz = 30;
x_uni.all = vertcat(x_sam_cel{:});
y_uni.all = vertcat(y_sam_cel{:});
x_lim = [min(y_uni.all) max(y_uni.all)];
y_lim = [min(x_uni.all) max(x_uni.all)];
n_con = size(log_sam_cel_con.exc{1}, 2);
if n_con == 3
    con = 3;
else
    con = 1;
end
fie_row = {'exc', 'inh'};
pro_den_sub_uni = cell(n_sub, 1);
ind = 0;
for row = 1:n_row
    for col = 1:n_col
        log_cel = logical(log_sam_cel_con.(fie_row{row}){col}(:, con));
        y_cel = y_sam_cel{col}(log_cel);
        x_cel = x_sam_cel{col}(log_cel);
        ind = ind + 1;
        pro_den_sub_uni{ind} = ksdensity([y_cel x_cel], [y_cel x_cel]);
    end
end
%max_den = max(vertcat(pro_den_sub_uni{:}));
% bou_spo = 1.963, tap = 2.493
max_den = 2.49313314871373;
min_den = 0;
ind = 0;
for row = 1:n_row
    for col = 1:n_col
        ind = ind + 1;
        hax = hax_sub((row - 1)*n_col + col);
        log_cel = logical(log_sam_cel_con.(fie_row{row}){col}(:, con));
        h = scatter(hax, y_sam_cel{col}(log_cel), x_sam_cel{col}(log_cel), mar_siz, ...
            pro_den_sub_uni{ind}, 'filled');
        hax.CLim = [min_den max_den];
        set(hax, 'XDir', 'reverse')
        set(hax, 'YDir', 'reverse')
        hax.PlotBoxAspectRatio = [1 asp_rat.cal.ori 1];
        axis(hax, 'equal')
        hax.XLim = x_lim;
        hax.YLim = y_lim;
        hax.XAxis.Visible = 'off';
        hax.YAxis.Visible = 'off';
    end
end
h_fig = opt_h_fig(h_fig, las_pix, rat_wid);
end

% ong
function plo_ofr_xsa(ofr_reg_win_sam_ani, y_lab_ave, p_ofr_reg_win_xsa, ...
    n_ani_bri_sam, ind_sam, tit_sam, col_sam_con)
global n_win_ong n_reg_for_cro ind_sub_reg mar_siz fon_siz nam_reg
n_row = n_win_ong;
n_col = n_reg_for_cro;
gap_ver = 0.030;
gap_hor_ave = 0.015;
gap_hor_col = [gap_hor_ave gap_hor_ave gap_hor_ave gap_hor_ave gap_hor_ave gap_hor_ave];
mar_bot = 0.070;
mar_top = 0.070;
mar_lef = 0.055;
mar_rig = 0.003;
asp_rat_bar = 0.5;
asp_rat_axe = [asp_rat_bar asp_rat_bar asp_rat_bar asp_rat_bar asp_rat_bar asp_rat_bar ...
asp_rat_bar asp_rat_bar asp_rat_bar asp_rat_bar asp_rat_bar asp_rat_bar ...
asp_rat_bar asp_rat_bar asp_rat_bar asp_rat_bar asp_rat_bar asp_rat_bar ...
asp_rat_bar asp_rat_bar asp_rat_bar asp_rat_bar asp_rat_bar asp_rat_bar];
[~, wid_mon, hei_mon] = fig;
[hax_sub, pos_axe, axh] = tight_subplot_gen(n_row, n_col, gap_ver, gap_hor_col, ...
    mar_bot, mar_top, mar_lef, mar_rig, asp_rat_axe, wid_mon, hei_mon);
linkaxes(hax_sub)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
y_min = inf;
y_max = -inf;
nam_sam = tit_sam(ind_sam);
ind_ite = 0;
dat = true;
for i = ind_sub_reg
    ind_ite = ind_ite + 1;
    for j = 1:n_win_ong
        ind = (j - 1)*n_col + ind_ite;
        hax = hax_sub(ind);
        %
        plo_dat_err_xsa(hax, ofr_reg_win_sam_ani{i}, j, 1, mar_siz, col_sam_con, ind_sam, dat)
        [y_min, y_max, hax] = adj_y(hax, y_min, y_max);
        hax.FontSize = fon_siz;
        %
        if ind_ite == 1
            ylabel(hax, y_lab_ave)
        else
            yticklabels(hax, [])
        end
        if j == 1
            title(hax, nam_reg(i), 'FontWeight', 'normal')
            subtitle(hax, ' ')
            xticklabels(hax, [])
        elseif j == n_win_ong
            xticklabels(hax, nam_sam)
            fix_xticklabels(hax)
        else
            xticklabels(hax, [])
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
fon_siz_non = 16;
for i = ind_sub_reg
    ind_ite = ind_ite + 1;
    for j = 1:n_win_ong
        ind = (j - 1)*n_col + ind_ite;
        hax = hax_sub(ind);
        axes(hax)
        %
        y_lim_pre = ylim;
        [~, y_lim] = sigstar_lim(hax, cro, fon_siz_non, off_non, y_lim_pre, sep, mou, ...
            ext_hei, p_ofr_reg_win_xsa{i}{j});
        [y_min, y_max, hax] = adj_y(hax, y_min, y_max);
    end
end
%
global nam_win
num = 4;
lef_bia = 0.000;
[~, hax] = wri_sam_rat(nam_win, gap_ver, mar_top, axh, gap_hor_col, pos_axe, num, lef_bia);
%
n_cel_reg_sam = nan;
nor_x = 0.500;
if n_sam == 3
    nor_y = 0.500;
else
    nor_y = 0.850;
end
wri_sam_siz(n_ani_bri_sam, n_cel_reg_sam, nor_x, ind_sam, tit_sam, nor_y)
end

function h_fig = plo_cor_dis_epo(cor_coe_epo_reg_sam_blo_ani, p_epo_reg_fac, epo_num)
[h_fig, fig_wid, fig_hei] = fig;
global asp_rat_bar n_sam dis_blo nam_reg ind_sub_reg n_reg_for_cro
con_fil = matfile('\\home.ansatt.ntnu.no\kadiram\Documents\MATLAB\con_esp.mat');
n_row = 1;
n_col = n_reg_for_cro;

% gap_ver_row = 0.050*ones(n_row, 1);
% gap_hor_row_col = 0.030*ones(n_row, n_col);
% mar_bot = 0.070;
% mar_top = 0.040;
% mar_lef = 0.055;
% mar_rig = 0.015;

gap_ver_row = 0.000*ones(n_row, 1);
gap_hor_row_col = 0.010*ones(n_row, n_col);
mar_bot = 0.070;
mar_top = 0.040;
wid = 1.5*6 + 1;
mar_lef = cal_mar_lef(wid);
mar_rig = 0.005;

asp_rat_axe = asp_rat_bar*ones(n_row*n_col, 1);
wid = true;
sca_axe = ones(n_row*n_col, 1);
n_pix_ext = 30;
[hax_sub, pos_axe, hei_axe, dis_asp_rat, las_pix, rat_wid] = tight_subplot_gen(n_row, n_col, ...
    gap_ver_row, gap_hor_row_col, mar_bot, mar_top, mar_lef, mar_rig, asp_rat_axe, fig_wid, ...
    fig_hei, wid, sca_axe, n_pix_ext);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
linkaxes(hax_sub)
ind_ite = 0;
y_min = inf;
y_max = -inf;
log_all = true;
nor_x = 0.5;
nor_y_cas = [0.8; 0.7; 0.15; 0.05];
col_sam = con_fil.col_sam;
fon_siz = con_fil.fon_siz;
for i = ind_sub_reg
    ind_ite = ind_ite + 1;
    hax = hax_sub(ind_ite);
    h_sam = [];
    for j = 1:n_sam.one
        pcc_blo_ani = cor_coe_epo_reg_sam_blo_ani.pos{epo_num, i}{j};
        pcc_blo_ani = fix_out(pcc_blo_ani);
        plo_sha.raw(hax, dis_blo.wre, pcc_blo_ani, col_sam{j})
        hold(hax, 'on')
        pcc_blo_ani = cor_coe_epo_reg_sam_blo_ani.neg{epo_num, i}{j};
        pcc_blo_ani = fix_out(pcc_blo_ani);
        plo_sha.raw(hax, dis_blo.wre, pcc_blo_ani, col_sam{j})
        hold(hax, 'on')
        hax.XTickLabelMode = 'auto';
    end
    [y_min, y_max, hax] = adj_y(hax, y_min, y_max);
    hax.Box = 'off';
    title(hax, nam_reg(i), 'FontWeight', 'normal')
    if i == ind_sub_reg(1)
        ylabel(hax, 'pairwise CC')
    else
        hax.YAxis.Visible = 'off';
    end
    xlim([0 100])%%%%%%%%%%%!!!!!!!!!!!!!!!!!!!!
    %xlabel(hax, 'distance (\mum)')
    xlabel(hax, 'dist. (\mum)')
    pri_sig(hax, nor_x, nor_y_cas(1), p_epo_reg_fac.pos{epo_num, i}(1), log_all)
    pri_sig(hax, nor_x, nor_y_cas(2), p_epo_reg_fac.pos{epo_num, i}(2), log_all)
    pri_sig(hax, nor_x, nor_y_cas(3), p_epo_reg_fac.neg{epo_num, i}(1), log_all)
    pri_sig(hax, nor_x, nor_y_cas(4), p_epo_reg_fac.neg{epo_num, i}(2), log_all)
    hax = adj_hax(hax, fon_siz.pub);
end
h_fig = opt_h_fig(h_fig, las_pix, rat_wid);
end

function h_fig = plo_cor_dis_ent(pcc_sam_blo_ani, p_ent_fac)
%[h_fig, fig_wid, fig_hei] = fig;
[h_fig, fig_wid, fig_hei] = fig_mac;
global asp_rat_bar n_sam dis_blo
con_fil = matfile('\\home.ansatt.ntnu.no\kadiram\Documents\MATLAB\con_esp.mat');
n_row = 1;
n_col = 1;

% gap_ver_row = 0.050*ones(n_row, 1);
% gap_hor_row_col = 0.030*ones(n_row, n_col);
% mar_bot = 0.070;
% mar_top = 0.040;
% mar_lef = 0.055;
% mar_rig = 0.015;

gap_ver_row = 0.000*ones(n_row, 1);
gap_hor_row_col = 0.010*ones(n_row, n_col);
mar_bot = 0.030;
hei = 3.5;
mar_top = cal_mar_top(hei);
mar_lef = 0.020;
mar_rig = 0.005;

asp_rat_axe = asp_rat_bar*ones(n_row*n_col, 1);
wid = false;
sca_axe = ones(n_row*n_col, 1);
n_pix_ext = 30;
[hax_sub, pos_axe, hei_axe, dis_asp_rat, las_pix, rat_wid] = tight_subplot_gen(n_row, n_col, ...
    gap_ver_row, gap_hor_row_col, mar_bot, mar_top, mar_lef, mar_rig, asp_rat_axe, fig_wid, ...
    fig_hei, wid, sca_axe, n_pix_ext);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
ind_ite = 0;
y_min = inf;
y_max = -inf;
log_all = true;
nor_x = 0.5;
nor_y_cas = [0.8; 0.7; 0.24; 0.16];
col_sam = con_fil.col_sam;
fon_siz = con_fil.fon_siz;
for i = 1
    ind_ite = ind_ite + 1;
    hax = hax_sub(ind_ite);
    h_sam = [];
    for j = 1:n_sam.one
        pcc_blo_ani = pcc_sam_blo_ani.pos{j};
        pcc_blo_ani = fix_out(pcc_blo_ani);
        plo_sha.raw(hax, dis_blo.xre, pcc_blo_ani, col_sam{j})
        hold(hax, 'on')
        pcc_blo_ani = pcc_sam_blo_ani.neg{j};
        pcc_blo_ani = fix_out(pcc_blo_ani);
        plo_sha.raw(hax, dis_blo.xre, pcc_blo_ani, col_sam{j})
        hold(hax, 'on')
        hax.XTickLabelMode = 'auto';
    end
    [y_min, y_max, hax] = adj_y(hax, y_min, y_max);
    hax.Box = 'off';
    ylabel(hax, 'pairwise CC')
    xlim([0 300])
    xlabel(hax, 'distance (\mum)')
    %xlabel(hax, 'dist. (\mum)')
    pri_sig(hax, nor_x, nor_y_cas(1), p_ent_fac.pos(1), log_all)
    pri_sig(hax, nor_x, nor_y_cas(2), p_ent_fac.pos(2), log_all)
    pri_sig(hax, nor_x, nor_y_cas(3), p_ent_fac.neg(1), log_all)
    pri_sig(hax, nor_x, nor_y_cas(4), p_ent_fac.neg(2), log_all)
    hax = adj_hax(hax, fon_siz.pub);
end
h_fig = opt_h_fig(h_fig, las_pix, rat_wid);
end

function h_fig = plo_ave_cor_dis(cor_coe_reg_sam_blo_ani, p_reg_fac)
[h_fig, fig_wid, fig_hei] = fig;
global asp_rat_bar n_sam dis_blo col_sam nam_reg ind_sub_reg n_reg_for_cro
n_row = 1;
n_col = n_reg_for_cro;
gap_ver_row = 0.050*ones(n_row, 1);
gap_hor_row_col = 0.030*ones(n_row, n_col);
mar_bot = 0.070;
mar_top = 0.040;
mar_lef = 0.050;
mar_rig = 0.001;
asp_rat_axe = asp_rat_bar*ones(n_row*n_col, 1);
wid = true;
sca_axe = ones(n_row*n_col, 1);
n_pix_ext = 30;
[hax_sub, pos_axe, hei_axe, dis_asp_rat, las_pix, rat_wid] = tight_subplot_gen(n_row, n_col, ...
    gap_ver_row, gap_hor_row_col, mar_bot, mar_top, mar_lef, mar_rig, asp_rat_axe, fig_wid, ...
    fig_hei, wid, sca_axe, n_pix_ext);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
linkaxes(hax_sub)
ind_ite = 0;
log_smo = false;
y_min = inf;
y_max = -inf;
log_all = true;
nor_x = 0.5;
nor_y_cas = [0.8; 0.7; 0.3; 0.2];
for i = ind_sub_reg
    ind_ite = ind_ite + 1;
    hax = hax_sub(ind_ite);
    h_sam = [];
    for j = 1:n_sam
        pcc_blo_ani = cor_coe_reg_sam_blo_ani.pos{1, i}{j};
        pcc_blo_ani = fix_out(pcc_blo_ani);
        plo_sha_gen(hax, dis_blo, pcc_blo_ani, col_sam{j}, log_smo)
        hold(hax, 'on')
        %
        pcc_blo_ani = cor_coe_reg_sam_blo_ani.neg{1, i}{j};
        pcc_blo_ani = fix_out(pcc_blo_ani);
        h_dat = plo_sha_gen(hax, dis_blo, pcc_blo_ani, col_sam{j}, log_smo);
        %
        h_sam = [h_sam h_dat];
        hold(hax, 'on')
        hax.XTickLabelMode = 'auto';
    end
    [y_min, y_max, hax] = adj_y(hax, y_min, y_max);
    hax.Box = 'off';
    title(hax, nam_reg(i), 'FontWeight', 'normal')
    if i == ind_sub_reg(1)
        ylabel(hax, 'pairwise CC')
    else
        yticks(hax, [])
    end
    xlim([0 200])%%%%%%%%%%%!!!!!!!!!!!!!!!!!!!!
    xlabel(hax, 'distance (\mum)')
    pri_sig(hax, nor_x, nor_y_cas(1), p_reg_fac.pos{1, i}(1), log_all)
    pri_sig(hax, nor_x, nor_y_cas(2), p_reg_fac.pos{1, i}(2), log_all)
    pri_sig(hax, nor_x, nor_y_cas(3), p_reg_fac.neg{1, i}(1), log_all)
    pri_sig(hax, nor_x, nor_y_cas(4), p_reg_fac.neg{1, i}(2), log_all)
end
h_fig = opt_h_fig(h_fig, las_pix, rat_wid);
end

function h_fig = plo_ave_xcc_dis(xcc_sam_blo_ani, p_fac)
[h_fig, fig_wid, fig_hei] = fig;
global asp_rat_bar n_sam dis_blo
n_row = 1;
n_col = 1;

% gap_ver_row = 0.050*ones(n_row, 1);
% gap_hor_row_col = 0.030*ones(n_row, n_col);
% mar_bot = 0.085;
% mar_top = 0.020;
% mar_lef = 0.070;
% mar_rig = 0.001;

con_fil = matfile('\\home.ansatt.ntnu.no\kadiram\Documents\MATLAB\con_esp.mat');
gap_ver_row = 0.000*ones(n_row, 1);
gap_hor_row_col = 0.000*ones(n_row, n_col);
mar_bot = 0.030;
% wid = 1.5*6 + 1;
% dis_asp_rat = con_fil.dis_asp_rat;
% hei = wid/dis_asp_rat;
hei = 3.5;
mar_top = cal_mar_top(hei);
mar_lef = 0.020;
mar_rig = 0.001;

asp_rat_axe = asp_rat_bar*ones(n_row*n_col, 1);
wid = false;
sca_axe = ones(n_row*n_col, 1);
n_pix_ext = 30;
[hax_sub, pos_axe, hei_axe, dis_asp_rat, las_pix, rat_wid] = tight_subplot_gen(n_row, n_col, ...
    gap_ver_row, gap_hor_row_col, mar_bot, mar_top, mar_lef, mar_rig, asp_rat_axe, fig_wid, ...
    fig_hei, wid, sca_axe, n_pix_ext);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
log_all = true;
nor_x = 0.5;
nor_y_cas = [0.8; 0.7; 0.24; 0.16];
col_sam = con_fil.col_sam;
hax = hax_sub(1);
fon_siz = con_fil.fon_siz;
for j = 1:n_sam.one
    pcc_blo_ani = xcc_sam_blo_ani.pos{j};
    pcc_blo_ani = fix_out(pcc_blo_ani);
    plo_sha.raw(hax, dis_blo.xre, pcc_blo_ani, col_sam{j})
    hold(hax, 'on')
    %
    pcc_blo_ani = xcc_sam_blo_ani.neg{j};
    pcc_blo_ani = fix_out(pcc_blo_ani);
    plo_sha.raw(hax, dis_blo.xre, pcc_blo_ani, col_sam{j})
    %
    hold(hax, 'on')
    hax.XTickLabelMode = 'auto';
end
hax.Box = 'off';
ylabel(hax, 'pairwise CC')
xlim([0 250])%%%%%%%%%%%!!!!!!!!!!!!!!!!!!!!
xlabel(hax, 'distance (\mum)')
pri_sig(hax, nor_x, nor_y_cas(1), p_fac.pos(1), log_all)
pri_sig(hax, nor_x, nor_y_cas(2), p_fac.pos(2), log_all)
pri_sig(hax, nor_x, nor_y_cas(3), p_fac.neg(1), log_all)
pri_sig(hax, nor_x, nor_y_cas(4), p_fac.neg(2), log_all)
hax = adj_hax(hax, fon_siz.pub);
h_fig = opt_h_fig(h_fig, las_pix, rat_wid);
end

function plo_cor_his(per_pai_reg_sam_bin_ani, tit_sam, sta_reg_num, nam_reg, ...
    cor_coe_bin, x_lab)
[~, fig_wid, fig_hei] = fig;
n_row = 2;
n_col = 4;
gap_ver = 0.050;
gap_hor_col = [0.030 0.030 0.030 0.030];
mar_bot = 0.070;
mar_top = 0.040;
mar_lef = 0.050;
mar_rig = 0.001;
asp_rat = 0.7;
asp_rat_axe = asp_rat*ones(n_row*n_col, 1);
hax_sub = tight_subplot_gen(n_row, n_col, gap_ver, gap_hor_col, [mar_bot mar_top], ...
    [mar_lef mar_rig], asp_rat_axe, fig_wid, fig_hei);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
linkaxes(hax_sub)
n_sub = n_row*n_col;
[n_reg, n_sam] = size(per_pai_reg_sam_bin_ani);
if sta_reg_num == 1% for 2 figures
    sto_reg_num = n_sub;
else
    sto_reg_num = n_reg;
end
global col_sam
y_min = inf;
y_max = -inf;
for i = sta_reg_num:sto_reg_num
    if sta_reg_num == 1
        ind_sub = i;
    else
        ind_sub = i - n_sub;
    end
    hax = hax_sub(ind_sub);
    h_sam = [];
    for j = 1:n_sam
        h_dat = plo_sha_gen(hax, cor_coe_bin, per_pai_reg_sam_bin_ani{i, j}, col_sam{j});
        h_sam = [h_sam h_dat];
        hold(hax, 'on')
        hax.XTickLabelMode = 'auto';
    end
    [y_min, y_max, hax] = adj_y(hax, y_min, y_max);
    hax.Box = 'off';
    title(hax, nam_reg(i), 'FontWeight', 'normal')
    if ind_sub == 1
        ylabel(hax, '%Neuron-neuron pairs')
        leg = legend(hax, h_sam, tit_sam);
        leg.Box = 'off';
    elseif ind_sub == n_col + 1
        ylabel(hax, '%Neuron-neuron pairs')
    else
        yticks(hax, [])
    end
    if ind_sub < n_col + 1
        xticks(hax, [])
    else
        xlabel(hax, x_lab)
    end
end
end

function plo_cor_kld(kld_reg_xsa, tit_sam, sta_reg_num, nam_reg, sig_lev_reg)
    [~, fig_wid, fig_hei] = fig;
    n_row = 2;
    [n_reg, ~] = size(kld_reg_xsa);
    n_col = 4;
    gap_ver = 0.050;
    gap_hor_col = [0.030 0.030 0.030 0.030];
    mar_bot = 0.070;
    mar_top = 0.040;
    mar_lef = 0.050;
    mar_rig = 0.001;
    asp_rat = 0.7;
    asp_rat_axe = asp_rat*ones(n_row*n_col, 1);
    hax_sub = tight_subplot_gen(n_row, n_col, gap_ver, gap_hor_col, [mar_bot mar_top], ...
        [mar_lef mar_rig], asp_rat_axe, fig_wid, fig_hei);
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    linkaxes(hax_sub)
    n_sub = n_row*n_col;
    if sta_reg_num == 1
        sto_reg_num = n_sub;
    else
        sto_reg_num = n_reg;
    end
    col = 'blue';
    global lin_wid
    lin_sty = '--';
    y_min = inf;
    y_max = -inf;
    y_lab = 'KL divergence (bits)';
    for i = sta_reg_num:sto_reg_num
        if sta_reg_num == 1
            ind_sub = i;
        else
            ind_sub = i - n_sub;
        end
        hax = hax_sub(ind_sub);
        h_dat = bar(hax, kld_reg_xsa(i, :));
        lin = plo_hor_lin(hax, sig_lev_reg(i), col, lin_wid, lin_sty);
        [y_min, y_max, hax] = adj_y(hax, y_min, y_max);
        hax.Box = 'off';
        title(hax, nam_reg(i), 'FontWeight', 'normal')
        if ind_sub == 1
            ylabel(hax, y_lab)
        elseif ind_sub == n_col + 1
            ylabel(hax, y_lab)
        else
            yticks(hax, [])
        end
        if ind_sub < n_col + 1
            xticks(hax, [])
        else
            xticklabels(hax, {'Abl', 'HuC'})
            xlabel(hax, 'Groups')
        end
    end
    %
%     for i = sta_reg_num:sto_reg_num
%         if sta_reg_num == 1
%             ind_sub = i;
%         else
%             ind_sub = i - n_sub;
%         end
%         hax = hax_sub(ind_sub);
%         lin = plo_hor_lin(hax, sig_lev_reg(i), col, lin_wid, lin_sty);
%     end
end

function plo_kur_com(kur_reg_sam_ani, tit_sam, sta_reg_num, nam_reg, p_kur_reg_xsa, y_lab)
    [~, fig_wid, fig_hei] = fig;
    n_row = 2;
    [n_reg, ~] = size(kur_reg_sam_ani);
    n_col = 4;
    gap_ver = 0.050;
    gap_hor_col = [0.030 0.030 0.030 0.030];
    mar_bot = 0.070;
    mar_top = 0.040;
    mar_lef = 0.050;
    mar_rig = 0.001;
    asp_rat = 0.7;
    asp_rat_axe = asp_rat*ones(n_row*n_col, 1);
    hax_sub = tight_subplot_gen(n_row, n_col, gap_ver, gap_hor_col, [mar_bot mar_top], ...
        [mar_lef mar_rig], asp_rat_axe, fig_wid, fig_hei);
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    linkaxes(hax_sub)
    n_sub = n_row*n_col;
    if sta_reg_num == 1
        sto_reg_num = n_sub;
    else
        sto_reg_num = n_reg;
    end
    global mar_siz
    global col_sam
    y_min = inf;
    y_max = -inf;
    for i = sta_reg_num:sto_reg_num
        if sta_reg_num == 1
            ind_sub = i;
        else
            ind_sub = i - n_sub;
        end
        hax = hax_sub(ind_sub);
        h_plo = plo_dat_err_con_sam_uni(hax, kur_reg_sam_ani, i, mar_siz, col_sam);
        [y_min, y_max, hax] = adj_y(hax, y_min, y_max);
        hax.Box = 'off';
        title(hax, nam_reg(i), 'FontWeight', 'normal')
        if ind_sub == 1
            ylabel(hax, y_lab)
        elseif ind_sub == n_col + 1
            ylabel(hax, y_lab)
        else
            yticks(hax, [])
        end
        if ind_sub < n_col + 1
            xticks(hax, [])
        else
            xticklabels(hax, {'Abl', 'HuC', 'Sha'})
            xlabel(hax, 'Groups')
        end
    end
    %
    global gro_cro
    global fon_siz
    off_non = 0.070;
    mou = 0.030;
    sep = off_non + mou + 0.040;
    ext_hei = -(sep + mou);
    for i = sta_reg_num:sto_reg_num
        if sta_reg_num == 1
            ind_sub = i;
        else
            ind_sub = i - n_sub;
        end
        hax = hax_sub(ind_sub);
        y_lim_pre = ylim;
        [~, y_lim] = sigstar_lim(hax, gro_cro, fon_siz, off_non, y_lim_pre, ...
            sep, mou, ext_hei, p_kur_reg_xsa{i});
        [y_min, y_max, hax] = adj_y(hax, y_min, y_max);
    end
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function h_fig = plo_cor_xsa(per_pai_epo_reg_sam_bin_ani, ske_epo_reg_sam_ani, ...
    p_ske_epo_reg_xsa, acc_epo_reg_sam_ani, p_acc_epo_reg_xsa, ind_sam, col_sam, tit_sam, epo_num)
n_row = 3;
global n_reg_for_cro ind_sub_reg nam_reg mag_cor_coe_bin nam_epo
n_col = n_reg_for_cro;
gap_ver_row = [0.090 0.050 0.050];
gap_hor_ave = 0.055;
gap_hor_col = [gap_hor_ave gap_hor_ave gap_hor_ave gap_hor_ave gap_hor_ave gap_hor_ave];
gap_hor_row_col = repmat(gap_hor_col, n_row, 1);
mar_bot = 0.040;
mar_top = 0.080;
mar_lef = 0.055;
mar_rig = 0.000;
asp_rat_bar = 0.7;
asp_rat_axe = [asp_rat_bar asp_rat_bar asp_rat_bar asp_rat_bar asp_rat_bar asp_rat_bar ...
asp_rat_bar asp_rat_bar asp_rat_bar asp_rat_bar asp_rat_bar asp_rat_bar ...
asp_rat_bar asp_rat_bar asp_rat_bar asp_rat_bar asp_rat_bar asp_rat_bar];
[h_fig, wid_mon, hei_mon] = fig;
wid = false;
sca_axe = ones(1, n_row*n_col);
n_pix_ext = 17;
[hax_sub, pos_axe, axh, dis_asp_rat, las_pix, rat_wid] = tight_subplot_gen(n_row, n_col, ...
    gap_ver_row, gap_hor_row_col, ...
    mar_bot, mar_top, mar_lef, mar_rig, asp_rat_axe, wid_mon, hei_mon, wid, sca_axe, n_pix_ext);
linkaxes(hax_sub(1:n_reg_for_cro))
linkaxes(hax_sub(n_reg_for_cro + 1:2*n_reg_for_cro))
linkaxes(hax_sub(2*n_reg_for_cro + 1:3*n_reg_for_cro))
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
y_min = inf;
y_max = -inf;
n_sam = length(ind_sam);
nam_sam = tit_sam(ind_sam);
col_ind_sam = col_sam(ind_sam);
x_lab = '|Pairwise corr|';
fon_siz = 25;
mar_siz = 20;
%
ind_sub = 0;
for i = ind_sub_reg
    ind_sub = ind_sub + 1;
    hax = hax_sub(ind_sub);
    h_sam = [];
    for k = 1:n_sam
        h_dat = plo_sha_gen(hax, mag_cor_coe_bin, per_pai_epo_reg_sam_bin_ani{epo_num, i}{k}, ...
            col_ind_sam{k});
        h_sam = [h_sam h_dat];
        hold(hax, 'on')
        hax.XTickLabelMode = 'auto';
    end
    [y_min, y_max, hax] = adj_y(hax, y_min, y_max);
    hax.FontSize = fon_siz;
    %
    if ind_sub == 1
        h_ref = ylabel(hax, '%Cell-cell pairs');
        h_ref.Units = 'normalized';
        leg = legend(hax, h_sam, nam_sam);
        leg.Box = 'off';
    else
        hax.YAxis.Visible = 'off';
    end
    xlabel(hax, x_lab)
    %
    title(hax, nam_reg(i), 'FontWeight', 'normal')
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
dat = true;
y_min = inf;
y_max = -inf;
y_lab = 'Skewness';
for i = ind_sub_reg
    ind_sub = ind_sub + 1;
    hax = hax_sub(ind_sub);
    plo_dat_err_xsa(hax, ske_epo_reg_sam_ani, epo_num, i, mar_siz, col_sam, ind_sam, dat)
    [y_min, y_max, hax] = adj_y(hax, y_min, y_max);
    hax.FontSize = fon_siz;
    %
    if ind_sub == n_col + 1
        h = ylabel(hax, y_lab);
        h.Units = 'normalized';
        h.Position(1) = h_ref.Position(1);
    else
        hax.YAxis.Visible = 'off';
    end
    hax.XAxis.Visible = 'off';
end
%
cro = ext_cro(ind_sam);
off_non = 0.070;
mou = 0.030;
sep = off_non + mou + 0.040;
ext_hei = -(sep + mou);
ind_sub = n_col;
for i = ind_sub_reg
    ind_sub = ind_sub + 1;
    hax = hax_sub(ind_sub);
    y_lim_pre = ylim(hax);
    [~, y_lim] = sigstar_lim(hax, cro, fon_siz, off_non, y_lim_pre, sep, mou, ...
        ext_hei, p_ske_epo_reg_xsa.lme{epo_num, i});
    [y_min, y_max, hax] = adj_y(hax, y_min, y_max);
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
y_min = inf;
y_max = -inf;
for i = ind_sub_reg
    ind_sub = ind_sub + 1;
    hax = hax_sub(ind_sub);
    plo_dat_err_xsa(hax, acc_epo_reg_sam_ani, epo_num, i, mar_siz, col_sam, ind_sam, dat)
    [y_min, y_max, hax] = adj_y(hax, y_min, y_max);
    %
    if ind_sub == 2*n_col + 1
        h = ylabel(hax, x_lab);
        h.Units = 'normalized';
        h.Position(1) = h_ref.Position(1);
    else
        hax.YAxis.Visible = 'off';
    end
    xticklabels(hax, nam_sam)
end
%
ind_sub = 2*n_col;
for i = ind_sub_reg
    ind_sub = ind_sub + 1;
    hax = hax_sub(ind_sub);
    y_lim_pre = ylim(hax);
    [~, y_lim] = sigstar_lim(hax, cro, fon_siz, off_non, y_lim_pre, sep, mou, ...
        ext_hei, p_acc_epo_reg_xsa.lme{epo_num, i});
    [y_min, y_max, hax] = adj_y(hax, y_min, y_max);
    hax.FontSize = fon_siz;
end

supAxes = [0 0 1 1];
[ax, h] = suplabel(nam_epo(epo_num), 't', supAxes);
h.FontSize = 30;
h.Position(2) = 0.985;

h_fig = opt_h_fig(h_fig, las_pix, rat_wid);
end

function h_fig = plo_abs_cor_xsa(acc_epo_reg_sam_ani, p_acc_epo_reg_xsa, ind_sam, col_sam, ...
    tit_sam, epo_num)
n_row = 1;
global n_reg_for_cro ind_sub_reg nam_epo
n_col = n_reg_for_cro;
gap_ver_row = [0.090 0.050 0.050];
gap_hor_ave = 0.010;
gap_hor_col = [gap_hor_ave gap_hor_ave gap_hor_ave gap_hor_ave gap_hor_ave gap_hor_ave];
gap_hor_row_col = repmat(gap_hor_col, n_row, 1);
mar_bot = 0.040;
mar_top = 0.080;
mar_lef = 0.060;
mar_rig = 0.600;
asp_rat_bar = 0.5;
asp_rat_axe = asp_rat_bar*ones(1, n_row*n_col);
[h_fig, wid_mon, hei_mon] = fig;
wid = true;
sca_axe = ones(1, n_row*n_col);
n_pix_ext = 17;
[hax_sub, pos_axe, axh, dis_asp_rat, las_pix, rat_wid] = tight_subplot_gen(n_row, n_col, ...
    gap_ver_row, gap_hor_row_col, ...
    mar_bot, mar_top, mar_lef, mar_rig, asp_rat_axe, wid_mon, hei_mon, wid, sca_axe, n_pix_ext);
linkaxes(hax_sub)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
nam_sam = tit_sam(ind_sam);
y_lab = '|Pairwise corr|';
fon_siz = 24;
mar_siz = 24;
%
ind_sub = 0;
dat = true;
y_min = inf;
y_max = -inf;
con_fil = matfile('\\home.ansatt.ntnu.no\kadiram\Documents\MATLAB\con_esp.mat');
nam_com_reg = con_fil.nam_com_reg;
ind = 0;
for i = ind_sub_reg
    ind_sub = ind_sub + 1;
    hax = hax_sub(ind_sub);
    plo_dat_err_xsa(hax, acc_epo_reg_sam_ani, epo_num, i, mar_siz, col_sam, ind_sam, dat)
    [y_min, y_max, hax] = adj_y(hax, y_min, y_max);
    %
    if ind_sub == 1
        h = ylabel(hax, y_lab);
    else
        hax.YAxis.Visible = 'off';
    end
    xticklabels(hax, nam_sam)
    %
    ind = ind + 1;
    title(hax, nam_com_reg{ind}, 'FontWeight', 'normal')
end
%
ind_sub = 0;
cro = ext_cro(ind_sam);
off_non = 0.070;
mou = 0.030;
sep = off_non + mou + 0.040;
ext_hei = -(sep + mou);
for i = ind_sub_reg
    ind_sub = ind_sub + 1;
    hax = hax_sub(ind_sub);
    y_lim_pre = ylim(hax);
    %[~, y_lim] = sigstar_lim(hax, cro, fon_siz, off_non, y_lim_pre, sep, mou, ext_hei, ...
    %    p_acc_epo_reg_xsa.lme{epo_num, i});
    ind_sig.sig(hax, cro, y_lim_pre, sep, mou, ext_hei, p_acc_epo_reg_xsa.lme{epo_num, i})
    [y_min, y_max, hax] = adj_y(hax, y_min, y_max);
    hax.FontSize = fon_siz;
end

% supAxes = [0 0 1 1];
% [ax, h] = suplabel(nam_epo(epo_num), 't', supAxes);
% h.FontSize = 30;
% h.Position(2) = 0.985;

h_fig = opt_h_fig(h_fig, las_pix, rat_wid);
end

function plo_cro_cor_xsa(per_pai_xre_sam_bin_mag_ani, ske_xre_sam_ani, p_ske_xre_xsa)
global n_reg_for_cro
n_row = n_reg_for_cro;
n_col = n_reg_for_cro;
gap_ver = 0.020;
gap_hor_ave = 0.020;
gap_hor_col = [gap_hor_ave gap_hor_ave gap_hor_ave gap_hor_ave gap_hor_ave gap_hor_ave];
mar_bot = 0.050;
mar_top = 0.020;
mar_lef = 0.055;
mar_rig = 0.003;
asp_rat_bar = 0.7;
asp_rat_axe = [asp_rat_bar asp_rat_bar asp_rat_bar asp_rat_bar asp_rat_bar asp_rat_bar ...
    asp_rat_bar asp_rat_bar asp_rat_bar asp_rat_bar asp_rat_bar asp_rat_bar ...
    asp_rat_bar asp_rat_bar asp_rat_bar asp_rat_bar asp_rat_bar asp_rat_bar ...
    asp_rat_bar asp_rat_bar asp_rat_bar asp_rat_bar asp_rat_bar asp_rat_bar ...
    asp_rat_bar asp_rat_bar asp_rat_bar asp_rat_bar asp_rat_bar asp_rat_bar ...
    asp_rat_bar asp_rat_bar asp_rat_bar asp_rat_bar asp_rat_bar asp_rat_bar];
[~, wid_mon, hei_mon] = fig;
[hax_sub, pos_axe, axh] = tight_subplot_gen(n_row, n_col, gap_ver, gap_hor_col, ...
    [mar_bot mar_top], [mar_lef mar_rig], asp_rat_axe, wid_mon, hei_mon);
[ind_low_plo, ind_upp_plo, ind_dia_plo] = ext_ind(n_reg_for_cro);
linkaxes(hax_sub(ind_low_plo))
linkaxes(hax_sub(ind_upp_plo))
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
for i = 1:n_reg_for_cro
    ind_sub = ind_dia_plo(i);
    hax = hax_sub(ind_sub);
    hax.XColor = 'none';
    hax.YColor = 'none';
end
global n_cro_reg
y_min = inf;
y_max = -inf;
ind_sam = [3 1 2];
n_sam = length(ind_sam);
per_pai_xre_sam_bin_mag_ani = per_pai_xre_sam_bin_mag_ani(:, ind_sam);
ske_xre_sam_ani = ske_xre_sam_ani(:, ind_sam);
global nam_sho_sam
nam_sam = nam_sho_sam(ind_sam);
global fon_siz
global mag_cor_coe_bin
global col_sam
col_ind_sam = col_sam(ind_sam);
x_lab = '|Pairwise corr|';
fon_siz_sma = 12;
for i = 1:n_cro_reg
    ind_sub = ind_low_plo(i);
    hax = hax_sub(ind_sub);
    axes(hax)
    %
    h_sam = [];
    for k = 1:n_sam
        h_dat = plo_sha_gen(hax, mag_cor_coe_bin, per_pai_xre_sam_bin_mag_ani{i, k}, ...
            col_ind_sam{k});
        h_sam = [h_sam h_dat];
        hold(hax, 'on')
        hax.XTickLabelMode = 'auto';
    end
    [y_min, y_max, hax] = adj_y(hax, y_min, y_max);
    hax.FontSize = fon_siz;
    %
    if i == 1
        ylabel(hax, '%Cell-cell pairs', 'FontSize', fon_siz_sma)
        leg = legend(hax, h_sam, nam_sam);
        leg.Box = 'off';
    elseif mod(ind_sub, n_reg_for_cro) == 1
        ylabel(hax, '%Cell-cell pairs', 'FontSize', fon_siz_sma)
    else
        yticks(hax, [])
    end
    if ind_sub > (n_reg_for_cro - 1)*n_reg_for_cro
        xlabel(hax, x_lab, 'FontSize', fon_siz_sma)
    else
        xticks([])
    end
    hax.FontSize = fon_siz_sma;
end
%
y_min = inf;
y_max = -inf;
global mar_siz
y_lab = 'Skewness';
for i = 1:n_cro_reg
    ind_sub = ind_upp_plo(i);
    hax = hax_sub(ind_sub);
    axes(hax)
    %
    h_plo = plo_dat_err_con_sam_uni(hax, ske_xre_sam_ani, i, mar_siz, col_ind_sam);
    [y_min, y_max, hax] = adj_y(hax, y_min, y_max);
    hax.FontSize = fon_siz_sma;
    %
    if (fix(ind_sub/n_reg_for_cro) == mod(ind_sub, n_reg_for_cro) - 2) || i == n_cro_reg
        xticklabels(hax, nam_sam)
        ylabel(hax, y_lab)
    else
        xticks(hax, [])
        yticks(hax, [])
    end
end
%
global nam_com_reg
for i = 1:n_reg_for_cro
    hax = hax_sub(i);
    axes(hax)
    title(nam_com_reg(i), 'FontWeight', 'normal')
    hax.FontSize = fon_siz_sma;
    %
    hax = hax_sub((i - 1)*n_col + 1);
    axes(hax)
    text(hax, -0.8, 0.5, nam_com_reg(i), 'Units', 'normalized', 'FontSize', fon_siz_sma)
end
%
ind_sam_ori = 1:3;
[~, loc_sam] = ismember(ind_sam_ori, ind_sam);
cro = com_cro(loc_sam);
off_non = 0.070;
mou = 0.030;
sep = off_non + mou + 0.040;
ext_hei = -(sep + mou);
for i = 1:n_cro_reg
    ind_sub = ind_upp_plo(i);
    hax = hax_sub(ind_sub);
    axes(hax)
    %
    y_lim_pre = ylim;
    [~, y_lim] = sigstar_lim(hax, cro, fon_siz_sma, off_non, y_lim_pre, sep, mou, ...
        ext_hei, p_ske_xre_xsa{i});
    [y_min, y_max, hax] = adj_y(hax, y_min, y_max);
end

end

function plo_dia(dif_ske_xre_sam, tit_n_bri_sam, p_ske_xre_xsa, sig, ind_sam)
n_row = 1;
n_sam = length(ind_sam);
n_col = n_sam;
gap_ver = 0.000;
gap_hor_ave = 0.015;
gap_hor_col = [gap_hor_ave gap_hor_ave gap_hor_ave gap_hor_ave gap_hor_ave gap_hor_ave];
mar_bot = 0.000;
mar_top = 0.030;
mar_lef = 0.010;
mar_rig = 0.000;
global asp_rat_cax n_pix_hor n_pix_ver gre n_cro_tot reg_cro_ind lin_wid_min sig_lev ...
    fil_pat_for fon_siz
asp_rat_axe = [asp_rat_cax asp_rat_cax asp_rat_cax];
[~, wid_mon, hei_mon] = fig;
wid = false;
[hax_sub, pos_axe, axh, dis_asp_rat] = tight_subplot_gen(n_row, n_col, gap_ver, gap_hor_col, ...
    mar_bot, mar_top, mar_lef, mar_rig, asp_rat_axe, wid_mon, hei_mon, wid);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
one_six = n_pix_hor/16;
eix = n_pix_hor/8;
qua = n_pix_hor/4;
hal = n_pix_hor/2;
fiv_six = (5/16)*n_pix_hor;
thr_eix = 3*eix;
pix_num_hor_lef_reg = [fiv_six; eix; thr_eix; qua; one_six; thr_eix];
pix_num_hor_rig_reg = abs(pix_num_hor_lef_reg - hal) + hal;
pix_num_hor_reg = [pix_num_hor_lef_reg; pix_num_hor_rig_reg] + 15; %%%%
pix_num_ver_lef_reg = [n_pix_ver/16; 0.75*n_pix_ver; 0.5*n_pix_ver; 0.625*n_pix_ver; ...
    0.375*n_pix_ver; 0.250*n_pix_ver];
pix_num_ver_reg = [pix_num_ver_lef_reg; pix_num_ver_lef_reg]; %%%%
mar_siz = 50;
max_abs_dif = max(abs(dif_ske_xre_sam), [], 'all');
tit_ind_sam = tit_n_bri_sam(ind_sam);
labels = {'Ha' 'Dl' 'Dm' 'Dc' 'Dd' 'Dmp' 'Ha' 'Dl' 'Dm' 'Dc' 'Dd' 'Dmp'};
[x, y] = ext_coo(fil_pat_for);
for j = 1:n_col
    scatter(hax_sub(j), pix_num_hor_reg, pix_num_ver_reg, 'Marker', 'o', ...
        'MarkerEdgeColor', gre, 'MarkerFaceColor', gre, 'SizeData', mar_siz);
    for i = 1:n_cro_tot
        hold(hax_sub(j), 'on')
        if j == 1
            plot(hax_sub(j), ...
                [pix_num_hor_reg(reg_cro_ind(i, 1)); pix_num_hor_reg(reg_cro_ind(i, 2))], ...
                [pix_num_ver_reg(reg_cro_ind(i, 1)); pix_num_ver_reg(reg_cro_ind(i, 2))], ...
                'g', 'LineWidth', lin_wid_min)
        else
            dif = dif_ske_xre_sam(i, j - 1);
            reg_one = reg_cro_ind(i, 1);
            reg_two = reg_cro_ind(i, 2);
            if (n_sam == 3 && ((sig && p_ske_xre_xsa{i}(j) < sig_lev) || ~sig)) || ...
                    (n_sam == 2 && ((sig && p_ske_xre_xsa{i} < sig_lev) || ~sig))
                plo_xre(hax_sub(j), dif, pix_num_hor_reg, pix_num_ver_reg, reg_one, reg_two, ...
                    max_abs_dif)
            end
        end
    end
    hax_sub(j).Children = circshift(hax_sub(j).Children, 1);
    hax_sub(j).Visible = 'off';
    title(hax_sub(j), tit_ind_sam(j), 'FontWeight', 'normal')
    hax_sub(j).Title.Visible = 'on';
    hax_sub(j).Title.Units = 'normalized';
    hax_sub(j).Title.Position(2) = 1;
    axes(hax_sub(j))
    [h, ext] = labelpoints(pix_num_hor_reg, pix_num_ver_reg, labels, 'FontSize', fon_siz);
    scatter(hax_sub(j), x, y, 10, 'k', 'filled')
    hax_sub(j).XLim(2) = max(x);
    hax_sub(j).YLim(2) = max(y);
end
end

function h_fig = plo_dia_com(dif_ske_xre_sam, tit_n_bri_sam, p_ske_xre_xsa, ...
    dif_mag_cor_coe_xre_sam, p_mag_cor_coe_xre_xsa)
n_row = 2;
n_col = 2;
gap_ver_row = [0.010 0.050];
gap_hor_ave = 0.015;
gap_hor_col = [gap_hor_ave gap_hor_ave];
gap_hor_row_col = repmat(gap_hor_col, n_row, 1);
mar_bot = 0.000;
mar_top = 0.030;
mar_lef = 0.015;
mar_rig = 0.000;
global asp_rat_cax n_pix_hor n_pix_ver gre n_cro_tot reg_cro_ind lin_wid_min sig_lev ...
    fil_pat_for fon_siz
asp_rat_axe = [asp_rat_cax asp_rat_cax asp_rat_cax  asp_rat_cax];
[h_fig, wid_mon, hei_mon] = fig;
wid = false;
sca_axe = ones(1, n_row*n_col);
n_pix_ext = 7;
[hax_sub, pos_axe, axh, dis_asp_rat, las_pix, rat_wid] = tight_subplot_gen(n_row, n_col, ...
    gap_ver_row, gap_hor_row_col, ...
    mar_bot, mar_top, mar_lef, mar_rig, asp_rat_axe, wid_mon, hei_mon, wid, sca_axe, n_pix_ext);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
one_six = n_pix_hor/16;
eix = n_pix_hor/8;
qua = n_pix_hor/4;
hal = n_pix_hor/2;
fiv_six = (5/16)*n_pix_hor;
thr_eix = 3*eix;
pix_num_hor_lef_reg = [fiv_six; eix; thr_eix; qua; one_six; thr_eix];
pix_num_hor_rig_reg = abs(pix_num_hor_lef_reg - hal) + hal;
pix_num_hor_reg = [pix_num_hor_lef_reg; pix_num_hor_rig_reg] + 100; %%%%!!!!!!!!!!!!!!!!!!!!!!!
pix_num_ver_lef_reg = [n_pix_ver/16; 0.75*n_pix_ver; 0.5*n_pix_ver; 0.625*n_pix_ver; ...
    0.375*n_pix_ver; 0.250*n_pix_ver];
pix_num_ver_reg = [pix_num_ver_lef_reg; pix_num_ver_lef_reg] + 20; %%%%
mar_siz = 50;
sig = true;
max_abs_dif = max(abs(dif_ske_xre_sam), [], 'all');
max_abs_dif_mag_cor_coe = max(abs(dif_mag_cor_coe_xre_sam), [], 'all');
tit_ind_sam = [tit_n_bri_sam; tit_n_bri_sam(end)];
labels = {'Ha' 'Dl' 'Dm' 'Dc' 'Dd' 'Dmp' 'Ha' 'Dl' 'Dm' 'Dc' 'Dd' 'Dmp'};
[x, y] = ext_coo(fil_pat_for);
for j = 1:n_row*n_col
    scatter(hax_sub(j), pix_num_hor_reg, pix_num_ver_reg, 'Marker', 'o', ...
        'MarkerEdgeColor', gre, 'MarkerFaceColor', gre, 'SizeData', mar_siz);
    for i = 1:n_cro_tot
        hold(hax_sub(j), 'on')
        if j == 1
            dif = dif_ske_xre_sam(i);
            reg_one = reg_cro_ind(i, 1);
            reg_two = reg_cro_ind(i, 2);
            plo_xre(hax_sub(j), dif, pix_num_hor_reg, pix_num_ver_reg, reg_one, reg_two, max_abs_dif)
            hax_sub(j).Visible = 'off';
            h = ylabel(hax_sub(j), 'Skewness');
            h.Visible = 'on';
            h.Position(1) = 0;
            h = title(hax_sub(j), 'All', 'FontWeight','normal');
            h.Visible = 'on';
        elseif j == 2
            dif = dif_ske_xre_sam(i);
            reg_one = reg_cro_ind(i, 1);
            reg_two = reg_cro_ind(i, 2);
            if (sig && p_ske_xre_xsa{i}.lme < sig_lev) || ~sig
                plo_xre(hax_sub(j), dif, pix_num_hor_reg, pix_num_ver_reg, reg_one, reg_two, ...
                    max_abs_dif)
            end
            hax_sub(j).Visible = 'off';
            h = title(hax_sub(j), 'Significant', 'FontWeight','normal');
            h.Visible = 'on';
%%%%%%%%%%%%%%%%%%%%%%%%
        elseif j == 3
            dif = dif_mag_cor_coe_xre_sam(i);
            reg_one = reg_cro_ind(i, 1);
            reg_two = reg_cro_ind(i, 2);
            plo_xre(hax_sub(j), dif, pix_num_hor_reg, pix_num_ver_reg, reg_one, reg_two, ...
                max_abs_dif_mag_cor_coe)
            hax_sub(j).Visible = 'off';
            h = ylabel(hax_sub(j), '|Pairwise corr|');
            h.Visible = 'on';
            h.Position(1) = 0;
        elseif j == 4
            dif = dif_mag_cor_coe_xre_sam(i);
            reg_one = reg_cro_ind(i, 1);
            reg_two = reg_cro_ind(i, 2);
            if (sig && p_mag_cor_coe_xre_xsa{i}.lme < sig_lev) || ~sig
                plo_xre(hax_sub(j), dif, pix_num_hor_reg, pix_num_ver_reg, reg_one, reg_two, ...
                    max_abs_dif_mag_cor_coe)
            end
            hax_sub(j).Visible = 'off';
        end
    end
    hax_sub(j).Children = circshift(hax_sub(j).Children, 1);
    axes(hax_sub(j))
    labelpoints(pix_num_hor_reg, pix_num_ver_reg, labels, 'FontSize', fon_siz);
    scatter(hax_sub(j), x, y, 10, 'k', 'filled')
    hax_sub(j).XLim(2) = max(x);
    hax_sub(j).YLim(2) = max(y);
end
h_fig = opt_h_fig(h_fig, las_pix, rat_wid);
end

function h_fig = plo_dia_all(dif_ske_epo_xre_sam, dif_acc_epo_xre_sam)
n_row = 4;
n_col = 2;
gap_ver_row = 0.010*ones(1, n_row);
gap_hor_ave = 0.015;
gap_hor_col = gap_hor_ave*ones(1, n_col);
gap_hor_row_col = repmat(gap_hor_col, n_row, 1);
mar_bot = 0.000;
mar_top = 0.020;
mar_lef = 0.030;
mar_rig = 0.000;
global asp_rat_cax n_pix_hor n_pix_ver gre n_cro_tot reg_cro_ind fil_pat_for fon_siz nam_epo
asp_rat_axe = asp_rat_cax*ones(1, n_row*n_col);
[h_fig, wid_mon, hei_mon] = fig_por;
wid = false;
sca_axe = ones(1, n_row*n_col);
n_pix_ext = 7;
[hax_sub, pos_axe, axh, dis_asp_rat, las_pix, rat_wid] = tight_subplot_gen(n_row, n_col, ...
    gap_ver_row, gap_hor_row_col, ...
    mar_bot, mar_top, mar_lef, mar_rig, asp_rat_axe, wid_mon, hei_mon, wid, sca_axe, n_pix_ext);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
one_six = n_pix_hor/16;
eix = n_pix_hor/8;
qua = n_pix_hor/4;
hal = n_pix_hor/2;
fiv_six = (5/16)*n_pix_hor;
thr_eix = 3*eix;
pix_num_hor_lef_reg = [fiv_six; eix; thr_eix; qua; one_six; thr_eix];
pix_num_hor_rig_reg = abs(pix_num_hor_lef_reg - hal) + hal;
pix_num_hor_reg = [pix_num_hor_lef_reg; pix_num_hor_rig_reg] + 100; %%%%!!!!!!!!!!!!!!!!!!!!!!!
pix_num_ver_lef_reg = [n_pix_ver/16; 0.75*n_pix_ver; 0.5*n_pix_ver; 0.625*n_pix_ver; ...
    0.375*n_pix_ver; 0.250*n_pix_ver];
pix_num_ver_reg = [pix_num_ver_lef_reg; pix_num_ver_lef_reg] + 20; %%%%
mar_siz = 50;
max_abs_dif_epo = cellfun(@(x) max(abs(x), [], 'all'), dif_ske_epo_xre_sam);
max_abs_dif_acc_epo = cellfun(@(x) max(abs(x), [], 'all'), dif_acc_epo_xre_sam);
labels = {'Ha' 'Dl' 'Dm' 'Dc' 'Dd' 'Dmp' 'Ha' 'Dl' 'Dm' 'Dc' 'Dd' 'Dmp'};
[x, y] = ext_coo(fil_pat_for);
ind_epo = 0;
for k = [1 2 4 6]
    ind_epo = ind_epo + 1;
    for ind_col = 1:n_col
        j = (ind_epo - 1)*n_col + ind_col;
        scatter(hax_sub(j), pix_num_hor_reg, pix_num_ver_reg, 'Marker', 'o', ...
            'MarkerEdgeColor', gre, 'MarkerFaceColor', gre, 'SizeData', mar_siz);
        for i = 1:n_cro_tot
            hold(hax_sub(j), 'on')
            if ind_col == 1
                reg_one = reg_cro_ind(i, 1);
                reg_two = reg_cro_ind(i, 2);
                plo_xre(hax_sub(j), dif_ske_epo_xre_sam{k}(i), pix_num_hor_reg, pix_num_ver_reg, ...
                    reg_one, reg_two, max_abs_dif_epo(k))
                hax_sub(j).Visible = 'off';
                h = ylabel(hax_sub(j), nam_epo(k));
                h.Visible = 'on';
                h.Position(1) = 0;
                if k == 1
                    h = title(hax_sub(j), 'Skewness', 'FontWeight','normal');
                    h.Visible = 'on';
                end
            elseif ind_col == 2
                reg_one = reg_cro_ind(i, 1);
                reg_two = reg_cro_ind(i, 2);
                plo_xre(hax_sub(j), dif_acc_epo_xre_sam{k}(i), pix_num_hor_reg, pix_num_ver_reg, ...
                    reg_one, reg_two, max_abs_dif_acc_epo(k))
                hax_sub(j).Visible = 'off';
                if k == 1
                    h = title(hax_sub(j), '|Pairwise corr|', 'FontWeight','normal');
                    h.Visible = 'on';
                end
            end
        end
        hax_sub(j).Children = circshift(hax_sub(j).Children, 1);
        axes(hax_sub(j))
        labelpoints(pix_num_hor_reg, pix_num_ver_reg, labels, 'FontSize', fon_siz);
        scatter(hax_sub(j), x, y, 10, 'k', 'filled')
        hax_sub(j).XLim(2) = max(x);
        hax_sub(j).YLim(2) = max(y);
    end
end
h_fig = opt_h_fig(h_fig, las_pix, rat_wid);
end

function [h_fig, n_sig] = plo_dia_acc(dif_acc_epo_xre_sam, p_acc_epo_xre_xsa, epo_num)
con_fil = matfile('\\home.ansatt.ntnu.no\kadiram\Documents\MATLAB\con_esp.mat');
n_row = con_fil.n_row;
%n_col = con_fil.n_col;
n_row.fig = 1;
n_col.fig = 1;

% gap_ver_row = 0.010*ones(1, n_row.fig);
% gap_hor_ave = 0.015;
% gap_hor_col = gap_hor_ave*ones(1, n_col.fig);
% gap_hor_row_col = repmat(gap_hor_col, n_row.fig, 1);
% mar_bot = 0.000;
% mar_top = 0.000;
% mar_lef = 0.000;
% mar_rig = 0.000;

gap_ver_row = 0.000*ones(1, n_row.fig);
gap_hor_ave = 0.000;
gap_hor_col = gap_hor_ave*ones(1, n_col.fig);
gap_hor_row_col = repmat(gap_hor_col, n_row.fig, 1);
mar_bot = 0.005;
hei = 3;
mar_top = cal_mar_top(hei);
mar_lef = 0.005;
mar_rig = 0.000;

global gre n_cro_tot reg_cro_ind fil_pat_for
n_row.cal = 1080;
n_col.cal = 789;
asp_rat_cax = n_col.cal/n_row.cal;
asp_rat_axe = asp_rat_cax*ones(1, n_row.fig*n_col.fig);
[h_fig, wid_mon, hei_mon] = fig;
wid = false;
sca_axe = ones(1, n_row.fig*n_col.fig);
n_pix_ext = 7;
[hax_sub, pos_axe, axh, dis_asp_rat, las_pix, rat_wid] = tight_subplot_gen(n_row.fig, n_col.fig, ...
    gap_ver_row, gap_hor_row_col, ...
    mar_bot, mar_top, mar_lef, mar_rig, asp_rat_axe, wid_mon, hei_mon, wid, sca_axe, n_pix_ext);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
one_six = n_col.cal/16;%Dd
eix = n_col.cal/8;
qua = n_col.cal/4;
hal = n_col.cal/2;
fiv_six = (5/16)*n_col.cal;
thr_eix = 3*eix;% dm, dmp
pix_num_hor_lef_reg = [fiv_six; eix; thr_eix; qua; one_six; thr_eix];
pix_num_hor_rig_reg = abs(pix_num_hor_lef_reg - hal) + hal;
pix_num_hor_reg = [pix_num_hor_lef_reg; pix_num_hor_rig_reg] + 7; %%%%!!!!!!!!!!!!!!!!!!!!!!!

adj = 0;
pix_num_hor_reg(5) = pix_num_hor_reg(5) - adj;
pix_num_hor_reg(11) = pix_num_hor_reg(11) + adj;

pix_num_ver_lef_reg = [n_row.cal/16; 0.75*n_row.cal; 0.5*n_row.cal; 0.625*n_row.cal; ...
    0.375*n_row.cal; 0.250*n_row.cal];
pix_num_ver_reg = [pix_num_ver_lef_reg; pix_num_ver_lef_reg] + 70; %%%%
mar_siz = 50;
max_abs_dif_acc_epo = cellfun(@(x) max(abs(x), [], 'all'), dif_acc_epo_xre_sam);
labels = {'Ha' 'Dl' 'Dm' 'Dc' 'Dd' 'Dmp' 'Ha' 'Dl' 'Dm' 'Dc' 'Dd' 'Dmp'};
[x, y] = ext_coo(fil_pat_for);
ind_epo = 0;
fon_siz = con_fil.fon_siz;
n_sig = 0;
n_inc = 0;
n_dec = 0;
for k = epo_num
    ind_epo = ind_epo + 1;
    for ind_col = 1:n_col.fig
        j = (ind_epo - 1)*n_col.fig + ind_col;
        scatter(hax_sub(j), pix_num_hor_reg, pix_num_ver_reg, 'Marker', 'o', ...
            'MarkerEdgeColor', gre, 'MarkerFaceColor', gre, 'SizeData', mar_siz);

%         hold(hax_sub(j), "on")
%         scatter(hax_sub(j), x, y, 10, 'k', 'filled')
%         hax_sub(j).XLim(2) = max(x);
%         hax_sub(j).YLim(2) = max(y);

        for i = 1:n_cro_tot
            hold(hax_sub(j), 'on')
            dif = dif_acc_epo_xre_sam{k}(i);
            reg_one = reg_cro_ind(i, 1);
            reg_two = reg_cro_ind(i, 2);
            if p_acc_epo_xre_xsa{k, i}.lme <= con_fil.sig_lev
                n_sig = n_sig + 1;
            else
                if dif > 0
                    col = "#FF7F7F";
                    n_inc = n_inc + 1;
                else
                    col = "#ADD8E6";
                    n_dec = n_dec + 1;
                end
                plo_xre(hax_sub(j), dif, pix_num_hor_reg, pix_num_ver_reg, ...
                    reg_one, reg_two, max_abs_dif_acc_epo(k), col)
            end
            hax_sub(j).Visible = 'off';
        end

        for i = 1:n_cro_tot
            hold(hax_sub(j), 'on')
            dif = dif_acc_epo_xre_sam{k}(i);
            reg_one = reg_cro_ind(i, 1);
            reg_two = reg_cro_ind(i, 2);
            if p_acc_epo_xre_xsa{k, i}.lme <= con_fil.sig_lev
                if dif > 0
                    col = "#8B0000";
                else
                    col = "#00008B";
                end
                plo_xre(hax_sub(j), dif, pix_num_hor_reg, pix_num_ver_reg, ...
                    reg_one, reg_two, max_abs_dif_acc_epo(k), col)
            else
            end
            hax_sub(j).Visible = 'off';
        end

        hax_sub(j).Children = circshift(hax_sub(j).Children, 1);
        axes(hax_sub(j))
        %labelpoints(pix_num_hor_reg, pix_num_ver_reg, labels, 'FontSize', fon_siz.pre);
    end
end
%mar_siz_con = con_fil.mar_siz;
%mar_siz = mar_siz_con.pub;
mar_siz = 4;
log_lin_wid = false;
hax_sub(j) = adj_hax(hax_sub(j), fon_siz.pub, mar_siz, log_lin_wid);
h_fig = opt_h_fig(h_fig, las_pix, rat_wid);
end

function plo_xre(hax, dif, pix_num_hor_reg, pix_num_ver_reg, reg_one, reg_two, max_abs_dif, col)
con_fil = matfile('\\home.ansatt.ntnu.no\kadiram\Documents\MATLAB\con_esp.mat');
lin_wid = con_fil.lin_wid;
abs_dif = abs(dif);
%'Color', col, 'LineWidth', lin_wid.two + (abs_dif/max_abs_dif)*7)
%'Color', col, 'LineWidth', lin_wid.one + (abs_dif/max_abs_dif)*1)
plot(hax, ...
    [pix_num_hor_reg(reg_one); pix_num_hor_reg(reg_two)], ...
    [pix_num_ver_reg(reg_one); pix_num_ver_reg(reg_two)], ...
    'Color', col, 'LineWidth', (abs_dif/max_abs_dif)*lin_wid.thr)
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% neurobehav plotting
function h_fig = plo_neu_beh(tac_win_con_sam_ani, act_reg_win_con_sam_uni, ind_sam)
global ind_sub_reg nam_reg col_sam_con
con_fil = matfile('\\home.ansatt.ntnu.no\kadiram\Documents\MATLAB\con_esp.mat');
n_row = 1;
n_col = 6;

% gap_ver = 0.050;
% gap_ver_row = gap_ver*ones(n_row, 1);
% gap_hor_ave = 0.025;
% gap_hor_col = gap_hor_ave*ones(1, n_col);
% gap_hor_row_col = repmat(gap_hor_col, n_row, n_col);
% mar_bot = 0.085;
% mar_top = 0.070;
% mar_lef = 0.055;
% mar_rig = 0.005;

gap_ver = 0.015;
gap_ver_row = gap_ver*ones(n_row, 1);
gap_hor_ave = 0.005;
gap_hor_col = gap_hor_ave*ones(n_col, 1);
gap_hor_row_col = repmat(gap_hor_col, n_row, n_col);
mar_bot = 0.030;
%dis_asp_rat = con_fil.dis_asp_rat;
% hei = wid/dis_asp_rat;
% mar_top = cal_mar_top(hei);
mar_top = 0.100;
wid = 1.5*6 + 1;
mar_lef = cal_mar_lef(wid);
mar_rig = 0.005;

[h_fig, wid_mon, hei_mon] = fig;
asp_rat_bar = 1;
asp_rat_axe = [asp_rat_bar asp_rat_bar asp_rat_bar ...
asp_rat_bar asp_rat_bar asp_rat_bar];
wid = true;
sca_axe = ones(1, n_row*n_col);
n_pix_ext = 10;
[hax_sub, pos_axe, axh, dis_asp_rat, las_pix, rat_wid] = tight_subplot_gen(n_row, n_col, gap_ver_row...
    , gap_hor_row_col, mar_bot, mar_top, mar_lef, mar_rig, asp_rat_axe, wid_mon, hei_mon, wid, ...
    sca_axe, n_pix_ext);
linkaxes(hax_sub)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
y_min = inf;
y_max = -inf;
ind_win = 2;
ind_ite = 0;
fon_siz = con_fil.fon_siz;
y_lab_ori = con_fil.y_lab;
y_lab = y_lab_ori.dff;
x_lab = y_lab_ori.tac;
mar_siz = con_fil.mar_siz;
mar_siz = mar_siz.pub/2;
for i = ind_sub_reg
    ind_ite = ind_ite + 1;
    hax = hax_sub(ind_ite);
    plo_var_var_poo(hax, tac_win_con_sam_ani, act_reg_win_con_sam_uni{i}, ...
        ind_win, mar_siz, col_sam_con, ind_sam)
    [y_min, y_max, hax] = adj_y(hax, y_min, y_max);
    hax.FontSize = fon_siz.pre;
    if ind_ite == 1
        ylabel(hax, y_lab)
    else
        hax.YAxis.Visible = 'off';
    end
    title(hax, nam_reg(i), 'FontWeight', 'normal')
    xlabel(hax, x_lab)
    hax = adj_hax(hax, fon_siz.pub, mar_siz);
end
% hax = axes('Position', [0 0 1 1], 'visible', 'off');
% nor_x = 0.730;
% text(hax, nor_x, 0.90, ['y_i = \beta_0 + \beta_1\cdotx_i + ' char(949) '_i'])
% text(hax, nor_x, 0.85, ...
%     ['y_i = \beta_0 + \beta_1\cdota_i + \beta_2\cdotx_i + \beta_3\cdota_i\cdotx_i + ' ...
%     char(949) '_i'])
% hax = adj_hax(hax, fon_siz.pub);
end
%
function h_fig = plo_neu_beh_tri(tac_sam_tri_win, act_sam_reg_tri_win, x_lab, y_lab, ind_sam)
global ind_sub_reg nam_reg siz col_sam_con
con_fil = matfile('\\home.ansatt.ntnu.no\kadiram\Documents\MATLAB\con_esp.mat');
n_row = 2;
n_col = 3;
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
asp_rat_axe = [asp_rat_bar asp_rat_bar asp_rat_bar ...
asp_rat_bar asp_rat_bar asp_rat_bar];
[h_fig, wid_mon, hei_mon] = fig;
wid = false;
sca_axe = ones(1, n_row*n_col);
n_pix_ext = 10;
[hax_sub, pos_axe, axh, dis_asp_rat, las_pix, rat_wid] = tight_subplot_gen...
    (n_row, n_col, ...
    gap_ver_row, gap_hor_row_col, mar_bot, mar_top, mar_lef, mar_rig, asp_rat_axe, wid_mon, ...
    hei_mon, wid, sca_axe, n_pix_ext);
linkaxes(hax_sub)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
y_min = inf;
y_max = -inf;
ind_win = 2;
ind_ite = 0;
fon_siz = con_fil.fon_siz;
for i = ind_sub_reg
    ind_ite = ind_ite + 1;
    hax = hax_sub(ind_ite);
    plo_var_var_tri(hax, tac_sam_tri_win, act_sam_reg_tri_win(:, i), ind_win, siz, col_sam_con, ...
        ind_sam)
    [y_min, y_max, hax] = adj_y(hax, y_min, y_max);
    hax.FontSize = fon_siz.pre;
    if ind_ite == 1 || ind_ite == 4
        ylabel(hax, y_lab)
    else
        yticklabels(hax, [])
    end
    title(hax, nam_reg(i), 'FontWeight', 'normal')
    if ind_ite < 4
        xticklabels(hax, [])
    else
        xlabel(hax, x_lab)
    end
end
hax = axes('Position', [0 0 1 1], 'visible', 'off');
nor_x = 0.750;
text(hax, nor_x, 0.90, ['y_i = \beta_0 + \beta_1\cdotx_i + ' char(949) '_i'])
text(hax, nor_x, 0.85, ...
    ['y_i = \beta_0 + \beta_1\cdota_i + \beta_2\cdotx_i + \beta_3\cdota_i\cdotx_i + ' ...
    char(949) '_i'])
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% general plotting
function [tex_sam, hax] = wri_sam_rat_dou(tit_n_sam, gap_ver_row, mar_top, axh, gap_hor_col, ...
    pos_axe, num, lef_bia)
n_sam = length(tit_n_sam);
tex_sam = cell(n_sam, 1);
hax = axes('Units', 'Normal', 'Position', [0 0 1 1],'Visible', 'off', 'tag', 'suplabel');
x_loc = pos_axe{num}(1) - gap_hor_col(num - 1)/2;
axh = axh(1);
gap_ver = gap_ver_row(1);
for i = 1:n_sam
    y_loc = 1 - mar_top - (i - 1)*2*(axh + gap_ver) + gap_ver/2; % !!!!!!!!!!!!!!!!!!!
    tex_sam{i} = text(hax, x_loc - lef_bia, y_loc, tit_n_sam{i}, ...
        'Units', 'normalized', 'HorizontalAlignment', ... % n_ani_sam{i} !!!!!!!!!!
        'center');
end
end

function tit_n_cel_sam = gen_tit(obj, dff_ave_sam_con_cel_win, tit_non_sam, sho)
tit_n_cel_sam = strings(obj.n_sam, 1);
for i = 1:obj.n_sam
    [n_cel, ~] = size(dff_ave_sam_con_cel_win{i, 1}); %%%%%%%%%%% for stable!!!
    if sho
        tit_n_cel_sam(i) = strcat(obj.(tit_non_sam)(i), sprintf(' %d', n_cel), ...
            " cells");
    else
        tit_n_cel_sam(i) = strcat(obj.(tit_non_sam)(i), sprintf(' %d', n_cel), ...
            " cells from", sprintf(' %d', obj.n_ani_bri_sam(i)), " animals");
    end
end
end% just text

function [min_par, max_par] = ext_min_max(bea_lat_sam_ani_tri)
n_sam = length(bea_lat_sam_ani_tri);
bea_lat_ani_tri = [];
for i = 1:n_sam
    bea_lat_ani_tri = [bea_lat_ani_tri; bea_lat_sam_ani_tri{i}];
end
global mil
min_par = min(bea_lat_ani_tri, [], 'all')/mil;
max_par = max(bea_lat_ani_tri, [], 'all')/mil;
end

function [ind_low_plo, ind_upp_plo, ind_dia_plo] = ext_ind(ord)
n_ind = (ord^2 - ord)/2;
ind_low_plo = nan(n_ind, 1);
ind_dia_plo = nan(ord, 1);
for i = 1:ord
    if i > 1
        ind_low_plo(sum(1:i - 2) + 1:sum(1:i - 1)) = (i - 1)*ord + 1:(i - 1)*ord + i - 1;
    end
    ind_dia_plo(i) = (i - 1)*ord + i;
end
ind_upp_plo = setdiff(1:ord^2, [ind_low_plo; ind_dia_plo]')';
end

function asp_rat_map = com_asp_rat_map(log_sam_ani)
n_sam = length(log_sam_ani);
asp_rat_map_sam = nan(n_sam, 1);
global n_tri
for i = 1:n_sam
    n_ani = sum(log_sam_ani{i});
    asp_rat_map_sam(i) = n_tri/n_ani;
end
asp_rat_map = mean(asp_rat_map_sam);
end

function hax = wri_sam_siz(n_ani_bri_sam, n_cel_reg_sam, nor_x, ind_sam, tit_sam, nor_y)
n_sam = length(n_ani_bri_sam);
global n_reg_for_cro
if isnan(n_cel_reg_sam)
    n_reg = 0;
else
    n_reg = n_reg_for_cro;
    n_cel_reg_sam = n_cel_reg_sam(:, ind_sam);
end
n_lin = n_sam + n_reg + n_sam*n_reg + 1;
tex_dis = cell(n_lin, 1);
nam_sam = tit_sam(ind_sam);
n_ani_bri_sam = n_ani_bri_sam(ind_sam);
global ind_sub_reg
global nam_reg
for i = 1:n_lin
    if i <= n_sam
        tex_dis{i} = strcat(nam_sam(i), " n = ", num2str(n_ani_bri_sam(i)), " animals");
    elseif i == n_sam + 1
        tex_dis{i} = "";
    else
        ind = i - 1;
        loc = mod(ind - n_sam, n_sam + 1);
        reg_ind = ceil((ind - n_sam)/(n_sam + 1));
        reg_num = ind_sub_reg(reg_ind);
        if loc == 1
            tex_dis{i} = strcat(nam_reg(reg_num), ": ");
        else
            if loc == n_sam - 1 || loc == n_sam
                sam_num = loc - 1;
            else
                sam_num = n_sam;
            end
            tex_dis{i} = strcat(nam_sam(sam_num), " n = ", ...
                num2str(n_cel_reg_sam(reg_num, sam_num)), " cells");
        end
    end
end
hax = axes('Units', 'Normal', 'Position', [0 0 1 1],'Visible', 'off', 'tag', 'suplabel');
text(hax, nor_x, nor_y, tex_dis, 'Units', 'normalized')
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% gen
function cel = mul_kil_cel(cel)
cel = cellfun(@mul_kil_vec, cel, 'UniformOutput', false);
end

function vec = mul_kil_vec(vec)
global kil
vec = vec*kil;
end

function ske_xre_sam_ani = ext_ske_xre_sam_ani(ske_epo_xre_sam_ani, epo_ind)
global n_cro_tot
n_sam = length(ske_epo_xre_sam_ani{1, 1});
ske_xre_sam_ani = cell(n_cro_tot, n_sam);
for i = 1:n_cro_tot
    for j = 1:n_sam
        ske_xre_sam_ani{i, j} = ske_epo_xre_sam_ani{epo_ind, i}{j};
    end
end
end

function pcc_blo_ani = fix_out(pcc_blo_ani)
log_blo_ani = ~isnan(pcc_blo_ani);
log_blo = sum(log_blo_ani, 2) == 1;
pcc_blo_ani(log_blo, :) = nan;
%
% log_blo_ani = ~isnan(pcc_blo_ani);
% log_blo = sum(log_blo_ani, 2) > 0;
% cri_ind_sta = find(log_blo, 1);
% nan_ind_num = find(sum(log_blo_ani, 2) == 0);
% log_num = nan_ind_num > cri_ind_sta;
% ind_num = nan_ind_num(log_num);
% cri_ind = ind_num(1);
% pcc_blo_ani(cri_ind:end, :) = nan;
end

function p_epo_reg_fac = cal_p_epo_reg_fac(cor_coe_epo_reg_sam_blo_ani)
global n_sam n_reg_for dis_blo n_blo ind_sub_reg
n_ani_sam = nan(n_sam, 1);
for i = 1:n_sam
    n_ani_sam(i) = size(cor_coe_epo_reg_sam_blo_ani{1, 1}{i}, 2);
end
abl_blo_ani = [zeros(n_blo.wre, n_ani_sam(1)) ones(n_blo.wre, n_ani_sam(2))];
fac_num = {repmat(dis_blo.wre, sum(n_ani_sam), 1); abl_blo_ani(:)};
n_epo = size(cor_coe_epo_reg_sam_blo_ani, 1);
p_epo_reg_fac = cell(n_epo, n_reg_for);
for i = 1:n_epo
    for j = 1:n_reg_for
        if ismember(j, ind_sub_reg)
            cor_coe_blo_ani = [cor_coe_epo_reg_sam_blo_ani{i, j}{1} ...
                cor_coe_epo_reg_sam_blo_ani{i, j}{2}];
            p_epo_reg_fac{i, j} = anovan(cor_coe_blo_ani(:), fac_num);
        end
    end
end
end

function p_epo_fac = cal_p_epo_fac(xcc_epo_sam_blo_ani)
global n_sam dis_blo n_blo
n_ani_sam = nan(n_sam, 1);
for i = 1:n_sam
    n_ani_sam(i) = size(xcc_epo_sam_blo_ani{1, 1}{i}, 2);
end
abl_blo_ani = [zeros(n_blo.xre, n_ani_sam(1)) ones(n_blo.xre, n_ani_sam(2))];
fac_num = {repmat(dis_blo.xre, sum(n_ani_sam), 1); abl_blo_ani(:)};
n_epo = size(xcc_epo_sam_blo_ani, 1);
p_epo_fac = cell(n_epo, 1);
for i = 1:n_epo
    cor_coe_blo_ani = [xcc_epo_sam_blo_ani{i, 1}{1} xcc_epo_sam_blo_ani{i, 1}{2}];
    p_epo_fac{i, 1} = anovan(cor_coe_blo_ani(:), fac_num);
end
end

function p_fac = cal_p_fac(xcc_sam_blo_ani)
global n_sam dis_blo n_blo
n_ani_sam = nan(n_sam.one, 1);
for i = 1:n_sam.one
    n_ani_sam(i) = size(xcc_sam_blo_ani{i}, 2);
end
abl_blo_ani = [zeros(n_blo.xre, n_ani_sam(1)) ones(n_blo.xre, n_ani_sam(2))];
fac_num = {repmat(dis_blo.xre, sum(n_ani_sam), 1); abl_blo_ani(:)};
cor_coe_blo_ani = [xcc_sam_blo_ani{1} xcc_sam_blo_ani{2}];
p_fac = anovan(cor_coe_blo_ani(:), fac_num);
end
