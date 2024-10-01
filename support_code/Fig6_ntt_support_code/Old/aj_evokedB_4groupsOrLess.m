function aj_evokedB_4groupsOrLess (tempMat,groups,name_groups,folder_path_save,figures_subfolder,fish_name,date_exp,idxLightsOn)
%% Make lineplot of the velocity data

matrise=cell(1,length (groups)-1);
for k=1:length(groups)-1
    for i=1:size(idxLightsOn,2)
        matrise{1,k}(i,:)  = nanmean (tempMat{i,2} (groups{1,k},:));
    end
end

f39=figure();
f39.WindowState='Maximized';
for j= 1:length(matrise)
    limitMat3 (j*20-20+1:j*20,:)= matrise{1,j}(:,:);    
end 
for k=1:length (groups)-1
subplot (5,4,k)
imagesc([matrise{1,k}])
colormap(flipud(hot))
colorbar
caxis([0 ceil(max(max(limitMat3)))])
title (['velocityHeatmap ' name_groups{1,k}])
ylabel('Stimulus number')
xlabel('time (s)')
box ('off')
set(gca,'TickDir','out'); % The only other option is 'in'
end 

for k=1:length(groups)-1
    for i=5:20
        subplot (5,4,i)
        rectangle('Position', [31 0 10 max(max(matrise{1,1}))+2],'Facecolor',[1 1 0 0.2],'EdgeColor', [1 1 0])
        if i==k+4
            boundedline(1:size(matrise{1,k}(1:5,:),2), nanmean(matrise{1,k}(1:5,:)),std((matrise{1,k}(1:5,:)),[],1,'omitnan'),'alpha')
            title ('Mean responses for 10 min interStim interval')
        elseif i==k+8
            boundedline(1:size(matrise{1,k}(6:10,:),2), nanmean(matrise{1,k}(6:10,:)),std((matrise{1,k}(6:10,:)),[],1,'omitnan'),'alpha')
            title ('Mean responses for 5 min interStim interval')
        else
            if i==k+12
                boundedline(1:size(matrise{1,k},2), nanmean(matrise{1,k}(11:15,:)),std((matrise{1,k}(11:15,:)),[],1,'omitnan'),'alpha')
                title ('Mean responses for 2 min interStim interval')
            elseif i==k+16
                boundedline(1:size(matrise{1,k},2), nanmean(matrise{1,k}(16:20,:)),std((matrise{1,k}(16:20,:)),[],1,'omitnan'),'alpha')
                title ('Mean responses for 1 min interStim interval')
            end
        end
        colorbar
        set(gca,'TickDir','out');
        ylim([-3 ceil(max(max(limitMat3)))+std(max(limitMat3),[],'all')])
%         xlim([1 size(tempMat{i,2}(groups{1,1},:),2)])
        ylabel ('Velocity (mm/s)')
        
    end
end 
    saveas (f39, [folder_path_save,filesep,figures_subfolder,filesep,fish_name,date_exp '_evokedBehaviour_velocity_linePlot_withSD_allGroups'  '.fig']);
    saveas (f39, [folder_path_save,filesep,figures_subfolder,filesep,fish_name,date_exp '_evokedBehaviour_velocity_linePlot_withSD_allGroups'  '.jpg']);
    saveas (f39, [folder_path_save,filesep,figures_subfolder,filesep,fish_name,date_exp '_evokedBehaviour_velocity_linePlot_withSD_allGroups'  '.svg']);

    %% normalized
    matrise2 = cell(size(matrise));
    for i=1:length(matrise2)
        for j=1:size(matrise{1,1},1)
            matrise2{1,i}(j,:) = matrise{1,i}(j,:)./mean(matrise{1,i}(j,1:30),'omitnan');
        end
    end 
    
    f39=figure();
    
f39.WindowState='Maximized';
for j= 1:length(matrise2)
    limitMat2 (j*20-20+1:j*20,:)= matrise2 {1,j}(:,:);    
end 
for k=1:length(groups)-1
subplot (5,4,k)
imagesc([matrise2{1,k}])
colormap(flipud(hot))
colorbar
caxis([0 ceil(max(max(limitMat2)))])
title (['Normalized Velcity ' name_groups{1,k}])
ylabel('Stimulus number')
xlabel('time (s)')
box ('off')
set(gca,'TickDir','out'); % The only other option is 'in'
end 

