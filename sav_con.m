%constant - One line description of what the script performs (H1 line)
%   Optional file header info (to give more details about the function than in the H1 line)
%   Optional file header info (to give more details about the function than in the H1 line)
%   Optional file header info (to give more details about the function than in the H1 line)
%
%   Description:
%       STARTUP description
%
%   Output:
%       STARTUP output
%
%   Other m-files required: none
%   MAT-files required: none
%
%   See also: OTHER_SCRIPT_NAME,  OTHER_FUNCTION_NAME

%   Author: Kadir Mutlu
%   Address: Olav Kyrres gate 9, 7030 Trondheim, Norway
%   email: kadir.a.mutlu@ntnu.no
%   Website: https://www.ntnu.edu/kavli
%   Date: 09-Oct-2019; Last revision: 09-Oct-2019
%
%   Copyright (c) 2019, Kadir Mutlu
clear
%
hei = 4.5;
%
fon_siz.pre = 24;
fon_siz.non = 12;
fon_siz.pub = 8;
%
mar_siz.pre = 24;
mar_siz.pub = 8;
mar_siz.cel = 10;
mar_siz.roi = 3;
mar_siz.pix = 1;
%
lin_wid.one = 0.5;
lin_wid.two = 1;
lin_wid.thr = 2.25;
%
kil = 1000;
mil = 1/1000;
mic = 1/(10^6);
n_sta = 2;
con = 0.177340352483406;
%
con_int = {'Low'; 'Medium'; 'High'};
con_sti = {'Light'; 'Shock'; 'Vibration'};
con_sho_int = {'Low'; 'Med'; 'High'};
con_sup_sho_int = {'L'; 'M'; 'H'};
abb_par = ["TR (Hz)"; "HR (Hz)"; "OR (Hz)"; "MR (Hz)"; "ER (Hz)"];
inc = 2.54;%cm
c = @cmu.colors;
%
gro_two_cro = {[1 2]};
gro_thr_cro = {[1 2]; [1 3]; [2 3]};
n_sam.one = 2;
[sam_cro_ind.one, n_cro_sam.one] = ext_sam_cro_ind(n_sam.one);
n_sam.two = 3;
[sam_cro_ind.two, n_cro_sam.two] = ext_sam_cro_ind(n_sam.two);
tau = 2;
dis_asp_rat = 1920/1080;
%
n_con = 3;
n_tri_con.vrs = 6;
n_tri.vrs = n_con*n_tri_con.vrs;
dim_top_bot = 1;
dim_lef_rig = 2;
n_pla.sim = 1;
n_pla.neu.raw = 8;
win_num_bas = 1;
win_num_ear = 2;
thr.z_sco.exc = 2;
thr.z_sco.inh = -1;
tit_win = ["Baseline"; "Early"; "Late"];
tit_pha_win = ["Bas"; "Res"];
col_win_bas = "red";
col_win_pha = "green";
col_win_sti = "cyan";
col_bla_con = ["black"; "black"; "black"];
%
n_tri_con_mod = n_tri_con.vrs + 1;
n_xri = n_tri_con_mod*n_con;
%
con_cro_ind = nchoosek(1:n_con, 2);
n_cro_con = size(con_cro_ind, 1);
%
col_sca_six = [0 65535];
%
col_sca_ewe = [-10 40];%-20 40
col_sca_ste = [-5 20];% 50! - current
col_lim.axo_onl = [-5 15];
col_lim.axo_cel = [-5 50];
col_lim.cel_onl = [-15 15];
col_lim.clu = [-20 20];
col_lim.sin = [-10 20];
str = {'Habenula'; 'Dm'; 'Dl'};
n_str = 3; % hb, dm, dl
%
n_par = 5;
%
% n_tri_thr = [4; 5; 6];
% n_thr = 3;
% lat_thr = 0.3;
%
lab_xri = {'L1'; 'L2'; 'L3'; 'L4'; 'L5'; 'L6'; 'LA'; ...
    'M1'; 'M2'; 'M3'; 'M4'; 'M5'; 'M6'; 'MA'; 'H1'; 'H2'; 'H3'; 'H4'; 'H5'; 'H6'; 'HA'};
%
n_win.tri = 3;
win_cro_ind = nchoosek(1:n_win.tri, 2);
n_cro_win = size(win_cro_ind, 1);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
y_lab.com = ["PC1 (a. u.)"; "PC2 (a. u.)"; "PC3 (a. u.)"];
y_lab.cor = 'corr';
y_lab.clu_sel = 'Cluster selectivity';
y_lab.pai_cor = 'Pairwise correlation';
y_lab.tim_del = 'Time delay (s)';
y_lab.dff = '\DeltaF/F (%)';
y_lab.neu_num = 'Neuron #';
y_lab_ang = 'Tail angle (rad)';
y_lab.tac = 'TAC (rad)';
y_lab_ave_nor_fir = 'Average FRC (s^{-1})';
y_lab_ave_dff = 'Average \DeltaF/F (%)';
y_lab_spe = 'Speed (a. u.)';
y_lab_lat = 'Tailbeat latency (ms)';
y_lab_fir_rat = 'Firing rate (Hz)';
y_lab_nor_fir_rat = 'Firing rate change (s^{-1})';
y_lab_ong_fir_rat = 'Ongoing firing rate (s^{-1})';
y_lab_ong_eve_rat = 'Ongoing event rate (s^{-1})';
y_lab_nta = 'Tail angle change (rad)';
y_lab_pro = '%tailbeat probability';
%
x_lab.tim = 'Time (s)';
%%%%%%%
fra_rat.cal.one = 18.6117647059;
fra_rat.cal.eig = 18.6117647059/8;
[~, sti_ons_tri.vrs.all, sta_tim, end_tim, fra_rat.man, dur_spo, dur_con, dur_con_end] = ...
    gen_tap_tph(round(fra_rat.cal.one, 2));% sti ons in seconds
