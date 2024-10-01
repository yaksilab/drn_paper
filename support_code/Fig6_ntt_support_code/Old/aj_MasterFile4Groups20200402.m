%% AJ_masterfile_4groups
%  This masterfile is for concatenated data, where the datasets are of different lengths 

%% Variables to be adjusted for each recording
source='\\forskning.it.ntnu.no\ntnu\mh-kin\yaksi\Ahmed\'; %folder where data for experiment is found
folder_path_save='\\forskning.it.ntnu.no\ntnu\mh-kin\yaksi\Ahmed\CagedVPA'; %folder for saving .mat file with analyzed data
fish_name='CagedVPA';                                                       % name of dataset (e.g. name of fish line + length of recording)
date_exp='_2021_10_18';                                                      % date of recording(s)                                                                 % number of experiment

%% Constant variables
mkdir (folder_path_save,'\Figures');                                        % makes a 'Figures' directory under the 'folder_path' directory (gets error message if already exists)
figures_subfolder='Figures';
conversion_factor=0.26458;                                                  % to convert from pixels to mm
timebin=1;                                                                  % in seconds

%% Load more than one csv file
[all_fish] = aj_loadFiles_20210320 (source,timebin,folder_path_save,...
             fish_name,conversion_factor,date_exp);

% or load matfile

% load([folder_path_save,filesep,fish_name,date_exp ]);

%% get the grouping variables 

[group1,group2,group3,group4,group5,group6, group7,allgroups,...
 name_group1,name_group2,name_group3,name_group4,name_group5,name_group6,...
 name_group7,group_category, groups, name_groups, nROIs]...
 = AJ_getGroups (fish_name, all_fish);    

% CPA_grouping_24th
% CPA_4_GROUPINGS;
% CPA_5_GROUPINGS;
Cx43_grouping_20211001
%% Calculate timestamp of the transiotino between spontanious behaviour to evoked behaviour 
% Find indexes of the lights are turned on and off
idxLightsOn  = nan(length(all_fish),25);                                               % change according to  num stim
idxLightsOff = nan(length(all_fish),25);
for ROI=1:length(all_fish)
    idxLightsOn(ROI,:) = (find(diff(all_fish{ROI,1}.lightsInfo)==1)+1)';
    idxLightsOff(ROI,:) = (find(diff(all_fish{ROI,1}.lightsInfo)==-1)+1)';   
end

% Find the bin number (second) of when this transition is taking place
%transitionTime = all_fish{1, 1}.timestampLight(idxLightsOff(1,1));

transitionTime = 1800; 
threshold = 75; % for exclusion of high and erronous tracking

%% Colormaps
if strcmp (fish_name, 'PTZ') ||strcmp (fish_name, 'PTZ_short')
    C1 = [[0 0 0]; [1 1 0] ; [ 0.8100 0.5100 0.1700]; [1 0 0]];
elseif strcmp (fish_name, 'gabra1')
    C1 = [[.0005 .8 0];[.005 .6 0 ];[.01 .2 0]; [.2 .2 .2]] ;
elseif strcmp (fish_name, 'eaat2a')
    C1 = [[.001 .005 .95];[.001 .005 .65];[.001 .005 .25]; [.2 .2 .2]];
elseif strcmp (fish_name, 'scn1lab')
    C1 = [[ .5 0 .5]; [.25 0 .25]; [.4 .4 .4]; [.1 .1 .2]];
elseif strcmp (fish_name, 's280F')
    C1 = [[ 1 0 1]; [.6 0 .6]; [.4 .4 .4]; [.1 .1 .2]];
elseif strcmp(fish_name, 'PTZ_CPA_3')
    C1 = [[0 0 0]; [0 1 0];
        [1 0 0];
        [150,150,150]/255;
        [0 0 1];
        [252,187,161]/255];
elseif  strcmp(fish_name, 'Cx43')
    C1 = [150,150,150;
        82,82,82;
        0,0,0;
        203,201,226;
        158,154,200;
        106,81,163;
        252,174,145;
        251,106,74;
        203,24,29]./255;
end 

%% Calculation - Mean velocity 
tic
[all_fish]=aj_velocityCalc_20200417(all_fish,nROIs,timebin,...
           folder_path_save,fish_name,conversion_factor);

% 2.43 Hz / 0.4115 second bin
[all_fish]=aj_velocity_2_43Hz_202106_25(all_fish,nROIs,...
           folder_path_save,fish_name,conversion_factor);

clc;
disp('Jo, I am done.')
toc 
%% Burst duration
[all_fish] = aj_BurstDuration(all_fish,nROIs,timebin);

clc; 
disp('Jo, I am done.')

%% Calculation - Mean acceleration
[all_fish]=aj_acceleration_20200206(all_fish,nROIs,timebin,...
           folder_path_save,fish_name,date_exp);

       clc;
disp('Jo, I am done.')

