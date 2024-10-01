%% AJ_masterfile
%  This masterfile is for concatenated data, where the datasets are of different lengths 

%% Variables to be adjusted for each recording
source='\\forskning.it.ntnu.no\ntnu\mh-kin\yaksi\Ahmed\Behaviour\Spring2020\EaatData\HuCGCaMP6s'; %folder where data for experiment is found
folder_path_save='\\forskning.it.ntnu.no\ntnu\mh-kin\yaksi\Ahmed\Behaviour\Spring2020\EaatData\HuCGCaMP6s'; %folder for saving .mat file with analyzed data
fish_name='Eaat2a-ON';                                                       % name of dataset (e.g. name of fish line + length of recording)
date_exp='20200322';                                                        % date of recording(s)                                                                 % number of experiment

%% Constant variables
mkdir (folder_path_save,'\Figures');                                        % makes a 'Figures' directory under the 'folder_path' directory (gets error message if already exists)
figures_subfolder='Figures';
conversion_factor=0.26458;                                                  % to convert from pixels to mm
timebin=1;                                                                  % in seconds

%% Load more than one csv file

stk_files   = dir(fullfile(source, 'HuCGCaMP6s*'));                   % NB! remember to change the name of file

tic
k = 1;
all_fish={};
for i = 1:length(stk_files)
    
    file = dir(fullfile([source,'\', stk_files(i).name],'*.csv'));
    
    for j = 1:length(file)
        name_file = [file(j).folder, '\', file(j).name];
        [all_fish((j-1)*24+1:j*24,1)]=aj_loaddata_20200202(conversion_factor,timebin,name_file,fish_name,folder_path_save);
        k = k+1;
    end
end
save([folder_path_save,filesep,fish_name,date_exp '_data.mat'],'all_fish','-v7.3');
toc   

clearvars i j k file stk_files name_file k

%% grouping variables and number of fish in total 
% 
% group1= [[2 5 6 10 11 12 13 14 20 21 22 23]...			
% 24+[1 2 6 14 15 19 23]...			
% 24*2+[2 3 4 5 13 14 18 20 22]...			
% 24*3+[1 5 6 7 9 10 11 13 17 18 20 24]...			
% 24*4+[1 2 3 4 5 7 8 9]...			
% 24*5+[7 11 16 19 22 23]...		
% 24*6+[ 1 2 3 4 5 6  11 12 13 14 15 18]...
% 24*7+[2 4 6 8 10 11 12 14]];			

group1 = [[3 4 6]...			
24+[2 3 10 11 12 13 14 15 19 20 23 24]...			
24*2+[3 5 7 10 11 12 13 14 15 20 23 24]...			
24*3+[1 2 3 4 5 9 10 11]];

waterCTRL=[];
trackingError=[];
group2=1:size(all_fish,1);
group2(:,([group1 waterCTRL trackingError]))=[];                                          
allgroups=sort([group1,group2,waterCTRL,trackingError]);                                  

% names of the groups 
name_group1='eaat2a';
name_group2='control';

% categorical grouping varibles
group_category=categorical(1:size(all_fish,1)).';                                                            
group_category(group1)= name_group1;                                                            
group_category(group2)= name_group2;                                                            
group_category(waterCTRL)='waterCtrl';
group_category(trackingError)='errorInTracking';

% number of fish in total
nROIs = size(all_fish,1);       

%% Calculation - Mean velocity 
tic
[all_fish]=aj_meanVelocity_20200205(all_fish,nROIs,timebin,folder_path_save,fish_name,date_exp,conversion_factor);

%% Calculation - Mean acceleration
[all_fish]=aj_acceleration_20200206(all_fish,nROIs,timebin,folder_path_save,fish_name,date_exp);

%% Calculation - Sum of distance
[all_fish]=aj_distCalculation_20200311(all_fish,nROIs,timebin,folder_path_save,fish_name,date_exp,conversion_factor);
toc
%% Calculation - Information about activity and inactivity 
tic
[all_fish]=aj_activity_20200303(all_fish,nROIs,timebin,folder_path_save,fish_name,date_exp,figures_subfolder,group1,group2,allgroups,name_group1,name_group2);

%% Calculation - Treshold velocity and acceleration and binarization of these
[all_fish]=aj_binarizeData(all_fish,nROIs,timebin,folder_path_save,fish_name,date_exp,conversion_factor);

%% Calculation - Seizurepoint defined as activty followed by inactivity
[all_fish]=aj_seizureBarCode1(all_fish,nROIs,timebin,folder_path_save,fish_name,date_exp,conversion_factor);
toc
%% Calculation - probability distribution of postion of the fish
[all_fish]=aj_pdfPosition (all_fish,nROIs,folder_path_save,fish_name,date_exp,figures_subfolder,group1,group2,allgroups,name_group1,name_group2);

%% Calculate timestamp of the transiotino between spontanious behaviour to evoked behaviour 
% Find indexes of the lights are turned on and off
idxLightsOn  = zeros(nROIs,20);
idxLightsOff = zeros(nROIs,21);
for ROI=1:length(all_fish)
    idxLightsOn(ROI,:) = (find (diff(all_fish{ROI, 1}.lightsInfo)==1)+1)';
    idxLightsOff(ROI,:) = (find (diff(all_fish{ROI, 1}.lightsInfo)==-1)+1)';   
end

% Find the bin number (second) of when this transition is taking place
transitionTime = all_fish{1, 1}.timestampLight(idxLightsOff(1,1));

%% Calculation and plots of spontanious activity, but does not include inactivity plot
[all_fish]= aj_spontaniousBehaviourCalculationPlot (all_fish,timebin,folder_path_save,fish_name,date_exp,group1,group2,name_group1,name_group2,figures_subfolder,group_category,trackingError,nROIs,transitionTime,trackingError);

%% Plot activity pattern of spontanious activity and conditioned activity
[all_fish]=aj_characterizeActivity_20200306 (all_fish,timebin,folder_path_save,fish_name,date_exp,group1,group2,name_group1,name_group2,figures_subfolder, group_category,trackingError,nROIs);

%% Calculation and plots for the stimulus assay, but does not include plots  
[all_fish]= aj_evokedBehaviour20200319 (all_fish,timebin,folder_path_save,fish_name,date_exp,group1,group2,name_group1,name_group2,figures_subfolder,group_category,trackingError,nROIs,transitionTime);

