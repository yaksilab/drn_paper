
timebin =1;
if strcmp(fish_name, 'PTZ_CPA_2')
    alfa = 20;
else
    alfa = 115;
end

formats={'.fig','.jpg','.svg'}; % saving formats for the figures

%% calculate longer periods of velocity, acceleration and distance -
%  conditional behaviuor - remeber to uncomment for the normal assay
tempMat = cell(25,6);
for i=1:size(idxLightsOn,2)
    tempMat{i,1}= ['Stimulation number' num2str(i)];
    
    for ROI=1:nROIs
        t               = 1:floor(max(all_fish{ROI, 1}.t));
        timeLight       = all_fish{ROI, 1}.timestampLight;
        velocity        = all_fish{ROI, 1}.bV_E4sd;
        DVV             = all_fish{ROI, 1}.DVV_trad;
        Burst_binary    = all_fish{ROI, 1}.Burst_binary;
        BursDur         = all_fish{ROI, 1}.BurstDuration;
        
        v_2_43          = all_fish{ROI, 1}.binnedVel_2_43Hz;
        t2              = 1/2.43:1/2.43:floor(max(all_fish{ROI, 1}.t));
        
        %% For velocity
        if i<=5
            temp11   = (velocity(...
                t >= floor(timeLight(idxLightsOn(ROI,i))-5) &...  %% 30 seconds before
                t < floor(timeLight(idxLightsOn(ROI,i))) ));
            
            temp12   = (velocity(...
                t >= floor(timeLight(idxLightsOn(ROI,i))) &...
                t < floor(timeLight(idxLightsOn(ROI,i))+120) )); %% til ten seconds after
            
            T11 = reshape(temp11,[1,5]);
            T12 = interp1(1:length(temp12),temp12,(1:1:120));
            
            temp_total1=[T11,T12];
            tempMat{i,2}(ROI,1:size(temp_total1,2)) = temp_total1;
            
        else
            temp11   = (velocity(...
                t >= floor(timeLight(idxLightsOn(ROI,i))-5) &...  %% 30 seconds before
                t <floor(timeLight(idxLightsOn(ROI,i))) ));
            
            temp12   = (velocity(...
                t >= floor(timeLight(idxLightsOn(ROI,i))) &...
                t < floor(timeLight(idxLightsOn(ROI,i))+30) )); %% til ten seconds after
            
            T11 = reshape(temp11,[1,5]);
            T12 = interp1(1:length(temp12),temp12,(1:1:30));
            
            temp_total1=[T11,T12];
            tempMat{i,2}(ROI,1:size(temp_total1,2)) = temp_total1;
        end
        
        %% for DVV_trad
        temp3   = (DVV(...
            t >= floor(timeLight(idxLightsOn(ROI,i))-5) &...  %% ten seconds before
            t <= floor(timeLight(idxLightsOn(ROI,i))-1) ));
        
        temp4   = (DVV(...
            t >= floor(timeLight(idxLightsOn(ROI,i))) &...
            t <= floor(timeLight(idxLightsOn(ROI,i))+29) )); %% til ten seconds after
        
        T13 = reshape(temp3,[1,5]);
        T14 = interp1(1:length(temp4),temp4,(1:1:30));
        
        temp_total3=[T13,T14];
        tempMat{i,3}(ROI,1:size(temp_total3,2)) = temp_total3;
        
        %% Burst duration, continious
        
        temp7   = (BursDur(...
            t >= floor(timeLight(idxLightsOn(ROI,i))-5) &...  %% ten seconds before
            t <= floor(timeLight(idxLightsOn(ROI,i))-1) ));
        
        temp8   = (BursDur(...
            t >= floor(timeLight(idxLightsOn(ROI,i))) &...
            t <= floor(timeLight(idxLightsOn(ROI,i))+29) )); %% til ten seconds after
        
        T17 = reshape(temp7,[1,5]);
        T18 = interp1(1:length(temp8),temp8,(1:1:30));
        
        temp_total8=[T17,T18];
        tempMat{i,4}(ROI,1:size(temp_total8,2)) = temp_total8;
        
        
        %% for burst_binary
        temp5   = (Burst_binary(...
            t >= floor(timeLight(idxLightsOn(ROI,i))-5) &...  %% ten seconds before
            t <= floor(timeLight(idxLightsOn(ROI,i))-1) ));
        
        temp6   = (Burst_binary(...
            t >= floor(timeLight(idxLightsOn(ROI,i))) &...
            t <= floor(timeLight(idxLightsOn(ROI,i))+29) )); %% til ten seconds after
        
        T15 = reshape(temp5,[1,5]);
        T16 = interp1(1:length(temp6),temp6,(1:1:30));
        
        temp_total8=[T15,T16];
        tempMat{i,5}(ROI,1:size(temp_total8,2)) = temp_total8;
        
        
        %% for 2.43 Hz binned velocity
        temp7   = (v_2_43(...
            t2 >= floor(timeLight(idxLightsOn(ROI,i))-5) &...  %% ten seconds before
            t2 < floor(timeLight(idxLightsOn(ROI,i))) ));
        
        temp8   = (v_2_43(...
            t2 >= floor(timeLight(idxLightsOn(ROI,i))) &...
            t2 < floor(timeLight(idxLightsOn(ROI,i))+alfa) )); %% til ten seconds after
        
        T15 = interp1(1:length(temp7),temp7,1:12/13:13);
        T16 = interp1(1:length(temp8),temp8,(1:1:279));
        
        temp_total8=[T15,T16];
        tempMat{i,6}(ROI,1:size(temp_total8,2)) = temp_total8;
        %% empty variables
        temp1  = [];
        temp2  = [];
        temp11 = [];
        temp12 = [];
        temp_total3 = [];
        
        
    end
