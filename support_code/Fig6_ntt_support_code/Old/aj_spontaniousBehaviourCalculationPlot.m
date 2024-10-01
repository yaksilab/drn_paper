function [all_fish]= aj_spontaniousBehaviourCalculationPlot (all_fish,timebin,folder_path_save,fish_name,date_exp,group1,group2, group3,group4,group5,name_group1,name_group2,name_group3 ,name_group4, name_group5,figures_subfolder, group_category,nROIs,transitionTime,groups,name_groups, threshold,SeizureBarcode_thresholds)


%% mean acceleration plot for the first hour.

% Heatmap mean acceleration


%% Save the matrices in all_fish under spontanious behaviour

for i= 1:length(SeizureBarcode_thresholds)
treshold_value=SeizureBarcode_thresholds(i,:);
    for ROI=1:size(all_fish)
        all_fish{ROI,1}.SponBehaviour.seizureTreshold{i,3}=...
        (all_fish{ROI, 1}.barCode.velTresholdSeizure{i,1}(1:floor(transitionTime)));
    
        all_fish{ROI,1}.SponBehaviour.seizureTreshold{i,2}=...
        sum(all_fish{ROI, 1}.barCode.velTresholdSeizure{i,1}(1:floor(transitionTime)));
    
        all_fish{ROI,1}.SponBehaviour.seizureTreshold{i,1}=...
        num2str(treshold_value);
    end
end

%% make temporary matrix for plotting for the seizure barcode
temp_seizureTreshold = cell(length(SeizureBarcode_thresholds),1);
for i= 1:length (SeizureBarcode_thresholds)
    treshold_value=SeizureBarcode_thresholds(i,:);
    for ROI=1:size(all_fish)
        if ismember(ROI,group5)
            temp_seizureTreshold{i,1}(ROI,:)= nan(1,floor(transitionTime));
        else
            temp_seizureTreshold{i,1}(ROI,:)= vertcat(all_fish{ROI,1}.SponBehaviour.seizureTreshold{i,3});
        end
    end
end

%% Plots for seizure activity for the different treshold values

% for j=1:length(SeizureBarcode_thresholds)
%     
%         f5=[];
%         f5=figure();
%         f5.WindowState = 'maximized';
%         treshold_value = SeizureBarcode_thresholds(j,1);
%         sgtitle(['Treshold-Seizure' num2str(treshold_value)])
%         for i = 1:length(groups)-1
%             title(name_groups{1,i})
%             subplot(2,2,i)
%             imagesc (temp_seizureTreshold{j,1}(groups{:,i},:))
%         end 
%         box('off')
%         set(gca,'TickDir','out');
%        
% end
% 
% for j= 1:length (SeizureBarcode_thresholds)
%     if sum(temp_seizureTreshold{j,1},2)>=1
%     treshold_value = SeizureBarcode_thresholds(j,1);
%         f5=[];
%         f5=figure();
%         f5.WindowState = 'maximized';
%         sgtitle(['Treshold-Seizure' num2str(treshold_value)])
%         for i=1:size(temp_seizureTreshold{j, 1},1)
%             if sum(temp_seizureTreshold{j,1},2)>=1
%                 plot (temp_seizureTreshold{j,1}(i,:)+i),hold on
%             else
%                 text (nROIs/2,nROIs/2, 'No events fufilling the requirements','Color', 'r')
%             end
%         end
%         hold off
%         xlim([1 size(temp_seizureTreshold{j, 1},2)])
%         ylim([1 size(temp_seizureTreshold{j, 1},1)+1])
%         box('off')
%         xticks([]);
%         yticks(1:10:size(temp_seizureTreshold{j, 1},1))
%         set(gca,'TickDir','out');
%         
%         saveas (f5, [folder_path_save,filesep,figures_subfolder,filesep,fish_name,date_exp '_sponBehaviour_tresholdSeizure_',num2str(treshold_value) '.fig']);
%         saveas (f5, [folder_path_save,filesep,figures_subfolder,filesep,fish_name,date_exp '_sponBehaviour_tresholdSeizure_',num2str(treshold_value)  '.jpg']);
%         saveas (f5, [folder_path_save,filesep,figures_subfolder,filesep,fish_name,date_exp '_sponBehaviour_tresholdSeizure_',num2str(treshold_value)  '.svg']);
%     else
%     text (.25,.5, 'No seizure requirement met for seizure barcode','Color', 'r')
%     end
% end


%% plot treshold velocities

temp_binaryTreshold20   =   nan(size(all_fish,1),floor(transitionTime));
temp_binaryTreshold15   =   nan(size(all_fish,1),floor(transitionTime));
temp_binaryTreshold10   =   nan(size(all_fish,1),floor(transitionTime));
temp_binaryTreshold5    =   nan(size(all_fish,1),floor(transitionTime));
temp_binaryTreshold0    =   nan(size(all_fish,1),floor(transitionTime));

