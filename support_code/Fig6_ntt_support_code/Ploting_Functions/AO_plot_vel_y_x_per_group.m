function AO_plot_vel_y_x_per_group(all_fish, nROIs, timebin, group, name, start_time)
%AO_plot_vel_y_x_per_group - Plots the binned velocity and the y
%postions (x pos is disabled right now) of the fish of one group
%   Author: Anna Maria Ostenrath

%
%   Syntax:
%       AO_plot_vel_y_x_per_group(all_fish, nROIs, timebin, group, name, start_time)
%
%   Description:
%       AO_plot_vel_y_x_per_group() - plot x y and velocity
%    
%   Inputs:
%       all_fish - cell array with all of the fish data including binned
%       velo, y and x position
%       nROIs - total number of fish so we can determine which fish was at
%       which position
%       timebin - timebin used for binning the velocity data
%       group - list indicating which fish belong to the group of interest
%       name - name of the group
%       start_time - time when the protocol started in s (e.g. if there was 20 min of novel tank you could start at 1300 s)
%
%   Outputs:
%       output1 - Description
%       output2 - Description
%
%   Examples: 
%       Line 1 of example
%       Line 2 of example
%       Line 3 of example
%   Notes: 
%       Change the x position plotting to adapt that the x position are
%       still over the entire field of view
%       Line 2 of example
%       Line 3 of example
%
%   Other m-files required: none
%   Subfunctions: none
%   MAT-files required: none
%
%   See also: AO_plot_binned_vel_and_y (this function is based on this one),  OTHER_FUNCTION_NAME2

%   Author: Anna Maria Ostenrath 
%   Date : April 2022	

numExp = nROIs/6;
for i=1:numExp
lowerRow (i*3-(3-1):i*3) = [4 5 6]+6*(i-1); % make an array for the lower row of ROIs 
end
% binned speed 
figure()
hold on
for ROI = 1:size(group,1)
    % here we make sure we use the velo that belongs to the time bin we are
    % using 
    if timebin < 1
        velo_string = num2str(timebin); 
        velo_string(2) = '_';
        fish_speed = all_fish{group(ROI),1}.(['binnedVel_' velo_string]);
    else
        fish_speed = all_fish{group(ROI),1}.(['binnedVel_' num2str(timebin)]);
    end

    stim_times = all_fish{group(ROI), 1}.timeStampStim(find(~contains(all_fish{group(ROI), 1}.stimInfo, "VIB_0"))); 

    n_bins = floor(max(all_fish{group(ROI),1}.t)/timebin);
    new_time = linspace(0, max(all_fish{group(ROI),1}.t), n_bins); 
    
    start_point = find(new_time >= start_time); 
    start_point = start_point(1); 

%         subplot(nROIs, 1, group(ROI))
    % plot(all_fish{1, 1}.t(1:end-1),fish_speed)
    bump_up = 10*ROI; % to just put them all on top of each other
    plot(new_time(:,start_point:end),fish_speed(:,start_point:end) + bump_up)
    hold on 
    for stim = 1:length(stim_times)
%         disp(stim_times(stim))
        xline(floor(stim_times(stim)), 'Color', 'r')
    end 
    title(['Binned Velocity ', name])
    ylabel([num2str(timebin) ' s binned velocity'])
    xlabel('Time [s]')
    
        
end

%y pos
figure()
hold on
for ROI = 1:size(group,1)
    
    y_pos = -all_fish{group(ROI), 1}.y; % minus because the y is upside down
    stim_times = all_fish{group(ROI), 1}.timeStampStim(find(~contains(all_fish{group(ROI), 1}.stimInfo, "VIB_0"))); 

% here I bumpup the y position for the fish that are in the bottom line in
% addition to bumping up each of the fish... 
    if ismember(group(ROI),lowerRow)
        bump_up = 168 + 120*ROI; 
    else
        bump_up = 26 + 120*ROI;
    end
%     bump_up = 200*ROI;
    start_point = find(all_fish{group(ROI), 1}.t >= start_time); 
    start_point = start_point(1); 
    plot(all_fish{group(ROI), 1}.t(start_point:end),y_pos(start_point:end) + bump_up)
    hold on 
    for stim = 1:length(stim_times)
%         disp(stim_times(stim))
        xline(floor(stim_times(stim)), 'Color', 'r')
    end 
    title(['Y Pos  ', name])
    ylabel(['Y position [mm]'])
    xlabel('Time [s]')
%     hold off
    
end

% x position
% figure()
% hold on
% for ROI = 1:size(group,1)
%     
%     x_pos = all_fish{group(ROI), 1}.x; % minus because the y is upside down
%     stim_times = all_fish{group(ROI), 1}.timeStampStim(find(~contains(all_fish{group(ROI), 1}.stimInfo, "VIB_0"))); 
% 
% %     n_bins = floor(max(all_fish{ROI,1}.t)/timebin);
% %     new_time = linspace(0, max(all_fish{ROI,1}.t), n_bins); 
% 
%     subplot(nROIs, 1, ROI)
%     % plot(all_fish{1, 1}.t(1:end-1),fish_speed)
%     start_point = find(all_fish{group(ROI), 1}.t >= start_time); 
%     start_point = start_point(1); 
%     plot(all_fish{group(ROI), 1}.t(start_point:end),x_pos(start_point:end))
%     hold on 
%     for stim = 1:length(stim_times)
% %         disp(stim_times(stim))
%         xline(floor(stim_times(stim)), 'Color', 'r')
%     end 
%     title(['X Pos Fish ', int2str(group(ROI)), ' ', name])
%     ylabel(['X position [mm]'])
%     xlabel('Time [s]')
%     hold off
% 
% end

end