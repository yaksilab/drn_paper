f32=figure();
f32.WindowState = ('maximized');
sgtitle('Mean Velocity for five seconds bin - Scn1')
tempVelY    = cell(10,1);
boundsVelY  = cell(10,1);
for i=1:10
    for j=1:length(groups)-1
        tempVelY{i,1}(j,:) = vertcat (mean(velBinnedFive_temp{i, 1}(groups{1,j},:),1));
        boundsVelY{i,1}(j,:) = vertcat (std(velBinnedFive_temp{i, 1}(groups{1,j},:),'omitnan')./...
            (ones (1,6)*sqrt(size(groups{1,j},2))));
    end
end
for i=1:10
    if i<=5
        subplot(9,5,[i,i+5])
        imagesc(tempVelY{i,1})
        rectangle('Position', [2.5 0 2 0.75],'Facecolor', [0 1 1 0.8], 'EdgeColor', [0 1 1 0.8])
    else
        subplot (9,5,[i+5,i+10])
        imagesc (tempVelY{i,1})
    end
    
    caxis([0 nanmean(mean(tempVelY{1,:},1)+1)/2])
    title(['Stim ' num2str(i)])
    set(gca,'xcolor','none')
    box ('off')
    if i==1|| i==6
%         ylabel('Velocity (mm/s)')
        yticks(1:4)
        yticklabels (name_groups)
    
        colorbar
        yticks([])
        set(gca,'ycolor','none')
    else
        colorbar
        yticks([])
        set(gca,'ycolor','none')
    end
    colormap(flipud(bone))
end

%% make matrix of the last two light assays
velMatStim      = nan (48,size(floor(timeLight(idxLightsOn(1,11)))-5 : floor(timeLight(idxLightsOff(1,21)))+5,2));
accelMatStim    = nan (48,size(floor(timeLight(idxLightsOn(1,11)))-5 : floor(timeLight(idxLightsOff(1,21)))+5,2));
distMatStim     = nan (48,size(floor(timeLight(idxLightsOn(1,11)))-5 : floor(timeLight(idxLightsOff(1,21)))+5,2));
lightMat        = nan (48,size(floor((idxLightsOn(ROI,11)))-5 : floor((idxLightsOff(ROI,21)+5)),2));

for ROI=1:nROIs
    t               = all_fish{ROI, 1}.t;
    timeLight       = all_fish{ROI, 1}.timestampLight;
    lightsInfo      = all_fish{ROI, 1}.lightsInfo;
    speed_binned    = all_fish{ROI, 1}.binnedVel;
    S               = all_fish{1, 1}.calcBinnedDistance;
    Accel           = all_fish{ROI, 1}.binnedAcc;
    
    velMatStim(ROI,:) = speed_binned(floor(timeLight(idxLightsOn(ROI,11)))-5 :...
        floor(timeLight(idxLightsOff(ROI,21)))+5);
    accelMatStim(ROI,:) = speed_binned(floor(timeLight(idxLightsOn(ROI,11)))-5 :...
        floor(timeLight(idxLightsOff(ROI,21)))+5);
    distMatStim(ROI,:) = speed_binned(floor(timeLight(idxLightsOn(ROI,11)))-5 :...
        floor(timeLight(idxLightsOff(ROI,21)))+5);
    
    lightMat(ROI,:) = lightsInfo(idxLightsOn(ROI,11)-5 :...
        idxLightsOff(ROI,21)+5);
    
end

%% plot these into the heatmap
matrix56=vertcat(nanmean(velMatStim(group1,2:end),1),nanmean(velMatStim(group2,2:end),1),...
    nanmean(velMatStim(group3,2:end),1), nanmean(velMatStim(group4,2:end),1));

subplot (9,5,26:45)
imagesc(matrix56)
colormap (flipud(bone))
colorbar, box off, set(gca,'xcolor','none')
set(gca,'TickDir','out'), caxis ([0 nanmean(mean(tempVelY{1,:},1)+1)/2])
% ylabel('Velocity (mm/s)')
        yticks(1:4)
        yticklabels (name_groups)
        title('Mean velocity for 1 second bin')
        

