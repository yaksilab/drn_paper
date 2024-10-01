for ROI=1:size(all_fish,1)
%     all_fish{ROI,1}=rmfield(all_fish{ROI,1},'SponBehaviour');
    all_fish{ROI,1}.SponBehaviour.meanVelocity = all_fish{ROI,1}.bV_E4sd(1:floor(transitionTime));
%     all_fish{ROI,1}.SponBehaviour.meanAcceleration = all_fish{ROI,1}.binnedAcc(1:floor(transitionTime));
%     all_fish{ROI,1}.SponBehaviour.distance = all_fish{ROI,1}.bD(1:floor(transitionTime));

end

f1 = figure;
f1.WindowState = 'maximized';
f1 = tiledlayout (3,3,'TileSpacing','compact');
title(f1,fish_name);

matMeanVelTemp=nan(size(all_fish,1),floor(transitionTime));
for ROI=1:size(all_fish)
    matMeanVelTemp(ROI,:)=vertcat(all_fish{ROI,1}.SponBehaviour.meanVelocity);
end

for i=1: length(groups)-1
    nexttile
    imagesc((matMeanVelTemp(groups{1,i},:)));
    xlabel(['Mean velocity (mm/s), ',name_groups{1,i},' (',num2str(timebin),' sec time bins)']);
    ylabel('Fish number');
    colormap (jet)
    colorbar;
    set(gca, 'CLim', [0 10]);
end

saveas (f1, [folder_path_save,filesep,figures_subfolder,filesep,fish_name,date_exp '_sponBehaviour_bV_E4sd_heatmap' '.fig']);

%% 
f2=figure;

sgtitle([fish_name, date_exp ' Velocities (mm/s)']);


boxplot(mean(matMeanVelTemp([groups{1,1:9}],:),2,'omitnan'),...
    group_category([groups{1,1:9}]),'PlotStyle','compact'); %boxplot of median velocity for the groups

ylim([0 4])

saveas (f2, [folder_path_save,filesep,figures_subfolder,filesep,fish_name,date_exp '_sponBehaviour_bV_E4sd_histogram_boxplot' '.fig']);
%%

bV_E4sd_spontanious = mean(matMeanVelTemp,2,'omitnan');

f17= figure;
f17.WindowState = 'maximized';


for i=1:length(groups)-1
    b=boxchart(mean(matMeanVelTemp([groups{1,1:9}],:),2,'omitnan'),...
    'GroupByColor',group_category([groups{1,1:9}]));  %boxplot of median velocity for the groups
    set(b,{'BoxFaceColor'},{C1(1,:); C1(2,:) ;C1(3,:) ;C1(4,:);...
        C1(5,:); C1(6,:);C1(7,:) ;C1(8,:);C1(9,:)}) 
    legend('Location', 'northeast') 


%     xticks (1:length(groups)-3)
%     xticklabels(name_groups(1,1:length(groups)-3))
%     ylim ([0 max(bV_E4sd_spontanious)+1])
end
ylim([0 4])
title('Mean velocity based on genotype')
box('off')

for i=2:length(groups)-1
h{1,i}=num2str([ranksum(bV_E4sd_spontanious(group1),...
    bV_E4sd_spontanious(groups{1,i}))]);
end 
for i=[1,3:length(groups)-1]
h{2,i}=num2str([ranksum(bV_E4sd_spontanious(group2),...
    bV_E4sd_spontanious(groups{1,i}))]);
end 
for i=[1,2, 4:length(groups)-1]
h{3,i}=num2str([ranksum(bV_E4sd_spontanious(group3),...
    bV_E4sd_spontanious(groups{1,i}))]);

end 

A=text(1.15,2.5,(h));
ylabel('Velocity (mm/s)')

%% 
figure              
t2=tiledlayout(3,3);
for i=1:length(groups)-1
    title (['Mean binned velocity with SEM for ' name_groups{1,i}])
    nexttile
    imagesc((matMeanVelTemp(groups{1,i},:)))
    colorbar
    colormap(flipud (hot))
end

t1=tiledlayout(3,3);
for i= 1:length(groups)-1
    nexttile
    boundedline(1:floor(transitionTime),(mean(matMeanVelTemp(groups{1,i},:),1,'omitnan')),...
        std((matMeanVelTemp(groups{1,i},:)),[],1,'omitnan')/sqrt(length (groups{1,i})), 'alpha'), hold on
    title (['Mean binned velocity with SEM for ' name_groups{1,i}])
    xlim ([ 1 floor(transitionTime) ])
    ylim ([ min(std((matMeanVelTemp(groups{1,i},:)),[],1,'omitnan')/sqrt(length (groups{1,i})))...
            max(mean((matMeanVelTemp(groups{1,i},:))))+max(std((matMeanVelTemp(groups{1,i},:)),[],1,'omitnan')/sqrt(length (groups{1,i}))) ])
    ylabel ('Velocity (mm/s)') 
    box off
end
