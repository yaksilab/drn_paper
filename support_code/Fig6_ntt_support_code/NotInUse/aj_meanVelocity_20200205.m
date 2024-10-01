function [all_fish]=aj_meanVelocity_20200205(all_fish,nROIs,timebin,folder_path_save,fish_name,date_exp,conversion_factor)
% The function calculates mean velocity from x-y data


for ROI=1:nROIs
    %% Load variables
    
    t           = all_fish{ROI,1}.t;
    dX          = diff(all_fish{ROI,1}.x);
    dY          = diff(all_fish{ROI,1}.y);
    dt          = all_fish{ROI,1}.dt;
    
    n_bins2     = floor(max(all_fish{ROI,1}.t)/timebin);
    
    %% Calculate speed over time and delta-time
    
    V1 = nan(1,length(dt));
    V2 = V1;
    
    for j=1:length(dt)-1
        V1(j)=sqrt((dX(j)^2 + dY(j)^2))/dt(j);                           % speed calculation using Pythagorean theorem
        V2(j)=V1(j)*conversion_factor;                                   % velocity in mm/s
    end
    
    clear V1
    
    %% Calculate mean velocity
    
    
    mean_velocity_temp=nan(1,n_bins2);
    for i=1:n_bins2
        mean_velocity_temp(i)= mean(V2 ...
            (t>(i-1)*timebin & t<=i*timebin));
    end
    
    %% Save data inn cell array
    
    all_fish{ROI,1}.speed_over_time     =   V2;
    all_fish{ROI,1}.mean_velocity       =   mean_velocity_temp;
    n_bins2                             =   [];
end

% save([folder_path_save,filesep,fish_name,date_exp '_data.mat'],'all_fish','-v7.3');