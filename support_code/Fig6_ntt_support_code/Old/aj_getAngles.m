function [all_fish]=aj_getAngles(timebin,nROIs,all_fish,allgroups,fish_name,date_exp,folder_path,folder_path_save)


%   calculate angles method 1
n_bins2 = floor(max(all_fish{1,1}.dt)/timebin);

for ROI=1:size(all_fish,1)
    %% Initialize data
    t=all_fish{ROI,1}.dt;
    
    %% calculate angles between adjacent datapoints  
    
    directions          = (atan2(-diff(all_fish{ROI,1}.y),(diff(all_fish{ROI,1}.x))));               % direction of each leg in relation to the x-axis, minus in front of 
    ddiff               = diff(directions);                                                          % angle at each corner, change in direction 
    ang_temp            = mod(ddiff+pi,2*pi)-pi;                                                     % should give the angles ranging between - pi to pi 
    
    %% calculate mean angle for each timebin
    
    if timebin>1
        binnedSumAng_temp=zeros(1,n_bins2);
        for i=1:n_bins2-1        
            binnedSumAng_temp(i)=sum(ang_temp...
            ((i*timebin-(timebin-1)<=t & t<=i*timebin)));
        end
    else
        binnedSumAng_temp=zeros(1,n_bins2);
        for i=1:n_bins2
            if i==1
                binnedSumAng_temp(i)= sum(ang_temp ...
                    ((t <= i*timebin)));
            else
                binnedSumAng_temp(i)= sum(ang_temp ...
                    ((i-1)*timebin < t & t<=(i)*timebin)); 
            end    
        end
    end
    
    %% Save the output 
    
    all_fish{ROI,1}.anglesBinned    = binnedSumAng_temp;
    all_fish{ROI,1}.Turns           = abs((binnedSumAng_temp)) >= 2*pi;                               % turns exceeding 360 degrees
    all_fish{ROI,1}.Turns           = double(all_fish{ROI,1}.Turns);
    all_fish{ROI,1}.nturns          = sum(all_fish{ROI,1}.Turns);

end 



%% calculateall_fish{ROI,1}.angle method 2, does the same as teh one above, 
%  the one above is simpler, and takes less time to run
% v=aj_myatan(diff(y),diff(x));
% v1=diff(v);
% angle_mod1=mod(v1+pi,2*pi)-pi;
% 
% deltaT=diff(t);
% 
% for i=1:(size(angle_mod1,1))
%     angularSpeed(i,1)=angle_mod1(i,1)/deltaT(i,1);
% end 










