function AO_noveltank_average_y_trace_groups(all_fish, group1, name1, group2, name2, group3, name3, ...
    group4, name4, start_point, end_point, seperate_y, stim)
% Protocol: 20min Habituation - 4min BL - 10min T1 (10Stim, 1min ISI) - 4min ITI -  
% 10min T2 (10Stim, 1min ISI) - 4min ITI - 10min T3 (10Stim, 1min ISI) - 4min ITI
%
% 2.333
% 2.058
%
numExp = size(all_fish,1)/6;
for i=1:numExp
lowerRow (i*3-(3-1):i*3) = [4 5 6]+6*(i-1); % make an array for the lower row of ROIs
end
t = all_fish{group1(1),1}.t;
y = all_fish{group1(1),1}.y;
len_y_trace = size(y(start_point:end_point),1); % double check why you floor it
collected_yposition_upper_1 = nan([len_y_trace, size(all_fish,1)]);
collected_yposition_lower_1 = nan([len_y_trace, size(all_fish,1)]); 

collected_yposition_upper_2 = nan([len_y_trace, size(all_fish,1)]);
collected_yposition_lower_2 = nan([len_y_trace, size(all_fish,1)]); 

collected_yposition_upper_3 = nan([len_y_trace, size(all_fish,1)]);
collected_yposition_lower_3 = nan([len_y_trace, size(all_fish,1)]); 

collected_yposition_upper_4 = nan([len_y_trace, size(all_fish,1)]);
collected_yposition_lower_4 = nan([len_y_trace, size(all_fish,1)]); 

for fish = 1:size(all_fish,1)
   if ismember(fish,group1)
       if ismember(fish,lowerRow)
           y = all_fish{fish,1}.y;
           temp_y = -y; 
           collected_yposition_lower_1(:, fish) = temp_y(start_point:end_point) + 168;
       else
           y = all_fish{fish,1}.y;
           temp_y = -y;
           collected_yposition_upper_1(:, fish) = temp_y(start_point:end_point)+26;
       end
   elseif ismember(fish,group2)
       if ismember(fish,lowerRow)
           y = all_fish{fish,1}.y;
           temp_y = -y; 
           collected_yposition_lower_2(:, fish) = temp_y(start_point:end_point)+168;
       else
           y = all_fish{fish,1}.y;
           temp_y = -y;
           collected_yposition_upper_2(:, fish) = temp_y(start_point:end_point)+26;
       end
   elseif ismember(fish,group3)
       if ismember(fish,lowerRow)
           y = all_fish{fish,1}.y;
           temp_y = -y; 
           collected_yposition_lower_3(:, fish) = temp_y(start_point:end_point)+168;
       else
           y = all_fish{fish,1}.y;
           temp_y = -y;
           collected_yposition_upper_3(:, fish) = temp_y(start_point:end_point)+26;
       end
   elseif ismember(fish,group4)
       if ismember(fish,lowerRow)
           y = all_fish{fish,1}.y;
           temp_y = -y; 
           collected_yposition_lower_4(:, fish) = temp_y(start_point:end_point)+168;
       else
           y = all_fish{fish,1}.y;
           temp_y = -y;
           collected_yposition_upper_4(:, fish) = temp_y(start_point:end_point)+26;
       end
   end
end

size_low1 = sum(ismember(group1,lowerRow));
size_up1 = length(group1)-size_low1; 

size_low2 = sum(ismember(group2,lowerRow));
size_up2 = length(group2)-size_low2; 

size_low3 = sum(ismember(group3,lowerRow));
size_up3 = length(group3)-size_low3; 

size_low4 = sum(ismember(group4,lowerRow));
size_up4 = length(group4)-size_low4; 

