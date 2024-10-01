function [Excluded,exclusionTreshold] = aj_percentileVelocities (all_fish,nROIs,folder_path_save,fish_name,date_exp,figures_subfolder,group1,group2,allgroups,name_group1,name_group2);


% 
% mat = nan(nROIs,9500);
% for ROI=1:nROIs
%     mat(ROI,:) = all_fish{ROI,1}.binnedVel(1,1:9500);
% end 
% figure 
% imagesc (mat)
% colormap (flipud(hot))
% caxis ([0 (prctile(mat,99.5, 'all')+ 2*std (mat,[],'all','omitnan'))])
% colorbar
% 
% 
%     
% prctile(mat,99.5, 'all')+ 2*std (mat,[],'all','omitnan');


Percentile995 = nan (1,nROIs);
Y             = nan (1,nROIs);
for ROI = 1: nROIs
    Percentile995 (ROI) =  prctile (all_fish{ROI,1}.binnedVel,99.5,'all');
    Y(ROI) = max(all_fish{ROI,1}.binnedVel);
end

% a= Percentile995 >(prctile(mat,99.5, 'all')+ 2*std (mat,[],'all','omitnan'));

[exclusionTreshold] = mean (Percentile995)+2*std(Percentile995,1,2);



f100=figure();
plot (Percentile995(1,:), 'Marker', 'o'), hold  on
% yline (30)
yline(exclusionTreshold); hold off
box off
ylabel ('99.9th percentile velocity (mm/s)')
xlabel ('Fish')






Excluded = find (Y>exclusionTreshold);
% a = find (Y>= percentileVel(9,2));
remainingFish = Y;
remainingFish(:,Excluded)=[];
 
f101=figure();
subplot (1,2,1)
plot (Y), hold  on
yline(exclusionTreshold)
% yline(percentileVel(9,2)); hold off
box off
ylabel ('maxVelocity (mm/s)')
xlabel ('Fish')
ylim([0 max(Y)+1])

subplot (1,2,2)
plot (remainingFish), hold  on
yline (exclusionTreshold)
% yline(percentileVel(9,2)); hold off
box off
ylabel ('maxVelocity (mm/s)')
xlabel ('Fish')
ylim ([0 max(Y)+1])


%% save figures 
saveas (f100, [folder_path_save,filesep,figures_subfolder,filesep,fish_name,date_exp '_velocity_percentiles' '.fig']);
saveas (f100, [folder_path_save,filesep,figures_subfolder,filesep,fish_name,date_exp '_velocity_percentiles' '.jpg']);
saveas (f101, [folder_path_save,filesep,figures_subfolder,filesep,fish_name,date_exp '_velocity_percentiles' '.svg']);

saveas (f101, [folder_path_save,filesep,figures_subfolder,filesep,fish_name,date_exp '_velocity_percentiles_exclusion' '.fig']);
saveas (f101, [folder_path_save,filesep,figures_subfolder,filesep,fish_name,date_exp '_velocity_percentiles_exclusion' '.jpg']);
saveas (f101, [folder_path_save,filesep,figures_subfolder,filesep,fish_name,date_exp '_velocity_percentiles_exclusion' '.svg']);

%% clear variables

clearvars mat1 tresholdPercentile percentileVel Y ExcludeFishY