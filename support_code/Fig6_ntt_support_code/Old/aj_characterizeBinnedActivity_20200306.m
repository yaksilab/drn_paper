function [all_fish]=aj_characterizeBinnedActivity_20200306 (all_fish,timebin,folder_path_save,fish_name,date_exp,group1,group2,group3, group4, group5, name_group1,name_group2, name_group3, name_group4, name_group5,figures_subfolder, group_category,nROIs,groups,name_groups,exclusionTreshold,transitionTime);
% This function plots and summizes the length of bouts and inactivity
% periods. 

%% Carachterize and plot the activity of the fish based on the calculation done in activty calculation 

%% for all fish spontanious behaviour
% find the indexes of datapoint in the matrix where time reaches the first
% hour
idxEndAcclimatizationT = zeros (nROIs,1);
for ROI=1:nROIs 
    idxEndAcclimatizationT(ROI,:)= find(diff(1:floor(max(all_fish{ROI, 1}.t))>=floor(transitionTime))==1)+1;
end

% this one finds the index of the column where 1 hr/(acclimatization time) is over in the 
% binnedInactivityPeriods field in all fish

idxEndOfAcclimatizationInact = zeros (nROIs,1);
for ROI=1:nROIs
    if isempty(all_fish{ROI, 1}.binnedInactivityPeriods)
        idxEndOfAcclimatizationInact(ROI,:) = nan;
    elseif isempty(find (diff(all_fish{ROI, 1}.binnedInactivityPeriods(1,:)...
        >=idxEndAcclimatizationT(ROI,:)),1))
        idxEndOfAcclimatizationInact(ROI,:)  = nan;
    else
        idxEndOfAcclimatizationInact(ROI,:)  = find (diff(all_fish{ROI, 1}.binnedInactivityPeriods(1,:)...
        >=idxEndAcclimatizationT(ROI,:)));  
    end 
end

% this one makes a temporary matrix of the lengths of the inactivity
% periods in seconds 
inactivityLengthSpon_tempMatrix = zeros(nROIs,1);
for ROI = 1:nROIs
    if isempty(all_fish{ROI, 1}.BinnedBouts)
        inactivityLengthSpon_tempMatrix (ROI,1)= nan;
    elseif isnan(idxEndOfAcclimatizationInact(ROI,:))
        inactivityLengthSpon_tempMatrix (ROI,1)= nan;
    else
        inactivityLengthSpon_tempMatrix (ROI,1)= nanmean(all_fish{ROI, 1}.binnedInactivityPeriods(3,1:idxEndOfAcclimatizationInact(ROI,:)),2);
    end
end

% this one finds the indexes of the column where 1 hr/(acclimatization time) is over in the bouts
% field for all fish 
idxEndOfAcclimatizationBouts = zeros (nROIs,1); 
for ROI=1:nROIs
    if isempty(all_fish{ROI, 1}.BinnedBouts)
        idxEndOfAcclimatizationBouts(ROI,:) = nan;
    elseif isempty(find(diff(all_fish{ROI, 1}.BinnedBouts(1,:)>=idxEndAcclimatizationT(ROI,:)), 1)) 
        idxEndOfAcclimatizationBouts(ROI,:) = nan; % this line gives nan for the fish that do no move at all during the first hour
    else
        idxEndOfAcclimatizationBouts(ROI,:)  = find (diff(all_fish{ROI, 1}.BinnedBouts(1,:)...
        >=idxEndAcclimatizationT(ROI,:)));  
    end 
end

boutLengthSpon_tempMatrix = zeros(nROIs,1);
for ROI = 1:nROIs
    if isempty(all_fish{ROI, 1}.BinnedBouts)
        boutLengthSpon_tempMatrix (ROI,1)= nan;
    elseif isempty(find(diff(all_fish{ROI, 1}.BinnedBouts(1,:)>=idxEndAcclimatizationT(ROI,:)), 1)) 
        boutLengthSpon_tempMatrix(ROI,:) = nan; % this line gives nan for the fish that do no move at all during the first hour
    else
        boutLengthSpon_tempMatrix (ROI,1)= mean(all_fish{ROI, 1}.BinnedBouts(3,1:idxEndOfAcclimatizationBouts(ROI,:)),2);
    end
