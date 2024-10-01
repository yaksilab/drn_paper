onResponseDVV_trad = cell(size(idxLightsOn,2)/5,2);

for i=1:size(idxLightsOn,2)/5
    onResponseDVV_trad{i,1} = tempCell3{i,1};
    for ROI = 1:nROIs
        onResponseDVV_trad{i,2}(ROI,1) = (tempCell3{i,2}(ROI,5));
        onResponseDVV_trad{i,2}(ROI,2) = max (tempCell3{i,2}(ROI,6:10));
    end 
end 

%% light off response: mean DVV change per fish per ISI
offResponseDVV_trad = cell(size(idxLightsOn,2)/5,2);

for i=1:size(idxLightsOn,2)/5
    offResponseDVV_trad{i,1} = tempCell3{i,1};
    for ROI = 1:nROIs
        offResponseDVV_trad{i,2}(ROI,1) = (tempCell3{i,2}(ROI,15));
        offResponseDVV_trad{i,2}(ROI,2) = max (tempCell3{i,2}(ROI,16:19));
    end 
end

%% plot response in group comparison of lights on and off response

f11=figure; 
f11.WindowState='Maximized';


sgtitle ('In group comparison of ON and OFF response (bin 5 before vs max dff after, and 16 vs after stim) whithin 3 sec')
 
A =  nan(size(idxLightsOn,2)/5,4);
B =  nan(size(idxLightsOn,2)/5,4); 

for i=1:size(idxLightsOn,2)/5
    %% on response
    subplot (2,size(idxLightsOn,2)/5,i)
    for j=1:length(groups)-1
        plot ([1:2],mean(onResponseDVV_trad{i,2}(groups{1,j},1:2),'omitnan'),...
            'LineWidth',1, 'Color', C1(j,:))
        
        errorbar (1:2,mean(onResponseDVV_trad{i,2}(groups{1,j},1:2),'omitnan'),...
            std(onResponseDVV_trad{i,2}(groups{1,j},1:2))./sqrt(size(groups{1,j},2)),...
            'Color', C1(j,:),'LineWidth', 2), hold on 
        
%         D=repmat(C1(j,:),[2*length(groups{1,j}) 1]);
        
%         scatter (vertcat(ones(1,length(groups{1,j})),2*ones(1,length(groups{1,j})))',...
%             (onResponseDVV_trad{i,2}(groups{1,j},1:2)))
    end 
    xlim([0 2.5])

