%% Masterfile Zantics Codes
% AO_masterfile_zantiks_setup
%   Author: Anna Maria Ostenrath
%   Date : April 2022	

%% Variables to be adjusted for each recording
%%%%% mGluR
% source='W:\bramse\Zantiks_Experiments\mGluR6a_Vibration\'; %folder where data for experiment is found
% folder_path_save=['X:\anna\Data\Analysis\mGluR\Zantics_Behaviour\']; %folder for saving .mat file with analyzed data
% fish_name='mGluR6a_Vibration';                                       % name of dataset (e.g. name of fish line + length of recording)
% date_exp='_2022';                                                    % date of recording(s)                                                                 % number of experiment
% 
% table_path = dir(fullfile(source, '*.xlsx'));                        % information tabel about the experiments
% T = readtable(fullfile(source,table_path(1).name));
%%%% CPPG
% source='W:\bramse\Zantiks_Experiments\CPPG_Trials\'; %folder where data for experiment is found
% folder_path_save=['W:\bramse\Zantiks_Experiments\CPPG_Trials\']; %folder for saving .mat file with analyzed data
% fish_name='CPPG_Trials';                                       % name of dataset (e.g. name of fish line + length of recording)
% date_exp='_2022';                                                    % date of recording(s)                                                                 % number of experiment
% 
% table_path = dir(fullfile(source, '*.xlsx'));                        % information tabel about the experiments
% T = readtable(fullfile(source,table_path(1).name));
%%%%% mGluR trials
% source='W:\bramse\Zantiks_Experiments\Trial_Vibration_mGluR6a\'; %folder where data for experiment is found
% folder_path_save=['W:\bramse\Zantiks_Experiments\Trial_Vibration_mGluR6a\']; %folder for saving .mat file with analyzed data
% fish_name='mGluR6a_Vibration';                                       % name of dataset (e.g. name of fish line + length of recording)
% date_exp='_2022';                                                    % date of recording(s)                                                                 % number of experiment
% 
% table_path = dir(fullfile(source, '*.xlsx'));                        % information tabel about the experiments
% T = readtable(fullfile(source,table_path(1).name));

%%% CPPG higher conc
source='W:\bramse\Zantiks_Experiments\CPPG_Trials\CPPG_1mM\'; %folder where data for experiment is found
folder_path_save=['W:\bramse\Zantiks_Experiments\CPPG_Trials\CPPG_1mM\']; %folder for saving .mat file with analyzed data
fish_name='CPPG_Trials_1mM';                                       % name of dataset (e.g. name of fish line + length of recording)
date_exp='_2022';                                                    % date of recording(s)                                                                 % number of experiment

table_path = dir(fullfile(source, '*.xlsx'));                        % information tabel about the experiments
T = readtable(fullfile(source,table_path(1).name));
%% Constant variables
mkdir (folder_path_save,'\Figures'); % makes a 'Figures' directory under the 'folder_path' directory (gets error message if already exists)
figures_subfolder='Figures';
conversion_factor=0.26458;           % to convert from pixels to mm
timebin=2;                           % Binlength(s) for calculation of velocity etc.
% timebin=1; 

%% Loading the data over multiple experiments
[all_fish] = AO_aj_loadFiles_20211206(source,timebin,folder_path_save,...
             fish_name,conversion_factor,date_exp);

% or load matfile directly
% load([folder_path_save,filesep,fish_name,date_exp ]);

%% Seperate the animals into groups
% Example according to genotype
% mGluR example
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
%% cPPG trials 
name_group1 = 'Placebo 1h'; 
name_group2 = 'Placebo 2h';
name_group3 = 'CPPG 1h'; 
name_group4 = 'CPPG 2h'; 

group1 = []; %find(T.Group == 1); 
group2 = []; %find(T.Group == 2);
group3 = []; %find(T.Group == 3);
group4 = [];
for fish = 1: size(all_fish,1)
    
    if all_fish{fish, 1}.stability == 1
        
        if all_fish{fish, 1}.group == 1
            if all_fish{fish, 1}.bath_time == 1 && T.SelectOng(fish)==1
                group3 = [group3; all_fish{fish, 1}.realNum];
            elseif all_fish{fish, 1}.bath_time == 2 && T.SelectOng(fish)==1
                group4 = [group4; all_fish{fish, 1}.realNum];
            end
        elseif all_fish{fish, 1}.group == 2
            if all_fish{fish, 1}.bath_time == 1 && T.SelectOng(fish)==1
                group1 = [group1; all_fish{fish, 1}.realNum];
            elseif all_fish{fish, 1}.bath_time == 2 && T.SelectOng(fish)==1
                group2 = [group2; all_fish{fish, 1}.realNum];
            end
        end
        
    end
    
end

%% cPPG trials 1mM
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
%% Calculation - Mean velocity
% make this that it loops over the different time bins 
timebin=2;                           % Binlength(s) for calculation of velocity etc.
% timebin=1; 
% timebin=0.5; 
% timebin=0.1; 
tic
[all_fish]=aj_velocityCalc_20211206(all_fish,nROIs,timebin,...
           folder_path_save,fish_name,conversion_factor);

clc;
disp('Jo, I am done.')
toc 

%% Burst duration
framerate = 15; 
[all_fish] = aj_burstDuration_20211206(all_fish,nROIs,timebin,framerate);
clc; 
disp('Jo, I am done.')

%% Calculation - Sum of distance
timebin=2;                           % Binlength(s) for calculation of velocity etc.
% timebin=1;
% timebin=0.5;
% timebin=0.1;
[all_fish]=aj_distCalculation_20211206(all_fish,nROIs,timebin,...
           folder_path_save,fish_name,date_exp,conversion_factor);
toc

save([folder_path_save,filesep,fish_name,...
    date_exp '_data.mat'],'all_fish','-v7.3');

clc;
disp('Jo, I am done.')

%% Calculation - probability distribution of position of the fish
% [all_fish] = aj_pdfPosition(all_fish,nROIs,idxStimulus,folder_path_save,...
%     fish_name,date_exp,figures_subfolder,group1,group2,...
%     name_group1,name_group2);
% do calculation for novel tank here too
duration = 30; 
[all_fish] = aj_pdfPosition_AO (all_fish,nROIs,duration); 
clc;
disp('Jo, I am done.')
% toc
save([folder_path_save,filesep,fish_name,...
    date_exp '_data.mat'],'all_fish','-v7.3');

%% Novel tank
single_plotting = 0;


AO_ploting_noveltank_heatmaps_over_fish(all_fish, group1, name_group1, folder_path_save, figures_subfolder, single_plotting)
AO_ploting_noveltank_heatmaps_over_fish(all_fish, group2, name_group2, folder_path_save, figures_subfolder, single_plotting)
% AO_ploting_noveltank_heatmaps_over_fish(all_fish, group3, name_group3, folder_path_save, figures_subfolder, single_plotting)
% AO_ploting_noveltank_heatmaps_over_fish(all_fish, group4, name_group4, folder_path_save, figures_subfolder, single_plotting)
saveas(gcf, fullfile(folder_path_save, figures_subfolder, [ 'Placebo_noveltank_heatmaps_avg_over_fish.png'])); 
saveas(gcf, fullfile(folder_path_save, figures_subfolder, [ 'Placebo_noveltank_heatmaps_avg_over_fish.svg']));

saveas(gcf, fullfile(folder_path_save, figures_subfolder, [ 'CPPG_noveltank_heatmaps_avg_over_fish.png'])); 
saveas(gcf, fullfile(folder_path_save, figures_subfolder, [ 'CPPG_noveltank_heatmaps_avg_over_fish.svg']));
% y traces 
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
%
combined_y_pos = AO_average_y_trace_flexibel(all_fish, n_groups, groups, names, cmap, ...
    folder_path_save, figures_subfolder, 1, 20*60, 0, 0);
[collected_velo] = AO_average_velo_trace_felxibel(all_fish, n_groups, groups, names, cmap, folder_path_save, figures_subfolder, timebin, 1,20*60, 0);
% kadir - for taps
combined_y_pos = AO_average_y_trace_flexibel(all_fish, n_groups, groups, names, cmap, ...
    folder_path_save, figures_subfolder, 1200, 3900, 0, 1);
[collected_velo] = AO_average_velo_trace_felxibel(all_fish, n_groups, groups, names, cmap, folder_path_save, figures_subfolder, timebin, 1,3900, 1);

% 
% AO_noveltank_average_y_trace_groups(all_fish, group1, name_group1, group2, name_group2,group3, name_group3,group4, name_group4, folder_path_save, figures_subfolder, 1,18000, 0,0)
% 
% saveas(gcf, fullfile(folder_path_save, figures_subfolder, ['Y_pos_novel_tank_1h.png']));
% saveas(gcf, fullfile(folder_path_save, figures_subfolder, ['Y_pos_novel_tank_2h.png']));
% saveas(gcf, fullfile(folder_path_save, figures_subfolder, ['Y_pos_novel_tank_all.png']));

% close;  
% saveas(gcf, fullfile(folder_path_save, figures_subfolder, name_group1, [name_group1,'_ypos_over_time_per_fish.png']));
% close; 
% add speed!!!!!!!!!!
% timebin = 0.5; 
% [collected_velo_1, collected_velo_2, collected_velo_3, collected_velo_4] = AO_noveltank_average_velo_trace_groups(all_fish, group1, name_group1, group2, name_group2,group3, name_group3,group4, name_group4, folder_path_save, figures_subfolder, timebin, 1,20*60, 0);
%% Plotting 
% for  y traces for each fish seperately % for  velo each fish
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
%% Tapping plots
group1 = []; %find(T.Group == 1); 
group2 = []; %find(T.Group == 2);
group3 = []; %find(T.Group == 3);
group4 = [];
for fish = 1: size(all_fish,1)
    
    if all_fish{fish, 1}.stability == 1
        
        if all_fish{fish, 1}.group == 1
            if all_fish{fish, 1}.bath_time == 1 && T.SelectResp(fish)==1
                group3 = [group3; all_fish{fish, 1}.realNum];
            elseif all_fish{fish, 1}.bath_time == 2 && T.SelectResp(fish)==1
                group4 = [group4; all_fish{fish, 1}.realNum];
            end
        elseif all_fish{fish, 1}.group == 2
            if all_fish{fish, 1}.bath_time == 1 && T.SelectResp(fish)==1
                group1 = [group1; all_fish{fish, 1}.realNum];
            elseif all_fish{fish, 1}.bath_time == 2 && T.SelectResp(fish)==1
                group2 = [group2; all_fish{fish, 1}.realNum];
            end
        end
        
    end
    
end

% AO_noveltank_average_y_trace_groups(all_fish, group1, name_group1, group2, name_group2,group3, name_group3,group4, name_group4, folder_path_save, figures_subfolder, 20*60*15,59300, 0, 1)
% 
% 
% saveas(gcf, fullfile(folder_path_save, figures_subfolder, ['Y_pos_stim_1h.png']));
% saveas(gcf, fullfile(folder_path_save, figures_subfolder, ['Y_pos_stim_2h.png']));
% saveas(gcf, fullfile(folder_path_save, figures_subfolder, ['Y_pos_stim_all.png']));

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
%
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


%%
% Average Y_position trace

AO_average_y_trace_groups(all_fish, group3, name_group3,group2, name_group2, group1, name_group1, folder_path_save, figures_subfolder, 1) % start_point is the pint where the 2nd exp starts
saveas(gcf, [folder_path_save, '\',figures_subfolder, '\', 'y_position_avg_compared.png'])


% Average velo trace
 timebin = 0.5; % is is hard code!!! 
 [collected_velo_hom_trace, collected_velo_het_trace, collected_velo_wt_trace] = AO_average_velo_trace_groups(all_fish, group3, name_group3, group2, name_group2, group1, name_group1, folder_path_save, figures_subfolder, timebin); 
saveas(gcf, fullfile(folder_path_save, figures_subfolder, 'velo_combined_fish_trcae.png')); 
