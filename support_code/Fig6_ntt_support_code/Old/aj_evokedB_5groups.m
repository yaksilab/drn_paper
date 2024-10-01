function aj_evokedB_5groups (tempMat,groups,name_groups,folder_path_save,figures_subfolder,fish_name,date_exp,idxLightsOn)
 %% raw response velocity
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
subplot (5,5,k)
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
    for i=6:25
        subplot (5,5,i)
        rectangle('Position', [31 0 10 max(max(matrise{1,1}))+2],'Facecolor',[1 1 0 0.2],'EdgeColor', [1 1 0])
        if i==k+5
            boundedline(1:size(matrise{1,k}(1:5,:),2), nanmean(matrise{1,k}(1:5,:)),std((matrise{1,k}(1:5,:)),[],1,'omitnan'),'alpha')
            title ('Mean responses for 10 min interStim interval')
        elseif i==k+10
            boundedline(1:size(matrise{1,k}(6:10,:),2), nanmean(matrise{1,k}(6:10,:)),std((matrise{1,k}(6:10,:)),[],1,'omitnan'),'alpha')
            title ('Mean responses for 5 min interStim interval')
        else
            if i==k+15
                boundedline(1:size(matrise{1,k},2), nanmean(matrise{1,k}(11:15,:)),std((matrise{1,k}(11:15,:)),[],1,'omitnan'),'alpha')
                title ('Mean responses for 2 min interStim interval')
            elseif i==k+20
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
  
    %% normalzed velocity
    % 30 sec before stimulus as baseline
    
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
subplot (5,5,k)
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
    for i=6:25
        subplot (5,5,i)
        rectangle('Position', [31 0 10 ceil(max(max(matrise2{1,1}))+2)],'Facecolor',[1 1 0 0.2],'EdgeColor', [1 1 0])
        if i==k+5
            boundedline(1:size(matrise2{1,k}(1:5,:),2), nanmean(matrise2{1,k}(1:5,:)),std((matrise2{1,k}(1:5,:)),[],1,'omitnan'),'alpha')
            title ('Mean responses for 10 min interStim interval')
        elseif i==k+10
            boundedline(1:size(matrise2{1,k}(6:10,:),2), nanmean(matrise2{1,k}(6:10,:)),std((matrise2{1,k}(6:10,:)),[],1,'omitnan'),'alpha')
            title ('Mean responses for 5 min interStim interval')
        else
            if i==k+15
                boundedline(1:size(matrise2{1,k},2), nanmean(matrise2{1,k}(11:15,:)),std((matrise2{1,k}(11:15,:)),[],1,'omitnan'),'alpha')
                title ('Mean responses for 2 min interStim interval')
            elseif i==k+20
                boundedline(1:size(matrise2{1,k},2), nanmean(matrise2{1,k}(16:20,:)),std((matrise2{1,k}(16:20,:)),[],1,'omitnan'),'alpha')
                title ('Mean responses for 1 min interStim interval')
            end
        end
        colorbar
        set(gca,'TickDir','out');
        ylim([-3 ceil(max(max(limitMat2)))+std(max(limitMat2),[],'all')])
%         xlim([1 size(tempMat{i,2} (groups{1,1},:),2)])
        
        
    end
end 

    saveas (f39, [folder_path_save,filesep,figures_subfolder,filesep,fish_name,date_exp '_evokedBehaviour_normalized_velocity_linePlot_withSD_allGroups'  '.fig']);
    saveas (f39, [folder_path_save,filesep,figures_subfolder,filesep,fish_name,date_exp '_evokedBehaviour_normalized_velocity_linePlot_withSD_allGroups'  '.jpg']);
    saveas (f39, [folder_path_save,filesep,figures_subfolder,filesep,fish_name,date_exp '_evokedBehaviour_normalized_velocity_linePlot_withSD_allGroups'  '.svg']);

    
    %% percent increase
    % dvv; delta v/ v0 (v0 is the mean (V(1:30)))
    
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
subplot (5,5,k)
imagesc([matrise3{1,k}])
colormap(flipud (hot))
colorbar
caxis([0 ceil(max(max(limitMat)))])
title (['deltaVelHeatmap ' name_groups{1,k}])
ylabel('Stimulus number')
xlabel('time (s)')
box ('off')
set(gca,'TickDir','out'); % The only other option is 'in'
end 

