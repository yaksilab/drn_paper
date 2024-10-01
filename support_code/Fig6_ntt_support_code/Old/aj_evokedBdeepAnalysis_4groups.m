function [all_fish] = aj_evokedBdeepAnalysis_4groups...
    (all_fish,folder_path_save,fish_name,date_exp,group1,...
    group2,group3, group4, group5,figures_subfolder,...
    group_category,nROIs,groups,name_groups,...
    idxLightsOn,idxLightsOff,...
    threshold,transitionTime)

% analyses the evoked behaviour in terms of figures and test for
% publication


timebin =1/2.433846153846;
    if strcmp(fish_name, 'PTZ_short')
        alfa = 20;
    else 
        alfa = 115;
    end 
    
formats={'.fig','.jpg','.svg'}; % saving formats for the figures

%% calculate longer periods of velocity, acceleration and distance -
%  conditional behaviuor - remeber to uncomment for the normal assay

for ROI = 1:nROIs
    all_fish{ROI,1}.t2 = timebin:timebin:(max(all_fish{ROI,1}.t));    
end 

tempMat = cell(20,6);
for i=1:size(idxLightsOn,2)
    tempMat{i,1}= ['Stimulation number' num2str(i)];
    
    for ROI=1:nROIs
        t               = 1:floor(max(all_fish{ROI, 1}.t));
        timeLight       = all_fish{ROI, 1}.timestampLight;
        velocity        = all_fish{ROI, 1}.bV_E4sd;
        DVV             = all_fish{ROI, 1}.DVV_trad;
        Burst_binary    = all_fish{ROI, 1}.Burst_binary;
        BursDur         = all_fish{ROI, 1}.BurstDuration;

        
        t2              = all_fish{ROI,1}.t2;
        velocity_243HZ  = all_fish{ROI,1}.binnedVel_2_43Hz;
        
        %% For velocity
        temp11   = (velocity(...
            t >= floor(timeLight(idxLightsOn(ROI,i))-5) &...  %% 30 seconds before
            t <= floor(timeLight(idxLightsOn(ROI,i))-1) ));
        
        temp12   = (velocity(...
            t >= floor(timeLight(idxLightsOn(ROI,i))) &...
            t <= floor(timeLight(idxLightsOn(ROI,i))+29) )); %% til ten seconds after
        
        T11 = reshape(temp11,[1,5]);
        T12 = interp1(1:length(temp12),temp12,(1:1:30));
        
        temp_total1=[T11,T12];
        tempMat{i,2}(ROI,1:size(temp_total1,2)) = temp_total1;
        
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
        
        temp111   = (velocity_243HZ(...
            t2 >= floor(timeLight(idxLightsOn(ROI,i))-5) &...  %% 30 seconds before
            t2 < floor(timeLight(idxLightsOn(ROI,i))) ));
        
        temp121   = (velocity_243HZ(...
            t2 >= floor(timeLight(idxLightsOn(ROI,i))) &...
            t2 <= floor(timeLight(idxLightsOn(ROI,i))+10+alfa) )); %% til 50 seconds after
        
        T111 = interp1(1:length(temp111),temp111,(1:1:12));
        T121 = interp1(1:length(temp121),temp121,(1:1:304));
        
        temp_total1=[T111,T121];
        tempMat{i,6}(ROI,1:size(temp_total1,2)) = temp_total1;
        %% empty variables
        temp1  = [];
        temp2  = [];
        temp11 = [];
        temp12 = [];
        temp_total3 = [];
        
        
    end
end

%% heatmap whole experiment, raw velocity Not sorted heatmap array 

tempVelMat = nan(nROIs,5370);

for ROI = 1:nROIs
    VelVec = [];
    VelVec(1,:) = (all_fish{ROI,1}.bV_E4sd...
        (1,round(all_fish{ROI, 1}.timestampLight(idxLightsOn(ROI,1)-30))...
        :round(all_fish{ROI, 1}.timestampLight(idxLightsOff(ROI,21))+30)...
        ));
    
    tempVelMat (ROI,:) = interp1(1:length(VelVec),VelVec,(1:1:5370)); 
end



f4= figure;
f4.WindowState = 'Maximized';
imagesc (tempVelMat([groups{1,1:4}],:))
title ('Velocity heatmap, NS, raw')
% colormap_heatmap = pmkmp_colors(256,'LinearL');
colormap((hot))
colorbar
box off
set(gca,'TickDir','out')

for f=1:length(formats)
saveas (f4, [folder_path_save,filesep,figures_subfolder,filesep,...
    fish_name,date_exp '_rawVelocity_NS_heatmap_allGroups'  formats{1,f}]);
end 

%% sorted according to treatment group
tempMat2 = (tempVelMat([group1,group2,group3,group4,group5],:));
tempMat3 = mean (tempVelMat,2,'omitnan');

f5= figure;
f5.WindowState = 'Maximized';
subplot (2,6,[1:2,7:8])
boxplot (tempMat3([groups{1,1:4}],:),...
    string(group_category ([groups{1,1:4}],:)),...
    'PlotStyle','compact') % G-variable
box ('off')
set(gca, 'TickDir','out')
xlim ([.5 4.5])

tests = nan(3,1);
for i=1:length(tests)
    [tests(i,1),~] = ranksum(tempMat3(groups{1,1}),tempMat3(groups{1,i+1}));
end

text(3,mean(tempVelMat(group1),'omitnan')/2,...
    [char(num2str(tests))],'Color','magenta');

subplot (2,6,[3:6,9:12])
imagesc (tempMat2([groups{1,1:4}],:))
title ('Velocity heatmap, Sorted, raw')
colormap((hot))
colorbar
caxis([0 40])
box off
set(gca,'TickDir','out')

for f=1:length(formats)
saveas (f5, [folder_path_save,filesep,figures_subfolder,filesep,...
    fish_name,date_exp '_Overall_rawVelocity_S_heatmap_allGroups'...
    formats{1,f}]);
