%% This script calculates the proportion of each group with a definitive
% response to the light conditions.

% On response is defined as any bin of V within the 5 seconds of the lights
% on, where V>= mean(overall velocities) + 2SD.
%
% Off response is defined as any V, V>= mean(overall velocities) + 2SD,
% within the five seconds of lights off.
%
% "Inhibition" is defined as all velocitie:
% V<= mean(overall velocities) - 2SD.
%
% Any responses in between is defined as non-responding.

if strcmp(fish_name, 'PTZ') || strcmp(fish_name,'PTZ_short')
    red = 1;
else
    red =2;
end 

ResponderCell = cell (size(idxLightsOn,2),2);
respT = cell(size(idxLightsOn,2),1);

for i=1:size(idxLightsOn,2)
respT{i,1} = tempMat{i,6} (:,1:12);
end 

for i=1:size(idxLightsOn,2)
posResponseThreshold(i,1) = mean (respT{i,1},...
    'all', 'omitnan')+ 2*std(respT{i,1},...
    [],'all','omitnan');
end 

for i=1:size(idxLightsOn,2)
negResponseThreshold(i,1) = mean (respT{i,1},...
    'all', 'omitnan')- 2*std(respT{i,1},...
    [],'all','omitnan');
end 

for i = 1:size(idxLightsOn,2)
    for ROI=1:nROIs
        if  strcmp(char(group_category(ROI,1)),('Excluded'))
            ResponderCell{i,2}(ROI,1) = nan; % Excluded group
            
        else
            if any((tempMat{i,6}(ROI,13:24)- mean(tempMat{i,6}(ROI,1:12),2,...
                    'omitnan'))...
                    >= posResponseThreshold(i,1))
                ResponderCell{i,2}(ROI,1) =1 ; % responders
                
            elseif any((tempMat{i,6}(ROI,13:24))- mean(tempMat{i,6}(ROI,1:12))...
                    <= negResponseThreshold(i,1))
                ResponderCell{i,2}(ROI,1) = -1 ; % inhibtion
                
            else
                ResponderCell{i,2}(ROI,1) =0 ; % non-responder
            end
        end
    end
    
end



ResponderCellR = cell(size(idxLightsOn,2),4);

for i=1:size(idxLightsOn,2)
    ResponderCellR{i,1}(:,:)= ResponderCell{i,1}(:,:);
    if strcmp(fish_name,'PTZ') || strcmp(fish_name,'PTZ_short')
        for j=1:length(groups)-red
            ResponderCellR{i,2}(1,j)=sum(ResponderCell{i,2}(groups{1,j})>0)/...
                length(groups{1,j}); %% proportion of fish "activated"
            ResponderCellR{i,3}(1,j)=sum(ResponderCell{i,2}(groups{1,j})==0)/...
                length(groups{1,j}); %% proportion of fish "non-responding"
            ResponderCellR{i,4}(1,j)=sum(ResponderCell{i,2}(groups{1,j})<0)/...
                length(groups{1,j}); %% proportion of fish "freezing"
        end
    else
        for j=1:length(groups)-2
            ResponderCellR{i,2}(1,j)=sum(ResponderCell{i,2}(groups{1,j})>0)/...
                length(groups{1,j}); %% proportion of fish "activated"
            ResponderCellR{i,3}(1,j)=sum(ResponderCell{i,2}(groups{1,j})==0)/...
                length(groups{1,j}); %% proportion of fish "non-responding"
            ResponderCellR{i,4}(1,j)=sum(ResponderCell{i,2}(groups{1,j})<0)/...
                length(groups{1,j}); %% proportion of fish "freezing"
        end
    end
end


%%
A=cell(1,size(idxLightsOn,2)/5);
B=cell(1,size(idxLightsOn,2)/5);
C=cell(1,size(idxLightsOn,2)/5);
D=cell(1,size(idxLightsOn,2)/5);

f8=figure;
f8.WindowState = 'Maximized';
f8 = tiledlayout(1,size(idxLightsOn,2)/5); % Requires R2019b or later
title(f8,(['ON respons. Average number of responders (+2SD)'...
    ', depressed (-2SD), and non-response (in between) ']))
ylabel(f8,'Proportion')
f8.Padding = 'none';

