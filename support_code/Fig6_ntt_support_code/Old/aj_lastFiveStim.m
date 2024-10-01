




%% characterize the last five stimuli 
if strcmp(fish_name, 'PTZ_short')
tempMatLast5Stim = cell(1,4);


for i=21
    tempMatLast5Stim{1,1}= ['Last five stimuli'];
    
    for ROI=1:nROIs
        t           = 1:floor(max(all_fish{ROI, 1}.t));
        timeLight   = all_fish{ROI, 1}.timestampLight;
        v           = all_fish{ROI, 1}.bV_E4sd;
        dvv         = all_fish{ROI, 1}.DVV_trad;
        BurstDur    = all_fish{ROI, 1}.DVV_sumbre;
        
        t2          = all_fish{ROI, 1}.t2;
        V243        = all_fish{ROI, 1}.binnedVel_2_43Hz;
        %% For velocity
        temp11   = (v(...
            t >= floor(timeLight(idxLightsOn(ROI,i))-5) &...  %% 30 seconds before
            t <= floor(timeLight(idxLightsOn(ROI,i))-1) ));
        
        temp12   = (v(...
            t >= floor(timeLight(idxLightsOn(ROI,i))) &...
            t <= floor(timeLight(idxLightsOff(ROI,i))+284) )); %% til ten seconds after
        
        T11 = reshape(temp11,[1,5]);
        T12 = interp1(1:length(temp12),temp12,(1:1:295));
        
        temp_total1=[T11,T12];
        tempMatLast5Stim{1,2}(ROI,1:size(temp_total1,2)) = temp_total1;
        
        %% for DVV_trad
        temp3   = (dvv(...
            t >= floor(timeLight(idxLightsOn(ROI,i))-5) &...  %% ten seconds before
            t <= floor(timeLight(idxLightsOn(ROI,i))-1) ));
        
        temp4   = (dvv(...
            t >= floor(timeLight(idxLightsOn(ROI,i))) &...
            t <= floor(timeLight(idxLightsOff(ROI,i))+284) )); %% til ten seconds after
        
        T13 = reshape(temp3,[1,5]);
        T14 = interp1(1:length(temp4),temp4,(1:1:295));
        
        temp_total3=[T13,T14];
        tempMatLast5Stim{1,3}(ROI,1:size(temp_total3,2)) = temp_total3;
        
       %% for Burst duration
       temp5   = (BurstDur(...
            t >= floor(timeLight(idxLightsOn(ROI,i))-5) &...  %% ten seconds before
            t <= floor(timeLight(idxLightsOn(ROI,i))-1) ));
        
        temp6   = (BurstDur(...
            t >= floor(timeLight(idxLightsOn(ROI,i))) &...
            t <= floor(timeLight(idxLightsOff(ROI,i))+19) )); %% til ten seconds after
        
        T15 = reshape(temp5,[1,5]);
        T16 = interp1(1:length(temp6),temp6,(1:1:295));
        
        temp_total8=[T15,T16];
        tempMatLast5Stim{1,4}(ROI,1:size(temp_total8,2)) = temp_total8;
        %% for 2.43 Hz binned vel
        
        temp7   = (V243(...
            t2 >= floor(timeLight(idxLightsOn(ROI,i))-5) &...  %% five seconds before
            t2 < floor(timeLight(idxLightsOn(ROI,i))) ));
        
        temp8   = (V243(...
            t2 >= floor(timeLight(idxLightsOn(ROI,i))) &...
            t2 < floor(timeLight(idxLightsOff(ROI,i))+284) )); 
        
        T17 = interp1(1:length(temp7),temp7,1:1:12);
        T18 = interp1(1:length(temp8),temp8,(1:1:716));
        
        temp_total9=[T17,T18];
        tempMatLast5Stim{1,5}(ROI,1:size(temp_total9,2)) = temp_total9;
        
        
        %% empty variables
        temp1  = [];
        temp2  = [];
        temp11 = [];
        temp12 = [];
        temp_total3 = [];
        
        
    end
end

% V plot

f17=figure;
f17.WindowState = 'Maximized';

