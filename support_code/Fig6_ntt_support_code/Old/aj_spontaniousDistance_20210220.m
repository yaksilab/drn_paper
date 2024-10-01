function aj_spontaniousDistance_20210220 (all_fish,timebin,folder_path_save,fish_name,date_exp,group1,group2, group3,group4,group5,name_group1,name_group2,name_group3 ,name_group4, name_group5,figures_subfolder, group_category,nROIs,transitionTime,groups,name_groups, threshold,SeizureBarcode_thresholds,conversion_factor)

%% plot descriptives 
f1 = figure;
f1.WindowState = 'maximized';
sgtitle([fish_name, date_exp, '_Distance']);

matMeanDistTemp=nan(size(all_fish,1),floor(transitionTime));
for ROI=1:size(all_fish)
    matMeanDistTemp(ROI,:)=vertcat(all_fish{ROI,1}.SponBehaviour.distance);
end

for i=1: length(groups)-3
    subplot(length(groups)-3,1,i)
    imagesc((matMeanDistTemp(groups{1,i},:)));
    xlabel(['Mean distance, ',name_groups{1,i},' (',num2str(timebin),' sec timebins)']);
    ylabel('Fish');
    colormap (jet)
    colorbar;
    set(gca, 'CLim', [0 10]);
end

saveas (f1, [folder_path_save,filesep,figures_subfolder,filesep,fish_name,date_exp '_sponBehaviour_distancePerSec_heatmap' '.fig']);
saveas (f1, [folder_path_save,filesep,figures_subfolder,filesep,fish_name,date_exp '_sponBehaviour_distancePerSec_heatmap' '.jpg']);
saveas (f1, [folder_path_save,filesep,figures_subfolder,filesep,fish_name,date_exp '_sponBehaviour_distancePerSec_heatmap' '.svg']);

%% Histograms
f2=figure;
f2.WindowState = 'maximized';
sgtitle([fish_name, date_exp ' Distance mm']);

subplot(2,4,[1:2,5:6])
boxplot(nanmean(matMeanDistTemp([group1 group2 group3 group4],:),2),group_category([group1 group2 group3 group4])); %boxplot of median velocity for the groups

subplot(2,4,3:4)
FC = {[1 0 0] [0 1 0] [0 0 1] [1 1 0] [0 1 1]};
nBins = floor((max(max(matMeanDistTemp)))/4);
for i=1:length(groups)-3
histogram(matMeanDistTemp(groups{1,i},:),nBins,'EdgeColor',FC{1,i}, 'Edgealpha',.5, 'Facecolor',FC{1,i}, 'Facealpha', 0.4); %Histogram group2
hold on,
end 
xlabel ('Velocity mm/s')
legend (name_groups{1,1:3});
hold off 

subplot(2,4,7:8)
for i=1:length(groups)-3
    Violin(nanmean(matMeanDistTemp(groups{1,i},:),2),i);  %boxplot of median velocity for the groups
    xticks (1:length(groups)-3)
    xticklabels({name_group1 name_group2 name_group3 name_group4})
    ylim ([0 max(nanmean(matMeanDistTemp))])
end


saveas (f2, [folder_path_save,filesep,figures_subfolder,filesep,fish_name,date_exp '_sponBehaviour_distancePerSec_histogram_boxplot' '.fig']);
saveas (f2, [folder_path_save,filesep,figures_subfolder,filesep,fish_name,date_exp '_sponBehaviour_distancePerSec_histogram_boxplot' '.jpg']);
saveas (f2, [folder_path_save,filesep,figures_subfolder,filesep,fish_name,date_exp '_sponBehaviour_distancePerSec_histogram_boxplot' '.svg']);


%% make suitable plots for these (Boxplot)
sum_distance_spontatnious=sum(matMeanDistTemp,2,'omitnan')/1000;

f16=figure;
f16.WindowState = 'maximized';

subplot(4,6,[1:2,7:8,13:14,19:20])
for i=1:length(groups)-3
    Violin(sum_distance_spontatnious(groups{1,i},:),i);  %boxplot of median velocity for the groups
    xticks (1:length(groups)-3)
    xticklabels({name_group1 name_group2 name_group3 name_group4})
    ylim ([0 max(sum_distance_spontatnious)+1])
end
title('Sum of distances for 1 hr spontanious behaviour based on genotype')
box('off')
h={text(1.5,2.5,['ranksum p-value = ' num2str(ranksum(sum_distance_spontatnious(group1),sum_distance_spontatnious(group2)))],'Color','r')};
%    text(2.5,2.5,['ranksum p-value = ' num2str(ranksum(sum_distance_spontatnious(group2),sum_distance_spontatnious(group5)))],'Color','r')... %    
%    text(3.5,2.5,['ranksum p-value = ' num2str(ranksum(sum_distance_spontatnious(group3),sum_distance_spontatnious(group5)))],'Color','r')...
%    text(4.5,2.5,['ranksum p-value = ' num2str(ranksum(sum_distance_spontatnious(group4),sum_distance_spontatnious(group5)))],'Color','r')};
for i= 1:length (h)
    set(h{1,i},'Rotation',90);
end 
ylabel('Distance (m)')
              

for i= 1:length(groups)-3
    subplot(5,6,i*6-3:i*6)
    boundedline(1:floor(transitionTime),(mean(matMeanDistTemp(groups{1,i},:),1,'omitnan')),...
        std((matMeanDistTemp(groups{1,i},:)),[],1,'omitnan')/sqrt(length (groups{1,i})), 'alpha'), hold on
    title (['Mean distances with SEM for ' name_groups{1,i}])
    xlim ([ 1 floor(transitionTime) ])
    ylim ([ min(std((matMeanDistTemp(groups{1,i},:)),[],1,'omitnan')/sqrt(length (groups{1,i})))...
            max(mean((matMeanDistTemp(groups{1,i},:))))+max(std((matMeanDistTemp(groups{1,i},:)),[],1,'omitnan')/sqrt(length (groups{1,i}))) ])
    ylabel ('Distance (mm)') 
    box off
end

saveas (f16, [folder_path_save,filesep,figures_subfolder,filesep,fish_name,date_exp '_sponBehaviour_sumDistance_test' '.fig']);
saveas (f16, [folder_path_save,filesep,figures_subfolder,filesep,fish_name,date_exp '_sponBehaviour_sumDistance_test' '.jpg']);
saveas (f16, [folder_path_save,filesep,figures_subfolder,filesep,fish_name,date_exp '_sponBehaviour_sumDistance_test' '.svg']);