for k=1:length(groups)-1
    for i=5:20
        subplot (5,4,i)
        rectangle('Position', [31 0 10 ceil(max(max(matrise2{1,1}))+2)],'Facecolor',[1 1 0 0.2],'EdgeColor', [1 1 0])
        if i==k+4
            boundedline(1:size(matrise2{1,k}(1:5,:),2), nanmean(matrise2{1,k}(1:5,:)),std((matrise2{1,k}(1:5,:)),[],1,'omitnan'),'alpha')
            title ('Mean responses for 10 min interStim interval')
        elseif i==k+8
            boundedline(1:size(matrise2{1,k}(6:10,:),2), nanmean(matrise2{1,k}(6:10,:)),std((matrise2{1,k}(6:10,:)),[],1,'omitnan'),'alpha')
            title ('Mean responses for 5 min interStim interval')
        else
            if i==k+12
                boundedline(1:size(matrise2{1,k},2), nanmean(matrise2{1,k}(11:15,:)),std((matrise2{1,k}(11:15,:)),[],1,'omitnan'),'alpha')
                title ('Mean responses for 2 min interStim interval')
            elseif i==k+16
                boundedline(1:size(matrise2{1,k},2), nanmean(matrise2{1,k}(16:20,:)),std((matrise2{1,k}(16:20,:)),[],1,'omitnan'),'alpha')
                title ('Mean responses for 1 min interStim interval')
            end
        end
        colorbar
        set(gca,'TickDir','out');
        ylim([-3 45])%ceil(max(max(limitMat2)))+std(max(limitMat2),[],'all')])
        xlim([1 size(tempMat{i,2} (groups{1,1},:),2)])
        
        
    end
end 

    saveas (f39, [folder_path_save,filesep,figures_subfolder,filesep,fish_name,date_exp '_evokedBehaviour_normalized_velocity_linePlot_withSD_allGroups'  '.fig']);
    saveas (f39, [folder_path_save,filesep,figures_subfolder,filesep,fish_name,date_exp '_evokedBehaviour_normalized_velocity_linePlot_withSD_allGroups'  '.jpg']);
    saveas (f39, [folder_path_save,filesep,figures_subfolder,filesep,fish_name,date_exp '_evokedBehaviour_normalized_velocity_linePlot_withSD_allGroups'  '.svg']);

    
    %% percent increase 
    
    matrise3 = cell(size(matrise));
    for i=1:length(matrise3)
        for j=1:size(matrise{1,1},1)
            matrise3{1,i}(j,:) = (matrise{1,i}(j,:)-mean(matrise{1,i}(j,1:30),'omitnan'));
            matrise3{1,i}(j,:) = matrise3{1,i}(j,:)./mean(matrise{1,i}(j,1:30),'omitnan');
        end
    end 
    
    
f39=figure();
f39.WindowState='Maximized';
for j= 1:length(matrise3)
    limitMat (j*20-20+1:j*20,:)= matrise3 {1,j}(:,:);    
end 

for k=1:length(groups)-1
subplot (5,4,k)
imagesc([matrise3{1,k}])
colormap(flipud (hot))
colorbar
caxis([0 40])%ceil(max(max(limitMat)))])
title (['deltaVelHeatmap ' name_groups{1,k}])
ylabel('Stimulus number')
xlabel('time (s)')
box ('off')
set(gca,'TickDir','out'); % The only other option is 'in'
end 