if seperate_y
    figure('units','centimeters','Position',[2 2 38 14])
    subplot(2,1,1)
    x_values = t(1:len_y_trace);
    p1 = shadedErrorBar(x_values, squeeze(nanmean(collected_yposition_upper_1,2)), ...
        squeeze(nanstd(collected_yposition_upper_1(:,:),0,2)/sqrt(size_up1)), 'lineProps','b');
    hold on 
    p2 = shadedErrorBar(x_values, squeeze(nanmean(collected_yposition_upper_2,2)), ...
        squeeze(nanstd(collected_yposition_upper_2(:,:),0,2)/sqrt(size_up2)), 'lineProps','k');
    p3 = shadedErrorBar(x_values, squeeze(nanmean(collected_yposition_upper_3,2)), ...
        squeeze(nanstd(collected_yposition_upper_3(:,:),0,2)/sqrt(size_up3)), 'lineProps','r');
    p4 = shadedErrorBar(x_values, squeeze(nanmean(collected_yposition_upper_4,2)), ...
        squeeze(nanstd(collected_yposition_upper_4(:,:),0,2)/sqrt(size_up4)), 'lineProps','g');
    
    hold off
    title('Avg Y UPPER')
    ylim([-140 0])
    ylabel('Y position [mm]')
    xlabel('Time [s]')
    legend([p1.mainLine p2.mainLine  p3.mainLine p4.mainLine], {name1, name2, name3, name3})

    subplot(2,1,2)
    x_values = t(1:len_y_trace);
    p1 = shadedErrorBar(x_values, squeeze(nanmean(collected_yposition_lower_1,2)), ...
        squeeze(nanstd(collected_yposition_lower_1(:,:),0,2)/sqrt(size_low1)), 'lineProps','r');
    hold on 
    p2 =shadedErrorBar(x_values, squeeze(nanmean(collected_yposition_lower_2,2)), ...
        squeeze(nanstd(collected_yposition_lower_2(:,:),0,2)/sqrt(size_low2)), 'lineProps','b');
    p3 =shadedErrorBar(x_values, squeeze(nanmean(collected_yposition_lower_3,2)), ...
        squeeze(nanstd(collected_yposition_lower_3(:,:),0,2)/sqrt(size_low3)), 'lineProps','k');
    p4 = shadedErrorBar(x_values, squeeze(nanmean(collected_yposition_lower_4,2)), ...
        squeeze(nanstd(collected_yposition_lower_4(:,:),0,2)/sqrt(size_low4)), 'lineProps','g');

    hold off
    title('Avg Y LOWER')
    ylim([-140 0])
    ylabel('Y position [mm]')
    xlabel('Time [s]')
    legend([p1.mainLine p2.mainLine  p3.mainLine], {name1, name2, name3})

end
combined_ypos_1 = collected_yposition_upper_1; 
combined_ypos_1(:,lowerRow,:) = collected_yposition_lower_1(:,lowerRow,:);

combined_ypos_2 = collected_yposition_upper_2; 
combined_ypos_2(:,lowerRow,:) = collected_yposition_lower_2(:,lowerRow,:);

combined_ypos_3 = collected_yposition_upper_3; 
combined_ypos_3(:,lowerRow,:) = collected_yposition_lower_3(:,lowerRow,:);

combined_ypos_4 = collected_yposition_upper_4; 
combined_ypos_4(:,lowerRow,:) = collected_yposition_lower_4(:,lowerRow,:);
stim_times = all_fish{group1(1), 1}.timeStampStim(find(~contains(all_fish{group1(1), 1}.stimInfo, ...
    "VIB_0")));
%
figure('units','centimeters','Position',[2 2 30 14])
subplot(5,1,1)
x_values = t(start_point:end_point);
p1 = shadedErrorBar(x_values, squeeze(nanmean(combined_ypos_1,2)),squeeze(nanstd(combined_ypos_1...
    (:,:),0,2)/sqrt(size(group1,1))), 'lineProps','r');
hold on 
p2 = shadedErrorBar(x_values, squeeze(nanmean(combined_ypos_2,2)),squeeze(nanstd(combined_ypos_2...
    (:,:),0,2)/sqrt(size(group2,1))), 'lineProps','b');
p3 = shadedErrorBar(x_values, squeeze(nanmean(combined_ypos_3,2)),squeeze(nanstd(combined_ypos_3...
    (:,:),0,2)/sqrt(size(group3,1))), 'lineProps','k');
p4 = shadedErrorBar(x_values, squeeze(nanmean(combined_ypos_4,2)),squeeze(nanstd(combined_ypos_4...
    (:,:),0,2)/sqrt(size(group4,1))), 'lineProps','g');
if stim
    hold on
    for stim = 1:length(stim_times)
        xline(stim_times(stim), 'Color', 'b')
    end
    hold off