% smo
% in ephys they use 100 ms kernel size, we use ~ 1s. ~no in literature mouse
% gcamp paper. -- original:
%n_fra.dff.eig.smo = 3;

% for the poly
%n_fra.dff.eig.smo = 5;
n_fra.dff.eig.smo = 10;
n_fra.dff.one.smo = 19;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
min_sec = 60;
rou_len = 1;
win_len.tai = ext_len(fra_rat.man, rou_len);% now, only in sec !!!
fra_rat.zan = 15;
rou_len = 1;
win_len.frc = ext_len(fra_rat.cal.one, rou_len);
rou_len = 5;
[win_len.dff.one, n_fra.dff.one.bas] = ext_len(fra_rat.cal.one, rou_len);% len only in sec
[win_len.dff.eig, n_fra.dff.eig.bas] = ext_len(fra_rat.cal.eig, rou_len);

rou_len = 10;
[win_len.dff.pha.drn.tai, ~] = ext_len(fra_rat.cal.eig, rou_len);
rou_len = 20;
[win_len.dff.pha.drn.gab, ~] = ext_len(fra_rat.cal.eig, rou_len);

rou_len = 2*min_sec;
win_len.ong = ext_len(fra_rat.cal.one, rou_len);
rou_len = 10;
win_len.zan = ext_len(fra_rat.zan, rou_len);
%
rou_len = 60;
[win_len.bou, n_fra.bou.win] = ext_len(fra_rat.cal.eig, rou_len);%141
n_fra.bou.win_tri = 140; % fix (ext_poi_tri_lim) used instead of round (ext_len)
n_fra.hal_bou = (n_fra.bou.win - 1)/2;
n_fra.bou.bas = n_fra.dff.eig.bas;
n_fra.bou.smo = n_fra.dff.eig.smo;
%
win_len.sli.cel = 80;
win_len.sli.axo = 200;
%
off_ong_win = [4; 12; 20; 28]*min_sec;
ons_ong_win = off_ong_win - win_len.ong;
%
epo_num = {[2 4], [4 10], [10 12], [12 18], [18 20], [20 26], [26 28]};
% 1 min after the last tap is taken for the tapping period. all spo periods
% 2 min.

% 80 sec sliding window !!!

% baseline in the first min ? just 5 sec! - take all: spo, then axo!

n_epo.tot = length(epo_num);
fra_epo_sam.one = cell(n_epo.tot, 1);
fra_epo_sam.eig = cell(n_epo.tot, 1);
n_fra_epo.one = nan(n_epo.tot, 1);%% !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
n_fra_epo.eig = nan(n_epo.tot, 1);%% !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
tim_epo_fra.cal.one = cell(n_epo.tot, 1);
tim_epo_fra.cal.eig = cell(n_epo.tot, 1);
for i = 1:n_epo.tot
    fra_epo_sam.one{i} = (round(fra_rat.cal.one*epo_num{i}(1)*min_sec) + 1:...
        ceil(fra_rat.cal.one*epo_num{i}(2)*min_sec) - 1)';
    fra_epo_sam.eig{i} = (round(fra_rat.cal.eig*epo_num{i}(1)*min_sec) + 1:...
        ceil(fra_rat.cal.eig*epo_num{i}(2)*min_sec) - 1)';
    n_fra_epo.one(i) = length(fra_epo_sam.one{i});
    n_fra_epo.eig(i) = length(fra_epo_sam.eig{i});
    tim_epo_fra.cal.one{i} = cal_tim_poi(fra_rat.cal.one, n_fra_epo.one(i));
    %tim_epo_fra.cal.eig{i} = cal_tim_poi(fra_rat.cal.eig, n_fra_epo(i));