for k=1:length(groups)-1
    for i=5:20
        subplot (5,4,i)
        rectangle('Position', [31 0 10 mean(max(matrise3{1,1}))+2],'Facecolor',[1 1 0 0.2],'EdgeColor', [1 1 0])
        if i==k+4
            boundedline(1:size(matrise3{1,k}(1:5,:),2), nanmean(matrise3{1,k}(1:5,:)),std((matrise3{1,k}(1:5,:)),[],1,'omitnan'),'alpha')
            title ('Mean responses for 10 min interStim interval')
        elseif i==k+8
            boundedline(1:size(matrise3{1,k}(6:10,:),2), nanmean(matrise3{1,k}(6:10,:)),std((matrise3{1,k}(6:10,:)),[],1,'omitnan'),'alpha')
            title ('Mean responses for 5 min interStim interval')
        else
            if i==k+12
                boundedline(1:size(matrise3{1,k},2), nanmean(matrise3{1,k}(11:15,:)),std((matrise3{1,k}(11:15,:)),[],1,'omitnan'),'alpha')
                title ('Mean responses for 2 min interStim interval')
            elseif i==k+16
                boundedline(1:size(matrise3{1,k},2), nanmean(matrise3{1,k}(16:20,:)),std((matrise3{1,k}(16:20,:)),[],1,'omitnan'),'alpha')
                title ('Mean responses for 1 min interStim interval')
            end
        end
        colorbar
        set(gca,'TickDir','out');
        ylim ([-3 45])%max(max(matrise3{1,1}))+max(std((matrise3{1,k}(:,:)),[],1,'omitnan'))])
        xlim([1 size(tempMat{i,2} (groups{1,1},:),2)])
        ylabel ('times increase (mm/s)')
%         ylim([-3 ceil(max(max(limitMat)))+std(max(limitMat),[],'all')])
        
    end
    
    
end 
    saveas (f39, [folder_path_save,filesep,figures_subfolder,filesep,fish_name,date_exp '_evokedBehaviour_delta_velocity_linePlot_withSD_allGroups'  '.fig']);
    saveas (f39, [folder_path_save,filesep,figures_subfolder,filesep,fish_name,date_exp '_evokedBehaviour_delta_velocity_linePlot_withSD_allGroups'  '.jpg']);
    saveas (f39, [folder_path_save,filesep,figures_subfolder,filesep,fish_name,date_exp '_evokedBehaviour_delta_velocity_linePlot_withSD_allGroups'  '.svg']);

