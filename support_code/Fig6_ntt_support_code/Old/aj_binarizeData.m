function [all_fish]=aj_binarizeData(all_fish,nROIs,timebin,folder_path_save,fish_name,date_exp,conversion_factor)


% these are all for 1 seconds timebin
for ROI=1:nROIs

    
    VeleocityBinary20   = all_fish{ROI,1}.bV_E4sd >= 20;% points exceeding threshold value of v=20mm/s
    VeleocityBinary20   = double(VeleocityBinary20);
    nVelBinaryBin20     = sum(VeleocityBinary20);
    iVelBinaryBin20     = find(VeleocityBinary20(:,:)==1);
    
    VeleocityBinary15   = all_fish{ROI,1}.bV_E4sd >= 15;% points exceeding threshold value of v=20mm/s
    VeleocityBinary15   = double(VeleocityBinary15);
    nVelBinaryBin15     = sum(VeleocityBinary15);
    iVelBinaryBin15     = find(VeleocityBinary15(:,:)==1);
    
    VeleocityBinary10   = all_fish{ROI,1}.bV_E4sd >= 10;% points exceeding threshold value of v=20mm/s
    VeleocityBinary10   = double(VeleocityBinary10);
    nVelBinaryBin10     = sum(VeleocityBinary10);
    iVelBinaryBin10     = find(VeleocityBinary10(:,:)==1);
    
    VeleocityBinary5   = all_fish{ROI,1}.bV_E4sd >= 5;% points exceeding threshold value of v=20mm/s
    VeleocityBinary5   = double(VeleocityBinary5);
    nVelBinaryBin5     = sum(VeleocityBinary5);
    iVelBinaryBin5     = find(VeleocityBinary5(:,:)==1);
    
    InactiveBinary      = ismember(all_fish{ROI,1}.bV_E4sd,0); % returns 1 for the points when v=0
    InactiveBinary      = double(InactiveBinary);
    nInactiveBinaryBin  = sum(InactiveBinary); 
    iInactiveBin        = find(InactiveBinary(:,:)==1);
    
%% Save data inn cell array
    all_fish{ROI,1}.Binary.Vel20        = VeleocityBinary20;
    all_fish{ROI,1}.Binary.nVelBin20    = nVelBinaryBin20;
    all_fish{ROI,1}.Binary.iVelBin20    = iVelBinaryBin20;
    
    all_fish{ROI,1}.Binary.Vel15        = VeleocityBinary15;
    all_fish{ROI,1}.Binary.nVelBin15    = nVelBinaryBin15;
    all_fish{ROI,1}.Binary.iVelBin15    = iVelBinaryBin15;
    
    all_fish{ROI,1}.Binary.Vel10        = VeleocityBinary10;
    all_fish{ROI,1}.Binary.nVelBin10    = nVelBinaryBin10;
    all_fish{ROI,1}.Binary.iVelBin10    = iVelBinaryBin10;
    
    all_fish{ROI,1}.Binary.Vel5         = VeleocityBinary5;
    all_fish{ROI,1}.Binary.nVelBin5     = nVelBinaryBin5;
    all_fish{ROI,1}.Binary.iVelBin5     = iVelBinaryBin5;
    
    all_fish{ROI,1}.Binary.Inactive     = InactiveBinary;
    all_fish{ROI,1}.Binary.nInactiveBin = nInactiveBinaryBin;
    all_fish{ROI,1}.Binary.iInactiveBin = iInactiveBin;
    
    %% Binatize acceleration
    
    AccelerationBinary20   = all_fish{ROI,1}.binnedAcc >= 20;% points exceeding threshold value of v=20mm/s
    AccelerationBinary20   = double(AccelerationBinary20);
    nAccBinaryBin20        = sum(AccelerationBinary20); 
    iAccBinaryBin20        = find(AccelerationBinary20(:,:)==1);
    
    AccelerationBinary40   = all_fish{ROI,1}.binnedAcc >= 40;% points exceeding threshold value of v=20mm/s
    AccelerationBinary40   = double(AccelerationBinary40);
    nAccBinaryBin40        = sum(AccelerationBinary40);
    iAccBinaryBin40        = find(AccelerationBinary40(:,:)==1);
    
    AccelerationBinary80   = all_fish{ROI,1}.binnedAcc >= 80;% points exceeding threshold value of v=20mm/s
    AccelerationBinary80   = double(AccelerationBinary80);
    nAccBinaryBin80        = sum(AccelerationBinary80);
    iAccBinaryBin80        = find(AccelerationBinary80(:,:)==1);
    
    AccelerationBinary60   = all_fish{ROI,1}.binnedAcc >= 60;% points exceeding threshold value of v=20mm/s
    AccelerationBinary60   = double(AccelerationBinary60);
    nAccBinaryBin60        = sum(AccelerationBinary60);
    iAccBinaryBin60        = find(AccelerationBinary60(:,:)==1);
    
    AccelerationBinary0     = ismember(all_fish{ROI,1}.binnedAcc,0); % returns 1 for the points when v=0
    AccelerationBinary0     = double(AccelerationBinary0);
    nAccelerationBin0       = sum(AccelerationBinary0); 
    iAccBinaryBin0          = find(AccelerationBinary0(:,:)==1);
    
 
%% Save data inn cell array
    all_fish{ROI,1}.Binary.Acc20       = AccelerationBinary20;
    all_fish{ROI,1}.Binary.nAccBin20   = nAccBinaryBin20;
    all_fish{ROI,1}.Binary.iAccBin20   = iAccBinaryBin20;
    
    all_fish{ROI,1}.Binary.Acc40        = AccelerationBinary40;
    all_fish{ROI,1}.Binary.nAccBin40    = nAccBinaryBin40;
    all_fish{ROI,1}.Binary.iAccBin40    = iAccBinaryBin40;
    
    all_fish{ROI,1}.Binary.Acc80        = AccelerationBinary80;
    all_fish{ROI,1}.Binary.nAccBin80    = nAccBinaryBin80;
    all_fish{ROI,1}.Binary.iAccBin80    = iAccBinaryBin80;
    
    all_fish{ROI,1}.Binary.Acc60        = AccelerationBinary60;
    all_fish{ROI,1}.Binary.nAccBin60    = nAccBinaryBin60;
    all_fish{ROI,1}.Binary.iAccBin60    = iAccBinaryBin60;
    
    all_fish{ROI,1}.Binary.Acc0         = AccelerationBinary0;
    all_fish{ROI,1}.Binary.nAccBin0     = nAccelerationBin0;
    all_fish{ROI,1}.Binary.iAccBin0     = iAccBinaryBin0;
end

% save([folder_path_save,filesep,fish_name,date_exp '_data.mat'],'all_fish','-v7.3');