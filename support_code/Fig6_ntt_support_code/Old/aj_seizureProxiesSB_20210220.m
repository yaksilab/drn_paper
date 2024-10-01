function [all_fish] = aj_seizureProxiesSB_20210220 (all_fish,timebin,folder_path_save,fish_name,date_exp,group1,group2, group3,group4,group5,group6,group7,group8,group9, name_group1,name_group2,name_group3 ,name_group4, name_group5,name_group6,name_group7,name_group8,name_group9,figures_subfolder, group_category,nROIs,transitionTime,groups,name_groups, threshold,SeizureBarcode_thresholds,conversion_factor, highVel_thresholds,C1)

%% extract high-speed events from the overall data and save under spontanious behaviour







for ROI =1:nROIs
    if isfield(all_fish{ROI,1}.SponBehaviour,'highVel_events')
    all_fish{ROI,1}.SponBehaviour=rmfield(all_fish{ROI,1}.SponBehaviour,...
    {'highVel_events', 'seizureBarcode'});    
    else 
    end 
end 

for ROI=1:nROIs
    for j=1:length(highVel_thresholds)
        if isempty(all_fish{ROI, 1}.V_above_threshold.highSpeedEvent{j,1})
            all_fish{ROI, 1}.SponBehaviour.highVel_events{j,1}(1:3,:) = [nan; nan; nan];
        else
        all_fish{ROI, 1}.SponBehaviour.highVel_events{j,1}(1:3,:) =...
            all_fish{ROI, 1}.V_above_threshold.highSpeedEvent{j,1}...
            (1:3,1:find(all_fish{ROI, 1}.V_above_threshold.highSpeedEvent{j,1}(2,:)<=transitionTime,1,'last'));
        end 
    end 
end


% % 
% % for ROI=1:nROIs
% %     all_fish{ROI, 1}.SponBehaviour = rmfield (all_fish{ROI, 1}.SponBehaviour, 'seizureBarcode');
% % end 


%% extract seizure barcode data from overall and save under spontanious behaviour
[all_fish] = aj_seizureBarCodeSpont_20210220(all_fish,nROIs,timebin,folder_path_save,fish_name,date_exp,conversion_factor,SeizureBarcode_thresholds, transitionTime);

%% plot high velocity events
mat = nan(nROIs,length(highVel_thresholds));
for i=1: length (highVel_thresholds)
    
    for j=1:nROIs
        if ismember (j,group10) % ismember(j,group4) || 
            mat(j,i) = nan;
        else
            mat (j,i) = length(all_fish{j, 1}.SponBehaviour.highVel_events{i,1});
        end 
    end
end

matG1 = mat(group1,:);
matG2 = mat(group2,:);
matG3 = mat(group3,:);
matG4 = mat(group4,:);
matG5 = mat(group5,:);
matG6 = mat(group6,:);
matG7 = mat(group7,:);
matG8 = mat(group8,:);
matG9 = mat(group9,:);


boxplot (matG1), hold on 
boxplot (matG2), boxplot (matG3), boxplot(matG4), boxplot(matG5),...
    boxplot(matG6),boxplot(matG7),boxplot(matG8), boxplot(matG9) hold off

    f1 = figure;
    f1.WindowState = 'maximized';
    f1 = tiledlayout (2,2);
for i=1: length (highVel_thresholds)
    nexttile
    sgtitle([fish_name, date_exp, 'Number of high velocity events - threshold -', num2str(highVel_thresholds(i,1))]);
    boxplot(mat(:,i),group_category,'PlotStyle','compact');
    ylabel ('Number of events')
    rankp = cell(2,1);
    for j=1:3
        rankp{j,1}= ranksum(mat(groups{1,1},i),mat(groups{1,j+1},i));
    end 
    h = text(i+.5,mean(matG1(:,i),'omitnan'),num2str(vertcat(rankp{:,1})));
    set(h,'Rotation', 90)
    hold off
    
end

    saveas (f1, [folder_path_save,filesep,figures_subfolder,filesep,fish_name,date_exp '_sponBehaviour_nSeizureSpontanious_',num2str(highVel_thresholds(i,1)) '.fig']);
    saveas (f1, [folder_path_save,filesep,figures_subfolder,filesep,fish_name,date_exp '_sponBehaviour_nSeizureSpontanious_',num2str(highVel_thresholds(i,1)) '.jpg']);
    saveas (f1, [folder_path_save,filesep,figures_subfolder,filesep,fish_name,date_exp '_sponBehaviour_nSeizureSpontanious_',num2str(highVel_thresholds(i,1)) '.svg']);

    mat1= mat;
    mat1=fillmissing(mat1,'Constant',0);

    for i = 1:size(mat1,2)
       mat3{i,1}=quantile(mat1(group1),[0.25:0.25:0.75]);
    end 
%% plot time spent in high velociteis 

for i=1: length (highVel_thresholds)
    mat = nan(nROIs,1);
    for j=1:nROIs
        if ismember(j,group10)
            mat(j,:) = [];
        else
        mat (j,:) = sum(all_fish{j, 1}.SponBehaviour.highVel_events{i, 1}(3,:),'omitnan');
        end
    end 
    
    f1 = figure;
    f1.WindowState = 'maximized';
    sgtitle([fish_name, date_exp, 'time spent in high velocity evenets - threshold -', num2str(highVel_thresholds(i,1))]);
    boxplot(mat,group_category,'PlotStyle','compact','Color',C1);
