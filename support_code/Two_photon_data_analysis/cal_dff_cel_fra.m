classdef cal_dff_cel_fra
    %CAL_DFF_CEL_FRA - One line description of what the class performs (H1 line)
    %   Optional file header info (to give more details about the function than in the H1 line)
    %   Optional file header info (to give more details about the function than in the H1 line)
    %   Optional file header info (to give more details about the function than in the H1 line)
    %
    %   CAL_DFF_CEL_FRA constructor syntax:
    %       CAL_DFF_CEL_FRA_OBJ = CAL_DFF_CEL_FRA()
    %
    %   CAL_DFF_CEL_FRA properties/attributes:
    %       Property 1 - description
    %       Property 2 - description
    %
    %   CAL_DFF_CEL_FRA methods/functions:
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
    %   Date: 23-Apr-2024; Last revision: 23-Apr-2024
    %
    %   Copyright (c) 2024, Aytac Kadir Mutlu
    %   All rights reserved.


    properties
    end
    
    methods(Static)
        function [dff_cel_fra, log_fie_fie_cel, res_fie_fie_cel] = neu(piv_fra_cel, log_fie_fie_cel, ...
                bou_ons_bou, pha_win_len)
            con_fil = matfile('\\home.ansatt.ntnu.no\kadiram\Documents\MATLAB\con_esp.mat');
            fra_rat = con_fil.fra_rat;
            fra_rat = fra_rat.cal.eig;
            isi = con_fil.isi;
            win_len = con_fil.win_len;
            [~, ~, ~, ~, ~, dff_cel_fra.bou_all, ~, ~, log_fie_fie_cel.bou_all, ~, ~, ...
                res_fie_fie_cel.bou_all] = cal_rel_cha_uni_poi_tri(piv_fra_cel, win_len.dff.eig, ...
                bou_ons_bou.all, fra_rat, isi, pha_win_len);
            sti_ons_tri = con_fil.sti_ons_tri;
            [~, ~, ~, ~, ~, dff_cel_fra.lig, ~, ~, log_fie_fie_cel.lig, ~, ~, res_fie_fie_cel.lig] = ...
                cal_rel_cha_uni_poi_tri(piv_fra_cel, win_len.dff.eig, sti_ons_tri.vrs.lig, fra_rat, ...
                isi, pha_win_len);
            [~, ~, ~, ~, ~, dff_cel_fra.sho, ~, ~, log_fie_fie_cel.sho, ~, ~, res_fie_fie_cel.sho] = ...
                cal_rel_cha_uni_poi_tri(piv_fra_cel, win_len.dff.eig, sti_ons_tri.vrs.sho, fra_rat, ...
                isi, pha_win_len);
            [~, ~, ~, ~, ~, dff_cel_fra.tap, ~, ~, log_fie_fie_cel.tap, ~, ~, res_fie_fie_cel.tap] = ...
                cal_rel_cha_uni_poi_tri(piv_fra_cel, win_len.dff.eig, sti_ons_tri.vrs.tap, fra_rat, ...
                isi, pha_win_len);
        end

        function [log_fie_fie_cel, log_fie_fie_pla_row_col, dff_cel_fra, fra_fie, fra_fie_fie_blo, ...
            res_fie_cel] = cal_dff_cel_fra(bou_ons_bou, piv_pla_fra_cel, log_fie_fie_cel, coo_cel_dim, ...
            cel_fie_pla_row_col, log_fie_fie_pla_row_col)
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% tail-triggered
        con_fil = matfile('\\home.ansatt.ntnu.no\kadiram\Documents\MATLAB\con_esp.mat');
        win_len = con_fil.win_len;
        fra_rat = con_fil.fra_rat;
        isi = con_fil.isi;
        piv_fra_cel = [piv_pla_fra_cel{:}];
        
        pha_win_len = 20;
        %pha_win_len = win_len.dff.pha.drn.tai;%10
        
        [~, ~, ~, ~, ~, dff_gab_cel_fra, ~, ~, log_fie_fie_cel, fra_fie.gab, ~, res_gab_fie_cel] = ...
            cal_rel_cha_uni_poi_tri(piv_fra_cel, win_len.dff.eig, bou_ons_bou.all, fra_rat.cal.eig, isi, ...
            pha_win_len, log_fie_fie_cel, {'gab'; 'all'});
        [~, ~, ~, ~, ~, dff_non_cel_fra, ~, ~, log_fie_fie_cel, fra_fie.non, ~, res_non_fie_cel] = ...
            cal_rel_cha_uni_poi_tri(piv_fra_cel, win_len.dff.eig, bou_ons_bou.all, fra_rat.cal.eig, isi, ...
            pha_win_len, log_fie_fie_cel, {'non'; 'all'});
        dff_cel_fra.bou.all = squeeze(sum(cat(3, dff_gab_cel_fra, dff_non_cel_fra), 3, "omitnan"));
        [fra_fie_fie_blo, log_fie_fie_pla_row_col] = cal_fra(log_fie_fie_cel, coo_cel_dim, ...
            cel_fie_pla_row_col.ani, log_fie_fie_pla_row_col);
        res_fie_cel.srt = gen_res_cel(res_gab_fie_cel.srt, res_non_fie_cel.srt);
        res_fie_cel.zsc = gen_res_cel(res_gab_fie_cel.zsc, res_non_fie_cel.zsc);
        end
    end

end

function [fra_fie_fie_blo, log_fie_fie_pla_row_col] = cal_fra(log_fie_fie_cel, coo_cel_dim, ...
    cel_pla_row_col, log_fie_fie_pla_row_col)
[fra_fie_fie_blo.gab.srt, log_fie_fie_pla_row_col.gab.srt] = cal_fra_sin(log_fie_fie_cel.gab.srt, ...
    coo_cel_dim, cel_pla_row_col, log_fie_fie_pla_row_col.gab.srt);
