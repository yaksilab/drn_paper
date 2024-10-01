function [results]= aj_binnedAngles(results,flds)


for j=1:length(flds)-3
    timebin =1/2.433846153846; % in seconds
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
        results.(flds{j,1}){ROI,1}.binnedAng2_43 = bA_temp;  
        
    end 
    
    
end 