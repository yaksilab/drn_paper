function [all_fish] = aj_descriptiveSB_20210220 (all_fish,timebin,folder_path_save,fish_name,date_exp,group1,group2, group3,group4,group5,group6,group7,group8,group9,name_group1,name_group2,name_group3 ,name_group4, name_group5, name_group6, name_group7, name_group8, name_group9, figures_subfolder, group_category,nROIs,transitionTime,groups,name_groups, threshold,SeizureBarcode_thresholds,conversion_factor,C1)


for ROI=1:size(all_fish,1)
    all_fish{ROI,1}.SponBehaviour.meanVelocity = all_fish{ROI,1}.bV_E4sd(1:floor(transitionTime));
%     all_fish{ROI,1}.SponBehaviour.meanAcceleration = all_fish{ROI,1}.binnedAcc(1:floor(transitionTime));
%     all_fish{ROI,1}.SponBehaviour.distance = all_fish{ROI,1}.bD(1:floor(transitionTime));

end

%  save([folder_path_save,filesep,fish_name,date_exp '_data.mat'],'all_fish','-v7.3');

%% plot descriptive velocity 
aj_spontaniousVel_20210220 (all_fish,timebin,folder_path_save,fish_name,...
    date_exp,group1,group2, group3,group4,group5,...
    group6,group7,group8,group9...
    name_group1,name_group2,...
    name_group3 ,name_group4, name_group5,...
    name_group6,name_group7,name_group8,name_group9,...
    figures_subfolder,...
    group_category,nROIs,transitionTime,groups,name_groups,threshold,...
    SeizureBarcode_thresholds,conversion_factor,C1)

%% plot descriptive distance
% aj_spontaniousDistance_20210220 (all_fish,timebin,folder_path_save,...
%     fish_name,date_exp,group1,group2, group3,group4,group5,name_group1,...
%     name_group2,name_group3 ,name_group4, name_group5,figures_subfolder,...
%     group_category,nROIs,transitionTime,groups,name_groups, threshold,...
%     SeizureBarcode_thresholds,conversion_factor)
% 
%% plot descriptive acceleration
% aj_spontaniousAcceleration_20210220 (all_fish,timebin,folder_path_save,fish_name,date_exp,group1,group2, group3,group4,group5,name_group1,name_group2,name_group3 ,name_group4, name_group5,figures_subfolder, group_category,nROIs,transitionTime,groups,name_groups, threshold,SeizureBarcode_thresholds,conversion_factor)

%% heatmap position overall for each group

%  Initialize the variables
heatmap_position_temp=cell(nROIs,1);
for ROI=1:nROIs
    if isfield(all_fish{ROI, 1},'positionPDspontanious')
        heatmap_position_temp(ROI,1)= {nan(size(all_fish{ROI, 1}.positionPDspontanious,1),size(all_fish{ROI, 1}.positionPDspontanious,2))};
        heatmap_position_temp(ROI,1)={[all_fish{ROI, 1}.positionPDspontanious]};
    else
        heatmap_position_temp(ROI,1)={[]};
    end
end

%  Make a 3D matrix of pdf of position for all fish in first loop and remove the 0-planes added
%  by matlab in the 2nd
heatmap_pdf_3D=zeros(size(heatmap_position_temp{1, 1},1), size(heatmap_position_temp{1, 1},2), nROIs);
for ROI=1:nROIs
    if isempty(heatmap_position_temp{ROI,1})
        heatmap_pdf_3D(:,:,ROI)  =  nan(size(heatmap_position_temp{1, 1}));
    else
        heatmap_pdf_3D(:,:,ROI)  =  (heatmap_position_temp{ROI, 1});
    end
end


for ROI=1:size(heatmap_pdf_3D,3)
    if sum(sum(heatmap_pdf_3D(:,:, ROI)))==0
        heatmap_pdf_3D(:,:, ROI) = nan;
    end
end


%% plot the probability of fish being in one position:

f19=figure();
f19.WindowState = 'maximized';

for i= 1:length(groups)
    subplot(3,2,i)
    imagesc (mean(heatmap_pdf_3D(:,:,groups{1,i}),3,'omitnan'));
    colorbar('eastoutside');
    colormap((hot));
    caxis ([0 0.005]);
    title (['mean PD of position of fish in ' name_groups{1,i}])
    xticks([]);
    yticks([]);
end

saveas (f19, [folder_path_save,filesep,figures_subfolder,filesep,fish_name,date_exp '_pdf_position' '.fig']);
saveas (f19, [folder_path_save,filesep,figures_subfolder,filesep,fish_name,date_exp '_pdf_position' '.jpg']);
saveas (f19, [folder_path_save,filesep,figures_subfolder,filesep,fish_name,date_exp '_pdf_position' '.svg']);


% Plot fo position probability distribution for each fish

f20=figure();
f20.WindowState = 'maximized';

for fish=1:nROIs
    sgtitle ('Probabability of each fish being in a given position of the well')
    subplot(ceil(nROIs/12),ceil(nROIs/ceil(nROIs/12)),fish)
    if isempty(heatmap_position_temp{fish, 1})
        text(0.1,0.5,'No movement');
    else
        imagesc(heatmap_position_temp{fish, 1});
    end
    title (group_category(fish,1))
      
    colormap(jet)
    caxis([0 0.005])
    box ('off')
    xticks([])
    yticks([])  
end

saveas (f20, [folder_path_save,filesep,figures_subfolder,filesep,fish_name,date_exp '_pdf_position_singleFish' '.fig']);
saveas (f20, [folder_path_save,filesep,figures_subfolder,filesep,fish_name,date_exp '_pdf_position_singleFish' '.jpg']);
saveas (f20, [folder_path_save,filesep,figures_subfolder,filesep,fish_name,date_exp '_pdf_position_singleFish' '.svg']);