end

%% plot activity and inactivity for both groups spontanious behaviour 
% % % % % f70=figure();
% % % % % f70.WindowState = 'maximized';
% % % % % 
% % % % % subplot (1,2,1, 'align')
% % % % % histfit(inactivityLengthSpon_tempMatrix),
% % % % % title ('InactivityLength (sec) for spontanious activity both groups')
% % % % % box('off')
% % % % % 
% % % % % subplot (1,2,2, 'align')
% % % % % histfit (boutLengthSpon_tempMatrix)
% % % % % title ('BoutLength (sec) for spontanious activity both groups')
% % % % % box('off')
% % % % % 
% % % % % saveas (f70, [folder_path_save,filesep,figures_subfolder,filesep,fish_name,date_exp '_sponBehaviour_both_groups_boutLengths' '.fig']);
% % % % % saveas (f70, [folder_path_save,filesep,figures_subfolder,filesep,fish_name,date_exp '_sponBehaviour_both_groups_boutLengths' '.jpg']);
% % % % % saveas (f70, [folder_path_save,filesep,figures_subfolder,filesep,fish_name,date_exp '_sponBehaviour_both_groups_boutLengths' '.svg']);

%% For each group Spontanious behaviour
f71=figure;
f71.WindowState = 'maximized';
sgtitle(['Charactarization Of Activity ' 'Spontanious behaviour'])

[limitY,~]=histcounts(inactivityLengthSpon_tempMatrix);
for i=1:length(groups)-1
    subplot (length(groups)-1,4,i)
    histfit(inactivityLengthSpon_tempMatrix(groups{1,i},:))
    title (['InactivityHistogram ' name_groups{1,i}])
    ylim([0 max(limitY)])
    xlabel ('Length (s)')
    set(gca,'TickDir','out');
    box off
end

for i=1:length(groups)-1
    subplot (length(groups)-1,4,i+8)
    histfit(boutLengthSpon_tempMatrix(groups{1,i},:))
    title (['Bouts ' name_groups{1,i}])
    ylim([0 max(limitY)])
    ylabel ('Count')
    xlabel ('Length (s)')
    set(gca,'TickDir','out');
    box off
end

subplot (length(groups)-1,4,5:8)
for i= 1:length(groups)-1
    errorbar (i,nanmean(inactivityLengthSpon_tempMatrix(groups{1,i},:),1),...
        std(inactivityLengthSpon_tempMatrix(groups{1,i},:),[],1,'omitnan')/sqrt(length...
        (inactivityLengthSpon_tempMatrix(groups{1,i},:))), 'Marker', 'o', 'MarkerSize',10)
    hold on 
    
    if i>=1 && i<=3
        text (i+.05, nanmean(inactivityLengthSpon_tempMatrix(groups{1,i},:),1), ['mu=' num2str(nanmean(inactivityLengthSpon_tempMatrix(groups{1,i},:),1)) 'sec']);
        [~,p1] = ttest2(inactivityLengthSpon_tempMatrix(groups{1,i},:),inactivityLengthSpon_tempMatrix(groups{1,i+1},:));
        text (i+.6,min(nanmean(inactivityLengthSpon_tempMatrix,1))-.05, ['ttest_p = ' num2str(p1)] );
        text (i+1.05,min(nanmean(inactivityLengthSpon_tempMatrix,1))-.05, ['WRS_p = ' num2str(ranksum(inactivityLengthSpon_tempMatrix(groups{1,i},:),inactivityLengthSpon_tempMatrix(groups{1,i+1},:)))] );
    else
        text (i+.05, nanmean(inactivityLengthSpon_tempMatrix(groups{1,i},:),1), ['mu=' num2str(nanmean(inactivityLengthSpon_tempMatrix(groups{1,i},:),1)) 'sec']);
%         set([h1 h6 h7],'Rotation',90);
    end
