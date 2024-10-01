function collected_velo = AO_plot_velo_all_fish(all_fish, group,name, duration, timebin, ...
    folder_path_save, figures_subfolder, single_ploting)
stim_times = all_fish{group(1), 1}.timeStampStim(find(~contains(all_fish{group(1), 1}.stimInfo, ...
    "VIB_0")));
n_bins = floor(max(all_fish{group(1),1}.t)/timebin);
new_time = linspace(0, max(all_fish{group(1),1}.t), n_bins);
fish_speed = all_fish{group(1), 1}.binnedVel_2;% temp
len_velo_trace = length(fish_speed(new_time>floor(stim_times(1))-duration & ...
    new_time<floor(stim_times(1))+duration));  % double check why you floor it
collected_velo = nan([len_velo_trace, size(all_fish,1), length(stim_times)]);
collected_stim = [];
for stim = 1:length(stim_times)
    for fish = 1:size(all_fish,1)
        if ismember(fish, group)
            fish_speed = all_fish{fish, 1}.binnedVel_2;
            n_bins = floor(max(all_fish{fish,1}.t)/timebin);
            new_time = linspace(0, max(all_fish{fish, 1}.t), n_bins);
            
            curr_stim_times = all_fish{fish, 1}.timeStampStim(find...
               (~contains(all_fish{fish, 1}.stimInfo, "VIB_0")));
            curr_stim_ons = curr_stim_times(stim); 
            
            log_bin = new_time > floor(curr_stim_ons) - duration & ...
                      new_time < floor(curr_stim_ons) + duration;
            temp_speed = fish_speed(log_bin);
            if size(temp_speed,2) < len_velo_trace
                temp_speed = fish_speed(new_time>floor(curr_stim_ons)-duration & ...
                    new_time<floor(curr_stim_ons)+duration+1);
            end
            if fish == group(1)
                stim_new_time = find(new_time>floor(curr_stim_ons));
                onset_period = find(new_time>floor(curr_stim_ons)-duration); 
                marker_stim = stim_new_time(1) - onset_period(1);
                collected_stim = [collected_stim, marker_stim];  
            end
            collected_velo(:, fish, stim) = temp_speed(1:len_velo_trace);
        end
    end
end
figure('units','centimeters','Position',[2 2 18 24])
x_values = 1:len_velo_trace; 
labels = all_fish{group(1), 1}.stimInfo(find(~contains(all_fish{group(1), 1}.stimInfo, "VIB_0")));
for stim = 1:length(stim_times)
    subplot(round(length(stim_times)/2),2,stim)
    shadedErrorBar(x_values, squeeze(nanmean(collected_velo(:, :, stim), 2)), ...
        squeeze(nanstd(collected_velo(:, :, stim), 0, 2)/sqrt(size(group, 1))), 'lineProps', 'k')
    hold on
    xline(collected_stim(stim), 'Color', 'r' )
    for fish = 1:size(collected_velo(:,:,stim),2)
        plot(collected_velo(:,fish,stim))
    end
    hold off
    ylim([0 10])
    title([labels(stim)])
    ylabel([int2str(timebin) ' s binned velo ', name])
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
stim_types = unique(all_fish{group(1), 1}.stimInfo); 
stim_types = stim_types(2:end); % we are taking out the VIB 0 one 
stim_types_indice = all_fish{group(1), 1}.stimInfo(find(~contains(all_fish{group(1), 1}.stimInfo, ...
    "VIB_0"))); % this is now the stimuli times for the specific stimulus 
figure('units','centimeters','Position',[2 2 20 8])
x_values = 1:len_velo_trace; 
type_labels = unique(labels);
for stim = 1:length(stim_types)
    current_stim_ind = find(stim_types_indice == stim_types(stim));
    subplot(1, 3, stim)
    spe_bin_ani = squeeze(nanmean(collected_velo(:, :, current_stim_ind), 3));
    spe_bin_ani = spe_bin_ani(:, ~isnan(spe_bin_ani(1, :)));
    %ave_spe_bin_ani = mean(spe_bin_ani(11:26, :), 2);
    %figure; plot(ave_spe_bin_ani)
    shadedErrorBar(x_values, squeeze(nanmean(nanmean(collected_velo...
        (:, :, current_stim_ind), 3), 2)), squeeze(nanstd(nanmean(collected_velo...
        (:, :, current_stim_ind), 3), 0, 2)/sqrt(size(group, 1))), 'lineProps','k')
    hold on
    xline(collected_stim(stim), 'Color', 'r' )
    hold off
    ylim([0 3])
    title([type_labels(stim) , name])
    ylabel([int2str(timebin) ' s binned velo ', name])
    hold off
end
saveas(gcf, fullfile(folder_path_save, figures_subfolder, name, ...
    'Average_velo_per_stim_avg_fish.png'));
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
if single_ploting
    for fish = 1:size(all_fish, 1)
        if ismember(fish, group)
            figure('units','centimeters','Position',[2 2 20 8])
            x_values = 1:len_velo_trace; 
            type_labels = labels(2:end);
            for stim = 1:length(stim_types)
                current_stim_ind = find(stim_types_indice == stim_types(stim)); 
                subplot(1,3,stim)
                shadedErrorBar(x_values, squeeze(nanmean(collected_velo...
                    (:, fish, current_stim_ind), 3)), squeeze(nanstd(collected_velo...
                    (:, fish, current_stim_ind), 0, 3)/sqrt(length(current_stim_ind))), ...
                    'lineProps', 'k')
                hold on
                xline(collected_stim(stim), 'Color', 'r' )
                hold off
                ylim([0 5])
                title(['Fish ', int2str(fish),' ',type_labels(stim)])
                ylabel([int2str(timebin) ' s binned velo'])
                hold off
            end
            saveas(gcf, fullfile(folder_path_save, figures_subfolder, name, ...
                ['Fish_',int2str(fish), '_average_velo_per_stim.png']));
            close
        end
    end
end
end
