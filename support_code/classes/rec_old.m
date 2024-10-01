classdef rec_old
    properties
    end
    methods
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% neural
        function app_fra_tim_cal(obj)
            fra_tim_cal = ext_fra_tim_cal(obj.fil_pat_met_cal);
            save(obj.fil_pat_rec, 'fra_tim_cal', '-append')
        end
        function dis_tap_blo(obj)
            n_sti_tri = 1;
            load(obj.fil_pat_exp, 'tap_two_pho', 'n_sti_tri')
            sti_ons = tap_two_pho(1:n_sti_tri:end);
            disp(ceil(sti_ons/obj.blockLength))
        end % for tap experiments
        function dis_sti_blo(obj) % for development experiments
            load(obj.fil_pat_exp, 'sti_two_pho')
            disp(ceil(sti_two_pho/(obj.n_pla*obj.blockLength)))
        end
        function app_pix_dat(obj) % rob
            num_clust = 4;
            bas_end = 4*60;
            load(obj.fil_pat_exp, 'sta_tim')
            load(obj.fil_pat_rec, 'fra_rat_cal')
            bas_fra = fra_rat_cal*sta_tim + 1:fra_rat_cal*bas_end;
            [resized, averaged] = res_cal_ima(obj.fil_pat_ima_cal);
            %create mask
            size_mask = size(resized,1)*size(resized,2);
            var_mask = false(size_mask*size(resized,4),1);
            for plane = 1:size(averaged,3)
                %to_show = averaged(:,:,plane);
                orig = averaged(:,:,plane);
                orig = orig-min(orig(:));
                orig = orig/max(orig(:));
                to_show = repmat(orig,[1 1 3]);
                mask_total = false(size(averaged(:,:,1)));
                break_flag = 0;
                while true
                    imagesc(to_show);
                    h = imfreehand(gca);
                    wait(h);
                    s = 'add -> a; subtract -> s; quit -> q : ';
                    response = input(s,'s');
                    mask = createMask(h);
                    if response(1) == 'a'
                        mask_total = mask_total|mask;
                    elseif response(1) == 's'
                        mask_total(mask) = 0;
                    elseif response(1) == 'q'
                        break_flag = 1;
                        break
                    end
            
                    to_show = repmat(orig,[1 1 3]);
                    show_mask = false(size(mask_total,1),size(mask_total,2),3);
                    show_mask(:,:,1) = ~mask_total;
                    to_show(show_mask) = orig(show_mask)*1.5;
            
                    if (length(response)>1) && (response(2) == 'q')
                        break;
                    end
                end
        
                if break_flag
                    break;
                end
        
                var_mask(((plane-1)*size_mask+1):(plane*size_mask)) = reshape(imresize(mask_total,size(resized(:,:,1))),[size_mask 1]);
            end
            close
            % get_responses
            traces_raw_all = reshape(permute(resized,[1 2 4 3]),[size(resized,1)*size(resized,2)*size(resized,4) size(resized,3)]);
            traces_raw_all = traces_raw_all(var_mask, :);
            length_traces = size(resized,3);
            num_planes = size(resized,4);
            num_traces = size(resized,1)*size(resized,2);
            traces_DFF = zeros(size(traces_raw_all));
            baseline = mean(traces_raw_all(:, bas_fra),2);
            baseline_f= repmat(baseline,1,size(traces_raw_all,2));
            traces_DFF= (traces_raw_all(:,:)-baseline_f)./baseline_f ;
            traces_DFF(isnan(traces_DFF)) = 0;
            % cluster
            size_resized = size(resized);
            if length(size_resized) == 3
                size_resized = [size_resized 1];
            end
            baseline_end = size(traces_DFF,2);
            % nonsense
        end
        function app_dff_bra_chu_pla_fra_cel(obj) % in case, in development
            n_chu_obj = obj.n_chu;
            load(obj.fil_pat_exp, 'n_tri', 'tap_two_pho', 'n_con', 'n_tri_con')
            %%%!!!!!!!!!
            sti_two_pho = tap_two_pho;
            %%%%%%%%%%%%
            load(obj.fil_pat_rec, 'frameStop')
            load(obj.fil_pat_met_cal, 'metadata')
            fra_rat_cal = 1/metadata.timeStep;
            bas_dur_neu_fra = round(fra_rat_cal*obj.bas_dur_neu);
            sti_ons_fra_tri = round(sti_two_pho/obj.n_pla);
            len_res_plo_fra = round(fra_rat_cal*obj.len_res_plo);
            %
            cel_lab_hab_chu_pla_row_col = cell(obj.n_chu, obj.n_pla);
            cel_lab_tel_chu_pla_row_col = cell(obj.n_chu, obj.n_pla);
            dff_hab_chu_fra_cel = cell(n_chu_obj, 1);
            log_sid_hab_chu_cel = cell(n_chu_obj, 1);
            dff_tel_chu_fra_cel = cell(n_chu_obj, 1);
            log_sid_tel_chu_cel = cell(n_chu_obj, 1);
            for i = 1:n_chu_obj
                if i == 1
                    n_fra_bef = 0;
                else
                    n_fra_bef = frameStop(i - 1);
                end
                n_fra_aft = frameStop(end) - frameStop(i);
                for j = 1:obj.n_pla
                    load(obj.fil_pat_roi_t_hab_chu_pla{i, j}, 'roi_t')
                    roi_t_hab = roi_t;
                    load(obj.fil_pat_roi_t_tel_chu{i}, 'roi_t') %%%%%%%!!!!!!!!!!!!
                    roi_t_tel = roi_t;
                    [f_hab_fra_cel_i_j_tra, f_tel_fra_cel_i_j_tra, cel_lab_hab_i_j, cel_lab_tel_i_j] = rem_cla_cel(roi_t_hab, roi_t_tel);
                    cel_lab_hab_chu_pla_row_col{i, j} = cel_lab_hab_i_j;
                    cel_lab_tel_chu_pla_row_col{i, j} = cel_lab_tel_i_j;
                    %
                    log_sid_hab_chu_cel{i} = [log_sid_hab_chu_cel{i} ext_log_sid_cel(cel_lab_hab_i_j)];
                    log_sid_tel_chu_cel{i} = [log_sid_tel_chu_cel{i} ext_log_sid_cel(cel_lab_tel_i_j)];
                    %
                    [dff_hab_fra_cel_i_j, tri_lim_fra_tri_lim] = ext_dff_fra_cel_i_j...
                        (f_hab_fra_cel_i_j_tra, n_fra_bef, n_fra_aft, ...
    frameStop, n_tri, sti_ons_fra_tri, i, bas_dur_neu_fra, len_res_plo_fra);
                    dff_hab_chu_fra_cel{i} = [dff_hab_chu_fra_cel{i} dff_hab_fra_cel_i_j]; % cell signals in all planes are concatenated!
                    %
                    dff_tel_fra_cel_i_j = ext_dff_fra_cel_i_j...
                        (f_tel_fra_cel_i_j_tra, n_fra_bef, n_fra_aft, ...
    frameStop, n_tri, sti_ons_fra_tri, i, bas_dur_neu_fra, len_res_plo_fra);
                    dff_tel_chu_fra_cel{i} = [dff_tel_chu_fra_cel{i} dff_tel_fra_cel_i_j];
                end
            end
            fra_tim_cal = ext_fra_tim_cal_dff(obj.fil_pat_met_cal, dff_hab_chu_fra_cel{1}(:, 1));
            %
            del_dff_hab_chu_tri_cel = cell(n_chu_obj, 1);
            del_dff_tel_chu_tri_cel = cell(n_chu_obj, 1);
            for i = 1:n_chu_obj
                del_dff_hab_chu_tri_cel{i} = com_del_ave_sig_tri_cel(dff_hab_chu_fra_cel{i}, sti_ons_fra_tri, obj.bas_dur_neu, obj.res_dur_neu, fra_rat_cal, n_tri);
                del_dff_tel_chu_tri_cel{i} = com_del_ave_sig_tri_cel(dff_tel_chu_fra_cel{i}, sti_ons_fra_tri, obj.bas_dur_neu, obj.res_dur_neu, fra_rat_cal, n_tri);
            end
            %
            [~, ~, fra_rat_cal, ~, ifi] = ext_cal_ima_dat(metadata);
            tim_tri_fra = (-obj.len_bas_plo:ifi:obj.len_res_plo)';
            
            
            
            [cel_map_dat_tri, cel_map_dat_con, del_dff_sum_chu_tri_cel] = ext_cel_map_dat...
                (fra_tim_cal, dff_sum_hab_chu_fra_cel, dff_sum_tel_chu_fra_cel, ...
                cel_lab_hab_row_col_chu, cel_lab_tel_row_col_chu, obj.bas_dur_neu, ...
                obj.res_dur_neu, n_con, n_tri_con, sti_ons_fra_tri, frameStop, sti_ons);
            
            
            %%%%%%%%%%%%%%%%
            n_fra = ceil(fra_rat_cal*obj.len_ave_plo);
            dff_hab_con_fra_cel = cell(n_con, 1);
            dff_tel_con_fra_cel = cell(n_con, 1);
            for i = 1:n_con
                if obj.sta_con(i)
                    chu_num = com_chu_num_con(i, sti_ons_fra_tri, frameStop, n_tri_con);
                    del_dff_tri_cel = del_dff_hab_chu_tri_cel{chu_num};
                    del_dff_tri_cel_i = del_dff_tri_cel((i - 1)*n_tri_con + 1:i*n_tri_con, :); 
                    n_cel_i = size(del_dff_tri_cel_i, 2);
                    dff_fra_tri_cel_i = nan(n_fra, n_tri_con, n_cel_i);
                    sti_two_pho_con = sti_ons_fra_tri((i - 1)*n_tri_con + 1:i*n_tri_con);
                    for j = 1:n_tri_con
                        tri_ons_fra_j = sti_two_pho_con(j) - round(fra_rat_cal*obj.len_bas_plo);
                        tri_off_fra_j = sti_two_pho_con(j) + round(fra_rat_cal*obj.len_res_plo);
                        if tri_off_fra_j - tri_ons_fra_j == n_fra
                            tri_ons_fra_j = tri_ons_fra_j + 1;
                        end
                        dff_fra_tri_cel_i(:, j, :) = dff_hab_chu_fra_cel{chu_num}(tri_ons_fra_j:tri_off_fra_j, :);
                    end
                    dff_hab_con_fra_cel{i} = reshape(com_sta(dff_fra_tri_cel_i, 2), [n_fra, n_cel_i]);
                    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
                    del_dff_tri_cel = del_dff_tel_chu_tri_cel{chu_num};
                    del_dff_tri_cel_i = del_dff_tri_cel((i - 1)*n_tri_con + 1:i*n_tri_con, :); 
                    n_cel_i = size(del_dff_tri_cel_i, 2);
                    dff_fra_tri_cel_i = nan(n_fra, n_tri_con, n_cel_i);
                    sti_two_pho_con = sti_ons_fra_tri((i - 1)*n_tri_con + 1:i*n_tri_con);
                    for j = 1:n_tri_con
                        tri_ons_fra_j = sti_two_pho_con(j) - round(fra_rat_cal*obj.len_bas_plo);
                        tri_off_fra_j = sti_two_pho_con(j) + round(fra_rat_cal*obj.len_res_plo);
                        if tri_off_fra_j - tri_ons_fra_j == n_fra
                            tri_ons_fra_j = tri_ons_fra_j + 1;
                        end
                        dff_fra_tri_cel_i(:, j, :) = dff_tel_chu_fra_cel{chu_num}(tri_ons_fra_j:tri_off_fra_j, :);
                    end
                    dff_tel_con_fra_cel{i} = reshape(com_sta(dff_fra_tri_cel_i, 2), [n_fra, n_cel_i]);
                end
            end
            %
            save(obj.fil_pat_rec, 'fra_rat_cal', 'sti_ons_fra_tri', 'tri_lim_fra_tri_lim', 'log_sid_hab_chu_cel', ...
                'fra_tim_cal', 'dff_hab_chu_fra_cel', 'tim_tri_fra', 'del_dff_hab_chu_tri_cel', 'dff_hab_con_fra_cel', '-append') % dff_con_fra_cel - trial average!
            save(obj.fil_pat_rec, 'log_sid_tel_chu_cel', 'dff_tel_chu_fra_cel', 'del_dff_tel_chu_tri_cel', 'dff_tel_con_fra_cel', '-append')
        end
        function app_dff_hab_int_fra_cel(obj)
            load(obj.fil_pat_exp, 'n_tri_con')
            dff_hab_int_fra_cel = cell(obj.n_int, 1);
            load(obj.fil_pat_rec, 'fra_int_lim', 'frameStop', 'sti_ons_fra_tri', 'tri_lim_fra_tri_lim')
            for i = 1:obj.n_int
                if obj.log_int(i)
                    for j = 1:obj.n_pla
                        load(obj.fil_pat_roi_t_hab_int_pla{i, j}, 'roi_t')
                        f_fra_cel_i_j_tra = roi_t.traces';
                        n_cel_i_j = size(f_fra_cel_i_j_tra, 2);
                        f_fra_cel_i_j = [nan(fra_int_lim(i, 1) - 1, n_cel_i_j); f_fra_cel_i_j_tra; nan(frameStop(end) - fra_int_lim(i, 2), n_cel_i_j)];
                        dff_fra_cel_i_j = nan(frameStop(end), n_cel_i_j);
                        for k = 1:n_tri_con
                            tri_k = obj.tri_num_tri_int(k, i);
                            % compute F0
                            sti_ons_fra_k = sti_ons_fra_tri(tri_k);
                            tri_ons_fra_k = tri_lim_fra_tri_lim(tri_k, 1);
                            f_bas_fra_cel_k = f_fra_cel_i_j(tri_ons_fra_k:sti_ons_fra_k, :);
                            f_bas_cel_k = mean(f_bas_fra_cel_k);
                            % compute DFF
                            dff_fra_cel_k = ((f_fra_cel_i_j - f_bas_cel_k)./f_bas_cel_k)*100;
                            tri_off_fra_k = tri_lim_fra_tri_lim(tri_k, 2);
                            ind_k = tri_ons_fra_k:tri_off_fra_k;
                            dff_fra_cel_i_j(ind_k, :) = dff_fra_cel_k(ind_k, :);
                        end
                        dff_hab_int_fra_cel{i} = [dff_hab_int_fra_cel{i} dff_fra_cel_i_j];
                    end
                end
            end
            save(obj.fil_pat_rec, 'dff_hab_int_fra_cel', '-append')
        end
        function app_dff_hab_chu_fra_cel(obj)
            n_chu_obj = obj.n_chu;
            load(obj.fil_pat_exp, 'n_tri', 'tap_two_pho', 'n_con', 'n_tri_con')
            %%%!!!!!!!!!
            sti_two_pho = tap_two_pho;
            %%%%%%%%%%%%
            load(obj.fil_pat_rec, 'frameStop')
            load(obj.fil_pat_met_cal, 'metadata')
            fra_rat_cal = 1/metadata.timeStep;
            bas_dur_neu_fra = round(fra_rat_cal*obj.bas_dur_neu);
            sti_ons_fra_tri = round(sti_two_pho/obj.n_pla);
            len_res_plo_fra = round(fra_rat_cal*obj.len_res_plo);
            tri_lim_fra_tri_lim = nan(n_tri, 2);
            dff_hab_chu_fra_cel = cell(n_chu_obj, 1);
            log_sid_hab_chu_cel = cell(n_chu_obj, 1);
            for i = 1:n_chu_obj
                if i == 1
                    n_fra_bef = 0;
                else
                    n_fra_bef = frameStop(i - 1);
                end
                n_fra_aft = frameStop(end) - frameStop(i);
                for j = 1:obj.n_pla
                    load(obj.fil_pat_roi_t_hab_chu_pla{i, j}, 'roi_t')
                    f_fra_cel_i_j_tra = roi_t.traces';
                    n_cel_i_j = size(f_fra_cel_i_j_tra, 2);
                    f_fra_cel_i_j = [nan(n_fra_bef, n_cel_i_j); f_fra_cel_i_j_tra; nan(n_fra_aft, n_cel_i_j)];
                    dff_fra_cel_i_j = nan(frameStop(end), n_cel_i_j);
                    for k = 1:n_tri
                        chu_num_k = com_chu_num_tri(k, sti_ons_fra_tri, frameStop);
                        if i == chu_num_k
                            % compute F0
                            sti_ons_fra_k = sti_ons_fra_tri(k);
                            tri_ons_fra_k = sti_ons_fra_k - bas_dur_neu_fra;
                            tri_lim_fra_tri_lim(k, 1) = tri_ons_fra_k;
                            f_bas_fra_cel_k = f_fra_cel_i_j(tri_ons_fra_k:sti_ons_fra_k, :);
                            f_bas_cel_k = mean(f_bas_fra_cel_k);
                            % compute DFF
                            dff_fra_cel_k = ((f_fra_cel_i_j - f_bas_cel_k)./f_bas_cel_k)*100;
                            tri_off_fra_k = sti_ons_fra_k + len_res_plo_fra;
                            tri_lim_fra_tri_lim(k, 2) = tri_off_fra_k;
                            ind_k = tri_ons_fra_k:tri_off_fra_k;
                            dff_fra_cel_i_j(ind_k, :) = dff_fra_cel_k(ind_k, :);
                        end
                    end
                    dff_hab_chu_fra_cel{i} = [dff_hab_chu_fra_cel{i} dff_fra_cel_i_j];
                    log_sid_i_j_cel = ext_log_sid_cel(roi_t);
                    log_sid_hab_chu_cel{i} = [log_sid_hab_chu_cel{i} log_sid_i_j_cel];
                end
            end
            fra_tim_cal = ext_fra_tim_cal_dff(obj.fil_pat_met_cal, dff_hab_chu_fra_cel{1}(:, 1));
            %
            del_dff_hab_chu_tri_cel = cell(n_chu_obj, 1);
            for i = 1:n_chu_obj
                del_dff_hab_chu_tri_cel{i} = com_del_ave_sig_tri_cel(dff_hab_chu_fra_cel{i}, sti_ons_fra_tri, obj.bas_dur_neu, obj.res_dur_neu, fra_rat_cal, n_tri);
            end
            %
            [~, ~, fra_rat_cal, ~, ifi] = ext_cal_ima_dat(metadata);
            tim_tri_fra = (-obj.len_bas_plo:ifi:obj.len_res_plo)';
            %
            n_fra = ceil(fra_rat_cal*obj.len_ave_plo);
            dff_hab_con_fra_cel = cell(n_con, 1);
            for i = 1:n_con
                if obj.sta_con(i)
                    chu_num = com_chu_num_con(i, sti_ons_fra_tri, frameStop, n_tri_con);
                    del_dff_tri_cel = del_dff_hab_chu_tri_cel{chu_num};
                    del_dff_tri_cel_i = del_dff_tri_cel((i - 1)*n_tri_con + 1:i*n_tri_con, :); 
                    n_cel_i = size(del_dff_tri_cel_i, 2);
                    dff_fra_tri_cel_i = nan(n_fra, n_tri_con, n_cel_i);
                    sti_two_pho_con = sti_ons_fra_tri((i - 1)*n_tri_con + 1:i*n_tri_con);
                    for j = 1:n_tri_con
                        tri_ons_fra_j = sti_two_pho_con(j) - round(fra_rat_cal*obj.len_bas_plo);
                        tri_off_fra_j = sti_two_pho_con(j) + round(fra_rat_cal*obj.len_res_plo);
                        if tri_off_fra_j - tri_ons_fra_j == n_fra
                            tri_ons_fra_j = tri_ons_fra_j + 1;
                        end
                        dff_fra_tri_cel_i(:, j, :) = dff_hab_chu_fra_cel{chu_num}(tri_ons_fra_j:tri_off_fra_j, :);
                    end
                    dff_hab_con_fra_cel{i} = reshape(com_sta(dff_fra_tri_cel_i, 2), [n_fra, n_cel_i]);
                end
            end
            %
            save(obj.fil_pat_rec, 'fra_rat_cal', 'sti_ons_fra_tri', 'tri_lim_fra_tri_lim', 'log_sid_hab_chu_cel', ...
                'fra_tim_cal', 'dff_hab_chu_fra_cel', 'tim_tri_fra', 'del_dff_hab_chu_tri_cel', 'dff_hab_con_fra_cel', '-append') % dff_con_fra_cel - trial average!
        end
        function app_dff_tel_chu_fra_cel(obj)
            n_chu_obj = obj.n_chu;
            load(obj.fil_pat_exp, 'n_tri', 'tap_two_pho', 'n_con', 'n_tri_con')
            %%%!!!!!!!!!
            sti_two_pho = tap_two_pho;
            %%%%%%%%%%%%
            load(obj.fil_pat_rec, 'frameStop')
            load(obj.fil_pat_met_cal, 'metadata')
            fra_rat_cal = 1/metadata.timeStep;
            bas_dur_neu_fra = round(fra_rat_cal*obj.bas_dur_neu);
            sti_ons_fra_tri = round(sti_two_pho/obj.n_pla);
            len_res_plo_fra = round(fra_rat_cal*obj.len_res_plo);
            tri_lim_fra_tri_lim = nan(n_tri, 2);
            dff_tel_chu_fra_cel = cell(n_chu_obj, 1);
            log_sid_tel_chu_cel = cell(n_chu_obj, 1);
            for i = 1:n_chu_obj
                if i == 1
                    n_fra_bef = 0;
                else
                    n_fra_bef = frameStop(i - 1);
                end
                n_fra_aft = frameStop(end) - frameStop(i);
                
                %for j = 1:obj.n_pla
                    load(obj.fil_pat_roi_t_tel_chu{i}, 'roi_t')
                    f_fra_cel_i_j_tra = roi_t.traces';
                    n_cel_i_j = size(f_fra_cel_i_j_tra, 2);
                    f_fra_cel_i_j = [nan(n_fra_bef, n_cel_i_j); f_fra_cel_i_j_tra; nan(n_fra_aft, n_cel_i_j)];
                    dff_fra_cel_i_j = nan(frameStop(end), n_cel_i_j);
                    for k = 1:n_tri
                        chu_num = com_chu_num_tri(k, sti_ons_fra_tri, frameStop);
                        if i == chu_num
                            % compute F0
                            sti_ons_fra_k = sti_ons_fra_tri(k);
                            tri_ons_fra_k = sti_ons_fra_k - bas_dur_neu_fra;
                            tri_lim_fra_tri_lim(k, 1) = tri_ons_fra_k;
                            f_bas_fra_cel_k = f_fra_cel_i_j(tri_ons_fra_k:sti_ons_fra_k, :);
                            f_bas_cel_k = mean(f_bas_fra_cel_k);
                            % compute DFF
                            dff_fra_cel_k = ((f_fra_cel_i_j - f_bas_cel_k)./f_bas_cel_k)*100;
                            tri_off_fra_k = sti_ons_fra_k + len_res_plo_fra;
                            tri_lim_fra_tri_lim(k, 2) = tri_off_fra_k;
                            ind_k = tri_ons_fra_k:tri_off_fra_k;
                            dff_fra_cel_i_j(ind_k, :) = dff_fra_cel_k(ind_k, :);
                        end
                    end
                    dff_tel_chu_fra_cel{i} = [dff_tel_chu_fra_cel{i} dff_fra_cel_i_j];
                    log_sid_i_j_cel = ext_log_sid_cel(roi_t);
                    log_sid_tel_chu_cel{i} = [log_sid_tel_chu_cel{i} log_sid_i_j_cel];
                %end
                
            end
            del_dff_tel_chu_tri_cel = cell(n_chu_obj, 1);
            for i = 1:n_chu_obj
                del_dff_tel_chu_tri_cel{i} = com_del_ave_sig_tri_cel(dff_tel_chu_fra_cel{i}, sti_ons_fra_tri, obj.bas_dur_neu, obj.res_dur_neu, fra_rat_cal, n_tri);
            end
            %
            [~, ~, fra_rat_cal] = ext_cal_ima_dat(metadata);
            n_fra = ceil(fra_rat_cal*obj.len_ave_plo);
            dff_tel_con_fra_cel = cell(n_con, 1);
            for i = 1:n_con
                if obj.sta_con(i)
                    chu_num = com_chu_num_con(i, sti_ons_fra_tri, frameStop, n_tri_con);
                    del_dff_tri_cel = del_dff_tel_chu_tri_cel{chu_num};
                    del_dff_tri_cel_i = del_dff_tri_cel((i - 1)*n_tri_con + 1:i*n_tri_con, :); 
                    n_cel_i = size(del_dff_tri_cel_i, 2);
                    dff_fra_tri_cel_i = nan(n_fra, n_tri_con, n_cel_i);
                    sti_two_pho_con = sti_ons_fra_tri((i - 1)*n_tri_con + 1:i*n_tri_con);
                    for j = 1:n_tri_con
                        tri_ons_fra_j = sti_two_pho_con(j) - round(fra_rat_cal*obj.len_bas_plo);
                        tri_off_fra_j = sti_two_pho_con(j) + round(fra_rat_cal*obj.len_res_plo);
                        if tri_off_fra_j - tri_ons_fra_j == n_fra
                            tri_ons_fra_j = tri_ons_fra_j + 1;
                        end
                        dff_fra_tri_cel_i(:, j, :) = dff_tel_chu_fra_cel{chu_num}(tri_ons_fra_j:tri_off_fra_j, :);
                    end
                    dff_tel_con_fra_cel{i} = reshape(com_sta(dff_fra_tri_cel_i, 2), [n_fra, n_cel_i]);
                end
            end
            %
            save(obj.fil_pat_rec, 'log_sid_tel_chu_cel', 'dff_tel_chu_fra_cel', 'del_dff_tel_chu_tri_cel', 'dff_tel_con_fra_cel', '-append') % dff_con_fra_cel - trial average!
        end
        function app_dff_hab_tel(obj)
            app_dff_hab_chu_fra_cel(obj)
            app_dff_tel_chu_fra_cel(obj)
        end
        function app_lat(obj)
            n_chu_obj = obj.n_chu;
            load(obj.fil_pat_exp, 'n_tri', 'sti_two_pho', 'n_con', 'n_tri_con')
            load(obj.fil_pat_rec, 'frameStop')
            load(obj.fil_pat_met_cal, 'metadata')
            fra_rat_cal = 1/metadata.timeStep;
            bas_dur_neu_fra = round(fra_rat_cal*obj.bas_dur_neu);
            sti_ons_fra_tri = round(sti_two_pho/obj.n_pla);
            len_res_plo_fra = round(fra_rat_cal*obj.len_res_plo);
            tri_lim_fra_tri_lim = nan(n_tri, 2);
            dff_hab_chu_fra_cel = cell(n_chu_obj, 1);
            log_sid_chu_cel = cell(n_chu_obj, 1);
            for i = 1:n_chu_obj
                if i == 1
                    n_fra_bef = 0;
                else
                    n_fra_bef = frameStop(i - 1);
                end
                n_fra_aft = frameStop(end) - frameStop(i);
                for j = 1:obj.n_pla
                    load(obj.fil_pat_roi_t_hab_chu_pla{i, j}, 'roi_t')
                    log_sid_i_j_cel = ext_log_sid_cel(roi_t);
                    f_fra_cel_i_j_tra = roi_t.traces';
                    n_cel_i_j = size(f_fra_cel_i_j_tra, 2);
                    f_fra_cel_i_j = [nan(n_fra_bef, n_cel_i_j); f_fra_cel_i_j_tra; nan(n_fra_aft, n_cel_i_j)];
                    dff_fra_cel_i_j = nan(frameStop(end), n_cel_i_j);
                    for k = 1:n_tri
                        chu_num = com_chu_num_tri(k, sti_ons_fra_tri, frameStop);
                        if i == chu_num
                            % compute F0
                            sti_ons_fra_k = sti_ons_fra_tri(k);
                            tri_ons_fra_k = sti_ons_fra_k - bas_dur_neu_fra;
                            tri_lim_fra_tri_lim(k, 1) = tri_ons_fra_k;
                            f_bas_fra_cel_k = f_fra_cel_i_j(tri_ons_fra_k:sti_ons_fra_k, :);
                            f_bas_cel_k = mean(f_bas_fra_cel_k);
                            % compute DFF
                            dff_fra_cel_k = ((f_fra_cel_i_j - f_bas_cel_k)./f_bas_cel_k)*100;
                            tri_off_fra_k = sti_ons_fra_k + len_res_plo_fra;
                            tri_lim_fra_tri_lim(k, 2) = tri_off_fra_k;
                            ind_k = tri_ons_fra_k:tri_off_fra_k;
                            dff_fra_cel_i_j(ind_k, :) = dff_fra_cel_k(ind_k, :);
                        end
                    end
                    dff_hab_chu_fra_cel{i} = [dff_hab_chu_fra_cel{i} dff_fra_cel_i_j];
                    log_sid_chu_cel{i} = [log_sid_chu_cel{i} log_sid_i_j_cel];
                end
            end
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            load(obj.fil_pat_rec, 'dff_hab_chu_fra_cel', 'frameStop', 'sti_ons_fra_tri', 'del_dff_chu_tri_cel', ...
                'fra_rat_cal', 'tri_lim_fra_tri_lim', 'dff_hab_int_fra_cel')
            n_thr = length(obj.n_tri_thr);
            per_cel_thr_con_sid = cell(n_thr, 1);
            lat_ind_thr_con = cell(n_thr, 1);
            for i = 1:n_thr
                [~, ~, ~, ~, per_cel_thr_con_sid{i}, lat_ind_thr_con{i}] = ...
                    com_dff_fra_sta_con(n_con, n_tri_con, ...
                    dff_hab_chu_fra_cel, frameStop, sti_ons_fra_tri, del_dff_chu_tri_cel, fra_rat_cal, obj.len_ave_plo, obj.n_typ_tot, obj.sta_con, ...
                    obj.n_tri_thr(i), obj.ind_cro_con, obj.n_cro, obj.chu_num_cro, obj.log_int, dff_hab_int_fra_cel, tri_lim_fra_tri_lim, obj.n_tri_sti, ...
                    obj.res_dur_neu, obj.n_tri_thr_int, obj.int_cro, obj.len_bas_plo, obj.len_res_plo, n_tri, log_sid_chu_cel);
            end
            save(obj.fil_pat_rec, 'per_cel_thr_con_sid', 'lat_ind_thr_con', '-append')
        end
    end
end