end
hold off
title ('Average Length Of Inactivity with SEM')
box ('off')
ylabel ('Time (s)')
xticks ([1:4])
xticklabels ([name_groups])
xlim ([0 length(groups)])
set(gca,'TickDir','out');

subplot (length(groups)-1,4,13:16)
for i= 1:length(groups)-1
    errorbar (i,nanmean(boutLengthSpon_tempMatrix(groups{1,i},:),1),...
        std(boutLengthSpon_tempMatrix(groups{1,i},:),[],1,'omitnan')/sqrt(length...
        (boutLengthSpon_tempMatrix(groups{1,i},:))), 'Marker', 'o', 'MarkerSize',10)
    hold on 
    
    if i>=1 && i<=3
        text (i+.05, nanmean(boutLengthSpon_tempMatrix(groups{1,i},:),1), ['mu=' num2str(nanmean(boutLengthSpon_tempMatrix(groups{1,i},:),1)) 'sec']);
        [~,p1] = ttest2(boutLengthSpon_tempMatrix(groups{1,i},:),boutLengthSpon_tempMatrix(groups{1,i+1},:));
        text (i+.6,nanmean(boutLengthSpon_tempMatrix(groups{1,i},:),1)+.02, ['ttest_p = ' num2str(p1)] );
        text (i+1.05,nanmean(boutLengthSpon_tempMatrix(groups{1,i},:),1)+.02, ['WRS_p = ' num2str(ranksum(boutLengthSpon_tempMatrix(groups{1,i},:),boutLengthSpon_tempMatrix(groups{1,i+1},:)))] );
    else
        text (i+.05, nanmean(boutLengthSpon_tempMatrix(groups{1,i},:),1), ['mu=' num2str(nanmean(boutLengthSpon_tempMatrix(groups{1,i},:),1)) 'sec']);
%         set([h1 h6 h7],'Rotation',90);
    end
end
hold off

ylim ([min(nanmean(boutLengthSpon_tempMatrix,2)) max(nanmean(boutLengthSpon_tempMatrix,2))])
title (['Average Length Of Bouts +- SEM'])
box ('off')
ylabel ('Time (s)')
xlim ([0 length(groups)])
xticks([1 4])
xticklabels(name_groups)
set(gca,'TickDir','out');

saveas (f71, [folder_path_save,filesep,figures_subfolder,filesep,fish_name,date_exp '_sponBehaviour_group_wise_boutLengths' '.fig']);
saveas (f71, [folder_path_save,filesep,figures_subfolder,filesep,fish_name,date_exp '_sponBehaviour_group_wise_boutLengths' '.jpg']);
saveas (f71, [folder_path_save,filesep,figures_subfolder,filesep,fish_name,date_exp '_sponBehaviour_group_wise_boutLengths' '.svg']);


 %% For each fish for the first hour of spontanious activity - does not make sense.