end
nam_epo = ["Baseline"; "Low"; "After low"; "Medium"; "After medium"; "High"; "After high"];
ind_fun_epo = [1 2 4 6];
n_epo.fun = length(ind_fun_epo);
n_epo.ong = 4;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% tim
ifi.cal.one = 1/fra_rat.cal.one;
ifi.cal.eig = 1/fra_rat.cal.eig;
isi = 60;
hal_isi = isi/2;
%
n_fra.cal.ses.one = 32380;
n_fra.cal.ses.eig = 4047;
dur.cal.one = ifi.cal.one*n_fra.cal.ses.one;
dur.cal.eig = ifi.cal.eig*n_fra.cal.ses.eig;
tim_fra.cal.one.ses = (ifi.cal.one:ifi.cal.one:dur.cal.one)';
tim_fra.cal.eig.ses.ent = (ifi.cal.eig:ifi.cal.eig:dur.cal.eig)';% other: tim_fra.cal.eig.ses.axo
[poi_tri_lim.dff.one, tri_len.dff.one, tim_fra.cal.one.tri.dff, ~, n_fra.cal.tri.one.dff, ~, ...
    n_seg.dff.one] = ext_poi_tri_lim(win_len.dff.one, sti_ons_tri.vrs.all, fra_rat.cal.one, ...
    n_fra.cal.ses.one, isi);
[poi_tri_lim.dff.eig, tri_len.dff.eig, tim_fra.cal.eig.tri.dff, ~, n_fra.cal.tri.eig.dff, ~, ...
    n_seg.dff.eig] = ext_poi_tri_lim(win_len.dff.eig, sti_ons_tri.vrs.all, fra_rat.cal.eig, ...
    n_fra.cal.ses.eig, isi);

[poi_tri_lim.ten, tri_len.ten, tim_fra.ten, ~, n_fra.ten, ~, ...
    n_seg.ten] = ext_poi_tri_lim(win_len.dff.pha.drn.tai, sti_ons_tri.vrs.all, fra_rat.cal.eig, ...
    n_fra.cal.ses.eig, isi);

tim_fra.cal.eig.bou = (-win_len.bou/2:ifi.cal.eig:win_len.bou/2)';
%
ifi.man = 1/fra_rat.man;%120 fps
tim_fra.ani.ses = (sta_tim + ifi.man:ifi.man:end_tim)';
n_fra.ani.ses = length(tim_fra.ani.ses);
tim_fra.ani.dow = (sta_tim + ifi.cal.eig:ifi.cal.eig:end_tim)';
[poi_tri_lim.tai, tri_len.tai, tim_fra.tai.tri.ent, poi_bas_lim.tai, n_fra.tai.tri.ent] = ...% 60 s
    ext_poi_tri_lim(win_len.tai, sti_ons_tri.vrs.all, fra_rat.man, n_fra.ani.ses, isi);
log_fra.tai.tri.lon = tim_fra.tai.tri.ent < 15;
tim_fra.tai.tri.lon = tim_fra.tai.tri.ent(log_fra.tai.tri.lon);
n_fra.tai.tri.lon = length(tim_fra.tai.tri.lon);% 16 s
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% zan
n_tri_con.zan = 10;
n_tri.zan = n_con*n_tri_con.zan;
sti_ons_tri.zan = [1532.353
                  1592.356
                  1652.366
                   1712.37
                  1772.373
                  1832.377
                  1892.381
                  1952.385
                   2012.39
                  2072.396
                  2372.402
                  2432.406
                   2492.41
                  2552.414
                  2612.422
                  2672.427
                   2732.43
                  2792.435
                  2852.438
                  2912.442
                  3212.449
                  3272.453
                  3332.457
                   3392.46
                  3452.464
                  3512.468
                  3572.472
                  3632.478
                  3692.483
                  3752.486];
[tim_fra.zan.ses, n_fra_bef.zan, cri_ind.zan, n_fra.zan.ses] = ext_tim_fra(fra_rat.zan);
[poi_tri_lim.zan, tri_len.zan, tim_fra.zan.tri, poi_bas_lim.zan, n_fra.zan.tri, tim_fra.zan.bas] ...
    = ext_poi_tri_lim(win_len.zan, sti_ons_tri.zan, fra_rat.zan, n_fra.zan.ses, isi);
ifi.zan = 1/fra_rat.zan;
%
n_lim = 2;
tim_win_lim.zan = [-win_len.zan 0; ...
                   0 win_len.zan; ...
                   win_len.zan 2*win_len.zan];
%
tri_num_tri_con = [1 7 13;
    2 8 14;
    3 9 15;
    4 10 16;
    5 11 17;
    6 12 18];
log_tri_con.vrs = false(n_tri.vrs, n_con);
log_tri_con.zan = false(n_tri.zan, n_con);
for i = 1:n_con
    log_tri_con.vrs(tri_num_tri_con(:, i), i) = true;
    log_tri_con.zan((i - 1)*n_tri_con.zan + 1:i*n_tri_con.zan, i) = true;