end 

%% Colormaps
if strcmp (fish_name, 'PTZ') ||strcmp (fish_name, 'PTZ_short')
    C1 = [[0 0 0]; [1 1 0] ; [ 0.8100 0.5100 0.1700]; [1 0 0]];
elseif strcmp (fish_name, 'gabra1')
    C1 = [[.0005 .8 0];[.005 .6 0 ];[.01 .2 0]; [.2 .2 .2]] ;
elseif strcmp (fish_name, 'eaat2a')
    C1 = [[.001 .005 .95];[.001 .005 .65];[.001 .005 .25]; [.2 .2 .2]];
elseif strcmp (fish_name, 'scn1lab')
    C1 = [[ .5 0 .5]; [.25 0 .25]; [.4 .4 .4]; [.1 .1 .2]];
elseif strcmp (fish_name, 's280F')
    C1 = [[ 1 0 1]; [.6 0 .6]; [.4 .4 .4]; [.1 .1 .2]];
end 

%% make arrays for light response plots for velocity

tempCell = cell (4,2);
tempCell{1,1} = ("10'ISI");
tempCell{2,1} = ("5'ISI");
tempCell{3,1} = ("2''ISI");
tempCell{4,1} = ("1''ISI");

% Mean response per fish not sorted

for j=1:size(idxLightsOn,2)/5
    for ROI=1:nROIs
        A = nan(3,35);
        for k=(j*5-(5-1):j*5)
            A(k,:) = tempMat{k,2}(ROI,:);
        end
        tempCell{j, 2}(ROI,:) = mean (A,1.,'omitnan');
    end
end

% raw velocity plot, heatmap not sorted

f1= figure;
f1.WindowState='Maximized';
f1=tiledlayout(2,5);
title(f1,'raw velocity, mean response per fish, NS heatmap')
ylabel(f1,'Velocity')
f1.Padding = 'none';

for k=1:size(idxLightsOn,2)/5
    nexttile(k)
    imagesc(tempCell{k,2}(sort([groups{1,1:4}]),:))
    
    colormap((hot))
    colorbar
    %     caxis([0 40])%ceil(max(max(limitMat)))])
    
    title ([tempCell{k, 1}()])
    ylabel('Fish nr.')
    xlabel('time (s)')
    box ('off')
    set(gca,'TickDir','out'); % The only other option is 'in'
    
    hold on 
end
hold off

for k=1:size(idxLightsOn,2)/5
    nexttile(k+5)
    rectangle('Position', [6 -4 10 2],'Facecolor',[1 1 0 0.2],'EdgeColor', [1 1 0]), hold on

    boundedline(1:size(tempCell{k,2},2),...
        mean(tempCell{k,2}(group1,:)),...
        std((tempCell{k,2}(group1,:)),[],1,'omitnan')./...
        sqrt(length(group1)),'alpha',...
        1:size(tempCell{k,2},2),...
        mean(tempCell{k,2}(group2,:)),...
        std((tempCell{k,2}(group2,:)),[],1,'omitnan')...
        ./sqrt(length(group2)),'alpha',...
        1:size(tempCell{k,2},2),...
        mean(tempCell{k,2}(group3,:)),...
        std((tempCell{k,2}(group3,:)),[],1,'omitnan')...
        ./sqrt(length(group3)),'alpha',...
        1:size(tempCell{k,2},2),...
        mean(tempCell{k,2}(group4,:)),...
        std((tempCell{k,2}(group4,:)),[],1,'omitnan')...
        ./sqrt(length(group4)),'alpha',...
        'cmap',C1);
    
    legend({'', '', '', '', name_groups{1,1:4}})
    
    xlim([1 25])
    ylim([-5 25])
    
    ylabel('Velocity mm/s')
    hold on
end
hold off

for f=1:length(formats)
saveas (f1, [folder_path_save,filesep,figures_subfolder,filesep,...
    fish_name,date_exp...
    '_evokedBehaviour_rawVelocity_NS_linePlot_allGroups'  formats{1,f}]);
end 

%% raw velocityplot, heatmap sorted according to treatment group

tempCell2 = cell(4,1);
for i=1:size(idxLightsOn,2)/5
    tempCell2{i,1} = tempCell{i,2}([group1,group2,group3,group4,group5],:);
end

f2= figure;
f2.WindowState='Maximized';
% sgtitle('raw velocity, mean response per fish, S heatmap')
f2 = tiledlayout(2,4); % Requires R2019b or later
title(f2,'raw velocity, mean response per fish, S heatmap')
ylabel(f2,'Velocity')
f2.Padding = 'none';

for k=1:size(idxLightsOn,2)/5
    nexttile
%     subplot (2,size(idxLightsOn,2)/5,k)
    imagesc(tempCell2{k,1}(1:length([groups{1,1:4}]),:))

    colormap((hot))
    colorbar
    caxis([0 15])%ceil(max(max(limitMat)))])
    
    title ([tempCell{k, 1}])
    ylabel('Fish nr.')
    xlabel('time (s)')
    box ('off')
    set(gca,'TickDir','out'); % The only other option is 'in'
    hold on
end

for k=1:size(idxLightsOn,2)/5
    nexttile
