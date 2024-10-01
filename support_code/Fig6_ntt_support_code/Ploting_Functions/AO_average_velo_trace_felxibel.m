function collected_velo = AO_average_velo_trace_felxibel(all_fish, n_groups, groups, names, cmap, ...
    folder_path_save, figures_subfolder, timebin, start_point, end_point, stimulus)
%AO_average_velo_trace_felxibel - One line description of what the function or script performs (H1 line)
%   Author: Anna Maria Ostenrath
%   Optional file header info (to give more details about the function than in the H1 line)
%   Optional file header info (to give more details about the function than in the H1 line)
%
%   Syntax:
%       [collected_velo] = AO_average_velo_trace_felxibel(all_fish, n_groups, groups, names, cmap, ...
% folder_path_save, figures_subfolder, timebin, start_point,end_point, stimulus)
%       output = function(input1, input2, input3)
%
%   Inputs:
%       all_fish - cell array with all the fish data
%       n_groups - number of groups (e.g. 2 for 1 control and 1 treated)
%       groups - cell array with list of fish indices for each group (dim n_groups x 1)
%       names - cell array with names of each group (n_groups x 1 )
%       cmap - colormap with a color (RGB) for each group (n_groups x 3 )
%       folder_path_save, figures_subfolder - The save path and folder to
%       save as png
%       start_point & end_point - start and endpoint of where you want to
%       look in seconds (e.g. novel tank: 1 to 1200 s)
%       timebin - timebin (double) for the velocity data (e.g. 0.5)
%       stimulus - logical 1 or 0 if you want the stimuli timepoints to be
%       plotted
%       
%
%   Outputs:
%       collected_velo - cell array (n_groups x 1) with the average velo 
%       in the time interval for each group (NaN for fish that don*t belong to that group)
%      
%
%   Notes: 
%       To Do: add plotting for mutlipe control and test groups or
%       different saving options
%       Line 2 of example
%       Line 3 of example
%
%   Other m-files required: none
%   Subfunctions: none
%   MAT-files required: none
%
%   See also: AO_noveltank_average_velo_trace_groups (for 4 groups),
%   AO_plot_velo_average_and_change (plots the average and the change over each stimulus of one 
% conditions) 
%   Author: Anna Maria Ostenrath 
%   Date : May 2022

n_bins = floor(max(all_fish{groups{1}(1),1}.t)/timebin);
new_time = linspace(0, max(all_fish{groups{1}(1),1}.t), n_bins);
start_time = find(new_time >=start_point);
start_time = start_time(1);
end_time = find(new_time >=end_point);
end_time = end_time(1); 

if timebin < 1
    velo_string = num2str(timebin); 
    velo_string(2) = '_';
    v = all_fish{groups{1}(1),1}.(['binnedVel_' velo_string]);
else
    v = all_fish{groups{1}(1),1}.(['binnedVel_' num2str(timebin)]);
end
len_v_trace = size(v(start_time:end_time),2);  % double check why you floor it
collected_velo = cell(n_groups,1);

% creating the arrays to store each individual fish in
% it will be nan for the rows of all fish except the ones belonging to the
% group
for group = 1:n_groups
    collected_velo{group,1} = nan([len_v_trace, size(all_fish,1)]);
end

for fish = 1:size(all_fish,1)
    for group = 1:n_groups 
       if ismember(fish,groups{group})     
            if timebin < 1
                velo_string = num2str(timebin); 
                velo_string(2) = '_';
                v = all_fish{fish,1}.(['binnedVel_' velo_string]);
            else
                v = all_fish{fish,1}.(['binnedVel_' num2str(timebin)]);
            end

           collected_velo{group,1}(:, fish) = v(start_time:end_time);       

        end
    end
end

stim_times = all_fish{groups{1}(1), 1}.timeStampStim(find(~contains(all_fish...
    {groups{1}(1), 1}.stimInfo, "VIB_0")));

% Plotting 
% plotting the combined ones
fig
subplot(n_groups+1,1,1)
x_values = new_time(start_time:end_time); %1:size(collected_yposition_upper,1);
hold on
all_plots = [];
for group = 1:n_groups 
    p1 = shadedErrorBar(x_values, squeeze(nanmean(collected_velo{group},2)),squeeze(nanstd...
        (collected_velo{group}(:,:),0,2)/sqrt(size(groups{group},1))), 'lineProps','k');
    p1.mainLine.Color = cmap(group,:);
    p1.patch.FaceColor = cmap(group,:); 
%     p1.edge.Color = cmap(group,:);
    all_plots = [all_plots, p1]; 
end
if stimulus
    hold on
    for stim = 1:length(stim_times)
        xline(stim_times(stim), 'Color', 'b')
    end
    hold off
end
hold off
title(['Avg Velo '])
% xlim([1300 4200])
ylim([0 10])
ylabel([timebin, ' s bined velo'])
xlabel('Time [s]')
legend(names) % what about the stim lines all_plots
for group = 1:n_groups
    subplot(n_groups+1,1,group+1)
%     disp(group)
%     curret_cmap =cmap(group,:)
    p1 = shadedErrorBar(x_values, squeeze(nanmean(collected_velo{group},2)),squeeze(nanstd...
        (collected_velo{group}(:,:),0,2)/sqrt(size(groups{group},1))), 'lineProps','k');%     if stim
    p1.mainLine.Color = cmap(group,:);
    p1.patch.FaceColor = cmap(group,:); 
%     p1.edge.Color = cmap(group,:);
    if stimulus
        hold on
        for stim = 1:length(stim_times)
            xline(stim_times(stim), 'Color', 'b')
        end
        hold off
    end
    title(['Avg Velo '])
    % xlim([1300 4200])
    ylim([0 10])
    ylabel([timebin, ' s bined velo'])
    xlabel('Time [s]')
    legend([p1.mainLine], {names{group}})
    clear p1

end
if stimulus
    saveas(gcf, fullfile(folder_path_save, figures_subfolder, ...
        'Velo_comparison_groups_stim_period.png'));
    % close
else
    saveas(gcf, fullfile(folder_path_save, figures_subfolder, ['Velo_comparison_groups.png']));
    % close
end
end
