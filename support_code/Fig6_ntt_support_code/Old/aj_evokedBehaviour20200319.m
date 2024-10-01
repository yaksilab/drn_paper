function [all_fish]= aj_evokedBehaviour20200319 (all_fish,timebin,folder_path_save,fish_name,date_exp,group1,group2,group3, group4, group5, name_group1,name_group2, name_group3, name_group4, name_group5,figures_subfolder, group_category,nROIs,groups,name_groups,exclusionTreshold,transitionTime)
% calculation and plots for the conditioned behaviour/ experiment

%% Find indexes of the lights are turned on and off
idxLightsOn  = zeros(nROIs,20);
idxLightsOff = zeros(nROIs,21);
for ROI=1:length(all_fish)
    idxLightsOn(ROI,:) = (find (diff(all_fish{ROI, 1}.lightsInfo)==1)+1)';
    idxLightsOff(ROI,:) = (find (diff(all_fish{ROI, 1}.lightsInfo)==-1)+1)';
end
%% ten seconds and five seconds binned velocity for condtioned behaviour -OK 20210221
% 
% velBinnedTen_temp       = cell(20,1);
% velBinnedFive_temp      = cell(20,1);
% distBinnedTen_temp      = cell(20,1);
% distBinnedFive_temp     = cell(20,1);
% accelBinnedTen_temp     = cell(20,1);
% accelBinnedFive_temp    = cell(20,1);
% 
% for i= 1:size(idxLightsOn,2)
%     for ROI=1:nROIs
%         
%         t           = all_fish{ROI, 1}.t;
%         timeLight   = all_fish{ROI, 1}.timestampLight;
%         speed_overT = all_fish{ROI, 1}.speed_over_time;
%         S           = all_fish{ROI,1}.distance;
%         Accel       = all_fish{ROI, 1}.acc_over_time;
%         
%         velBinnedTen_temp{i,1}(ROI,:) = [nanmean(speed_overT(t >= timeLight(idxLightsOn(ROI,i)-10) &...
%             t <= timeLight(idxLightsOn(ROI,i)-1)),2) ...
%             nanmean(speed_overT(t >= timeLight(idxLightsOn(ROI,i)) &...
%             t <= timeLight(idxLightsOff(ROI,i+1)-1)),2)...
%             nanmean(speed_overT(t >= timeLight(idxLightsOff(ROI,i+1)) &...
%             t <= timeLight(idxLightsOff(ROI,i+1)+10)),2)];
%         
%         velBinnedFive_temp{i,1}(ROI,:) = [nanmean(speed_overT(t >= timeLight(idxLightsOn(ROI,i)-10) &...
%             t <= timeLight(idxLightsOn(ROI,i)-6)),2)...
%             nanmean(speed_overT(t >= timeLight(idxLightsOn(ROI,i)-5) &...
%             t <= timeLight(idxLightsOn(ROI,i)-1)),2)...
%             nanmean(speed_overT(t >= timeLight(idxLightsOn(ROI,i)) &...
%             t <= timeLight(idxLightsOn(ROI,i)+4)),2)...
%             nanmean(speed_overT(t >= timeLight(idxLightsOn(ROI,i)+5) &...
%             t <= timeLight(idxLightsOff(ROI,i+1)-1)),2)...
%             nanmean(speed_overT(t >= timeLight(idxLightsOff(ROI,i+1)) &...
%             t <= timeLight(idxLightsOff(ROI,i+1)+5)),2)...
%             nanmean(speed_overT(t >= timeLight(idxLightsOff(ROI,i+1)+6) &...
%             t <= timeLight(idxLightsOff(ROI,i+1)+10)),2)];
%         
%         distBinnedTen_temp{i,1}(ROI,:) = [sum(S(t >= timeLight(idxLightsOn(ROI,i)-10) &...
%             t <= timeLight(idxLightsOn(ROI,i)-1)),1,'omitnan') ...
%             sum(S(t >= timeLight(idxLightsOn(ROI,i)) &...
%             t <= timeLight(idxLightsOff(ROI,i+1)-1)),1,'omitnan')...
%             sum(S(t >= timeLight(idxLightsOff(ROI,i+1)) &...
%             t <= timeLight(idxLightsOff(ROI,i+1)+10)),1,'omitnan')];
%         
%         distBinnedFive_temp{i,1}(ROI,:) = [sum(S(t >= timeLight(idxLightsOn(ROI,i)-10) &...
%             t <= timeLight(idxLightsOn(ROI,i)-6)),1,'omitnan')...
%             sum(S(t >= timeLight(idxLightsOn(ROI,i)-5) &...
%             t <= timeLight(idxLightsOn(ROI,i)-1)),1,'omitnan')...
%             sum(S(t >= timeLight(idxLightsOn(ROI,i)) &...
%             t <= timeLight(idxLightsOn(ROI,i)+4)),1,'omitnan')...
%             sum(S(t >= timeLight(idxLightsOn(ROI,i)+5) &...
%             t <= timeLight(idxLightsOff(ROI,i+1)-1)),1,'omitnan')...
%             sum(S(t >= timeLight(idxLightsOff(ROI,i+1)) &...
%             t <= timeLight(idxLightsOff(ROI,i+1)+5)),1,'omitnan')...
%             sum(S(t >= timeLight(idxLightsOff(ROI,i+1)+6) &...
%             t <= timeLight(idxLightsOff(ROI,i+1)+10)),1,'omitnan')];
%         
%         accelBinnedTen_temp{i,1}(ROI,:) = [nanmean(Accel(t >= timeLight(idxLightsOn(ROI,i)-10) &...
%             t <= timeLight(idxLightsOn(ROI,i)-1)),2) ...
%             nanmean(Accel(t >= timeLight(idxLightsOn(ROI,i)) &...
%             t <= timeLight(idxLightsOff(ROI,i+1)-1)),2)...
%             nanmean(Accel(t >= timeLight(idxLightsOff(ROI,i+1)) &...
%             t <= timeLight(idxLightsOff(ROI,i+1)+10)),2)];
%         
%         accelBinnedFive_temp{i,1}(ROI,:) = [nanmean(Accel(t >= timeLight(idxLightsOn(ROI,i)-10) &...
%             t <= timeLight(idxLightsOn(ROI,i)-6)),2)...
%             nanmean(Accel(t >= timeLight(idxLightsOn(ROI,i)-5) &...
%             t <= timeLight(idxLightsOn(ROI,i)-1)),2)...
%             nanmean(Accel(t >= timeLight(idxLightsOn(ROI,i)) &...
%             t <= timeLight(idxLightsOn(ROI,i)+4)),2)...
%             nanmean(Accel(t >= timeLight(idxLightsOn(ROI,i)+5) &...
%             t <= timeLight(idxLightsOff(ROI,i+1)-1)),2)...
%             nanmean(Accel(t >= timeLight(idxLightsOff(ROI,i+1)) &...
%             t <= timeLight(idxLightsOff(ROI,i+1)+5)),2)...
%             nanmean(Accel(t >= timeLight(idxLightsOff(ROI,i+1)+6) &...
%             t <= timeLight(idxLightsOff(ROI,i+1)+10)),2)];
%     end
% end
% 
% %% Barplot for the reactions to light - 5 seconds bin
% 
% for k= 1:length(groups)-1
%     f31=figure();
%     f31.WindowState='Maximized';
%     sgtitle(['BarPlot of velocity five seconds bin for ' name_groups{1,k}])
%     for i=1:20 %%%%%%%%%%% REMEMBER to change this for the standard assay 
%         subplot(4,5,i) %%%%%%%%%%% REMEMBER to change this for the standard assay 
%         for j=1:6
%             bar(j,mean(velBinnedFive_temp{i, 1}(groups{1,k},j))), hold on
%             errorbar(j,mean(velBinnedFive_temp{i, 1}(groups{1,k},j)),...
%                 std(velBinnedFive_temp{i, 1}(groups{1,k},j))/...
%                 sqrt(size(groups{1,k},2))), hold on
%         end
% %         rectangle('Position', [2.5 0 2 floor(max(mean((velBinnedFive_temp{i, 1}(groups{1,k},:)),2)))+ ceil(std(mean((velBinnedFive_temp{i, 1}(groups{1,k},:)),2),[],'omitnan'))],...
% %             'Facecolor', [1 1 0 0.2], 'EdgeColor', [1 1 0 0.5])
%         
%         hold off
%         
%         xticks([])
%         xlim([-1 8])
%         ylim([0 max(mean((velBinnedFive_temp{1, 1}(groups{1,2},:)),2))+1])
%         set(gca,'xcolor','none')
%         box ('off')
%         if i==1|| i==6|| i==11|| i==16
%             ylabel('Velocity (mm/s)')
%         end
%         
%         clearvars j
%     end
%     
%     saveas (f31, [folder_path_save,filesep,figures_subfolder,filesep,fish_name,date_exp '_evokedBehaviour_binnedVel_barPlot_5secBin_',name_groups{1,k}  '.fig']);
%     saveas (f31, [folder_path_save,filesep,figures_subfolder,filesep,fish_name,date_exp '_evokedBehaviour_binnedVel_barPlot_5secBin_',name_groups{1,k}  '.jpg']);
%     saveas (f31, [folder_path_save,filesep,figures_subfolder,filesep,fish_name,date_exp '_evokedBehaviour_binnedVel_barPlot_5secBin_',name_groups{1,k}  '.svg']);
% end