sgtitle('Last 5 stimuli')
subplot (2,1,1)
imagesc(tempMatLast5Stim{1,5}([groups{1,1:4}],:))
colorbar, colormap (jet), caxis([0 40]), box off

subplot (2,1,2)
boundedline (1:length(tempMatLast5Stim{1, 5}), mean(tempMatLast5Stim{1, 5}(group1,:),1,'omitnan'), std(tempMatLast5Stim{1, 5}(group1,:),1,'omitnan')./sqrt(length(group1)),...
    1:length(tempMatLast5Stim{1, 5}), mean(tempMatLast5Stim{1, 5}(group2,:),'omitnan'), std(tempMatLast5Stim{1, 5}(group2,:),1,'omitnan')./sqrt(length(group2)),...
    1:length(tempMatLast5Stim{1, 5}), mean(tempMatLast5Stim{1, 5}(group3,:),'omitnan'), std(tempMatLast5Stim{1, 5}(group3,:),1,'omitnan')./sqrt(length(group3)),...
    1:length(tempMatLast5Stim{1, 5}), mean(tempMatLast5Stim{1, 5}(group4,:),'omitnan'), std(tempMatLast5Stim{1, 5}(group4,:),1,'omitnan')./sqrt(length(group4)),...
    'cmap', C1,'transparency',.2), hold on 

for i=21:25
rectangle('Position',[12+(15/timebin)*(i-21) 12 10/timebin 1],...
    'FaceColor', [0.2 0.2 0.2 .2], 'EdgeColor', [0.2 0.2 0.2 .2])
end

xlim([0 728])
ylim([0 15])
box off
colorbar

hold off

for f=1:length(formats)
    saveas (f17, [folder_path_save,filesep,figures_subfolder,filesep,...
    fish_name,date_exp '_last_five_stim_243HzV'  formats{1,f}]);   
end 
% % DVV_ plot 
% f18=figure;
% f18.WindowState = 'Maximized';
% 
% sgtitle('Last 5 stimuli')
% subplot (2,1,1)
% imagesc(tempMatLast5StimO{1, 3})
% colorbar, colormap (jet), box off
% 
% subplot (2,1,2)
% boundedline (1:length(tempMatLast5StimO{1, 3}), mean(tempMatLast5StimO{1, 3}(group1,:),1,'omitnan'), std(tempMatLast5StimO{1, 3}(group1,:),1,'omitnan')./sqrt(length(group1)),...
%     1:length(tempMatLast5StimO{1, 3}), mean(tempMatLast5StimO{1, 3}(group2,:),'omitnan'), std(tempMatLast5StimO{1, 3}(group2,:),1,'omitnan')./sqrt(length(group2)),...
%     1:length(tempMatLast5StimO{1, 3}), mean(tempMatLast5StimO{1, 3}(group3,:),'omitnan'), std(tempMatLast5StimO{1, 3}(group3,:),1,'omitnan')./sqrt(length(group3)),...
%     1:length(tempMatLast5StimO{1, 3}), mean(tempMatLast5StimO{1, 3}(group4,:),'omitnan'), std(tempMatLast5StimO{1, 3}(group4,:),1,'omitnan')./sqrt(length(group4)),...
%     'cmap', C1,'transparency',.2), hold on 
% 
% rectangle('Position',[6 250 10 1],'FaceColor', [0.2 0.2 0.2 .2], 'EdgeColor', [0.2 0.2 0.2 .2]),
% rectangle('Position',[21 250 10 1],'FaceColor', [0.2 0.2 0.2 .2], 'EdgeColor', [0.2 0.2 0.2 .2]),
% rectangle('Position',[36 250 10 1],'FaceColor', [0.2 0.2 0.2 .2], 'EdgeColor', [0.2 0.2 0.2 .2]),
% rectangle('Position',[51 250 10 1],'FaceColor', [0.2 0.2 0.2 .2], 'EdgeColor', [0.2 0.2 0.2 .2]),
% rectangle('Position',[66 250 10 1],'FaceColor', [0.2 0.2 0.2 .2], 'EdgeColor', [0.2 0.2 0.2 .2]),
% box off
% colorbar
% ylim([-100 400])
% 
% hold off
% else 
%     disp('No short- intervalled stimuli!')
    
end 