for i=1:size(idxLightsOn,2)/5
    A{1,i} =mean(vertcat(ResponderCellR{i*5-4:i*5,2}),'omitnan');
    B{1,i} =mean(vertcat(ResponderCellR{i*5-4:i*5,4}),'omitnan');
    C{1,i} =mean(vertcat(ResponderCellR{i*5-4:i*5,3}),'omitnan');
    for j=1:length(groups)-3
        
        alef = vertcat(ResponderCellR{i*5-4:i*5,2});
        be   = vertcat(ResponderCellR{i*5-4:i*5,4});
        pe   = vertcat(ResponderCellR{i*5-4:i*5,3}); 
        if strcmp(fish_name,'PTZ')||strcmp(fish_name,'PTZ_short')
        [~, D{1,i}(1,j)] = ttest2(alef(:,1),alef(:,j+1));
        [~, D{2,i}(1,j)] = ttest2(be(:,1),be(:,j+1));
        [~, D{3,i}(1,j)] = ttest2(pe(:,1),pe(:,j+1));
        else 
        [~, D{1,i}(1,j)] = ttest2(alef(:,j),alef(:,3));
        [~, D{2,i}(1,j)] = ttest2(be(:,j),be(:,3));
        [~, D{3,i}(1,j)] = ttest2(pe(:,j),pe(:,3));
        end 
    end 
end
    Cd = [[220,220,220]/255;...
        [169,169,169]/255;[119,136,153]/255];
