function [all_fish]=aj_velocity_2_43Hz_202106_25(all_fish,nROIs,folder_path_save,fish_name,conversion_factor)
% The function calculates mean velocity from delra distance data, the
% delta distance is given by the tracking software and corrected for noise
% by some predefined treshold set by the providers


timebin =1/2.433846153846; % in seconds

parfor ROI=1:nROIs
    %% Load variables
    t           = all_fish{ROI,1}.t(1:end-1);
    s           = all_fish{ROI,1}.distance;
    n_bins      = round(max(all_fish{ROI,1}.t)/timebin);
    
    
    %% Calculate velocity per 5 second
    
    bV_temp=nan(1,n_bins);
    for i=1:n_bins
        bV_temp(i)= sum(s(t>(i-1)*timebin & t<=i*timebin),'omitnan')...
                    /timebin;
    end
    
    %% Save data inn cell array
    all_fish{ROI,1}.binnedVel2_43Hz         =   bV_temp;
end

% save([folder_path_save,filesep,fish_name,date_exp '_data.mat'],'all_fish','-v7.3');