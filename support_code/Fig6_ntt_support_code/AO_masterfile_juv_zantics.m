%% Masterfile 6 Arena Zantics
%
%   Author: Anna Maria Ostenrath
%   Date : April 2022	

%% Variables to be adjusted for each recording
%%%%% YOUR DATA HERE
source='W:\bramse\Zantiks_Experiments\CPPG_Trials\CPPG_1mM\';               % folder where data for experiment is found
folder_path_save=['W:\bramse\Zantiks_Experiments\CPPG_Trials\CPPG_1mM\'];   % folder for saving .mat file with analyzed data
fish_name='CPPG_Trials_1mM';                                                % name of dataset (e.g. name of fish line + length of recording)
date_exp='_2022';                                                           % date of recording(s)                                                                 % number of experiment

table_path = dir(fullfile(source, '*new.xlsx'));                               % information tabel about the experiments
T = readtable(fullfile(source,table_path(1).name));
%% Constant variables
mkdir(folder_path_save,'\Figures');                                         % makes a 'Figures' directory under the 'folder_path' directory (gets error message if already exists)
figures_subfolder='Figures';
conversion_factor=0.26458;                                                  % to convert from pixels to mm
timebin=0.5;                                                                % Binlength(s) for calculation of velocity etc.

%% Loading or creating the dataset
% locate if data file already exists
data_file = dir([source filesep '*data.mat']);
if isfile(fullfile(source, data_file(1).name))
    % then we check if all the experiments are loaded by checking the exp
    % number that we can find in the table and as a folder 
    uniq_exp = unique(T.Exp);
    % now we check how many folders and if they overlap with the experiment
    % number 
    folders = dir(fullfile(source, '*_Exp*'));
    not_included = [];
    for folder = 1:size(folders,1)
        if folder < 10
            exp_no = str2num(folders(folder).name(end)); 
            if ~ismember(exp_no, uniq_exp)
                not_included = [not_included, exp_no];
            end
        else
            exp_no = str2num(folders(folder).name(end-1:end));
            if ~ismember(exp_no, uniq_exp)
                not_included = [not_included, exp_no];
            end
        end
    end
    if ~isempty(not_included)
        load(fullfile(source, data_file(1).name))
        all_fish = AO_loadLeftOverFiles(all_fish, source, timebin, folder_path_save, fish_name,conversion_factor,date_exp, not_included)
    else
        load(fullfile(source, data_file(1).name))
    end
    
else
    all_fish = AO_loadAllFiles(source, timebin, folder_path_save,...
             fish_name,conversion_factor,date_exp);
end

%%%%%%%%%%%ISSUE
% fish need to be organised according to their real number so if you forgot
% to load experiment 11 but you are already at exp 25 that will be an issue
% 
%% Seperate the animals into groups
%%%%%%%%% Adjust this to your experiments! 
% Example according to genotype with 3 groups
% mGluR example

% you might need to add the select column in both the Table and the loading
% function
name_group1 = 'Wild Type'; 
name_group2 = 'Heterozygous';
name_group3 = 'Homozygous'; 

proper_exp = 6:26; 
group1 = []; %find(T.Group == 1); 
group2 = []; %find(T.Group == 2);
group3 = []; %find(T.Group == 3);
for fish = 1: size(all_fish,1)
    if ismember(all_fish{fish, 1}.exp, proper_exp)
        if all_fish{fish, 1}.stability == 1
%             if all_fish{fish, 1}.selected == 1
                if all_fish{fish, 1}.group == 1
                    group1 = [group1; all_fish{fish, 1}.realNum];
                elseif all_fish{fish, 1}.group == 2
                    group2 = [group2; all_fish{fish, 1}.realNum];
                elseif all_fish{fish, 1}.group == 3
                    group3 = [group3; all_fish{fish, 1}.realNum];
                end
%             end
        end
    end
end

%% Example with 2 Groups
% you might need to add the select column in both the Table and the loading
% function
name_group1 = 'Placebo'; 

name_group2 = 'CPPG'; 

group1 = []; %find(T.Group == 1); 

group2 = []; %find(T.Group == 3);

for fish = 1: size(all_fish,1)
    
    if all_fish{fish, 1}.stability == 1
        
        if all_fish{fish, 1}.group == 1
            if all_fish{fish, 1}.selected==1
                group2 = [group2; all_fish{fish, 1}.realNum];
            end
        elseif all_fish{fish, 1}.group == 2
            if all_fish{fish, 1}.selected==1
                group1 = [group1; all_fish{fish, 1}.realNum];
            end
        end
        
    end
    
end
nROIs = size(all_fish,1);

%% Tph2 example
name_group1 = 'Placebo'; 

name_group2 = 'Ablated'; 

group1 = []; %find(T.Group == 1); 

group2 = []; %find(T.Group == 3);

for fish = 1: size(all_fish,1)
    
    if all_fish{fish, 1}.stability == 1
        
        if all_fish{fish, 1}.group == 1
%             if all_fish{fish, 1}.selected==1
                group2 = [group2; all_fish{fish, 1}.realNum];
%             end
        elseif all_fish{fish, 1}.group == 2
%             if all_fish{fish, 1}.selected==1
                group1 = [group1; all_fish{fish, 1}.realNum];
%             end
        end
        
    end
    
end
nROIs = size(all_fish,1);
%% Novel tank
% select and unselect the groups that you are using 
single_plotting = 0;

AO_ploting_noveltank_heatmaps_over_fish(all_fish, group1, name_group1, folder_path_save, figures_subfolder, single_plotting)
AO_ploting_noveltank_heatmaps_over_fish(all_fish, group2, name_group2, folder_path_save, figures_subfolder, single_plotting)
% AO_ploting_noveltank_heatmaps_over_fish(all_fish, group3, name_group3, folder_path_save, figures_subfolder, single_plotting)
% AO_ploting_noveltank_heatmaps_over_fish(all_fish, group4, name_group4, folder_path_save, figures_subfolder, single_plotting)

% y traces and velo
% groups = {group1; group2; group3; group4}; 
% names = {name_group1; name_group2; name_group3; name_group4}; 
% n_groups = 4; 

% groups = {group1; group2; group3}; 
% names = {name_group1; name_group2; name_group3}; 
% n_groups = 3;

groups = {group1; group2}; 
names = {name_group1;  name_group2}; 
n_groups = 2;
% cmap_hex = ['18191A'; '23395D'; '8B0000'; 'FFA500']; 
% 
% RGB = hex2rgb(cmap_hex);
% cmap = RGB/255;
% cmap = ['#18191A'; '#23395D'; '#8B0000'; '#FFA500']; 
cmap = ['#18191A'; '#8B0000']; 

combined_y_pos = AO_average_y_trace_flexibel(all_fish, n_groups, groups, names, cmap, folder_path_save, figures_subfolder, 1,20*60, 0, 0);
[collected_velo] = AO_average_velo_trace_felxibel(all_fish, n_groups, groups, names, cmap, folder_path_save, figures_subfolder, timebin, 1,20*60, 0);


combined_y_pos = AO_average_y_trace_flexibel(all_fish, n_groups, groups, names, cmap, folder_path_save, figures_subfolder, 1200,3900, 0, 1);
[collected_velo] = AO_average_velo_trace_felxibel(all_fish, n_groups, groups, names, cmap, folder_path_save, figures_subfolder, timebin, 1,3900, 1);

%% Plotting 
% for  y traces for each fish seperately % for  velo each fish
% not necessary but if you wanna look at the individual fish... runs a long
% time
timebin=0.5;
% to do change this that it can do all the time bins.. 
% to do change that it only loops over the fish in the group and not all
% the fish because it takes so fucking long
AO_plot_vel_y_x_per_group(all_fish, nROIs, timebin, group1, name_group1, 1)
% saveas(gcf, fullfile(folder_path_save, figures_subfolder, name_group1, [name_group1,'_velo_binned_', num2str(timebin) ,'s_over_time_per_fish.png'])); 
% close;  
% saveas(gcf, fullfile(folder_path_save, figures_subfolder, name_group1, [name_group1,'_ypos_over_time_per_fish.png']));
% close; 

AO_plot_vel_y_x_per_group(all_fish, nROIs, timebin, group2, name_group2, 1)
% saveas(gcf, fullfile(folder_path_save, figures_subfolder, name_group2, [name_group2,'_velo_binned_', num2str(timebin) ,'s_over_time_per_fish.png'])); 
% close;  
% saveas(gcf, fullfile(folder_path_save, figures_subfolder, name_group2, [name_group2,'_ypos_over_time_per_fish.png']));
% close; 

AO_plot_vel_y_x_per_group(all_fish, nROIs, timebin, group3, name_group3, 1)
% saveas(gcf, fullfile(folder_path_save, figures_subfolder, name_group3, [name_group3,'_velo_binned_', num2str(timebin) ,'s_over_time_per_fish.png'])); 
% close;  
% saveas(gcf, fullfile(folder_path_save, figures_subfolder, name_group3, [name_group3,'_ypos_over_time_per_fish.png']));
% close; 

AO_plot_vel_y_x_per_group(all_fish, nROIs, timebin, group4, name_group4, 1)
% saveas(gcf, fullfile(folder_path_save, figures_subfolder, name_group4, [name_group4,'_velo_binned_', num2str(timebin) ,'s_over_time_per_fish.png'])); 
% close;  
% saveas(gcf, fullfile(folder_path_save, figures_subfolder, name_group4, [name_group4,'_ypos_over_time_per_fish.png']));
% close; 
% average y traces over group


%% Y position change averaged over the trials and fish 
duration = 30;

[collected_yposition_1,change_yposition_1, marker_stim] = AO_plot_ypos_average_and_change(all_fish, duration, group1, name_group1, folder_path_save, figures_subfolder, 0);

[collected_yposition_2,change_yposition_2, ~] = AO_plot_ypos_average_and_change(all_fish, duration, group2, name_group2, folder_path_save, figures_subfolder, 0);

[collected_yposition_3,change_yposition_3, marker_stim] = AO_plot_ypos_average_and_change(all_fish, duration, group3, name_group3, folder_path_save, figures_subfolder, 0);

[collected_yposition_4,change_yposition_4, marker_stim] = AO_plot_ypos_average_and_change(all_fish, duration, group4, name_group4, folder_path_save, figures_subfolder, 0);


% combined in one for the change
figure('units','centimeters','Position',[2 2 20 8])
stim_types = unique(all_fish{group1(1), 1}.stimInfo); 
stim_types = stim_types(2:end);
stim_types_indice = all_fish{group1(1), 1}.stimInfo(find(~contains(all_fish{group1(1), 1}.stimInfo, "VIB_0"))); % this is now the stimuli times for the specific stimulus 

x_values = 1:size(change_yposition_1,1); 
x_values = x_values/15; 
labels = all_fish{group1(1), 1}.stimInfo(find(~contains(all_fish{group1(1), 1}.stimInfo, "VIB_0")));%unique(all_fish{1, 1}.stimInfo);
type_labels = unique(labels);
% uncomment if you have more groups than two and change the group names
% etc... 
for stim = 1:length(stim_types)
    current_stim_ind = find(stim_types_indice == stim_types(stim)); 
    subplot(1,3,stim)
    H1=shadedErrorBar(x_values, squeeze(nanmean(nanmean(change_yposition_1(:,:,current_stim_ind),3),2)),squeeze(nanstd(nanmean(change_yposition_1(:,:,current_stim_ind),3),0,2)/sqrt(size(group1,1))), 'lineProps','k');
%     current_stim_index = find(all_fish{1,1}.t >= stim_times(stim))
    H1.mainLine.LineWidth = 1; 
    hold on
%     H2=shadedErrorBar(x_values, squeeze(nanmean(nanmean(change_yposition_3(:,:,current_stim_ind),3),2)),squeeze(nanstd(nanmean(change_yposition_3(:,:,current_stim_ind),3),0,2)/sqrt(size(group3,1))), 'lineProps','r');
%     H2.mainLine.Color = '#8B0000';
%     H2.patch.FaceColor = '#8B0000'; 
%     H2.mainLine.LineWidth = 1; 
    H3=shadedErrorBar(x_values, squeeze(nanmean(nanmean(change_yposition_2(:,:,current_stim_ind),3),2)),squeeze(nanstd(nanmean(change_yposition_2(:,:,current_stim_ind),3),0,2)/sqrt(size(group2,1))), 'lineProps','r');
%     H3.mainLine.Color = '#02055A';
%     H3.patch.FaceColor = '#02055A'; 
%     H3.mainLine.LineWidth = 1; 
    H3.mainLine.Color = '#8B0000';
    H3.patch.FaceColor = '#8B0000'; 
    H3.mainLine.LineWidth = 1;
%     H4=shadedErrorBar(x_values, squeeze(nanmean(nanmean(change_yposition_4(:,:,current_stim_ind),3),2)),squeeze(nanstd(nanmean(change_yposition_4(:,:,current_stim_ind),3),0,2)/sqrt(size(group4,1))), 'lineProps','r');
%     H4.mainLine.Color = '#FFA500';
%     H4.patch.FaceColor = '#FFA500'; 
%     H4.mainLine.LineWidth = 1; 
%     H2.edge.Color = '#8B0000';
    xline(marker_stim/15, 'Color', 'b' )
%     for stimu = 1:length(current_stim_ind)
%         plot(nanmean(collected_velo(:,:,current_stim_ind(stimu)),2))
%     end
    hold off
    ylim([-10 6])
    xlim([25 60])
    title([type_labels(stim)])
    ylabel(['Change in Y Pos'])
    xlabel('Time in s')
    hold off
%     legend([H1.mainLine H2.mainLine H3.mainLine H4.mainLine], {name_group1, name_group3, name_group2, name_group4})
    legend([H1.mainLine H3.mainLine ], {name_group1, name_group2})

end
saveas(gcf, fullfile(folder_path_save, figures_subfolder, ['Change_ypos_per_group.png'])); 
close;  

% combined in one for y position
figure('units','centimeters','Position',[2 2 20 8])
stim_types = unique(all_fish{group1(1), 1}.stimInfo); 
stim_types = stim_types(2:end);
stim_types_indice = all_fish{group1(1), 1}.stimInfo(find(~contains(all_fish{group1(1), 1}.stimInfo, "VIB_0"))); % this is now the stimuli times for the specific stimulus 

x_values = 1:size(collected_yposition_1,1); 
x_values = x_values/15; 
labels = all_fish{group1(1), 1}.stimInfo(find(~contains(all_fish{group1(1), 1}.stimInfo, "VIB_0")));%unique(all_fish{1, 1}.stimInfo);
type_labels = unique(labels);
%
for stim = 1:length(stim_types)
    current_stim_ind = find(stim_types_indice == stim_types(stim)); 
    subplot(1,3,stim)
    H1=shadedErrorBar(x_values, squeeze(nanmean(nanmean(collected_yposition_1(:,:,current_stim_ind),3),2)),squeeze(nanstd(nanmean(collected_yposition_1(:,:,current_stim_ind),3),0,2)/sqrt(size(group1,1))), 'lineProps','k');
%     current_stim_index = find(all_fish{1,1}.t >= stim_times(stim))
    H1.mainLine.LineWidth = 1; 
    hold on
%     H2=shadedErrorBar(x_values, squeeze(nanmean(nanmean(collected_yposition_3(:,:,current_stim_ind),3),2)),squeeze(nanstd(nanmean(collected_yposition_3(:,:,current_stim_ind),3),0,2)/sqrt(size(group3,1))), 'lineProps','r');
%     H2.mainLine.Color = '#8B0000';
%     H2.patch.FaceColor = '#8B0000'; 
%     H2.mainLine.LineWidth = 1; 
    H3=shadedErrorBar(x_values, squeeze(nanmean(nanmean(collected_yposition_2(:,:,current_stim_ind),3),2)),squeeze(nanstd(nanmean(collected_yposition_2(:,:,current_stim_ind),3),0,2)/sqrt(size(group2,1))), 'lineProps','r');
%     H3.mainLine.Color = '#02055A';
%     H3.patch.FaceColor = '#02055A';
%     H3.mainLine.LineWidth = 1; 
    H3.mainLine.Color = '#8B0000';
    H3.patch.FaceColor = '#8B0000'; 
    H3.mainLine.LineWidth = 1; 
%     H4=shadedErrorBar(x_values, squeeze(nanmean(nanmean(collected_yposition_4(:,:,current_stim_ind),3),2)),squeeze(nanstd(nanmean(collected_yposition_4(:,:,current_stim_ind),3),0,2)/sqrt(size(group4,1))), 'lineProps','r');
%     H4.mainLine.Color = '#FFA500';
%     H4.patch.FaceColor = '#FFA500'; 
%     H4.mainLine.LineWidth = 1; 
%     H2.edge.Color = '#8B0000';
    xline(marker_stim/15, 'Color', 'b' )
%     for stimu = 1:length(current_stim_ind)
%         plot(nanmean(collected_velo(:,:,current_stim_ind(stimu)),2))
%     end
    hold off
    ylim([-70 -20])
%     xlim([400 900])
    title([type_labels(stim)])
    xlabel('Time in s')
    ylabel(['Y Pos in mm'])
    hold off
    %     legend([H1.mainLine H2.mainLine H3.mainLine H4.mainLine], {name_group1, name_group3, name_group2, name_group4})
    legend([H1.mainLine H3.mainLine ], {name_group1, name_group2})

end
saveas(gcf, fullfile(folder_path_save, figures_subfolder, ['Ypos_per_group.png'])); 
close; 
%% Speed change avg over trials and fish
duration = 30;
timebin = 0.5;
[collected_velo_1,change_velo_1, collected_stim] = AO_plot_velo_average_and_change(all_fish, group1,name_group1, duration, timebin, folder_path_save, figures_subfolder,0);% avg traces for each group for y and velo

[collected_velo_2,change_velo_2, collected_stim] = AO_plot_velo_average_and_change(all_fish, group2,name_group2, duration, timebin, folder_path_save, figures_subfolder,0);% avg traces for each group for y and velo

[collected_velo_3,change_velo_3, collected_stim] = AO_plot_velo_average_and_change(all_fish, group3,name_group3, duration, timebin, folder_path_save, figures_subfolder,0);% avg traces for each group for y and velo


[collected_velo_4,change_velo_4, collected_stim] = AO_plot_velo_average_and_change(all_fish, group4,name_group4, duration, timebin, folder_path_save, figures_subfolder,0);% avg traces for each group for y and velo

% [collected_yposition_1,change_yposition_1, marker_stim] = AO_plot_ypos_average_and_change(all_fish, duration, group1, name_group1, folder_path_save, figures_subfolder, 1);
% 
% [collected_yposition_2,change_yposition_2, marker_stim] = AO_plot_ypos_average_and_change(all_fish, duration, group2, name_group2, folder_path_save, figures_subfolder, 1);
% 
% [collected_yposition_3,change_yposition_3, marker_stim] = AO_plot_ypos_average_and_change(all_fish, duration, group3, name_group3, folder_path_save, figures_subfolder, 1);

% combined in one 
figure('units','centimeters','Position',[2 2 20 8])
stim_types = unique(all_fish{group1(1), 1}.stimInfo); 
stim_types = stim_types(2:end);
stim_types_indice = all_fish{group1(1), 1}.stimInfo(find(~contains(all_fish{group1(1), 1}.stimInfo, "VIB_0"))); % this is now the stimuli times for the specific stimulus 

x_values = 1:size(change_velo_1,1); 
labels = all_fish{group1(1), 1}.stimInfo(find(~contains(all_fish{group1(1), 1}.stimInfo, "VIB_0")));%unique(all_fish{1, 1}.stimInfo);
type_labels = unique(labels);
%
for stim = 1:length(stim_types)
    current_stim_ind = find(stim_types_indice == stim_types(stim)); 
    subplot(3,1,stim)
    H1=shadedErrorBar(x_values, squeeze(nanmean(nanmean(change_velo_1(:,:,current_stim_ind),3),2)),squeeze(nanstd(nanmean(change_velo_1(:,:,current_stim_ind),3),0,2)/sqrt(size(group1,1))), 'lineProps','k');
%     current_stim_index = find(all_fish{1,1}.t >= stim_times(stim))
    H1.mainLine.LineWidth = 1; 
    hold on
%     H2=shadedErrorBar(x_values, squeeze(nanmean(nanmean(change_velo_3(:,:,current_stim_ind),3),2)),squeeze(nanstd(nanmean(change_velo_3(:,:,current_stim_ind),3),0,2)/sqrt(size(group3,1))), 'lineProps','r');
%     H2.mainLine.Color = '#8B0000';
%     H2.patch.FaceColor = '#8B0000'; 
%     H2.mainLine.LineWidth = 1; 
    H3=shadedErrorBar(x_values, squeeze(nanmean(nanmean(change_velo_2(:,:,current_stim_ind),3),2)),squeeze(nanstd(nanmean(change_velo_2(:,:,current_stim_ind),3),0,2)/sqrt(size(group2,1))), 'lineProps','r');
%     H3.mainLine.Color = '#02055A';
%     H3.patch.FaceColor = '#02055A'; 
%     H3.mainLine.LineWidth = 1; 
    H3.mainLine.Color = '#8B0000';
    H3.patch.FaceColor = '#8B0000'; 
    H3.mainLine.LineWidth = 1; 
%     H4=shadedErrorBar(x_values, squeeze(nanmean(nanmean(change_velo_4(:,:,current_stim_ind),3),2)),squeeze(nanstd(nanmean(change_velo_4(:,:,current_stim_ind),3),0,2)/sqrt(size(group4,1))), 'lineProps','r');
%     H4.mainLine.Color = '#FFA500';
%     H4.patch.FaceColor = '#FFA500'; 
%     H4.mainLine.LineWidth = 1; 
%     H2.edge.Color = '#8B0000';
    xline(collected_stim(stim), 'Color', 'b' )
%     for stimu = 1:length(current_stim_ind)
%         plot(nanmean(collected_velo(:,:,current_stim_ind(stimu)),2))
%     end
    hold off
%     ylim([-0.5 1.5])
    xlim([52 90])
%     xlim([28 40])
%     xlim([13 20])
    title([type_labels(stim)])
    ylabel([num2str(timebin) ' s binned velo change']) %ylabel(['0.5 s binned velo ']) %ylabel([int2str(timebin) ' s binned velo '])
    hold off
      %     legend([H1.mainLine H2.mainLine H3.mainLine H4.mainLine], {name_group1, name_group3, name_group2, name_group4})
    legend([H1.mainLine H3.mainLine ], {name_group1, name_group2})

end
saveas(gcf, fullfile(folder_path_save, figures_subfolder, ['Velo_change_0_5s_per_group.png'])); 
% saveas(gcf, fullfile(folder_path_save, figures_subfolder, ['Velo_change_1s_per_group.png']));  
% saveas(gcf, fullfile(folder_path_save, figures_subfolder, ['Velo_change_2s_per_group.png'])); 



% combined in one the actual velo
figure('units','centimeters','Position',[2 2 20 8])
stim_types = unique(all_fish{group1(1), 1}.stimInfo); 
stim_types = stim_types(2:end);
stim_types_indice = all_fish{group1(1), 1}.stimInfo(find(~contains(all_fish{group1(1), 1}.stimInfo, "VIB_0"))); % this is now the stimuli times for the specific stimulus 

x_values = 1:size(collected_velo_1,1); 
labels = all_fish{group1(1), 1}.stimInfo(find(~contains(all_fish{group1(1), 1}.stimInfo, "VIB_0")));%unique(all_fish{1, 1}.stimInfo);
type_labels = unique(labels);
%
for stim = 1:length(stim_types)
    current_stim_ind = find(stim_types_indice == stim_types(stim)); 
    subplot(3,1,stim)
    H1=shadedErrorBar(x_values, squeeze(nanmean(nanmean(collected_velo_1(:,:,current_stim_ind),3),2)),squeeze(nanstd(nanmean(collected_velo_1(:,:,current_stim_ind),3),0,2)/sqrt(size(group1,1))), 'lineProps','k');
%     current_stim_index = find(all_fish{1,1}.t >= stim_times(stim))
    H1.mainLine.LineWidth = 1; 
    hold on
%     H2=shadedErrorBar(x_values, squeeze(nanmean(nanmean(collected_velo_3(:,:,current_stim_ind),3),2)),squeeze(nanstd(nanmean(collected_velo_3(:,:,current_stim_ind),3),0,2)/sqrt(size(group3,1))), 'lineProps','r');
%     H2.mainLine.Color = '#8B0000';
%     H2.patch.FaceColor = '#8B0000'; 
%     H2.mainLine.LineWidth = 1; 
    H3=shadedErrorBar(x_values, squeeze(nanmean(nanmean(collected_velo_2(:,:,current_stim_ind),3),2)),squeeze(nanstd(nanmean(collected_velo_2(:,:,current_stim_ind),3),0,2)/sqrt(size(group2,1))), 'lineProps','r');
    H3.mainLine.Color = '#8B0000';
    H3.patch.FaceColor = '#8B0000'; 
    H3.mainLine.LineWidth = 1; 
    %     H3.mainLine.Color = '#02055A';
%     H3.patch.FaceColor = '#02055A'; 
%     H3.mainLine.LineWidth = 1; 
%     H4=shadedErrorBar(x_values, squeeze(nanmean(nanmean(collected_velo_4(:,:,current_stim_ind),3),2)),squeeze(nanstd(nanmean(collected_velo_4(:,:,current_stim_ind),3),0,2)/sqrt(size(group4,1))), 'lineProps','r');
%     H4.mainLine.Color = '#FFA500';
%     H4.patch.FaceColor = '#FFA500'; 
%     H4.mainLine.LineWidth = 1; 
%     H2.edge.Color = '#8B0000';
    xline(collected_stim(stim), 'Color', 'b' )
%     for stimu = 1:length(current_stim_ind)
%         plot(nanmean(collected_velo(:,:,current_stim_ind(stimu)),2))
%     end
    hold off
    ylim([0 5])
% %     xlim([52 90])
% %     xlim([28 40])
%     xlim([13 20])
    title([type_labels(stim)])
    ylabel([num2str(timebin) ' s binned velo']) %ylabel(['0.5 s binned velo ']) %ylabel([int2str(timebin) ' s binned velo '])
    hold off
    %     legend([H1.mainLine H2.mainLine H3.mainLine H4.mainLine], {name_group1, name_group3, name_group2, name_group4})
    legend([H1.mainLine H3.mainLine ], {name_group1, name_group2})

end
saveas(gcf, fullfile(folder_path_save, figures_subfolder, ['Velo_0_5s_per_group.png'])); 
% saveas(gcf, fullfile(folder_path_save, figures_subfolder, ['Velo_1s_per_group.png']));  
% saveas(gcf, fullfile(folder_path_save, figures_subfolder, ['Velo_2s_per_group.png'])); 
% probability of response using velo ? 

%% Heatmaps
%  AO_ploting_heatmaps_over_fish(all_fish, group1, name_group1)
AO_ploting_heatmaps_over_fish(all_fish, group1, name_group1, folder_path_save, figures_subfolder)
AO_ploting_heatmaps_over_fish(all_fish, group2, name_group2, folder_path_save, figures_subfolder)
AO_ploting_heatmaps_over_fish(all_fish, group3, name_group3, folder_path_save, figures_subfolder)


