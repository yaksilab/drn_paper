%% Zantics Juvenile 6 Arenas Masterfile
source = 'X:\kadiram\from\bram\Tph2_NTT_VibrAdapt\';
folder_path_save = 'X:\kadiram\Data\Pooled\two\';
fish_name = 'Tph2_NTT_VibrAdapt';% name of dataset (e.g. name of fish line + length of recording)
date_exp = '_2022';% date of recording(s)               % number of experiment
figures_subfolder = 'Figures';
conversion_factor = 0.26458;       % to convert from pixels to mm
timebin=0.5;                           % Binlength(s) for calculation of velocity etc.
duration = 30;% for stimulation
%%
mkdir(folder_path_save, '\Figures');
%% Load more than one csv file
n_row_unn = 10;
all_fish = AO_aj_loadFiles_20211206(source, folder_path_save, fish_name, ...
    conversion_factor, date_exp, n_row_unn);
save([folder_path_save, filesep, fish_name, date_exp '_data.mat'], 'all_fish', '-v7.3');
%% get the grouping variables
name_group1 = 'Ablated';
name_group2 = 'Sham';
name_group3 = 'MTZ';
proper_exp = 1:28;
group1 = [];
group2 = [];
group3 = [];
for fish = 1:size(all_fish,1)
    if ismember(all_fish{fish, 1}.exp, proper_exp)
        if all_fish{fish, 1}.stability == 1 % taking only the stable ones!
            if all_fish{fish, 1}.selected == 1 % xtra
                if all_fish{fish, 1}.group == 1
                    group1 = [group1; all_fish{fish, 1}.realNum];
                elseif all_fish{fish, 1}.group == 2
                    group2 = [group2; all_fish{fish, 1}.realNum];
                elseif all_fish{fish, 1}.group == 3
                    group3 = [group3; all_fish{fish, 1}.realNum];
                end
            end
        end
    end
end
nROIs = size(all_fish, 1);
save([folder_path_save, filesep, fish_name, date_exp '_data.mat'], 'group1', 'name_group1', ...
    'group2', 'name_group2', 'group3', 'name_group3', '-append');
%% Calculate timestamp of the transition between spontaneous behavior to evoked behavior 
transitionTime = 200; % this is the baseline?
threshold = 75; % for exclusion of high and erronous tracking
%% Colormaps
if strcmp (fish_name, 'TrialDetection')
    C1 = [[0 0 0]; [1 1 0] ; [ 0.8100 0.5100 0.1700]; [1 0 0]];
end
%% Calculation - Mean velocity
all_fish = aj_velocityCalc_20211206(all_fish, timebin);
% Calculation - probability distribution of position of the fish kadir-also
% ntt maps ***
all_fish = aj_pdfPosition_AO(all_fish, duration);
clc
disp('Jo, I am done.')
toc
save([folder_path_save,filesep,fish_name, date_exp '_data.mat'], 'all_fish', '-append');
%% y positions kadir: novel tt
groups = {group1; group2; group3};
names = {name_group1; name_group2; name_group3};
n_groups = 3;
cmap_hex = ['8B0000'; '18191A'; '23395D'; 'FFA500'];
RGB = hex2rgb(cmap_hex);
cmap = RGB/255;
seperate_y = false;
combined_y_pos = AO_average_y_trace_flexibel(all_fish, n_groups, groups, names, cmap, ...
    folder_path_save, figures_subfolder, 0, 20*60, seperate_y, 0);
collected_velo = AO_average_velo_trace_felxibel(all_fish, n_groups, groups, names, cmap, ...
    folder_path_save, figures_subfolder, timebin, 0, 20*60, 0);
% heatmaps
con_fil = matfile('\\home.ansatt.ntnu.no\kadiram\Documents\MATLAB\con_esp.mat');
n_win = con_fil.n_win;
pro_win_sam_row_col = cell(n_win.ntt, n_groups);
pro_sam_row_col_win_ani = cell(n_groups, 1);
for i = 1:n_groups
    [h_fig, pro_win_sam_row_col(:, i), pro_sam_row_col_win_ani{i}] = ...
        AO_ploting_noveltank_heatmaps_over_fish(all_fish, groups{i}, names{i});
end
save([folder_path_save,filesep,fish_name, date_exp '_data.mat'], 'pro_win_sam_row_col', ...
    'pro_sam_row_col_win_ani', '-append');
%% Y position change averaged over the trials and fish
baseline_sec = 2; % in s % kadir !!!!!!!!!!!!!!!!!!
% kadir: individual plots before
[~, change_yposition_1, marker_stim, stim_times, yposition_1] = AO_plot_ypos_average_and_change...
    (all_fish, duration, group1, name_group1, folder_path_save, figures_subfolder, 0, baseline_sec);