subplot (9,5,21:25), 
imagesc (lightMat), colorbar
box off, set(gca,'xcolor','none'), set(gca,'ycolor','none'), title('Stimulus')
caxis([0 nanmean(mean(matrix56,1)+1)])
%% individual fish response to the light 

f33=figure;
f33.WindowState=('maximized');

subplot (9,5,1:5)
imagesc (lightMat), colorbar
box off, set(gca,'xcolor','none'), set(gca,'TickDir','out')

subplot (9,5,6:10)
imagesc ((velMatStim(group1,2:end))),colorbar
box off, set(gca,'xcolor','none'), set(gca,'TickDir','out'), caxis ([0 nanmean(max(velMatStim(group1)))])
subplot (9,5,11:15)
boundedline (1:length(velMatStim(group1,2:end)),nanmean(velMatStim(group1,2:end),1),...
    std(velMatStim(group1,2:end),[],1,'omitnan')./sqrt(length(group1)),'transparency', 0.5), colorbar, box off, 
    set(gca,'xcolor','none'), set(gca,'TickDir','out'), 
    xlim ([1 length(velMatStim(group1,2:end))])
    ylim ([0 nanmean(mean(matrise{1,:},1)+5)/3]), yticks (0:2:8)

subplot (9,5,16:20)
imagesc (velMatStim(group2,2:end)), colorbar
box off, set(gca,'xcolor','none'), set(gca,'TickDir','out'), caxis ([0 nanmean(max(velMatStim(group1)))])
subplot (9,5,21:25)
boundedline (1:length(velMatStim(group2,2:end)),nanmean(velMatStim(group2,2:end),1),...
    std(velMatStim(group2,2:end),[],1,'omitnan')./sqrt(length(group2)),'transparency', 0.5), colorbar, box off, 
    set(gca,'xcolor','none'), set(gca,'TickDir','out'), 
    xlim ([1 length(velMatStim(group2,2:end))])
    ylim ([0 8.5]), yticks (0:2:8)
    
subplot (9,5,26:30)
imagesc (velMatStim(group3,2:end)), colorbar
box off, set(gca,'xcolor','none'), set(gca,'TickDir','out'), caxis ([0 nanmean(max(velMatStim(group1)))])
subplot (9,5,31:35)
boundedline (1:length(velMatStim(group3,2:end)),nanmean(velMatStim(group3,2:end),1),...
    std(velMatStim(group3,2:end),[],1,'omitnan')./sqrt(length(group3)),'transparency', 0.5), colorbar, box off, 
    set(gca,'xcolor','none'), set(gca,'TickDir','out'), 
    xlim ([1 length(velMatStim(group3,2:end))])
    ylim ([0 8.5]), yticks (0:2:8)
    

subplot (9,5,36:40)
imagesc (velMatStim(group4,2:end)), colorbar
box off, set(gca,'xcolor','none'), set(gca,'TickDir','out'), caxis ([0 nanmean(max(velMatStim(group1)))])
subplot (9,5,41:45)
boundedline (1:length(velMatStim(group4,2:end)),nanmean(velMatStim(group4,2:end),1),...
    std(velMatStim(group4,2:end),[],1,'omitnan')./sqrt(length(group4)),'transparency', 0.5)
    colorbar, box off, set(gca,'xcolor','none'), set(gca,'TickDir','out'), 
    xlim ([1 length(velMatStim(group4,2:end))])
    ylim ([0 8.5]), yticks (0:2:8)
    
colormap (flipud(bone))
%% calculate longer periods of Velocity, acceleration and distance- conditional behaviuor
% temporary matrixes for the velocity data- remember to change the 10 in ( for i=1:size(idxLightsOn,2)-10) 
matrise= cell(4,1);
for k=1:length(groups)-1
    for i=1:size(idxLightsOn,2)-10
        matrise{k,1}(i,:)  = nanmean (tempMat{i,2} (groups{1,k},:));
    end
