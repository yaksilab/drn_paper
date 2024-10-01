function all_fish = aj_distCalculation_20211206(all_fish,nROIs,timebin,conversion_factor)
% The function calculates distances from x-y data
for ROI=1:nROIs 
    t           = all_fish{ROI,1}.t;
    dT          = all_fish{ROI,1}.dt;
    dX          = diff(all_fish{ROI,1}.x);
    dY          = diff(all_fish{ROI,1}.y);
    n_bins2     = floor(max(all_fish{ROI,1}.t)/timebin);
    S           = nan(1,length(dT));
    for i=1:length(dT)-1
        S(i)   = sqrt(dX(i)^2+dY(i)^2)*conversion_factor;
    end
    %% Calculate binned distances
    s_temp      = nan(1,n_bins2);
    s_temp2     = nan(1,n_bins2);
    S2          = all_fish{ROI,1}.distance;
    for i=1:n_bins2
        s_temp(i)= sum(S(t > (i - 1)*timebin & t <= i*timebin));
        s_temp2(i)= sum(S2(t > (i - 1)*timebin & t <= i*timebin));
    end
    %% Save data inn cell array
    all_fish{ROI,1}.(['calculatedRawDistance_' num2str(timebin)]) = S       ;
    all_fish{ROI,1}.(['calcBinnedDistance_' num2str(timebin)])    = s_temp  ;
    all_fish{ROI,1}.(['bD_' num2str(timebin)])                    = s_temp2 ;
end