% % % % % % % % % f72=figure();
% % % % % % % % % 
% % % % % % % % % for ROI= 1:nROIs 
% % % % % % % % %     subplot(nROIs/12,ceil(nROIs/(nROIs/12)),ROI, 'align')
% % % % % % % % %     if isnan(idxEndOfAcclimatizationInact(ROI))
% % % % % % % % %         text(0.1,0.5, 'No movement');
% % % % % % % % %     elseif isnan(1:idxEndOfAcclimatizationBouts(ROI,:))
% % % % % % % % %         histogram (all_fish{ROI, 1}.binnedInactivityPeriods(3,1))
% % % % % % % % %     else
% % % % % % % % %         if idxEndOfAcclimatizationInact(ROI,1)<5
% % % % % % % % %             text(0.1,0.5,'Not enough data');
% % % % % % % % %         else
% % % % % % % % %             histfit(all_fish{ROI, 1}.binnedInactivityPeriods(3,1:idxEndOfAcclimatizationBouts(ROI,:)))
% % % % % % % % %         end
% % % % % % % % %     end
% % % % % % % % %     box off
% % % % % % % % %     
% % % % % % % % %     if ismember(ROI,group1)
% % % % % % % % %         title('M')
% % % % % % % % %     elseif ismember(ROI,group2)
% % % % % % % % %         title('C')
% % % % % % % % %     else
% % % % % % % % %         title('W')
% % % % % % % % %     end 
% % % % % % % % % end 
% % % % % % % % % 
% % % % % % % % % f73=figure();
% % % % % % % % % for ROI= 1:nROIs 
% % % % % % % % %     subplot(nROIs/12,ceil(nROIs/(nROIs/12)),ROI, 'align')
% % % % % % % % %     if isnan(idxEndOfAcclimatizationBouts(ROI))
% % % % % % % % %         text(0.1,0.5, 'No movement');
% % % % % % % % %     elseif isnan(1:idxEndOfAcclimatizationBouts(ROI,:))
% % % % % % % % %         histogram (all_fish{ROI, 1}.BinnedBouts(3,1))
% % % % % % % % %     else
% % % % % % % % %         if idxEndOfAcclimatizationBouts(ROI,1)<5
% % % % % % % % %             text(0.1,0.5,'Not enough data');
% % % % % % % % %         else
% % % % % % % % %             histfit(all_fish{ROI, 1}.BinnedBouts(3,1:idxEndOfAcclimatizationBouts(ROI,:)))
% % % % % % % % %         end
% % % % % % % % %     end
% % % % % % % % %     box off
% % % % % % % % %     
% % % % % % % % %     if ismember(ROI,group1)
% % % % % % % % %         title('M')
% % % % % % % % %     elseif ismember(ROI,group2)
% % % % % % % % %         title('C')
% % % % % % % % %     else
% % % % % % % % %         title('W')
% % % % % % % % %     end 
% % % % % % % % % end 
% % % % % % % % % 
%% For the conditional behaviour, or activity charctarization this part of the function makes calculations


% this one makes a temporary matrix of the lengths of the inactivity
% periods in seconds 
inactivityLengthConditional_tempMatrix = zeros(nROIs,1);
for ROI = 1:nROIs
    if isnan(idxEndOfAcclimatizationInact(ROI,:))
    inactivityLengthConditional_tempMatrix (ROI,1)= nan;
    else
    inactivityLengthConditional_tempMatrix (ROI,1)= mean(...
        all_fish{ROI, 1}.binnedInactivityPeriods(3,idxEndOfAcclimatizationInact(ROI,:)+1:end),2);
    end
end


boutLengthConditional_tempMatrix = zeros(nROIs,1);
for ROI = 1:nROIs
    if isnan(idxEndOfAcclimatizationInact(ROI,:))
        boutLengthConditional_tempMatrix (ROI,1)= nan;
    elseif isempty(find(diff(all_fish{ROI, 1}.BinnedBouts(1,:)>=idxEndAcclimatizationT(ROI,:)), 1)) 
        boutLengthConditional_tempMatrix(ROI,:) = nan; % this line gives nan for the fish that do no move at all during the first hour
    else
        boutLengthConditional_tempMatrix (ROI,1)= mean(all_fish{ROI, 1}.BinnedBouts(3,idxEndOfAcclimatizationBouts(ROI,:)+1:end),2);
    end
end

% % % % % % %% plot characterization of activity for both groups - not good 
% % % % % % 
% % % % % % 
% % % % % % f75=figure();
% % % % % % subplot (1,2,1, 'align')
% % % % % % histfit(inactivityLengthConditional_tempMatrix),
% % % % % % title ('InactivityLength (sec) for spontanious activity both groups')
% % % % % % box('off')
% % % % % % 
% % % % % % subplot (1,2,2, 'align')
% % % % % % histfit (boutLengthConditional_tempMatrix)
% % % % % % title ('BoutLength (sec) for spontanious activity both groups')
% % % % % % box('off')
% % % % % % 
% % % % % % saveas (f75, [folder_path_save,filesep,figures_subfolder,filesep,fish_name,date_exp '_conditionalBehaviour_both_groups_boutLengths' '.fig']);
% % % % % % saveas (f75, [folder_path_save,filesep,figures_subfolder,filesep,fish_name,date_exp '_conditionalBehaviour_both_groups_boutLengths' '.jpg']);
% % % % % % saveas (f75, [folder_path_save,filesep,figures_subfolder,filesep,fish_name,date_exp '_conditionalBehaviour_both_groups_boutLengths' '.svg']);

