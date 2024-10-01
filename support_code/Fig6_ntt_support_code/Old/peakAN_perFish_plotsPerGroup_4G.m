%% Peak analysis per stimulus per fish to find
%  1) amplitude of the response
%  2) latency of the response
%  3) width of the peak, 'WidthRefernce', 'halfHight', which uses the
%     amplitude to define the width of the response signal

%  The code is defined to search from the last bin, which has no lights on
%  til th 5th bin with the lights on. E.g. 6 bins in total. The
%  corresponding with the off response

peakAnalysisCell = cell (size(idxLightsOn,2),1); % for DVV_trad

for i=1:size(idxLightsOn,2)
    for ROI=1:nROIs
        peakAnalysisCell{i,1}(ROI,1).amplitude = ...
            max(tempMat{i, 6}(ROI,13:24)-mean(tempMat{i, 6}(ROI,1:12),...
            'omitnan'));
        peakAnalysisCell{i,1}(ROI,1).latency = (find...
            ((tempMat{i, 6}(ROI,13:24)-mean(tempMat{i, 6}(ROI,1:12)))...
            == max((tempMat{i, 6}(ROI,13:24))-mean(tempMat{i, 6}...
            (ROI,1:12)))))*timebin;
        peakAnalysisCell{i,1}(ROI,1).latency = ...
            peakAnalysisCell{i,1}(ROI,1).latency(1,1)*timebin;
%          = findpeaks(diff(tempMat{i, 6}(ROI,12:24)),'Npeaks',1,...
%          'WidthReference', 'halfheight');
    end
end % does not always find the highest peak, but the first one 


for i= 1:size(idxLightsOn,2)
    for ROI= 1:nROIs
        if isempty (peakAnalysisCell{i, 1}(ROI,1).amplitude)
            peakAnalysisCell{i, 1}(ROI,1).amplitude = nan;
            peakAnalysisCell{i, 1}(ROI,1).latency = nan;
        end 
    end 
end 

peakAnalysisCellOff = cell (size(idxLightsOn,2),1); % for DVV_trad

for i=1:size(idxLightsOn,2)
    for ROI=1:nROIs
        peakAnalysisCellOff{i, 1}(ROI,1).amplitude =...
            max(tempMat{i, 6}(ROI,37:48)-mean(tempMat{i, 6}(ROI,35:36),...
            'omitnan'));
        peakAnalysisCellOff{i,1}(ROI,1).latency =...
            find(tempMat{i, 6}(ROI,37:48)-mean(tempMat{i, 6}(ROI,35:36))...
            == max(tempMat{i, 6}(ROI,37:48)-mean(tempMat{i, 6}(ROI,35:36))...
            ));
        peakAnalysisCellOff{i,1}(ROI,1).latency = ...
            peakAnalysisCellOff{i,1}(ROI,1).latency(1,1)*timebin;
%          = findpeaks(diff(tempMat{i, 6}(ROI,36:48)),'Npeaks',1,...
%          'WidthReference', 'halfheight');
    end
end


for i= 1:size(idxLightsOn,2)
    for ROI= 1:nROIs
        if isempty (peakAnalysisCellOff{i, 1}(ROI,1).amplitude)
            peakAnalysisCellOff{i, 1}(ROI,1).amplitude = nan;
            peakAnalysisCellOff{i, 1}(ROI,1).latency = nan;
        end 
    end 
end 

% prepare arrays for plotting

% the cell rows stores the data per group; group1, 2,3 and four. 
% Column one in each cell stores the mean of amplitude, while column four
% stores the SE of the mean. Column two stores the mean width of each
% amplitude, while teh SE of th emean is stored in column five. Columns
% three stores the mean latency and the SEM is stored in column six. 


peakAnOn = cell(size(idxLightsOn,2)/5,1); 
for g=1:length(groups)-2                % group number 
    for i=1:size(idxLightsOn,2)         % light number
        peakAnOn{g,1}(i,1)= mean(vertcat...
            (peakAnalysisCell{i,1}(groups{1,g}).amplitude),'omitnan');
        peakAnOn{g,1}(i,2)= mean(vertcat...
            (peakAnalysisCell{i,1}(groups{1,g}).latency),'omitnan');
        
        peakAnOn{g,1}(i,3)= std (vertcat...
            (peakAnalysisCell{i,1}(groups{1,g}).amplitude),[],'omitnan')...
            /sqrt(length(groups{1,g}));
        peakAnOn{g,1}(i,4)= std (vertcat...
            (peakAnalysisCell{i,1}(groups{1,g}).latency),[],'omitnan')...
            /sqrt(length(groups{1,g}));
    end