end
sti_ons_tri.vrs.lig = sti_ons_tri.vrs.all(log_tri_con.vrs(:, 1));
sti_ons_tri.vrs.sho = sti_ons_tri.vrs.all(log_tri_con.vrs(:, 2));
sti_ons_tri.vrs.tap = sti_ons_tri.vrs.all(log_tri_con.vrs(:, 3));
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% nov
cri_ind.nov = 1;
cri_ind.two = 1;
%
fil_pat_nov = "X:\kadiram\Data\Pooled\nov\Tph2_NT_Vibration_2022_data.mat";
[tim_fra.nov.ses, n_fra_bef.nov, n_fra.nov.ses] = ext_nov_tim_fra(fil_pat_nov);
las_fra = find(tim_fra.nov.ses < (20 + 4)*60, 1, 'last');
tim_fra.nov.ntt = tim_fra.nov.ses(1:las_fra);
fil_pat_two = "X:\kadiram\Data\Pooled\two\Tph2_NTT_VibrAdapt_2022_data.mat";
[tim_fra.two.ses, n_fra_bef.two, n_fra.two.ses] = ext_nov_tim_fra(fil_pat_two);
dur.ntt.nov = (20 + 0);
%
sti_ons_tri.nov.sec = [1472.417
                   1532.42
                  1592.431
                  1652.436
                   1712.44
                  1772.445
                   1832.45
                  1892.455
                  1952.458
                  2012.464
                  2312.471
                  2372.475
                  2432.479
                  2492.483
                  2552.493
                  2612.498
                  2672.501
                  2732.504
                  2792.508
                  2852.512
                  3152.517
                  3212.521
                  3272.526
                   3332.53
                  3392.534
                  3452.539
                  3512.542
                  3572.552
                   3632.56
                  3692.564];
sti_ons_tri.nov.fra = round(fra_rat.zan*sti_ons_tri.nov.sec);
%
win_len.nov.ntt.sec = 5*60;
win_len.nov.ntt.int = fra_rat.zan*win_len.nov.ntt.sec;
n_fra.nov.ntt = 1 + win_len.nov.ntt.int;
n_win.ntt = 2;
%win_len.nov.ntt.two.sec = 1*60;
win_len.nov.ntt.two.sec = 5*60;
win_len.nov.ntt.two.int = fra_rat.zan*win_len.nov.ntt.two.sec;
n_fra.nov.two.ntt = 1 + win_len.nov.ntt.two.int;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% two
sti_ons_tri.two.sec = [1471.047
                  1531.047
                  1591.047
                  1651.048
                  1711.048
                  1771.049
                  1831.051
                  1891.051
                  1951.052
                  2011.052
                  2071.052
                  2131.053
                  2191.053
                  2251.054
                  2311.054];
len_win.ntt.sec = [win_len.nov.ntt.sec; win_len.nov.ntt.two.sec];
log_fra_win.ntt = false(n_fra.two.ses, n_win.ntt);
log_fra_win.ntt(:, 1) = tim_fra.two.ses > 1*60 & tim_fra.two.ses <= 1*60 + win_len.nov.ntt.sec;
dur.ntt.two = sti_ons_tri.two.sec(1);
log_fra.two.ntt = tim_fra.two.ses < dur.ntt.two;
log_fra_win.ntt(:, 2) = tim_fra.two.ses > dur.ntt.two - win_len.nov.ntt.two.sec & log_fra.two.ntt;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%isi.int.cal = fix(isi/ifi.cal.one);
n_int.cal = fix(isi/ifi.cal.one);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
bin_siz.spi = 0.1;
tim_bin.spi = cal_tim_bin(dur.cal.one, bin_siz.spi);
%%%%%%%%%%% zan
dur.zan = 4049.109;
bin_siz.zan = 2;
[tim_bin.zan.ses, ~, n_bin.zan.ses] = cal_tim_bin(dur.zan, bin_siz.zan);
tim_bin.zan.ses = [tim_bin.zan.ses; tim_bin.zan.ses(end) + bin_siz.zan];%%%%%%%!!!!!!!!!!!!!!!!!!!
n_bin.zan.ses = n_bin.zan.ses + 1;%%%%%%%!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
%
[bin_tri_lim, tim_bin.zan, bin_bas_lim, tri_len.zan, n_bin.zan.tri] = ext_bin_tri_lim...
    (poi_tri_lim.zan, poi_bas_lim.zan, tim_bin.zan, win_len.zan, bin_siz.zan);
log_bin_win.zan.tri = false(n_bin.zan.tri, n_win.tri);
for i = 1:n_win.tri
    log_bin_win.zan.tri(:, i) = tim_bin.zan.tri > tim_win_lim.zan(i, 1) & tim_bin.zan.tri < ...
        tim_win_lim.zan(i, 2);%%!!!!!!!!!!!!!!!!!!!!!!!!!!