[fra_fie_fie_blo.non.srt, log_fie_fie_pla_row_col.non.srt] = cal_fra_sin(log_fie_fie_cel.non.srt, ...
    coo_cel_dim, cel_pla_row_col, log_fie_fie_pla_row_col.non.srt);
%
[fra_fie_fie_blo.gab.zsc, log_fie_fie_pla_row_col.gab.zsc] = cal_fra_sin(log_fie_fie_cel.gab.zsc, ...
    coo_cel_dim, cel_pla_row_col, log_fie_fie_pla_row_col.gab.zsc);
[fra_fie_fie_blo.non.zsc, log_fie_fie_pla_row_col.non.zsc] = cal_fra_sin(log_fie_fie_cel.non.zsc, ...
    coo_cel_dim, cel_pla_row_col, log_fie_fie_pla_row_col.non.zsc);
end

function [fra_fie_fie_blo, log_fie_fie_pla_row_col] = cal_fra_sin(log_fie_fie_cel, coo_cel_dim, ...
    cel_pla_row_col, log_fie_fie_pla_row_col)
% log_pla_row_col for dimensions!
fra_fie_fie_blo = ext_act_gab(coo_cel_dim, log_fie_fie_cel);
con_fil = matfile('\\home.ansatt.ntnu.no\kadiram\Documents\MATLAB\con_esp.mat');
n_pla = con_fil.n_pla;
fun_pla = con_fil.fun_pla;
gab_cel_num.inh = find(log_fie_fie_cel.inh);
log_fie_fie_pla_row_col.inh = cell(n_pla.neu.raw, 1);
gab_cel_num.exc = find(log_fie_fie_cel.exc);
log_fie_fie_pla_row_col.exc = cell(n_pla.neu.raw, 1);
for pla = fun_pla.raw
    cel_row_col = cel_pla_row_col{pla};
    log_fie_fie_pla_row_col.inh{pla} = ismember(cel_row_col, gab_cel_num.inh);
    log_fie_fie_pla_row_col.exc{pla} = ismember(cel_row_col, gab_cel_num.exc);
end
end

function fra_fie_fie_blo = ext_act_gab(coo_cel_dim, log_fie_cel)
con_fil = matfile('\\home.ansatt.ntnu.no\kadiram\Documents\MATLAB\con_esp.mat');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% coo
coo_cel_dim(:, 1) = coo_cel_dim(:, 1) - min(coo_cel_dim(:, 1));
coo_cel_dim(:, 2) = coo_cel_dim(:, 2) - min(coo_cel_dim(:, 2));
coo_cel_dim(:, 3) = coo_cel_dim(:, 3) - min(coo_cel_dim(:, 3));
dis_blo = con_fil.dis_blo;
n_blo = con_fil.n_blo;
n_cel = length(log_fie_cel.all);
log_cel_blo.ros_cau.all = false(n_cel, n_blo.rap.one);
log_cel_blo.dor_ven.all = false(n_cel, n_blo.rap.one);
for i = 1:n_blo.rap.one
    if i == 1
        log_cel_blo.ros_cau.all(:, i) = coo_cel_dim(:, 1) <= dis_blo.rap.ros_cau(i);
        log_cel_blo.dor_ven.all(:, i) = coo_cel_dim(:, 3) <= dis_blo.rap.dor_ven(i);
    else
        log_cel_blo.ros_cau.all(:, i) = coo_cel_dim(:, 1) > dis_blo.rap.ros_cau(i - 1) & coo_cel_dim...
            (:, 1) <= dis_blo.rap.ros_cau(i);
        log_cel_blo.dor_ven.all(:, i) = coo_cel_dim(:, 3) > dis_blo.rap.dor_ven(i - 1) & coo_cel_dim...
            (:, 3) <= dis_blo.rap.dor_ven(i);
    end
end
log_cel_blo.ros_cau.all = log_cel_blo.ros_cau.all & log_fie_cel.all;% compatible !
log_cel_blo.dor_ven.all = log_cel_blo.dor_ven.all & log_fie_cel.all;

log_cel_blo.ros_cau.inh = log_cel_blo.ros_cau.all & log_fie_cel.inh;
log_cel_blo.ros_cau.exc = log_cel_blo.ros_cau.all & log_fie_cel.exc;
log_cel_blo.dor_ven.inh = log_cel_blo.dor_ven.all & log_fie_cel.inh;
log_cel_blo.dor_ven.exc = log_cel_blo.dor_ven.all & log_fie_cel.exc;
%
dim_top_bot = 1;
fra_fie_fie_blo.ros_cau.inh = (sum(log_cel_blo.ros_cau.inh, dim_top_bot)./sum(...
    log_cel_blo.ros_cau.all, dim_top_bot))'*100;
fra_fie_fie_blo.ros_cau.exc = (sum(log_cel_blo.ros_cau.exc, dim_top_bot)./sum(...
    log_cel_blo.ros_cau.all, dim_top_bot))'*100;
fra_fie_fie_blo.dor_ven.inh = (sum(log_cel_blo.dor_ven.inh, dim_top_bot)./sum(...
    log_cel_blo.dor_ven.all, dim_top_bot))'*100;
fra_fie_fie_blo.dor_ven.exc = (sum(log_cel_blo.dor_ven.exc, dim_top_bot)./sum(...
    log_cel_blo.dor_ven.all, dim_top_bot))'*100;
end

function res_cel = gen_res_cel(res_gab_cel, res_non_cel)
res_gab_cel(res_gab_cel == 2) = 0;
res_non_cel(res_non_cel == 2) = 0;
res_cel = res_gab_cel + res_non_cel;
res_cel(res_cel == 0) = 2;
end
