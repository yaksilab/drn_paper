%% Peak analysis per stimulus per fish to find
%  1) amplitude of the response
%  2) latency of the response
%  3) width of the peak, 'WidthRefernce', 'halfHight', which uses the
%     amplitude to define the width of the response signal

%  The code is defined to search from the last bin, which has no lights on
%  til th 5th bin with the lights on. E.g. 6 bins in total. The
%  corresponding with the off response

peakAnalysisCell = cell (size(idxLightsOn,2),1); % for DVV_trad
if strcmp(fish_name,'PTZ_short')
tempCell={'5 min';'2 min';'1 min';'.5 min';'.25 min'};
else
    tempCell={'10 min';'5 min';'2 min';'1 min'};
end

nROIs = length(all_fish);

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

% figures on 

f20=figure;
t = tiledlayout(2,3); % Requires R2019b or later
title(t,'PTZ, ISI-all, findMax amplitude')
ylabel(t,'V(mm/s)')
t.Padding = 'none';

for i= 1:size(idxLightsOn,2)/5
    nexttile
    Vec = cell(5,1);
    for j=1:5
    Vec{i,1}(:,j) = ([peakAnalysisCell{j, 1}.amplitude]);                         % something is wrong works only for the 5 min ISI
    end 
    
    Vec2 = mean(Vec{i,1},2);
    b= boxchart(Vec2([groups{1,1:2}],:),...
        'GroupByColor',group_category([groups{1,1:2}],:));
    set(b,{'BoxFaceColor'},C1)
    
    h = text(1,10,{num2str(ranksum(Vec2(group1),Vec2(group2))) ;...           % change the number of test done manually
            num2str(ranksum(Vec2(group1),Vec2(group3)))}) ;...
%             num2str(ranksum(Vec(group1),Vec(group4))) ;...
%             num2str(ranksum(Vec(group1),Vec(group2))) ]);
    
    
end 