%% Lineplot of the reaction to lights for each group
% f32=figure();
% f32.WindowState='Maximized';
% sgtitle(['Mean Velocity for five seconds bin -' fish_name])
% 
% for i=1:20
%     for j=1:length(groups)-1
%         tempVelY{i,1}(j,:) = vertcat (mean(velBinnedFive_temp{i, 1}(groups{1,j},:),1));
%         boundsVelY{i,1}(j,:) = vertcat (std(velBinnedFive_temp{i, 1}(groups{1,j},:),'omitnan')./...
%             (ones (1,6)*sqrt(size(groups{1,j},2))));
%     end 
% end
% for i=1:20 %%%%%%%%%%% REMEMBER to change this for the standard assay 
%     subplot(4,5,i) %%%%%%%%%%% REMEMBER to change this for the standard assay 
%     for j=1:length (groups)-1
%     boundedline (1:6,tempVelY{i,1},boundsVelY{i,1}(j,:),'cmap', jet(4),'transparency', 0.2)
%     end 
%     rectangle('Position', [3 0 1 max(max(tempVelY{i,1}))+1],'Facecolor', [1 1 0 0.2], 'EdgeColor', [1 1 0])
%     legend (name_groups(1:end-1))
%     xticks([])
%     xlim([1 6])
%     ylim([0 max(max(tempVelY{1,2}))+max(boundsVelY{1,2}(1,:))+1])
%     title(['Stim ' num2str(i)])
%     set(gca,'xcolor','none')
%     box ('off')
%     if i==1|| i==6|| i==11|| i==16
%         ylabel('Velocity (mm/s)')
%     end
%     
% end
% 
% 
% saveas (f32, [folder_path_save,filesep,figures_subfolder,filesep,fish_name,date_exp '_evokedBehaviour_binnedVel_linePlot_5secBin_',fish_name  '.fig']);
% saveas (f32, [folder_path_save,filesep,figures_subfolder,filesep,fish_name,date_exp '_evokedBehaviour_binnedVel_linePlot_5secBin_',fish_name  '.jpg']);
% saveas (f32, [folder_path_save,filesep,figures_subfolder,filesep,fish_name,date_exp '_evokedBehaviour_binnedVel_linePlot_5secBin_',fish_name  '.svg']);