end
%%%%%%%%%% nov
dur.nov = 3992.508; % excel, exp1
[tim_bin.nov.ses, ~, n_bin.nov.ses] = cal_tim_bin(dur.nov, bin_siz.zan);
fir_bin = find(tim_bin.nov.ses > 1*60, 1, 'first');
las_bin = find(tim_bin.nov.ses < 20*60, 1, 'last');
tim_bin.nov.ntt = tim_bin.nov.ses(1:las_bin);
win_len.nov.ntt.siz = win_len.nov.ntt.sec/bin_siz.zan;
n_bin.nov.ntt = 1 + win_len.nov.ntt.siz;
ind_bin_win = nan(n_bin.nov.ntt, n_win.ntt);
ind_bin_win(:, 1) = (fir_bin:fir_bin + n_bin.nov.ntt - 1)';
ind_bin_win(:, 2) = (las_bin - n_bin.nov.ntt + 1:las_bin)';
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% reg
nam_reg = ["Forebrain"; "Habenula"; "Telencephalon"; "Dl"; "Dm"; "Dc"; "Dd"; "Dmp"];
ind_sub_reg = [2 4 5 6 7 8];
ind_for = 1;
ind_hab = 2;
ind_tel = 3;
ind_dlx = 4;
ind_dmx = 5;
ind_dcx = 6;
ind_ddx = 7;
ind_dmp = 8;
n_reg_for = 8;
nam_sho_reg = ["for"; "ha"; "tel"; "dlx"; "dmx"; "dcx"; "ddx"; "dmp"];
int_reg_cha = [nan nan nan; ...
    nan nan nan; ...
    nan nan nan; ...
    1 1 0; ...
    0 1 0; ...
    1 0 1; ...
    1 128/255 0; ...
    150/255 75/255 0];
log_com_reg = [false; true; false; true; true; true; true; true];
nam_com_reg = ["Ha"; "Dl"; "Dm"; "Dc"; "Dd"; "Dmp"];
n_reg_for_cro = 6;% hab + 5 tel
n_cro_reg = nchoosek(n_reg_for_cro, 2);
%
nam_sub_reg_cro = cell(n_reg_for_cro, 1);
nam_sub_reg = ["Habenula"; "Dl"; "Dm"; "Dc"; "Dd"; "Dmp"];
reg_num_com_num = nchoosek(1:n_reg_for_cro, 2);
for i = 1:n_cro_reg
    nam_sub_reg_cro{i} = [char(nam_sub_reg(reg_num_com_num(i, 1))) '\times' ...
        char(nam_sub_reg(reg_num_com_num(i, 2)))];
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Left hab, Dl, Dm, Dc, Dd, Dmp
% Right hab, Dl, Dm, Dc, Dd, Dmp
ind_reg_sid = [(1:n_reg_for_cro)' (1:n_reg_for_cro)' + n_reg_for_cro];
n_reg_tot = 12;
n_cro_tot = nchoosek(n_reg_tot, 2);
reg_cro_ind = nchoosek(1:n_reg_tot, 2);
n_sid = 2;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
smi = -3.5:0.1:-2.5;
n_smi = length(smi);
%
nam_win = ["True baseline"; "After low"; "After moderate"; "After high"];
%
log_con_tri = false(n_con, n_tri.vrs);
for i = 1:n_con
    log_con_tri(i, (i - 1)*n_tri_con.vrs + 1:i*n_tri_con.vrs) = true;
end
%
asp_rat.sig.sho = 1;
asp_rat.sig.lon = 1.5;
asp_rat.bar = 0.5;
n_row.cal = 1536;
n_col.cal = 850;
asp_rat.cal.ori = n_col.cal/n_row.cal;
%
n_k = 5;
gre = [0.5 0.5 0.5];
% single plane
max_dis.wre = 500;% entire forebrain
%n_blo.wre = 125;
n_blo.wre = 50;
dis_blo.wre = linspace(max_dis.wre/n_blo.wre, max_dis.wre, n_blo.wre)';
max_dis.xre = 1000;
n_blo.xre = 100;
dis_blo.xre = linspace(max_dis.xre/n_blo.xre, max_dis.xre, n_blo.xre)';
% tel
dis_blo.tel = [dis_blo.wre(1:30); 500];
n_blo.tel = 31;
dis_blo.axo = [dis_blo.wre(1:20); 500];
n_blo.axo = 21;
% rap
n_blo.rap.thr = 30;% for pairwise distance
max_dis.rap.thr = 150;
dis_blo.rap.thr = linspace(max_dis.rap.thr/n_blo.rap.thr, max_dis.rap.thr, n_blo.rap.thr)';
n_blo.rap.one = 10;
max_dis.rap.ros_cau = 100;
dis_blo.rap.ros_cau = linspace(max_dis.rap.ros_cau/n_blo.rap.one, max_dis.rap.ros_cau, ...
    n_blo.rap.one)';
max_dis.rap.dor_ven = 100;
dis_blo.rap.dor_ven = linspace(max_dis.rap.dor_ven/n_blo.rap.one, max_dis.rap.dor_ven, ...
    n_blo.rap.one)';
% for
n_blo.for.ros_cau = 40;
max_dis.for.ros_cau = 100 + 300;% hab + tel
dis_blo.for.ros_cau = linspace(max_dis.for.ros_cau/n_blo.for.ros_cau, max_dis.for.ros_cau, ...
    n_blo.for.ros_cau)';
% ml - 200
n_blo.for.dor_ven = 7;
max_dis.for.dor_ven = 100;
dis_blo.for.dor_ven = linspace(max_dis.for.dor_ven/n_blo.for.dor_ven, max_dis.for.dor_ven, ...
    n_blo.for.dor_ven)';
