function [results] = EventDetectionScript(results,flds,fish_names)
for j=1:length(flds(1:6,:))
    all_fish                    =   results.(flds{j,1});
    nROIs                       =   length(all_fish);
    highVel_thresholds          =   [5,10,15];
    
    for k=1:length(highVel_thresholds)
        
        thresholdV      =   highVel_thresholds(k);
                
        for ROI=1:nROIs
            %% load variables
            fActive       = 0;    % binomial; frame active or not
            EventStart    = [];   % frame number for start of high vel
            EventEnd      = [];   % frame number for end of high vel event
            counter       = [];    % counts the length of th event in frames
            Events        = [];   % record information for each event
            Events2       = [];
            L             = 1;    % temporary variable
            
            v             =   all_fish{ROI,1}.binnedVel_2_43Hz;
            ang     =   all_fish{ROI,1}.binnedAng2_43;
            dt      =   diff([1/2.433846153846:1/2.433846153846:...
                max(all_fish{ROI,1}.t(1:end-1))]);
            
            
            
            %% look for each bin and record if it is active with high velocity
            
            for i=2:length(dt)
                if i==2
                    if v(i-1) >= thresholdV && v(i) >=thresholdV
                        fActive     = 1;
                        EventStart  = i-1;
                        counter     = 1;
                    elseif v(i-1) >= thresholdV && v(i) <thresholdV
                        fActive     = 0;
                        EventStart  = i-1;
                        counter     = 1;
                        EventEnd    = i;
                        EventLength = 1*(1/2.433846153846);
                        if fActive == 0 && ~isempty(counter)
                            if EventLength <.5
                                Events(1:4,L)   = [EventStart;EventEnd;...
                                EventLength;sum(ang...
                                (EventStart-1),...
                                'omitnan')];
                            else
                                Events(1:4,L)   = [EventStart;EventEnd;...
                                EventLength;mean(ang...
                                (EventStart-1:EventEnd-2),...
                                'omitnan')];
                            end 
                            L               = L+1;
                            
                            EventStart      = [];
                            EventEnd        = [];
                            EventLength     = [];
                            counter         = [];
                        end
                        
                    end
                elseif i>2 && i< length(dt)
                    if v(i-1) <= thresholdV && v(i) <=thresholdV
                        fActive     = 0;
                    elseif v(i-1) <= thresholdV && v(i) >=thresholdV
                        fActive     = 1;
                        EventStart  = i;
                        counter     = 1;
                    elseif v(i-1) >= thresholdV && v(i) >=thresholdV
                        fActive     = 1;
                        counter     = counter+1;
                    elseif v(i-1) >= thresholdV && v(i) <thresholdV && v(i)>0 % velocities between
                        fActive     = 0;
                        EventEnd    = [];
                        EventStart  = [];
                        counter     = [];
                    elseif v(i-1) >= thresholdV &&  v(i) == 0
                        fActive         = 0;
                        EventEnd        = i;
                        EventLength     = counter*(1/2.433846153846);
                    end
                    
                    if fActive == 0
                        if isempty(counter)
                        else
                            if EventLength <.5
                                Events(1:4,L)   = [EventStart;EventEnd;...
                                EventLength;sum(ang...
                                (EventStart-1),...
                                'omitnan')];
                            else 
                                Events(1:4,L)   = [EventStart;EventEnd;...
                                EventLength;sum(ang...
                                (EventStart-1:EventEnd-2),...
                                'omitnan')];
                            end 
                            L               = L+1;
                            EventStart      = [];
                            EventEnd        = [];
                            EventLength     = [];
                            counter         = [];
                        end
                        
                    end
                elseif i==length(dt)
                    if v(i-1) <= thresholdV && v(i) >=thresholdV
                        fActive     = [];
                        EventStart  = [];
                        counter     = [];
                    elseif v(i-1) >= thresholdV && v(i) >=thresholdV
                        fActive     = [];
                        EventStart  = [];
                        counter     = [];
                    elseif v(i-1) >= thresholdV && v(i) <thresholdV && v(i)>0
                        fActive     = 0;
                        EventStart  = [];
                        counter     = [];
                    elseif v(i-1) >= thresholdV &&  v(i) == 0
                        fActive         = 0;
                        EventEnd        = i;
                        EventLength     = counter*(1/2.433846153846);
                    end
                    
                    if fActive == 0
                        if isempty(counter)
                        else
                            if EventLength <.5
                                Events(1:4,L)   = [EventStart;EventEnd;...
                                    EventLength;sum(ang...
                                    (EventStart-1),...
                                    'omitnan')];
                            else
                                Events(1:4,L)   = [EventStart;EventEnd;...
                                    EventLength; sum(ang...
                                    (EventStart-1:EventEnd-2),...
                                    'omitnan')];
                            end
                            
                            L               = L+1;
                            EventStart      = [];
                            EventEnd        = [];
                            EventLength     = [];
                            counter         = [];
                        end
                    end
                    
                end
            end
            for m =1:size(Events,2)                                         % check if events satisfy "erraticness" criteria - 2*pi
                if Events(4,m) <2*pi
                    Events(1:4,m) = nan;
                end                
            end 
            
            if isempty(Events)
                Events2 =[];
            else
                Events2(1:4,:) = Events(:,all(~isnan(Events(1:4,:)))); % A(:,all(~isnan(A)))
            end 
            
            results.SL_Events.(flds{j,1}){k,1}{ROI,1} = Events2;
            results.SL_Events.(flds{j,1}){k,1}{ROI,2} = size(Events2,2);        % num of events
            if isempty(Events2)
            results.SL_Events.(flds{j,1}){k,1}{ROI,3} = nan;
            else
            results.SL_Events.(flds{j,1}){k,1}{ROI,3} = mean(Events2(3,:));     % mean duration  
            end 
        end
    end
    
    
end