for i=1:size(idxLightsOn,2)/5
    
    nexttile
    ba= bar ([A{1,i}; B{1,i}; -C{1,i}]','stacked','FaceColor','flat'); hold on
    ba(1).CData = Cd(1,:);
    ba(2).CData = Cd(2,:);
    ba(3).CData = Cd(3,:);
    %     errorbar(A{1,i},std(vertcat(ResponderCellR{i*5-4:i*5,2})),'--o')
    %     errorbar(B{1,i},std(vertcat(ResponderCellR{i*5-4:i*5,4})),'--o')
    %     errorbar(C{1,i},std(vertcat(ResponderCellR{i*5-4:i*5,3})),'--o')
    text(.2,-.85,num2str((D{1,i})'),'Color', [220,220,220]/255)
    text(1.2,-.85,num2str((D{2,i})'),'Color', [169,169,169]/255)
    text(2.2,-.85,num2str((D{3,i})'),'Color', [119,136,153]/255)
    
    hold off
   
    box off
    set(gca,'TickDir','out')
    %     title (tempCell{i,1})
    ylim([-1 1])
    legend ({'Activated', 'Inhibited', 'Non-responding'})
end
 
formats = {'.fig' '.jpg' '.svg'};
for f= 1:length(formats)
    saveas (f8, [folder_path_save,filesep,figures_subfolder,...
        filesep,fish_name,date_exp...
        '_earlyResponders_Freezers_V243_allGroups_allISI'...
        formats{1,f}]);
end


%% late response


ResponderCell3 = cell (size(idxLightsOn,2),2);
for i = 1:size(idxLightsOn,2)
    for ROI=1:nROIs
        if  strcmp(char(group_category(ROI,1)),('Excluded'))
            ResponderCell3{i,2}(ROI,1) = nan; % Excluded group
            
        else
            if any((tempMat{i,6}(ROI,25:36)- mean(tempMat{i,6}(ROI,1:12),2,...
                    'omitnan'))...
                    >= posResponseThreshold(i,1))
                ResponderCell3{i,2}(ROI,1) =1 ; % responders
                
            elseif any((tempMat{i,6}(ROI,25:36))- mean(tempMat{i,6}(ROI,1:12))...
                    <= negResponseThreshold(i,1))
                ResponderCell3{i,2}(ROI,1) = -1 ; % inhibtion
                
            else
                ResponderCell3{i,2}(ROI,1) =0 ; % non-responder
            end
        end
    end
    
end

ResponderCell3R = cell(size(idxLightsOn,2),4);
for i=1:size(idxLightsOn,2)
    ResponderCell3R{i,1}(:,:)= ResponderCell3{i,1}(:,:);
    if strcmp(fish_name,'PTZ') || strcmp(fish_name,'PTZ_short')
        for j=1:length(groups)-1
            ResponderCell3R{i,2}(1,j)=sum(ResponderCell3{i,2}(groups{1,j})>0)/...
                length(groups{1,j}); %% proportion of fish "activated"
            ResponderCell3R{i,3}(1,j)=sum(ResponderCell3{i,2}(groups{1,j})==0)/...
                length(groups{1,j}); %% proportion of fish "non-responding"
            ResponderCell3R{i,4}(1,j)=sum(ResponderCell3{i,2}(groups{1,j})<0)/...
                length(groups{1,j}); %% proportion of fish "freezing"
        end
    else
        for j=1:length(groups)-2
            ResponderCell3R{i,2}(1,j)=sum(ResponderCell3{i,2}(groups{1,j})>0)/...
                length(groups{1,j}); %% proportion of fish "activated"
            ResponderCell3R{i,3}(1,j)=sum(ResponderCell3{i,2}(groups{1,j})==0)/...
                length(groups{1,j}); %% proportion of fish "non-responding"
            ResponderCell3R{i,4}(1,j)=sum(ResponderCell3{i,2}(groups{1,j})<0)/...
                length(groups{1,j}); %% proportion of fish "freezing"
        end
    end
end


%%
A=cell(1,size(idxLightsOn,2)/5);
B=cell(1,size(idxLightsOn,2)/5);
C=cell(1,size(idxLightsOn,2)/5);
D=cell(1,size(idxLightsOn,2)/5);

f9=figure;
f9.WindowState = 'Maximized';
f9 = tiledlayout(1,size(idxLightsOn,2)/5); % Requires R2019b or later
title(f9,(['ON respons - late. Average number of responders (+2SD)'...
    ', depressed (-2SD), and non-response (in between) ']))
ylabel(f9,'Proportion')
f9.Padding = 'none';

for i=1:size(idxLightsOn,2)/5
    A{1,i} =mean(vertcat(ResponderCell3R{i*5-4:i*5,2}),'omitnan');
    B{1,i} =mean(vertcat(ResponderCell3R{i*5-4:i*5,4}),'omitnan');
    C{1,i} =mean(vertcat(ResponderCell3R{i*5-4:i*5,3}),'omitnan');
    for j=1:length(groups)-2
        
        alef = vertcat(ResponderCellR{i*5-4:i*5,2});
        be   = vertcat(ResponderCellR{i*5-4:i*5,4});
        pe   = vertcat(ResponderCellR{i*5-4:i*5,3}); 
        if strcmp(fish_name,'PTZ')||strcmp(fish_name,'PTZ_short')
        [~, D{1,i}(1,j)] = ttest2(alef(:,1),alef(:,j+1));
        [~, D{2,i}(1,j)] = ttest2(be(:,1),be(:,j+1));
        [~, D{3,i}(1,j)] = ttest2(pe(:,1),pe(:,j+1));
        else 
        [~, D{1,i}(1,j)] = ttest2(alef(:,j),alef(:,3));
        [~, D{2,i}(1,j)] = ttest2(be(:,j),be(:,3));
        [~, D{3,i}(1,j)] = ttest2(pe(:,j),pe(:,3));
        end 
    end 
end

Cd = [[220,220,220]/255;...
        [169,169,169]/255;[119,136,153]/255];
    
for i=1:size(idxLightsOn,2)/5
    
    nexttile
    %     pie ([A{1,i}(1,g) B{1,i}(1,g) C{1,i}(1,g)]); hold on
    ba = bar ([A{1,i}; B{1,i}; -C{1,i}]','stacked','FaceColor','flat'); 
    hold on
    ba(1).CData = Cd(1,:);
    ba(2).CData = Cd(2,:);
    ba(3).CData = Cd(3,:);
    text(.2,-.85,num2str((D{1,i})'),'Color', [220,220,220]/255)
    text(1.2,-.85,num2str((D{2,i})'),'Color', [169,169,169]/255)
    text(2.2,-.85,num2str((D{3,i})'),'Color', [119,136,153]/255)
    
    hold off
    
    box off
    set(gca,'TickDir','out')
    %     title (tempCell{i,1})
    ylim([-1 1])
    legend ({'Activated', 'Inhibited', 'Non-responding'})
end

for f= 1:length(formats)
    saveas (f9, [folder_path_save,filesep,figures_subfolder,...
        filesep,fish_name,date_exp...
        '_lateResponders_Freezers_V243_allGroups_allISI'...
        formats{1,f}]);
end

%% OFF response
ResponderCellOFF = cell (size(idxLightsOn,2),2);
for i = 1:size(idxLightsOn,2)
    for ROI=1:nROIs
        if  strcmp(char(group_category(ROI,1)),('Excluded'))
            ResponderCellOFF{i,2}(ROI,1) = nan; % Excluded group
            
        else
            if any((tempMat{i,6}(ROI,37:48)- mean(tempMat{i,6}(ROI,1:12),2,...
                    'omitnan'))...
                    >= posResponseThreshold(i,1))
                ResponderCellOFF{i,2}(ROI,1) =1 ; % responders
                
            elseif any((tempMat{i,6}(ROI,37:48))- mean(tempMat{i,6}(ROI,1:12))...
                    <= negResponseThreshold(i,1))
                ResponderCellOFF{i,2}(ROI,1) = -1 ; % inhibtion
                
            else
                ResponderCellOFF{i,2}(ROI,1) =0 ; % non-responder
            end
        end
    end
    
end

ResponderCellOFFR = cell(size(idxLightsOn,2),4);
for i=1:size(idxLightsOn,2)
    ResponderCellOFFR{i,1}(:,:)= ResponderCellOFF{i,1}(:,:);
    if strcmp(fish_name,'PTZ') || strcmp(fish_name,'PTZ_short')
        for j=1:length(groups)-1
            ResponderCellOFFR{i,2}(1,j)=sum(ResponderCellOFF{i,2}(groups{1,j})>0)/...
                length(groups{1,j}); %% proportion of fish "activated"
            ResponderCellOFFR{i,3}(1,j)=sum(ResponderCellOFF{i,2}(groups{1,j})==0)/...
                length(groups{1,j}); %% proportion of fish "non-responding"
            ResponderCellOFFR{i,4}(1,j)=sum(ResponderCellOFF{i,2}(groups{1,j})<0)/...
                length(groups{1,j}); %% proportion of fish "freezing"
        end
    else
        for j=1:length(groups)-2
            ResponderCellOFFR{i,2}(1,j)=sum(ResponderCellOFF{i,2}(groups{1,j})>0)/...
                length(groups{1,j}); %% proportion of fish "activated"
            ResponderCellOFFR{i,3}(1,j)=sum(ResponderCellOFF{i,2}(groups{1,j})==0)/...
                length(groups{1,j}); %% proportion of fish "non-responding"
            ResponderCellOFFR{i,4}(1,j)=sum(ResponderCellOFF{i,2}(groups{1,j})<0)/...
                length(groups{1,j}); %% proportion of fish "freezing"
        end
    end
end


%%
A=cell(1,size(idxLightsOn,2)/5);
B=cell(1,size(idxLightsOn,2)/5);
C=cell(1,size(idxLightsOn,2)/5);
D=cell(1,size(idxLightsOn,2)/5);

f10=figure;
f10.WindowState = 'Maximized';
f10 = tiledlayout(1,size(idxLightsOn,2)/5); % Requires R2019b or later
title(f10,(['Off respons. Average number of responders (+2SD)'...
    ', depressed (-2SD), and non-response (in between) ']))
ylabel(f10,'Proportion')
f10.Padding = 'none';

for i=1:size(idxLightsOn,2)/5
    A{1,i} =mean(vertcat(ResponderCellOFFR{i*5-4:i*5,2}),'omitnan');
    B{1,i} =mean(vertcat(ResponderCellOFFR{i*5-4:i*5,4}),'omitnan');
    C{1,i} =mean(vertcat(ResponderCellOFFR{i*5-4:i*5,3}),'omitnan');
    for j=1:length(groups)-2
        
        alef = vertcat(ResponderCellR{i*5-4:i*5,2});
        be   = vertcat(ResponderCellR{i*5-4:i*5,4});
        pe   = vertcat(ResponderCellR{i*5-4:i*5,3}); 
        if strcmp(fish_name,'PTZ')||strcmp(fish_name,'PTZ_short')
        [~, D{1,i}(1,j)] = ttest2(alef(:,1),alef(:,j+1));
        [~, D{2,i}(1,j)] = ttest2(be(:,1),be(:,j+1));
        [~, D{3,i}(1,j)] = ttest2(pe(:,1),pe(:,j+1));
        else 
        [~, D{1,i}(1,j)] = ttest2(alef(:,j),alef(:,3));
        [~, D{2,i}(1,j)] = ttest2(be(:,j),be(:,3));
        [~, D{3,i}(1,j)] = ttest2(pe(:,j),pe(:,3));
        end 
    end 
end
Cd = [[220,220,220]/255;...
        [169,169,169]/255;[119,136,153]/255];
    
for i=1:size(idxLightsOn,2)/5
    
    nexttile
    %     pie ([A{1,i}(1,g) B{1,i}(1,g) C{1,i}(1,g)]); hold on
    ba = bar ([A{1,i}; B{1,i}; -C{1,i}]','stacked','FaceColor','flat'); 
    hold on
    ba(1).CData = Cd(1,:);
    ba(2).CData = Cd(2,:);
    ba(3).CData = Cd(3,:);
    %     errorbar(A{1,i},std(vertcat(ResponderCellOFFR{i*5-4:i*5,2})),'--o')
    %     errorbar(B{1,i},std(vertcat(ResponderCellOFFR{i*5-4:i*5,4})),'--o')
    %     errorbar(C{1,i},std(vertcat(ResponderCellOFFR{i*5-4:i*5,3})),'--o')
    text(.2,-.85,num2str((D{1,i})'),'Color', [220,220,220]/255)
    text(1.2,-.85,num2str((D{2,i})'),'Color', [169,169,169]/255)
    text(2.2,-.85,num2str((D{3,i})'),'Color', [119,136,153]/255)
    hold off
    
    box off
    set(gca,'TickDir','out')
    %     title (tempCell{i,1})
    ylim([-1 1])
    legend ({'Activated', 'Inhibited', 'Non-responding'})
end

for f= 1:length(formats)
    saveas (f10, [folder_path_save,filesep,figures_subfolder,...
        filesep,fish_name,date_exp...
        '_OffResponders_Freezers_V243_allGroups_allISI'...
        formats{1,f}]);
end
