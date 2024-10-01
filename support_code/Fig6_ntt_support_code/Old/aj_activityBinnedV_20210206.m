function [all_fish]=aj_activityBinnedV_20210206(all_fish,nROIs,timebin,folder_path_save,fish_name,date_exp,figures_subfolder,group1,group2,allgroups,name_group1,name_group2)

% Additional lines/arguments must be added/removed if no. of groups is
% changed. These placed are labeled 'n-change' in this function :)

VelMat = nan(1,9600);
for ROI = 1:nROIs
    VelMat(ROI,1:9600) = (all_fish{ROI, 1}.binnedVel(1,1:9600));    
end

sleep_speed_threshold   =   prctile (VelMat,5,'all'); % Threshold for definition of inactivity/sleep (in mm/s)
inactivityDefinition    =   1;%1800; % Time of inactivity (in sec) needed for definition of sleep/inactivity, according to https://www.frontiersin.org/articles/10.3389/fncir.2013.00058/full
activityDefinition      =   1; % time in seconds with moveement to count as active

for ROI=1:nROIs
    
    %load variables
    binnedVel       = all_fish{ROI,1}.binnedVel;
    dt              = all_fish{ROI,1}.dt;
    t               = all_fish{ROI,1}.t;
    
    %Find periods with "sleep"; i.e. periods with inactivity for =>1 min
    timeInactive            =   0; %temporary variable; counts time of inactivity (= speed 0 mm/s)
    K                       =   1; %temporary variable
    frameActivityInfo       =   0; %temporary variable; saves 0 if the fish is inactive and 1 if active
    timeActive              =   0;
    L                       =   1;
    time_go_to_sleep        =   []; % time in seconds for going inavtive
    time_wake_up            =   [];
    inactivityPeriods       =   [];
    bouts                   =   [];
    timebin                 =   1;
    
    nbins   = floor(sum (dt)/timebin);
    dT      = nan (1,nbins);
    for i   = 1:nbins
    dT(1,i)                 =   sum(dt(t>(i-1)*timebin & t<=i*timebin));
    end 
    
    
    
    for i=2:length(dT)
        if( binnedVel(i-1) <= sleep_speed_threshold && i==2) %starts at first registered speed (at frame 2); registers and start counting if fish is inactive
            frameActivityInfo=0; %if inactive, starts to count
            time_go_to_sleep=1;  %... and register frame where starts to be inactive
        end
        
        if( binnedVel(i-1) > sleep_speed_threshold && binnedVel(i) <= sleep_speed_threshold) %...same as above, but this restarts counting when becomes inactive again
            frameActivityInfo=0;
            time_go_to_sleep=i;
        end
        
        if( binnedVel(i-1) <= sleep_speed_threshold && binnedVel(i) > sleep_speed_threshold) %registers if fish becomes active
            frameActivityInfo=1; %if so, it the fish is active
            time_wake_up=i; %... and register this frame as the 'wake up' frame
        end
        
        if( binnedVel(i) <= sleep_speed_threshold && i==length(dT) ) %when reaches end of matrix ...
            frameActivityInfo=0; %...stop counting....
            time_wake_up=i; %...and registers as 'wake up', to stop the counting
        end
        
        if(frameActivityInfo==0) %as long as it is true that is still inactive (=1)...
            timeInactive=timeInactive+dT(i); %...continue counting
            1;
        else
            if(timeInactive >= inactivityDefinition) %asks if time of inactivity is above threshold (here: 1 min)
                inactivityPeriods([1:3],K)=[time_go_to_sleep; time_wake_up; timeInactive]; %if so, save frames when  goes to sleep and wakes up + time of inactivity
                K=K+1;
                2;
            end
            timeInactive    = 0;
        end
        
        if (frameActivityInfo==1)
            timeActive = timeActive + dT(i);
            1;
        else
            if timeActive >= activityDefinition
                bouts([1:3],L) =[time_wake_up; time_go_to_sleep; timeActive]; % save bout information.
                L=L+1;
                2;
            end
            timeActive = 0;
        end
        
    end
    
    all_fish{ROI,1}.inactivityPeriods_1sec  =   inactivityPeriods;
    all_fish{ROI,1}.bouts_1                 =   bouts;
end

% save([folder_path_save,filesep,fish_name,date_exp '_data.mat'],'all_fish','-v7.3');