%     ylim([0 250])
    ylabel ('Time (s)')
    xlabel ('Group')
    
    
    h={text(1.5,2.5,['ranksum p-value = ' num2str(ranksum(mat(group1),mat(group2)))],'Color','r'),...
        text(2.5,2.5,['ranksum p-value = ' num2str(ranksum(mat(group1),mat(group3)))],'Color','r')... %
        text(3.5,2.5,['ranksum p-value = ' num2str(ranksum(mat(group1),mat(group4)))],'Color','r')};...
%         text(4.5,2.5,['ranksum p-value = ' num2str(ranksum(mat(group1),mat(group4)))],'Color','r')};
    for j= 1:length (h)
        set(h{1,j},'Rotation',90);
    end
    
    saveas (f1, [folder_path_save,filesep,figures_subfolder,filesep,fish_name,date_exp '_sponBehaviour_timeSeizureSpontanious_heatmap',num2str(highVel_thresholds(i,1)) '.fig']);
    saveas (f1, [folder_path_save,filesep,figures_subfolder,filesep,fish_name,date_exp '_sponBehaviour_timeSeizureSpontanious_heatmap',num2str(highVel_thresholds(i,1)) '.jpg']);
    saveas (f1, [folder_path_save,filesep,figures_subfolder,filesep,fish_name,date_exp '_sponBehaviour_timeSeizureSpontanious_heatmap',num2str(highVel_thresholds(i,1)) '.svg']);

end

%% plot barcode-Seizure
% 
% for i=1: length (SeizureBarcode_thresholds)
%     
%     mat = nan(nROIs,3599);
%     for j=1:nROIs
%         mat (j,:) = (all_fish{j, 1}.SponBehaviour.seizureBarcode{i,:});
%     end
%     
%     
%     f1 = figure;
%     f1.WindowState = 'maximized';
%     sgtitle([fish_name, date_exp, 'seizure barcode - threshold -', num2str(SeizureBarcode_thresholds(i,1))]);
%     for k=1:nROIs
%         for l=1:length(groups)-3
%             C = {[1 0 0] [0 1 0] [0 0 1] [1 1 0]};
%             if ismember(k,groups{1,l})
%                 plot(mat(k,:)+(k-1),'Color',C{1,l}); hold on,
%             end
%         end
%     end
%     hold off 
%     xlim([0 3599])
%     xlabel ('Bin number')
%     ylabel ('Fish number')
%     legend (name_groups{1,1:4})
%     box off
%     
%     saveas (f1, [folder_path_save,filesep,figures_subfolder,filesep,fish_name,date_exp '_sponBehaviour_barcode_',num2str(SeizureBarcode_thresholds(i,1)) '.fig']);
%     saveas (f1, [folder_path_save,filesep,figures_subfolder,filesep,fish_name,date_exp '_sponBehaviour_barcode_',num2str(SeizureBarcode_thresholds(i,1)) '.jpg']);
%     saveas (f1, [folder_path_save,filesep,figures_subfolder,filesep,fish_name,date_exp '_sponBehaviour_barcode_',num2str(SeizureBarcode_thresholds(i,1)) '.svg']);
% 
% end
%% Number of seizure based on barcode

    f1 = figure;
    f1.WindowState = 'maximized';
    f1 = tiledlayout (2,2);
    title(f1,[fish_name,' ', date_exp,...
        ' N seizure barcode - threshold 5, 10, 15',...
        ])

for i=1: length (SeizureBarcode_thresholds)
    nexttile
    mat = nan(nROIs,1);
    for j=1:nROIs
        if ismember(j,group10)
            mat(j,:) = [];
        else
        mat (j,1) = all_fish{j, 1}.SponBehaviour.seizureBarcode{i,2};
        end 
    end
    
    
    
    boxplot(mat,group_category,'PlotStyle','compact', 'Color', C1);
    ylabel ('Number of events')
    xlabel ('Groups')
    box off
    
    h={text(1.5,2.5,['ranksum p-value = ' num2str(ranksum(mat(group1),mat(group2)))],'Color','r'),...
        text(2.5,2.5,['ranksum p-value = ' num2str(ranksum(mat(group1),mat(group3)))],'Color','r')... %
        text(3.5,2.5,['ranksum p-value = ' num2str(ranksum(mat(group1),mat(group4)))],'Color','r')};...
%         text(4.5,2.5,['ranksum p-value = ' num2str(ranksum(mat(group4),mat(group5)))],'Color','r')};
    for j= 1:length (h)
        set(h{1,j},'Rotation',90);
    end

    
    
    saveas (f1, [folder_path_save,filesep,figures_subfolder,filesep,fish_name,date_exp '_sponBehaviour_barcode_nSeizure_',num2str(SeizureBarcode_thresholds(i,1)) '.fig']);
    saveas (f1, [folder_path_save,filesep,figures_subfolder,filesep,fish_name,date_exp '_sponBehaviour_barcode_nSeizure_',num2str(SeizureBarcode_thresholds(i,1)) '.jpg']);
    saveas (f1, [folder_path_save,filesep,figures_subfolder,filesep,fish_name,date_exp '_sponBehaviour_barcode_nSeizure_',num2str(SeizureBarcode_thresholds(i,1)) '.svg']);
end 

