function [all_fish]=aj_seizureBarCode1(all_fish,nROIs,timebin,folder_path_save,fish_name,date_exp,conversion_factor,SeizureBarcode_thresholds )

% Find epochs with activityperiod followedby inactivity for all fish, barcodes from binarized data

for ROI=1:size(all_fish,1)
    
    mat= cell(length(SeizureBarcode_thresholds),1);
    treshold_value=SeizureBarcode_thresholds;
    for j=1:size(treshold_value,1)
        for i=1:floor(max(all_fish{ROI,1}.t))
            if treshold_value(j,:)==1
                if all_fish{ROI,1}.bV_E4sd(i) >= treshold_value(j,:) % treshold value
                    mat{j,1}(:,i)=2;
                else
                    mat{j,1}(:,i)=0;
                end
            else
                if all_fish{ROI,1}.bV_E4sd(i) >= treshold_value(j,:) % treshold value
                    mat{j,1}(:,i)=2;
                elseif (all_fish{ROI,1}.bV_E4sd(i) < treshold_value(j,:) ...
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
        for i=2:floor(max(all_fish{ROI,1}.t))
            if (mat{j,1}(:,i-1)==2 && mat{j,1}(:,i)==0)
                mat1{j,1}(:,i-1)=1;
            else
                mat1{j,1}(:,i-1)=0;
            end
        end
    end
    
    
    
    %% Save barcodes
    all_fish{ROI,1}.barCode.velTresholdSeizure            =  mat1;            % contains barcode for every timebin, where activity is followed by inactivity for treshold_values from 1 to 20
    for j=1:length(mat1)
        all_fish{ROI,1}.barCode.nTresholdSeizure(j,:)     =  sum(mat1{j,1},2);
    end
    %% Find the indexes of the timebins with activity followed by inactivity
    for i=1:length(mat1)
        indexes{i,:}  = find(mat1{i,1}(1,:) == 1)+1;
    end
    all_fish{ROI,1}.barCode.indexes = indexes;
    %% clear temporary variables
    
    mat=[];
    mat1=[];
    
end

%% SAVE
save([folder_path_save,filesep,fish_name,date_exp '_data.mat'],'all_fish','-v7.3');


