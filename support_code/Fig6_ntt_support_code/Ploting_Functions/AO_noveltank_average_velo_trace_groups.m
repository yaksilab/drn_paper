function [collected_velo_1, collected_velo_2, collected_velo_3, collected_velo_4] = AO_noveltank_average_velo_trace_groups(all_fish, group1, name1, group2, name2 ,group3, name3,group4, name4, folder_path_save, figures_subfolder, timebin, start_point,end_point, stimulus)


n_bins = floor(max(all_fish{group1(1),1}.t)/timebin);
new_time = linspace(0, max(all_fish{group1(1),1}.t), n_bins);
start_time = find(new_time >=start_point);
start_time = start_time(1);
end_time = find(new_time >=end_point);
end_time = end_time(1); 

if timebin < 1
    velo_string = num2str(timebin); 
    velo_string(2) = '_';
    v = all_fish{group1(1),1}.(['binnedVel_' velo_string]);
else
    v = all_fish{group1(1),1}.(['binnedVel_' num2str(timebin)]);
end
len_v_trace = size(v(start_time:end_time),2);  % double check why you floor it
collected_velo_1 = nan([len_v_trace, size(all_fish,1)]);

collected_velo_2 = nan([len_v_trace, size(all_fish,1)]);

collected_velo_3 = nan([len_v_trace, size(all_fish,1)]);

collected_velo_4 = nan([len_v_trace, size(all_fish,1)]);

for fish = 1:size(all_fish,1)
   if ismember(fish,group1)     
%            v = all_fish{fish, 1}.binnedVel_2;
        if timebin < 1
            velo_string = num2str(timebin); 
            velo_string(2) = '_';
            v = all_fish{fish,1}.(['binnedVel_' velo_string]);
        else
            v = all_fish{fish,1}.(['binnedVel_' num2str(timebin)]);
        end
          
       collected_velo_1(:, fish) = v(start_time:end_time);       
   
   elseif ismember(fish,group2)
        if timebin < 1
            velo_string = num2str(timebin); 
            velo_string(2) = '_';
            v = all_fish{fish,1}.(['binnedVel_' velo_string]);
        else
            v = all_fish{fish,1}.(['binnedVel_' num2str(timebin)]);
        end
           collected_velo_2(:, fish) = v(start_time:end_time);
   
   
   elseif ismember(fish,group3)
        if timebin < 1
            velo_string = num2str(timebin); 
            velo_string(2) = '_';
            v = all_fish{fish,1}.(['binnedVel_' velo_string]);
        else
            v = all_fish{fish,1}.(['binnedVel_' num2str(timebin)]);
        end
           collected_velo_3(:, fish) = v(start_time:end_time);
    elseif ismember(fish,group4)
        if timebin < 1
            velo_string = num2str(timebin); 
            velo_string(2) = '_';
            v = all_fish{fish,1}.(['binnedVel_' velo_string]);
        else
            v = all_fish{fish,1}.(['binnedVel_' num2str(timebin)]);
        end
           collected_velo_4(:, fish) = v(start_time:end_time);
   end
end

stim_times = all_fish{group1(1), 1}.timeStampStim(find(~contains(all_fish{group1(1), 1}.stimInfo, "VIB_0")));


figure('units','centimeters','Position',[2 2 38 14])
subplot(5,1,1)
x_values = new_time(start_time:end_time); %1:size(collected_yposition_upper,1);
p1 = shadedErrorBar(x_values, squeeze(nanmean(collected_velo_1,2)),squeeze(nanstd(collected_velo_1(:,:),0,2)/sqrt(size(group1,1))), 'lineProps','r');
hold on 
p2 = shadedErrorBar(x_values, squeeze(nanmean(collected_velo_2,2)),squeeze(nanstd(collected_velo_2(:,:),0,2)/sqrt(size(group2,1))), 'lineProps','k');
p3 = shadedErrorBar(x_values, squeeze(nanmean(collected_velo_3,2)),squeeze(nanstd(collected_velo_3(:,:),0,2)/sqrt(size(group3,1))), 'lineProps','k');
p4 = shadedErrorBar(x_values, squeeze(nanmean(collected_velo_4,2)),squeeze(nanstd(collected_velo_4(:,:),0,2)/sqrt(size(group4,1))), 'lineProps','k');

p1.mainLine.Color = '#8B0000';
p1.patch.FaceColor = '#8B0000'; 
p2.mainLine.Color = '#02055A';
p2.patch.FaceColor = '#02055A'; 
p3.mainLine.Color = '#FFA500';
p3.patch.FaceColor = '#FFA500'; 
if stimulus
    for stim = 1:length(stim_times)
        xline(stim_times(stim), 'Color', 'b')
    end
end
hold off
title(['Avg Velo '])
% xlim([1300 4200])
ylim([0 10])
ylabel([timebin, ' s bined velo'])
xlabel('Time [s]')
legend([p1.mainLine p2.mainLine p3.mainLine, p4.mainLine], {name1, name2, name3, name4})

subplot(5,1,2)
p1 = shadedErrorBar(x_values, squeeze(nanmean(collected_velo_1,2)),squeeze(nanstd(collected_velo_1(:,:),0,2)/sqrt(size(group1,1))), 'lineProps','r');
p1.mainLine.Color = '#8B0000';
p1.patch.FaceColor = '#8B0000'; 
hold on
if stimulus
    for stim = 1:length(stim_times)
        xline(stim_times(stim), 'Color', 'b')
    end
