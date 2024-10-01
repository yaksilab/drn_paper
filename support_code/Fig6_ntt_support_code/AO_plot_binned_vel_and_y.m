function AO_plot_binned_vel_and_y(all_fish, nROIs, timebin, group, name)

numExp = nROIs/6;
for i=1:numExp
lowerRow (i*3-(3-1):i*3) = [4 5 6]+6*(i-1); % make an array for the lower row of ROIs 
end
% binned speed 
figure()
% hold on
for ROI = 1:nROIs
    if ismember(ROI, group)
        fish_speed = all_fish{ROI, 1}.binnedVel_2;
        stim_times = all_fish{ROI, 1}.timeStampStim(find(~contains(all_fish{ROI, 1}.stimInfo, "VIB_0"))); 

        n_bins = floor(max(all_fish{ROI,1}.t)/timebin);
        new_time = linspace(0, max(all_fish{ROI,1}.t), n_bins); 


        subplot(nROIs, 1, ROI)
        % plot(all_fish{1, 1}.t(1:end-1),fish_speed)
        plot(new_time,fish_speed)
        hold on 
        for stim = 1:length(stim_times)
    %         disp(stim_times(stim))
            xline(floor(stim_times(stim)), 'Color', 'r')
        end 
        title(['Binned Velocity Fish ', int2str(ROI), ' ', name])
        ylabel([int2str(timebin) ' s binned velocity'])
        xlabel('Time [s]')
        hold off
    else
        continue
    end
end

%y pos
figure()
hold on
for ROI = 1:nROIs
    if ismember(ROI, group)
        y_pos = -all_fish{ROI, 1}.y; % minus because the y is upside down
        stim_times = all_fish{ROI, 1}.timeStampStim(find(~contains(all_fish{ROI, 1}.stimInfo, "VIB_0"))); 

    % here I bumpup the y position for the fish that are in the bottom line in
    % addition to bumping up each of the fish... 
        if ismember(ROI,lowerRow)
            bump_up = 140 + 150*ROI; 
        else
            bump_up = 150*ROI;
        end
    %     bump_up = 200*ROI;
        plot(all_fish{ROI, 1}.t,y_pos + bump_up)
        hold on 
        for stim = 1:length(stim_times)
    %         disp(stim_times(stim))
            xline(floor(stim_times(stim)), 'Color', 'r')
        end 
        title(['Y Pos Fish ', int2str(ROI),' ', name])
        ylabel(['Y position [mm]'])
        xlabel('Time [s]')
%     hold off
    else 
        continue
    end
end
% %y pos as a heat map?
% figure()
% hold on
% all_ys_upper = []; 
% all_ys_lower = []; 
% for ROI = 1:nROIs
%     if ismember(ROI, group)
%         y_pos = -all_fish{ROI, 1}.y; % minus because the y is upside down
%         stim_times = all_fish{ROI, 1}.timeStampStim(find(~contains(all_fish{ROI, 1}.stimInfo, "VIB_0"))); 
%         
%         if ismember(ROI,lowerRow)
%             all_ys_lower = [all_ys_lower; y_pos(1:34200)']; % random number because they are all not the same ... 
%         else
%             all_ys_upper = [all_ys_upper; y_pos(1:34200)']; 
%         end
% %         plot(all_fish{ROI, 1}.t,y_pos + bump_up)
% %         hold on 
% %         for stim = 1:length(stim_times)
% %     %         disp(stim_times(stim))
% %             xline(floor(stim_times(stim)), 'Color', 'r')
% %         end 
% %         title(['Y Pos Fish ', int2str(ROI)])
% %         ylabel(['Y position [mm]'])
% %         xlabel('Time [s]')
% %     hold off
%     else 
%         continue
%     end
% end
% % all_ys_upper(:,find(all(isnan(x),2)))
% subplot(2,1,1)
% imagesc(all_ys_upper)
% title('y position upper')
% 
% subplot(2,1,2)
% imagesc(all_ys_lower)
% title('y position lower')
% x position
figure()
for ROI = 1:nROIs
    if ismember(ROI, group)
        x_pos = all_fish{ROI, 1}.x; % minus because the y is upside down
        stim_times = all_fish{ROI, 1}.timeStampStim(find(~contains(all_fish{ROI, 1}.stimInfo, "VIB_0"))); 

    %     n_bins = floor(max(all_fish{ROI,1}.t)/timebin);
    %     new_time = linspace(0, max(all_fish{ROI,1}.t), n_bins); 

        subplot(nROIs, 1, ROI)
        % plot(all_fish{1, 1}.t(1:end-1),fish_speed)
        plot(all_fish{ROI, 1}.t,x_pos)
        hold on 
        for stim = 1:length(stim_times)
    %         disp(stim_times(stim))
            xline(floor(stim_times(stim)), 'Color', 'r')
        end 
        title(['X Pos Fish ', int2str(ROI), ' ', name])
        ylabel(['X position [mm]'])
        xlabel('Time [s]')
        hold off
    else 
        continue
    end
end

end