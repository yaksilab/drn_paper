for j=1:length(flds)-3
all_fish = results.(flds{j,1});
nROIs = length(all_fish);
if j==1
    A = 25;
    B = 25;
else
    A = 20;
    B = 21;
end 
idxLightsOn  = nan(nROIs,A);                                                   
idxLightsOff = nan(nROIs,B);
for ROI=1:length(all_fish)
    idxLightsOn(ROI,:) = (find(diff(all_fish{ROI,1}.lightsInfo)==1)+1)';
    idxLightsOff(ROI,:) = (find(diff(all_fish{ROI,1}.lightsInfo)==-1)+1)';
end

tempMatLightsInfo = cell(20,2);
for i=1:size(idxLightsOn,2)
    tempMatLightsInfo{i,1}= ['Stimulation number' num2str(i)];
    for ROI=1:nROIs
        
        time            = 11:floor(max(all_fish{ROI, 1}.t(1:end-1,:)));
        timeLight       = all_fish{ROI, 1}.timestampLight;
        
        
        %% For timeLight
        temp11   = (timeLight(...
            timeLight >= floor(timeLight(idxLightsOn(ROI,i))-5) &...  %% 30 seconds before
            timeLight < (timeLight(idxLightsOn(ROI,i)))));
        
        temp12   = (timeLight(...
            timeLight >= (timeLight(idxLightsOn(ROI,i))) &...
            timeLight <= ceil(timeLight(idxLightsOn(ROI,i))+30) )); %% til ten seconds after
        
        T11 = temp11';
        T12 = interp1(1:length(temp12),temp12,(1:1:30));
        
        temp_total1=[T11,T12];
        tempMatLightsInfo{i,2}(ROI,1:size(temp_total1,2)) = temp_total1;             
        
    end
end
    results.timeLight.(flds{j,1}) =  tempMatLightsInfo;
end 