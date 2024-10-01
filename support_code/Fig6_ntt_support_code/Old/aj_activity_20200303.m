function [all_fish]=aj_activity_20200303(all_fish,nROIs,timebin,folder_path_save,fish_name,date_exp,figures_subfolder,group1,group2,allgroups,name_group1,name_group2)

% Additional lines/arguments must be added/removed if no. of groups is
% changed. These placed are labeled 'n-change' in this function :)

inactivityDefinition    =   1/30;%1800; % Time of inactivity (in sec) needed for definition of sleep/inactivity, according to https://www.frontiersin.org/articles/10.3389/fncir.2013.00058/full
sleep_speed_threshold   =   0; % Threshold for definition of inactivity/sleep (in mm/s)
activityDefinition      =   1/30; % time in seconds with moveement to count as active

for ROI=1:nROIs
    
    %load variables
    speed_over_time = all_fish{ROI,1}.speed_over_time;
    dt              = all_fish{ROI,1}.dt;
    
    %Find periods with "sleep"; i.e. periods with inactivity for =>1 min
    timeInactive            =   0; %temporary variable; counts time of inactivity (= speed 0 mm/s)
    K                       =   1; %temporary variable
    frameActivityInfo       =   0; %temporary variable; saves 0 if the fish is inactive and 1 if active
    timeActive              =   0;
    L                       =   1;
    frame_go_to_sleep       =   [];
    frame_wake_up           =   [];
    inactivityPeriods       =   [];
    bouts                   =   [];
    
    
    
    for i=2:length(dt)
        if( speed_over_time(i-1) <= sleep_speed_threshold && i==2) %starts at first registered speed (at frame 2); registers and start counting if fish is inactive
            frameActivityInfo=0; %if inactive, starts to count
            frame_go_to_sleep=1;  %... and register frame where starts to be inactive
        end
        
        if( speed_over_time(i-1) > sleep_speed_threshold && speed_over_time(i) <= sleep_speed_threshold) %...same as above, but this restarts counting when becomes inactive again
            frameActivityInfo=0;
            frame_go_to_sleep=i;
        end
        
        if( speed_over_time(i-1) <= sleep_speed_threshold && speed_over_time(i) > sleep_speed_threshold) %registers if fish becomes active
            frameActivityInfo=1; %if so, it the fish is active
            frame_wake_up=i; %... and register this frame as the 'wake up' frame
        end
        
        if( speed_over_time(i) <= sleep_speed_threshold && i==length(dt) ) %when reaches end of matrix ...
            frameActivityInfo=0; %...stop counting....
            frame_wake_up=i; %...and registers as 'wake up', to stop the counting
        end
        
        if(frameActivityInfo==0) %as long as it is true that is still inactive (=1)...
            timeInactive=timeInactive+dt(i); %...continue counting
            1;
        else
            if(timeInactive >= inactivityDefinition) %asks if time of inactivity is above threshold (here: 1 min)
                inactivityPeriods([1:3],K)=[frame_go_to_sleep; frame_wake_up; timeInactive]; %if so, save frames when  goes to sleep and wakes up + time of inactivity
                K=K+1;
                2;
            end
            timeInactive    = 0;
        end
        
        if (frameActivityInfo==1)
            timeActive = timeActive + dt(i);
            1;
        else
            if timeActive >= activityDefinition
                bouts([1:3],L) =[frame_wake_up; frame_go_to_sleep; timeActive]; % save bout information.
                L=L+1;
                2;
            end
            timeActive = 0;
        end
        
    end
    
    all_fish{ROI,1}.inactivityPeriods   =   inactivityPeriods;
    all_fish{ROI,1}.bouts               =   bouts;
end

% save([folder_path_save,filesep,fish_name,date_exp '_data.mat'],'all_fish','-v7.3');