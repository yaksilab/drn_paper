close all;
clear all;

%% Variables to be adjusted for each recording
folder_path='\\forskning.it.ntnu.no\ntnu\mh-kin\yaksi\Ahmed\Behaviour\Spring2020\S280FData\BaselineLightsON'; %folder where data for experiment is found
folder_path_save='\\forskning.it.ntnu.no\ntnu\mh-kin\yaksi\Ahmed\Behaviour\Spring2020\S280FData\BaselineLightsON'; %folder for saving .mat file with analyzed data
filename = [''];
fish_name='S280F-ON';                        % name of dataset (e.g. name of fish line + length of recording)
date_exp='20200222JAN_FEB';                         % date of recording(s)
exp_nr=1;                                           % number of experiment

%% Constant variables
mkdir (folder_path_save,'\Figures'); %makes a 'Figures' directory under the 'folder_path' directory (gets error message if already exists)
figures_subfolder='Figures';
conversion_factor=0.26458; %to convert from pixels to mm
timebin=1; %in seconds
timebin_ms=timebin*1000; %in milliseconds
timebinLong=600;

heatmap_value=400;
x_lim = 400; %X limit heatmap
y_lim = 400; %Y limit heatmap

%% Load data from .csv file
[all_fish]=aj_loaddata_20200202(nROIs,conversion_factor,timebin,filename,fish_name,date_exp,folder_path,folder_path_save);

% load([folder_path,filesep,filename]); %Loads one mat_file, remember to
% have the right name ending . for the file

