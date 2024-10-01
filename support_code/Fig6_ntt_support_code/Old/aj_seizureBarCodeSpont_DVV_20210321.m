function [all_fish] = aj_seizureBarCodeSpont_DVV_20210321(all_fish,nROIs,timebin,folder_path_save,fish_name,date_exp,transitionTime,SeizureBarcode_thresholds_dvv)

% Find epochs with activityperiod followedby inactivity for all fish, barcodes from binarized data

for ROI=1:nROIs
    
    mat= cell(length(SeizureBarcode_thresholds_dvv),1);
    
    threshold_value=SeizureBarcode_thresholds_dvv;
    
    for j=1:size(threshold_value,1)
        for i=1:3600
            if threshold_value(j,:)==1
                if all_fish{ROI, 1}.SponBehaviour.DVV_trad(i) >= threshold_value(j,:) % treshold value
                    mat{j,1}(:,i)=2;
                else
                    mat{j,1}(:,i)=0;
                end
            else
                if all_fish{ROI, 1}.SponBehaviour.DVV_trad(i) >= threshold_value(j,:) % treshold value
                    mat{j,1}(:,i)=2;
                elseif ( all_fish{ROI, 1}.SponBehaviour.DVV_trad(i) < threshold_value(j,:) ...
                        && all_fish{ROI, 1}.SponBehaviour.DVV_trad(i) > - threshold_value(j,:))
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
        for i=2:3600
            if (mat{j,1}(:,i-1)==2 && mat{j,1}(:,i)==0)
                mat1{j,1}(:,i-1)=1;
            else
                mat1{j,1}(:,i-1)=0;
            end
        end
    end
    
    
    
    %% Save barcodes
    all_fish{ROI,1}.SponBehaviour.seizureBarcode_DVV            =  mat1;            % contains barcode for every timebin, where activity is followed by inactivity for treshold_values from 1 to 20
    for i=1:length(mat1)
        all_fish{ROI, 1}.SponBehaviour.seizureBarcode_DVV{i,2}        =  sum(mat1{i,1},2);
    end
    %% Find the indexes of the timebins with activity followed by inactivity
    for i=1:length(mat1)
        all_fish{ROI, 1}.SponBehaviour.seizureBarcode_DVV{i,3}        = find(mat1{i,1}(1,:) == 1);
    end
    %% save the threshold
    for i=1:length(mat1)
        all_fish{ROI, 1}.SponBehaviour.seizureBarcode_DVV{i,4}        = SeizureBarcode_thresholds_dvv(i,:);
    end
    %% clear temporary variables
    
    mat=[];
    mat1=[];
    
end

%% SAVE


