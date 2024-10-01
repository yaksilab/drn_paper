function [highVel_thresholds, SeizureBarcode_thresholds] = aj_highVel_thresholds_20210219 (all_fish,nROIs,timebin,folder_path_save,fish_name,date_exp,figures_subfolder,group1,group2,group3,group4,allgroups,name_group1,name_group2)

% finding tresholds for high velocity activity definitions

%% make array of the binned 1 sec velocities

matrix = cell(nROIs,1);

for ROI=1:length(all_fish)
    matrix{ROI,1} = all_fish{ROI, 1}.bV_E4sd;    
end


for ROI=1:length(all_fish)
    
    if ismember(ROI,group4) 
        matrix{ROI,1} = [];
    elseif nanmean(matrix{ROI,1}) == 0
        matrix{ROI,1} =[];
    end 
    
end 

baseTresholdCalcArray = matrix(~cellfun('isempty', matrix'));

%% add nans to make the cell arrays equal

Lengths = nan(length(baseTresholdCalcArray),1);

for i= 1: length(baseTresholdCalcArray)
    Lengths(i) = length (baseTresholdCalcArray{i,1});
end 
    maxLenght = max (Lengths);
    
baseTresholdCalcMatrix = nan (length(baseTresholdCalcArray),maxLenght);
for i=1: length(baseTresholdCalcArray)    
    baseTresholdCalcMatrix(i,1:length(baseTresholdCalcArray{i,1})) = baseTresholdCalcArray{i,1};
end 

%% Define thresholds

thresholds = nan(5,1);

        % thresholds(1,1) = prctile (baseTresholdCalcMatrix,95.45,'all'); % 2sd 
        % thresholds(2,1) = prctile (baseTresholdCalcMatrix,98.76,'all'); % 2.5sd
        % thresholds(3,1) = prctile (baseTresholdCalcMatrix,99.73,'all'); % 3sd
        % thresholds(4,1) = prctile (baseTresholdCalcMatrix,99.95,'all'); % 3.5 sd
        % thresholds(5,1) = prctile (baseTresholdCalcMatrix,99.99,'all'); % 4sd

steps = [2:0.5:4];

for i = 1:length(steps)
thresholds(i,1) = nanmean (baseTresholdCalcMatrix,'all') + steps(1,i)*std (baseTresholdCalcMatrix,[],'all','omitnan'); 
end 

% highVel_thresholds = thresholds; 

%% with removed zero values
% baseTresholdCalcMatrix1 = baseTresholdCalcMatrix;
% baseTresholdCalcMatrix1 = baseTresholdCalcMatrix1(~(baseTresholdCalcMatrix1==0));
% 
% steps1 = [2:0.5:4];
% for i = 1:length(steps1)
%     thresholds2(i,1) = mean (baseTresholdCalcMatrix1,'omitnan') + steps1(1,i)*std (baseTresholdCalcMatrix1,[],'all','omitnan'); 
% end 
%% create output

highVel_thresholds = thresholds; 

%% seizure barcode thresholds based on velocity data with omitted zeros value

% steps2 = [.5:0.5:5];
% 
% for i = 1:length(steps2)
%     thresholdsBarcode(i,1) = nanmean (baseTresholdCalcMatrix1,'all') + steps2(1,i)*std (baseTresholdCalcMatrix1,[],'all','omitnan'); 
% end 
% 
% SeizureBarcode_thresholds = thresholdsBarcode;

%% seizure barcode thresholds based on velocity data with zeros value


steps3 = [.5:0.5:5];

for i = 1:length(steps3)
    thresholdsBarcode1(i,1) = nanmean (baseTresholdCalcMatrix,'all')...
        + steps3(1,i)*std (baseTresholdCalcMatrix,[],'all','omitnan'); 
end 

SeizureBarcode_thresholds = thresholdsBarcode1;






