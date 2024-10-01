function [all_fish] =  aj_eventdetection (all_fish,timebin,folder_path_save,fish_name,date_exp,group1,group2,group3, group4, group5, name_group1,name_group2, name_group3, name_group4, name_group5,figures_subfolder, group_category,nROIs,groups,name_groups,threshold,transitionTime)


% Finds the events where the veliocity suddenly increease with a dvv > 80%
% for a timebin,followed by sustained high velocity and ended by a sudden
% velocitycange

% with start-bin and end-bin, and also the length of the period


eThreshold                  =   2; % Threshold for definition of inactivity/sleep (in mm/s)
activityDef                 =   1; % time in seconds with moveement to count as active

dThreshold                  =   0; %percent velocity change count as depressed velocity


for ROI=1:nROIs
    
    %load variables
    dvv   = all_fish{ROI, 1}.DVV_trad;
    dt    = ones (1,floor(max(all_fish{ROI,1}.t)));
    
    for j = 1:length(dvv)
        if dvv(j)>=70
            dvv(j) = 2;
        elseif dvv(j)<=-50
            dvv(j) = 0;
        else
            dvv(j) = 1;
            
        end
    end

    
    
    % Find periods with "velocity-increase"; i.e. periods with activity as
    % described above
    
    % Temporary variables 
    event_Start         = [];
    event_End           = []; 
    dep_Start           = [];
    activity_info       = 0;
    event_Time          = 0;
    Events              = [];
    K                   = 1; 
    
    
     if isnan(nanmean(all_fish{ROI,1}.DVV_trad(:,:),2))
        all_fish{ROI,1}.EventTrad   =   nan;
     else 
         for i=2:length(dt)
            if dvv(i-1)> eThreshold && i==2
                activity_info   = 1;
                event_Start     = i-1;
            elseif  dvv(i-1)< eThreshold && i==2
                activity_info   = 0;
            end
            
            if dvv(i-1) < eThreshold && activity_info ~=1 && dvv(i)>=eThreshold %% start counting when i==2
               activity_info    = 1;
               event_Start      = i;
            else 
                activity_info   = 0; 
            end 
            
            if dvv(i-1)< dThreshold && activity_info ==1
                activity_info   = 0;
                event_End       = i;
            end 
            
            if activity_info==1 && i~=length(dt)
                event_Time = event_Time+dt(i);
                
            elseif activity_info==1 && i==length(dt)
                event_Time = event_Time+dt(i);
                Events(:,K) = [event_Start; event_End; event_Time];
                K=K+1;
                
            else
                if event_Time >=activityDef 
                    Events(:,K) = [event_Start; event_End; event_Time];
                    K=K+1;
                end 
                time_Event = 0;
            end               
                
                
         end 
     end 
    
end


%             elseif (event_Counter==0) && i~=length(dt) &&...
%                    (dvv(i)< eventThreshold/2)&& (dvv(i)> depressionThreshold)
%                 
%                 psudoEvents([1:3],K) =[event_Start; pseudoEvent_end; event_Time];
%                 K=K+1;
%                 
%                 event_Counter = 0;

% else 
%                 Events([1:3],L) = [event_Start; event_End; event_Time];
%                 L=L+1;
%             
%                 activity_info = 0; 