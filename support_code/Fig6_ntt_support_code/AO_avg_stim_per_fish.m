function AO_avg_stim_per_fish(all_fish, group, name, folder_path_save, figures_subfolder)
% this function will plot the average of each of the stimuli for each fish
% individually
% just taking the first fish as an example
for fish = 1: size(all_fish,1)
    if ismember(fish,group)
        stim_types = unique(all_fish{fish, 1}.stimInfo); 
        stim_types = stim_types(2:end) % we are taking out the VIB 0 one 
        stim_types_indice = all_fish{fish, 1}.stimInfo(find(~contains(all_fish{fish, 1}.stimInfo, "VIB_0"))); % this is now the stimuli times for the specific stimulus 

        avg_pdf = nan([size(all_fish{fish, 1}.stimPDF,1), size(all_fish{fish, 1}.stimPDF,2), 2, length(stim_types)]); % 2 for before and after
        for stim = 1: length(stim_types)
           current_stim_ind = find(stim_types_indice == stim_types(stim)); % this is to find which are the indices of the spedific stim we are looking at 
           collected_pdf = nan([size(all_fish{fish, 1}.stimPDF,1), size(all_fish{fish, 1}.stimPDF,2), 2, length(current_stim_ind)]); 
           for curr_stim = 1:length(current_stim_ind)
                collected_pdf(:,:,:,curr_stim) = all_fish{fish, 1}.stimPDF(:,:,:,current_stim_ind(curr_stim));
           end
           avg_pdf(:,:,1,stim) = nanmean(collected_pdf(:,:,1,:),4); %before
           avg_pdf(:,:,2,stim) = nanmean(collected_pdf(:,:,2,:),4); % after

        end

        % plotting part 

        figure('units','centimeters','Position',[2 2 18 24])
        subplot_number = [1 2; 3 4; 5 6]; %; 7 8; 9 10; 11 12; 13 14; 15 16; 17 18]; 
        for stim = 1: length(stim_types)
            subplot(length(stim_types),2, subplot_number(stim,1))
            imagesc(avg_pdf(:,:,1,stim))
            title(['Avg over Fish ', int2str(fish) ,' Stim ', stim_types(stim), ' Before ', name])
            colormap jet %hot
            caxis([0 0.05])
            colorbar

            subplot(length(stim_types),2, subplot_number(stim,2))
            imagesc(avg_pdf(:,:,2,stim))
            title(['Avg over Fish ', int2str(fish) ,' Stim ', stim_types(stim), ' After ', name])
            colormap jet % hot
            caxis([0 0.05])
            colorbar


        end
        saveas(gcf, fullfile(folder_path_save, figures_subfolder, name, [name, '_Fish_', int2str(fish), '_average_over_stim.png'])); 
        close; 
    end
end

end