x_values = 1:size(change_yposition_1,1);
x_values = x_values/15;
[~, change_yposition_2, ~, ~, yposition_2] = AO_plot_ypos_average_and_change(all_fish, duration, ...
    group2, name_group2, folder_path_save, figures_subfolder, 0, baseline_sec);
[~, change_yposition_3, ~, ~, yposition_3] = AO_plot_ypos_average_and_change(all_fish, duration, ...
    group3, name_group3, folder_path_save, figures_subfolder, 0, baseline_sec);
save([folder_path_save, filesep, fish_name, date_exp '_data.mat'], 'x_values', ...
    'change_yposition_1', 'change_yposition_2', 'change_yposition_3', 'yposition_1', ...
    'yposition_2', 'yposition_3', 'stim_times', '-append');
% combined in one for the change % kadir: ave plot - tog
y_lab = 'Change in Y Pos';
plo_tog(all_fish, baseline_sec, marker_stim, x_values, group1, group2, group3, ...
    change_yposition_1, change_yposition_2, change_yposition_3, name_group1, name_group2, ...
    name_group3, y_lab);
exp_fig(gcf, fullfile(folder_path_save, figures_subfolder, 'Change_ypos_per_group_tog.png'));
%
y_lab = 'Absolute Change in Y Pos';
plo_tog(all_fish, baseline_sec, marker_stim, x_values, group1, group2, group3, ...
    per_ful_wav_rec(change_yposition_1), per_ful_wav_rec(change_yposition_2), ...
    per_ful_wav_rec(change_yposition_3), name_group1, name_group2, name_group3, y_lab);
saveas(gcf, fullfile(folder_path_save, figures_subfolder, 'Absolute_Change_ypos_per_group_tog.png'));
%
y_lab = 'Y Pos';
plo_tog(all_fish, baseline_sec, marker_stim, x_values, group1, group2, group3, ...
    yposition_1, yposition_2, yposition_3, name_group1, name_group2, name_group3, y_lab);
saveas(gcf, fullfile(folder_path_save, figures_subfolder, 'ypos_per_group_tog.png'));
%% Speed change avg over trials and fish
[collected_velo_1,change_velo_1, collected_stim] = AO_plot_velo_average_and_change(all_fish, ...
    group1,name_group1, duration, timebin, folder_path_save, figures_subfolder,0);
x_values_velo = 1:size(change_velo_1, 1);
[collected_velo_2,change_velo_2, collected_stim] = AO_plot_velo_average_and_change(all_fish, ...
    group2,name_group2, duration, timebin, folder_path_save, figures_subfolder,0);
[collected_velo_3,change_velo_3, collected_stim] = AO_plot_velo_average_and_change(all_fish, ...
    group3,name_group3, duration, timebin, folder_path_save, figures_subfolder,0);
save([folder_path_save, filesep, fish_name, date_exp '_data.mat'], 'x_values_velo', ...
    'change_velo_1', 'change_velo_2', 'change_velo_3', '-append');
y_lab = [num2str(timebin) ' s binned velo change'];
plo_spe(all_fish, x_values_velo, group1, group2, group3, change_velo_1, change_velo_2, ...
    change_velo_3, name_group1, name_group2, name_group3, y_lab);
saveas(gcf, fullfile(folder_path_save, figures_subfolder, 'Velo_change_0_5s_per_group_tog.png'))
%
y_lab = [num2str(timebin) ' s binned velo'];
plo_spe(all_fish, x_values_velo, group1, group2, group3, collected_velo_1, collected_velo_2, ...
    collected_velo_3, name_group1, name_group2, name_group3, y_lab);
saveas(gcf, fullfile(folder_path_save, figures_subfolder, 'Velo_0_5s_per_group_tog.png'))
%% Now I want the change for each stim of Vib seperately
% but now I only want to plot the 5s before and 30 s after right?
fig
x_values = 1:size(change_yposition_1,1);
start = 375; % make this not declared haha % kadir: 25 s, then 5s left.
labels = all_fish{group1(1), 1}.stimInfo(find(~contains(all_fish{group1(1), 1}.stimInfo, ...
    "VIB_0")));
type_labels = unique(labels);
for current_stim_ind = 1:15
    addition = 600*(current_stim_ind - 1); 
    H1=shadedErrorBar(x_values(start:end)+addition, squeeze(nanmean(nanmean(change_yposition_1...
        (start:end,:,current_stim_ind),3),2)),squeeze(nanstd(nanmean(change_yposition_1...
        (start:end,:,current_stim_ind),3),0,2)/sqrt(size(group1,1))), 'lineProps','r');
    H1.mainLine.LineWidth = 1;
    H1.mainLine.Color = '#8B0000';
    H1.patch.FaceColor = '#8B0000';
    hold on
    H2=shadedErrorBar(x_values(start:end)+addition, squeeze(nanmean(nanmean(change_yposition_3...
        (start:end,:,current_stim_ind),3),2)),squeeze(nanstd(nanmean(change_yposition_3...
        (start:end,:,current_stim_ind),3),0,2)/sqrt(size(group3,1))), 'lineProps','b');
    H2.mainLine.LineWidth = 1;
    H2.mainLine.Color = '#02055A';
    H2.patch.FaceColor = '#02055A';
    H3=shadedErrorBar(x_values(start:end)+addition, squeeze(nanmean(nanmean(change_yposition_2...
        (start:end,:,current_stim_ind),3),2)),squeeze(nanstd(nanmean(change_yposition_2...
        (start:end,:,current_stim_ind),3),0,2)/sqrt(size(group2,1))), 'lineProps','k');
    H3.mainLine.LineWidth = 1;
    xline(marker_stim+addition, 'Color', 'b')
