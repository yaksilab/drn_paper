%% Zantics Juvenile 6 Arenas Masterfile 
%  This masterfile is for concatenated data, where the datasets are of different lengths 

%% Variables to be adjusted for each recording
source='W:\bramse\Zantiks_Experiments\mGluR6a_Vibration\'; %folder where data for experiment is found
folder_path_save=['X:\anna\Data\Analysis\mGluR\Zantics_Behaviour\']; %folder for saving .mat file with analyzed data
fish_name='mGluR6a_Vibration';                                                       % name of dataset (e.g. name of fish line + length of recording)
date_exp='_2022';                                                      % date of recording(s)                                                                 % number of experiment

%% Constant variables
mkdir (folder_path_save,'\Figures'); % makes a 'Figures' directory under the 'folder_path' directory (gets error message if already exists)
figures_subfolder='Figures';
conversion_factor=0.26458;           % to convert from pixels to mm
timebin=2;                           % Binlength(s) for calculation of velocity etc.
% timebin=1; 
%% Load more than one csv file
[all_fish] = AO_aj_loadFiles_20211206(source,timebin,folder_path_save,...
             fish_name,conversion_factor,date_exp);

% or load matfile directly

% load([folder_path_save,filesep,fish_name,date_exp ]);

%% get the grouping variables 
% here we just divide the fish

%change this into a different way of defining group and stuff and maybe
%chnage the entire thing with the nROIS... 
[group1,group2,group3,group4,group5,allgroups,...
 name_group1,name_group2,name_group3,name_group4,name_group5,...
 group_category, groups, name_groups, nROIs]...
 = aj_getGroups_20211206 (fish_name, all_fish);    



%% Calculate timestamp of the transiotino between spontanious behaviour to evoked behaviour 
% Find indexes of the lights are turned on and off
% idxStimulus  = nan(length(all_fish),25);                                               % change according to  num stim
% idxStimulussOff = nan(length(all_fish),25);
% for ROI=1:length(all_fish)
%     idxStimulus(ROI,:) = (find(diff(all_fish{ROI,1}.lightsInfo)==1)+1)';
%     idxStimulussOff(ROI,:) = (find(diff(all_fish{ROI,1}.lightsInfo)==-1)+1)';   
% end

% Find the bin number (second) of when this transition is taking place
%transitionTime = all_fish{1, 1}.timestampLight(idxLightsOff(1,1));

transitionTime = 200; % this is the baseline? 
threshold = 75; % for exclusion of high and erronous tracking

%% Colormaps
if strcmp (fish_name, 'TrialDetection') 
    C1 = [[0 0 0]; [1 1 0] ; [ 0.8100 0.5100 0.1700]; [1 0 0]];
end 

%% Calculation - Mean velocity
tic
[all_fish]=aj_velocityCalc_20211206(all_fish,nROIs,timebin,...
           folder_path_save,fish_name,conversion_factor);

clc;
disp('Jo, I am done.')
toc 
%% Burst duration
framerate = 30; 
[all_fish] = aj_burstDuration_20211206(all_fish,nROIs,timebin,framerate);
clc; 
disp('Jo, I am done.')

%% Calculation - Mean acceleration
% [all_fish]=aj_acceleration_20211206(all_fish,nROIs,timebin,...
%            folder_path_save,fish_name,date_exp);
% 
%        clc;
% disp('Jo, I am done.')
% 
% save([folder_path_save,filesep,fish_name,...
%     date_exp '_data.mat'],'all_fish','-v7.3');

%% Calculation - Sum of distance
[all_fish]=aj_distCalculation_20211206(all_fish,nROIs,timebin,...
           folder_path_save,fish_name,date_exp,conversion_factor);
toc

save([folder_path_save,filesep,fish_name,...
    date_exp '_data.mat'],'all_fish','-v7.3');

clc;
disp('Jo, I am done.')

% %% Replace velocities by nan --- do we need this?
% [all_fish,threshold, nVReplaced, n_replaced_g1,...
%     n_replaced_g2, n_replaced_g3, n_replaced_g4,...
%     n_replaced_g5] = aj_replaceByNaN_V_5g (all_fish,...
%     folder_path_save,fish_name,date_exp,group1,group2,...
%     group3, group4, group5,nROIs);
% clc;
% disp('Jo, I am done.')


%% Find thresholds for the high velocity activity periods
% [highVel_thresholds, SeizureBarcode_thresholds]...
%     = aj_highVel_thresholds_20210219 (all_fish,nROIs,timebin,...
%     folder_path_save,fish_name,date_exp,figures_subfolder,...
%     group1,group2,group3,group4,allgroups,name_group1,name_group2);

highVel_thresholds = [5; 10; 15];
SeizureBarcode_thresholds = [5; 10; 15];
clc;
disp('Jo, I am done.')

%% Calculation - high velocity events and duration
% tic
% [all_fish] = aj_highVelEvents_20211206(all_fish,nROIs,timebin,...
%     folder_path_save,fish_name,date_exp,figures_subfolder,...
%     group1,group2,allgroups,name_group1,name_group2,highVel_thresholds);
% 
% clc;
% disp('Jo, I am done.')
% 
%% Plotting Velocity over the experiment indicating the stimuli and Plotting y position
% This function will plot the binned veloc and the "raw" y position at
% least for now 
% TO DO try this with real data and then decide and add the name of the
% fish or something also 

% I put a minus infrot of the y position because I think it is still upside
% down... double check witth the vide just in case 
% AO_plot_binned_vel_and_y(all_fish, nROIs, timebin, group3)
AO_plot_binned_vel_and_y(all_fish, nROIs, timebin, group3, name_group3)
saveas(gcf, [folder_path_save, '\',figures_subfolder, '\', 'y_position_all_mut.png'])

AO_plot_binned_vel_and_y(all_fish, nROIs, timebin, group2, name_group2)
saveas(gcf, [folder_path_save, '\',figures_subfolder, '\', 'y_position_all_ctrl.png'])
% saveas(gcf, ['W:\bramse\Zantiks_Experiments\Trial_Exp\collected_files\Figures\', 'y_position_all_fish_justselected.png'])
% AO_plot_binned_vel_and_y(all_fish(group3,:), nROIs, timebin)



%% Calculation - probability distribution of postion of the fish
% [all_fish] = aj_pdfPosition(all_fish,nROIs,idxStimulus,folder_path_save,...
%     fish_name,date_exp,figures_subfolder,group1,group2,...
%     name_group1,name_group2);
duration = 30; 
[all_fish] = aj_pdfPosition_AO (all_fish,nROIs,duration); 
clc;
disp('Jo, I am done.')
toc
save([folder_path_save,filesep,fish_name,...
    date_exp '_data.mat'],'all_fish','-v7.3');

%% Plotting the heatmap
% code is onlz made for 1 experiment at the time with 6 fish! a lot is hard
% coded until we know what we want 
AO_plot_heatmaps(all_fish, nROIs, folder_path_save)


%% HERE WE STOP FOR NOW 

% plotting the same stimulus for multiple fish
AO_avg_stim_over_fish(all_fish, group3, name_group3)
% saveas(gcf, ['W:\bramse\Zantiks_Experiments\Trial_Vibration_mGluR6a\collected files\Figures\', 'Mut_heatmaps_avg.png'])
AO_avg_stim_over_fish(all_fish, group2, name_group2)
% saveas(gcf, ['W:\bramse\Zantiks_Experiments\Trial_Vibration_mGluR6a\collected files\Figures\', 'Ctrl_heatmaps_avg.png'])
%% ypositions
duration = 30; 
combined_ypos_mut = AO_plot_yposition_all_fish(all_fish, duration, group3,name_group3, folder_path_save, figures_subfolder);
combined_ypos_ctrl = AO_plot_yposition_all_fish(all_fish, duration, group2,name_group2, folder_path_save, figures_subfolder);

figure('units','centimeters','Position',[2 2 20 8])
stim_types = unique(all_fish{1, 1}.stimInfo); 
stim_types = stim_types(2:end);
stim_types_indice = all_fish{1, 1}.stimInfo(find(~contains(all_fish{1, 1}.stimInfo, "VIB_0"))); % this is now the stimuli times for the specific stimulus 

x_values = 1:size(combined_ypos_ctrl,1); 
labels = all_fish{1, 1}.stimInfo(find(~contains(all_fish{1, 1}.stimInfo, "VIB_0")));%unique(all_fish{1, 1}.stimInfo);
type_labels = unique(labels);
for stim = 1:length(stim_types)
    current_stim_ind = find(stim_types_indice == stim_types(stim)); 
%     subplot(round(length(stim_types)/2),2,stim)
    subplot(1,length(stim_types),stim)
    H1=shadedErrorBar(x_values, squeeze(nanmean(nanmean(combined_ypos_ctrl(:,:,current_stim_ind),3),2)),squeeze(nanstd(nanmean(combined_ypos_ctrl(:,:,current_stim_ind),3),0,2)/sqrt(size(group2,2))), 'lineProps','k');
    hold on
    H2 = shadedErrorBar(x_values, squeeze(nanmean(nanmean(combined_ypos_mut(:,:,current_stim_ind),3),2)),squeeze(nanstd(nanmean(combined_ypos_mut(:,:,current_stim_ind),3),0,2)/sqrt(size(group3,2))), 'lineProps','k');
    H2.mainLine.Color = '#8B0000';
    H2.patch.FaceColor = '#8B0000'; 
    %     H=shadedErrorBar(x_values, squeeze(nanmean(collected_yposition_lower(:,:,stim),2)),squeeze(nanstd(collected_yposition_lower(:,:,stim),0,2)/sqrt(size(lowerRow,2))), 'lineProps','k');
%     current_stim_index = find(all_fish{1,1}.t >= stim_times(stim))
    
    xline(450, 'Color', 'b' )
%     for fish = 1:size(combined_ypos(:,:,stim),2)
%         plot(nanmean(combined_ypos(:,fish,current_stim_ind),3))
%     end
    hold off
    ylim([-120 0])% ylim([-280 -140])
    title(['Y Pos ', type_labels(stim)])
    legend([H1.mainLine H2.mainLine], {name_group2, name_group3})

end
saveas(gcf, fullfile(folder_path_save, figures_subfolder, 'Comb_Avg_over_stim_fish_yposition_ALL.png')); 
saveas(gcf, fullfile(folder_path_save, figures_subfolder, 'Comb_Avg_over_stim_fish_yposition_ALL.svg')); 
close; 
% saveas(gcf, ['W:\bramse\Zantiks_Experiments\Trial_Experiment\exp_with_stim\Figures\', 'y_position_all_fish_15s.png'])
% saveas(gcf, ['W:\bramse\Zantiks_Experiments\Trial_Experiment\exp_with_stim\Figures\', 'y_position_upper_15s.png'])
% saveas(gcf, ['W:\bramse\Zantiks_Experiments\Trial_Experiment\exp_with_stim\Figures\', 'y_position_lower_15s.png'])
%% Velocity stuff
duration = 30;
collected_velo_mut =AO_plot_velo_all_fish(all_fish, group3,name_group3, duration, timebin, folder_path_save, figures_subfolder); 
collected_velo_ctrl = AO_plot_velo_all_fish(all_fish, group2,name_group2, duration, timebin, folder_path_save, figures_subfolder); 

figure('units','centimeters','Position',[2 2 20 8])
stim_types = unique(all_fish{1, 1}.stimInfo); 
stim_types = stim_types(2:end);
stim_types_indice = all_fish{1, 1}.stimInfo(find(~contains(all_fish{1, 1}.stimInfo, "VIB_0"))); % this is now the stimuli times for the specific stimulus 

x_values = 1:size(collected_velo_ctrl,1); 
labels = all_fish{1, 1}.stimInfo(find(~contains(all_fish{1, 1}.stimInfo, "VIB_0")));%unique(all_fish{1, 1}.stimInfo);
type_labels = unique(labels);
%
for stim = 1:length(stim_types)
    current_stim_ind = find(stim_types_indice == stim_types(stim)); 
    subplot(1,3,stim)
    H1=shadedErrorBar(x_values, squeeze(nanmean(nanmean(collected_velo_ctrl(:,:,current_stim_ind),3),2)),squeeze(nanstd(nanmean(collected_velo_ctrl(:,:,current_stim_ind),3),0,2)/sqrt(size(group2,2))), 'lineProps','k');
%     current_stim_index = find(all_fish{1,1}.t >= stim_times(stim))
    hold on
    H2=shadedErrorBar(x_values, squeeze(nanmean(nanmean(collected_velo_mut(:,:,current_stim_ind),3),2)),squeeze(nanstd(nanmean(collected_velo_mut(:,:,current_stim_ind),3),0,2)/sqrt(size(group3,2))), 'lineProps','r');
    H2.mainLine.Color = '#8B0000';
    H2.patch.FaceColor = '#8B0000'; 
%     H2.edge.Color = '#8B0000';
    xline(15, 'Color', 'b' )
%     for stimu = 1:length(current_stim_ind)
%         plot(nanmean(collected_velo(:,:,current_stim_ind(stimu)),2))
%     end
    hold off
    ylim([0 3])
    title([type_labels(stim)])
    ylabel([int2str(timebin) ' s binned velo '])
    hold off
    legend([H1.mainLine H2.mainLine], {name_group2, name_group3})

end
% saveas(gcf, ['W:\bramse\Zantiks_Experiments\Trial_Vibration_mGluR6a\collected files\Figures\', 'velo_combined_fish_justavg.png'])
% saveas(gcf, ['W:\bramse\Zantiks_Experiments\Trial_Vibration_mGluR6a\collected files\Figures\', 'velo_combined_fish_justavg.svg'])

AO_average_velo_trace_groups(all_fish, group3, name_group3, group2, name_group2, folder_path_save, figures_subfolder, timebin)
% saveas(gcf, ['W:\bramse\Zantiks_Experiments\Trial_Vibration_mGluR6a\collected files\Figures\', 'velo_combined_fish_trcae.png'])
% saveas(gcf, ['W:\bramse\Zantiks_Experiments\Trial_Vibration_mGluR6a\collected files\Figures\', 'velo_combined_fish_trcae.svg'])
%% some quick statistics 
% collected_velo_mut (time fish stim)
% collected_velo_ctrl

avg_trials_ctrl_before_low = nanmean(nanmean(collected_velo_ctrl(11:13, group2, 1:10),3),1);
avg_trials_ctrl_after_low = nanmean(nanmean(collected_velo_ctrl(15:17, group2, 1:10),3),1);

avg_trials_mut_before_low = nanmean(nanmean(collected_velo_mut(11:13, group3, 1:10),3),1);
avg_trials_mut_after_low = nanmean(nanmean(collected_velo_mut(15:17, group3, 1:10),3),1);

figure()
scatter(ones(23,1), avg_trials_ctrl_before_low)
hold on
scatter(ones(23,1)*2, avg_trials_ctrl_after_low)
xlim([0 3])

[p,h,stats] = signrank(avg_trials_ctrl_before_low,avg_trials_ctrl_after_low) %, 'tail', 'right')

figure()
scatter(ones(22,1), avg_trials_mut_before_low)
hold on
scatter(ones(22,1)*2, avg_trials_mut_after_low)
xlim([0 3])

[p,h,stats] = signrank(avg_trials_mut_before_low,avg_trials_mut_after_low)

%between groups

[p,h,stats] = ranksum(avg_trials_ctrl_before_low,avg_trials_mut_before_low)

[p,h,stats] = ranksum(avg_trials_ctrl_after_low,avg_trials_mut_after_low)



%%
AO_avg_stim_per_fish(all_fish, group3, name_group3, folder_path_save, figures_subfolder); % this one for plotting an average heatmap over each stim type for each fish
AO_avg_stim_per_fish(all_fish, group2, name_group2, folder_path_save, figures_subfolder); % this one for plotting an average heatmap over each stim type for each fish

%% average over the whole y_pos
AO_average_y_trace(all_fish, group3,name_group3, folder_path_save, figures_subfolder)
saveas(gcf, [folder_path_save, '\',figures_subfolder, '\', 'y_position_avg_mut.png'])

AO_average_y_trace(all_fish, group2,name_group2, folder_path_save, figures_subfolder)
saveas(gcf, [folder_path_save, '\',figures_subfolder, '\', 'y_position_avg_ctrl.png'])

AO_average_y_trace_groups(all_fish, group3, name_group3, group2, name_group2, folder_path_save, figures_subfolder)
saveas(gcf, [folder_path_save, '\',figures_subfolder, '\', 'y_position_avg_compared2.png'])
saveas(gcf, [folder_path_save, '\',figures_subfolder, '\', 'y_position_avg_compared2.svg'])
%% Calculation and plots of spontanious activity, but does not include inactivity plot
%1st: just descriptivestatistics
[all_fish] = aj_descriptiveSB_20211207 (all_fish,timebin,...
    folder_path_save,fish_name,date_exp,group1,group2,...
    group3,group4,group5,...
    name_group1,name_group2,name_group3 ,name_group4,...
    name_group5,figures_subfolder, group_category,nROIs,...
    transitionTime,groups,name_groups, threshold,...
    SeizureBarcode_thresholds,conversion_factor,C1);

clc;
disp('Jo, I am done.')

%save([folder_path_save,filesep,fish_name,date_exp '_data.mat'],'all_fish','-v7.3');

%% Calculation and plots for the stimulus assay, but does not include plots
%% Calculate dvv
% might be needed
% % for i=1: nROIs
% %     evokedBehaviour.VDA{i,1} = all_fish{i,1}.evokedBehaviour;
% %     all_fish{i,1}.evokedBehaviour.VDA = evokedBehaviour.VDA{i,1};
% % end
% % 
% % for i=1:nROIs
% %     all_fish{i,1} = rmfield (all_fish{i,1}, 'SponBehaviour');
% %     all_fish{i,1} = rmfield (all_fish{i,1}, 'evokedBehaviour');
% % end

cfg.V0method  = 'trad'; % sumbre or trad
cfg.wdw       = 5; % 5 sec before is the baseline 
[all_fish]    = aj_dvvComputation_20210321 (all_fish,cfg,nROIs,idxStimulussOff);

clc;
disp('Jo, I am done.')



%% %%%%%%%%%%%%%%%%%%%% make the code for two as well

aj_evokedBdeepAnalysis  % make the code for two as well

clc;
disp('Jo, I am done.')