%%%%%
r_edg = (-1:0.1:1)';
n_edg_cor_coe = length(r_edg);
r_bin = ext_mid_poi(r_edg);
n_bin_cor_coe = n_edg_cor_coe - 1;
%
acc_edg = (0:0.1:1)';
n_edg_acc = length(acc_edg);
acc_bin = ext_mid_poi(acc_edg);
n_bin_acc = n_edg_acc - 1;
%%%%
sig_lev = 0.05;
%%%
tit_sam = ["Sham"; "Ablated"; "MTZ"];
%
gra = [0.5 0.5 0.5];
n_dig = 2;
%
fie_cas_num.dff.den.sli = {{'dff'; 'den'; 'sli'; 'all'}; ...
    {'dff'; 'den'; 'sli'; 'res'; 'zsc'}; ...
    {'dff'; 'den'; 'sli'; 'res'; 'zsc_tes'}; ...
    {'dff'; 'den'; 'sli'; 'res'; 'tes'}};
fie_cas_num.dff.den.tri = {{'dff'; 'den'; 'tri'; 'all'}; ...
    {'dff'; 'den'; 'tri'; 'res'; 'zsc'}; ...
    {'dff'; 'den'; 'tri'; 'res'; 'zsc_tes'}; ...
    {'dff'; 'den'; 'tri'; 'res'; 'tes'}};
fie_cas_num.dff.raw.tri = {{'dff'; 'raw'; 'tri'; 'all'}; ...% !!!!!!!!!!!!!
    {'dff'; 'raw'; 'tri'; 'res'; 'zsc'}; ...
    {'dff'; 'raw'; 'tri'; 'res'; 'zsc_tes'}; ...
    {'dff'; 'raw'; 'tri'; 'res'; 'tes'}};
n_cas = length(fie_cas_num.dff.den.sli);
%
col_sam_con = cellfun(@(x) x/255, {[217,217,217] [115,115,115] [0,0,0]; ...
    [254,217,118] [252,78,42] [128,0,38]}, 'UniformOutput', false);
%col_sam = {[0 0 0]/255; [128 0 38]/255; [128 0 38]/255};
col_sam = {[0 0 0]/255; [128 0 38]/255; [0 0 255]/255};% black, bordeux, blue
%
n_cha = 2;% inh, exc.
%
fil_pat_for = "\\home.ansatt.ntnu.no\kadiram\Documents\illustrations\forebrain.png";
%
xtl_abl = ['\color[rgb]{0.5, 0, 0.15} ', 'Abl'];
xtl_mtz = ['\color[rgb]{0, 0, 1} ', 'MTZ'];
xtl_sam = {'Sha'; xtl_abl; xtl_mtz};
n_cox = 4;
%
fun_pla.raw = [1 3 4 5 6 7 8];
fun_pla.plo = [3 4 5 6 7 8 1];
fun_pla.dor = [3 4 5];
fun_pla.ven = [6 7 8 1];
fun_pla.ven_exc = [7 8 1];
n_pla.neu.fun = length(fun_pla.raw);
n_pla.neu.dor = length(fun_pla.dor);
n_pla.neu.ven = length(fun_pla.ven);
n_pla.neu.ven_exc = length(fun_pla.ven_exc);
n_icx = 1;
icx_num = 1;
col_con = ['r' 'g' 'b'];
n_col_col = 256;% Number of colormap colors
n_pcx = 3;% n primary colors | also number of principal components
max_int = 65535;
log_fra.cal.one.ses = tim_fra.cal.one.ses > 60;
log_fra.cal.eig.ses.cel = tim_fra.cal.eig.ses.ent > 60;
unu_per.axo = 200;
log_fra.cal.eig.ses.axo = tim_fra.cal.eig.ses.ent > 200 & tim_fra.cal.eig.ses.ent <= end_tim;
% end: 28 min

tim_fra.cal.eig.ses.axo = tim_fra.cal.eig.ses.ent(log_fra.cal.eig.ses.axo);
%
log_fra.cal.one.tri = tim_fra.cal.one.tri.dff <= 2*win_len.dff.one;% logical for short!
log_fra.cal.eig.tri = true(n_fra.cal.tri.eig.dff, 1);
%
epo_num_ong = 1;
log_fra.cal.eig.ong = tim_fra.cal.eig.ses.ent > 60 & ...
    tim_fra.cal.eig.ses.ent < 60*epo_num{epo_num_ong}(2);% 1-4 min
tim_epo_fra.cal.eig{epo_num_ong} = cal_tim_poi(fra_rat.cal.eig, sum(log_fra.cal.eig.ong));
%
log_fra.cal.eig.ong_one = tim_fra.cal.eig.ses.ent > 60 & ...
    tim_fra.cal.eig.ses.ent < 60*2.5;% 1 - 2.5
tim_fra.cal.eig.ong_one = cal_tim_poi(fra_rat.cal.eig, sum(log_fra.cal.eig.ong_one));
log_fra.cal.eig.ong_two = tim_fra.cal.eig.ses.ent > 60*2.5 & ...
    tim_fra.cal.eig.ses.ent < 60*epo_num{epo_num_ong}(2);% 2.5 - 4
