function [collected_velo_1, collected_velo_2] = ...
    AO_average_velo_trace_groups(all_fish, group1, name1, group2, name2, ...
    folder_path_save, figures_subfolder, timebin)
numExp = size(all_fish,1)/6;
for i=1:numExp
lowerRow (i*3-(3-1):i*3) = [4 5 6]+6*(i-1); % make an array for the lower row of ROIs 
end
n_bins = floor(max(all_fish{group1(1),1}.t)/timebin);
new_time = linspace(0, max(all_fish{group1(1),1}.t), n_bins);
v = all_fish{group1(1), 1}.binnedVel_2;
len_v_trace = size(v,2)-50;  % double check why you floor it
collected_velo_1 = nan([len_v_trace, size(all_fish,1)]);

collected_velo_2 = nan([len_v_trace, size(all_fish,1)]);

for fish = 1:size(all_fish,1)
   if ismember(fish,group1)     
           v = all_fish{fish, 1}.binnedVel_2;
            
           collected_velo_1(:, fish) = v(1:len_v_trace);       
   end
   if ismember(fish,group2)
           v = all_fish{fish, 1}.binnedVel_2;
           
           collected_velo_2(:, fish) = v(1:len_v_trace);
   end
end

stim_times = all_fish{group1(1), 1}.timeStampStim...
    (find(~contains(all_fish{group1(1), 1}.stimInfo, "VIB_0")));

figure('units','centimeters','Position',[2 2 38 14])
subplot(4,1,1)
x_values = new_time(1:len_v_trace); %1:size(collected_yposition_upper,1);
p1 = shadedErrorBar(x_values, squeeze(nanmean(collected_velo_1,2)), ...
    squeeze(nanstd(collected_velo_1(:,:),0,2)/sqrt(size(group1,1))), 'lineProps','r');
hold on 
p2 = shadedErrorBar(x_values, squeeze(nanmean(collected_velo_2,2)), ...
    squeeze(nanstd(collected_velo_2(:,:),0,2)/sqrt(size(group2,1))), 'lineProps','k');

p1.mainLine.Color = '#8B0000';
p1.patch.FaceColor = '#8B0000'; 
p2.mainLine.Color = '#02055A';
p2.patch.FaceColor = '#02055A'; 
for stim = 1:length(stim_times)
    xline(stim_times(stim), 'Color', 'b')
end
hold off
title(['Avg Velo '])
ylim([0 5])
ylabel([timebin, ' s bined velo'])
xlabel('Time [s]')
legend([p1.mainLine p2.mainLine], {name1, name2})

subplot(4,1,2)
x_values = new_time(1:len_v_trace); %1:size(collected_yposition_upper,1);
p1 = shadedErrorBar(x_values, squeeze(nanmean(collected_velo_1,2)), ...
    squeeze(nanstd(collected_velo_1(:,:),0,2)/sqrt(size(group1,1))), 'lineProps','r');
p1.mainLine.Color = '#8B0000';
p1.patch.FaceColor = '#8B0000'; 
for stim = 1:length(stim_times)
    xline(stim_times(stim), 'Color', 'b')
end
hold off
title(['Avg Velo ', name1])
ylim([0 5])
ylabel([timebin, ' s bined velo'])
xlabel('Time [s]')
legend([p1.mainLine], {name1})

subplot(4,1,3)
x_values = new_time(1:len_v_trace); %1:size(collected_yposition_upper,1);
p2 = shadedErrorBar(x_values, squeeze(nanmean(collected_velo_2,2)), ...
    squeeze(nanstd(collected_velo_2(:,:),0,2)/sqrt(size(group2,1))), 'lineProps','k');
p2.mainLine.Color = '#02055A';
p2.patch.FaceColor = '#02055A'; 
for stim = 1:length(stim_times)
    xline(stim_times(stim), 'Color', 'b')
end
hold off
title(['Avg Velo ', name2])
ylim([0 5])
ylabel([timebin, ' s bined velo'])
xlabel('Time [s]')
legend([p2.mainLine], {name2})
end