%  for i= 1:size(idxLightsOn,2)/5
%      nexttile
%     for j=1:length(groups)-2
%         plot (1:5,peakAnOn{j,1}(i*5-4:i*5,1),'Color', C2(j,:),...
%             'Marker','o'), hold on 
%         errorbar(peakAnOn{j,1}(i*5-4:i*5,1),peakAnOn{j,1}(i*5-4:i*5,3),...
%             'Color',C2(j,:))
% %             'Color', C2(j,:),'Marker','o'), hold on
%         
%     end  
%     xlim([.5 5.5])
%     hold off
%     title ([tempCell{i,1}])
%     box off 
%     set (gca,'TickDir', 'out')
%  end

 for f=1:length(formats)
     if strcmp (fish_name, 'PTZ')
         saveas(f20,['\\forskning.it.ntnu.no\ntnu\mh-kin\yaksi\Ahmed\Behaviour',...
             '\Larvae\figures\PTZ\for_Fig2\' 'Fig2_findMax_On' formats{1,f}])
     elseif strcmp (fish_name, 'PTZ_short')
         saveas(f20,['\\forskning.it.ntnu.no\ntnu\mh-kin\yaksi\Ahmed\Behaviour',...
             '\Larvae\figures\PTZ_s\for_Fig2\' 'Fig2_findMax_On' formats{1,f}])
     elseif strcmp (fish_name, 'eaat2a')
         saveas(f20,['\\forskning.it.ntnu.no\ntnu\mh-kin\yaksi\Ahmed\Behaviour',...
             '\Larvae\figures\Eaat2a\for_Fig2\' 'Fig2_findMax_On' formats{1,f}])
     elseif strcmp (fish_name, 'gabra1')
         saveas(f20,['\\forskning.it.ntnu.no\ntnu\mh-kin\yaksi\Ahmed\Behaviour',...
             '\Larvae\figures\gabra1\for_Fig2\' 'Fig2_findMax_On' formats{1,f}])
     elseif strcmp (fish_name, 'scn1lab')
         saveas(f20,['\\forskning.it.ntnu.no\ntnu\mh-kin\yaksi\Ahmed\Behaviour',...
             '\Larvae\figures\Scn1lab\for_Fig2\' 'Fig2_findMax_On' formats{1,f}])
     elseif strcmp (fish_name, 'S280F')
         saveas(f20,['\\forskning.it.ntnu.no\ntnu\mh-kin\yaksi\Ahmed\Behaviour',...
             '\Larvae\figures\s280f\for_Fig2\' 'Fig2_findMax_On' formats{1,f}])
     end
 end


% latency

f22=figure;
t = tiledlayout(2,3); % Requires R2019b or later
title(t,'PTZ, ISI-all, findMax latency')
ylabel(t,'seconds')
t.Padding = 'none';

for i= 1:size(idxLightsOn,2)/5
    nexttile
    Vec = cell(5,1);
    for j=1:5
    Vec{i,1}(:,j) = ([peakAnalysisCell{j, 1}.latency]);                         % something is wrong works only for the 5 min ISI
    end 
    
    Vec2 = mean(Vec{i,1},2);
    b= boxchart(Vec2([groups{1,1:2}],:),...
        'GroupByColor',group_category([groups{1,1:2}],:));
    set(b,{'BoxFaceColor'},C1)
    
    
    h = text(1,10,{num2str(ranksum(Vec2(group1),Vec2(group2))) ;...           % change the number of test done manually
        num2str(ranksum(Vec2(group1),Vec2(group3)))}) ;...
%         num2str(ranksum(Vec(group1),Vec(group4)))}) ;...
%             num2str(ranksum(Vec(group1),Vec(group2))) ]);

end 

% for i= 1:size(idxLightsOn,2)/5
%      nexttile
%     for j=1:length(groups)-2
%         plot (1:5,peakAnOn{j,1}(i*5-4:i*5,2),'Color', C2(j,:)), hold on 
%         errorbar (peakAnOn{j,1}(i*5-4:i*5,2),peakAnOn{j,1}(i*5-4:i*5,4)...  
%             ,'Color', C2(j,:),'Marker','o'), hold on
%     end  
%     xlim([.5 5.5])
%     hold off
%     title ([tempCell{i,1}])
%     box off 
%     set (gca,'TickDir', 'out')
%  end
 for f=1:length(formats)
     if strcmp (fish_name, 'PTZ')
         saveas(f22,['\\forskning.it.ntnu.no\ntnu\mh-kin\yaksi\Ahmed\Behaviour',...
             '\Larvae\figures\PTZ\for_Fig2\' 'Fig2_findMax_latency' formats{1,f}])
     elseif strcmp (fish_name, 'PTZ_short')
         saveas(f22,['\\forskning.it.ntnu.no\ntnu\mh-kin\yaksi\Ahmed\Behaviour',...
             '\Larvae\figures\PTZ_s\for_Fig2\' 'Fig2_findMax_latency' formats{1,f}])
     elseif strcmp (fish_name, 'eaat2a')
         saveas(f22,['\\forskning.it.ntnu.no\ntnu\mh-kin\yaksi\Ahmed\Behaviour',...
             '\Larvae\figures\Eaat2a\for_Fig2\' 'Fig2_findMax_latency' formats{1,f}])
     elseif strcmp (fish_name, 'gabra1')
         saveas(f22,['\\forskning.it.ntnu.no\ntnu\mh-kin\yaksi\Ahmed\Behaviour',...
             '\Larvae\figures\gabra1\for_Fig2\' 'Fig2_findMax_latency' formats{1,f}])
     elseif strcmp (fish_name, 'scn1lab')
         saveas(f22,['\\forskning.it.ntnu.no\ntnu\mh-kin\yaksi\Ahmed\Behaviour',...
             '\Larvae\figures\Scn1lab\for_Fig2\' 'Fig2_findMax_latency' formats{1,f}])
     elseif strcmp (fish_name, 'S280F')
         saveas(f22,['\\forskning.it.ntnu.no\ntnu\mh-kin\yaksi\Ahmed\Behaviour',...
             '\Larvae\figures\s280f\for_Fig2\' 'Fig2_findMax_latency' formats{1,f}])
     end
 end
 
 % Figures off

f23=figure;
t = tiledlayout(2,3); % Requires R2019b or later
title(t,'PTZ, ISI-all, findMax amplitude off')
ylabel(t,'DVV')
t.Padding = 'none';

for i= 1:size(idxLightsOn,2)/5
    nexttile
    Vec = cell(5,1);
    for j=1:5
    Vec{i,1}(:,j) = ([peakAnalysisCellOff{i, 1}.amplitude]);                         % something is wrong works only for the 5 min ISI
    end 
    
    Vec2 = mean(Vec{i,1},2);
    b= boxchart(Vec2([groups{1,1:2}],:),...
        'GroupByColor',group_category([groups{1,1:2}],:));
    set(b,{'BoxFaceColor'},C1)
    
    h = text(1,10,{num2str(ranksum(Vec2(group1),Vec2(group2))) ;...           % change the number of test done manually
        num2str(ranksum(Vec2(group1),Vec2(group3)))}) ;...
%         num2str(ranksum(Vec(group1),Vec(group4)))}) ;...
%             num2str(ranksum(Vec(group1),Vec(group2))) ]);

end 

%  for i= 1:size(idxLightsOn,2)/5
%      nexttile
%     for j=1:length(groups)-2
%         plot (1:5,peakAnOff{j,1}(i*5-4:i*5,1),'Color', C2(j,:),...
%             'Marker','o'), hold on 
%         errorbar (peakAnOff{j,1}(i*5-4:i*5,1),peakAnOff{j,1}...
%             (i*5-4:i*5,3),'Color', C2(j,:),'Marker','o'), hold on
%         
%     end  
%     xlim([.5 5.5])
%     hold off
%     title ([tempCell{i,1}])
%     box off 
%     set (gca,'TickDir', 'out')
%  end

 for f=1:length(formats)
     if strcmp (fish_name, 'PTZ')
         saveas(f23,['\\forskning.it.ntnu.no\ntnu\mh-kin\yaksi\Ahmed\Behaviour',...
             '\Larvae\figures\PTZ\for_Fig2\' 'Fig2_findMax_AmpOff' formats{1,f}])
     elseif strcmp (fish_name, 'PTZ_short')
         saveas(f23,['\\forskning.it.ntnu.no\ntnu\mh-kin\yaksi\Ahmed\Behaviour',...
             '\Larvae\figures\PTZ_s\for_Fig2\' 'Fig2_findMax_AmpOff' formats{1,f}])
     elseif strcmp (fish_name, 'eaat2a')
         saveas(f23,['\\forskning.it.ntnu.no\ntnu\mh-kin\yaksi\Ahmed\Behaviour',...
             '\Larvae\figures\Eaat2a\for_Fig2\' 'Fig2_findMax_AmpOff' formats{1,f}])
     elseif strcmp (fish_name, 'gabra1')
         saveas(f23,['\\forskning.it.ntnu.no\ntnu\mh-kin\yaksi\Ahmed\Behaviour',...
             '\Larvae\figures\gabra1\for_Fig2\' 'Fig2_findMax_AmpOff' formats{1,f}])
     elseif strcmp (fish_name, 'scn1lab')
         saveas(f23,['\\forskning.it.ntnu.no\ntnu\mh-kin\yaksi\Ahmed\Behaviour',...
             '\Larvae\figures\Scn1lab\for_Fig2\' 'Fig2_findMax_AmpOff' formats{1,f}])
     elseif strcmp (fish_name, 'S280F')
         saveas(f23,['\\forskning.it.ntnu.no\ntnu\mh-kin\yaksi\Ahmed\Behaviour',...
             '\Larvae\figures\s280f\for_Fig2\' 'Fig2_findMax_AmpOff' formats{1,f}])
     end
 end

% latency 

f25=figure;
t = tiledlayout(2,3); % Requires R2019b or later
title(t,'PTZ, ISI-all, findMax latency off')
ylabel(t,'seconds')
t.Padding = 'none';

for i= 1:size(idxLightsOn,2)/5
    nexttile
    Vec = cell(5,1);
    for j=1:5
    Vec{i,1}(:,j) = ([peakAnalysisCellOff{i, 1}.latency]);                         % something is wrong works only for the 5 min ISI
    end 
    
    Vec2 = mean(Vec{i,1},2);
    b= boxchart(Vec2([groups{1,1:2}],:),...
        'GroupByColor',group_category([groups{1,1:2}],:));
    set(b,{'BoxFaceColor'},C1)
    
    h = text(1,10,{num2str(ranksum(Vec2(group1),Vec2(group2))) ;...           % change the number of test done manually
        num2str(ranksum(Vec2(group1),Vec2(group3)))}) ;...
%         num2str(ranksum(Vec(group1),Vec(group4)))}) ;...
%             num2str(ranksum(Vec(group1),Vec(group2))) ]);

end 

%  for i= 1:size(idxLightsOn,2)/5
%      nexttile
%     for j=1:length(groups)-2
%         plot (1:5,peakAnOff{j,1}(i*5-4:i*5,2),'Color', C2(j,:)), hold on 
%         errorbar (peakAnOff{j,1}(i*5-4:i*5,2),peakAnOff{j,1}(i*5-4:i*5,4)...
%             ,'Color', C2(j,:),'Marker','o'), hold on
%     end  
%     xlim([.5 5.5])
%     hold off
%     title ([tempCell{i,1}])
%     box off 
%     set (gca,'TickDir', 'out')
%  end

 for f=1:length(formats)
     if strcmp (fish_name, 'PTZ')
         saveas(f25,['\\forskning.it.ntnu.no\ntnu\mh-kin\yaksi\Ahmed\Behaviour',...
             '\Larvae\figures\PTZ\for_Fig2\' 'Fig2_findMax_LatOff' formats{1,f}])
     elseif strcmp (fish_name, 'PTZ_short')
         saveas(f25,['\\forskning.it.ntnu.no\ntnu\mh-kin\yaksi\Ahmed\Behaviour',...
             '\Larvae\figures\PTZ_s\for_Fig2\' 'Fig2_findMax_LatOff' formats{1,f}])
     elseif strcmp (fish_name, 'eaat2a')
         saveas(f25,['\\forskning.it.ntnu.no\ntnu\mh-kin\yaksi\Ahmed\Behaviour',...
             '\Larvae\figures\Eaat2a\for_Fig2\' 'Fig2_findMax_LatOff' formats{1,f}])
     elseif strcmp (fish_name, 'gabra1')
         saveas(f25,['\\forskning.it.ntnu.no\ntnu\mh-kin\yaksi\Ahmed\Behaviour',...
             '\Larvae\figures\gabra1\for_Fig2\' 'Fig2_findMax_LatOff' formats{1,f}])
     elseif strcmp (fish_name, 'scn1lab')
         saveas(f25,['\\forskning.it.ntnu.no\ntnu\mh-kin\yaksi\Ahmed\Behaviour',...
             '\Larvae\figures\Scn1lab\for_Fig2\' 'Fig2_findMax_LatOff' formats{1,f}])
     elseif strcmp (fish_name, 'S280F')
         saveas(f25,['\\forskning.it.ntnu.no\ntnu\mh-kin\yaksi\Ahmed\Behaviour',...
             '\Larvae\figures\s280f\for_Fig2\' 'Fig2_findMax_LatOff' formats{1,f}])
     end
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
%     plot_shaded(ISI_amplitudes(g,:),ampISIstd(g,:),'Color',C2(g,:)
errorbar (ISI_amplitudes(g,:),ampISIstd(g,:),'--o', 'Color', C2(g,:))
xlim([0 6]), ylabel('V'), title ('amplitude per ISI')

hold on 
end 
hold off


nexttile, 
for g=1:length(groups)-2
errorbar(ISI_latency(g,:),latISIstd(g,:),'--o', 'Color', C2(g,:))
xlim([0 6]), ylabel ('time(s)'), title('latency')
hold on 
end 
hold off

 for f=1:length(formats)
     if strcmp (fish_name, 'PTZ')
         saveas(f26,['\\forskning.it.ntnu.no\ntnu\mh-kin\yaksi\Ahmed\Behaviour',...
             '\Larvae\figures\PTZ\for_Fig2\' 'Fig2_findMax_perISIon' formats{1,f}])
     elseif strcmp (fish_name, 'PTZ_short')
         saveas(f26,['\\forskning.it.ntnu.no\ntnu\mh-kin\yaksi\Ahmed\Behaviour',...
             '\Larvae\figures\PTZ_s\for_Fig2\' 'Fig2_findMax_perISIon' formats{1,f}])
     elseif strcmp (fish_name, 'eaat2a')
         saveas(f26,['\\forskning.it.ntnu.no\ntnu\mh-kin\yaksi\Ahmed\Behaviour',...
             '\Larvae\figures\Eaat2a\for_Fig2\' 'Fig2_findMax_perISIon' formats{1,f}])
     elseif strcmp (fish_name, 'gabra1')
         saveas(f26,['\\forskning.it.ntnu.no\ntnu\mh-kin\yaksi\Ahmed\Behaviour',...
             '\Larvae\figures\gabra1\for_Fig2\' 'Fig2_findMax_perISIon' formats{1,f}])
     elseif strcmp (fish_name, 'scn1lab')
         saveas(f26,['\\forskning.it.ntnu.no\ntnu\mh-kin\yaksi\Ahmed\Behaviour',...
             '\Larvae\figures\Scn1lab\for_Fig2\' 'Fig2_findMax_perISIon' formats{1,f}])
     elseif strcmp (fish_name, 'S280F')
         saveas(f26,['\\forskning.it.ntnu.no\ntnu\mh-kin\yaksi\Ahmed\Behaviour',...
             '\Larvae\figures\s280f\for_Fig2\' 'Fig2_findMax_perISIon' formats{1,f}])
     end
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
errorbar (ISI_amplitudesOff(g,:),ampISIstdOff(g,:),'--o', 'Color', C2(g,:))
xlim([0 6]), ylabel('V'), title ('amplitude per ISI')

hold on 
end 
hold off

nexttile, 
for g=1:length(groups)-2
errorbar(ISI_latencyOff(g,:),latISIstdOff(g,:),'--o', 'Color', C2(g,:))
xlim([0 6]), ylabel ('time(s)'), title('latency')
hold on 
end 
hold off

 for f=1:length(formats)
     if strcmp (fish_name, 'PTZ')
         saveas(f26,['\\forskning.it.ntnu.no\ntnu\mh-kin\yaksi\Ahmed\Behaviour',...
             '\Larvae\figures\PTZ\for_Fig2\' 'Fig2_findMax_perISIOff' formats{1,f}])
     elseif strcmp (fish_name, 'PTZ_short')
         saveas(f26,['\\forskning.it.ntnu.no\ntnu\mh-kin\yaksi\Ahmed\Behaviour',...
             '\Larvae\figures\PTZ_s\for_Fig2\' 'Fig2_findMax_perISIOff' formats{1,f}])
     elseif strcmp (fish_name, 'eaat2a')
         saveas(f26,['\\forskning.it.ntnu.no\ntnu\mh-kin\yaksi\Ahmed\Behaviour',...
             '\Larvae\figures\Eaat2a\for_Fig2\' 'Fig2_findMax_perISIOff' formats{1,f}])
     elseif strcmp (fish_name, 'gabra1')
         saveas(f26,['\\forskning.it.ntnu.no\ntnu\mh-kin\yaksi\Ahmed\Behaviour',...
             '\Larvae\figures\gabra1\for_Fig2\' 'Fig2_findMax_perISIOff' formats{1,f}])
     elseif strcmp (fish_name, 'scn1lab')
         saveas(f26,['\\forskning.it.ntnu.no\ntnu\mh-kin\yaksi\Ahmed\Behaviour',...
             '\Larvae\figures\Scn1lab\for_Fig2\' 'Fig2_findMax_perISIOff' formats{1,f}])
     elseif strcmp (fish_name, 'S280F')
         saveas(f26,['\\forskning.it.ntnu.no\ntnu\mh-kin\yaksi\Ahmed\Behaviour',...
             '\Larvae\figures\s280f\for_Fig2\' 'Fig2_findMax_perISIOff' formats{1,f}])
     end
 end
