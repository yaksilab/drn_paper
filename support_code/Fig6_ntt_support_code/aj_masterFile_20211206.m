%% AJ_masterfile_4groups
%  This masterfile is for concatenated data, where the datasets are of different lengths 

%% Variables to be adjusted for each recording
source='\\forskning.it.ntnu.no\ntnu\mh-kin\yaksi\Ahmed\'; %folder where data for experiment is found
folder_path_save=['\\forskning.it.ntnu.no\ntnu\mh-kin\yaksi\Ahmed\New_Trial']; %folder for saving .mat file with analyzed data
fish_name='TrialDetection';                                                       % name of dataset (e.g. name of fish line + length of recording)
date_exp='_2021_12_06';                                                      % date of recording(s)                                                                 % number of experiment

%% Constant variables
mkdir (folder_path_save,'\Figures'); % makes a 'Figures' directory under the 'folder_path' directory (gets error message if already exists)
figures_subfolder='Figures';
conversion_factor=0.26458;           % to convert from pixels to mm
timebin=2;                           % Binlength(s) for calculation of velocity etc.

%% Load more than one csv file
[all_fish] = aj_loadFiles_20211206(source,timebin,folder_path_save,...
             fish_name,conversion_factor,date_exp);

% or load matfile

% load([folder_path_save,filesep,fish_name,date_exp ]);

%% get the grouping variables 

[group1,group2,group3,group4,group5,allgroups,...
 name_group1,name_group2,name_group3,name_group4,name_group5,...
 group_category, groups, name_groups, nROIs]...
 = aj_getGroups_20211206 (fish_name, all_fish);    



%% Calculate timestamp of the transiotino between spontanious behaviour to evoked behaviour 
% Find indexes of the lights are turned on and off
idxStimulus  = nan(length(all_fish),25);                                               % change according to  num stim
idxStimulussOff = nan(length(all_fish),25);
for ROI=1:length(all_fish)
    idxStimulus(ROI,:) = (find(diff(all_fish{ROI,1}.lightsInfo)==1)+1)';
    idxStimulussOff(ROI,:) = (find(diff(all_fish{ROI,1}.lightsInfo)==-1)+1)';   
end

% Find the bin number (second) of when this transition is taking place
%transitionTime = all_fish{1, 1}.timestampLight(idxLightsOff(1,1));

transitionTime = 200; 
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
[all_fish]=aj_acceleration_20211206(all_fish,nROIs,timebin,...
           folder_path_save,fish_name,date_exp);

       clc;
disp('Jo, I am done.')

save([folder_path_save,filesep,fish_name,...
    date_exp '_data.mat'],'all_fish','-v7.3');

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


%% Calculation - probability distribution of postion of the fish
[all_fish] = aj_pdfPosition(all_fish,nROIs,idxStimulus,folder_path_save,...
    fish_name,date_exp,figures_subfolder,group1,group2,...
    name_group1,name_group2);

clc;
disp('Jo, I am done.')
toc
save([folder_path_save,filesep,fish_name,...
    date_exp '_data.mat'],'all_fish','-v7.3');


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

