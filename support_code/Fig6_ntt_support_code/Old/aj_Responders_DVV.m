%% number of responders

% Early on response, any activity 50 % of the bin whithin the first 3 sec.

ResponderCell = cell (size(idxLightsOn,2),2);

for i = 1:size(idxLightsOn,2)
    ResponderCell{i,1}(:,:)= tempMat{i,1}(:,:);
    for ROI = 1:nROIs
        if any((tempMat{i,3}(ROI,6:10)) >= 50)
            ResponderCell{i,2}(ROI,1) = 1;
        elseif all((tempMat{i,3}(ROI,6:10) )<50 &...
                (tempMat{i,3}(ROI,6:10)) >=0)
            ResponderCell{i,2}(ROI,1) = 0;
        elseif all((tempMat{i,3}(ROI,6:10) )<0)
            ResponderCell{i,2}(ROI,1) = -1;
        elseif all(isnan(tempMat{i,3}(ROI,6:10) ))
            ResponderCell{i,2}(ROI,1) = nan;
        else 
            ResponderCell{i,2}(ROI,1) = nan;
        end
    end
end

ResponderCellR = cell(size(idxLightsOn,2),4);

for i=1:size(idxLightsOn,2)
    ResponderCellR{i,1}(:,:)= ResponderCell{i,1}(:,:);
    
    for j=1:length(groups)-1
        ResponderCellR{i,2}(1,j) = sum(ResponderCell{i,2}(groups{1,j})>0)...
            /size(groups{1,j},2); 
        ResponderCellR{i,3}(1,j) = sum(ResponderCell{i,2}(groups{1,j})==0)...
            /size(groups{1,j},2); 
        ResponderCellR{i,4}(1,j) = sum(ResponderCell{i,2}(groups{1,j})<0)...
            /size(groups{1,j},2); 
    end 
end


A=cell(1,size(idxLightsOn,2)/5);
B=cell(1,size(idxLightsOn,2)/5);

f8=figure;
f8.WindowState = 'Maximized';    
f8 = tiledlayout(1,size(idxLightsOn,2)/5); % Requires R2019b or later
title(f8,(['Early on response. Average number of responders (DVV>=50) '...
           'and depressed DVV<0']))
ylabel(f8,'DVV')
f8.Padding = 'none';

for i=1:size(idxLightsOn,2)/5
    A{1,i}=mean(vertcat(ResponderCellR{i*5-4:i*5,2}),'omitnan');
    B{1,i}=-mean(vertcat(ResponderCellR{i*5-4:i*5,4}),'omitnan');
    
    nexttile
    bar (A{1,i}), hold on 
    errorbar(A{1,i},std(vertcat(ResponderCellR{i*5-4:i*5,2})),'--o') 
    bar (B{1,i})
    errorbar(B{1,i},std(vertcat(ResponderCellR{i*5-4:i*5,4})),'--o')
    hold off
    
    box off
    ylabel ('Number freezing and number activated')
    set(gca,'TickDir','out')
    title (tempCell{i,1})
end 
for f=1:length(formats)
saveas (f8, [folder_path_save,filesep,figures_subfolder,filesep,...
    fish_name,date_exp...
    '_earlyResponders_Freezers_DVV_trad_S_allGroups_5ISI'  formats{1,f}]);
end 

% late response


ResponderCell3 = cell (size(idxLightsOn,2),2);

for i = 1:size(idxLightsOn,2)
    ResponderCell3{i,1}(:,:)= tempMat{i,1}(:,:);
    for ROI = 1:nROIs
        if any((tempMat{i,3}(ROI,11:15)) >= 50)
            ResponderCell3{i,2}(ROI,1) = 1;
        elseif all((tempMat{i,3}(ROI,11:15) )<50 &...
                (tempMat{i,3}(ROI,11:15)) >=0)
            ResponderCell3{i,2}(ROI,1) = 0;
        elseif all((tempMat{i,3}(ROI,11:15) )<0)
            ResponderCell3{i,2}(ROI,1) = -1;
        elseif all(isnan(tempMat{i,3}(ROI,11:15) ))
            ResponderCell3{i,2}(ROI,1) = nan;
        else 
            ResponderCell3{i,2}(ROI,1) = nan;
        end
    end
end

ResponderCellR3 = cell(size(idxLightsOn,2),4);

for i=1:size(idxLightsOn,2)
    ResponderCellR3{i,1}(:,:)= ResponderCell3{i,1}(:,:);
    
    for j=1:length(groups)-1
        ResponderCellR3{i,2}(1,j)=sum(ResponderCell3{i,2}(groups{1,j})>0)...
            /size(groups{1,j},2); 
        ResponderCellR3{i,3}(1,j)=sum(ResponderCell3{i,2}(groups{1,j})==0)...
            /size(groups{1,j},2); 
        ResponderCellR3{i,4}(1,j)=sum(ResponderCell3{i,2}(groups{1,j})<0)...
            /size(groups{1,j},2); 
    end 
