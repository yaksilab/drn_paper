function AO_average_y_trace(all_fish, group, name, folder_path_save, figures_subfolder)

numExp = size(all_fish,1)/6;
for i=1:numExp
lowerRow (i*3-(3-1):i*3) = [4 5 6]+6*(i-1); % make an array for the lower row of ROIs 
end
t = all_fish{group(1),1}.t;
%            x = all_fish{fish,1}.x;
y = all_fish{group(1),1}.y;
len_y_trace = size(y,1)-50;  % double check why you floor it
collected_yposition_upper = nan([len_y_trace, size(all_fish,1)]);
collected_yposition_lower = nan([len_y_trace, size(all_fish,1)]); 

for fish = 1:size(all_fish,1)
   if ismember(fish,group)
       if ismember(fish,lowerRow)
           y = all_fish{fish,1}.y;

           temp_y = -y; 
           collected_yposition_lower(:, fish) = temp_y(1:len_y_trace);
       else
           y = all_fish{fish,1}.y;
           temp_y = -y;
           collected_yposition_upper(:, fish) = temp_y(1:len_y_trace);
       end
   end
end

stim_times = all_fish{group(1), 1}.timeStampStim(find(~contains(all_fish{group(1), 1}.stimInfo, "VIB_0")));
size_low = sum(ismember(group,lowerRow));
size_up = length(group)-size_low; 
figure('units','centimeters','Position',[2 2 38 14])
subplot(2,1,1)
x_values = t(1:len_y_trace); %1:size(collected_yposition_upper,1);
shadedErrorBar(x_values, squeeze(nanmean(collected_yposition_upper,2)),squeeze(nanstd(collected_yposition_upper(:,:),0,2)/sqrt(size_up)), 'lineProps','k');
hold on 
for stim = 1:length(stim_times)
    xline(stim_times(stim), 'Color', 'r')
end
hold off
title(['Avg Y UPPER ', name])
% xlim([0 3000])
ylim([-140 0])
ylabel('Y position [mm]')
xlabel('Time [s]')

subplot(2,1,2)
x_values = t(1:len_y_trace); %1:size(collected_yposition_upper,1);
shadedErrorBar(x_values, squeeze(nanmean(collected_yposition_lower,2)),squeeze(nanstd(collected_yposition_lower(:,:),0,2)/sqrt(size_low)), 'lineProps','k');
hold on 
for stim = 1:length(stim_times)
    xline(stim_times(stim), 'Color', 'r')
end
hold off
title(['Avg Y LOWER ', name])
% xlim([0 3000])
ylim([-280 -140])
ylabel('Y position [mm]')
xlabel('Time [s]')

end