%STARTUP - matlab startup file

%   Author: Kadir Mutlu
%   Address: Olav Kyrres gate 9, 7030 Trondheim, Norway
%   email: kadir.a.mutlu@ntnu.no
%   Website: https://www.ntnu.edu/kavli
%
%   Copyright (c) 2019, Kadir Mutlu
rootgroup = settings();
rootgroup.matlab.general.matfile.SaveFormat.PersonalValue = 'v7.3';
format longG
dbstop if error
%
addpath('C:\Users\kadiram\OneDrive - NTNU\MATLAB\classes_260102')
addpath('C:\Users\kadiram\OneDrive - NTNU\MATLAB\statistics')
addpath('C:\Users\kadiram\OneDrive - NTNU\MATLAB\tools')
addpath('C:\Users\kadiram\OneDrive - NTNU\MATLAB\signal_processing')
addpath('C:\Users\kadiram\OneDrive - NTNU\MATLAB\BrewerMap')
addpath('C:\Users\kadiram\OneDrive - NTNU\MATLAB\figure')
addpath(genpath('C:\Users\kadiram\OneDrive - NTNU\MATLAB\from\laetitia'))
addpath('C:\Users\kadiram\OneDrive - NTNU\MATLAB\two_photon_data_analysis')
addpath('C:\Users\kadiram\OneDrive - NTNU\MATLAB\export_fig')
addpath('C:\Users\kadiram\OneDrive - NTNU\MATLAB\fish_behavior_analysis')
addpath('C:\Users\kadiram\OneDrive - NTNU\MATLAB\cellsort')
addpath('C:\Users\kadiram\OneDrive - NTNU\MATLAB\cell_detection')
addpath(genpath('C:\Users\kadiram\OneDrive - NTNU\MATLAB\supportFunctionsFromMaxCarmen'))
addpath(genpath('C:\Users\kadiram\OneDrive - NTNU\MATLAB\OASIS_matlab'))
addpath(genpath('C:\Users\kadiram\OneDrive - NTNU\MATLAB\from\emre'))
addpath('C:\Users\kadiram\OneDrive - NTNU\MATLAB\buffer_templates')
addpath('C:\Users\kadiram\OneDrive - NTNU\MATLAB\from\ika')
addpath(genpath('C:\Users\kadiram\OneDrive - NTNU\MATLAB\from\anna'))
id = 'images:removing:function';
warning('off', id)
fon_siz = 24;
set(0, 'DefaultAxesFontSize', fon_siz);
set(0, 'DefaultTextFontSize', fon_siz);
set(0, 'DefaultAxesFontName', 'Arial');
set(0, 'DefaultTextFontName', 'Arial');
lin_wid = 2;
set(groot, 'defaultLineLineWidth', lin_wid)
set(0, 'DefaultAxesLineWidth', lin_wid)
set(0, 'DefaultBarLineWidth', lin_wid)
mar_siz = fon_siz;
set(0,'DefaultLineMarkerSize',mar_siz);
set(0,'DefaultFigureColormap',jet());
set(0,'DefaultAxesColorOrder',[    0    0    0
    0.8500    0.3250    0.0980
    0.9290    0.6940    0.1250
    0.4940    0.1840    0.5560
    0.4660    0.6740    0.1880
    0.3010    0.7450    0.9330
    0.6350    0.0780    0.1840]);
%set(0, 'DefaultAxesBox', 'off');%doesn't work
%set(groot, 'DefaultAxesBox', 'off');%doesn't work

