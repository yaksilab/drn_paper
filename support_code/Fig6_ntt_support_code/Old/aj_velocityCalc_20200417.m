function [all_fish]=aj_velocityCalc_20200417(all_fish,nROIs,timebin,folder_path_save,fish_name,conversion_factor)
% The function calculates mean velocity from delra distance data, the
% delta distance is given by the tracking software and corrected for noise
% by some predefined treshold set by the providers

timebin = 1; 
parfor ROI=1:nROIs
    %% Load variables
    t           = all_fish{ROI,1}.t;
    dt          = all_fish{ROI,1}.dt;
    s           = all_fish{ROI,1}.distance;
    n_bins      = floor(max(all_fish{ROI,1}.t)/timebin);
    
    %% Calculate speed over time and delta-time
    V1 = nan(1,length(dt));
    for j=1:length(dt)-1
        V1(j)= (s(j+1))/dt(j);
    end
    
    %% Calculate velocity per second
    
    bV_temp=nan(1,n_bins);
    for i=1:n_bins
        bV_temp(i)= sum(s(t>(i-1)*timebin & t<=i*timebin))/...
                    sum(dt(t>(i-1)*timebin & t<=i*timebin));
    end
    %% Save data inn cell array
    all_fish{ROI,1}.speed_over_time     =   V1;
    all_fish{ROI,1}.binnedVel_1         =   bV_temp;
end

% save([folder_path_save,filesep,fish_name,date_exp '_data.mat'],'all_fish','-v7.3');