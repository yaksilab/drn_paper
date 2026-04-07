%DRN_DEMO - script to plot Fig. 2H of the manuscript for demonstration
%
%   Output:
%       Fig. 2H of the manuscript

%   Author: Aytac Kadir Mutlu
%   Address: Olav Kyrres gate 9, 7030 Trondheim, Norway
%   email: kadir.a.mutlu@ntnu.no
%   Website: https://www.ntnu.edu/kavli
%
%   Copyright (c) 2026, Aytac Kadir Mutlu

load('Collected_data_all_fish_fig_1_2_S1_S3_S4.mat')
n_ani = 12;
fie_num = {'bou_non'};
res_cel = [];
for ani_num = 1:n_ani
    disp(ani_num)
    res_cel = [res_cel; res_ani_cel{ani_num}.(fie_num{1})];
end

h_fig = figure;
h_plo = piechart(h_fig, categorical(res_cel));
h_plo.Labels = [];
piv_col_pcx = [0 0 1
    0.5 0.5 0.5
    1 0 0];
h_plo.ColorOrder = piv_col_pcx;