end


A=cell(1,5);
B=cell(1,5);

f10=figure;
f10.WindowState = 'Maximized';
f10 = tiledlayout(1,size(idxLightsOn,2)/5); % Requires R2019b or later
title(f10,(['Late light response. Average number of responders (DVV>=50)'...
           'and depressed DVV<0']))
ylabel(f10,'DVV')
f10.Padding = 'none';


for i=1:size(idxLightsOn,2)/5
    A{1,i}=mean(vertcat(ResponderCellR3{i*5-4:i*5,2}),'omitnan');
    B{1,i}=-mean(vertcat(ResponderCellR3{i*5-4:i*5,4}),'omitnan');
   
    nexttile
    bar (A{1,i}), hold on 
    errorbar(A{1,i},std(vertcat(ResponderCellR{i*5-4:i*5,2})),'--o') 
    bar (B{1,i})
    errorbar(B{1,i},std(vertcat(ResponderCellR{i*5-4:i*5,4})),'--o')
    hold off
    
    box off
    ylabel ('Number freezing and number activated')
    set(gca,'TickDir','out')
    title (tempCell{i,1})
end 
for f=1:length(formats)
saveas (f10, [folder_path_save,filesep,figures_subfolder,filesep,...
    fish_name,date_exp...
    '_lateResponders_Freezers_DVV_trad_S_allGroups' formats{1,f}]);
end 
%% number - off response

ResponderCell4 = cell (size(idxLightsOn,2),2);

for i = 1:size(idxLightsOn,2)
    ResponderCell4{i,1}(:,:)= tempMat{i,1}(:,:);
    for ROI = 1:nROIs
        if any((tempMat{i,3}(ROI,16:20)) >= 50)
            ResponderCell4{i,2}(ROI,1) = 1;
        elseif all((tempMat{i,3}(ROI,16:20) )<50 &...
                (tempMat{i,3}(ROI,16:20)) >=0)
            ResponderCell4{i,2}(ROI,1) = 0;
        elseif all((tempMat{i,3}(ROI,16:20) )<0)
            ResponderCell4{i,2}(ROI,1) = -1;
        elseif all(isnan(tempMat{i,3}(ROI,16:20) ))
            ResponderCell4{i,2}(ROI,1) = nan;
        else 
            ResponderCell4{i,2}(ROI,1) = nan;
        end
    end
end

ResponderCellR4 = cell(size(idxLightsOn,2),4);

for i=1:size(idxLightsOn,2)
    ResponderCellR4{i,1}(:,:)= ResponderCell4{i,1}(:,:);
    
    for j=1:length(groups)-1
        ResponderCellR4{i,2}(1,j)=sum(ResponderCell4{i,2}(groups{1,j})>0)...
            /size(groups{1,j},2); 
        ResponderCellR4{i,3}(1,j)=sum(ResponderCell4{i,2}(groups{1,j})==0)...
            /size(groups{1,j},2);
        ResponderCellR4{i,4}(1,j)=sum(ResponderCell4{i,2}(groups{1,j})<0)...
            /size(groups{1,j},2);
    end 
end

A=cell(1,5);
B=cell(1,5);

f15=figure;
f15.WindowState = 'Maximized';
f15 = tiledlayout(1,size(idxLightsOn,2)/5); % Requires R2019b or later
title(f15,(['Off response. Average number of responders (DVV>=50)'...
           'and depressed DVV<0']))
ylabel(f15,'DVV')
f15.Padding = 'none';

for i=1:size(idxLightsOn,2)/5
    A{1,i} = mean(vertcat(ResponderCellR4{i*5-4:i*5,2}),'omitnan');
    B{1,i} = -mean(vertcat(ResponderCellR4{i*5-4:i*5,4}),'omitnan');
    
    nexttile
    bar (A{1,i}), hold on 
    errorbar(A{1,i},std(vertcat(ResponderCellR4{i*5-4:i*5,2}))...
        ,'--o') 
    bar (B{1,i})
    errorbar(B{1,i},std(vertcat(ResponderCellR4{i*5-4:i*5,4}))...
        ,'--o')
    hold off
    
    box off
    ylabel ('Number freezing and number activated')
    set(gca,'TickDir','out')
    title (tempCell{i,1})
end 
for f=1:length (formats)
saveas (f15, [folder_path_save,filesep,figures_subfolder,filesep,...
    fish_name,date_exp...
    '_offResponders_Freezers_DVV_trad_S_allGroups'  formats{1,f}]);
end
