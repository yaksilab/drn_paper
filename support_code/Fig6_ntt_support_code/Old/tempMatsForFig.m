%% save tempMat

for j=1:length(fish_names)
    tempMat = cell(20,7);
    flds = fields(results);
    all_fish = results.(flds{j,1});
    nROIs = size(all_fish,1);
    
if j==1
    idxLightsOn  = nan(nROIs,25);
    idxLightsOff = nan(nROIs,25);
    alfa = 20;
    
        for ROI=1:length(all_fish)
        idxLightsOn(ROI,:) = (find(diff(all_fish{ROI,1}.lightsInfo)==1)+1)';
        idxLightsOff(ROI,:) = (find(diff(all_fish{ROI,1}.lightsInfo)==-1)+1)';
        end
    
    else
    idxLightsOn  = nan(nROIs,20);
    idxLightsOff = nan(nROIs,21);
    alfa = 115;
    
    for ROI=1:length(all_fish)
        idxLightsOn(ROI,:) = (find(diff(all_fish{ROI,1}.lightsInfo)==1)+1)';
        idxLightsOff(ROI,:) = (find(diff(all_fish{ROI,1}.lightsInfo)==-1)+1)';
    end
    
end 


for i=1:size(idxLightsOn,2)
    if j==1
        if i>=1 && i<=5
            alfa = 115;
        else
            alfa =20;
        end
        
    end
   
    tempMat{i,1}= ['Stimulation number' num2str(i)];
    

    % Find the bin number (second) of when this transition is taking place
    %transitionTime = all_fish{1, 1}.timestampLight(idxLightsOff(1,1));
    threshold = 100;
    
    for ROI=1:nROIs
        t               = 1:floor(max(all_fish{ROI, 1}.t));
        timeLight       = all_fish{ROI, 1}.timestampLight;
        velocity        = all_fish{ROI, 1}.bV_E4sd;
        DVV             = all_fish{ROI, 1}.DVV_trad;
        Burst_binary    = all_fish{ROI, 1}.Burst_binary;
        BursDur         = all_fish{ROI, 1}.BurstDuration;

        
        t2              = [1/2.433846153846:...
                           1/2.433846153846:...
                           (max(all_fish{ROI, 1}.t)-1/2.433846153846)];
        velocity_243HZ  = all_fish{ROI,1}.binnedVel_2_43Hz;
        anglesB_243HZ   = all_fish{ROI,1}.binnedAng2_43;
        
        %% For velocity
        temp11   = (velocity(...
            t >= floor(timeLight(idxLightsOn(ROI,i))-5) &...  %% 30 seconds before
            t <= floor(timeLight(idxLightsOn(ROI,i))-1) ));
        
        temp12   = (velocity(...
            t >= floor(timeLight(idxLightsOn(ROI,i))) &...
            t <= floor(timeLight(idxLightsOn(ROI,i))+29) )); %% til ten seconds after
        
        T11 = reshape(temp11,[1,5]);
        T12 = interp1(1:length(temp12),temp12,(1:1:30));
        
        temp_total1=[T11,T12];
        tempMat{i,2}(ROI,1:size(temp_total1,2)) = temp_total1;
        
        %% for DVV_trad
        temp3   = (DVV(...
            t >= floor(timeLight(idxLightsOn(ROI,i))-5) &...  %% ten seconds before
            t <= floor(timeLight(idxLightsOn(ROI,i))-1) ));
        
        temp4   = (DVV(...
            t >= floor(timeLight(idxLightsOn(ROI,i))) &...
            t <= floor(timeLight(idxLightsOn(ROI,i))+29) )); %% til ten seconds after
        
        T13 = reshape(temp3,[1,5]);
        T14 = interp1(1:length(temp4),temp4,(1:1:30));
        
        temp_total3=[T13,T14];
        tempMat{i,3}(ROI,1:size(temp_total3,2)) = temp_total3;
        
        %% Burst duration, continious
        
        temp7   = (BursDur(...
            t >= floor(timeLight(idxLightsOn(ROI,i))-5) &...  %% ten seconds before
            t <= floor(timeLight(idxLightsOn(ROI,i))-1) ));
        
        temp8   = (BursDur(...
            t >= floor(timeLight(idxLightsOn(ROI,i))) &...
            t <= floor(timeLight(idxLightsOn(ROI,i))+29) )); %% til ten seconds after
        
        T17 = reshape(temp7,[1,5]);
        T18 = interp1(1:length(temp8),temp8,(1:1:30));
        
        temp_total8=[T17,T18];
        tempMat{i,4}(ROI,1:size(temp_total8,2)) = temp_total8;
        
        
        %% for burst_binary
       temp5   = (Burst_binary(...
            t >= floor(timeLight(idxLightsOn(ROI,i))-5) &...  %% ten seconds before
            t <= floor(timeLight(idxLightsOn(ROI,i))-1) ));
        
        temp6   = (Burst_binary(...
            t >= floor(timeLight(idxLightsOn(ROI,i))) &...
            t <= floor(timeLight(idxLightsOn(ROI,i))+29) )); %% til ten seconds after
        
        T15 = reshape(temp5,[1,5]);
        T16 = interp1(1:length(temp6),temp6,(1:1:30));
        
        temp_total8=[T15,T16];
        tempMat{i,5}(ROI,1:size(temp_total8,2)) = temp_total8;
        
        
        %% for 2.43 Hz binned velocity
        
        temp111   = (velocity_243HZ(...
            t2 >= floor(timeLight(idxLightsOn(ROI,i))-5) &...  %% 30 seconds before
            t2 < floor(timeLight(idxLightsOn(ROI,i))) ));
        
        temp121   = (velocity_243HZ(...
            t2 >= floor(timeLight(idxLightsOn(ROI,i))) &...
            t2 <= floor(timeLight(idxLightsOn(ROI,i))+10+alfa) )); %% til 50 seconds after
        
        T111 = interp1(1:length(temp111),temp111,(1:1:12));
        T121 = interp1(1:length(temp121),temp121,(1:1:304));
        
        temp_total1=[T111,T121];
        tempMat{i,6}(ROI,1:size(temp_total1,2)) = temp_total1;
        
        %% for 2.43 Hz binned angles;
        
        temp14   = (anglesB_243HZ(...
            t2 >= floor(timeLight(idxLightsOn(ROI,i))-5) &...  %% 30 seconds before
            t2 < floor(timeLight(idxLightsOn(ROI,i))) ));
        
        temp15   = (anglesB_243HZ(...
            t2 >= floor(timeLight(idxLightsOn(ROI,i))) &...
            t2 <= floor(timeLight(idxLightsOn(ROI,i))+10+alfa) )); %% til 50 seconds after
        
        T19 = interp1(1:length(temp14),temp14,(1:1:12));
        T20 = interp1(1:length(temp15),temp15,(1:1:304));
        
        temp_total6=[T19,T20];
        tempMat{i,7}(ROI,1:size(temp_total6,2)) = temp_total6;
        
        %% empty variables
        temp1  = [];
        temp2  = [];
        temp11 = [];
        temp12 = [];
        temp_total3 = [];
               
    end
end

results.tempMat.(fish_names{1,j})= (tempMat);
end 

clear tempMat all_fish T11 T111 T12 T121 T13 T14 T15 T16 T17 T18 T19 t2 T20 ...
    temp1 temp11 temp111 temp12 temp121 temp14 temp15 temp2 temp3 temp4 ...
    temp5 temp6 temp7 temp8 temp_total1 temp_total3 temp_total6 temp_total8...
    i j ROI nROIs t threshold velocity velocity_243Hz timeLight  idxLightsOff...
    idxLightOn DVV Burst_binary BurstDur alfa anglesB_243HZ

