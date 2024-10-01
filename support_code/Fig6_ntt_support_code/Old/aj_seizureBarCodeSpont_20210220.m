function [all_fish] = aj_seizureBarCodeSpont_20210220(all_fish,nROIs,timebin,folder_path_save,fish_name,date_exp,conversion_factor,SeizureBarcode_thresholds,transitionTime)

% Find epochs with activityperiod followedby inactivity for all fish, barcodes from binarized data
% calculates also for the evoked behaviour part of the expirement and is
% saved separately 

for ROI=1:size(all_fish,1)
    
    mat= cell(length(SeizureBarcode_thresholds),1);
    
    treshold_value=SeizureBarcode_thresholds;
    for j=1:size(treshold_value,1)
        for i=1:length(all_fish{ROI,1}.bV_E4sd)
            if treshold_value(j,:)==1
                if all_fish{ROI,1}.bV_E4sd(i) >= treshold_value(j,:) % treshold value
                    mat{j,1}(:,i)=2;
                else
                    mat{j,1}(:,i)=0;
                end
            else
                if all_fish{ROI,1}.bV_E4sd(i) >= treshold_value(j,:) % treshold value
                    mat{j,1}(:,i)=2;
                elseif ( all_fish{ROI,1}.bV_E4sd(i) < treshold_value(j,:) ...
                        && all_fish{ROI,1}.bV_E4sd(i) > 0)
                    mat{j,1}(:,i)=1;
                else
                    mat{j,1}(:,i)=0;
                end
            end
        end
    end
    
    % gives values from 0 to 2, where 0 is inactivity, 1 is activity with
    % velocity >0 and less than treshold value and 2 is every velocity
    % larger than treshold
    
    %% Find all the periods where acitivity is followed by inactivity
    
    mat1=cell(size(mat));
    for j=1:size(mat,1)
        for i=2:length(all_fish{ROI,1}.bV_E4sd)
            if (mat{j,1}(:,i-1)==2 && mat{j,1}(:,i)==0)
                mat1{j,1}(:,i-1)=1;
            else
                mat1{j,1}(:,i-1)=0;
            end
        end
    end
    
    
    
    %% Save barcodes
    for i=1:length(mat1)
        all_fish{ROI,1}.SponBehaviour.seizureBarcode{i,1}           =  mat1{i,1}(1,1:transitionTime);            % contains barcode for every timebin, where activity is followed by inactivity for treshold_values from 1 to 20
        all_fish{ROI, 1}.SponBehaviour.seizureBarcode{i,2}          =  sum(mat1{i,1}(1:transitionTime),2);
    end
    %% Find the indexes of the timebins with activity followed by inactivity
    for i=1:length(mat1)
        all_fish{ROI, 1}.SponBehaviour.seizureBarcode{i,3}        = find(mat1{i,1}(1,1:transitionTime) == 1)+1;
    end
   
    %% save the evoked behaviour part
    
        for i=1:length(mat1)
            all_fish{ROI,1}.eB.seizureBarcode{i,1}          =  mat1{i,1}(1,3646:end);            % contains barcode for every timebin, where activity is followed by inactivity for treshold_values from 1 to 20
            all_fish{ROI, 1}.eB.seizureBarcode{i,2}         =  sum(mat1{i,1}(3546:end),2);
        end
        for i=1:length(mat1)
            all_fish{ROI, 1}.eB.seizureBarcode{i,3}        = find(mat1{i,1}(1,3646:end) == 1)+1;
        end
        
    %% clear temporary variables
   
    mat=[];
    mat1=[];
    
end

%% SAVE
save([folder_path_save,filesep,fish_name,date_exp '_data.mat'],'all_fish','-v7.3');


