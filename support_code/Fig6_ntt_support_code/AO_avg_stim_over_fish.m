function AO_avg_stim_over_fish(all_fish, group, name)
% just taking the first fish as an example
stim_times = all_fish{1, 1}.timeStampStim(find(~contains(all_fish{1, 1}.stimInfo, "VIB_0")));
stim_types = unique(all_fish{1, 1}.stimInfo); 
stim_types = stim_types(2:end); % we are taking out the VIB 0 one 
stim_types_indice = all_fish{1, 1}.stimInfo(find(~contains(all_fish{1, 1}.stimInfo, "VIB_0"))); % this is now the stimuli times for the specific stimulus 

avg_pdf = nan([size(all_fish{1, 1}.stimPDF,1), size(all_fish{1, 1}.stimPDF,2), 2, length(stim_times)]); % 2 for before and after
for stim = 1: length(stim_times)
   collected_pdf = nan([size(all_fish{1, 1}.stimPDF,1), size(all_fish{1, 1}.stimPDF,2), 2, size(all_fish,1)]); 
   for fish = 1:size(all_fish,1)
       if ismember(fish, group)
        collected_pdf(:,:,:,fish) = all_fish{fish, 1}.stimPDF(:,:,:,stim);
       end
   end
   avg_pdf(:,:,1,stim) = nanmean(collected_pdf(:,:,1,:),4); %before
   avg_pdf(:,:,2,stim) = nanmean(collected_pdf(:,:,2,:),4); % after
 
end
dur_avg_pdf = nan([size(all_fish{1, 1}.stimPDF,1), size(all_fish{1, 1}.stimPDF,2), 2, length(stim_types)]); % 2 for before and after
for stim = 1: length(stim_types)
   collected_pdf = nan([size(all_fish{1, 1}.stimPDF,1), size(all_fish{1, 1}.stimPDF,2), 2, size(all_fish,1)]); 
   for fish = 1:size(all_fish,1)
       if ismember(fish, group)
            collected_pdf(:,:,:,fish) = all_fish{fish, 1}.avgstimPDF(:,:,:,stim);
       end
   end
   dur_avg_pdf(:,:,1,stim) = nanmean(collected_pdf(:,:,1,:),4); %before
   dur_avg_pdf(:,:,2,stim) = nanmean(collected_pdf(:,:,2,:),4); % after
 
end
% plotting part 
figure('units','centimeters','Position',[2 2 18 24])
counter = 1;
for stim = 1: length(stim_types)
    subplot(length(stim_types),2, counter)
    imagesc(dur_avg_pdf(:,:,1,stim))
    title(['Avg over fish ', stim_types(stim), ' Before ', name])
    colormap jet %hot
    caxis([0 0.05])
    colorbar
    
    counter = counter +1; 
    subplot(length(stim_types),2, counter)
    imagesc(dur_avg_pdf(:,:,2,stim))
    title(['Avg over fish ', stim_types(stim), ' After ', name])
    colormap jet % hot
    caxis([0 0.05])
    colorbar
    
    counter = counter +1;
end
end