%     subplot (2,size(idxLightsOn,2)/5,k+4)
    rectangle('Position', [6 -4 10 2],...
            'Facecolor',[1 1 0 0.2],'EdgeColor', [1 1 0]), hold on
   
    boundedline(1:size(tempCell{k,2},2),...
            mean(tempCell{k,2}(group1,:)),...
            std((tempCell{k,2}(group1,:)),[],1,'omitnan')/...
            sqrt(length(group1)),'alpha',...
            1:size(tempCell{k,2},2),...
            mean(tempCell{k,2}(group2,:)),...
            std((tempCell{k,2}(group2,:)),[],1,'omitnan')...
            /sqrt(length(group2)),'alpha',...
            1:size(tempCell{k,2},2),...
            mean(tempCell{k,2}(group3,:)),...
            std((tempCell{k,2}(group3,:)),[],1,'omitnan')...
            /sqrt(length(group3)),'alpha',...
            1:size(tempCell{k,2},2),...
            mean(tempCell{k,2}(group4,:)),...
            std((tempCell{k,2}(group4,:)),[],1,'omitnan')...
            /sqrt(length(group4)),'alpha',...
            'cmap',C1);
        
    legend({'', '', '', '', name_groups{1,1:4}})
    
    xlim([1 25])
    ylim([-5 25])
    
    ylabel('Velocity mm/s')
    hold on 
end

hold off
for f=1:length(formats)
saveas (f2,[folder_path_save,filesep,figures_subfolder,filesep,...
    fish_name,date_exp...
    '_evokedBehaviour_rawVelocity_S_linePlot_allGroups'  formats{1,f}]);
end 

%% DVV arrays, DVV_trad

tempCell3 = cell (4,2);
tempCell3{1,1} = ("10'ISI");
tempCell3{2,1} = ("5'ISI");
tempCell3{3,1} = ("2'ISI");
tempCell3{4,1} = ("1'ISI");

% Mean DVV per fish not sorted

for j=1:size(idxLightsOn,2)/5
    for ROI=1:nROIs
        B = nan(4,35);
        for k=(j*5-(5-1):j*5)
            B(k,:) = tempMat{k,3}(ROI,:);
        end
        tempCell3{j, 2}(ROI,:) = mean (B,1.,'omitnan');
    end
end

tempCell5 = cell(5,1);
for j=1:size(idxLightsOn,2)/5
    tempCell5{j,1} = tempCell3{j,2}([group1,group2,group3, group4],:);
end

%dvv plot, heatmap sorted

f3= figure;
f3.WindowState='Maximized';
% sgtitle('dvv velocity, mean response per fish, S heatmap')
f3 = tiledlayout(2,4); % Requires R2019b or later
title(f3,'dvv velocity, mean response per fish, S heatmap')
ylabel(f3,'DVV')
f3.Padding = 'none';

for k=1:size(idxLightsOn,2)/5
    nexttile
%     subplot (2,size(idxLightsOn,2)/5,k)
    imagesc(tempCell5{k,1})    
    colormap((hot))
    colorbar
    %     caxis([0 40])%ceil(max(max(limitMat)))])    
    title ([tempCell{k, 1}])
    ylabel('Fish nr.')
    xlabel('time (s)')
    box ('off')
    set(gca,'TickDir','out'); % The only other option is 'in'
    hold on
end

for k = 1:size(idxLightsOn,2)/5% 
    nexttile
%     subplot (2,size(idxLightsOn,2)/5,k+4)
    boundedline(...
        1:size(tempCell3{k,2},2),...
        mean(tempCell3{k,2}(group1,:),'omitnan'),...
        std((tempCell3{k,2}(group1,:)),[],1,'omitnan')./...
        sqrt(length(group1)),'alpha',...
        1:size(tempCell3{k,2},2),...
        mean(tempCell3{k,2}(group2,:),'omitnan'),...
        std((tempCell3{k,2}(group2,:)),[],1,'omitnan')./...
        sqrt(length(group2)),'alpha',...
        1:size(tempCell3{k,2},2),...
        mean(tempCell3{k,2}(group3,:),'omitnan'),...
        std((tempCell3{k,2}(group3,:)),[],1,'omitnan')./...
        sqrt(length(group3)),'alpha',...
        1:size(tempCell3{k,2},2),...
        mean(tempCell3{k,2}(group4,:),'omitnan'),...
        std((tempCell3{k,2}(group4,:)),[],1,'omitnan')./...
        sqrt(length(group4)),'alpha',...
        'cmap',C1);
    
    legend({'', '', '', '', name_groups{1,1:4}})
    
    xlim([1 35])
    ylim([-100 2200])
    
    ylabel('percent change')
    
    hold on 
end

hold off
for f=1:length(formats)
saveas (f3,[folder_path_save,filesep,figures_subfolder,filesep,...
    fish_name,date_exp...
    '_evokedBehaviour_DVV_trad_S_SEM_linePlot_allGroups'  formats{1,f}]);
end 

%% alternative DVV-calculation: if mean of the baseline; 5'' before stimulus 
% is 0, then all values are replaced by nan, because og infinity problem

% aj_alternative_DVV_calculation
%% Burstduration 

%% Burstduration

tempCell6 = cell (5,2);
tempCell6{1,1} = ("10'ISI");
tempCell6{2,1} = ("5'ISI");
tempCell6{3,1} = ("2'ISI");
tempCell6{4,1} = ("1'ISI");

% Mean velocity increase per fish not sorted

for j=1:size(idxLightsOn,2)/5
    for ROI=1:nROIs
        B = nan(4,35);
        for k=(j*5-(5-1):j*5)
            B(k,:) = tempMat{k,4}(ROI,:);
        end
        tempCell6{j, 2}(ROI,:) = mean (B,1,'omitnan');
    end
end

tempCell7 = cell(5,1);
for j=1:size(idxLightsOn,2)/5
    tempCell7{j,1} = tempCell6{j,2}([group1,group2,group3, group4],:);
end


% plot

f7= figure;
f7.WindowState='Maximized';

f7 = tiledlayout(2,4); % Requires R2019b or later
title(f7,'Burst duration, mean response per fish, S heatmap')
ylabel(f7,'DVV')
f7.Padding = 'none';