%% Plot conditional behavior (boundedline fo racceleration data)
%
% matrise3=nan(20,60);
% matrise4=nan(20,60);
% for i=1:size(idxLightsOn,2)
%     matrise3(i,:)  = nanmean (tempMat{i,3} (group1,:));
%     matrise4(i,:) = nanmean (tempMat{i,3} (group2,:));
% end
%
%
% f40=figure();
% subplot (5,2,1)
% imagesc(matrise3)
% colormap((jet))
% colorbar
% title (['AccelerationHeatmap ' name_group1])
% ylabel('Stimulus number')
% xlabel('time (s)')
% box ('off')
% set(gca,'TickDir','out'); % The only other option is 'in'
% caxis ([-50 50])
%
% subplot (5,2,2)
% imagesc(matrise4)
% colormap((jet))
% colorbar
% title (['AccelerationHeatmap ' name_group2])
% ylabel('Stimulus number')
% xlabel('time (s)')
% box ('off')
% set(gca,'TickDir','out'); % The only other option is 'in'
% caxis ([-50 50])
%
% for i=3:10
%     subplot (5,2,i)
%     rectangle('Position', [31 0 10 max([max(matrise3) max(matrise4)])+1],'Facecolor',...
%         [1 1 0 0.3],'EdgeColor', [1 1 0])
%     for j=2:5
%         if i==3 ||i==5 ||i==7 ||i==9
%             if i==3
%                 boundedline(1:size(matrise3,2), nanmean(matrise3(1:5,:)),std((matrise3(1:5,:)),[],1,'omitnan'),'alpha')
%                 title ('Mean responses for 10 min interStim interval')
%             elseif i==5
%                 boundedline(1:size(matrise3,2), nanmean(matrise3(6:10,:)),std((matrise3(6:10,:)),[],1,'omitnan'),'alpha')
%                 title ('Mean responses for 5 min interStim interval')
%             else
%                 if i==7
%                     boundedline(1:size(matrise3,2), nanmean(matrise3(11:15,:)),std((matrise3(11:15,:)),[],1,'omitnan'),'alpha')
%                     title ('Mean responses for 2 min interStim interval')
%                 elseif i==9
%                     boundedline(1:size(matrise3,2), nanmean(matrise3(16:20,:)),std((matrise3(16:20,:)),[],1,'omitnan'),'alpha')
%                     title ('Mean responses for 1 min interStim interval')
%                 end
%             end
%
%         elseif i==4 ||i==6 ||i==8 ||i==10
%             if i==4
%                 boundedline(1:size(matrise4,2), nanmean(matrise4(1:5,:)),std((matrise4(1:5,:)),[],1,'omitnan'),'alpha')
%                 title ('Mean responses for 10 min interStim interval')
%             elseif i==6
%                 boundedline(1:size(matrise4,2), nanmean(matrise4(6:10,:)),std((matrise4(6:10,:)),[],1,'omitnan'),'alpha')
%                 title ('Mean responses for 5 min interStim interval')
%             else
%                 if i==8
%                     boundedline(1:size(matrise4,2), nanmean(matrise4(11:15,:)),std((matrise4(11:15,:)),[],1,'omitnan'),'alpha')
%                     title ('Mean responses for 2 min interStim interval')
%                 elseif i==10
%                     boundedline(1:size(matrise4,2), nanmean(matrise4(16:20,:)),std((matrise4(16:20,:)),[],1,'omitnan'),'alpha')
%                     title ('Mean responses for 1 min interStim interval')
%                 end
%             end
%         end
%     end
%
%     colorbar
%     set(gca,'TickDir','out');
%     ylim ()
%     xlim([1 60])
%     ylabel ('Acceleration (mm/s)')
%
% end
%
% saveas (f40, [folder_path_save,filesep,figures_subfolder,filesep,fish_name,date_exp '_evokedBehaviour_acceleration_linePlot_withSEM_',name_group1  '.fig']);
% saveas (f40, [folder_path_save,filesep,figures_subfolder,filesep,fish_name,date_exp '_evokedBehaviour_acceleration_linePlot_withSEM_',name_group1  '.jpg']);
% saveas (f40, [folder_path_save,filesep,figures_subfolder,filesep,fish_name,date_exp '_evokedBehaviour_acceleration_linePlot_withSEM_',name_group1  '.svg']);
%
%
%% Plot boundedline and imagesc for distance data
% 
% matrise4=cell(1,length(groups)-1);
% for k=1:length(groups)
%     for i=1:size(idxLightsOn,2)
%         matrise4{1,k}(i,:)  = nanmean (tempMat{i,4} (groups{1,k},:));
%     end
% end
% 
% f41=figure();
% f41.WindowState='Maximized';
% for k=1:length(groups)-1
% subplot (5,4,k)
% imagesc([matrise4{1,k}])
% colormap(jet)
% colorbar
% caxis([0 max(max(matrise4{1,1}))])
% title (['velocityHeatmap ' name_groups{1,k}])
% ylabel('Stimulus number')
% xlabel('time (s)')
% box ('off')
% set(gca,'TickDir','out'); % The only other option is 'in'
% end 
% 
% for k=1:length(groups)-1
%     for i=5:20
%         subplot (5,4,i)
%         rectangle('Position', [31 0 10 max(max(matrise4{1,1}))+2],'Facecolor',[1 1 0 0.2],'EdgeColor', [1 1 0])
%         if i==k+4
%             boundedline(1:size(matrise4{1,k}(1:5,:),2), nanmean(matrise4{1,k}(1:5,:)),std((matrise4{1,k}(1:5,:)),[],1,'omitnan'),'alpha')
%             title ('Mean responses for 10 min interStim interval')
%         elseif i==k+8
%             boundedline(1:size(matrise4{1,k}(6:10,:),2), nanmean(matrise4{1,k}(6:10,:)),std((matrise4{1,k}(6:10,:)),[],1,'omitnan'),'alpha')
%             title ('Mean responses for 5 min interStim interval')
%         else
%             if i==k+12
%                 boundedline(1:size(matrise4{1,k},2), nanmean(matrise4{1,k}(11:15,:)),std((matrise4{1,k}(11:15,:)),[],1,'omitnan'),'alpha')
%                 title ('Mean responses for 2 min interStim interval')
%             elseif i==k+16
%                 boundedline(1:size(matrise4{1,k},2), nanmean(matrise4{1,k}(16:20,:)),std((matrise4{1,k}(16:20,:)),[],1,'omitnan'),'alpha')
%                 title ('Mean responses for 1 min interStim interval')
%             end
%         end
%         colorbar
%         set(gca,'TickDir','out');
%         ylim ([0 max(max(matrise4{1,1}))+3])
%         xlim([1 60])
%         ylabel ('Velocity (mm/s)')
%         
%     end
% end 