% %% Barplot for the reactions to light for ten seconds bin- velocity
% 
% for k=1:length(groups)-1
%     f35=figure();
%     f35.WindowState='Maximized';
%     sgtitle(['BarPlot of velocity ten seconds bin for ' name_groups{1,k}])
% 
% for i=1:20 %%%%%%%%%%%%% REMEMBER to change this for the standard assay 
%     
%     subplot(4,5,i) %%%%%%%%%%% REMEMBER to change this for the standard assay 
%     for j=1:3
%         bar(j,nanmean(velBinnedTen_temp{i, 1}(groups{1,k},j)),'grouped'), hold on
%         
%         errorbar(j,nanmean(velBinnedTen_temp{i, 1}(groups{1,k},j)),std(velBinnedTen_temp{i, 1}(groups{1,k},j),'omitnan')/sqrt(size(groups{1,k},2))), hold on
%     end
%     %     rectangle('Position', [2.5 0 2 max(mean((velBinnedTen_temp{i, 1}(group1,:)),2))+1],'Facecolor', [1 1 0 0.2], 'EdgeColor', [1 1 0 0.5])
%     
%     hold off
%     
%     xticks([])
%     xlim([0 4])
%     ylim([0 max((velBinnedTen_temp{1, 1}(groups{1,2})))+ max(std(velBinnedTen_temp{1, 1}(groups{1,1}),'omitnan'))])
%     set(gca,'xcolor','none')
%     box ('off')
%     if i==1|| i==6|| i==11|| i==16
%         ylabel('Velocity (mm/s)')
%     end
%     clearvars j
% end
% saveas (f35, [folder_path_save,filesep,figures_subfolder,filesep,fish_name,date_exp '_evokedBehaviour_binnedVel_linePlot_10secBin_',name_groups{1,k}  '.fig']);
% saveas (f35, [folder_path_save,filesep,figures_subfolder,filesep,fish_name,date_exp '_evokedBehaviour_binnedVel_linePlot_10secBin_',name_groups{1,k}  '.jpg']);
% saveas (f35, [folder_path_save,filesep,figures_subfolder,filesep,fish_name,date_exp '_evokedBehaviour_binnedVel_linePlot_10secBin_',name_groups{1,k}  '.svg']);
% end 
% 
%% Plot distances for each stimulation
% 
%     f37=figure();
% f37.WindowState='Maximized';
% sgtitle(['BarPlot of Distance five seconds bin'])
% 
% for i=1:20 %%%%%%%%%%% REMEMBER to change this for the standard assay 
%     
%     subplot(4,5,i) %%%%%%%%%%% REMEMBER to change this for the standard assay 
%         for k=1:length(groups)-1
%             barMat (k,:) =  nanmean(distBinnedFive_temp{i, 1}(groups{1,k},:),1);
%         end
%    
%     
%     bar(barMat)  
% %     errorbar(j,nanmean(distBinnedFive_temp{i, 1}(groups{1,k},j)),std(distBinnedFive_temp{i, 1}(groups{1,k},j),'omitnan')/sqrt(size(groups{1,k},2))), hold on
% 
% %     rectangle('Position', [2.5 0 2 max(mean((distBinnedFive_temp{i, 1}(groups{1,k},:)),2))+1],'Facecolor', [1 1 0 0.2], 'EdgeColor', [1 1 0 0.5])
%     
%     hold off
%     
%     xticks([])
% %     xlim([-1 8])
%     set(gca,'xcolor','none')
%     box ('off')
%     if i==1|| i==6|| i==11|| i==16
%         ylabel('Distance (mm)')
%     end
%     clearvars j
% end
% 
% saveas (f37, [folder_path_save,filesep,figures_subfolder,filesep,fish_name,date_exp '_evokedBehaviour_distance_barPlot_5secBin_grouped_genotype'  '.fig']);
% saveas (f37, [folder_path_save,filesep,figures_subfolder,filesep,fish_name,date_exp '_evokedBehaviour_distance_barPlot_5secBin_grouped_genotype'  '.jpg']);
% saveas (f37, [folder_path_save,filesep,figures_subfolder,filesep,fish_name,date_exp '_evokedBehaviour_distance_barPlot_5secBin_grouped_gentoype'  '.svg']);


