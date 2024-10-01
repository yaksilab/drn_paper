function [all_fish]=aj_meanvelocity_plot_20200206_2groups(all_fish,nROIs,timebin,folder_path,folder_path_save,fish_name,date_exp,figures_subfolder,group1,group2,allgroups,name_group1,name_group2)

% Heatmap mean velocity
f11 = figure;
invertbone=flipud(bone);
sgtitle([fish_name, date_exp]);

for ROI=1:size(all_fish)
    matMeanVelTemp(ROI,:)=vertcat((all_fish{ROI,1}.mean_velocity));
end 


subplot(2,1,1)
imagesc((matMeanVelTemp(group1,:)));
xlabel(['Mean velocity (mm/s), ',num2str(name_group1),' (',num2str(timebin),' sec time bins)']);
ylabel('Fish number');
colorbar;

subplot(2,1,2)
imagesc(matMeanVelTemp(group2,:));
xlabel(['Mean velocity (mm/s), ',num2str(name_group2),' (',num2str(timebin),' sec time bins)']);
ylabel('Fish number');
colorbar;

colormap(invertbone);
% set(gca, 'CLim', [0, 0.7]);

saveas (f11, [folder_path_save,filesep,figures_subfolder,filesep,fish_name,date_exp '_mean_velocity_heatmap' '.fig']);
saveas (f11, [folder_path_save,filesep,figures_subfolder,filesep,fish_name,date_exp '_mean_velocity_heatmap' '.jpg']);
saveas (f11, [folder_path_save,filesep,figures_subfolder,filesep,fish_name,date_exp '_mean_velocity_heatmap' '.svg']);

%Histograms
f12=figure;
sgtitle([fish_name, date_exp]);
subplot(2,3,1)
histogram(matMeanVelTemp(group1,:),100); %Histogram group1
xlabel(['Mean velocity, ',num2str(name_group1)]);

subplot(2,3,2)
boxplot(mean(matMeanVelTemp(group1,:)),name_group1); %boxplot of median velocity for the groups

subplot(2,3,3)
violinplot(mean(matMeanVelTemp(group1,:))); %boxplot of median velocity for the groups

subplot(2,3,4)
histogram(matMeanVelTemp(group2,:),100); %Histogram group2
xlabel(['Mean velocity, ',num2str(name_group2)]);

subplot (2,3,5)
boxplot(mean(matMeanVelTemp(group2,:)),name_group2); %boxplot of median velocity for the groups

subplot (2,3,6)
violinplot(mean(matMeanVelTemp(group2,:))); %violin of median velocity for the groups


saveas (f12, [folder_path_save,filesep,figures_subfolder,filesep,fish_name,date_exp '_mean_velocity_histogram_boxplot_group1' '.fig']);
saveas (f12, [folder_path_save,filesep,figures_subfolder,filesep,fish_name,date_exp '_mean_velocity_histogram_boxplot_group1' '.jpg']);
saveas (f12, [folder_path_save,filesep,figures_subfolder,filesep,fish_name,date_exp '_mean_velocity_histogram_boxplot_group1' '.svg']);