for k=1:size(idxLightsOn,2)/5
    nexttile
    imagesc(tempCell7{k,1}(1:length([groups{1,1:4}])))
    
    colormap((hot))
    colorbar
    caxis([0 1])%ceil(max(max(limitMat)))])
    
    title ([tempCell{k, 1}])
    ylabel('Fish nr.')
    xlabel('time (s)')
    box ('off')
    set(gca,'TickDir','out'); % The only other option is 'in'
    hold on 
end

for k=1:size(idxLightsOn,2)/5
    nexttile
    rectangle('Position', [6 .4 10 .1],'Facecolor',[1 1 0 0.2],...
        'EdgeColor', [1 1 0]), hold on
    boundedline(...
        1:size(tempCell6{k,2},2),...
        mean(tempCell6{k,2}(group1,:),'omitnan'),...
        std((tempCell6{k,2}(group1,:)),[],1,'omitnan')./...
        sqrt(length(group1)),'alpha',...
        1:size(tempCell6{k,2},2),...
        mean(tempCell6{k,2}(group2,:),'omitnan'),...
        std((tempCell6{k,2}(group2,:)),[],1,'omitnan')./...
        sqrt(length(group2)),'alpha',...
        1:size(tempCell6{k,2},2),...
        mean(tempCell6{k,2}(group3,:),'omitnan'),...
        std((tempCell6{k,2}(group3,:)),[],1,'omitnan')./...
        sqrt(length(group3)),'alpha',...
        1:size(tempCell6{k,2},2),...
        mean(tempCell6{k,2}(group4,:),'omitnan'),...
        std((tempCell6{k,2}(group4,:)),[],1,'omitnan')./...
        sqrt(length(group4)),'alpha',...
        'cmap',C1);
    legend({'', '', '','', name_groups{1,1:4}})
    
    xlim([1 35])
    ylim([0 .5])
    
    ylabel('Activity(proportion)')
    hold on 
end

hold off 
for f=1:length(formats)
saveas (f7,[folder_path_save,filesep,figures_subfolder,filesep,...
    fish_name,date_exp...
    '_evokedBehaviour_BurstDuration_S_linePlot_allGroups'  formats{1,f}]);
end 

%% V 2.43 Hz

tempCell_V_2_43Hz = cell (4,2);
tempCell_V_2_43Hz{1,1} = ("10'ISI");
tempCell_V_2_43Hz{2,1} = ("5'ISI");
tempCell_V_2_43Hz{3,1} = ("2''ISI");
tempCell_V_2_43Hz{4,1} = ("1''ISI");


% Mean response per fish not sorted

for j=1:size(idxLightsOn,2)/5
    for ROI=1:nROIs
        A = nan(3,size(tempMat{1, 6},2) );
        for k=(j*5-(5-1):j*5)
            A(k,:) = tempMat{k,6}(ROI,:);
        end
        tempCell_V_2_43Hz{j, 2}(ROI,:) = mean (A,1.,'omitnan');
    end
end

% raw velocity plot, heatmap  sorted

f1= figure;
f1.WindowState='Maximized';
sgtitle('raw velocity, mean response per fish, NS heatmap')
f1=tiledlayout(2,4); % Requires R2019b or later
title(f1,['raw velocity, mean response per fish, S heatmap, 2.43 Hz ',...
    fish_name])
ylabel(f1,'Velocity')
f1.Padding = 'none';

for k=1:size(idxLightsOn,2)/5
    nexttile
    imagesc(tempCell_V_2_43Hz{k,2}(([groups{1,1:4}]),:))

    colormap((hot))
    colorbar
    caxis([0 25])%ceil(max(max(limitMat)))])
    
    title ([tempCell_V_2_43Hz{k, 1}()])
    ylabel('Fish nr.')
    xlabel('time (s)')
    box ('off')
    set(gca,'TickDir','out'); % The only other option is 'in'
end

for k=1:size(idxLightsOn,2)/5
    nexttile
        boundedline(1:size(tempCell_V_2_43Hz{k,2},2),...
            mean(tempCell_V_2_43Hz{k,2}(group1,:),'omitnan'),...
            std((tempCell_V_2_43Hz{k,2}(group1,:)),[],1,'omitnan')./...
            sqrt(length(group1)),'alpha',...
            1:size(tempCell_V_2_43Hz{k,2},2),...
            mean(tempCell_V_2_43Hz{k,2}(group2,:),'omitnan'),...
            std((tempCell_V_2_43Hz{k,2}(group2,:)),[],1,'omitnan')...
            ./sqrt(length(group2)),'alpha',...
            1:size(tempCell_V_2_43Hz{k,2},2),...
            mean(tempCell_V_2_43Hz{k,2}(group3,:),'omitnan'),...
            std((tempCell_V_2_43Hz{k,2}(group3,:)),[],1,'omitnan')...
            ./sqrt(length(group3)),'alpha',...
            1:size(tempCell_V_2_43Hz{k,2},2),...
            mean(tempCell_V_2_43Hz{k,2}(group4,:),'omitnan'),...
            std((tempCell_V_2_43Hz{k,2}(group4,:)),[],1,'omitnan')...
            ./sqrt(length(group4)),'alpha',...
            'cmap',C1);
    
    legend('','','','', name_groups{1,1:4})
    
    xlim([1 158])
    ylim([0 20])   
    ylabel('Velocity mm/s')
end

for f=1:length(formats)
saveas (f1, [folder_path_save,filesep,figures_subfolder,...
    filesep,fish_name,date_exp...
    '_evokedBehaviour_rawVelocity_S_linePlot_allGroups_2_43Hz'  formats{1,f}]);
end 

%% number of responders
% aj_Responders_DVV

aj_Responders

%% ------------------------------------------- light response - tests ---------------------------------------------

%% Light on response: mean DVV change per fish per  tempCell3 contains the DVV data

%     LightStimTest_numresponders_DVV

%% --------------------------------- Velocity --------------------------

%% Light on response:  
% V change per fish per stimulus from prior to the stimulus to max velocity
% on 2.43 Hz binned velocity data 

