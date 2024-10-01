
 function [results]=aj_angles(results,flds)
% The function calculates mean velocity from delra distance data, the
% delta distance is given by the tracking software and corrected for noise
% by some predefined treshold set by the providers

for j=1:length(flds)-3
    timebin =1/2.433846153846; % in seconds
    all_fish = results.(flds{j,1});
    nROIs = length (all_fish);
    for ROI=1:nROIs
        %% Load variables
        t           = all_fish{ROI,1}.t(1:end-1);
        x           = all_fish{ROI,1}.x;
        y           = all_fish{ROI,1}.y;
        
        n_bins      = round(max(all_fish{ROI,1}.t(1:end-1))/timebin);
        
        %%
        A =[(x(1:end-2)-min(x)),...
            y(1:end-2)-min(y)];
        B = [x(1:end-1)-min(x),...
            y(1:end-1)-min(y)];
        C = [x(1:end)-min(x),...
            y(1:end)-min(y)];
        
        % If A, B, and C are three points in two-dimensional space defined by
        % 1 x 2 coordinate row vectors, the angle
        % ABC - that is, the angle between line segments AB and CB:
        
        % Do not change
        
        ang = nan(1,length(A)-3);
        for k=1:length(A)
            AB = A(k,:)-B(k+1,:);
            CB = C(k+2,:)-B(k+1,:);
            if atan2((det([AB;CB])),dot(AB,CB))<0 % Angle in radians
                ang(1,k) = abs(pi+ atan2((det([AB;CB])),dot(AB,CB))); % left turns
            elseif atan2((det([AB;CB])),dot(AB,CB))>0
                ang(1,k) = abs(-pi+ atan2((det([AB;CB])),dot(AB,CB))); % right turns
            else
                ang(1,k) = abs(atan2((det([AB;CB])),dot(AB,CB))); % no-changes
            end
        end
        
        results.(flds{j,1}){ROI,1}.ang=ang;
        
        %% Calculate
%         
%         bA_temp=nan(1,n_bins-1);
%         for i=1:n_bins
%             bA_temp(i)= sum(ang(t>(i-1)*timebin & t<=i*timebin),'omitnan');   % kompenser forskyvningen nan -data - nan
%         end
        
        %% Save data inn cell array
%         all_fish{ROI,1}.binnedAng_2_43Hz         =  bA_temp;
%         results.(flds{j,1})                      =  all_fish; 
    end
end

