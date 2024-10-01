function AO_average_y_trace_groups(all_fish, group1, name1, group2, name2, start_point)
numExp = size(all_fish, 1)/6;
for i = 1:numExp
    lowerRow(i*3 - (3 - 1):i*3) = [4 5 6] + 6*(i - 1); % make an array for the lower row of ROIs
end
t = all_fish{group1(1), 1}.t;
y = all_fish{group1(1), 1}.y;
len_y_trace = size(y, 1) - 50; % double check why you floor it, k: excluding the last 50 frames
collected_yposition_upper_1 = nan([len_y_trace, size(all_fish,1)]);
collected_yposition_lower_1 = nan([len_y_trace, size(all_fish,1)]); 
%
collected_yposition_upper_2 = nan([len_y_trace, size(all_fish,1)]);
collected_yposition_lower_2 = nan([len_y_trace, size(all_fish,1)]);
for fish = 1:size(all_fish, 1)
    if ismember(fish, group1)
        if ismember(fish, lowerRow)
            y = all_fish{fish,1}.y;
            temp_y = -y; 
            collected_yposition_lower_1(:, fish) = temp_y(1:len_y_trace) + 168;
        else
            y = all_fish{fish,1}.y;
            temp_y = -y;
            collected_yposition_upper_1(:, fish) = temp_y(1:len_y_trace) + 26;
        end
    end
    %
    if ismember(fish,group2)
       if ismember(fish,lowerRow)
           y = all_fish{fish,1}.y;
           temp_y = -y; 
           collected_yposition_lower_2(:, fish) = temp_y(1:len_y_trace) + 168;
       else
           y = all_fish{fish,1}.y;
           temp_y = -y;
           collected_yposition_upper_2(:, fish) = temp_y(1:len_y_trace) + 26;
       end
    end
end
%
stim_times = all_fish{group1(1), 1}.timeStampStim(find(~contains(all_fish{group1(1), 1}.stimInfo, ...
    "VIB_0")));
size_low1 = sum(ismember(group1, lowerRow));
size_up1 = length(group1) - size_low1;
size_low2 = sum(ismember(group2, lowerRow));
size_up2 = length(group2) - size_low2; 
%
figure('units', 'centimeters', 'Position', [2 2 38 14])
subplot(2, 1, 1)
x_values = t(1:len_y_trace);
p1 = shadedErrorBar(x_values, squeeze(nanmean(collected_yposition_upper_1,2)), ...
    squeeze(nanstd(collected_yposition_upper_1(:,:),0,2)/sqrt(size_up1)), 'lineProps','b');
hold on 
p2 = shadedErrorBar(x_values, squeeze(nanmean(collected_yposition_upper_2,2)), ...
    squeeze(nanstd(collected_yposition_upper_2(:,:),0,2)/sqrt(size_up2)), 'lineProps','k');
%
for stim = 1:length(stim_times)
    xline(stim_times(stim), 'Color', 'r')
end
hold off
title(['Avg Y UPPER '])
ylim([-140 0])
ylabel('Y position [mm]')
xlabel('Time [s]')
legend([p1.mainLine p2.mainLine], {name1, name2})
%
subplot(2,1,2)
x_values = t(1:len_y_trace);
p1 = shadedErrorBar(x_values, squeeze(nanmean(collected_yposition_lower_1,2)), ...
    squeeze(nanstd(collected_yposition_lower_1(:,:),0,2)/sqrt(size_low1)), 'lineProps','r');
hold on 
p2 =shadedErrorBar(x_values, squeeze(nanmean(collected_yposition_lower_2,2)), ...
    squeeze(nanstd(collected_yposition_lower_2(:,:),0,2)/sqrt(size_low2)), 'lineProps','b');
for stim = 1:length(stim_times)
    xline(stim_times(stim), 'Color', 'r')
end
hold off
title(['Avg Y LOWER '])
ylim([-140 0])
ylabel('Y position [mm]')
xlabel('Time [s]')
legend([p1.mainLine p2.mainLine], {name1, name2})
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
combined_ypos_1 = collected_yposition_upper_1;
combined_ypos_1(:, lowerRow, :) = collected_yposition_lower_1(:, lowerRow, :);

combined_ypos_2 = collected_yposition_upper_2; 
combined_ypos_2(:, lowerRow, :) = collected_yposition_lower_2(:, lowerRow, :);

figure('units','centimeters','Position',[2 2 38 14])
x_values = t(start_point:len_y_trace);
p1 = shadedErrorBar(x_values, squeeze(nanmean(combined_ypos_1,2)), ...
    squeeze(nanstd(combined_ypos_1(:,:),0,2)/sqrt(size(group1,1))), 'lineProps','r');
hold on 
p2 = shadedErrorBar(x_values, squeeze(nanmean(combined_ypos_2,2)), ...
    squeeze(nanstd(combined_ypos_2(:,:),0,2)/sqrt(size(group2,1))), 'lineProps','b');

for stim = 1:length(stim_times)
    xline(stim_times(stim), 'Color', 'b')
end
hold off
title(['Avg Y'])
ylim([-140 0])
ylabel('Y position [mm]')
xlabel('Time [s]')
legend([p1.mainLine p2.mainLine], {name1, name2})
end