onResponseV = cell(size(idxLightsOn,2)/5,2);

for i=1:size(idxLightsOn,2)/5
    onResponseV{i,1} = tempCell_V_2_43Hz{i,1};
    for ROI = 1:nROIs
        onResponseV{i,2}(ROI,1) = mean(tempCell_V_2_43Hz{i,2}(ROI,1:12),...
            'omitnan'); % approximately 5 sec before lights are turned on
        onResponseV{i,2}(ROI,2) = max (tempCell_V_2_43Hz{i,2}(ROI,13:24));
        % five seconds after lights on transition 
    end 
end 

%% light off response: mean V change per fish per ISI
offResponseV = cell(size(idxLightsOn,2)/5,2);

for i=1:size(idxLightsOn,2)/5
    offResponseV{i,1} = tempCell_V_2_43Hz{i,1};
    for ROI = 1:nROIs
        offResponseV{i,2}(ROI,1) = mean(tempCell_V_2_43Hz{i,2}(ROI,34:36)...
            ,'omitnan');   % last bin with the lights on is bin number 36
        offResponseV{i,2}(ROI,2) = max (tempCell_V_2_43Hz{i,2}(ROI,37:48));
        % approximately five seconds after the lights are turned off
    end 
end


%% plot response in group comparison of lights on and off response

f13=figure; 
f13.WindowState='Maximized';
f13 = tiledlayout(2,4); % Requires R2019b or later

title(f13,['In group comparison of ON and OFF response, raw V(bin 5',...
    'before vs max dff after, and 16 vs after stim) whithin 3 sec'])
ylabel(f13,'V')
f13.Padding = 'none';
A =  nan(size(idxLightsOn,2)/5,4);
B =  nan(size(idxLightsOn,2)/5,4); 

