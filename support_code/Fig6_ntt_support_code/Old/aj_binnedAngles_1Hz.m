function [results]= aj_binnedAngles_1Hz(results,flds)


for j=1:length(flds)-5
    timebin =1; % in seconds
    all_fish = results.(flds{j,1});
    nROIs = length (all_fish);
    
    for ROI = 1:nROIs
        % load variables
        t           = all_fish{ROI,1}.t(1:end-1);
        ang         = all_fish{ROI,1}.ang;
        n_bins      = round(max(all_fish{ROI,1}.t(1:end-1))/timebin);
        
        %% calculate binned ang
        
        bA_temp=nan(1,n_bins-1);
        for i=1:n_bins-1
            bA_temp(i)= sum(ang(t>(i-1)*timebin & t<=i*timebin),'omitnan');   % kompenser forskyvningen nan -data - nan
        end
        
        %% save binned angles data  
        results.(flds{j,1}){ROI,1}.binnedAng1Hz = bA_temp;  
        
    end 
    
    
end 