for ROI=1:size(all_fish,1)
    if ismember (ROI,group5)
        temp_binaryTreshold20(ROI,:) = nan(1,floor(transitionTime));
        temp_binaryTreshold15(ROI,:) = nan(1,floor(transitionTime));
        temp_binaryTreshold10(ROI,:) = nan(1,floor(transitionTime));
        temp_binaryTreshold5(ROI,:)  = nan(1,floor(transitionTime));
        temp_binaryTreshold0(ROI,:)  = nan(1,floor(transitionTime));
    else
        temp_binaryTreshold20(ROI,:) = all_fish{ROI, 1}.Binary.Vel20(1:floor(transitionTime));
        temp_binaryTreshold15(ROI,:) = all_fish{ROI, 1}.Binary.Vel15(1:floor(transitionTime));
        temp_binaryTreshold10(ROI,:) = all_fish{ROI, 1}.Binary.Vel10(1:floor(transitionTime));
        temp_binaryTreshold5(ROI,:)  = all_fish{ROI, 1}.Binary.Vel10(1:floor(transitionTime));
        temp_binaryTreshold0(ROI,:)  = all_fish{ROI, 1}.Binary.Inactive(1:floor(transitionTime));
    end
end

f6=figure();
f6.WindowState = 'maximized';
sgtitle('Treshold-(20)')
imagesc(temp_binaryTreshold20)
colorbar, colormap('parula')
xlabel ('Bin number')
ylabel ('Fish number')
box ('off')
saveas (f6, [folder_path_save,filesep,figures_subfolder,filesep,fish_name,date_exp '_sponBehaviour_velTreshold_20' '.fig']);
saveas (f6, [folder_path_save,filesep,figures_subfolder,filesep,fish_name,date_exp '_sponBehaviour_velTreshold_20' '.jpg']);
saveas (f6, [folder_path_save,filesep,figures_subfolder,filesep,fish_name,date_exp '_sponBehaviour_velTreshold_20' '.svg']);


f7=figure();
f7.WindowState = 'maximized';
sgtitle('Treshold-(15)')
imagesc(temp_binaryTreshold15)
colorbar, colormap('parula')
xlabel ('Bin number')
ylabel ('Fish number')
box ('off')
saveas (f7, [folder_path_save,filesep,figures_subfolder,filesep,fish_name,date_exp '_sponBehaviour_velTreshold_15' '.fig']);
saveas (f7, [folder_path_save,filesep,figures_subfolder,filesep,fish_name,date_exp '_sponBehaviour_velTreshold_15' '.jpg']);
saveas (f7, [folder_path_save,filesep,figures_subfolder,filesep,fish_name,date_exp '_sponBehaviour_velTreshold_15' '.svg']);

f8=figure();
f8.WindowState = 'maximized';

sgtitle('Treshold-(10)')
imagesc(temp_binaryTreshold10)
colorbar, colormap('parula')
xlabel ('Bin number')
ylabel ('Fish number')
box ('off')
saveas (f8, [folder_path_save,filesep,figures_subfolder,filesep,fish_name,date_exp '_sponBehaviour_velTreshold_10' '.fig']);
saveas (f8, [folder_path_save,filesep,figures_subfolder,filesep,fish_name,date_exp '_sponBehaviour_velTreshold_10' '.jpg']);
saveas (f8, [folder_path_save,filesep,figures_subfolder,filesep,fish_name,date_exp '_sponBehaviour_velTreshold_10' '.svg']);


f9=figure();
f9.WindowState = 'maximized';

sgtitle('Treshold-(5)')
imagesc(temp_binaryTreshold5)
colorbar, colormap('parula')
xlabel ('Bin number')
ylabel ('Fish number')
box ('off')
saveas (f9, [folder_path_save,filesep,figures_subfolder,filesep,fish_name,date_exp '_sponBehaviour_velTreshold_5' '.fig']);
saveas (f9, [folder_path_save,filesep,figures_subfolder,filesep,fish_name,date_exp '_sponBehaviour_velTreshold_5' '.jpg']);
saveas (f9, [folder_path_save,filesep,figures_subfolder,filesep,fish_name,date_exp '_sponBehaviour_velTreshold_5' '.svg']);

f10=figure();
f10.WindowState = 'maximized';

sgtitle('Treshold -(0)')
imagesc(temp_binaryTreshold0)
colorbar, colormap('parula')
xlabel ('Bin number')
ylabel ('Fish number')
box ('off')
saveas (f10, [folder_path_save,filesep,figures_subfolder,filesep,fish_name,date_exp '_sponBehaviour_velTreshold_5' '.fig']);
saveas (f10, [folder_path_save,filesep,figures_subfolder,filesep,fish_name,date_exp '_sponBehaviour_velTreshold_5' '.jpg']);
saveas (f10, [folder_path_save,filesep,figures_subfolder,filesep,fish_name,date_exp '_sponBehaviour_velTreshold_5' '.svg']);

%% Plot treshold figures for acceleration

temp_binaryAccel0    =   nan(size(all_fish,1),floor(transitionTime));
temp_binaryAccel20   =   nan(size(all_fish,1),floor(transitionTime));
temp_binaryAccel40   =   nan(size(all_fish,1),floor(transitionTime));
temp_binaryAccel60   =   nan(size(all_fish,1),floor(transitionTime));
temp_binaryAccel80   =   nan(size(all_fish,1),floor(transitionTime));

