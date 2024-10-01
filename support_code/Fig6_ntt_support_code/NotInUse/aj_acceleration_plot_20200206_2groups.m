function [all_fish]=aj_acceleration_plot_20200206_2groups(all_fish,nROIs,timebin,folder_path,folder_path_save,fish_name,date_exp,figures_subfolder,group1,group2,allgroups,name_group1,name_group2)


f21 = figure;
subplot(2,1,1)
sgtitle([fish_name, date_exp]);

for ROI=1:size(all_fish)
    matMeanAccTemp(ROI,:)=vertcat((all_fish{ROI,1}.mean_acceleration));
end 

imagesc(matMeanAccTemp(group1,:));
colorbar;
set(gca, 'CLim', [0, 1000]); 
xlabel(['Average acceleration (mm/s2), ',num2str(name_group1),' (',num2str(timebin),' sec time bins)']);
ylabel('Fish number');


subplot(2,1,2)
imagesc(matMeanAccTemp(group2,:));
colorbar;
set(gca, 'CLim', [0, 1000]); 
xlabel(['Average acceleration (mm/s2), ',num2str(name_group2),' (',num2str(timebin),' sec time bins)']);
ylabel('Fish number');

invertbone=flipud(bone);
colormap(invertbone);

saveas (f21, [folder_path_save,filesep,figures_subfolder,filesep,fish_name,date_exp '_mean_acceleration_heatmap' '.fig']);
saveas (f21, [folder_path_save,filesep,figures_subfolder,filesep,fish_name,date_exp '_mean_acceleration_heatmap' '.jpg']);
saveas (f21, [folder_path_save,filesep,figures_subfolder,filesep,fish_name,date_exp '_mean_acceleration_heatmap' '.eps']);

%Histograms, boxplot, and violin
f22=figure;
sgtitle([fish_name, date_exp]);
subplot(2,3,1)
histogram(matMeanAccTemp(group1,:),100); %Histogram group1
xlabel(['Mean acceleration, ' ,num2str(name_group2)]);

subplot(2,3,2)
boxplot(mean(matMeanAccTemp(group1,:)),name_group1)

subplot(2,3,3)
violinplot(mean(matMeanAccTemp(group1,:)));

subplot(2,3,4)
histogram(matMeanAccTemp(group2,:),100); %Histogram group2
xlabel(['Mean acceleration, ' ,num2str(name_group2)]);

subplot(2,3,5)
boxplot(mean(matMeanAccTemp(group2,:)),name_group2)

subplot(2,3,6)
violinplot(mean(matMeanAccTemp(group2,:)));

saveas (f22, [folder_path_save,filesep,figures_subfolder,filesep,fish_name,date_exp '_mean_acceleration_histogram_boxplot_violin' '.fig']);
saveas (f22, [folder_path_save,filesep,figures_subfolder,filesep,fish_name,date_exp '_mean_acceleration_histogram_boxplot_violin' '.jpg']);
saveas (f22, [folder_path_save,filesep,figures_subfolder,filesep,fish_name,date_exp '_mean_acceleration_histogram_boxplot_violin' '.eps']);