%% For each group 
f76=figure;
f76.WindowState = 'maximized';
sgtitle(['CharactarizationOfActivity ' 'Evoked behaviour'])

[limitY,~]=histcounts(inactivityLengthConditional_tempMatrix);
for i=1:length(groups)-1
    subplot (length(groups)-1,4,i)
    histfit(inactivityLengthConditional_tempMatrix(groups{1,i},:))
    title (['Inactivity Histogram ' name_groups{1,i}])
    ylim([0 max(limitY)])
    xlabel ('Length (s)')
    set(gca,'TickDir','out');
    box off
end

for i=1:length(groups)-1
    subplot (length(groups)-1,4,i+8)
    histfit(boutLengthConditional_tempMatrix(groups{1,i},:))
    title (['Bouts ' name_groups{1,i}])
    ylim([0 max(limitY)])
    ylabel ('Count')
    xlabel ('Length (s)')
    set(gca,'TickDir','out');
    box off
end

subplot (length(groups)-1,4,5:8)
for i= 1:length(groups)-1
    errorbar (i,nanmean(inactivityLengthConditional_tempMatrix(groups{1,i},:),1),...
        std(inactivityLengthConditional_tempMatrix(groups{1,i},:),[],1,'omitnan')/sqrt(length...
        (inactivityLengthConditional_tempMatrix(groups{1,i},:))), 'Marker', 'o', 'MarkerSize',10)
    hold on 
    
    if i>=1 && i<=3
        text (i+.05, nanmean(inactivityLengthConditional_tempMatrix(groups{1,i},:),1), ['mu=' num2str(nanmean(inactivityLengthConditional_tempMatrix(groups{1,i},:),1)) 'sec']);
        [~,p1] = ttest2(inactivityLengthConditional_tempMatrix(groups{1,i},:),inactivityLengthConditional_tempMatrix(groups{1,i+1},:));
        text (i+.6,min(nanmean(inactivityLengthConditional_tempMatrix,1))-.05, ['ttest_p = ' num2str(p1)] );
        text (i+1.05,min(nanmean(inactivityLengthConditional_tempMatrix,1))-.05, ['WRS_p = ' num2str(ranksum(inactivityLengthConditional_tempMatrix(groups{1,i},:),inactivityLengthConditional_tempMatrix(groups{1,i+1},:)))] );
    else
        text (i+.05, nanmean(inactivityLengthConditional_tempMatrix(groups{1,i},:),1), ['mu=' num2str(nanmean(inactivityLengthConditional_tempMatrix(groups{1,i},:),1)) 'sec']);
%         set([h1 h6 h7],'Rotation',90);
    end
end
hold off
title ('Average Length Of Inactivity with SEM')
box ('off')
ylabel ('Time (s)')
xticks ([1:4])
xticklabels ([name_groups])
xlim ([0 length(groups)])
set(gca,'TickDir','out');