end
hold off
ylabel(['Change in Y Pos'])
xlabel('Time in frames')
hold off
legend([H1.mainLine H3.mainLine H2.mainLine], {name_group1, name_group2, name_group3})
saveas(gcf, fullfile(folder_path_save, figures_subfolder, ...
    ['Y_posCHANGE_pergroup_single_stim_noHET.png']));
saveas(gcf, fullfile(folder_path_save, figures_subfolder, ...
    ['Y_posCHANGE_pergroup_single_stim_noHET.fig']));
%%
function plo_tog(all_fish, baseline_sec, marker_stim, x_values, group1, group2, group3, ...
    change_yposition_1, change_yposition_2, change_yposition_3, name_group1, name_group2, ...
    name_group3, y_lab)
fig
H1=shadedErrorBar(x_values, squeeze(nanmean(nanmean(change_yposition_1(:,:,:),...
    3),2)),squeeze(nanstd(nanmean(change_yposition_1(:,:,:),3),0,2)/sqrt(size...
    (group1,1))), 'lineProps','r');% kadir
H1.mainLine.Color = '#8B0000';% kadir
H1.patch.FaceColor = '#8B0000';% kadir
H1.mainLine.LineWidth = 1;
hold on
H3=shadedErrorBar(x_values, squeeze(nanmean(nanmean(change_yposition_2(:,:,:),...
    3),2)),squeeze(nanstd(nanmean(change_yposition_2(:,:,:),3),0,2)/sqrt(size...
    (group2,1))), 'lineProps','k');% kadir
H3.mainLine.LineWidth = 1;
hold on
H=shadedErrorBar(x_values, squeeze(nanmean(nanmean(change_yposition_3(:,:,:),...
    3),2)),squeeze(nanstd(nanmean(change_yposition_3(:,:,:),3),0,2)/sqrt(size...
    (group3,1))), 'lineProps','b');% kadir
H.mainLine.LineWidth = 1;
%
xline(marker_stim/15, 'Color', 'b' )
hold off
%ylim([-14 6])% kadir
xlim([30 - baseline_sec 60])% kadir
%
labels = all_fish{group1(1), 1}.stimInfo(find(~contains(all_fish{group1(1), 1}.stimInfo, "VIB_0")));
ylabel(y_lab)
xlabel('Time in s')
hold off
legend([H1.mainLine H3.mainLine H.mainLine], {name_group1, name_group2, name_group3})
end

function plo_spe(all_fish, x_values_velo, group1, group2, group3, change_velo_1, ...
    change_velo_2, change_velo_3, name_group1, name_group2, name_group3, y_lab)
fig
H1=shadedErrorBar(x_values_velo, squeeze(nanmean(nanmean(change_velo_1...
    (:,:,:),3),2)),squeeze(nanstd(nanmean(change_velo_1...
    (:,:,:),3),0,2)/sqrt(size(group1,1))), 'lineProps','r');%kadir!
H1.mainLine.Color = '#8B0000';
H1.patch.FaceColor = '#8B0000';
H1.mainLine.LineWidth = 1;
hold on
H3=shadedErrorBar(x_values_velo, squeeze(nanmean(nanmean(change_velo_2...
    (:,:,:),3),2)),squeeze(nanstd(nanmean(change_velo_2...
    (:,:,:),3),0,2)/sqrt(size(group2,1))), 'lineProps','k');
H3.mainLine.LineWidth = 1;
hold on
H = shadedErrorBar(x_values_velo, squeeze(nanmean(nanmean(change_velo_3...
    (:,:,:),3),2)),squeeze(nanstd(nanmean(change_velo_3...
    (:,:,:),3),0,2)/sqrt(size(group3,1))), 'lineProps','b');
H.mainLine.LineWidth = 1;
%
xline(60, 'Color', 'b' )
hold off
xlim([53 90])
labels = all_fish{group1(1), 1}.stimInfo(find(~contains(all_fish{group1(1), 1}.stimInfo, "VIB_0")));
type_labels = unique(labels);
ylabel(y_lab)
hold off
legend([H1.mainLine H3.mainLine H.mainLine], {name_group1, name_group2, name_group3})
end
