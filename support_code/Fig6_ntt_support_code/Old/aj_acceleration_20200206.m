function [all_fish]=aj_acceleration_20200206(all_fish,nROIs,timebin,folder_path_save,fish_name,date_exp)

% The function calculates mean linear acceleration (linear)

for ROI=1:nROIs
    %% Load variables
    
    t       = all_fish{ROI,1}.t;    
    dT      = (all_fish{ROI,1}.dt);
    dV      = diff(all_fish{ROI,1}.speed_over_time);
    dV1     = diff(all_fish{ROI,1}.binnedVel_1);
    n_bins2 = floor(max(all_fish{ROI,1}.t)/timebin);

    %% Calculate accelereation over time
    
    acceleration_temp = nan(1,length(dT));
    for j=1:length(dT)-1
        acceleration_temp(j)=(dV(j)/dT(j));
    end
    
    %% Calculate mean acceleratio
    
    binnedAcc=nan(1,n_bins2-1);
    for i=1:n_bins2-1
        if isnan(dV1(i))
            binnedAcc(i)=0/sum(dT(t>(i-1)*timebin & t<=i*timebin),1,'omitnan');
        else
            binnedAcc(i)=dV1(i)/sum(dT(t>(i-1)*timebin & t<=i*timebin),1,'omitnan');
        end 
    end
    
    %% Save data inn cell array
    
    all_fish{ROI,1}.acc_over_time   = acceleration_temp;
    all_fish{ROI,1}.binnedAcc       = binnedAcc;
    
end

% save([folder_path_save,filesep,fish_name,date_exp '_data.mat'],'all_fish','-v7.3');

















