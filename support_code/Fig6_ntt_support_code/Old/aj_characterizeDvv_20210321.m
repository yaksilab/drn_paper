function [all_fish] = aj_characterizeDvv_20210321 (all_fish,timebin,folder_path_save,fish_name,date_exp,group1,group2,group3, group4, group5, name_group1,name_group2, name_group3, name_group4, name_group5,figures_subfolder, group_category,nROIs,groups,name_groups,threshold,transitionTime,idxLightsOn,idxLightsOff)

dvvMatSponTrad = nan (nROIs,3600);
dvvMatSponSumbre= nan (nROIs,3600);

for ROI=1:nROIs
    dvvMatSponTrad(ROI,:)      = all_fish{ROI,1}.SponBehaviour.DVV_trad;
    dvvMatSponSumbre(ROI,:)    = all_fish{ROI,1}.SponBehaviour.DVV_sumbre;
end

f1= figure();
for i = 1: length(groups)-1
    sgtitle ('dvvMatSponSumbre')
    subplot (length(groups)-1,1,i)
    imagesc (dvvMatSponTrad(groups{1,i},:))
    colormap(jet)
    colorbar
    set(gca,'TickDir', 'out')
    box('off')
    caxis ([-100 100])
    xlabel(['time (sec), ' name_groups{1,i}])
end

f2= figure();
for i=1:length(groups)-1
    subplot (length(groups)-1,1,i)
    imagesc (dvvMatSponSumbre(groups{1,i},:))
    colormap(jet)
    colorbar
    set(gca,'TickDir', 'out')
    box('off')
    caxis ([-100 100])
    xlabel(['time (sec), ' name_groups{1,i}])
end

%% set thresholds

% SeizureBarcode_thresholds_dvv = prctile (dvvMatSponTrad,95,'all'); %this threshold is +2SD from mean
SeizureBarcode_thresholds_dvv =[50;75;95;97.5;100;150;200];

%% run barcode function - traditional dvv
[all_fish] = aj_seizureBarCodeSpont_DVV_20210321(all_fish,nROIs,timebin,folder_path_save,fish_name,date_exp,transitionTime,SeizureBarcode_thresholds_dvv);

%% run barcode function - sumbre dvv
[all_fish] = aj_seizureBarCodeSpont_DVVSumbre_20210321(all_fish,nROIs,timebin,folder_path_save,fish_name,date_exp,transitionTime,SeizureBarcode_thresholds_dvv);

%% plot seizure proxies for spontanious part

for i=1: length (SeizureBarcode_thresholds_dvv)
    
    mat  = nan(nROIs,3599);
    mat2 = nan(nROIs,3599);
    for j=1:nROIs
        mat (j,:) = all_fish{j, 1}.SponBehaviour.seizureBarcode_DVV{i,2};
        mat2(j,:) = all_fish{j, 1}.SponBehaviour.seizureBarcode_DVV_sumbre{i,2};
    end
    
    
    f1 = figure;
    f1.WindowState = 'maximized';
    sgtitle([fish_name,' ', date_exp, ' N seizure barcode-DVV - threshold -', num2str(SeizureBarcode_thresholds_dvv(i,1))]);
    
    boxplot(mat',group_category);
    ylabel ('Number of events')
    box off
    
    h={text(1.5,2.5,['ranksum p-value = ' num2str(ranksum(mat(group3),mat(group1)))],'Color','r')...
        text(2.5,2.5,['ranksum p-value = ' num2str(ranksum(mat(group3),mat(group2)))],'Color','r')... %
        text(3.5,2.5,['ranksum p-value = ' num2str(ranksum(mat(group3),mat(group4)))],'Color','r')};%...
%         text(4.5,2.5,['ranksum p-value = ' num2str(ranksum(mat(group3),mat(group5)))],'Color','r')};
    
    for j= 1:length (h)
        set(h{1,j},'Rotation',90);
    end
   
    