% %
% global mar_siz_mea
% mar_siz_mea = 12;
% global kil
% kil = 1000;
% global mil
% mil = 1/1000;
% global mic
% mic = 1/(10^6);
% global n_sta
% n_sta = 2;
% %
% global con_int
% con_int = {'Low'; 'Medium'; 'High'};
% % con_int = {'Light'; 'Shock'; 'Vibration'};
% global con_sho_int
% con_sho_int = {'Low'; 'Med'; 'High'};
% global con_sup_sho_int
% con_sup_sho_int = {'L'; 'M'; 'H'};
% global abb_par
% abb_par = ["TR (Hz)"; "HR (Hz)"; "OR (Hz)"; "MR (Hz)"; "ER (Hz)"];
% global inc
% inc = 2.54;%cm
% global c
% c = @cmu.colors;
% %
% global gro_two_cro
% gro_two_cro = {[1 2]};
% global gro_thr_cro
% gro_thr_cro = {[1 2]; [1 3]; [2 3]};
% global n_sam sam_cro_ind n_cro_sam
% n_sam.one = 2;
% [sam_cro_ind.one, n_cro_sam.one] = ext_sam_cro_ind(n_sam.one);
% n_sam.two = 3;
% [sam_cro_ind.two, n_cro_sam.two] = ext_sam_cro_ind(n_sam.two);
% %
% global n_con
% n_con = 3;
% global n_tri_con
% n_tri_con.vrs = 6;
% global n_tri
% n_tri.vrs = n_con*n_tri_con.vrs;
% global dim_top_bot
% dim_top_bot = 1;
% global dim_lef_rig
% dim_lef_rig = 2;
% global n_pla
% n_pla = 1;
% global win_num_bas
% win_num_bas = 1;
% global win_num_ear
% win_num_ear = 2;
% global z_sco_thr
% z_sco_thr = 2;
% global tit_win
% tit_win = ["Baseline"; "Early"; "Late"];
% global tit_pha_win
% tit_pha_win = ["Bas"; "Res"];
% global col_win_bas col_win_pha col_win_sti
% col_win_bas = "red";
% col_win_pha = "green";
% col_win_sti = "cyan";
% global col_bla_con
% col_bla_con = ["black"; "black"; "black"];
% %
% global n_tri_con_mod
% n_tri_con_mod = n_tri_con.vrs + 1;
% global n_xri
% n_xri = n_tri_con_mod*n_con;
% %
% global con_cro_ind
% con_cro_ind = nchoosek(1:n_con, 2);
% global n_cro_con
% n_cro_con = size(con_cro_ind, 1);
% %
% global col_sca_six
% col_sca_six = [0 65535];
% global col_sca_ewe
% col_sca_ewe = [-10 40];
% global col_sca_lat
% col_sca_lat = [-20 80];
% global col_sca_ste
% col_sca_ste = [-5 20];% 50!
% global str
% str = {'Habenula'; 'Dm'; 'Dl'};
% global n_str
% n_str = 3; % hb, dm, dl
% %
% global n_par
% n_par = 5;
% %
% global n_tri_thr
% n_tri_thr = [4; 5; 6];
% global n_thr
% n_thr = 3;
% global lat_thr
% lat_thr = 0.3;
% %
% global lab_xri
% lab_xri = {'L1'; 'L2'; 'L3'; 'L4'; 'L5'; 'L6'; 'LA'; ...
%     'M1'; 'M2'; 'M3'; 'M4'; 'M5'; 'M6'; 'MA'; 'H1'; 'H2'; 'H3'; 'H4'; 'H5'; 'H6'; 'HA'};
% %
% global n_win % tri, ntt
% n_win.tri = 3;
% global win_cro_ind
% win_cro_ind = nchoosek(1:n_win.tri, 2);
% global n_cro_win
% n_cro_win = size(win_cro_ind, 1);
% %%%%%%%%%%%% ongoing
% global y_lab_ang
% y_lab_ang = 'Tail angle (rad)';
% global y_lab_ave_nor_ang
% y_lab_ave_nor_ang = 'Average TAC (rad)';
% global y_lab_ave_nor_fir
% y_lab_ave_nor_fir = 'Average FRC (s^{-1})';
% global y_lab_ave_dff
% y_lab_ave_dff = 'Average \DeltaF/F (%)';
% global y_lab_spe
% y_lab_spe = 'Speed (a. u.)';
% global y_lab_lat
% y_lab_lat = 'Tailbeat latency (ms)';
% global y_lab_dff
% y_lab_dff = '\DeltaF/F (%)';
% global y_lab_fir_rat
% y_lab_fir_rat = 'Firing rate (Hz)';
% global y_lab_nor_fir_rat
% y_lab_nor_fir_rat = 'Firing rate change (s^{-1})';
% %
% global fra_rat sti_ons_tri
% fra_rat.cal = 18.6117647059;
% [sti_ons_tri.vrs.fra, sti_ons_tri.vrs.sec, sta_tim, end_tim, fra_rat.man] = gen_tap_tph...
%     (round(fra_rat.cal, 2));
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% global min_sec
% min_sec = 60;
% global win_len % .int, and .sec
% rou_len = 1;
% win_len.tai = ext_len(fra_rat.man, rou_len);
% fra_rat.zan = 15;
% rou_len = 1;
% win_len.frc = ext_len(fra_rat.cal, rou_len);
% rou_len = 5;
% win_len.dff = ext_len(fra_rat.cal, rou_len);
% rou_len = 2*min_sec;
% win_len.ong = ext_len(fra_rat.cal, rou_len);
% rou_len = 10;
% win_len.zan = ext_len(fra_rat.zan, rou_len);
% %
% global off_ong_win
% off_ong_win = [4; 12; 20; 28]*min_sec;
% global ons_ong_win
% ons_ong_win = off_ong_win - win_len.ong;
% %
% global epo_num
% epo_num = {[2 4], [4 10], [10 12], [12 18], [18 20], [20 26], [26 28]};
% global n_epo % tot, fun, ong
% n_epo.tot = length(epo_num);
% global fra_epo_sam
% fra_epo_sam = cell(n_epo.tot, 1);
% for i = 1:n_epo.tot
%     fra_epo_sam{i} = (round(fra_rat.cal*epo_num{i}(1)*min_sec) + 1:...
%         ceil(fra_rat.cal*epo_num{i}(2)*min_sec) - 1)';
% end
% global nam_epo
% nam_epo = ["Baseline"; "Low"; "After low"; "Medium"; "After medium"; "High"; "After high"];
% global ind_fun_epo
% ind_fun_epo = [1 2 4 6];
% n_epo.fun = length(ind_fun_epo);
% n_epo.ong = 4;
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% tim
% global ifi
% ifi.cal = 1/fra_rat.cal;
% global isi hal_isi
% isi.sec = 60;
% hal_isi = isi.sec/2;
% %
% global n_fra
% n_fra.cal.ses = 32380;
% global dur tim_fra
% dur.cal = ifi.cal*n_fra.cal.ses;
% tim_fra.cal.ses = (ifi.cal:ifi.cal:dur.cal)';
% %
% ifi.man = 1/fra_rat.man;
% tim_fra.ani.ses = (sta_tim + ifi.man:ifi.man:end_tim)';
% mat_fil = matfile("X:\kadiram\Data\Processed\esp090\tap.mat");
% tim_fra.ani.tri = mat_fil.tim_tri_uni_fra;
% log_fra = tim_fra.ani.tri > -win_len.tai & tim_fra.ani.tri < 2*win_len.tai;
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% zan
% global n_fra_bef cri_ind
% [tim_fra.zan.ses, n_fra_bef.zan, cri_ind.zan, n_fra.zan.ses] = ext_tim_fra(fra_rat.zan);
%  % double check why you floor it, k: excluding the last 50 frames
% n_tri_con.zan = 10;
% n_tri.zan = n_con*n_tri_con.zan;
% sti_ons_tri.zan.sec = [1532.353
%                   1592.356
%                   1652.366
%                    1712.37
%                   1772.373
%                   1832.377
%                   1892.381
%                   1952.385
%                    2012.39
%                   2072.396
%                   2372.402
%                   2432.406
%                    2492.41
%                   2552.414
%                   2612.422
%                   2672.427
%                    2732.43
%                   2792.435
%                   2852.438
%                   2912.442
%                   3212.449
%                   3272.453
%                   3332.457
%                    3392.46
%                   3452.464
%                   3512.468
%                   3572.472
%                   3632.478
%                   3692.483
%                   3752.486];
% sti_ons_tri.zan.fra = round(fra_rat.zan*sti_ons_tri.zan.sec);
% ifi.zan = 1/fra_rat.zan;
% %
% global n_lim
% n_lim = 2;
% global tim_win_lim
% tim_win_lim.zan = [-win_len.zan 0; ...
%                    0 win_len.zan; ...
%                    win_len.zan 2*win_len.zan];
% %
% global tri_num_tri_con
% tri_num_tri_con = [1 7 13;
%     2 8 14;
%     3 9 15;
%     4 10 16;
%     5 11 17;
%     6 12 18];
% global log_tri_con
% log_tri_con.vrs = false(n_tri.vrs, n_con);
% log_tri_con.zan = false(n_tri.zan, n_con);
% for i = 1:n_con
%     log_tri_con.vrs(tri_num_tri_con(:, i), i) = true;
%     log_tri_con.zan((i - 1)*n_tri_con.zan + 1:i*n_tri_con.zan, i) = true;
% end
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% nov
% cri_ind.nov = 1;
% cri_ind.two = 1;
% %
% fil_pat_nov = "X:\kadiram\Data\Pooled\nov\Tph2_NT_Vibration_2022_data.mat";
% [tim_fra.nov.ses, n_fra_bef.nov, n_fra.nov.ses] = ext_nov_tim_fra(fil_pat_nov);
% fil_pat_two = "X:\kadiram\Data\Pooled\two\Tph2_NTT_VibrAdapt_2022_data.mat";
% [tim_fra.two.ses, n_fra_bef.two, n_fra.two.ses] = ext_nov_tim_fra(fil_pat_two);
% global las_fra ind_fra_win
% las_fra = find(tim_fra.nov.ses < (20 + 4)*60, 1, 'last');
% tim_fra.nov.ntt = tim_fra.nov.ses(1:las_fra);
% %
% n_win.ntt = 2;
% win_len.nov.ntt.sec = 60;
% win_len.nov.ntt.int = fra_rat.zan*win_len.nov.ntt.sec;
% n_fra.nov.ntt = 1 + win_len.nov.ntt.int;
% ind_fra_win = nan(n_fra.nov.ntt, n_win.ntt);% indices for the ntt windows
% ind_fra_win(:, 1) = (fra_rat.zan*60 + 1:fra_rat.zan*60 + n_fra.nov.ntt)';
% ind_fra_win(:, 2) = (fra_rat.zan*24*60 - n_fra.nov.ntt + 1:fra_rat.zan*24*60)';
% %
% sti_ons_tri.nov.sec = [1472.417
%                    1532.42
%                   1592.431
%                   1652.436
%                    1712.44
%                   1772.445
%                    1832.45
%                   1892.455
%                   1952.458
%                   2012.464
%                   2312.471
%                   2372.475
%                   2432.479
%                   2492.483
%                   2552.493
%                   2612.498
%                   2672.501
%                   2732.504
%                   2792.508
%                   2852.512
%                   3152.517
%                   3212.521
%                   3272.526
%                    3332.53
%                   3392.534
%                   3452.539
%                   3512.542
%                   3572.552
%                    3632.56
%                   3692.564];
% sti_ons_tri.nov.fra = round(fra_rat.zan*sti_ons_tri.nov.sec);
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% isi.int.cal = fix(isi.sec/ifi.cal);
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% global bin_siz tim_bin n_bin fir_bin las_bin ind_bin_win
% bin_siz.spi = 0.1;
% tim_bin.spi = cal_tim_bin(dur.cal, bin_siz.spi);
% %%%%%%%%%%% zan
% dur.zan = 4049.109;
% bin_siz.zan = 2;
% [tim_bin.zan.ses, ~, n_bin.zan.ses] = cal_tim_bin(dur.zan, bin_siz.zan);
% tim_bin.zan.ses = [tim_bin.zan.ses; tim_bin.zan.ses(end) + bin_siz.zan];%%%%%%%!!!!!!!!!!!!!!!!!!!
% n_bin.zan.ses = n_bin.zan.ses + 1;%%%%%%%!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
% %%%%%%%%%% nov
% dur.nov = 3992.508; % excel, exp1
% [tim_bin.nov.ses, ~, n_bin.nov.ses] = cal_tim_bin(dur.nov, bin_siz.zan);
% fir_bin = find(tim_bin.nov.ses > 1*60, 1, 'first');
% las_bin = find(tim_bin.nov.ses < 20*60, 1, 'last');
% tim_bin.nov.ntt = tim_bin.nov.ses(1:las_bin);
% win_len.nov.ntt.siz = win_len.nov.ntt.sec/bin_siz.zan;
% n_bin.nov.ntt = 1 + win_len.nov.ntt.siz;
% ind_bin_win = nan(n_bin.nov.ntt, n_win.ntt);
% ind_bin_win(:, 1) = (fir_bin:fir_bin + n_bin.nov.ntt - 1)';
% ind_bin_win(:, 2) = (las_bin - n_bin.nov.ntt + 1:las_bin)';
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% reg
% global nam_reg
% nam_reg = ["Forebrain"; "Habenula"; "Telencephalon"; "Dl"; "Dm"; "Dc"; "Dd"; "Dmp"];
% global ind_sub_reg
% ind_sub_reg = [2 4 5 6 7 8];
% global ind_for
% ind_for = 1;
% global ind_hab
% ind_hab = 2;
% global ind_tel
% ind_tel = 3;
% global ind_dlx
% ind_dlx = 4;
% global ind_dmx
% ind_dmx = 5;
% global ind_dcx
% ind_dcx = 6;
% global ind_ddx
% ind_ddx = 7;
% global ind_dmp
% ind_dmp = 8;
% global n_reg_for
% n_reg_for = 8;
% global nam_sho_reg
% nam_sho_reg = ["for"; "ha"; "tel"; "dlx"; "dmx"; "dcx"; "ddx"; "dmp"];
% global int_reg_cha
% int_reg_cha = [nan nan nan; ...
%     nan nan nan; ...
%     nan nan nan; ...
%     1 1 0; ...
%     0 1 0; ...
%     1 0 1; ...
%     1 128/255 0; ...
%     150/255 75/255 0];
% global log_com_reg
% log_com_reg = [false; true; false; true; true; true; true; true];
% global nam_com_reg
% nam_com_reg = ["Ha"; "Dl"; "Dm"; "Dc"; "Dd"; "Dmp"];
% global n_reg_for_cro
% n_reg_for_cro = 6;% hab + 5 tel
% global n_cro_reg
% n_cro_reg = nchoosek(n_reg_for_cro, 2);
% %
% global nam_sub_reg_cro
% nam_sub_reg_cro = cell(n_reg_for_cro, 1);
% nam_sub_reg = ["Habenula"; "Dl"; "Dm"; "Dc"; "Dd"; "Dmp"];
% global reg_num_com_num
% reg_num_com_num = nchoosek(1:n_reg_for_cro, 2);
% for i = 1:n_cro_reg
%     nam_sub_reg_cro{i} = [char(nam_sub_reg(reg_num_com_num(i, 1))) '\times' ...
%         char(nam_sub_reg(reg_num_com_num(i, 2)))];
% end
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% % Left hab, Dl, Dm, Dc, Dd, Dmp
% % Right hab, Dl, Dm, Dc, Dd, Dmp
% global ind_reg_sid
% ind_reg_sid = [(1:n_reg_for_cro)' (1:n_reg_for_cro)' + n_reg_for_cro];
% global n_reg_tot
% n_reg_tot = 12;
% global n_cro_tot
% n_cro_tot = nchoosek(n_reg_tot, 2);
% global reg_cro_ind
% reg_cro_ind = nchoosek(1:n_reg_tot, 2);
% global n_sid
% n_sid = 2;
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% global smi
% smi = -3.5:0.1:-2.5;
% global n_smi
% n_smi = length(smi);
% %
% global nam_win
% nam_win = ["True baseline"; "After low"; "After moderate"; "After high"];
% global y_lab_ong_fir_rat
% y_lab_ong_fir_rat = 'Ongoing firing rate (s^{-1})';
% global y_lab_ong_eve_rat
% y_lab_ong_eve_rat = 'Ongoing event rate (s^{-1})';
% %
% global y_lab_nta
% y_lab_nta = 'Tail angle change (rad)';
% global y_lab_pro
% y_lab_pro = '%tailbeat probability';
% %
% global log_con_tri
% log_con_tri = false(n_con, n_tri.vrs);
% for i = 1:n_con
%     log_con_tri(i, (i - 1)*n_tri_con.vrs + 1:i*n_tri_con.vrs) = true;
% end
% %
% global asp_rat_sig
% asp_rat_sig = 1;
% global asp_rat_bar
% asp_rat_bar = 0.5;
% %
% n_row_cro = round(1536*(20/100));
% asp_rat = 850/(1536 - 2*n_row_cro);
% global asp_rat_cax
% asp_rat_cax = 850/(1536 - 2*n_row_cro);
% %
% global n_row_cax
% n_row_cax = 1536;
% global n_col_cax
% n_col_cax = 850;
% %
% global n_kxx
% n_kxx = 30;
% global gre
% gre = [0.5 0.5 0.5];
% %
% global n_blo
% n_blo.wre = 125;
% n_blo.xre = 100;
% global dis_blo
% max_dis.wre = 500;
% max_dis.xre = 1000;
% dis_blo.wre = linspace(max_dis.wre/n_blo.wre, max_dis.wre, n_blo.wre)';
% dis_blo.xre = linspace(max_dis.xre/n_blo.xre, max_dis.xre, n_blo.xre)';
% %%%%%
% global cor_coe_edg
% cor_coe_edg = (-1:0.1:1)';
% n_edg_cor_coe = length(cor_coe_edg);
% global cor_coe_bin
% cor_coe_bin = ext_mid_poi(cor_coe_edg);
% global n_bin_cor_coe
% n_bin_cor_coe = n_edg_cor_coe - 1;
% %
% global mag_cor_coe_edg
% mag_cor_coe_edg = (0:0.1:1)';
% n_edg_mag_cor_coe = length(mag_cor_coe_edg);
% global mag_cor_coe_bin
% mag_cor_coe_bin = ext_mid_poi(mag_cor_coe_edg);
% global n_bin_mag_cor_coe
% n_bin_mag_cor_coe = n_edg_mag_cor_coe - 1;
% %%%%
% global sig_lev
% sig_lev = 0.05;
% %%%
% global nam_sho_sam
% nam_sho_sam = ["Abl"; "HuC"; "Sha"];
% global tit_sam
% tit_sam = ["tph2 MTZ"; "HuC MTZ"; "tph2 sham"];
% %
% global gra
% gra = [0.5 0.5 0.5];
% global n_dig
% n_dig = 2;
% %
% global fie_cas_num
% fie_cas_num.dff.den.sli = {{'dff'; 'den'; 'sli'; 'all'}; ...
%     {'dff'; 'den'; 'sli'; 'res'; 'zsc'}; ...
%     {'dff'; 'den'; 'sli'; 'res'; 'zsc_tes'}; ...
%     {'dff'; 'den'; 'sli'; 'res'; 'tes'}};
% fie_cas_num.dff.den.tri = {{'dff'; 'den'; 'tri'; 'all'}; ...
%     {'dff'; 'den'; 'tri'; 'res'; 'zsc'}; ...
%     {'dff'; 'den'; 'tri'; 'res'; 'zsc_tes'}; ...
%     {'dff'; 'den'; 'tri'; 'res'; 'tes'}};
% fie_cas_num.dff.raw.tri = {{'dff'; 'raw'; 'tri'; 'all'}; ...% !!!!!!!!!!!!!
%     {'dff'; 'raw'; 'tri'; 'res'; 'zsc'}; ...
%     {'dff'; 'raw'; 'tri'; 'res'; 'zsc_tes'}; ...
%     {'dff'; 'raw'; 'tri'; 'res'; 'tes'}};
% global n_cas
% n_cas = length(fie_cas_num.dff.den.sli);
% %
% global col_sam_con
% col_sam_con = cellfun(@(x) x/255, {[217,217,217] [115,115,115] [0,0,0]; ...
%     [254,217,118] [252,78,42] [128,0,38]}, 'UniformOutput', false);
% global col_sam
% col_sam = {'k'; 'r'};
% %
% global n_cha
% n_cha = 2;% inh, exc.
% %
% global fil_pat_for
% fil_pat_for = "\\home.ansatt.ntnu.no\kadiram\Documents\illustrations\forebrain.png";
% %
% global xtl_abl
% xtl_abl = ['\color[rgb]{1, 0, 0} ', 'Abl'];
% global n_cox
% n_cox = 4;
% %
% clear
% %