subplot (length(groups)-1,4,13:16)
for i= 1:length(groups)-1
    errorbar (i,nanmean(boutLengthConditional_tempMatrix(groups{1,i},:),1),...
        std(boutLengthConditional_tempMatrix(groups{1,i},:),[],1,'omitnan')/sqrt(length...
        (boutLengthConditional_tempMatrix(groups{1,i},:))), 'Marker', 'o', 'MarkerSize',10)
    hold on 
    
    if i>=1 && i<=3
        text (i+.05, nanmean(boutLengthConditional_tempMatrix(groups{1,i},:),1), ['mu=' num2str(nanmean(boutLengthConditional_tempMatrix(groups{1,i},:),1)) 'sec']);
        [~,p1] = ttest2(boutLengthConditional_tempMatrix(groups{1,i},:),boutLengthConditional_tempMatrix(groups{1,i+1},:));
        text (i+.6,nanmean(boutLengthConditional_tempMatrix(groups{1,i},:),1)+.02, ['ttest_p = ' num2str(p1)] );
        text (i+1.05,nanmean(boutLengthConditional_tempMatrix(groups{1,i},:),1)+.02, ['WRS_p = ' num2str(ranksum(boutLengthConditional_tempMatrix(groups{1,i},:),boutLengthConditional_tempMatrix(groups{1,i+1},:)))] );
    else
        text (i+.05, nanmean(boutLengthConditional_tempMatrix(groups{1,i},:),1), ['mu=' num2str(nanmean(boutLengthConditional_tempMatrix(groups{1,i},:),1)) 'sec']);
%         set([h1 h6 h7],'Rotation',90);
    end
end
hold off

ylim ([min(nanmean(boutLengthConditional_tempMatrix,2)) max(nanmean(boutLengthConditional_tempMatrix,2))])
title (['Average Length Of Bouts +- SEM'])
box ('off')
ylabel ('Time (s)')
xlim ([0 length(groups)])
xticks([1 4])
xticklabels(name_groups)
set(gca,'TickDir','out');

saveas (f76, [folder_path_save,filesep,figures_subfolder,filesep,fish_name,date_exp '_conditionalBehaviour_group_wise_boutLengths' '.fig']);
saveas (f76, [folder_path_save,filesep,figures_subfolder,filesep,fish_name,date_exp '_conditionalBehaviour_group_wise_boutLengths' '.jpg']);
saveas (f76, [folder_path_save,filesep,figures_subfolder,filesep,fish_name,date_exp '_conditionalBehaviour_group_wise_boutLengths' '.svg']);


%% For each fish for the  condtional activity - does not make sense.
% % % % % f76=figure();
% % % % % for ROI= 1:nROIs 
% % % % %     subplot(nROIs/12,ceil(nROIs/(nROIs/12)),ROI, 'align')
% % % % %     if isnan(idxEndOfAcclimatizationInact(ROI))
% % % % %         text(0.1,0.5, 'No movement');
% % % % %     else
% % % % %         histfit(all_fish{ROI, 1}.binnedInactivityPeriods(3,idxEndOfAcclimatizationInact(ROI,:)+1:end))
% % % % %     end
% % % % %     box off
% % % % %     
% % % % %     if ismember(ROI,group1)
% % % % %         title('M')
% % % % %     elseif ismember(ROI,group2)
% % % % %         title('C')
% % % % %     else
% % % % %         title('W')
% % % % %     end 
% % % % % end 
% % % % % 
% % % % % f77=figure;
% % % % % for ROI= 1:nROIs 
% % % % %     subplot(nROIs/12,ceil(nROIs/(nROIs/12)),ROI, 'align')
% % % % %     if isnan(idxEndOfAcclimatizationBouts(ROI))
% % % % %         text(0.1,0.5, 'No movement');
% % % % %     elseif isempty((all_fish{ROI, 1}.BinnedBouts(3,idxEndOfAcclimatizationBouts(ROI,:)+1:end)))...
% % % % %             || size((all_fish{ROI, 1}.BinnedBouts(3,idxEndOfAcclimatizationBouts(ROI,:)+1:end)),2)<5
% % % % %         histogram(all_fish{ROI, 1}.BinnedBouts(3,idxEndOfAcclimatizationBouts(ROI,:)+1:end))
% % % % %     else
% % % % %         histfit(all_fish{ROI, 1}.BinnedBouts(3,idxEndOfAcclimatizationBouts(ROI,:)+1:end))
% % % % %     end
% % % % %     box off
% % % % %     
% % % % %     if ismember(ROI,group1)
% % % % %         title('M')
% % % % %     elseif ismember(ROI,group2)
% % % % %         title('C')
% % % % %     else
% % % % %         title('W')
% % % % %     end 
% % % % % end
% % % % % 