%% Load more than one csv file
% 
% source      = '\\forskning.it.ntnu.no\ntnu\mh-kin\yaksi\Ahmed\Behaviour\Spring2020\S280FData';
% stk_files   = dir(fullfile(source, 'BaselineLightsON*')); % NB! remember to change the name of file
% 
% tic
% k = 1;
% for i = 1:length(stk_files)
%     
%     file = dir(fullfile([source,'\', stk_files(i).name],'*.csv'));
%     
%     for j = 1:length(file)
%         name_file = [file(j).folder, '\', file(j).name];
%         [all_fish((j-1)*24+1:j*24,1)]=aj_loaddata_20200202(conversion_factor,timebin,filename,name_file,fish_name,date_exp,folder_path,folder_path_save);
%         k = k+1;
%     end
% end
% toc
% 
% clearvars i j k file stk_files name_file k
% 
% % save([source,filesep,'JAN_FEB2020'])

%% Define fish groups
group1=[[2 5 6 10 11 12 13 14 20 21 22 23] (24+[1 2 5 6 11 14 15 19 21 22 23 24]) (24*2+[2 3 4 5 9 11 13 14 16 18 20 22]) (24*3+[1 5 6 7 9 10 11 13 17 18 20 24]) (24*4+[1 2 3 4 5 7 8 9]) (24*5+[7 11 16 19 22 23])];                    % ROIs for group 1 of fish, e.g. -/- genotype
waterCTRL=[];
group2=[1:size(all_fish,1)];
group2(:,([group1 waterCTRL]))=[];                                          % ROIs for group 2 of fish, e.g. +/- genotype
% group4=[2,4,6,7,11,14,18,19,21,23]; %ROIs for group 4 of fish, e.g. -/- genotype
allgroups=sort([group1,group2,waterCTRL]);                                  %,group3]; %combines group arrays; to be used e.g.
% in heatmaps and trajectory plots (please include only the groups used in
% actual experiment, if only one group write [group1], if 2 groups
% [group1,group2] and so on.
name_group1='mutants';
name_group2='ctrl';
% name_group3='WT';
group_category=categorical([1:size(all_fish,1)]).';                                                            % name_group4='NaN';
group_category(group1)='mutant';                                                            % fish number 7
group_category(group2)='control';                                                            % and nine of
group_category(waterCTRL)='waterCtrl';
nROIs = size(all_fish,1);                                   %no. of fish in total


%% Mean velocity - calculation
% load([folder_path_save,filesep,fish_name,date_exp '_data.mat']);
% nROIs=size(all_fish,1);
tic
[all_fish]=aj_meanVelocity_20200205(all_fish,nROIs,timebin,folder_path,folder_path_save,fish_name,date_exp,conversion_factor);
toc

%% Mean velocity - plotting - plots heatmap imagesc of velocity, histograms, boxplot and violinplot
% load([folder_path_save,filesep,fish_name,date_exp '_data.mat']);
% nROIs=size(all_fish,1);
tic
[all_fish]=aj_meanvelocity_plot_20200206_2groups(all_fish,nROIs,timebin,folder_path,folder_path_save,fish_name,date_exp,figures_subfolder,group1,group2,allgroups,name_group1,name_group2);
toc
%% Mean acceleration - calculation
% load([folder_path_save,filesep,fish_name,date_exp '_data.mat']);
% nROIs=size(all_fish,1);
[all_fish]=aj_acceleration_20200206(all_fish,nROIs,timebin,folder_path,folder_path_save,fish_name,date_exp);

%% Mean acceleration - plotting
% load([folder_path_save,filesep,fish_name,date_exp '_data.mat']);
% nROIs=size(all_fish,1);
[all_fish]=aj_accelerationPlot_2groups(all_fish,nROIs,timebin,folder_path,folder_path_save,fish_name,date_exp,figures_subfolder,group1,group2,allgroups,name_group1,name_group2);

%% Inactivity - calculation
% load([folder_path_save,filesep,fish_name,date_exp '_data.mat']);
% nROIs=size(all_fish,1);
[all_fish]=sm_inactivity_20191013(all_fish,nROIs,timebin,folder_path,folder_path_save,fish_name,date_exp,figures_subfolder,group1,group2,allgroups,name_group1,name_group2);

%% Inactivity - plotting
% load([folder_path_save,filesep,fish_name,date_exp '_data.mat']);
% nROIs=size(all_fish,1);
[all_fish]=sm_inactivity_plot_20191013(all_fish,nROIs,timebin,folder_path,folder_path_save,fish_name,date_exp,figures_subfolder,group1,group2,allgroups,name_group1,name_group2);

% % % % %% Thresholds - calculation
% % % % % load([folder_path_save,filesep,fish_name,date_exp '_data.mat']);
% % % % % nROIs=size(all_fish,1);
% % % % [all_fish]=sm_threshold_20191125(all_fish,nROIs,timebin,folder_path,folder_path_save,fish_name,date_exp,figures_subfolder,group1,group2,allgroups,name_group1,name_group2);
% % % % 
% % % % % not working because of the different sizes of th vestpors
% % % % %% Thresholds - plotting
% % % % % load([folder_path_save,filesep,fish_name,date_exp '_data.mat']);
% % % % % nROIs=size(all_fish,1);
% % % % [all_fish]=sm_threshold_plot_20191125(all_fish,nROIs,timebin,folder_path,folder_path_save,fish_name,date_exp,figures_subfolder,group1,group2,allgroups,name_group1,name_group2);

%% Get angles with the circle fitted trajectory for 1 sec timebins. output is binary
% % % % % % % % % % gives sum og angles
% % % % % % % % % % [all_fish] = aj_circfitAngles_20200211(timebin,nROIs,all_fish,allgroups,filename,fish_name,date_exp,folder_path,folder_path_save);
% % % % % % % % % %
% % % % % % % % % % % version two, here angle is calculated between the first and the last
% % % % % % % % % % % point and the centrepoint
% % % % % % % % % %
% % % % % % % % % % [all_fish] = aj_circfitAngles_20200211_1(timebin,nROIs,all_fish,allgroups,filename,fish_name,date_exp,folder_path,folder_path_save);
% % % % % % % % % %
% % % % % % % % % % % version three this one works best
% % % % % % % % % % %
% % % % % % % % % % [all_fish] = aj_circfitAngles_20200211_2(timebin,nROIs,all_fish,allgroups,filename,fish_name,date_exp,folder_path,folder_path_save);

%% Get angles binned by 1 sec, might be the wrong approac, because angles are calculated in relation to the previous point

[all_fish]=aj_getAngles(timebin,nROIs,all_fish,allgroups,fish_name,date_exp,folder_path,folder_path_save);

%% Binarize data
[all_fish]=aj_binarizeData(all_fish,nROIs,timebin,folder_path,folder_path_save,fish_name,date_exp,conversion_factor);

%% Create barcodes for epoch with activity followed by inactivity, the avtivity is above treshold of 15 mm/s -->1, leave this be
%  Inactivityperiod is defined as timebin-meanvelocity = 0 mm/s --> 0
%  Activity below treshold is defined as 1
[all_fish]=aj_seizureBarCode1(all_fish,treshold_value,nROIs,timebin,folder_path,folder_path_save,fish_name,date_exp,conversion_factor);

%% Creates barcodes with epochs that are defined in aj_seizureBarCode1 with more than 3/4pi swirls
%  Makes trajectory plots of the time bins and adjacent time bins, and saves them as .gif
%  Makes lineplot of the binarized data to visualize when and which fish
%  fufills the requirements for a seizure
[all_fish]=aj_seizurePoints(nROIs,all_fish,allgroups,fish_name,date_exp,folder_path,folder_path_save);

%% Plot trajectory
% load([folder_path_save,filesep,fish_name,date_exp '_data.mat']);
% nROIs=size(all_fish,1);
% [all_fish]=aj_plot_trajectory_2groups_20200204(all_fish,nROIs,folder_path,filesep,figures_subfolder,date_exp,fish_name,timebinLong,x_lim,y_lim,allgroups);

%% Plot heatmap trajectory
%NB! If error message, check if NaNs at the end of data set!
% load([folder_path_save,filesep,fish_name,date_exp '_data.mat']);
% nROIs=size(all_fish,1);
sm_trajectory_heatmap_3groups_20170712(all_fish,nROIs,timebinLong,folder_path,filesep,figures_subfolder,date_exp,fish_name_base,allgroups);