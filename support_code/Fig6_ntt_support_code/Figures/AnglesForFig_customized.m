
% 1st run the script for figures to: 1) load the results.mat file, and run
% collor array 1 (C1) for loop to get the appropriate variables.

%% Gather the angles data
for j=1:length(fish_names)-1 %change to "5:..." after gathering??
    %% get fishname and all_fish
    fish_name = fish_names{1,j};
    
    for i=1
        if strcmp (fish_name, 'PTZ')
            C1 = {[0 0 0];[[253,190,133]/255]; [[253,141,60]/255]; [[217,71,1]/255]};
            all_fish = results.PTZ;
            
            load(['\\forskning.it.ntnu.no\ntnu\mh-kin\yaksi\Ahmed\',...
                'Behaviour\Larvae\idxlights1.mat'])
            load(['\\forskning.it.ntnu.no\ntnu\mh-kin\yaksi\Ahmed\'...
                'Behaviour\Larvae\tempMat6PTZ.mat']);
            tempMat6 = tempMat6PTZ_l;
            
        elseif strcmp(fish_name, 'PTZ_short')
            C1 = {[0 0 0];[[253,190,133]/255]; [[253,141,60]/255]; [[217,71,1]/255]};
            all_fish = results.PTZ_s;
            nROIs = length(all_fish);
            load(['\\forskning.it.ntnu.no\ntnu\mh-kin\yaksi\Ahmed\',...
                'Behaviour\Larvae\idxlights2.mat'])
            
            load(['\\forskning.it.ntnu.no\ntnu\mh-kin\yaksi\Ahmed\'...
                'Behaviour\Larvae\tempMat6PTZ_s.mat']);
            
            tempMat6 = tempMat6_PTZs;
            
        elseif strcmp (fish_name, 'gabra1')
            C1 = {[0 0 0];[[161,217,155]/255];[[49,163,84]/255]};
            all_fish = results.Gabra1;
            load(['\\forskning.it.ntnu.no\ntnu\mh-kin\yaksi\Ahmed\',...
                'Behaviour\Larvae\idxlights1.mat'])
            
            load(['\\forskning.it.ntnu.no\ntnu\mh-kin\yaksi\Ahmed\'...
                'Behaviour\Larvae\tempMat6Gabra1.mat']);
            
            tempMat6 = tempMat6Gabra1;
            
        elseif strcmp (fish_name, 'eaat2a')
            C1 = {[0 0 0];[[158,202,225]/255];[[49,130,189]/255]; [1 1 1]};
            all_fish = results.Eaat2;
            load(['\\forskning.it.ntnu.no\ntnu\mh-kin\yaksi\Ahmed\',...
                'Behaviour\Larvae\idxlights1.mat'])
            load(['\\forskning.it.ntnu.no\ntnu\mh-kin\yaksi\Ahmed\'...
                'Behaviour\Larvae\tempMat6Eaat2a.mat']);
            tempMat6 = tempMat6Eaat2a;
        elseif strcmp (fish_name, 'scn1lab')
            C1 = {[0 0 0]; [[188,189,220]/255];[[117,107,177]/255]; [1 1 1]};
            all_fish = results.Scn1lab;
            load(['\\forskning.it.ntnu.no\ntnu\mh-kin\yaksi\Ahmed\',...
                'Behaviour\Larvae\idxlights1.mat'])
            
            load(['\\forskning.it.ntnu.no\ntnu\mh-kin\yaksi\Ahmed\'...
                'Behaviour\Larvae\tempMat6Scn1lab.mat']);
            tempMat6 = tempMat6Scn1lab;
        elseif strcmp (fish_name, 's280f')
            C1 = {[0 0 0];[[197,27,138]/255];[1 1 1];[1 1 1]};
            all_fish = results.S280F;
            load(['\\forskning.it.ntnu.no\ntnu\mh-kin\yaksi\Ahmed\',...
                'Behaviour\Larvae\idxlights1.mat'])
            
            %     tempMat6 = load(['\\forskning.it.ntnu.no\ntnu\mh-kin\yaksi\Ahmed\'...
            %         'Behaviour\Larvae\tempMat6Eaat2a.mat'])
            %         ikke med enda
            
        end
    end
    
    %% get groups and color array
    
    [group1,group2,group3,group4,group5,allgroups,...
        name_group1,name_group2,name_group3,name_group4,name_group5,...
        group_category, groups, name_groups, nROIs]...
        = AJ_getGroups (fish_name);
    
    for i=1
        if strcmp (fish_name, 'PTZ')
            C2 = [[0 0 0];[[253,190,133]/255]; [[253,141,60]/255]; [[217,71,1]/255]];
            tempMat = results.tempMat.PTZ;
        elseif strcmp (fish_name, 'PTZ_short')
            C2 = [[0 0 0];[[253,190,133]/255]; [[253,141,60]/255]; [[217,71,1]/255]];
            tempMat = results.tempMat.PTZ_short;
        elseif strcmp (fish_name, 'gabra1')
            C2 = [[0 0 0];[[161,217,155]/255];[[49,163,84]/255]] ;
            tempMat = results.tempMat.gabra1;
        elseif strcmp (fish_name, 'eaat2a')
            C2 = [[0 0 0];[[158,202,225]/255];[[49,130,189]/255]; [1 1 1]];
            tempMat = results.tempMat.eaat2a;
        elseif strcmp (fish_name, 'scn1lab')
            C2 = [[0 0 0]; [[188,189,220]/255];[[117,107,177]/255]; [1 1 1]];
            tempMat = results.tempMat.scn1lab;
        elseif strcmp (fish_name, 's280f')
            C2 = [[0 0 0];[[197,27,138]/255]];
            tempMat = results.tempMat.s280f;
        end
        
        if strcmp (fish_name, 'PTZ_short')
            idxLightsOn =  idxLightsOn2;
            idxLightsOff = idxLightsOff2;
        else
            idxLightsOn =  idxLightsOn1;
            idxLightsOff = idxLightsOff1;
        end
        
    end
    
    %% get angles
    
    
    ang = cell (5,1);
    % ang2 = ang;
    
    for i=1:5
        for ROI =1:nROIs
            A =[tempMat6{i, 2}(ROI,1:1800)',...
                tempMat6{i, 3}(ROI,1:1800)'];
            B = [tempMat6{i, 2}(ROI,1:1801)',...
                tempMat6{i, 3}(ROI,1:1801)'];
            C = [tempMat6{i, 2}(ROI,1:1802)',...
                tempMat6{i, 3}(ROI,1:1802)'];
            
            % If A, B, and C are three points in two-dimensional space defined by
            % 1 x 2 coordinate row vectors, the angle
            % ABC - that is, the angle between line segments AB and CB:
            
            % Do not change
            
            
            for j=1:length(A)
                AB = A(j,:)-B(j+1,:);
                CB = C(j+2,:)-B(j+1,:);
                if atan2((det([AB;CB])),dot(AB,CB))<0 % Angle in radians
                    ang{i,1}(ROI,j) = pi+ atan2((det([AB;CB])),dot(AB,CB)); % left turns
                elseif atan2((det([AB;CB])),dot(AB,CB))>0
                    ang{i,1}(ROI,j) = -pi+ atan2((det([AB;CB])),dot(AB,CB)); % right turns
                else
                    ang{i,1}(ROI,j) = atan2((det([AB;CB])),dot(AB,CB)); % no-changes
                end
            end
            
        end
        ang{i,1}(ROI,:) = abs((ang{i,1}(ROI,:)));                             % smoothed, 2.43 Hz moving filter
        %     ang2{i,1}(ROI,:)= (ang{i,1}(ROI,:)-mean(ang{i,1}(ROI,1:149),'omitnan'));
        
    end
    
    
    A = nan(5,1800);
    MuAng = nan(nROIs,1800);
    
    
    for ROI=1:nROIs
        for i=1:5
            A(i,:) = (ang{i, 1}(ROI,:));
        end
        MuAng(ROI,:) = mean(abs(A),1,'omitnan');
    end
    
    resultsForFig3.(fish_name).MuAng = MuAng;
    
end

load('\\forskning.it.ntnu.no\ntnu\mh-kin\yaksi\Ahmed\Behaviour\Larvae\forFig3.mat')
%% Prepare figure for the angles data
flds3 = fields (resultsForFig3);

for i= 1:length(fields(resultsForFig3))
    %% Get color array and groups
    fish_name = fish_names{1,i};
    [group1,group2,group3,group4,group5,allgroups,...
        name_group1,name_group2,name_group3,name_group4,name_group5,...
        group_category, groups, name_groups, nROIs]...
        = AJ_getGroups (fish_name);
    
    
    for m=1
        if strcmp (fish_name, 'PTZ')
            C2 = [[0 0 0];[[253,190,133]/255]; [[253,141,60]/255]; [[217,71,1]/255]];
            tempMat = results.tempMat.PTZ;
        elseif strcmp (fish_name, 'PTZ_short')
            C2 = [[0 0 0];[[253,190,133]/255]; [[253,141,60]/255]; [[217,71,1]/255]];
            tempMat = results.tempMat.PTZ_short;
        elseif strcmp (fish_name, 'gabra1')
            C2 = [[0 0 0];[[161,217,155]/255];[[49,163,84]/255]] ;
            tempMat = results.tempMat.gabra1;
        elseif strcmp (fish_name, 'eaat2a')
            C2 = [[0 0 0];[[158,202,225]/255];[[49,130,189]/255]; [1 1 1]];
            tempMat = results.tempMat.eaat2a;
        elseif strcmp (fish_name, 'scn1lab')
            C2 = [[0 0 0]; [[188,189,220]/255];[[117,107,177]/255]; [1 1 1]];
            tempMat = results.tempMat.scn1lab;
        elseif strcmp (fish_name, 'S280F')
            C2 = [[0 0 0];[[197,27,138]/255]];
            tempMat = results.tempMat.s280f;
        end
        
        if strcmp (fish_name, 'PTZ_short')
            idxLightsOn =  idxLightsOn2;
            idxLightsOff = idxLightsOff2;
        else
            idxLightsOn =  idxLightsOn1;
            idxLightsOff = idxLightsOff1;
        end
        
    end
    
    %% plot the angles data - heatmap (row 1)
    %         nexttile (i),
    
    if strcmp(fish_name,'PTZ')||strcmp(fish_name,'PTZ_short')
        f1=figure();
        f1.WindowState = 'Maximized';
        f1=tiledlayout(4,1,'TileSpacing','compact','Padding', 'none');
        for k=1:4
            nexttile
            imagesc (resultsForFig3.(flds3{i,1}).MuAng([groups{1,k}],:))
            colormap(flipud(hot)), caxis([0 .6])
            set(gca,'xtick',[],'ytick',[])
        end
        
    elseif strcmp(fish_name,'gabra1')||strcmp(fish_name,'eaat2a')
        f10=figure();
        f10.WindowState = 'Maximized';
        f10=tiledlayout(3,1,'TileSpacing','compact','Padding', 'none');
        for l=1:3
            nexttile
            imagesc (resultsForFig3.(flds3{i,1}).MuAng([groups{1,l}],:))
            colormap(flipud(hot)), caxis([0 .6])
            set(gca,'xtick',[],'ytick',[])
        end
    elseif strcmp(fish_name,'s280f')
        f11=figure();
        f11.WindowState = 'Maximized';
        f11=tiledlayout(2,1,'TileSpacing','compact','Padding', 'none');
        for q=1:2
            nexttile
            imagesc (resultsForFig3.(flds3{i,1}).MuAng([groups{1,q}],:))
            colormap(flipud(hot)), caxis([0 .6])
            set(gca,'xtick',[],'ytick',[])
        end
    else
        f11=figure();
        f11.WindowState = 'Maximized';
        f11=tiledlayout(3,1,'TileSpacing','compact','Padding', 'none');
        for m=1:3
            nexttile
            imagesc (resultsForFig3.(flds3{i,1}).MuAng([groups{1,m}],:))
            colormap(flipud(hot)), caxis([0 .6])
            set(gca,'xtick',[],'ytick',[])
        end
    end
    
end



       f2=figure();
    f2.WindowState = 'Maximized';
    f2=tiledlayout(3,6,'TileSpacing','compact','Padding', 'none');
    
for j= [1,3:4]%1:length(fields(resultsForFig3)) %CHANGE according to what to plot
    
    
    fish_name = fish_names{1,j};
    [group1,group2,group3,group4,group5,allgroups,...
        name_group1,name_group2,name_group3,name_group4,name_group5,...
        group_category, groups, name_groups, nROIs]...
        = AJ_getGroups (fish_name);
    
    for m=1
        if strcmp (fish_name, 'PTZ')
            C2 = [[0 0 0];[[253,190,133]/255]; [[253,141,60]/255]; [[217,71,1]/255]];
            tempMat = results.tempMat.PTZ;
        elseif strcmp (fish_name, 'PTZ_short')
            C2 = [[0 0 0];[[253,190,133]/255]; [[253,141,60]/255]; [[217,71,1]/255]];
            tempMat = results.tempMat.PTZ_short;
        elseif strcmp (fish_name, 'gabra1')
            C2 = [[0 0 0];[[161,217,155]/255];[[49,163,84]/255]] ;
            tempMat = results.tempMat.gabra1;
        elseif strcmp (fish_name, 'eaat2a')
            C2 = [[0 0 0];[[158,202,225]/255];[[49,130,189]/255]; [1 1 1]];
            tempMat = results.tempMat.eaat2a;
        elseif strcmp (fish_name, 'scn1lab')
            C2 = [[0 0 0]; [[188,189,220]/255];[[117,107,177]/255]; [1 1 1]];
            tempMat = results.tempMat.scn1lab;
        elseif strcmp (fish_name, 's280f')
            C2 = [[0 0 0];[[197,27,138]/255]];
            tempMat = results.tempMat.s280f;
        end
        
        if strcmp (fish_name, 'PTZ_short')
            idxLightsOn =  idxLightsOn2;
            idxLightsOff = idxLightsOff2;
        else
            idxLightsOn =  idxLightsOn1;
            idxLightsOff = idxLightsOff1;
        end
    end
    
        %% resample the mean angles
    MuAngR = nan(nROIs,120);
    for ROI=1:nROIs
        if isnan(mean(resultsForFig3.(flds3{j,1}).MuAng(ROI,:)))
        else
            MuAngR(ROI,:) = resample(resultsForFig3.(flds3{j,1}).MuAng(ROI,:),...
                [1/30:1/30:60],2,1,30,'pchip'); % downsampling to two hz
        end
        %         resultsForFig3.MuAngRs.(flds3{i,1}) = MuAngR;
    end%% plot mean of mean - line plot (row 2)
    
    nexttile(j),
    area([8 8 27 27],[0 30 30 0],'FaceColor',[.8 .8 .8],'FaceAlpha',0.5,'LineStyle','none')
    hold on
    if strcmp(fish_name,'PTZ')||strcmp(fish_name,'PTZ_short')
        boundedline(1:size(MuAngR,2),...
            mean(MuAngR(group1,:),'omitnan'),...
            std(MuAngR(group1,:),[],1,'omitnan')./...
            sqrt(length(group1)),'alpha',...
            1:size(MuAngR,2),...
            mean(MuAngR(group2,:),'omitnan'),...
            std(MuAngR(group2,:),[],1,'omitnan')./...
            sqrt(length(group2)),'alpha',...
            1:size(MuAngR,2),...
            mean(MuAngR(group3,:),'omitnan'),...
            std(MuAngR(group3,:),[],1,'omitnan')./...
            sqrt(length(group3)),'alpha',...
            1:size(MuAngR,2),...
            mean(MuAngR(group4,:),'omitnan'),...
            std(MuAngR(group4,:),[],1,'omitnan')./...
            sqrt(length(group4)),'alpha','cmap',C2)
    elseif strcmp(fish_name,'gabra1')||strcmp(fish_name,'eaat2a')
        boundedline(1:size(MuAngR,2),...
            mean(MuAngR(group1,:),'omitnan'),...
            std(MuAngR(group1,:),[],1,'omitnan')./...
            sqrt(length(group1)),'alpha',...
            1:size(MuAngR,2),...
            mean(MuAngR(group2,:),'omitnan'),...
            std(MuAngR(group2,:),[],1,'omitnan')./...
            sqrt(length(group2)),'alpha',...
            1:size(MuAngR,2),...
            mean(MuAngR(group3,:),'omitnan'),...
            std(MuAngR(group3,:),[],1,'omitnan')./...
            sqrt(length(group3)),'alpha','cmap',C2)
        set(gca,'Ycolor','none')
    elseif strcmp(fish_name,'s280f')
        boundedline(1:size(MuAngR,2),...
            mean(MuAngR(group1,:),'omitnan'),...
            std(MuAngR(group1,:),[],1,'omitnan')./...
            sqrt(length(group1)),'alpha',...
            1:size(MuAngR,2),...
            mean(MuAngR(group2,:),'omitnan'),...
            std(MuAngR(group2,:),[],1,'omitnan')./...
            sqrt(length(group2)),'alpha','cmap',C2)
%         set(gca,'Ycolor','none')
    else
        boundedline(1:size(MuAngR,2),...
            mean(MuAngR(group1,:),'omitnan'),...
            std(MuAngR(group1,:),[],1,'omitnan')./...
            sqrt(length(group1)),'alpha',...
            1:size(MuAngR,2),...
            mean(MuAngR(group2,:),'omitnan'),...
            std(MuAngR(group2,:),[],1,'omitnan')./...
            sqrt(length(group2)),'alpha',...
            1:size(MuAngR,2),...
            mean(MuAngR(group3,:),'omitnan'),...
            std(MuAngR(group3,:),[],1,'omitnan')./...
            sqrt(length(group3)),'alpha','cmap',C2)
    end
    
    
    xticks([]);
    box off;
    xlim([1 120]), ylim([0 .3])
    
    %     %% calculate and plot normalized angles
    %     for m=1
    %      nexttile(i+10),
    %      area([7 7 28 28],[0 50 50 0],'FaceColor',[.8 .8 .8],'FaceAlpha',0.5,'LineStyle','none')
    % hold on
    %    if strcmp(fish_name,'PTZ')||strcmp(fish_name,'PTZ_short')
    %         for k=1:length(groups)-1
    %         boundedline(1:size(MuAngR,2),...
    %             (mean(MuAngR(groups{1,k},:),'omitnan'))./...
    %             mean(mean(MuAngR(groups{1,k},1:8),'omitnan')),...
    %             std(MuAngR(groups{1,k},:)./mean(mean(MuAngR(groups{1,k},1:8)),...
    %             'omitnan'),[],1,'omitnan')./...
    %             sqrt(length(group1)),'cmap',C2(k,:))
    %         end
    %         hold off
    %    elseif strcmp(fish_name,'gabra1')||strcmp(fish_name,'eaat2a')
    %         for k=1:length(groups)-2
    %         boundedline(1:size(MuAngR,2),...
    %             mean(MuAngR(groups{1,k},:),'omitnan')./...
    %             mean(mean(MuAngR(groups{1,k},1:8),'omitnan')),...
    %             std(MuAngR(groups{1,k},:)./mean(mean(MuAngR(groups{1,k},1:8))),...
    %             [],1,'omitnan')./...
    %             sqrt(length(groups{1,k})),'cmap',C2(k,:))
    %      set(gca,'Ycolor','none')
    %        end
    %     else
    %         for k=1:length(groups)-2
    %         boundedline(1:size(MuAngR,2),...
    %             mean(MuAngR(groups{1,k},:),'omitnan')./...
    %             mean(mean(MuAngR(groups{1,k},1:8),'omitnan')),...
    %             std(MuAngR(groups{1,k},:)./mean(mean(MuAngR(groups{1,k},1:8))),...
    %             [],1,'omitnan')./...
    %             sqrt(length(groups{1,k})),'cmap',C2(k,:))
    %         end
    %     end
    %  box off;
    % xlim([1 120]), ylim([0 44])
    %     end
    
    %% find max of velocities
    peakAnalysisCellAngOn =nan(nROIs,2);
    
    for ROI=1:nROIs
        if isnan(mean(MuAngR(ROI,1:6)))
        else
            peakAnalysisCellAngOn(ROI,1) = ...
                max(MuAngR(ROI,7:18)-mean(MuAngR(ROI,1:6),...
                'omitnan')); % amplitude
            alef = (find...
                ((MuAngR(ROI,7:18)-mean(MuAngR(ROI,1:6)))...
                == max((MuAngR(ROI,7:18))-mean(MuAngR...
                (ROI,1:6)))))*.5;
            peakAnalysisCellAngOn(ROI,2) = alef(1);% latency 2Hz resampled data
        end
    end
    
    peakAnalysisCellAngOff =nan(nROIs,2);
    
    for ROI=1:nROIs
        if isnan(mean(MuAngR(ROI,1:6)))
        else
            peakAnalysisCellAngOff(ROI,1) = ...
                max(MuAngR(ROI,29:39)-mean(MuAngR(ROI,27:28),...
                'omitnan')); % amplitude
            be = (find...
                ((MuAngR(ROI,29:39)-mean(MuAngR(ROI,27:28)))...
                == max((MuAngR(ROI,29:39))-mean(MuAngR...
                (ROI,27:28)))))*.5;
            peakAnalysisCellAngOff(ROI,2) = be(1);% latency 2Hz resampled data
        end
    end
    
    %% colormap for boxchart
    for m=2
        if strcmp (fish_name, 'PTZ')
            C1 = {[0 0 0];[[253,190,133]/255]; [[253,141,60]/255]; [[217,71,1]/255]};
        elseif strcmp(fish_name, 'PTZ_short')
            C1 = {[0 0 0];[[253,190,133]/255]; [[253,141,60]/255]; [[217,71,1]/255]};
        elseif strcmp (fish_name, 'gabra1')
            C1 = {[0 0 0];[[161,217,155]/255];[[49,163,84]/255]};
        elseif strcmp (fish_name, 'eaat2a')
            C1 = {[0 0 0];[[158,202,225]/255];[[49,130,189]/255]};
        elseif strcmp (fish_name, 'scn1lab')
            C1 = {[0 0 0]; [[188,189,220]/255];[[117,107,177]/255]};
        elseif strcmp (fish_name, 'S280F')
            C1 = {[0 0 0];[[197,27,138]/255]};
        end
    end
    %% plot max - boxplot
    
    nexttile(j+6)
    if strcmp(fish_name,'PTZ')||strcmp(fish_name,'PTZ_short')
        b= boxchart(peakAnalysisCellAngOn([groups{1,1:4}],1),...
            'GroupByColor',group_category([groups{1,1:4}],:),'BoxWidth',.5,'BoxFaceAlpha',0.5,'LineWidth',.5,'MarkerStyle','none');
        set(b,{'BoxFaceColor'},C1)
            h = text(1,.5,{num2str(ranksum(peakAnalysisCellAngOn(group1',1),peakAnalysisCellAngOn(group2',1))) ;...           % change the number of test done manually
        num2str(ranksum(peakAnalysisCellAngOn(group1',1),peakAnalysisCellAngOn(group3',1))) ;...
        num2str(ranksum(peakAnalysisCellAngOn(group1',1),peakAnalysisCellAngOn(group4',1)))});
    set(h,'rotation',90)
    elseif strcmp(fish_name,'gabra1')||strcmp(fish_name,'eaat2a')
        b= boxchart(peakAnalysisCellAngOn([groups{1,1:3}],1),...
            'GroupByColor',group_category([groups{1,1:3}],:),'BoxWidth',.5,'BoxFaceAlpha',0.5,'LineWidth',.5,'MarkerStyle','none');
        set(b,{'BoxFaceColor'},C1)
        set(gca,'Ycolor','none')
            h = text(1,.5,{num2str(ranksum(peakAnalysisCellAngOn(group1',1),peakAnalysisCellAngOn(group2',1))) ;...           % change the number of test done manually
        num2str(ranksum(peakAnalysisCellAngOn(group1',1),peakAnalysisCellAngOn(group3',1)))});
    set(h,'rotation',90)
    elseif strcmp(fish_name,'s280f')
        b= boxchart(peakAnalysisCellAngOn([groups{1,1:2}],1),...
            'GroupByColor',group_category([groups{1,1:2}],:),'BoxWidth',.5,'BoxFaceAlpha',0.5,'LineWidth',.5,'MarkerStyle','none');
        set(b,{'BoxFaceColor'},C1)
%         set(gca,'Ycolor','none')
            h = text(1,.5,{num2str(ranksum(peakAnalysisCellAngOn(group1',1),peakAnalysisCellAngOn(group2',1)))});           % change the number of test done manually
    set(h,'rotation',90)
    else
        b= boxchart(peakAnalysisCellAngOn([groups{1,1:3}],1),...
            'GroupByColor',group_category([groups{1,1:3}],:),'BoxWidth',.5,'BoxFaceAlpha',0.5,'LineWidth',.5,'MarkerStyle','none');
        set(b,{'BoxFaceColor'},C1)
            h = text(1,.5,{num2str(ranksum(peakAnalysisCellAngOn(group1',1),peakAnalysisCellAngOn(group2',1))) ;...           % change the number of test done manually
        num2str(ranksum(peakAnalysisCellAngOn(group1',1),peakAnalysisCellAngOn(group3',1)))});
    set(h,'rotation',90)
    end
    
    xticks([]);
    ylim([-.05 .6])
    box off;
    
    %% plot max off - boxplot
    
    nexttile(j+12)
    if strcmp(fish_name,'PTZ')||strcmp(fish_name,'PTZ_short')
        b= boxchart(peakAnalysisCellAngOff([groups{1,1:4}],1),...
            'GroupByColor',group_category([groups{1,1:4}],:),'BoxWidth',.5,'BoxFaceAlpha',0.5,'LineWidth',.5,'MarkerStyle','none');
        set(b,{'BoxFaceColor'},C1)
             h = text(1,.2,{num2str(ranksum(peakAnalysisCellAngOff(group1',1),peakAnalysisCellAngOff(group2',1))) ;...           % change the number of test done manually
        num2str(ranksum(peakAnalysisCellAngOff(group1',1),peakAnalysisCellAngOff(group3',1))) ;...
        num2str(ranksum(peakAnalysisCellAngOff(group1',1),peakAnalysisCellAngOff(group4',1)))});
    set(h,'rotation',90)
    elseif strcmp(fish_name,'gabra1')||strcmp(fish_name,'eaat2a')
        b= boxchart(peakAnalysisCellAngOff([groups{1,1:3}],1),...
            'GroupByColor',group_category([groups{1,1:3}],:),'BoxWidth',.5,'BoxFaceAlpha',0.5,'LineWidth',.5,'MarkerStyle','none');
        set(b,{'BoxFaceColor'},C1)
        set(gca,'Ycolor','none')
             h = text(1,.2,{num2str(ranksum(peakAnalysisCellAngOff(group1',1),peakAnalysisCellAngOff(group2',1))) ;...           % change the number of test done manually
        num2str(ranksum(peakAnalysisCellAngOff(group1',1),peakAnalysisCellAngOff(group3',1)))});
    set(h,'rotation',90)
    elseif strcmp(fish_name,'s280f')
        b= boxchart(peakAnalysisCellAngOff([groups{1,1:2}],1),...
            'GroupByColor',group_category([groups{1,1:2}],:),'BoxWidth',.5,'BoxFaceAlpha',0.5,'LineWidth',.5,'MarkerStyle','none');
        set(b,{'BoxFaceColor'},C1)
%         set(gca,'Ycolor','none')
             h = text(1,.2,{num2str(ranksum(peakAnalysisCellAngOff(group1',1),peakAnalysisCellAngOff(group2',1)))});          % change the number of test done manually
    set(h,'rotation',90)
    else
        b= boxchart(peakAnalysisCellAngOff([groups{1,1:3}],1),...
            'GroupByColor',group_category([groups{1,1:3}],:),'BoxWidth',.5,'BoxFaceAlpha',0.5,'LineWidth',.5,'MarkerStyle','none');
        set(b,{'BoxFaceColor'},C1)
             h = text(1,.2,{num2str(ranksum(peakAnalysisCellAngOff(group1',1),peakAnalysisCellAngOff(group2',1))) ;...           % change the number of test done manually
        num2str(ranksum(peakAnalysisCellAngOff(group1',1),peakAnalysisCellAngOff(group3',1)))});
    set(h,'rotation',90)
    end
    
    xticks([0 .4]);
    ylim([-.05 .4])
    box off;
end
