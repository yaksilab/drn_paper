function [all_fish]=aj_distCalculation_20200311(all_fish,nROIs,timebin,folder_path_save,fish_name,date_exp,conversion_factor);
% The function calculates distances from x-y data


for ROI=1:nROIs 
    t           = all_fish{ROI,1}.t;
    dT          = all_fish{ROI,1}.dt;
    dX          = diff(all_fish{ROI,1}.x);
    dY          = diff(all_fish{ROI,1}.y);
    n_bins2     = floor(max(all_fish{ROI,1}.t)/timebin);
    
    S           = nan(1,length(dT));
    
    for i=1:length(dT)-1
    S (i)   = sqrt(dX(i)^2+dY(i)^2)*conversion_factor;
    end 
    
     

    
    %% Calculate binned distances
        s_temp=nan(1,n_bins2);
        for i=1:n_bins2
            s_temp(i)= sum(S ...
                    (t>(i-1)*timebin & t<=i*timebin));   
        end 
    
    %% Save data inn cell array
    all_fish{ROI,1}.rawDistance                 =   S       ;
    all_fish{ROI,1}.calcBinnedDistance          =   s_temp  ;
    
end
save([folder_path_save,filesep,fish_name,date_exp '_data.mat'],'all_fish','-v7.3');
