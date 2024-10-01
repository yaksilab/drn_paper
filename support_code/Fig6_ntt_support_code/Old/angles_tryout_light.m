tempMat6_resampled  = cell(5,3); 

for i=1:5
    for ROI=1:nROIs
    tempMat6_resampled{i,1}        = tempMat6{i, 1};
    tempMat6_resampled{i,2}(ROI,:) = (tempMat6{i, 2}(ROI,1:600));
    tempMat6_resampled{i,3}(ROI,:) = (tempMat6{i, 3}(ROI,1:600));
    end 
end 

%   calculate angles method 1
n_bins2 = 600;
for j=1:5
for ROI=1:nROIs
    %% Initialize data
    t30=timebin:timebin:600;
    
    %% calculate angles between adjacent datapoints  
    
    directions          = (atan2(-diff(tempMat6_resampled{j,3}(ROI,:)),...
                            (diff(tempMat6_resampled{j,2}(ROI,:)))));                                % direction of each leg in relation to the x-axis, minus in front of 
    ddiff               = diff(directions);                                                          % angle at each corner, change in direction 
    ang_temp            = mod(ddiff+pi,2*pi)-pi;                                                     % should give the angles ranging between - pi to pi 
    
    %% calculate mean angle for each timebin
    
    % separate the angles and turns in 5 sec portions to compare the sum of
    % angles/ mean changeability of the angles. 
    
    if timebin>1
        binnedSumAng_temp=zeros(1,n_bins2);
        for i=1:n_bins2-1                                                       
            binnedSumAng_temp(i)=sum(ang_temp...
            ((i*timebin-(timebin-1)<=t30 & t30<=i*timebin)));
        end
    else
        binnedSumAng_temp = zeros(1,n_bins2);
        for i=1:n_bins2
            if i==1
                binnedSumAng_temp(i)= sum(ang_temp ...
                    ((t30 <= i*timebin)));
            else
                binnedSumAng_temp(i)= sum(ang_temp ...
                    ((i-1)*timebin < t30 & t30<=(i)*timebin)); 
            end    
        end
    end
    
    % change the save to angles
    
    all_fish{ROI,1}.anglesBinned    = binnedSumAng_temp;
    all_fish{ROI,1}.Turns           = abs((binnedSumAng_temp)) >= 2*pi;                               % turns exceeding 360 degrees
    all_fish{ROI,1}.Turns           = double(all_fish{ROI,1}.Turns);
    all_fish{ROI,1}.nturns          = sum(all_fish{ROI,1}.Turns);
end 
end 








