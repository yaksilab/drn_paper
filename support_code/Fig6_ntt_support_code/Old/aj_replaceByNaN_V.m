function [all_fish,threshold, nVReplaced, n_replaced_g1, n_replaced_g2, n_replaced_g3, n_replaced_g4, n_replaced_g5, n_replaced_g6, n_replaced_g7, n_replaced_g8, n_replaced_g9] = aj_replaceByNaN_V (all_fish,folder_path_save,fish_name,date_exp,group1,group2,group3, group4, group5, group6, group7, group8, group9,group10, nROIs)


% find treshold for removing  1sc velocity bins as unrealistic 
%% make array of the binned 1 sec velocities

matrix = cell(nROIs,1);

for ROI=1:length(all_fish)
    matrix{ROI,1} = all_fish{ROI, 1}.binnedVel_1;    
end

for ROI=1:length(all_fish)
    
    if ismember(ROI,group10) 
        matrix{ROI,1} = [];
    elseif mean(matrix{ROI,1},'omitnan') == 0
        matrix{ROI,1} =[];
    end 
    
end 

baseTresholdCalcArray = matrix(~cellfun('isempty', matrix'));

%% add nans to make the cellarrys equal

Lengths = nan(length(baseTresholdCalcArray),1);

for i= 1: length(baseTresholdCalcArray)
    Lengths(i) = length (baseTresholdCalcArray{i,1});
end 
    maxLenght = max (Lengths);
    
baseTresholdCalcMatrix = nan (length(baseTresholdCalcArray),maxLenght);
for i=1: length(baseTresholdCalcArray)    
    baseTresholdCalcMatrix(i,1:length(baseTresholdCalcArray{i,1})) = baseTresholdCalcArray{i,1};
end 

%% find treshold - method one, covers virtually all velocities, but excludes highly unlikely velocities, that might be du to a tracking error. 
            % figure; 
            % imagesc(baseTresholdCalcMatrix)
            % caxis ([0 prctile(baseTresholdCalcMatrix,99.994,'all')]) 
            % colorbar

threshold = 75;%prctile(baseTresholdCalcMatrix,99.9936,'all'); % 99.9936 percentile is 4SD from the overall mean velocity of a standard 


%% find treshold with this: based on max-velocities, but might have more errors because less values used in the definition
% 
maxTresholdCalcMatrix = max(baseTresholdCalcMatrix,[],2);
treshold1 =(prctile(maxTresholdCalcMatrix,(mean(maxTresholdCalcMatrix)+3*std(maxTresholdCalcMatrix,[],'all'))/max(maxTresholdCalcMatrix),'all')); % this includes 99.7 % of all max-velocities

            % figure , plot(maxTresholdCalcMatrix)
            % yline (threshold)


%% plot figures 
            % 
            % for i= 1: size (baseTresholdCalcMatrix,1)
            %    figure, 
            %    plot (baseTresholdCalcMatrix(i,:)),   
            %    yline(prctile(baseTresholdCalcMatrix,99.9936,'all'))  
            %    title (num2str(i))
            % end

%% remove the velocities above treshold with this 


for ROI=1:length (all_fish)
    all_fish{ROI, 1}.bV_E4sd = all_fish{ROI, 1}.binnedVel_1;
    all_fish{ROI, 1}.bV_E4sd(all_fish{ROI, 1}.bV_E4sd > threshold) = NaN;
end 

%% number of bins replaced with nan
nVReplaced = nan (length(all_fish),1);
for ROI= 1:length (all_fish)
    a                    =   all_fish{ROI, 1}.bV_E4sd == all_fish{ROI, 1}.binnedVel_1;
    nVReplaced(ROI,1)    =   length(all_fish{ROI, 1}.binnedVel_1)- 10 - sum(a);
    a                    =   [];
end 



n_replaced_g1 = sum(nVReplaced(group1));
n_replaced_g2 = sum(nVReplaced(group2));
n_replaced_g3 = sum(nVReplaced(group3));
n_replaced_g4 = sum(nVReplaced(group4));
n_replaced_g5 = sum(nVReplaced(group5));
n_replaced_g6 = sum(nVReplaced(group6));
n_replaced_g7 = sum(nVReplaced(group7));
n_replaced_g8 = sum(nVReplaced(group8));
n_replaced_g9 = sum(nVReplaced(group9));


save([folder_path_save,filesep,fish_name,date_exp '_data.mat'],'all_fish','-v7.3');