end

peakAnOff = cell(size(idxLightsOn,2)/5,1);
for g=1:length(groups)-2
    for i=1:size(idxLightsOn,2)
        peakAnOff{g,1}(i,1)= mean(vertcat...
            (peakAnalysisCellOff{i,1}(groups{1,g}).amplitude),'omitnan');
        
        peakAnOff{g,1}(i,2)= mean(vertcat...
            (peakAnalysisCellOff{i,1}(groups{1,g}).latency),'omitnan');
        peakAnOff{g,1}(i,3)= std (vertcat...
            (peakAnalysisCellOff{i,1}(groups{1,g}).amplitude),[],'omitnan')...
            /sqrt(length(groups{1,g}));
        peakAnOff{g,1}(i,4)= std (vertcat...
            (peakAnalysisCellOff{i,1}(groups{1,g}).latency),[],'omitnan')...
            /sqrt(length(groups{1,g}));
    end
end

% plot 

% figures  on 

f20=figure;
t = tiledlayout(2,2); % Requires R2019b or later
title(t,'PTZ, ISI-all, findMax amplitude')
ylabel(t,'DVV')
t.Padding = 'none';

 for i= 1:size(idxLightsOn,2)/5
     nexttile
    for j=1:length(groups)-2
        plot (1:5,peakAnOn{j,1}(i*5-4:i*5,1),'Color', C1(j,:),...
            'Marker','o'), hold on 
        errorbar(peakAnOn{j,1}(i*5-4:i*5,1),peakAnOn{j,1}(i*5-4:i*5,3),...
            'Color',C1(j,:))
%             'Color', C1(j,:),'Marker','o'), hold on
        
    end  
    xlim([.5 5.5])
    hold off
    title ([tempCell{i,1}])
    box off 
    set (gca,'TickDir', 'out')
 end
for f=1:length(formats)
saveas (f20, [folder_path_save,filesep,figures_subfolder,filesep,...
    fish_name,date_exp '_Peak_Amplitudes'  formats{1,f}]);
end

% latency

f22=figure;
t = tiledlayout(2,2); % Requires R2019b or later
title(t,'PTZ, ISI-all, findMax latency')
ylabel(t,'seconds')
t.Padding = 'none';

for i= 1:size(idxLightsOn,2)/5
     nexttile
    for j=1:length(groups)-2
        plot (1:5,peakAnOn{j,1}(i*5-4:i*5,2),'Color', C1(j,:)), hold on 
        errorbar (peakAnOn{j,1}(i*5-4:i*5,2),peakAnOn{j,1}(i*5-4:i*5,4)...  
            ,'Color', C1(j,:),'Marker','o'), hold on
    end  
    xlim([.5 5.5])
    hold off
    title ([tempCell{i,1}])
    box off 
    set (gca,'TickDir', 'out')
 end
for f=1:length(formats)
saveas (f22, [folder_path_save,filesep,figures_subfolder,filesep,...
    fish_name,date_exp '_Peak_Latency'  formats{1,f}]);
end 
% Figures off 

f23=figure;
t = tiledlayout(2,2); % Requires R2019b or later
title(t,'PTZ, ISI-all, findMax amplitude off')
ylabel(t,'DVV')
t.Padding = 'none';

 for i= 1:size(idxLightsOn,2)/5
     nexttile
    for j=1:length(groups)-2
        plot (1:5,peakAnOff{j,1}(i*5-4:i*5,1),'Color', C1(j,:),...
            'Marker','o'), hold on 
        errorbar (peakAnOff{j,1}(i*5-4:i*5,1),peakAnOff{j,1}...
            (i*5-4:i*5,3),'Color', C1(j,:),'Marker','o'), hold on
        
    end  
    xlim([.5 5.5])
    hold off
    title ([tempCell{i,1}])
    box off 
    set (gca,'TickDir', 'out')
 end
for f=1:length(formats)
saveas (f23, [folder_path_save,filesep,figures_subfolder,filesep,...
    fish_name,date_exp '_Peak_Amplitudes_off'  formats{1,f}]);
end

% latency 