%%
% 
% f41=figure();
% subplot (5,2,1)
% imagesc(matrise5)
% colormap((jet))
% colorbar
% title (['distanceHeatmap ' name_group1])
% ylabel('Stimulus number')
% xlabel('time (s)')
% box ('off')
% set(gca,'TickDir','out'); % The only other option is 'in'
% caxis ([0 0.5])
% 
% subplot (5,2,2)
% imagesc(matrise6)
% colormap((jet))
% colorbar
% title (['distanceHeatmap ' name_group2])
% ylabel('Stimulus number')
% xlabel('time (s)')
% box ('off')
% set(gca,'TickDir','out'); % The only other option is 'in'
% caxis ([0 .05])
% 
% for i=3:10
%     subplot (5,2,i)
%     rectangle('Position', [31 0 10 max([max(matrise5) max(matrise6)])+1],'Facecolor',...
%         [1 1 0 0.3],'EdgeColor', [1 1 0])
%     for j=2:5
%         if i==3 ||i==5 ||i==7 ||i==9
%             if i==3
%                 boundedline(1:size(matrise3,2), nanmean(matrise5(1:5,:)),std((matrise5(1:5,:)),[],1,'omitnan'),'alpha')
%                 title ('Meandistance responses for 10 min interStim interval')
%             elseif i==5
%                 boundedline(1:size(matrise3,2), nanmean(matrise5(6:10,:)),std((matrise5(6:10,:)),[],1,'omitnan'),'alpha')
%                 title ('Meandistance responses for 5 min interStim interval')
%             else
%                 if i==7
%                     boundedline(1:size(matrise3,2), nanmean(matrise5(11:15,:)),std((matrise5(11:15,:)),[],1,'omitnan'),'alpha')
%                     title ('Meandistance responses for 2 min interStim interval')
%                 elseif i==9
%                     boundedline(1:size(matrise3,2), nanmean(matrise5(16:20,:)),std((matrise5(16:20,:)),[],1,'omitnan'),'alpha')
%                     title ('Meandistance responses for 1 min interStim interval')
%                 end
%             end
% 
%         elseif i==4 ||i==6 ||i==8 ||i==10
%             if i==4
%                 boundedline(1:size(matrise4,2), nanmean(matrise6(1:5,:)),std((matrise6(1:5,:)),[],1,'omitnan'),'alpha')
%                 title ('Meandistance responses for 10 min interStim interval')
%             elseif i==6
%                 boundedline(1:size(matrise4,2), nanmean(matrise6(6:10,:)),std((matrise6(6:10,:)),[],1,'omitnan'),'alpha')
%                 title ('Meandistance responses for 5 min interStim interval')
%             else
%                 if i==8
%                     boundedline(1:size(matrise4,2), nanmean(matrise6(11:15,:)),std((matrise6(11:15,:)),[],1,'omitnan'),'alpha')
%                     title ('Meandistance responses for 2 min interStim interval')
%                 elseif i==10
%                     boundedline(1:size(matrise4,2), nanmean(matrise6(16:20,:)),std((matrise6(16:20,:)),[],1,'omitnan'),'alpha')
%                     title ('Meandistance responses for 1 min interStim interval')
%                 end
%             end
%         end
%     end
% 
%     colorbar
%     set(gca,'TickDir','out');
%     ylim ()
%     xlim([1 60])
%     ylabel ('distance (mm)')
% 
% end
% 
% saveas (f41, [folder_path_save,filesep,figures_subfolder,filesep,fish_name,date_exp '_evokedBehaviour_distance_linePlot_withSEM_',name_group1  '.fig']);
% saveas (f41, [folder_path_save,filesep,figures_subfolder,filesep,fish_name,date_exp '_evokedBehaviour_distance_linePlot_withSEM_',name_group1  '.jpg']);
% saveas (f41, [folder_path_save,filesep,figures_subfolder,filesep,fish_name,date_exp '_evokedBehaviour_distance_linePlot_withSEM_',name_group1  '.svg']);
% 
% %
% %
% %
% %%%%%%% here I take sum of sum ?? is that ok?
% 
% 
% 
% 
% 
% 