end
hold off
title(['Avg Velo ', name1])
% xlim([0 3000])

% xlim([1300 4200])
ylim([0 10])
ylabel([timebin, ' s bined velo'])
xlabel('Time [s]')
legend([p1.mainLine], {name1})

subplot(5,1,3)
p2 = shadedErrorBar(x_values, squeeze(nanmean(collected_velo_2,2)),squeeze(nanstd(collected_velo_2(:,:),0,2)/sqrt(size(group2,1))), 'lineProps','k');
p2.mainLine.Color = '#02055A';
p2.patch.FaceColor = '#02055A'; 
hold on
if stimulus
    for stim = 1:length(stim_times)
        xline(stim_times(stim), 'Color', 'b')
    end
end
hold off
title(['Avg Velo ', name2])
% xlim([0 3000])
% xlim([1300 4200])
ylim([0 10])
ylabel([timebin, ' s bined velo'])
xlabel('Time [s]')
legend([p2.mainLine], {name2})

subplot(5,1,4)
p2 = shadedErrorBar(x_values, squeeze(nanmean(collected_velo_3,2)),squeeze(nanstd(collected_velo_3(:,:),0,2)/sqrt(size(group3,1))), 'lineProps','k');

hold on
if stimulus
    for stim = 1:length(stim_times)
        xline(stim_times(stim), 'Color', 'b')
    end
end
hold off
title(['Avg Velo ', name3])
% xlim([0 3000])
% xlim([1300 4200])
ylim([0 10])
ylabel([timebin, ' s bined velo'])
xlabel('Time [s]')
legend([p2.mainLine], {name3})

subplot(5,1,5)
p2 = shadedErrorBar(x_values, squeeze(nanmean(collected_velo_4,2)),squeeze(nanstd(collected_velo_4(:,:),0,2)/sqrt(size(group4,1))), 'lineProps','k');

hold on
if stimulus
    for stim = 1:length(stim_times)
        xline(stim_times(stim), 'Color', 'b')
    end
end
hold off
title(['Avg Velo ', name3])
% xlim([0 3000])
% xlim([1300 4200])
ylim([0 10])
ylabel([timebin, ' s bined velo'])
xlabel('Time [s]')
legend([p2.mainLine], {name4})

figure('units','centimeters','Position',[2 2 20 14])
p1 = shadedErrorBar(x_values, squeeze(nanmean(collected_velo_1,2)),squeeze(nanstd(collected_velo_1(:,:),0,2)/sqrt(size(group1,1))), 'lineProps','k');
hold on 
% p2 = shadedErrorBar(x_values, squeeze(nanmean(collected_velo_2,2)),squeeze(nanstd(collected_velo_2(:,:),0,2)/sqrt(size(group2,1))), 'lineProps','k');
p3 = shadedErrorBar(x_values, squeeze(nanmean(collected_velo_3,2)),squeeze(nanstd(collected_velo_3(:,:),0,2)/sqrt(size(group3,1))), 'lineProps','r');
% p4 = shadedErrorBar(x_values, squeeze(nanmean(collected_velo_4,2)),squeeze(nanstd(collected_velo_4(:,:),0,2)/sqrt(size(group4,1))), 'lineProps','k');

% p1.mainLine.Color = '#8B0000';
% p1.patch.FaceColor = '#8B0000'; 
% p2.mainLine.Color = '#02055A';
% p2.patch.FaceColor = '#02055A'; 
% % p3.mainLine.Color = '#FFA500';
% % p3.patch.FaceColor = '#FFA500'; 
if stimulus
    for stim = 1:length(stim_times)
        xline(stim_times(stim), 'Color', 'b')
    end
end
hold off
title(['Avg Velo '])
% xlim([1300 4200])
% ylim([0 10])
ylabel([timebin, ' s bined velo'])
xlabel('Time [s]')
legend([p1.mainLine p3.mainLine], {name1, name3})

figure('units','centimeters','Position',[2 2 20 14])
% p1 = shadedErrorBar(x_values, squeeze(nanmean(collected_velo_1,2)),squeeze(nanstd(collected_velo_1(:,:),0,2)/sqrt(size(group1,1))), 'lineProps','k');
hold on 
p2 = shadedErrorBar(x_values, squeeze(nanmean(collected_velo_2,2)),squeeze(nanstd(collected_velo_2(:,:),0,2)/sqrt(size(group2,1))), 'lineProps','k');
% p3 = shadedErrorBar(x_values, squeeze(nanmean(collected_velo_3,2)),squeeze(nanstd(collected_velo_3(:,:),0,2)/sqrt(size(group3,1))), 'lineProps','r');
p4 = shadedErrorBar(x_values, squeeze(nanmean(collected_velo_4,2)),squeeze(nanstd(collected_velo_4(:,:),0,2)/sqrt(size(group4,1))), 'lineProps','r');

% p1.mainLine.Color = '#8B0000';
% p1.patch.FaceColor = '#8B0000'; 
% p2.mainLine.Color = '#02055A';
% p2.patch.FaceColor = '#02055A'; 
% % p3.mainLine.Color = '#FFA500';
% % p3.patch.FaceColor = '#FFA500'; 
if stimulus
    for stim = 1:length(stim_times)
        xline(stim_times(stim), 'Color', 'b')
    end
end
hold off
title(['Avg Velo '])
% xlim([1300 4200])
% ylim([0 10])
ylabel([timebin, ' s bined velo'])
xlabel('Time [s]')
legend([p2.mainLine p4.mainLine], {name2, name4})

end