f25=figure;
t = tiledlayout(2,2); % Requires R2019b or later
title(t,'PTZ, ISI-all, findMax latency off')
ylabel(t,'seconds')
t.Padding = 'none';

 for i= 1:size(idxLightsOn,2)/5
     nexttile
    for j=1:length(groups)-2
        plot (1:5,peakAnOff{j,1}(i*5-4:i*5,2),'Color', C1(j,:)), hold on 
        errorbar (peakAnOff{j,1}(i*5-4:i*5,2),peakAnOff{j,1}(i*5-4:i*5,4)...
            ,'Color', C1(j,:),'Marker','o'), hold on
    end  
    xlim([.5 5.5])
    hold off
    title ([tempCell{i,1}])
    box off 
    set (gca,'TickDir', 'out')
 end
for f=1:length(formats)
saveas (f25, [folder_path_save,filesep,figures_subfolder,filesep,...
    fish_name,date_exp '_Peak_Latency_off'  formats{1,f}]);
end 

%%

% plot per ISI
for g=1:length(groups)-2
    for ISI = 1:size(idxLightsOn,2)/5
        ISI_amplitudes(g,ISI)   = mean(peakAnOn{g, 1}(ISI*5-4:ISI*5,1));
        ISI_latency(g,ISI)      = mean(peakAnOn{g, 1}(ISI*5-4:ISI*5,2));
        
        
        ampISIstd(g,ISI)        = std((peakAnOn{g, 1}(ISI*5-4:ISI*5,1)...
                                  ),[],'omitnan')/sqrt(5);
        latISIstd (g,ISI)       = std([peakAnOn{g, 1}(ISI*5-4:ISI*5,2)...
                                  ],[],'omitnan')/sqrt(5);
           
    end
end


f26=figure;
f26.WindowState='Maximized';
f26 = tiledlayout(1,2); % Requires R2019b or later
title(f26,'findMax')
f26.Padding = 'none';

nexttile
for g=1:length(groups)-2
%     plot_shaded(ISI_amplitudes(g,:),ampISIstd(g,:),'Color',C1(g,:)
errorbar (ISI_amplitudes(g,:),ampISIstd(g,:),'--o', 'Color', C1(g,:))
xlim([0 6]), ylabel('V'), title ('amplitude per ISI')

hold on 
end 
hold off


nexttile, 
for g=1:length(groups)-2
errorbar(ISI_latency(g,:),latISIstd(g,:),'--o', 'Color', C1(g,:))
xlim([0 6]), ylabel ('time(s)'), title('latency')
hold on 
end 
hold off

for f=1:length(formats)
saveas (f26, [folder_path_save,filesep,figures_subfolder,filesep,...
    fish_name,date_exp '_Peak_analysis_perISI_ON'  formats{1,f}]);
end 


%% per ISI off

% plot per ISI
for g=1:length(groups)-2
    for ISI = 1:size(idxLightsOn,2)/5
        ISI_amplitudesOff(g,ISI)   = mean(peakAnOff{g, 1}(ISI*5-4:ISI*5,1));
        ISI_latencyOff(g,ISI)      = mean(peakAnOff{g, 1}(ISI*5-4:ISI*5,3));
        
        
        ampISIstdOff(g,ISI)        = std((peakAnOff{g, 1}(ISI*5-4:ISI*5,1)...
                                  ),[],'omitnan')/sqrt(5);
        latISIstdOff (g,ISI)       = std([peakAnOff{g, 1}(ISI*5-4:ISI*5,3)...
                                  ],[],'omitnan')/sqrt(5);
    end
end


f26=figure;
f26.WindowState='Maximized';
f26 = tiledlayout(1,2); % Requires R2019b or later
title(f26,'findMax off')
f26.Padding = 'none';

nexttile
for g=1:length(groups)-2
errorbar (ISI_amplitudesOff(g,:),ampISIstdOff(g,:),'--o', 'Color', C1(g,:))
xlim([0 6]), ylabel('V'), title ('amplitude per ISI')

hold on 
end 
hold off

nexttile, 
for g=1:length(groups)-2
errorbar(ISI_latencyOff(g,:),latISIstdOff(g,:),'--o', 'Color', C1(g,:))
xlim([0 6]), ylabel ('time(s)'), title('latency')
hold on 
end 
hold off

for f=1:length(formats)
saveas (f26, [folder_path_save,filesep,figures_subfolder,filesep,...
    fish_name,date_exp '_Peak_analysis_perISI_OFF'  formats{1,f}]);
end 