for k=1:length(groups)-1
    for i=6:25
        subplot (5,5,i)
        rectangle('Position', [31 0 10 ceil(mean(max(matrise3{1,1}))+2)],'Facecolor',[1 1 0 0.2],'EdgeColor', [1 1 0])
        if i==k+5
            boundedline(1:size(matrise3{1,k}(1:5,:),2), nanmean(matrise3{1,k}(1:5,:)),std((matrise3{1,k}(1:5,:)),[],1,'omitnan'),'alpha')
            title ('Mean responses for 10 min interStim interval')
        elseif i==k+10
            boundedline(1:size(matrise3{1,k}(6:10,:),2), nanmean(matrise3{1,k}(6:10,:)),std((matrise3{1,k}(6:10,:)),[],1,'omitnan'),'alpha')
            title ('Mean responses for 5 min interStim interval')
        else
            if i==k+15
                boundedline(1:size(matrise3{1,k},2), nanmean(matrise3{1,k}(11:15,:)),std((matrise3{1,k}(11:15,:)),[],1,'omitnan'),'alpha')
                title ('Mean responses for 2 min interStim interval')
            elseif i==k+20
                boundedline(1:size(matrise3{1,k},2), nanmean(matrise3{1,k}(16:20,:)),std((matrise3{1,k}(16:20,:)),[],1,'omitnan'),'alpha')
                title ('Mean responses for 1 min interStim interval')
            end
        end
        colorbar
        set(gca,'TickDir','out');
        ylim ([-3 40])%max(max(matrise3{1,1}))+max(std((matrise3{1,k}(:,:)),[],1,'omitnan'))])
%         xlim([1 size(tempMat{i,2} (groups{1,1},:),2)])
        ylabel ('times change (mm/s)')
%         ylim([-3 ceil(max(max(limitMat)))+std(max(limitMat),[],'all')])
        
    end
   
end 
    saveas (f39, [folder_path_save,filesep,figures_subfolder,filesep,fish_name,date_exp '_evokedBehaviour_delta_velocity_linePlot_withSD_allGroups'  '.fig']);
    saveas (f39, [folder_path_save,filesep,figures_subfolder,filesep,fish_name,date_exp '_evokedBehaviour_delta_velocity_linePlot_withSD_allGroups'  '.jpg']);
    saveas (f39, [folder_path_save,filesep,figures_subfolder,filesep,fish_name,date_exp '_evokedBehaviour_delta_velocity_linePlot_withSD_allGroups'  '.svg']);
%% distance data
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
% subplot (5,5,k)
% imagesc([matrise4{1,k}])
% colormap(jet)
% colorbar
% caxis([0 ceil(max(max(matrise4{1,1})))])
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
%         rectangle('Position', [31 0 10 max(max(matrise4{1,1}))+2],'Facecolor',[1 1 0 0.2],'EdgeColor', [1 1 0])
%         if i==k+5
%             boundedline(1:size(matrise4{1,k}(1:5,:),2), nanmean(matrise4{1,k}(1:5,:)),std((matrise4{1,k}(1:5,:)),[],1,'omitnan'),'alpha')
%             title ('Mean responses for 10 min interStim interval')
%         elseif i==k+10
%             boundedline(1:size(matrise4{1,k}(6:10,:),2), nanmean(matrise4{1,k}(6:10,:)),std((matrise4{1,k}(6:10,:)),[],1,'omitnan'),'alpha')
%             title ('Mean responses for 5 min interStim interval')
%         else
%             if i==k+15
%                 boundedline(1:size(matrise4{1,k},2), nanmean(matrise4{1,k}(11:15,:)),std((matrise4{1,k}(11:15,:)),[],1,'omitnan'),'alpha')
%                 title ('Mean responses for 2 min interStim interval')
%             elseif i==k+20
%                 boundedline(1:size(matrise4{1,k},2), nanmean(matrise4{1,k}(16:20,:)),std((matrise4{1,k}(16:20,:)),[],1,'omitnan'),'alpha')
%                 title ('Mean responses for 1 min interStim interval')
%             end
%         end
%         colorbar
%         set(gca,'TickDir','out');
%         ylim ([0 ceil(max(max(matrise4{1,1}))+3)])
%         xlim([1 60])
%         ylabel ('Velocity (mm/s)')
%         
%     end
% end 


