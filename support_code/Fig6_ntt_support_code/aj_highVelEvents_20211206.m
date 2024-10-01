function [all_fish]=aj_highVelEvents_20211206(all_fish,nROIs,timebin,folder_path_save,fish_name,date_exp,figures_subfolder,group1,group2,allgroups,name_group1,name_group2,highVel_thresholds)

% calculates the activity and inactivity periods for 1 seconds binned data
% with start-bin and end-bin, and also the length of the period
for j= 1:length(highVel_thresholds)
    inactivityDefinition        =   1;%1800; % Time of inactivity (in sec) needed for definition of sleep/inactivity, according to https://www.frontiersin.org/articles/10.3389/fncir.2013.00058/full
    highSpeedEvent_threshold    =   highVel_thresholds(j); % Threshold for definition of inactivity/sleep (in mm/s)
    activityDefinition          =   1; % time in seconds with moveement to count as active
    
    for ROI=1:nROIs
        
        %load variables
        meanVelbinned   = all_fish{ROI,1}.(['binnedVel_' num2str(timebin)]);
        dt              = ones (1,floor(max(all_fish{ROI,1}.t)));
        
        %Find periods with "sleep"; i.e. periods with inactivity for =>1 min
        timeInactive            =   0; %temporary variable; counts time of inactivity (= speed 0 mm/s)
        K                       =   1; %temporary variable
        binActivityInfo         =   0; %temporary variable; saves 0 if the fish is inactive and 1 if active
        timeActive              =   0;
        L                       =   1;
        bin_go_to_sleep         =   [];
        bin_wake_up             =   [];
        lowSpeedPeriods         =   [];
        bouts                   =   [];
        
        if isnan(mean(all_fish{ROI,1}.(['binnedVel_' num2str(timebin)])(:,:),2,'omitnan'))
            all_fish{ROI,1}.binnedInactivityPeriods   =   nan;
            all_fish{ROI,1}.BinnedBouts               =   nan;
        else
            
            for i=2:length(dt)
                if( (meanVelbinned(i-1) < highSpeedEvent_threshold || isnan(meanVelbinned(i-1)) ) && i==2) %starts at first registered speed (at bin 2); registers and start counting if fish is inactive
                    binActivityInfo=0; %if inactive, starts to count
                    bin_go_to_sleep=1;  %... and register bin where starts to be inactive
                elseif ( meanVelbinned(i-1) >= highSpeedEvent_threshold && i==2)
                    binActivityInfo=1;
                    bin_wake_up=1;
                end
                
                if( meanVelbinned(i-1) >= highSpeedEvent_threshold && meanVelbinned(i) < highSpeedEvent_threshold) %...same as above, but this restarts counting when becomes inactive again
                    binActivityInfo=0;
                    bin_go_to_sleep=i;
                elseif ( meanVelbinned(i-1) >= highSpeedEvent_threshold && isnan(meanVelbinned(i)))
                    binActivityInfo=0;
                    bin_go_to_sleep=i;
                end
                
                if(( meanVelbinned(i-1) < highSpeedEvent_threshold || isnan (meanVelbinned(i-1))) && meanVelbinned(i) >= highSpeedEvent_threshold) %registers if fish becomes active
                    binActivityInfo=1; %if so, it the fish is active
                    bin_wake_up=i; %... and register this bin as the 'wake up' bin
                end
                
                if( meanVelbinned(i) < highSpeedEvent_threshold || isnan (meanVelbinned(i)) && i==length(dt) ) %when reaches end of matrix ...
                    binActivityInfo=0; %...stop counting....
                    bin_wake_up=i; %...and registers as 'wake up', to stop the counting
                elseif ( meanVelbinned(i) >= highSpeedEvent_threshold && i==length(dt) )
                    binActivityInfo=1;
                    bin_go_to_sleep=i;
                end
                
                if(binActivityInfo==0) && i~=length(dt) %as long as it is true that is still inactive (=1)...
                    timeInactive=timeInactive+dt(i); %...continue counting
                    1;
                elseif binActivityInfo==0 && i==length(dt) && (timeInactive >= inactivityDefinition)
                    timeInactive=timeInactive+dt(i);
                    if(timeInactive >= inactivityDefinition) %asks if time of inactivity is above threshold (here: 1 min)
                        lowSpeedPeriods([1:3],K)=[bin_go_to_sleep; bin_wake_up; timeInactive]; %if so, save bins when  goes to sleep and wakes up + time of inactivity
                        K=K+1;
                        2;
                    end
                else
                    if(timeInactive >= inactivityDefinition) %asks if time of inactivity is above threshold (here: 1 min)
                        lowSpeedPeriods([1:3],K)=[bin_go_to_sleep; bin_wake_up; timeInactive]; %if so, save bins when  goes to sleep and wakes up + time of inactivity
                        K=K+1;
                        2;
                    end
                    timeInactive    = 0;
                end
                
                if (binActivityInfo==1) && i~=length(dt)
                    timeActive = timeActive + dt(i);
                    1;
                elseif binActivityInfo==1 && i==length(dt) && timeActive >= activityDefinition
                    timeInactive=timeInactive+dt(i);
                    bouts([1:3],L) =[bin_wake_up; bin_go_to_sleep; timeActive]; % save bout information.
                    L=L+1;
                    2;
                else
                    if timeActive >= activityDefinition
                        bouts([1:3],L) =[bin_wake_up; bin_go_to_sleep; timeActive]; % save bout information.
                        L=L+1;
                        2;
                    end
                    timeActive = 0;
                end
                
            end
            
            %all_fish{ROI,1}.V_above_threshold.lowSpeedEvent{j,1}                 =   lowSpeedPeriods;
            all_fish{ROI,1}.V_above_threshold.highSpeedEvent{j,1}                 =   bouts;
            all_fish{ROI,1}.V_above_threshold.highSpeedEvent{j,2}                 =   highSpeedEvent_threshold;

        end
    end
end

%  save([folder_path_save,filesep,fish_name,date_exp '_data.mat'],'all_fish','-v7.3');