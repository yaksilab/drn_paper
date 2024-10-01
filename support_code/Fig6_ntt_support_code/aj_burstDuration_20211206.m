function all_fish = aj_burstDuration_20211206(all_fish,nROIs,timebin,framerate)
% The function calculates mean velocity from delra distance data, the
% delta distance is given by the tracking software and corrected for noise
% by some predefined treshold set by the providers

parfor ROI = 1:nROIs
    
     %% Load variables
    t           = all_fish{ROI,1}.t;
    s           = all_fish{ROI,1}.distance;
    n_bins      = floor(max(all_fish{ROI,1}.t)/timebin);
    
    %% Binarize distance
    s_binary = double(s>0);
    
    %% Calculate fraction of active frames per second
    
    BurstDurPerBin=nan(1,n_bins);
    
    for i=1:n_bins
        BurstDurPerBin(i)      = sum(s_binary(t>(i-1)*timebin & t<=i*timebin))/...
                    framerate;
    end  % calculates the fraction of active frames per second, which is the same as 
    
    Burst_binary = double(BurstDurPerBin>0);
    
    %% Save data inn cell array
    all_fish{ROI,1}.BurstDurationPerBin   =   BurstDurPerBin;  % total duration of active frames.
    all_fish{ROI,1}.Burst_binary          =   Burst_binary;

end
 