function AO_plot_heatmaps(all_fish, nROIs, folder_path_save)

for ROI = 1:nROIs
    if all_fish{ROI, 1}.selected
        current_pdf = all_fish{ROI, 1}.stimPDF; 
        counter = 1; 
        % Individual stim and fish 
        figure('units','centimeters','Position',[2 2 12 24])
        for stim = 1:size(current_pdf,4)
            subplot(size(current_pdf,4),2,counter)
            imagesc(current_pdf(:,:,1,stim))
            title(['Stim ', int2str(stim), ' before'])
            colormap jet
            caxis([0 0.1])
    %         axis equal
            colorbar

            counter = counter + 1;

            subplot(size(current_pdf,4),2,counter)
            imagesc(current_pdf(:,:,2,stim))
            title(['Stim ', int2str(stim), ' after'])
            colormap jet
            caxis([0 0.1])
    %         axis equal
            colorbar
            counter = counter + 1;
        end
        saveas(gcf, fullfile(folder_path_save, 'Figures', '\all_fish\', ['Fish_', int2str(ROI), '_indiv_stim.png']));
        close;
    end
end
% avg_one_fish
% figure('units','centimeters','Position',[2 2 12 24])
% sub_no = 1:nROIs; 
% numbers_subpl = nan([nROIs/2 2]);
% numbers_subpl(:,1) = sub_no(1:nROIs/2);
% numbers_subpl(:,2) = sub_no(nROIs/2 + 1:end); 
numbers_subpl = [1 2; 3 4; 5 6; 7 8; 9 10; 11 12;];
no_exp = nROIs/6;
fish = [1:6; 7:12; 13:18; 19:24]; % this is hard coded and not sso smart... change this! 
for exp = 1:no_exp
    curr_fish = fish(exp,:);
    figure('units','centimeters','Position',[2 2 12 24])
    counter = 1; 
    for ROI = 1:length(curr_fish)
        current_pdf = all_fish{curr_fish(ROI), 1}.stimPDF; 
        subplot(6,2,numbers_subpl(counter,1))
        
        imagesc(nanmean(current_pdf(:,:,1,:),4))
        title(['Avg Fish ', int2str(curr_fish(ROI)), ' Before'])
        colormap jet
        caxis([0 0.1])
        axis equal
        colorbar


        subplot(6,2,numbers_subpl(counter,2))
        counter = counter +1;
        imagesc(nanmean(current_pdf(:,:,2,:),4))
        title(['Avg Fish ', int2str(curr_fish(ROI)), ' After'])
        colormap jet
        caxis([0 0.1])
        colorbar
    end
    saveas(gcf, fullfile(folder_path_save, 'Figures', '\all_fish\', ['Exp ', int2str(exp), ' average_stim.png']));
    close;
end
end