end
hold off
title('Avg Y')
ylim([-120 0])
ylabel('Y position [mm]')
xlabel('Time [s]')
legend([p1.mainLine p2.mainLine  p3.mainLine p4.mainLine], {name1, name2, name3, name4})
%
subplot(5,1,2)
p1 = shadedErrorBar(x_values, squeeze(nanmean(combined_ypos_1,2)),squeeze(nanstd(combined_ypos_1...
    (:,:),0,2)/sqrt(size(group1,1))), 'lineProps','r');
if stim
    hold on
    for stim = 1:length(stim_times)
        xline(stim_times(stim), 'Color', 'b')
    end
    hold off
end
title(['Avg Y ', name1])
ylim([-120 0])
ylabel('Y position [mm]')
xlabel('Time [s]')
legend([p1.mainLine], {name1})
%
subplot(5,1,3)
p2 = shadedErrorBar(x_values, squeeze(nanmean(combined_ypos_2,2)),squeeze(nanstd(combined_ypos_2...
    (:,:),0,2)/sqrt(size(group2,1))), 'lineProps','b');
if stim
    hold on
    for stim = 1:length(stim_times)
        xline(stim_times(stim), 'Color', 'b')
    end
    hold off
end
title(['Avg Y ', name2])
ylim([-120 0])
ylabel('Y position [mm]')
xlabel('Time [s]')
legend([p2.mainLine], {name2})
%
subplot(5,1,4)
p3 = shadedErrorBar(x_values, squeeze(nanmean(combined_ypos_3,2)),squeeze(nanstd(combined_ypos_3...
    (:,:),0,2)/sqrt(size(group3,1))), 'lineProps','k');
if stim
    hold on
    for stim = 1:length(stim_times)
        xline(stim_times(stim), 'Color', 'b')
    end
    hold off
end
title(['Avg Y ', name3])
ylim([-120 0])
ylabel('Y position [mm]')
xlabel('Time [s]')
legend([p3.mainLine], {name3})
subplot(5,1,5)
p4 = shadedErrorBar(x_values, squeeze(nanmean(combined_ypos_4,2)),squeeze(nanstd(combined_ypos_4...
    (:,:),0,2)/sqrt(size(group4,1))), 'lineProps','g');
if stim
    hold on
    for stim = 1:length(stim_times)
        xline(stim_times(stim), 'Color', 'b')
    end
    hold off
end
title(['Avg Y ', name4])
ylim([-120 0])
ylabel('Y position [mm]')
xlabel('Time [s]')
legend([p4.mainLine], {name4})

%% Now here hardcoded for this experiment with the two controls
figure('units','centimeters','Position',[2 2 20 10])
x_values = t(start_point:end_point);
p1 = shadedErrorBar(x_values, squeeze(nanmean(combined_ypos_1,2)),squeeze(nanstd(combined_ypos_1...
    (:,:),0,2)/sqrt(size(group1,1))), 'lineProps','k');
hold on 
p3 = shadedErrorBar(x_values, squeeze(nanmean(combined_ypos_3,2)),squeeze(nanstd(combined_ypos_3...
    (:,:),0,2)/sqrt(size(group3,1))), 'lineProps','r');
if stim
    hold on
    for stim = 1:length(stim_times)
        xline(stim_times(stim), 'Color', 'b')
    end
    hold off
end
legend([p1.mainLine p3.mainLine], {name1 name3})
ylim([-120 0])
ylabel('Y position [mm]')
xlabel('Time [s]')
%
figure('units','centimeters','Position',[2 2 20 10])
x_values = t(start_point:end_point);
hold on 
p2 = shadedErrorBar(x_values, squeeze(nanmean(combined_ypos_2,2)),squeeze(nanstd(combined_ypos_2...
    (:,:),0,2)/sqrt(size(group2,1))), 'lineProps','k');
p4 = shadedErrorBar(x_values, squeeze(nanmean(combined_ypos_4,2)),squeeze(nanstd(combined_ypos_4...
    (:,:),0,2)/sqrt(size(group4,1))), 'lineProps','r');
if stim
    hold on
    for stim = 1:length(stim_times)
        xline(stim_times(stim), 'Color', 'b')
    end
    hold off
end
legend([p2.mainLine p4.mainLine], {name2 name4})
ylim([-120 0])
ylabel('Y position [mm]')
xlabel('Time [s]')
end