%% grouped based on bin

% f37=figure();
% f37.WindowState='Maximized';
% sgtitle(['BarPlot of Distance five seconds bin'])
% 
% for i=1:20 %%%%%%%%%%% REMEMBER to change this for the standard assay 
%     
%     subplot(4,5,i) %%%%%%%%%%% REMEMBER to change this for the standard assay 
%         for k=1:length(groups)-1
%             barMat (k,:) =  nanmean(distBinnedFive_temp{i, 1}(groups{1,k},:),1);
%             
%         end
%    
%     
%     bar(barMat')  
% %     errorbar(j,nanmean(distBinnedFive_temp{i, 1}(groups{1,k},j)),std(distBinnedFive_temp{i, 1}(groups{1,k},j),'omitnan')/sqrt(size(groups{1,k},2))), hold on
% 
% %     rectangle('Position', [2.5 0 2 max(mean((distBinnedFive_temp{i, 1}(groups{1,k},:)),2))+1],'Facecolor', [1 1 0 0.2], 'EdgeColor', [1 1 0 0.5])
%     
%     hold off
%     
%     xticks([])
% %     xlim([-1 8])
%     set(gca,'xcolor','none')
%     box ('off')
%     if i==1|| i==6|| i==11|| i==16
%         ylabel('Distance (mm)')
%     end
%     ylim([0 35])
%     legend(name_groups{1,1:3})
% end
% 
% saveas (f37, [folder_path_save,filesep,figures_subfolder,filesep,fish_name,date_exp '_evokedBehaviour_distance_barPlot_5secBin_grouped_bins'  '.fig']);
% saveas (f37, [folder_path_save,filesep,figures_subfolder,filesep,fish_name,date_exp '_evokedBehaviour_distance_barPlot_5secBin_grouped_bins'  '.jpg']);
% saveas (f37, [folder_path_save,filesep,figures_subfolder,filesep,fish_name,date_exp '_evokedBehaviour_distance_barPlot_5secBin_grouped_bins'  '.svg']);
% 


%% calculate longer periods of velocity, acceleration and distance- conditional behaviuor - remeber to uncomment for the normal assay
tempMat = cell(20,4);
for i=1:size(idxLightsOn,2)
    tempMat{i,1}= ['Stimulation number' num2str(i)];
    
    for ROI=1:nROIs
        t         = 1:floor(max(all_fish{ROI, 1}.t));
        timeLight = all_fish{ROI, 1}.timestampLight;
        velocity  = all_fish{ROI, 1}.bV_E4sd;
        S         = all_fish{ROI, 1}.bD;
        accel     = all_fish{ROI, 1}.binnedAcc;      
        
        %% For velocity
        temp11   = (velocity(...
            t >= floor(timeLight(idxLightsOn(ROI,i))-30) &...  %% 30 seconds before
            t <= floor(timeLight(idxLightsOn(ROI,i))-1) )); 
        
        temp12   = (velocity(...
            t >= floor(timeLight(idxLightsOn(ROI,i))) &...  
            t <= floor(timeLight(idxLightsOff(ROI,i+1))+19) )); %% til ten seconds after
        
        T11 = reshape(temp11,[1,30]);
        T12 = interp1(1:length(temp12),temp12,(1:1:30));
        
        temp_total1=[T11,T12];
        tempMat{i,2}(ROI,1:size(temp_total1,2)) = temp_total1;
        
        %% For acceleration
        temp1   = (accel(...
            t >= floor(timeLight(idxLightsOn(ROI,i))-30) &...  %% ten seconds before
            t <= floor(timeLight(idxLightsOn(ROI,i))-1) )); 
        
        temp2   = (accel(...
            t >= floor(timeLight(idxLightsOn(ROI,i))) &...  
            t <= floor(timeLight(idxLightsOff(ROI,i+1))+19) )); %% til ten seconds after
        
        T13 = reshape(temp1,[1,30]);
        T14 = interp1(1:length(temp2),temp2,(1:1:30));
        
        temp_total2=[T13,T14];
        tempMat{i,3}(ROI,1:size(temp_total2,2)) = temp_total2;
        
        %% for distance
        temp3   = (S(...
            t >= floor(timeLight(idxLightsOn(ROI,i))-30) &...  %% ten seconds before
            t <= floor(timeLight(idxLightsOn(ROI,i))-1) )); 
        
        temp4   = (S(...
            t >= floor(timeLight(idxLightsOn(ROI,i))) &...  
            t <= floor(timeLight(idxLightsOff(ROI,i+1))+19) )); %% til ten seconds after
        
        T13 = reshape(temp3,[1,30]);
        T14 = interp1(1:length(temp4),temp4,(1:1:30));
        
        temp_total3=[T13,T14];
        tempMat{i,4}(ROI,1:size(temp_total3,2)) = temp_total3;
     
      
        
        %% empty variables
        temp1  = [];
        temp2  = [];
        temp11 = [];
        temp12 = [];
        temp_total3 = [];
        
        
    end
end
   
%% save the evoked behaviour data
% for ROI=1:nROIs
%     all_fish{ROI, 1}.evokedBehaviour = tempMat;
% end 
% 
% save([folder_path_save,filesep,fish_name,date_exp '_data.mat'],'all_fish','-v7.3');

%% Make lineplot of the velocity data
if any(strcmp(fish_name,{'chrna4ab'}))
    aj_evokedB_5groups (tempMat,groups,name_groups,folder_path_save,figures_subfolder,fish_name,date_exp,idxLightsOn) 
else
    aj_evokedB_4groupsOrLess (tempMat,groups,name_groups,folder_path_save,figures_subfolder,fish_name,date_exp,idxLightsOn)
end

% matrise=cell(1,length (groups)-1);
% for k=1:length(groups)-1
%     for i=1:size(idxLightsOn,2)
%         matrise{1,k}(i,:)  = nanmean (tempMat{i,2} (groups{1,k},:));
%     end
% end
% 
% f39=figure();
% f39.WindowState='Maximized';
% for j= 1:length(matrise)
%     limitMat3 (j*20-20+1:j*20,:)= matrise{1,j}(:,:);    
% end 
% for k=1:length (groups)-1
% subplot (5,5,k)
% imagesc([matrise{1,k}])
% colormap(flipud(hot))
% colorbar
% caxis([0 ceil(max(max(limitMat3)))])
% title (['velocityHeatmap ' name_groups{1,k}])
% ylabel('Stimulus number')
% xlabel('time (s)')
% box ('off')
% set(gca,'TickDir','out'); % The only other option is 'in'
% end 
% 
% for k=1:length(groups)-1
%     for i=6:25
%         subplot (5,5,i)
%         rectangle('Position', [31 0 10 max(max(matrise{1,1}))+2],'Facecolor',[1 1 0 0.2],'EdgeColor', [1 1 0])
%         if i==k+5
%             boundedline(1:size(matrise{1,k}(1:5,:),2), nanmean(matrise{1,k}(1:5,:)),std((matrise{1,k}(1:5,:)),[],1,'omitnan'),'alpha')
%             title ('Mean responses for 10 min interStim interval')
%         elseif i==k+10
%             boundedline(1:size(matrise{1,k}(6:10,:),2), nanmean(matrise{1,k}(6:10,:)),std((matrise{1,k}(6:10,:)),[],1,'omitnan'),'alpha')
%             title ('Mean responses for 5 min interStim interval')
%         else
%             if i==k+15
%                 boundedline(1:size(matrise{1,k},2), nanmean(matrise{1,k}(11:15,:)),std((matrise{1,k}(11:15,:)),[],1,'omitnan'),'alpha')
%                 title ('Mean responses for 2 min interStim interval')
%             elseif i==k+20
%                 boundedline(1:size(matrise{1,k},2), nanmean(matrise{1,k}(16:20,:)),std((matrise{1,k}(16:20,:)),[],1,'omitnan'),'alpha')
%                 title ('Mean responses for 1 min interStim interval')
%             end
%         end
%         colorbar
%         set(gca,'TickDir','out');
%         ylim([-3 ceil(max(max(limitMat3)))+std(max(limitMat3),[],'all')])
% %         xlim([1 size(tempMat{i,2}(groups{1,1},:),2)])
%         ylabel ('Velocity (mm/s)')
%         
%     end
% end 
%     saveas (f39, [folder_path_save,filesep,figures_subfolder,filesep,fish_name,date_exp '_evokedBehaviour_velocity_linePlot_withSD_allGroups'  '.fig']);
%     saveas (f39, [folder_path_save,filesep,figures_subfolder,filesep,fish_name,date_exp '_evokedBehaviour_velocity_linePlot_withSD_allGroups'  '.jpg']);
%     saveas (f39, [folder_path_save,filesep,figures_subfolder,filesep,fish_name,date_exp '_evokedBehaviour_velocity_linePlot_withSD_allGroups'  '.svg']);
% 
