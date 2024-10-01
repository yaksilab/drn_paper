
% Predict the treatment group based on lights reaction

% Criteria basis is as following: if DVV on the DL transition is => 100 %
% and DVV on the LD transistion is => -50%. Other thresholds are defined in
% CriteriaMatDVV. The senitivity and spesificity will be calculated for
% each DVV pairs (on and off response), and used to make a AUC.

% one parameter genotype prediction based on responses only

ROCinputON = cell (size(idxLightsOn,2)/5,1); %% for the different ISI 
for i= 1:size(idxLightsOn,2)/5
    for ROI=1:nROIs
        if isnan(onResponseDVV_trad_diff{i, 2}(ROI,1))
            ROCinputON{i,1} (ROI,1) = 0;
        elseif isinf(onResponseDVV_trad_diff{i, 2}(ROI,1))
            ROCinputON{i,1} (ROI,1) = max(max(ROCinputON{i,1}));
        else
        ROCinputON{i,1} (ROI,1) = onResponseDVV_trad_diff{i, 2}(ROI,1);
        end 
        
        if ismember(ROI,group2) || ismember (ROI,group3) || ismember (ROI,group4)
            ROCinputON{i,1}(ROI,2) = 0;
        else
            ROCinputON{i,1} (ROI,2) = 1;
        end
    end
end

ROCout = cell (size(idxLightsOn,2)/5,1);
for i= 1:size(idxLightsOn,2)/5

ROCout{i,1} = aj_roc_20210621(ROCinputON{i,1},0,0.05,1);

end 


% one parameter genotype prediction; lights off response. 

ROCinputOFF = cell (5,1);
for i= 1:size(idxLightsOn,2)/5
    for ROI=1:nROIs
        if isnan(offResponseDVV_trad_diff{i, 2}(ROI,1))
        ROCinputOFF{i,1} (ROI,1) = 0;    
        else
        ROCinputOFF{i,1} (ROI,1) = offResponseDVV_trad_diff{i, 2}(ROI,1);
        
        end 
        if ismember(ROI,group2) || ismember (ROI,group3) || ismember (ROI,group4)
            ROCinputOFF{i,1}(ROI,2) = 0;
        else
            ROCinputOFF{i,1} (ROI,2) = 1;
        end
    end
end

ROCoutOff = cell (size(idxLightsOn,2)/5,1);
for i= 1:size(idxLightsOn,2)/5

ROCoutOff{i,1} = aj_roc_20210621(ROCinputOFF{i,1},0,0.05,1);

end 


% two parameter prediction of genotype; both on and off responses


CriteriaMatDVV = horzcat((-400:1:400)',(-600:1:200)');

% predict genotype/ treatment group for the first 5 stimuli, e.g. 5' ISI.
% Response 1= mutant/treated, while 0= control group

predGeno5onAndOff = cell(size(idxLightsOn,2)/5,length(k));...
    % genotype prediction based on on and off response

for k=1:length (CriteriaMatDVV)
    for i= 1:size(idxLightsOn,2)/5
        for ROI =1:nROIs
            if onResponseDVV_trad_diff{i, 2}(ROI,1) >= CriteriaMatDVV (k,1)...
                    && offResponseDVV_trad_diff{i, 2}(ROI,1) >= CriteriaMatDVV (k,2)
                predGeno5onAndOff{i,1}(ROI,k) = 1;
            else
                predGeno5onAndOff{i,1}(ROI,k) = 0;
            end
        end
    end
end

confusionMat = cell(size(idxLightsOn,2)/5,1); % is needed to see the responses

for i=1:size(idxLightsOn,2)/5
    for threshold=1:length(CriteriaMatDVV)
        confusionMat{i,1}(threshold,1) = sum(predGeno5onAndOff{i,1}([group2,group3,group4],threshold)==1,1)/... TP; true positive
            (sum (predGeno5onAndOff{i,1}([group2,group3,group4],threshold)==1,1)+ ... TP
            sum (predGeno5onAndOff{i,1}([group2,group3,group4],threshold)==0,1)); % false negative, calculates the sensitivity for the threshold value
        
        confusionMat{i,1}(threshold,2)= (sum(predGeno5onAndOff{i,1}([group1,group5],threshold)==0,1)/... TN; true negative
            (sum(predGeno5onAndOff{i,1}([group1,group5],threshold)==0,1) + ... TN
            sum(predGeno5onAndOff{i,1}([group1,group5],threshold)==1,1))); % false positive; FP, calculates the spesificity for the threshold value
    end
end

% plot ROC curve and do cutvefitting and calculate the AUC
f19 = figure;
f19.WindowState = 'Maximized';


for i=1:size(idxLightsOn,2)/5
    subplot (2,3,i)
    %     plot (1-(confusionMat{i,1}(:,2)),confusionMat{i,1}(:,1),'Marker','o'), hold on
    
    ft = fittype( '1-1/((1+(x/C)^B)^E)', 'independent', 'x', 'dependent', 'y' );
    opts = fitoptions( 'Method', 'NonlinearLeastSquares' );
    opts.Display = 'Off';
    opts.Lower = [0 0 0];
    opts.Robust = 'Bisquare';
    opts.StartPoint = [1 0.5 1];
    opts.Upper = [Inf 1 Inf];
    rocfit = fit(1-(confusionMat{i,1}(:,2)),confusionMat{i,1}(:,1),ft,opts);
    
    plot (rocfit,'r',1-(confusionMat{i,1}(:,2)),confusionMat{i,1}(:,1), '-ob')
    
    xfit=linspace(0,1,500);
    yfit=rocfit(xfit);

    Area=trapz(xfit,yfit);
    
    hold off
    xlim([0 1])
    ylim([0 1])
    title(['Stimulus nr. ' num2str(i), ' AUC=' num2str(Area)])
    xlabel ('1-specificity')
    ylabel ('sensitivity')
end

for f=1:length(formats)
saveas (f19, [folder_path_save,filesep,figures_subfolder,filesep,...
    fish_name,date_exp '_ROC_2Parameter'  formats{1,f}]);
end




