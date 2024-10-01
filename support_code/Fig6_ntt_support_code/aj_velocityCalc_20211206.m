function all_fish = aj_velocityCalc_20211206(all_fish, timebin)
% The function calculates mean velocity from delra distance data, the
% delta distance is given by the tracking software and corrected for noise
% by some predefined treshold set by the providers
nROIs = size(all_fish, 1);
parfor ROI=1:nROIs
    %% Load variables
    dt          = all_fish{ROI, 1}.dt;
    s           = all_fish{ROI, 1}.distance;
    %% Calculate speed over time and delta-time
    V1 = nan(1, length(dt));
    for j = 1:length(dt) - 1
        V1(j) = (s(j + 1))/dt(j);
    end
    all_fish{ROI, 1}.speed_over_time = V1;%%%%%%!!!!!!!!!!!!!!!!!!!!!!!!!!!
    %% Calculate velocity per second
    t = all_fish{ROI, 1}.t;
    n_bin = floor(max(t)/timebin);
    bV_temp = nan(1, n_bin);
    for i = 1:n_bin
        bV_temp(i) = sum(s(t > (i - 1)*timebin & t <= i*timebin))/sum(dt(t > (i - 1)*timebin & ...
            t <= i*timebin));
    end
    % Save data in cell array
    if timebin < 1
        velo_string = num2str(timebin); 
        velo_string(2) = '_';
        all_fish{ROI, 1}.(['binnedVel_' velo_string]) = bV_temp;
    else
        all_fish{ROI, 1}.(['binnedVel_' num2str(timebin)]) = bV_temp;
    end
end