log_fra.cal.eig.ong_two(find(log_fra.cal.eig.ong_two, 1, 'last')) = false;
n_fra.cal.eig.ong_two = sum(log_fra.cal.eig.ong_two);
n_fra.cal.eig.ong = sum(log_fra.cal.eig.ong);
%
blockLength = 50;
%
lim_r = 0.2;
r_lim = [-lim_r lim_r];
map.cen = centered;% blue to red
[map.sym,num,typ,scheme] = brewermap([], "-RdBu");
map.asy = gen_asy_col;
%
piv.gre = 0.94;
piv_col_pcx.div = [0 0 1
    piv.gre piv.gre piv.gre
    1 0 0];
piv_col_pcx.inh_non_exc = [1 0 0
    0 0 0
    0 0 1]; % mapped
piv_col_pcx.thr.fir = [0 0 1
    0 1 0
    1 0 0];
piv_col_pcx.fou.bef = [0 0 1
    0 1 1
    0 1 0
    1 0 0];
piv_col_pcx.fiv.pix.bou = [139/255 0 0
    1 0 0
    255/255 127/255 127/255
    173/255 216/255 230/255
    0 0 1];
piv_col_pcx.som.lig = [1 0 0
    255/255 192/255 203/255
    150/255 75/255 0/255
    255/255 128/255 0/255
    0 0 1];
piv_col_pcx.som.sho = [1 0 0
    255/255 192/255 203/255
    150/255 75/255 0/255
    255/255 128/255 0/255
    0 0 1];
piv_col_pcx.som.tap = [139/255 0 0
    1 0 0
    255/255 127/255 127/255
    173/255 216/255 230/255
    0 0 1];% identical piv_col_pcx.fiv.pix.bou

piv_col_pcx.axo.bou.all = [139/255 0 0
    1 0 0
    255/255 127/255 127/255
    173/255 216/255 230/255
    0 0 1];% identical piv_col_pcx.fiv.pix.bou; for getfield ...
    % in the real colorbar blue on top! --- maps based on rows!

piv_col_pcx.cel_onl.cel.bou.all = [139/255 0 0
    1 0 0
    255/255 127/255 127/255
    173/255 216/255 230/255
    0 0 1];% identical piv_col_pcx.axo.bou.all

piv_col_pcx.cel_onl.cel.bou.spo = [139/255 0 0
    1 0 0
    255/255 127/255 127/255
    173/255 216/255 230/255
    0 0 1];% identical piv_col_pcx.axo.bou.all

piv_col_pcx.fiv.cel = [139/255 0 0
    1 0 0
    255/255 127/255 127/255
    255/255 128/255 0/255
    255/255 0/255 255/255];

piv_col_pcx.thr.ong = [0 0 0
    1 0 0
    0 0 1];

piv_col_pcx.fou.ong = [0 0 0% color 1
    1 0 0
    0 1 0
    0 1 1];

piv_col_pcx.fiv.ong = [0 0 0% color 1
    1 0 0
    0 1 0
    0 0 1
    128/255 0/255 255/255];
%
high_in.axo_cel = 230;
low_in.axo_cel = 45;
dis_lim.axo_cel = [low_in.axo_cel high_in.axo_cel];
dis_lim.cel_onl = dis_lim.axo_cel; %% !!!!!

high_in.axo_onl = 123;
low_in.axo_onl = 48.2;
dis_lim.axo_onl = [low_in.axo_onl high_in.axo_onl];
n_com = 3; % number of principal components
n_clu = 3;
max_lag = 2; % s

%bea_del = 0.050;% 6 frames
%bea_del = 0.070; % not used
bea_del = 0.100;
spo_bor = ext_spo_bor_emr(dur_spo, sta_tim, n_con, dur_con, isi, dur_con_end);% in s

factor_meter = 0.303819;% dunno for which, normally calculated per recording.

cro_rat.fir = 0.16;% standard vr
cro_rat.sec = 0.09;% standard vr

piv.off.gre = uint16(640);% pmt 575
piv.off.red.fir = uint16(351);% pmt 650
piv.off.red.sec = uint16(332);% pmt 610

tra = 0.5;

n_kxx = 30;
bin_siz.ima = 10;
%
save('\\home.ansatt.ntnu.no\kadiram\Documents\MATLAB\con_esp.mat')
clear
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [sti_two_pho, sti_ons, sta_tim, end_tim, fra_rat, dur_spo, dur_con, dur_con_end] = ...
    gen_tap_tph(fra_rat_cal)
% example:
% sav_dir = 'F:\Bram\esp147';
% fra_rat_two_pho = 18.61;
% [n_fra, man_dur, syn_str, tap_str] = gen_tap_tph(sav_dir, fra_rat_two_pho)

syn_rel_tim = 30;
dur_syn = 1;
n_syn = 2;
dur_spo = 240;
n_con = 3;
n_tri_con = 6;
dur_sti = 0.200;
isi = 60;
dur_con_end = 180;
man_ext = 60;
%
n_ele = 3;
sta_tim = 60;
dur_end = sta_tim;
fra_rat = 120;
%
dur_con = (n_tri_con - 1)*isi + dur_con_end;
n_tri = n_con*n_tri_con;
end_tim = dur_spo + n_con*dur_con;
%
dur = end_tim + dur_end;
man_dur = dur + man_ext;
n_fra = round(fra_rat_cal*dur);
%
n_eve = 1 + n_tri + 1;
eve_tim = nan(n_eve, 1);
eve_tim(1) = syn_rel_tim;
for i = 1:n_con
    for j = 1:n_tri_con
        eve_ind = 1 + (i - 1)*n_tri_con + j;
        eve_tim(eve_ind) = dur_spo + (i - 1)*dur_con + (j - 1)*isi;
    end