%
cle



% function [sti_two_pho, sti_ons, sta_tim, end_tim, fra_rat] = gen_tap_tph(fra_rat_cal)
% % example:
% % sav_dir = 'F:\Bram\esp147';
% % fra_rat_two_pho = 18.61;
% % [n_fra, man_dur, syn_str, tap_str] = gen_tap_tph(sav_dir, fra_rat_two_pho)
% 
% syn_rel_tim = 30;
% dur_syn = 1;
% n_syn = 2;
% dur_spo = 240;
% n_con = 3;
% n_tri_con = 6;
% dur_sti = 0.200;
% isi = 60;
% dur_con_end = 180;
% man_ext = 60;
% %
% n_ele = 3;
% sta_tim = 60;
% dur_end = sta_tim;
% fra_rat = 120;
% %
% dur_con = (n_tri_con - 1)*isi + dur_con_end;
% n_tri = n_con*n_tri_con;
% end_tim = dur_spo + n_con*dur_con;
% %
% dur = end_tim + dur_end;
% man_dur = dur + man_ext;
% n_fra = round(fra_rat_cal*dur);
% %
% n_eve = 1 + n_tri + 1;
% eve_tim = nan(n_eve, 1);
% eve_tim(1) = syn_rel_tim;
% for i = 1:n_con
%     for j = 1:n_tri_con
%         eve_ind = 1 + (i - 1)*n_tri_con + j;
%         eve_tim(eve_ind) = dur_spo + (i - 1)*dur_con + (j - 1)*isi;
%     end
% end
% eve_tim(n_eve) = end_tim + syn_rel_tim;
% %
% syn = nan(n_syn, n_ele);
% tap = nan(n_tri, n_ele);
% syn(1, 1) = eve_tim(1);
% syn(2, 1) = eve_tim(n_eve);
% tap(:, 1) = eve_tim(2:end - 1);
% syn(:, 2) = dur_syn;
% tap(:, 2) = dur_sti;
% syn(:, 3) = 255;
% tap(:, 3) = 255;
% %
% syn(:,1:2)=round(syn(:,1:2)*fra_rat_cal);
% syn_str = mat2str(syn);
% tap(:,1:2)=round(tap(:,1:2)*fra_rat_cal);
% tap_str = mat2str(tap);
% %
% sti_ons = eve_tim(2:end - 1);
% dru_ons = [];
% %
% syn_two_pho = syn(:, 1);
% sti_two_pho = tap(:, 1);
% eve_two_pho = [syn_two_pho(1); sti_two_pho; syn_two_pho(end)];
% fra_tim = (1:n_fra)'/fra_rat_cal;
% sig = zeros(n_fra, 1);
% sig(eve_two_pho) = 1;
% end
% 
% function [tim_bin, edg, n_bin] = cal_tim_bin(dur, bin_siz)
% n_bin = round(dur/bin_siz);
% x_sta = 0;
% x_end = n_bin*bin_siz;
% edg = x_sta:bin_siz:x_end;
% tim_bin = (edg(1:n_bin) + bin_siz/2)';
% end
% 
% function [tim_fra, n_fra_bef, cri_ind, n_fra] = ext_tim_fra(fra_rat)
% mat_fil = matfile("X:\kadiram\Data\Pooled\zan\Tph2_Vibration_2022_data.mat");
% all_fish = mat_fil.all_fish;
% t = all_fish{55, 1}.t; % time from excel file
% %
% bas_ons = 1292;
% [clo_tim, cri_ind] = fin_clo_val(t, bas_ons);
% n_fra_bef = round(fra_rat*clo_tim) - 1;
% n_fra = size(t, 1) - 50; % double check why you floor it, k: excluding the last 50 frames
% tim_fra = [nan(n_fra_bef, 1); t(cri_ind:n_fra)];
% n_fra = n_fra - cri_ind + 1 + n_fra_bef;
% end
% 
% function [tim_fra, n_fra_bef, n_fra] = ext_nov_tim_fra(fil_pat)
% mat_fil = matfile(fil_pat);
% all_fish = mat_fil.all_fish;
% t = all_fish{1, 1}.t; % time from excel file
% global fra_rat
% n_fra_bef = round(fra_rat.zan*t(1)) - 1;
% n_fra = size(t, 1) - 50; % double check why you floor it, k: excluding the last 50 frames
% tim_fra = [nan(n_fra_bef, 1); t(1:n_fra)];
% n_fra = n_fra + n_fra_bef;
% end
% 
% function [bin_tri_lim, tim_bin, bin_bas_lim, tri_len, n_bin] = ext_bin_tri_lim(poi_tri_lim, ...
%     poi_bas_lim, tim_bin, win_len, bin_siz)
% [~, bin_tri_lim] = arrayfun(@(tar) fin_clo_val(tim_bin.ses, tar), poi_tri_lim.sec);
% %
% bin_tri_lim = bin_tri_lim - 1;
% %
% tim_bin.tri = (-win_len.sec:bin_siz:2*win_len.sec)';
% [~, bin_bas_lim] = arrayfun(@(tar) fin_clo_val(tim_bin.ses, tar), poi_bas_lim.sec);
% %
% tim_bin.bas = tim_bin.ses(bin_bas_lim(1):bin_bas_lim(2));
% %
% tri_len.siz = 3*win_len.siz;
% n_bin = tri_len.siz + 1;
% end