%     saveas (f1, [folder_path_save,filesep,figures_subfolder,filesep,fish_name,date_exp '_sponBehaviour_barcode_nSeizure_',num2str(SeizureBarcode_thresholds_dvv(i,1)) '.fig']);
%     saveas (f1, [folder_path_save,filesep,figures_subfolder,filesep,fish_name,date_exp '_sponBehaviour_barcode_nSeizure_',num2str(SeizureBarcode_thresholds_dvv(i,1)) '.jpg']);
%     saveas (f1, [folder_path_save,filesep,figures_subfolder,filesep,fish_name,date_exp '_sponBehaviour_barcode_nSeizure_',num2str(SeizureBarcode_thresholds_dvv(i,1)) '.svg']);
%     
end 

for i= 1:length(SeizureBarcode_thresholds_dvv)
    
    mat2 = nan(nROIs,3599);
    for j=1:nROIs
        mat2(j,:) = all_fish{j, 1}.SponBehaviour.seizureBarcode_DVV_sumbre{i,2};
    end

    f2 = figure;
    f2.WindowState = 'maximized';
    sgtitle([fish_name,' ', date_exp, ' N seizure barcode_DVV - threshold -', num2str(SeizureBarcode_thresholds_dvv(i,1))]);
    
    boxplot(mat2',group_category);
    ylabel ('Number of events')
    box off
    
    h={text(1.5,2.5,['ranksum p-value = ' num2str(ranksum(mat2(group3),mat2(group1)))],'Color','r')...
        text(2.5,2.5,['ranksum p-value = ' num2str(ranksum(mat2(group3),mat2(group2)))],'Color','r')... %
        text(3.5,2.5,['ranksum p-value = ' num2str(ranksum(mat2(group3),mat2(group4)))],'Color','r')};%...
%         text(4.5,2.5,['ranksum p-value = ' num2str(ranksum(mat2(group1),mat2(group5)))],'Color','r')};
    
    for j= 1:length (h)
        set(h{1,j},'Rotation',90);
    end
   
    
%     saveas (f2, [folder_path_save,filesep,figures_subfolder,filesep,fish_name,date_exp '_sponBehaviour_barcode_nSeizure_',num2str(SeizureBarcode_thresholds_dvv(i,1)) '.fig']);
%     saveas (f2, [folder_path_save,filesep,figures_subfolder,filesep,fish_name,date_exp '_sponBehaviour_barcode_nSeizure_',num2str(SeizureBarcode_thresholds_dvv(i,1)) '.jpg']);
%     saveas (f2, [folder_path_save,filesep,figures_subfolder,filesep,fish_name,date_exp '_sponBehaviour_barcode_nSeizure_',num2str(SeizureBarcode_thresholds_dvv(i,1)) '.svg']);

end 

mat3 = nan(nROIs,6000);
for i=1:nROIs
mat3(i,:) = all_fish{i, 1}.eB.DVV_trad(1,1:6000); 
end

imagesc(mat3); colormap(jet);
box ('off')
caxis([-100 200])

%%