end
eve_tim(n_eve) = end_tim + syn_rel_tim;
%
syn = nan(n_syn, n_ele);
tap = nan(n_tri, n_ele);
syn(1, 1) = eve_tim(1);
syn(2, 1) = eve_tim(n_eve);
tap(:, 1) = eve_tim(2:end - 1);% based on the events, calculated with the set parameters
syn(:, 2) = dur_syn;
tap(:, 2) = dur_sti;
syn(:, 3) = 255;
tap(:, 3) = 255;
%
syn(:,1:2)=round(syn(:,1:2)*fra_rat_cal);
syn_str = mat2str(syn);
tap(:,1:2)=round(tap(:,1:2)*fra_rat_cal);% why all rounded ...
tap_str = mat2str(tap);
%
sti_ons = eve_tim(2:end - 1);% based on the events, calculated with the set parameters
dru_ons = [];
%
syn_two_pho = syn(:, 1);
sti_two_pho = tap(:, 1);
eve_two_pho = [syn_two_pho(1); sti_two_pho; syn_two_pho(end)];
fra_tim = (1:n_fra)'/fra_rat_cal;
sig = zeros(n_fra, 1);
sig(eve_two_pho) = 1;
end

function [tim_bin, edg, n_bin] = cal_tim_bin(dur, bin_siz)
n_bin = round(dur/bin_siz);
x_sta = 0;
x_end = n_bin*bin_siz;
edg = x_sta:bin_siz:x_end;
tim_bin = (edg(1:n_bin) + bin_siz/2)';
end

function [tim_fra, n_fra_bef, cri_ind, n_fra] = ext_tim_fra(fra_rat)
mat_fil = matfile("X:\kadiram\Data\Pooled\zan\Tph2_Vibration_2022_data.mat");
all_fish = mat_fil.all_fish;
t = all_fish{55, 1}.t; % time from excel file
%
bas_ons = 1292;
[clo_tim, cri_ind] = fin_clo_val(t, bas_ons);
n_fra_bef = round(fra_rat*clo_tim) - 1;
n_fra = size(t, 1) - 50; % double check why you floor it, k: excluding the last 50 frames
tim_fra = [nan(n_fra_bef, 1); t(cri_ind:n_fra)];
n_fra = n_fra - cri_ind + 1 + n_fra_bef;
end

function [tim_fra, n_fra_bef, n_fra] = ext_nov_tim_fra(fil_pat)
mat_fil = matfile(fil_pat);
all_fish = mat_fil.all_fish;
t = all_fish{1, 1}.t; % time from excel file
fra_rat.zan = 15;
n_fra_bef = round(fra_rat.zan*t(1)) - 1;
n_fra = size(t, 1) - 50; % double check why you floor it, k: excluding the last 50 frames
tim_fra = [nan(n_fra_bef, 1); t(1:n_fra)];
n_fra = n_fra + n_fra_bef;
end

function [bin_tri_lim, tim_bin, bin_bas_lim, tri_len, n_bin] = ext_bin_tri_lim(poi_tri_lim, ...
    poi_bas_lim, tim_bin, win_len, bin_siz)
[~, bin_tri_lim] = arrayfun(@(tar) fin_clo_val(tim_bin.ses, tar), poi_tri_lim.sec);
%
bin_tri_lim = bin_tri_lim - 1;
%
tim_bin.tri = (-win_len:bin_siz:2*win_len)';
[~, bin_bas_lim] = arrayfun(@(tar) fin_clo_val(tim_bin.ses, tar), poi_bas_lim.sec);
%
tim_bin.bas = tim_bin.ses(bin_bas_lim(1):bin_bas_lim(2));
%
tri_len.siz = 3*(win_len/bin_siz);%n_bin.win
n_bin = tri_len.siz + 1;
end

function spo_bor = ext_spo_bor_emr(dur_spo, dur_beg, n_con, dur_con, isi, dur_con_end)
% extract spontaneous borders
spo_bor = nan(1 + n_con, 2);
spo_bor(1, 1) = dur_beg;
spo_bor(1, 2) = dur_spo;
for i = 1:n_con
    spo_bor(1 + i, 1) = dur_spo + i*dur_con - dur_con_end + isi;% 1 min after the last tap
    spo_bor(1 + i, 2) = dur_spo + i*dur_con - 1; % -1s for convolution
end
end

function piv_col_pcx = ext_piv_col_pcx(map, n_col)
% piv_col_pcx = map(1:64/(n_col - 1) - 1:64, :); % blue
piv_col_pcx = flip(map(192:64/(n_col - 1) - 1:256, :));
end
