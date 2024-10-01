function aj_spontaniousVel_20210220 (all_fish,timebin,folder_path_save,fish_name,date_exp,group1,group2, group3,group4,group5,name_group1,name_group2,name_group3 ,name_group4, name_group5,figures_subfolder, group_category,nROIs,transitionTime,groups,name_groups, threshold,SeizureBarcode_thresholds,conversion_factor,C1)

%% mean velocity  imagesc group stratified

f1 = figure;
f1.WindowState = 'maximized';
sgtitle([fish_name, date_exp]);

matMeanVelTemp=nan(size(all_fish,1),floor(transitionTime));
for ROI=1:size(all_fish)
    matMeanVelTemp(ROI,:)=vertcat(all_fish{ROI,1}.SponBehaviour.meanVelocity);
end

for i=1: length(groups)-3
    subplot(length(groups)-3,1,i)
    imagesc((matMeanVelTemp(groups{1,i},:)));
    xlabel(['Mean velocity (mm/s), ',name_groups{1,i},' (',num2str(timebin),' sec time bins)']);
    ylabel('Fish number');
    colormap (jet)
    colorbar;
    set(gca, 'CLim', [0 10]);
end

saveas (f1, [folder_path_save,filesep,figures_subfolder,filesep,fish_name,date_exp '_sponBehaviour_bV_E4sd_heatmap' '.fig']);
saveas (f1, [folder_path_save,filesep,figures_subfolder,filesep,fish_name,date_exp '_sponBehaviour_bV_E4sd_heatmap' '.jpg']);
saveas (f1, [folder_path_save,filesep,figures_subfolder,filesep,fish_name,date_exp '_sponBehaviour_bV_E4sd_heatmap' '.svg']);

%% Histograms
f2=figure;
f2.WindowState = 'maximized';
sgtitle([fish_name, date_exp ' Velocities (mm/s)']);

subplot(2,4,[1:2,5:6])
boxplot(mean(matMeanVelTemp([group1 group2 group3 group4],:),2,'omitnan'),...
    group_category([group1 group2 group3 group4]),'PlotStyle','compact'); %boxplot of median velocity for the groups



subplot(2,4,3:4)
FC = {[1 0 0] [0 1 0] [0 0 1] [1 1 0] [0 1 1]};
nBins = floor((max(max(matMeanVelTemp)))/4);
for i=1:length(groups)-3
histogram(matMeanVelTemp(groups{1,i},:),nBins,'EdgeColor',FC{1,i}, 'Edgealpha',.5, 'Facecolor',FC{1,i}, 'Facealpha', 0.4); %Histogram group2
hold on,
end 
xlabel ('Velocity mm/s')
legend (name_groups{1,1:5});
hold off 

subplot(2,4,7:8)
for i=1:length(groups)-3
    Violin(mean(matMeanVelTemp(groups{1,i},:),2,'omitnan'),i);  %boxplot of median velocity for the groups
    xticks (1:length(groups)-3)
    xticklabels({name_group1 name_group2 name_group3 name_group4})
    ylim ([0 max(mean(matMeanVelTemp,'omitnan'))])
end


saveas (f2, [folder_path_save,filesep,figures_subfolder,filesep,fish_name,date_exp '_sponBehaviour_bV_E4sd_histogram_boxplot' '.fig']);
saveas (f2, [folder_path_save,filesep,figures_subfolder,filesep,fish_name,date_exp '_sponBehaviour_bV_E4sd_histogram_boxplot' '.jpg']);
saveas (f2, [folder_path_save,filesep,figures_subfolder,filesep,fish_name,date_exp '_sponBehaviour_bV_E4sd_histogram_boxplot' '.svg']);

%% with ranksum test

bV_E4sd_spontanious = mean(matMeanVelTemp,2,'omitnan');

f17= figure;
f17.WindowState = 'maximized';

subplot(4,6,[1:2,7:8,13:14,19:20])
for i=1:length(groups)-3
    b=boxchart(mean(matMeanVelTemp([group1 group2 group3 group4],:),2,'omitnan'),...
    'GroupByColor',group_category([group1 group2 group3 group4]));  %boxplot of median velocity for the groups
    set(b,{'BoxFaceColor'},{C1(1,:); C1(2,:) ;C1(3,:) ;C1(4,:)}) 
    legend('Location', 'southeast') 


%     xticks (1:length(groups)-3)
%     xticklabels(name_groups(1,1:length(groups)-3))
%     ylim ([0 max(bV_E4sd_spontanious)+1])
end
title('Mean velocity based on genotype')
box('off')
h=text(1,2.5,num2str([ranksum(bV_E4sd_spontanious(group1),...
    bV_E4sd_spontanious(group3));...
    ranksum(bV_E4sd_spontanious(group2),...
    bV_E4sd_spontanious(group3));... %    
    ranksum(bV_E4sd_spontanious(group3),bV_E4sd_spontanious(group3))]));
%    text(4.5,max(bV_E4sd_spontanious(group1))+1,['ranksum p-value = ' num2str(ranksum(bV_E4sd_spontanious(group4),bV_E4sd_spontanious(group5)))],'Color','r')};

    set(h,'Rotation',90);

ylabel('Velocity (mm/s)')
              

for i= 1:length(groups)-3
    subplot(5,6,i*6-3:i*6)
    boundedline(1:floor(transitionTime),(mean(matMeanVelTemp(groups{1,i},:),1,'omitnan')),...
        std((matMeanVelTemp(groups{1,i},:)),[],1,'omitnan')/sqrt(length (groups{1,i})), 'alpha'), hold on
    title (['Mean binned velocity with SEM for ' name_groups{1,i}])
    xlim ([ 1 floor(transitionTime) ])
    ylim ([ min(std((matMeanVelTemp(groups{1,i},:)),[],1,'omitnan')/sqrt(length (groups{1,i})))...
            max(mean((matMeanVelTemp(groups{1,i},:))))+max(std((matMeanVelTemp(groups{1,i},:)),[],1,'omitnan')/sqrt(length (groups{1,i}))) ])
    ylabel ('Velocity (mm/s)') 
    box off
end
saveas (f17, [folder_path_save,filesep,figures_subfolder,filesep,fish_name,date_exp '_sponBehaviour_meanVel_test' '.fig']);
saveas (f17, [folder_path_save,filesep,figures_subfolder,filesep,fish_name,date_exp '_sponBehaviour_meanVel_test' '.jpg']);
saveas (f17, [folder_path_save,filesep,figures_subfolder,filesep,fish_name,date_exp '_sponBehaviour_meanVel_test' '.svg']);