for i=1:size(idxLightsOn,2)/5
    %% on response
    nexttile
    for j=1:length(groups)-1

        errorbar (1:2,mean(onResponseV{i,2}(groups{1,j},1:2),'omitnan'),...
            std(onResponseV{i,2}(groups{1,j},1:2),'omitnan')./...
            sqrt(size(groups{1,j},2)),...
            'Color', C1(j,:),'LineWidth', 2), hold on  
    end 
    xlim([0 2.5])

    % in group comparison, alternatively one can do a paired T-test, 
    % because N(groups)>30 and these are mean values, thus normality can 
    % be asumed
    for j= 1:length(groups)-1
        A(i,j)=signrank(onResponseV{i,2}(groups{1,j},1),onResponseV{i,2}...
            (groups{j},2));
    end 
    
    box 'off'
    
       text(0.2,mean(onResponseV{i,2}(groups{1,1},1:2),'all','omitnan'),...
       num2str(((A(i,:)'))))
    
    ylabel ('Mean V vhange (mm/s) LD transition')
    legend (name_groups{1,1:3}, 'Location', 'northwest')
    
    %% off response
    nexttile
    
    for j=1:length(groups)-1
        errorbar (1:2,mean(offResponseV{i,2}(groups{1,j},1:2)),...
            std(offResponseV{i,2}(groups{1,j},1:2),'omitnan')./...
            sqrt(size(groups{1,j},2)),...
            'Color', C1(j,:),'LineWidth', 2), hold on
    end
    xlim([0 2.5])
    

    % in group comparison, alternatively one can do a paired T-test, 
    % because N(groups)>30 and these are mean values, thus normality can 
    % be asumed
    for j= 1:length(groups)-1
        B(i,j)=signrank(offResponseV{i,2}(groups{1,j},1),...
            offResponseV{i,2}(groups{1,j},2));
    end 
    
    box 'off'
    
       text(0.2,mean(onResponseV{i,2}(groups{1,1},1:2),'all','omitnan'),...
       num2str(((B(i,:)'))))
    
    ylabel ('Mean V change (mm/s) LD transition')
    legend (name_groups{1,1:3}, 'Location', 'northwest')
    
end 
hold off

for f=1:length(formats)
saveas (f13, [folder_path_save,filesep,figures_subfolder,filesep,...
    fish_name,date_exp '_evokedBehaviour_V_inGroupComp'  formats{1,f}]);
end 

%% between group comparison in change in V for lights on and off

onResponseVdiff = cell(size(idxLightsOn,2)/5,2);

for i=1:size(idxLightsOn,2)/5
    onResponseVdiff{i,1} = tempCell_V_2_43Hz{i,1};
    for ROI = 1:nROIs
        onResponseVdiff{i,2}(ROI,1) = mean(diff(onResponseV{i,2}(ROI,:))...
            ,'omitnan');
    end
end

offResponseVdiff = cell(size(idxLightsOn,2)/5,2);

for i=1:size(idxLightsOn,2)/5
    offResponseVdiff{i,1} = tempCell_V_2_43Hz{i,1};
    for ROI = 1:nROIs
        offResponseVdiff{i,2}(ROI,1) = mean(diff(offResponseV{i,2}(ROI,:))...
            ,'omitnan');
    end
end

f14=figure;
f14.WindowState='Maximized';
f14 = tiledlayout(2,4); % Requires R2019b or later

title(f14,['Between group comparison of ON and OFF response, raw V(bin 5',...
        'before vs max dff after, and 16 vs after stim) whithin 3 sec'])

f14.Padding = 'none';

for i=1:size(idxLightsOn,2)/5
    %% on response
    nexttile (i)
    boxplot (onResponseVdiff{i,2}(:,1), group_category,'Colors',...
        C1,'OutlierSize',.2,'PlotStyle','compact'),
    
    box 'off'
    ylabel ('V change (mm/s) DL transition')
    title (onResponseVdiff{i,1})
    ylim ([-2 25])

    %% test 
    A =  nan(size(idxLightsOn,2)/5,3); % in group comparison, 
    % alternatively one can do a paired T-test, because N(groups)>30 
    % and these are mean values, thus normality can be asumed
    for j= 1:3
        A(i,j)=ranksum(onResponseVdiff{i,2}(groups{1,1},1),...
            onResponseVdiff{i,2}(groups{1,j+1},1));
    end
    
    text(4.3,mean(onResponseV{i,2}(groups{1,1},1:2),'all','omitnan'),...
       num2str(((A(i,:)'))))
    %% off response
    nexttile(i+4)
    boxplot (offResponseVdiff{i,2}(:,1), group_category,'Colors',....
        C1,'OutlierSize',.2,'PlotStyle','compact'),
    
    box 'off'
    ylabel ('V change (mm/s) LD transition')
    ylim([0 10])
    title (offResponseVdiff{i,1})
    % xlim([.5 4.5])
    
    %% test 
    
    B =  nan(size(idxLightsOn,2)/5,3); % in group comparison,
    % alternatively one can do a paired T-test, because N(groups)>30
    % and these are mean values, thus normality can be asumed
    for j= 1:3
        B(i,j)=ranksum(offResponseVdiff{i,2}(groups{1,1},1),...
            offResponseVdiff{i,2}(groups{1,j+1},1));
    end
    
    text(4.3,mean(onResponseV{i,2}(groups{1,1},1:2),'all','omitnan'),...
       num2str(((B(i,:)'))))
end

for f=1:length (formats)
saveas (f14, [folder_path_save,filesep,figures_subfolder,filesep,...
    fish_name,date_exp '_evokedBehaviour_V_betweenGroupComp' formats{1,f}]);
end 

%% For the 5 min ISI to see what happens between the stimuli
% temporary matrix for 5 min period


tempMat4 = cell(5,5);
for i=5:9
    tempMat4{i-4,1}= ['Stimulation number' num2str(i)];
    
    for ROI=1:nROIs
        t           = 1:floor(max(all_fish{ROI, 1}.t));
        timeLight   = all_fish{ROI, 1}.timestampLight;
        velocity    = all_fish{ROI, 1}.bV_E4sd;
        DVV         = all_fish{ROI, 1}.DVV_trad;
        BurstDur    = all_fish{ROI, 1}.BurstDuration;
        BurstBin    = all_fish{ROI, 1}.Burst_binary;
        
        t2                  = all_fish{ROI, 1}.t2;
        binnedVel_2_43Hz    = all_fish{ROI, 1}.binnedVel_2_43Hz;
        
        %% For velocity
        temp11   = (velocity(...
            t >= floor(timeLight(idxLightsOn(ROI,i))-5) &...  %% 30 seconds before
            t <= floor(timeLight(idxLightsOn(ROI,i))-1) ));
        
        temp12   = (velocity(...
            t >= floor(timeLight(idxLightsOn(ROI,i))) &...
            t <= floor(timeLight(idxLightsOff(ROI,i+1))+284) )); %% til ten seconds after
        
        T11 = reshape(temp11,[1,5]);
        T12 = interp1(1:length(temp12),temp12,(1:1:295));
        
        temp_total1=[T11,T12];
        tempMat4{i-4,2}(ROI,1:size(temp_total1,2)) = temp_total1;
        
        %% for DVV_trad
        temp3   = (DVV(...
            t >= floor(timeLight(idxLightsOn(ROI,i))-5) &...  %% ten seconds before
            t <= floor(timeLight(idxLightsOn(ROI,i))-1) ));
        
        temp4   = (DVV(...
            t >= floor(timeLight(idxLightsOn(ROI,i))) &...
            t <= floor(timeLight(idxLightsOff(ROI,i+1))+284) )); %% til ten seconds after
        
        T13 = reshape(temp3,[1,5]);
        T14 = interp1(1:length(temp4),temp4,(1:1:295));
        
        temp_total3=[T13,T14];
        tempMat4{i-4,3}(ROI,1:size(temp_total3,2)) = temp_total3;
        
       %% for Burst duration 
       temp5   = (BurstDur(...
            t >= floor(timeLight(idxLightsOn(ROI,i))-5) &...  %% ten seconds before
            t <= floor(timeLight(idxLightsOn(ROI,i))-1) ));
        
        temp6   = (BurstDur(...
            t >= floor(timeLight(idxLightsOn(ROI,i))) &...
            t <= floor(timeLight(idxLightsOff(ROI,i+1))+284) )); %% til ten seconds after
        
        T15 = reshape(temp5,[1,5]);
        T16 = interp1(1:length(temp6),temp6,(1:1:295));
        
        temp_total8=[T15,T16];
        tempMat4{i-4,4}(ROI,1:size(temp_total8,2)) = temp_total8;
        
        %% For binary burst response
        
         temp7   = (BurstBin(...
            t >= floor(timeLight(idxLightsOn(ROI,i))-5) &...  %% ten seconds before
            t <= floor(timeLight(idxLightsOn(ROI,i))-1) ));
        
        temp8   = (BurstBin(...
            t >= floor(timeLight(idxLightsOn(ROI,i))) &...
            t <= floor(timeLight(idxLightsOff(ROI,i+1))+284) )); %% til ten seconds after
        
        T17 = reshape(temp7,[1,5]);
        T18 = interp1(1:length(temp8),temp8,(1:1:295));
        
        temp_total8=[T17,T18];
        tempMat4{i-4,5}(ROI,1:size(temp_total8,2)) = temp_total8;
        
        %% For 2.43 Hz binned velocity data
        temp9   = (binnedVel_2_43Hz(...
            t2 >= floor(timeLight(idxLightsOn(ROI,i))-5) &...  %% ten seconds before
            t2 < floor(timeLight(idxLightsOn(ROI,i)))));
        
        temp10   = (binnedVel_2_43Hz(...
            t2 >= floor(timeLight(idxLightsOn(ROI,i))) &...
            t2 <= floor(timeLight(idxLightsOn(ROI,i))+284))); %% til ten seconds after
        
        T19 = interp1(1:length(temp9),temp9,1:1:12);
        T20 = interp1(1:length(temp10),temp10,1:1:715);
        
        temp_total9=[T19,T20];
        tempMat4{i-4,6}(ROI,1:size(temp_total9,2)) = temp_total9;
        
        %% empty variables
        temp1  = [];
        temp2  = [];
        temp11 = [];
        temp12 = [];
        temp_total3 = [];
        
        
    end
end
% make cell with arrays sorted for treatment group

tempMat5 = cell (5,6);
for i=1:5 
    tempMat5{i,1} = tempMat4{i,1};
    tempMat5{i,2} = tempMat4{i,2}...
        (:,:); % velocity
    tempMat5{i,3} = tempMat4{i,3}...
        (:,:); % DVV_trad
    tempMat5{i,4} = tempMat4{i,4}...
        (:,:); % Burst duration
    tempMat5{i,5} = tempMat4{i,5}...
        (:,:); % Burst binary
    tempMat5{i,6} = tempMat4{i,6}...
        (:,:); % 2.43 Hz velocity data
end 

% plot heatmap



f15 = figure;
f15.WindowState = 'Maximized';

f15 = tiledlayout(5,2); % Requires R2019b or later
title(f15,'Heatmap of velocity for the 5min ISI')
f15.Padding = 'none';

for i=1:size(tempMat5,1)
    
    nexttile(i+(i-1))
    
    imagesc (tempMat5{i, 2}([groups{1,1:4}],:))
    title(['Stimulus num ' num2str(i)])
    
    colormap((hot))
    colorbar
    box off
    hold on
    
    
    nexttile(i+i)
    for j=1:length(groups)-2
    boundedline (1:size(tempMat5{1,6},2),...
        mean(tempMat5{i,6}(groups{1,j},:),'omitnan'),...
        std(tempMat5{i,6}(groups{1,j},:),[],'omitnan')/...
        sqrt(size(groups{1,j},2)),'alpha','cmap',C1(j,:))
    end 
    title(['Stimulus num ' num2str(i)])
    xlim([0 727])
    ylim([0 10])
    legend ({'','','','',name_groups{1,1:4}})
    hold off
end 


for f=1:length(formats)
saveas (f15, [folder_path_save,filesep,figures_subfolder,filesep,...
    fish_name,date_exp '_evokedBehaviour_V_5minISIs'  formats{1,f}]);
end 
%% ---------------------- Traces ----------------------
%% Plot represntative traces for each group for the 5 min ISI

tempMat6 = cell(5,3);
for i=5:9 % for the 5 min ISI
    tempMat6{i-4,1}= ['Stimulation number' num2str(i)];
    
    for ROI=1:nROIs
        t           = all_fish{ROI, 1}.t;
        timeLight   = all_fish{ROI, 1}.timestampLight;
        x           = all_fish{ROI, 1}.x; 
        y           = all_fish{ROI, 1}.y;% 
        
        
        %% x
        temp11   = (x(...
            t >= (timeLight(idxLightsOn(ROI,i))-5) &...  %% 30 seconds before
            t < (timeLight(idxLightsOn(ROI,i))) )- min(x));
        
        temp12   = (x(...
            t >= (timeLight(idxLightsOn(ROI,i))) &...
            t <= (timeLight(idxLightsOff(ROI,i+1))+284))-min(x)); %% til ten seconds after
        
        T11 = interp1(1:length(temp11),temp11,(1:1:150));
        T12 = interp1(1:length(temp12),temp12,(1:1:8822));
        
        temp_total1=[T11,T12];
        tempMat6{i-4,2}(ROI,1:size(temp_total1,2)) = temp_total1;
        
        %% y
        temp3   = (y(...
            t >= (timeLight(idxLightsOn(ROI,i))-5) &...  %% ten seconds before
            t < (timeLight(idxLightsOn(ROI,i)))) - min(y));
        
        temp4   = (y(...
            t >= (timeLight(idxLightsOn(ROI,i))) &...
            t <= (timeLight(idxLightsOff(ROI,i+1))+284))- min(y)); %% til ten seconds after
        
        T13 = interp1(1:length(temp3),temp3,(1:1:150));
        T14 = interp1(1:length(temp4),temp4,(1:1:8822));
        
        temp_total3=[T13,T14];
        tempMat6{i-4,3}(ROI,1:size(temp_total3,2)) = temp_total3;
        
        
        %% empty variables
        temp1  = [];
        temp2  = [];
        temp11 = [];
        temp12 = [];
        temp_total3 = [];
        
        
    end
end

% effects of smoothing 
%---------Script, commented ------effects_smoothingFunction_on_traces

f16 = figure;
f16.WindowState= 'Maximized';
f16 = tiledlayout(2,2);
title(f16,['Representative traces, Light' num2str(2)]) 
f16.Padding = 'none';
D = [18 18 25 43]; % fish in group 1, 2, 3, 4


for i= 1:length(groups)-1
    
    nexttile(i)
    if isempty(tempMat6{2,2})
%     rectangle('Position',[151 0 150 10]), hold on 
    else
%         rectangle('Position',[151 0 150 10]), hold on 
        plot( smooth(tempMat6{2,2}(groups{1,i}(D(i)),1:600),3),...
           smooth(tempMat6{2,3}(groups{1,i}(D(i)),1:600),3),...
           'Color', C1(i,:), 'LineWidth', 2), hold off
    end 
    
    title([name_groups(i), ['fish ' num2str(D(i))]])
    xlim([0 70])
    ylim([0 70])
    
    
    zlabel ('Time (1/30th s)')
    xlabel ('x')
    ylabel ('y')
    grid 'off'
   
    legend ({'Light' '' '' '' '' '' name_groups{1,i}})
end
 

for f=1:length(formats)
saveas (f16, [folder_path_save,filesep,figures_subfolder,filesep,...
    fish_name,date_exp '_Light_Trace_onePerGroup'  formats{1,f}]);
end 

%% quantify erratic behaviour as the sum of angles for the 5 min ISIs

% need to change the codes here, not finished, saved as angles_tryout_light

ang = cell (5,1);
% ang2 = ang;

for i=1:5
    for ROI =1:nROIs
    A =[tempMat6{i, 2}(ROI,1:600)',...
        tempMat6{i, 3}(ROI,1:600)'];
    B = [tempMat6{i, 2}(ROI,1:601)',...
        tempMat6{i, 3}(ROI,1:601)'];
    C = [tempMat6{i, 2}(ROI,1:602)',...
        tempMat6{i, 3}(ROI,1:602)'];
    
% If A, B, and C are three points in two-dimensional space defined by
% 1 x 2 coordinate row vectors, the angle
% ABC - that is, the angle between line segments AB and CB:

% Do not change 
    
    
    for j=1:length(A)
    AB = A(j,:)-B(j+1,:);
    CB = C(j+2,:)-B(j+1,:);
    if atan2((det([AB;CB])),dot(AB,CB))<0 % Angle in radians
    ang{i,1}(ROI,j) = pi+ atan2((det([AB;CB])),dot(AB,CB)); % left turns 
    elseif atan2((det([AB;CB])),dot(AB,CB))>0 
    ang{i,1}(ROI,j) = -pi+ atan2((det([AB;CB])),dot(AB,CB)); % right turns
    else 
    ang{i,1}(ROI,j) = atan2((det([AB;CB])),dot(AB,CB)); % no-changes
    end 
    end
     
    end
    ang{i,1}(ROI,:) = abs(smooth(ang{i,1}(ROI,:),12));                             % smoothed, 2.43 Hz moving filter
%     ang2{i,1}(ROI,:)= (ang{i,1}(ROI,:)-mean(ang{i,1}(ROI,1:149),'omitnan'));
 
end

 
A = nan(5,600);                                                           
MuAng = nan(nROIs,600);                                                          
                                                                                 
for ROI=1:nROIs                                                                  
for i=1:5                                                                        
A(i,:) = (ang{i, 1}(ROI,:));                                                 
end                                                                              
MuAng(ROI,:) = mean(abs(A),1,'omitnan');                                                    
end        

f23= figure;
f23.WindowState = 'Maximized';
f23=tiledlayout(2,3);

for i=1:5
    nexttile
   
    boundedline(1:size(ang{i,1},2),...
            mean(abs(ang{i,1}(group1,:)),'omitnan'),...
            std(abs(ang{i,1}(group1,:)),[],1,'omitnan')./...
            sqrt(length(group1)),'alpha',...
            1:size(ang{i,1},2),...
            mean(abs(ang{i,1}(group2,:)),'omitnan'),...
            std(abs(ang{i,1}(group2,:)),[],1,'omitnan')./...
            sqrt(length(group2)),'alpha',...
            1:size(ang{i,1},2),...
            mean(abs(ang{i,1}(group3,:)),'omitnan'),...
            std(abs(ang{i,1}(group3,:)),[],1,'omitnan')./...
            sqrt(length(group3)),'alpha',...
            1:size(ang{i,1},2),...
            mean(abs(ang{i,1}(group4,:)),'omitnan'),...
            std(abs(ang{i,1}(group4,:)),[],1,'omitnan')./...
            sqrt(length(group4)),'alpha','cmap',C1) 
    hold on 

%     ylim([-.4 .4])
    hold off
end 

f24 = figure;
f24.WindowState = 'Maximized';
f24=tiledlayout(2,3);
% plot (tempMat6{1,2}(17,140:160),tempMat6{1,3}(17,140:160))
% xlim([35 70]), ylim([30 65])

for i=1
nexttile
boundedline(1:size(MuAng,2),...
        mean(MuAng(group1,:),'omitnan'),...
        std(MuAng(group1,:),[],1,'omitnan')./...
        sqrt(length(group1)),'alpha',...
        1:size(MuAng,2),...
        mean(MuAng(group2,:),'omitnan'),...
        std(MuAng(group2,:),[],1,'omitnan')./...
        sqrt(length(group2)),'alpha',...
        1:size(MuAng,2),...
        mean(MuAng(group3,:),'omitnan'),...
        std(MuAng(group3,:),[],1,'omitnan')./...
        sqrt(length(group3)),'alpha',...
        1:size(MuAng,2),...
        mean(MuAng(group4,:),'omitnan'),...
        std(MuAng(group4,:),[],1,'omitnan')./...
        sqrt(length(group4)),'alpha','cmap',C1) 
        
end


for f=1:length(formats)
    saveas (f23, [folder_path_save,filesep,figures_subfolder,filesep,...
    fish_name,date_exp '_angles_erraticness_raw'  formats{1,f}]);
    
    saveas (f24, [folder_path_save,filesep,figures_subfolder,filesep,...
    fish_name,date_exp '_angles_erraticness_change'  formats{1,f}]);
end

%% Peak analysis per stimulus per fish to find
%  1) amplitude of the response
%  2) latency of the response
%  3) width of the peak, 'WidthRefernce', 'halfHight', which uses the
%     amplitude to define the width of the response signal

%  The code is defined to search from the last bin, which has no lights on
%  til th 5th bin with the lights on. E.g. 6 bins in total. The
%  corresponding with the off response

peakAN_perFish_plotsPerGroup_4G

%% characterize the last five stimuli 
aj_lastFiveStim

%% calculate sensitivity and spesificity for prediction of genotype/ 
% treatmentgroup from light reaction

% ROC_analysis_dvv_trad %% dvv traditional
%ROC_analysis_2_43Hz_velocityData %% velocity data 2.43 Hz


