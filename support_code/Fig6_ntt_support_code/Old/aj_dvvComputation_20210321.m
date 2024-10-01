function [all_fish] = aj_dvvComputation_20210321 (all_fish,cfg,nROIs,idxLightsOff)


for ROI = 1:nROIs
    
    velVec = all_fish{ROI,1}.bV_E4sd;
    
    if strcmp(cfg.V0method, 'trad')
        
        meanBaseline = mean(velVec(:,1:600),'omitnan');
%         meanBaseline = prctile(velVec,8);
        V0= repmat(meanBaseline,1,size(velVec,2));
        
        DVV_trad = ((velVec-V0)./V0)*100 ;
        all_fish{ROI,1}.DVV_trad = DVV_trad;
        all_fish{ROI, 1}.SponBehaviour.DVV_trad = DVV_trad(:,1:3600);
        all_fish{ROI, 1}.eB.DVV_trad = DVV_trad(:,floor(all_fish{ROI, 1}.timestampLight(idxLightsOff(ROI,1))):end);
        
    elseif strcmp(cfg.V0method, 'sumbre')
        
        velVec=velVec'; %           velocity in format time x cells
                        %           cfg.tauDecay=2; % for GCAMP6slow
                        %         MovingWdw= 10;  %           max(15, 40*cfg.tauDecay); %(40* This is the standard but should be adapted when you have very slow oscillations)
        
                        %           twdw=MovingWdw;
        wdw= cfg.wdw;   %           round(cfg.fps*twdw);
        numCells=size(velVec,2);
        numFrames=size(velVec,1); % 50356
        smoothBaseline=zeros(size(velVec));
        disp('Calculating velocity baseline of ROIs')
        
        %%
        if numFrames > 2*wdw
            parfor j=1:numCells
                dataSlice=velVec(:,j);         % trace of neuron j
                temp=zeros(numFrames-2*wdw,1); % 50356 - 2976 = removing 2 windows. Will contain percentile for all the trace.
                for i=wdw+1:numFrames-wdw      % sliding wdw. Start at i = wdw+1 and compute before.
                    temp(i-wdw)=nanmean(dataSlice(i-wdw:i+wdw)); % for i = wdw+1, take frames from 1:2977 and compute 8 percentile
                end
                smoothBaseline(:,j)=[temp(1)*ones(wdw,1) ; temp; temp(end)*ones(wdw,1)]; % fill up the gap left by removing the 2 windows, with first and last elements
                smoothBaseline(:,j)=runline(smoothBaseline(:,j),wdw,1); % linear regression to smooth what we added ?
            end
            
        else
            parfor j=1:numCells
                smoothBaseline(:,j)=[ones(numFrames,1)*prctile(velVec(:,j),50)];
            end
        end
        
        
        V0 = smoothBaseline';
        velVec = velVec';
        
        DVV_sumbre = ((velVec(:,:)-V0)./V0)*100 ;
        all_fish{ROI,1}.DVV_sumbre = DVV_sumbre;
        all_fish{ROI, 1}.SponBehaviour.DVV_sumbre = DVV_sumbre(:,1:3600);
        all_fish{ROI, 1}.eB.DVV_sumbre = DVV_sumbre(:,floor(all_fish{ROI,1}.timestampLight(idxLightsOff(ROI,1))): end);
      
    else
        error('Incorrect method for F0 computation')
    end
end