end
%% plots 
for m=1
tempVelMat = nan(nROIs,8201);

for ROI = 1:nROIs
    VelVec = [];
    VelVec(1,:) = all_fish{ROI,1}.binnedVel_2_43Hz(...
        t2 >= round(all_fish{ROI, 1}.timestampLight(idxLightsOn(ROI,1))-600)...
        & t2 <= round(all_fish{ROI, 1}.timestampLight(idxLightsOff(ROI,25))+120));
    
    tempVelMat (ROI,:) = interp1(1:length(VelVec),VelVec,(1:1:8201));
end

C1 = [[0 0 0]; [0 0 1];
    [252,174,145]/255;
    [0 0 0];
    [1 0 0];
    [0 0 255]/255];

f4= figure;
f4.WindowState = 'Maximized';
f4= tiledlayout(10,1,'TileSpacing','none');
nexttile([2 1])
for i=1:3%length(groups)-1
    boundedline ((1:1:8201),(mean(tempVelMat(groups{1,i},:),'omitnan')),...
        (std(tempVelMat(groups{1,i},:),'omitnan')...
        /sqrt(length(groups{1,i}))),'alpha','cmap',C1(i,:))
    hold on
end
legend ({'',name_groups{1,1},'',name_groups{1,2},'',name_groups{1,3}})
xlim([1 8201])
hold off

nexttile([2 1])
for i=4:length(groups)-1
    boundedline (1:1:8201,mean(tempVelMat(groups{1,i},:),'omitnan'),...
        std(tempVelMat(groups{1,i},:),'omitnan')...
        /sqrt(length(groups{1,i})),'alpha','cmap',C1(i,:))
    hold on
end
legend ({'',name_groups{1,4},'',name_groups{1,5},'',name_groups{1,6}})
xlim([1 8201])
hold off

for i=1:length(groups)-1
    nexttile (i+4)
    imagesc (tempVelMat([groups{1,i}],:))
    colormap ((hot))
    set(gca,'TickDir','out')
    caxis([0 15])
    
    ax = gca;
    ax.XColor = 'white';
    
    if i==length(groups)-1
        set(gca,'TickDir','out')
        colorbar
    else 
        set(gca,'XTick',[],'XTickLabel',[])
    end
    
    ylabel (name_groups{1,i})
    
end


for f=1:length(formats)
    saveas (f4, [folder_path_save,filesep,figures_subfolder,filesep,...
        fish_name,date_exp '_rawVelocity_NS_heatmap_allGroups'  formats{1,f}]);
end
end 

%% activity index per fish during "baseline"

activityIndexPerF = nan(nROIs,1);
for ROI=1:nROIs
    activityIndexPerF(ROI,1) = sum(all_fish{ROI, 1}.Burst_binary(10:590)...
        ,'omitnan')/581;  
end 

activityIndexPerF_base = nan(nROIs,1); % last five minutes prior to the 1st stimulus
for ROI=1:nROIs
    activityIndexPerF_base(ROI,1) = sum(all_fish{ROI, 1}.Burst_binary(300:590)...
        ,'omitnan')/length(300:590);  
end 

figure,
f = tiledlayout(1,2,'TileSpacing','compact');
nexttile; 

boxplot(activityIndexPerF,group_category);
xlim([.5 6.5])

nexttile(2); 

boxplot(activityIndexPerF_base,group_category);
xlim([.5 6.5])

% [tbl,chi2stat,pval] = crosstab(x1,x2)
% activityIndexPerF_t5 = nan(nROIs,1);
% for ROI=1:nROIs
%     activityIndexPerF_t5(ROI,1) =...
%         sum(all_fish{ROI, 1}.barCode.velTresholdSeizure{1, 1}(10:590)...
%         ,'omitnan')/581;  
% end 
% 
% activityIndexPerF_base_t5 = nan(nROIs,1); % last five minutes prior to the 1st stimulus
% for ROI=1:nROIs
%     activityIndexPerF_base_t5(ROI,1) =...
%         sum(all_fish{ROI, 1}.barCode.velTresholdSeizure{1, 1}(300:590)...
%         ,'omitnan')/length(300:590);  
% end 
% 
% nexttile(2); 
% 
% boxplot(activityIndexPerF_t5,group_category);
% xlim([.5 6.5])
% 
% nexttile(4); 
% 
% boxplot(activityIndexPerF_base_t5,group_category);
% xlim([.5 6.5])
% 
% 
% 
% 