for ROI=1:size(all_fish)
    if ismember(ROI,group5)
        temp_binaryAccel0(ROI,:)= nan(1,floor(transitionTime));
        temp_binaryAccel20(ROI,:)= nan(1,floor(transitionTime));
        temp_binaryAccel40(ROI,:)= nan(1,floor(transitionTime));
        temp_binaryAccel60(ROI,:)= nan(1,floor(transitionTime));
        temp_binaryAccel80(ROI,:)= nan(1,floor(transitionTime));
    else
        temp_binaryAccel0(ROI,:)=(all_fish{ROI, 1}.Binary.Acc0(1:floor(transitionTime)));
        temp_binaryAccel20(ROI,:)=(all_fish{ROI, 1}.Binary.Acc20(1:floor(transitionTime)));
        temp_binaryAccel40(ROI,:)=(all_fish{ROI, 1}.Binary.Acc40(1:floor(transitionTime)));
        temp_binaryAccel60(ROI,:)=(all_fish{ROI, 1}.Binary.Acc60(1:floor(transitionTime)));
        temp_binaryAccel80(ROI,:)=(all_fish{ROI, 1}.Binary.Acc80(1:floor(transitionTime)));
    end
end

f11=figure();
f11.WindowState = 'maximized';

sgtitle('accelTreshold-(0)')
imagesc(temp_binaryAccel0)
colorbar, colormap('parula')
xlabel ('Bin number')
ylabel ('Fish number')
box ('off')
saveas (f11, [folder_path_save,filesep,figures_subfolder,filesep,fish_name,date_exp '_sponBehaviour_AccelTreshold_0' '.fig']);
saveas (f11, [folder_path_save,filesep,figures_subfolder,filesep,fish_name,date_exp '_sponBehaviour_AccelTreshold_0' '.jpg']);
saveas (f11, [folder_path_save,filesep,figures_subfolder,filesep,fish_name,date_exp '_sponBehaviour_AccelTreshold_0' '.svg']);


f12=figure();
f12.WindowState = 'maximized';

sgtitle('accelTreshold-(20)')
imagesc(temp_binaryAccel20)
colorbar, colormap('parula')
xlabel ('Bin number')
ylabel ('Fish number')
box ('off')
saveas (f12, [folder_path_save,filesep,figures_subfolder,filesep,fish_name,date_exp '_sponBehaviour_AccelTreshold_20' '.fig']);
saveas (f12, [folder_path_save,filesep,figures_subfolder,filesep,fish_name,date_exp '_sponBehaviour_AccelTreshold_20' '.jpg']);
saveas (f12, [folder_path_save,filesep,figures_subfolder,filesep,fish_name,date_exp '_sponBehaviour_AccelTreshold_20' '.svg']);

f13=figure();
f13.WindowState = 'maximized';
sgtitle('accelTreshold-(40)')
imagesc(temp_binaryAccel40)
colorbar, colormap('parula')
xlabel ('Bin number')
ylabel ('Fish number')
box ('off')
saveas (f13, [folder_path_save,filesep,figures_subfolder,filesep,fish_name,date_exp '_sponBehaviour_AccelTreshold_40' '.fig']);
saveas (f13, [folder_path_save,filesep,figures_subfolder,filesep,fish_name,date_exp '_sponBehaviour_AccelTreshold_40' '.jpg']);
saveas (f13, [folder_path_save,filesep,figures_subfolder,filesep,fish_name,date_exp '_sponBehaviour_AccelTreshold_40' '.svg']);

f14=figure();
f14.WindowState = 'maximized';

sgtitle('accelTreshold-(60)')
imagesc(temp_binaryAccel60)
colorbar, colormap('parula')
xlabel ('Bin number')
ylabel ('Fish number')
box ('off')
saveas (f14, [folder_path_save,filesep,figures_subfolder,filesep,fish_name,date_exp '_sponBehaviour_AccelTreshold_60' '.fig']);
saveas (f14, [folder_path_save,filesep,figures_subfolder,filesep,fish_name,date_exp '_sponBehaviour_AccelTreshold_60' '.jpg']);
saveas (f14, [folder_path_save,filesep,figures_subfolder,filesep,fish_name,date_exp '_sponBehaviour_AccelTreshold_60' '.svg']);


f15=figure();
f15.WindowState = 'maximized';

sgtitle('accelTreshold-(80)')
imagesc(temp_binaryAccel80)
colorbar, colormap('parula')
xlabel ('Bin number')
ylabel ('Fish number')
box ('off')
saveas (f15, [folder_path_save,filesep,figures_subfolder,filesep,fish_name,date_exp '_sponBehaviour_AccelTreshold_80' '.fig']);
saveas (f15, [folder_path_save,filesep,figures_subfolder,filesep,fish_name,date_exp '_sponBehaviour_AccelTreshold_80' '.jpg']);
saveas (f15, [folder_path_save,filesep,figures_subfolder,filesep,fish_name,date_exp '_sponBehaviour_AccelTreshold_80' '.svg']);