% in group comparison, alternatively one can do a paired T-test, 
% because N(groups)>30 and these are mean values, 
% thus normality can be asumed

    for j= 1:length(groups)-2
        A(i,j)=signrank(onResponseDVV_trad{i,2}(groups{1,j},1),onResponseDVV_trad{i,2}(groups{j},2));
    end 
    
    box 'off'
    if i==5
       text(0.2,6, num2str(((A(i,:)'))))
    elseif i==4
        text(0.2,100, num2str(((A(i,:)'))))
    else
        text(0.2,200, num2str(((A(i,:)'))))
    end 
    ylabel ('Mean Dvv (%) DL transition')
    
    %% off response
    subplot (2,size(idxLightsOn,2)/5,i+size(idxLightsOn,2)/5)
    
    for j=1:length(groups)-1
        plot ([1:2],mean(offResponseDVV_trad{i,2}(groups{1,j},1:2)),...
            'LineWidth',1, 'Color', C1(j,:));
        
        errorbar (1:2,mean(offResponseDVV_trad{i,2}(groups{1,j},1:2)),...
            std(offResponseDVV_trad{i,2}(groups{1,j},1:2))./sqrt(size(groups{1,j},2)),...
            'Color', C1(j,:),'LineWidth', 2), hold on
    end
    xlim([0 2.5])
    

    % in group comparison, alternatively one can do a paired T-test, 
    % because N(groups)>30 and these are mean values, thus normality 
    % can be asumed
    
    for j= 1:length(groups)-1
        B(i,j)=signrank(offResponseDVV_trad{i,2}(groups{1,j},1),offResponseDVV_trad{i,2}(groups{j},2));
    end 
    
    box 'off'
    if i==5
       text(0.2,6, num2str(((B(i,:)'))))
    elseif i==4 || i==3
        text(0.2,45, num2str(((B(i,:)'))))
    else
        text(0.2,150, num2str(((B(i,:)'))))
    end 
    ylabel ('Mean Dvv (%) LD transition')
    
end 

saveas (f11, [folder_path_save,filesep,figures_subfolder,filesep,fish_name,date_exp '_evokedBehaviour_DVV_trad_inGroupComp'  '.fig']);
saveas (f11, [folder_path_save,filesep,figures_subfolder,filesep,fish_name,date_exp '_evokedBehaviour_DVV_trad_inGroupComp'  '.jpg']);
saveas (f11, [folder_path_save,filesep,figures_subfolder,filesep,fish_name,date_exp '_evokedBehaviour_DVV_trad_inGroupComp'  '.svg']);

%% between group comparison in change in DVV for lights on and off

onResponseDVV_trad_diff = cell(size(idxLightsOn,2)/5,2); %%%%%%%%%%%%%%%% WHAT AM I PLOTTING

for i=1:size(idxLightsOn,2)/5
    onResponseDVV_trad_diff{i,1} = tempCell3{i,1};
    for ROI = 1:nROIs
        onResponseDVV_trad_diff{i,2}(ROI,1) = mean (diff (onResponseDVV_trad{i,2}(ROI,:)));
    end
end

offResponseDVV_trad_diff = cell(size(idxLightsOn,2)/5,2);

for i=1:size(idxLightsOn,2)/5
    offResponseDVV_trad_diff{i,1} = tempCell3{i,1};
    for ROI = 1:nROIs
        offResponseDVV_trad_diff{i,2}(ROI,1) = mean (diff (offResponseDVV_trad{i,2}(ROI,:)));
    end
end

f12=figure;
f12.WindowState='Maximized';


sgtitle ('Between group comparison of ON and OFF response (bin 5 before vs max dff after, and 16 vs after stim) whithin 3 sec')
for i=1:size(idxLightsOn,2)/5
    %% on response
    subplot (2,size(idxLightsOn,2)/5,i)
    boxplot (onResponseDVV_trad_diff{i,2}(:,1), group_category,'Colors', C1,'OutlierSize',.2),
    
    
    box 'off'
    ylabel ('Mean Dvv diff (%) DL transition')
    ylim([-200 4500])
    %% test 
    A =  nan(size(idxLightsOn,2)/5,3); % in group comparison, alternatively one can do a paired T-test, because N(groups)>30 and these are mean values, thus normality can be asumed
    for j= 1:3
        A(i,j)=ranksum(onResponseDVV_trad_diff{i,2}(groups{1,1},1),onResponseDVV_trad_diff{i,2}(groups{1,j+1},1));
    end
    text(4.3,100, num2str(((A(i,:)'))))
    
    %% off response
    subplot (2,size(idxLightsOn,2)/5,i+4)
    boxplot (offResponseDVV_trad_diff{i,2}(:,1), group_category,'Colors', C1,'OutlierSize',.2),
    
    box 'off'
    ylabel ('Mean Dvv diff (%) LD transition')
    ylim([-700 1500])
    
    %% test 
    
    B =  nan(size(idxLightsOn,2)/5,3); % in group comparison, alternatively one can do a paired T-test, because N(groups)>30 and these are mean values, thus normality can be asumed
    for j= 1:3
        B(i,j)=ranksum(offResponseDVV_trad_diff{i,2}(groups{1,1},1),offResponseDVV_trad_diff{i,2}(groups{1,j+1},1));
    end
    
    text(4.3,100, num2str(((B(i,:)'))))
end


saveas (f12, [folder_path_save,filesep,figures_subfolder,filesep,fish_name,date_exp '_evokedBehaviour_DVV_trad_betweenGroupComp'  '.fig']);
saveas (f12, [folder_path_save,filesep,figures_subfolder,filesep,fish_name,date_exp '_evokedBehaviour_DVV_trad_betweenGroupComp'  '.jpg']);
saveas (f12, [folder_path_save,filesep,figures_subfolder,filesep,fish_name,date_exp '_evokedBehaviour_DVV_trad_betweenGroupComp'  '.svg']);