save([folder_path_save,filesep,fish_name,...
    date_exp '_data.mat'],'all_fish','-v7.3');

%% Calculation - Sum of distance
[all_fish]=aj_distCalculation_20200311(all_fish,nROIs,timebin,...
           folder_path_save,fish_name,date_exp,conversion_factor);
toc

save([folder_path_save,filesep,fish_name,...
    date_exp '_data.mat'],'all_fish','-v7.3');

clc;
disp('Jo, I am done.')

%% Replace velocities by nan
[all_fish,threshold, nVReplaced,...
    n_replaced_g1, n_replaced_g2, n_replaced_g3,...
    n_replaced_g4, n_replaced_g5, n_replaced_g6,...
    n_replaced_g7, n_replaced_g8, n_replaced_g9]...
    = aj_replaceByNaN_V (all_fish,folder_path_save,...
    fish_name,date_exp,group1,group2,group3, group4,...
    group5, group6, group7, group8, group9,group10, nROIs);

clc;
disp('Jo, I am done.')

[all_fish,threshold, nVReplaced, n_replaced_g1, n_replaced_g2, n_replaced_g3, n_replaced_g4, n_replaced_g5] = aj_replaceByNaN_V_5g (all_fish,folder_path_save,fish_name,date_exp,group1,group2,group3, group4, group5,nROIs)


%% Find thresholds for the high velocity activity periods
% [highVel_thresholds, SeizureBarcode_thresholds]...
%     = aj_highVel_thresholds_20210219 (all_fish,nROIs,timebin,...
%     folder_path_save,fish_name,date_exp,figures_subfolder,...
%     group1,group2,group3,group4,allgroups,name_group1,name_group2);

highVel_thresholds = [5; 10; 15];

SeizureBarcode_thresholds = [5; 10; 15];
clc;
disp('Jo, I am done.')

%% Calculation - Information about activity and inactivity 
tic
[all_fish] = aj_activity_20200303(all_fish,nROIs,timebin,...
    folder_path_save,fish_name,date_exp,figures_subfolder,...
    group1,group2,allgroups,name_group1,name_group2);

%  [all_fish]=aj_binnedActivity_20200403(all_fish,nROIs,timebin,...
%     folder_path_save,fish_name,date_exp,figures_subfolder,...
%     group1,group2,allgroups,name_group1,name_group2);

clc;
disp('Jo, I am done.')

%% Calculation - Treshold velocity and acceleration and binarization of these
[all_fish]=aj_binarizeData(all_fish,nROIs,timebin,folder_path_save,...
    fish_name,date_exp,conversion_factor);
toc

clc;
disp('Jo, I am done.')

% save([folder_path_save,filesep,fish_name,date_exp '_data.mat'],'all_fish','-v7.3');
%% Calculation - high velocity events and duration
tic
[all_fish] = aj_highVelEvents_20210219(all_fish,nROIs,timebin,...
    folder_path_save,fish_name,date_exp,figures_subfolder,...
    group1,group2,allgroups,name_group1,name_group2,highVel_thresholds);

clc;
disp('Jo, I am done.')

%% Calculation - Seizurepoint defined as activty followed by inactivity
[all_fish] = aj_seizureBarCode1(all_fish,nROIs,timebin,...
    folder_path_save,fish_name,date_exp,conversion_factor,...
    SeizureBarcode_thresholds);

clc;
disp('Jo, I am done.')

%% Calculation - probability distribution of postion of the fish
[all_fish] = aj_pdfPosition(all_fish,nROIs,folder_path_save,...
    fish_name,date_exp,figures_subfolder,group1,group2,...
    allgroups,name_group1,name_group2);
clc;
disp('Jo, I am done.')
toc

save([folder_path_save,filesep,fish_name,...
    date_exp '_data.mat'],'all_fish','-v7.3');

%% Calculation and plots of spontanious activity, but does not include inactivity plot
% 1st: just descriptivestatistics
% [all_fish] = aj_descriptiveSB_20210220(all_fish,timebin,...
%     folder_path_save,fish_name,date_exp,...
%     group1,group2,group3,group4,group5,...
%     group6,group7,group8,group9...
%     name_group1,name_group2,name_group3,name_group4,name_group5,...
%     name_group6,name_group7,name_group8,name_group9...
%     figures_subfolder, group_category,nROIs,transitionTime,...
%     groups,name_groups,threshold, SeizureBarcode_thresholds,...
%     conversion_factor,C1);

% for ROI =1:nROIs
%     all_fish{ROI,1}.SponBehaviour=rmfield(all_fish{ROI,1}.SponBehaviour,...
%     {'highVel_events', 'seizureBarcode'});    
% end 