end

%% plot the velocity data - remember to change coloraxis 

f39=figure();
f39.WindowState = 'maximized';
% plot the heatmaps
for k=1:length(groups)-1
    subplot (size(matrise{1,1},1)/5+1,length(groups)-1,k)
    imagesc(matrise{k,1})
    title (['Velocity Heatmap ' name_groups{1,k}])
    if k==1
        ylabel('Stimulus number')
    end
    colormap(flipud(bone))
    colorbar
    caxis([0 nanmean(mean(matrise{1,:},1)+5)/3])
    xlabel('time (s)')
    box ('off')
    set(gca,'TickDir','out'); % The only other option is 'in'
end

% plot lineplot with SEM
for i=5:(size(matrise{1,1},1)/5+1)*(length(groups)-1) % does not plot the last group (trackingError)
    subplot(size(matrise{1,1},1)/5+1,length(groups)-1,i)
    
    if i>=5 && i<=8
        rectangle('Position', [31 0 10 max([max(matrise{i-4,:}) max(matrise{i-4,:})])+1],'Facecolor',...
        [1 1 0 0.3],'EdgeColor', [1 1 0])
    
        boundedline(1:size(matrise{i-4,:},2), nanmean(matrise{i-4,:}(1:5,:)),std(matrise{i-4,:}(1:5,:),[],1,'omitnan')./sqrt(length(groups{1,i-4})),'alpha')
        title (['10 min interStim interval ' name_groups{1,i-4}])
        
    elseif i>8 && i <= (size(matrise{1,1},1)/5+1)*(length(groups)-1)
        rectangle('Position', [31 0 10 max([max(matrise{i-8,:}) max(matrise{i-8,:})])+1],'Facecolor',...
        [1 1 0 0.3],'EdgeColor', [1 1 0])
    
        boundedline(1:size(matrise{i-8,:},2), nanmean(matrise{i-8,:}(6:10,:)),std(matrise{i-8,:}(6:10,:),[],1,'omitnan')./sqrt(length(groups{1,i-8})),'alpha')
        title (['2 min interStim interval ' name_groups{1,i-8}])
    end 

   
    ylim ([0 max(mean(matrise{1,:},1))+1])        
    xlim([1 60])
    ylabel ('Velocity (mm/s)')
    colorbar
    set(gca,'TickDir','out');
end

%% plot the normalized velocity data
f40=figure();
f40.WindowState = 'maximized';
for k=1:length(groups)-1
    subplot (size(matrise{1,1},1)/5+1,length(groups)-1,k)
    imagesc(matrise{k,1})
    title (['Velocity Heatmap ' name_groups{1,k}])
    if k==1
        ylabel('Stimulus number')
    end
    colormap(flipud(bone))
    colorbar
    caxis([0 nanmean(mean(matrise{1,:},1)+5)/3])
    xlabel('time (s)')
    box ('off')
    set(gca,'TickDir','out'); % The only other option is 'in'
end

