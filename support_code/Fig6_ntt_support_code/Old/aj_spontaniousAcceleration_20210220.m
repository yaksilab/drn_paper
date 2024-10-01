function aj_spontaniousAcceleration_20210220 (all_fish,timebin,folder_path_save,fish_name,date_exp,group1,group2, group3,group4,group5,name_group1,name_group2,name_group3 ,name_group4, name_group5,figures_subfolder, group_category,nROIs,transitionTime,groups,name_groups, threshold,SeizureBarcode_thresholds,conversion_factor)

%% imagesc
f3 = figure;
f3.WindowState = 'maximized';
sgtitle ([fish_name, date_exp]);

matMeanAccTemp=nan(size(all_fish,1),floor(transitionTime));
for ROI=1:size(all_fish,1)
    matMeanAccTemp(ROI,:)=vertcat(all_fish{ROI,1}.SponBehaviour.meanAcceleration);
end

for i=1: length (groups)-1
    subplot(length(groups)-1,1,i)
    imagesc((matMeanAccTemp(groups{1,i},:)));
    xlabel(['Mean acceleration (mm/s), ',name_groups{1,i},' (',num2str(timebin),' sec time bins)']);
    ylabel('Fish number');
    colormap (jet)
    colorbar;
    set(gca, 'CLim', [0 threshold]);
    set(colorbar,'YTick',0:3:threshold)
end

saveas (f3, [folder_path_save,filesep,figures_subfolder,filesep,fish_name,date_exp '_sponBehaviour_binnedAcc_heatmap' '.fig']);
saveas (f3, [folder_path_save,filesep,figures_subfolder,filesep,fish_name,date_exp '_sponBehaviour_acceleration_heatmap' '.jpg']);
saveas (f3, [folder_path_save,filesep,figures_subfolder,filesep,fish_name,date_exp '_sponBehaviour_acceleration_heatmap' '.svg']);

%% Histograms, boxplot, and violin
f4=figure;
f4.WindowState = 'maximized';
sgtitle([fish_name, date_exp, ' Accelerations']);

subplot(2,4,[1:2,5:6])
boxplot(nanmean(matMeanAccTemp([group1 group2 group3 group4],:),2),group_category([group1 group2 group3 group4])); %boxplot of median velocity for the groups

subplot(2,4,3:4)
FC = {[1 0 0] [0 1 0] [0 0 1]};
nBins = floor((max(max(matMeanAccTemp)))/2);
for i=1:length(groups)-2
histogram(matMeanAccTemp(groups{1,i},:),nBins,'EdgeColor',FC{1,i}, 'Edgealpha',.5, 'Facecolor',FC{1,i}, 'Facealpha', 0.4); %Histogram group2
hold on,
end 
xlabel ('Acceleration mm/s^2')
legend (name_groups{1,1:3},'Location','northwest');
hold off 

subplot(2,4,7:8)
for i=1:length(groups)-1
    Violin(nanmean(matMeanAccTemp(groups{1,i},:),2),i);  %boxplot of median velocity for the groups
    xticks (1:4)
    xticklabels({name_group1 name_group2 name_group3 name_group4})
end

saveas (f4, [folder_path_save,filesep,figures_subfolder,filesep,fish_name,date_exp '_sponBehaviour_binnedAcc_histogram_boxplot_violin' '.fig']);
saveas (f4, [folder_path_save,filesep,figures_subfolder,filesep,fish_name,date_exp '_sponBehaviour_binnedAcc_histogram_boxplot_violin' '.jpg']);
saveas (f4, [folder_path_save,filesep,figures_subfolder,filesep,fish_name,date_exp '_sponBehaviour_binnedAcc_histogram_boxplot_violin' '.svg']);

%% plot mean acceleraion boxplot with ranksum test

binnedAcc_spontanious = nanmean(matMeanAccTemp,2);
f18= figure;
f18.WindowState = 'maximized';

subplot(4,6,[1:2,7:8,13:14,19:20])
for i=1:length(groups)-1
    Violin(binnedAcc_spontanious(groups{1,i},:),i);  %boxplot of median velocity for the groups
    xticks (1:4)
    xticklabels({name_group1 name_group2 name_group3 name_group4})
    ylim ([min(binnedAcc_spontanious)-1 max(binnedAcc_spontanious)+1])
end
title('Sum of distances for 1 hr spontanious behaviour based on genotype')
box('off')
h={text(1.5,mean(binnedAcc_spontanious),['ranksum p-value = ' num2str(ranksum(binnedAcc_spontanious(group1),binnedAcc_spontanious(group3)))],'Color','r')...
   text(2.5,mean(binnedAcc_spontanious),['ranksum p-value = ' num2str(ranksum(binnedAcc_spontanious(group2),binnedAcc_spontanious(group3)))],'Color','r')...
   text(3.5,mean(binnedAcc_spontanious),['ranksum p-value = ' num2str(ranksum(binnedAcc_spontanious(group3),binnedAcc_spontanious(group4)))],'Color','r')};%...
   %text(.75,mean(binnedAcc_spontanious(group1))+1,['ranksum p-value = ' num2str(ranksum(binnedAcc_spontanious(group2),binnedAcc_spontanious(group3)))],'Color','r')};
for i= 1:length (h)-1
    set(h{1,i},'Rotation',90);
end 
ylabel('Acceleration (mm/s^2)')
              

for i= 1:length(groups)-1
    subplot(4,6,i*6-3:i*6)
    boundedline(1:floor(transitionTime),(mean(matMeanAccTemp(groups{1,i},:),1,'omitnan')),...
        std((matMeanAccTemp(groups{1,i},:)),[],1,'omitnan')/sqrt(length (groups{1,i})), 'alpha'), hold on
    title (['Mean binned acceleration with SEM for ' name_groups{1,i}])
    xlim ([ 1 floor(transitionTime) ])
    ylim ([ -max(std((matMeanAccTemp(groups{1,i},:)),[],1,'omitnan')/sqrt(length (groups{1,i})))...
            max(mean((matMeanAccTemp(groups{1,i},:))))+max(std((matMeanAccTemp(groups{1,i},:)),[],1,'omitnan')/sqrt(length (groups{1,i}))) ])
    ylabel ('Acceleration (mm/s^2)') 
    box off
end

saveas (f18, [folder_path_save,filesep,figures_subfolder,filesep,fish_name,date_exp '_sponBehaviour_meanAcc_test' '.fig']);
saveas (f18, [folder_path_save,filesep,figures_subfolder,filesep,fish_name,date_exp '_sponBehaviour_meanAcc_test' '.jpg']);
saveas (f18, [folder_path_save,filesep,figures_subfolder,filesep,fish_name,date_exp '_sponBehaviour_meanAcc_test' '.svg']);