% 2nd: special statistics with different seizure proxies
% %% must change
% [all_fish] = aj_seizureProxiesSB_20210220(all_fish,timebin,...
%     folder_path_save,fish_name,date_exp,...
%     group1,group2,group3,group4,group5,...
%     group6,group7,group8,group9...
%     name_group1,name_group2,name_group3,name_group4,name_group5,...
%     name_group6,name_group7,name_group8,name_group9...
%     figures_subfolder, group_category,nROIs,transitionTime,...
%     groups,name_groups, threshold,SeizureBarcode_thresholds,...
%     conversion_factor,highVel_thresholds,C1);

clc;
disp('Jo, I am done.')

% save([folder_path_save,filesep,fish_name,date_exp '_data.mat'],'all_fish','-v7.3');
%% Plot activity pattern of spontanious activity and conditioned activity
%  [all_fish]=aj_characterizeActivity_20200306 (all_fish,timebin,folder_path_save,fish_name,date_exp,group1,group2,group3, group4, group5, name_group1,name_group2, name_group3, name_group4, name_group5,figures_subfolder, group_category,nROIs,groups,name_groups,threshold,transitionTime);
%  [all_fish]=aj_characterizeBinnedActivity_20200306 (all_fish,timebin,folder_path_save,fish_name,date_exp,group1,group2,group3, group4, group5, name_group1,name_group2, name_group3, name_group4, name_group5,figures_subfolder, group_category,nROIs,groups,name_groups,threshold,transitionTime);

%% Calculation and plots for the stimulus assay, but does not include plots  
[all_fish]= aj_evokedBehaviour20200319(all_fish,timebin,...
    folder_path_save,fish_name,date_exp,...
    group1,group2,group3,group4, group5,...
    name_group1,name_group2,name_group3,name_group4,name_group5,...
    figures_subfolder,group_category,nROIs,groups,name_groups,...
    threshold,transitionTime);

save([folder_path_save,filesep,fish_name,date_exp '_data.mat'],'all_fish','-v7.3');

clc;
disp('Jo, I am done.')

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
[all_fish]    = aj_dvvComputation_20210321 (all_fish,cfg,nROIs,idxLightsOff);

clc;
disp('Jo, I am done.')

%% plot DVV - imagesc, and seizure proxies
[all_fish] = aj_characterizeDvv_20210321(all_fish,timebin,...
    folder_path_save,fish_name,date_exp,...
    group1,group2,group3,group4,group5,...
    name_group1,name_group2,name_group3,name_group4,name_group5,...
    figures_subfolder,group_category,nROIs,groups,name_groups,...
    threshold,transitionTime,idxLightsOn,idxLightsOff);

clc;
disp('Jo, I am done.')

%% plot sizurebarcode on top of highVelthreshold

for ROI=1:nROIs
    f23=figure;
    f23.WindowState ='Maximized';
    sgtitle (['Fish-' num2str(ROI)])
    for i= 1:length(highVel_thresholds)
        
        subplot (length(highVel_thresholds),1,i)
        
        mat = zeros(1,length(all_fish{ROI, 1}.bV_E4sd));
        if isempty(all_fish{ROI, 1}.V_above_threshold.highSpeedEvent{i, 1})
            mat;
        else
        mat(all_fish{ROI, 1}.V_above_threshold.highSpeedEvent{i, 1}(1,:))= 1;
        end 
        
        plot(mat,'b'),hold on
        plot([1:length(all_fish{ROI, 1}.barCode.velTresholdSeizure{i+3,1}...
            (:,:))+1],...
            [0 all_fish{ROI, 1}.barCode.velTresholdSeizure{i+3,1}(:,:)]...
            +1, 'Color', [1 0 0 .5])
        box('off')
        title (['T-' num2str(highVel_thresholds(i,1))])
        set(gca,'TickDir', 'out')
        set(gca,'xtick',[])
        ylim ([-0.12 2.12])
        hold off
               
    end
    
    saveas (f23, [folder_path_save,filesep,figures_subfolder,filesep,fish_name,date_exp '_SeizureLinePlot_Fish_',num2str(ROI)  '.fig']);
    saveas (f23, [folder_path_save,filesep,figures_subfolder,filesep,fish_name,date_exp '_SeizureLinePlot_Fish_',num2str(ROI)  '.jpg']);
    saveas (f23, [folder_path_save,filesep,figures_subfolder,filesep,fish_name,date_exp '_SeizureLinePlot_Fish_',num2str(ROI)  '.svg']);    
end 

clc;
disp('Jo, I am done.')

%% 
[all_fish] =  aj_eventdetection (all_fish,timebin,folder_path_save,fish_name,date_exp,group1,group2,group3, group4, group5, name_group1,name_group2, name_group3, name_group4, name_group5,figures_subfolder, group_category,nROIs,groups,name_groups,threshold,transitionTime);

clc;
disp('Jo, I am done.')

%% %%%%%%%%%%%%%%%%%%%% make the code for two as well

aj_evokedBdeepAnalysis  % make the code for two as well

clc;
disp('Jo, I am done.')