% plots the velocity response normalized to the baseline
for i=5:(size(matrise{1,1},1)/5+1)*(length(groups)-1) % does not plot the last group (trackingError)
    subplot(size(matrise{1,1},1)/5+1,length(groups)-1,i)
    
    if i>=5 && i<=8
        rectangle('Position', [31 0 10 max([max(matrise{i-4,:}) max(matrise{i-4,:})])+1],'Facecolor',...
        [1 1 0 0.3],'EdgeColor', [1 1 0])
    
        boundedline(1:size(matrise{i-4,:},2), nanmean(matrise{i-4,:}(1:5,:))./nanmean(nanmean(matrise{i-4,:}(1:5,1:30))),...
            std(matrise{i-4,:}(1:5,:)./nanmean(nanmean(matrise{i-4,:}(1:5,1:30))),[],1,'omitnan')./sqrt(length(groups{1,i-4})),'alpha')
        title (['10 min interStim interval ' name_groups{1,i-4}])
        
    elseif i>8 && i <= (size(matrise{1,1},1)/5+1)*(length(groups)-1)
        rectangle('Position', [31 0 10 max([max(matrise{i-8,:}) max(matrise{i-8,:})])+1],'Facecolor',...
        [1 1 0 0.3],'EdgeColor', [1 1 0])
    
        boundedline(1:size(matrise{i-8,:},2), nanmean(matrise{i-8,:}(6:10,:))./nanmean(nanmean(matrise{i-8,:}(1:5,1:30))),...
            std(matrise{i-8,:}(6:10,:)./nanmean(nanmean(matrise{i-8,:}(1:5,1:30))),[],1,'omitnan')./sqrt(length(groups{1,i-8})),'alpha')
        title (['2 min interStim interval ' name_groups{1,i-8}])
    end 

   
    ylim ([0 max(mean(matrise{1,:},1)+1)/nanmean(nanmean(matrise{1,:}(1:5,1:30)))])        
    xlim([1 60])
    ylabel ('Velocity Ratio')
    colorbar
    set(gca,'TickDir','out');
end


%% plot the trajectory 

%% make temporary coordinate matrixes for the plotting of the mean trajectory
% tempMat_x = cell(10,2);
% tempMat_y = cell(10,2);
% for i=1:size(idxLightsOn,2)-10
%     tempMat_x{i,1}= ['Stimulation number' num2str(i)];
%     tempMat_y{i,1}= ['Stimulation number' num2str(i)];
%     
%     for ROI=1:nROIs
%         t           = all_fish{ROI, 1}.t;
%         timeLight   = all_fish{ROI, 1}.timestampLight;
%         xData       = all_fish{ROI, 1}.x;
%         yData       = all_fish{ROI, 1}.y;
%         
%         %% For velocity
%         temp11   = (xData(...
%             t >= floor(timeLight(idxLightsOn(ROI,i))) &...  %% ten seconds before
%             t <= floor(timeLight(idxLightsOn(ROI,i))-1) )-min(all_fish{ROI, 1}.x)); %% til ten seconds after
%         
%         temp12   = (xData(...
%             t >= floor(timeLight(idxLightsOn(ROI,i))) &...  %% ten seconds before
%             t <= floor(timeLight(idxLightsOff(ROI,i+1))) )-min(all_fish{ROI, 1}.x)); %% til ten seconds after
%         
%         T11 = interp1(1:length(temp11),temp11,(1:1:870));
%         T12 = interp1(1:length(temp12),temp12,(1:1:870));
%         
%         temp_total1=[T11,T12];
%         tempMat_x{i,2}(ROI,1:size(temp_total1,2)) = temp_total1;
%         
%      
%         %% for distance
%         temp3   = (yData(...
%             t >= floor(timeLight(idxLightsOn(ROI,i))-30) &...  %% ten seconds before
%             t <= floor(timeLight(idxLightsOn(ROI,i))-1) )-min(all_fish{ROI, 1}.y)); %% til ten seconds after
%         
%         temp4   = (yData(...
%             t >= floor(timeLight(idxLightsOn(ROI,i))) &...  %% ten seconds before
%             t <= floor(timeLight(idxLightsOff(ROI,i+1))+19) )-min(all_fish{ROI, 1}.y)); %% til ten seconds after
%         
%         T13 = interp1(1:length(temp3),temp3,(1:1:870));
%         T14 = interp1(1:length(temp4),temp4,(1:1:870));
%         
%         temp_total3=[T13,T14];
%         tempMat_y{i,2}(ROI,1:size(temp_total3,2)) = temp_total3;
%         %% empty variables
%         temp1  = [];
%         temp2  = [];
%         temp11 = [];
%         temp12 = [];
%         temp_total3 = [];
%     end
% end