tempMat = cell(20,3);
for i=1:size(idxLightsOn,2)
    tempMat{i,1}= ['Stimulation number' num2str(i)];
    
    for ROI=1:nROIs
        t           = 1:floor(max(all_fish{ROI, 1}.t));
        timeLight   = all_fish{ROI, 1}.timestampLight;
        DVV         = all_fish{ROI, 1}.DVV_trad;
        DVV_sumbre  = all_fish{ROI, 1}.DVV_sumbre;      
        
        %% For velocity
        temp11   = (DVV(...
            t >= floor(timeLight(idxLightsOn(ROI,i))-30) &...  %% 30 seconds before
            t <= floor(timeLight(idxLightsOn(ROI,i))-1) )); 
        
        temp12   = (DVV(...
            t >= floor(timeLight(idxLightsOn(ROI,i))) &...  
            t <= floor(timeLight(idxLightsOff(ROI,i+1))+19) )); %% til ten seconds after
        
        T11 = reshape(temp11,[1,30]);
        T12 = interp1(1:length(temp12),temp12,(1:1:30));
        
        temp_total1=[T11,T12];
        tempMat{i,2}(ROI,1:size(temp_total1,2)) = temp_total1;
        
        %% For acceleration
        temp1   = (DVV_sumbre(...
            t >= floor(timeLight(idxLightsOn(ROI,i))-30) &...  %% ten seconds before
            t <= floor(timeLight(idxLightsOn(ROI,i))-1) )); 
        
        temp2   = (DVV_sumbre(...
            t >= floor(timeLight(idxLightsOn(ROI,i))) &...  
            t <= floor(timeLight(idxLightsOff(ROI,i+1))+19) )); %% til ten seconds after
        
        T13 = reshape(temp1,[1,30]);
        T14 = interp1(1:length(temp2),temp2,(1:1:30));
        
        temp_total2=[T13,T14];
        tempMat{i,3}(ROI,1:size(temp_total2,2)) = temp_total2;
        
        
        %% empty variables
        temp1  = [];
        temp2  = [];
        temp11 = [];
        temp12 = [];
        temp_total3 = [];
        
        
    end
end

%% figures

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
caxis([0 ceil(max(max(limitMat3)))/2])
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
        ylabel ('DVV (%)')
    end
end 
    saveas (f39, [folder_path_save,filesep,figures_subfolder,filesep,fish_name,date_exp '_evokedBehaviour_DVV_baselineSB_allGroups'  '.fig']);
    saveas (f39, [folder_path_save,filesep,figures_subfolder,filesep,fish_name,date_exp '_evokedBehaviour_DVV_baselineSB_allGroups'  '.jpg']);
    saveas (f39, [folder_path_save,filesep,figures_subfolder,filesep,fish_name,date_exp '_evokedBehaviour_DVV_baselineSB_allGroups'  '.svg']);


%% tempMat{i,3}



matrise2=cell(1,length (groups)-1);
for k=1:length(groups)-1
    for i=1:size(idxLightsOn,2)
        matrise2{1,k}(i,:)  = nanmean (tempMat{i,3} (groups{1,k},:));
    end
end


f39=figure();
f39.WindowState='Maximized';
for j= 1:length(matrise2)
    limitMat3 (j*20-20+1:j*20,:)= matrise2{1,j}(:,:);    
end 
for k=1:length (groups)-1
subplot (5,5,k)
imagesc([matrise2{1,k}])
colormap(flipud(hot))
colorbar
caxis([0 ceil(max(max(limitMat3)))/2])
title (['DVV-Sumbre-Heatmap ' name_groups{1,k}])
ylabel('Stimulus number')
xlabel('time (s)')
box ('off')
set(gca,'TickDir','out'); % The only other option is 'in'
end 

for k=1:length(groups)-1
    for i=6:25
        subplot (5,5,i)
        rectangle('Position', [31 0 10 max(max(matrise2{1,1}))+2],'Facecolor',[1 1 0 0.2],'EdgeColor', [1 1 0])
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
        ylim([-3 ceil(max(max(limitMat3)))+std(max(limitMat3),[],'all')])
%         xlim([1 size(tempMat{i,3}(groups{1,1},:),2)])
        ylabel ('DVV (%)')
    end
end 
    saveas (f39, [folder_path_save,filesep,figures_subfolder,filesep,fish_name,date_exp '_evokedBehaviour_DVVsumbre_baselineSB_allGroups'  '.fig']);
    saveas (f39, [folder_path_save,filesep,figures_subfolder,filesep,fish_name,date_exp '_evokedBehaviour_DVVsumbre_baselineSB_allGroups'  '.jpg']);
    saveas (f39, [folder_path_save,filesep,figures_subfolder,filesep,fish_name,date_exp '_evokedBehaviour_DVVsumbre_baselineSB_allGroups'  '.svg']);