%% make a mean trajectory matrix for each light pulse - remember to change i=1:size(idxLightsOn,2)-10, remove -10
% xDataMat = cell(4,1);
% yDataMat = cell(4,1);
% for k=1:length(groups)-1
%     for i=1:size(idxLightsOn,2)-10
%         xDataMat{k,1}(i,:)  = nanmean (tempMat_x{i,2} (groups{1,k},:),1);
%         yDataMat{k,1}(i,:)  = nanmean (tempMat_y{i,2} (groups{1,k},:),1);
%     end
% end
% 
% %% plot the mean trajectory during these light transition times 
% 
% f41=figure();
% f41.WindowState = 'maximized';
% 
% % this one plots the mean velocity for each stimulus
% for k=1:length(groups)-1
%     subplot (size(matrise{1,1},1)/5+1,length(groups)-1,k)
%     imagesc(matrise{k,1})
%     title (['Velocity Heatmap ' name_groups{1,k}])
%     if k==1
%         ylabel('Stimulus number')
%     end
%     colorbar
%     colormap(flipud(bone))
%     caxis([0 10])
%     xlabel('time (s)')
%     box ('off')
%     set(gca,'TickDir','out'); % The only other option is 'in'
% end
% f41=figure();
% f41.WindowState = 'maximized';
% animationFile = 'tryOut.gif';
% % this plots the trajectory
% for i=5:(size(matrise{1,1},1)/5+1)*(length(groups)-1) % does not plot the last group (trackingError)
%     h=subplot (size(matrise{1,1},1)/5+1,length(groups)-1,i);
%     if i>=5 && i<=8        
%         for k=1:nROIs
%             if ismember (k,groups{1,i-4})
%                 x = tempMat_x{i-4,2}(k,:);
%                 y = tempMat_y{i-4,2}(k,:);
%                 z = 1:1470;
%                 for n = 1:length(x)
%                     plotcube([50 50 300],[0  0  870],.05,[1 1 0]), hold on
%                     plot3(x(1:30:n), y(1:30:n),z(1:30:n),'Color','k','LineWidth',1.5)
%                     set(gca,'visible','on')
%                     drawnow
%                     frame = getframe(h);
%                     im = frame2im(frame);
%                     [imind,cm] = rgb2ind(im,256);
%                     if n == 1
%                         imwrite(imind,cm,animationFile,'gif', 'Loopcount',inf,'DelayTime', 60/(6*1740));
%                     else
%                         imwrite(imind,cm,animationFile,'gif','WriteMode','append','DelayTime',60/(6*1740));
%                     end
%                 end
%             end
%             hold on
%         end
%         hold off
%         title (['10 min interStim interval ' name_groups{1,i-4}])
%         
%     elseif i>8 && i <= (size(matrise{1,1},1)/5+1)*(length(groups)-1)
%         for k=1:nROIs
%             if ismember (k,groups{1,i-8})
%                 x = tempMat_x{i-8,2}(k,:);
%                 y = tempMat_y{i-8,2}(k,:);
%                 z = 1:1470;
%                 for n = 1:length(x)
%                     plotcube([50 50 300],[0  0  870],.05,[1 1 0]), hold on
%                     plot3(x(1:30:n), y(1:30:n),z(1:30:n),'Color','k','LineWidth',1.5)
%                     set(gca,'visible','on')
%                     drawnow
%                     frame = getframe(h);
%                     im = frame2im(frame);
%                     [imind,cm] = rgb2ind(im,256);
%                     if n == 1
%                         imwrite(imind,cm,animationFile,'gif', 'Loopcount',inf,'DelayTime', 60/(6*1740));
%                     else
%                         imwrite(imind,cm,animationFile,'gif','WriteMode','append','DelayTime',60/(6*1740));
%                     end
%                 end
%             end
%             hold on
%         end
%         hold off 
%         title (['2 min interStim interval ' name_groups{1,i-8}])
%     end 
%     set(gca,'TickDir','out');
% end
% 
% 
% 
%     