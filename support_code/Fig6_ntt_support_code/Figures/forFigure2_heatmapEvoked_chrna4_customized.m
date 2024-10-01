% V 2.43 Hz

tempCell_V_2_43Hz = cell (4,2);
tempCell_V_2_43Hz{1,1} = ("10'ISI");
tempCell_V_2_43Hz{2,1} = ("5'ISI");
tempCell_V_2_43Hz{3,1} = ("2''ISI");
tempCell_V_2_43Hz{4,1} = ("1''ISI");


% Mean response per fish not sorted

for j=2%:size(idxLightsOn,2)/5
    for ROI=1:nROIs
        A = nan(3,size(tempMat{1, 6},2) );
        for k=(j*5-(5-1):j*5)
            A(k,:) = tempMat{k,6}(ROI,:);
        end
        tempCell_V_2_43Hz{j, 2}(ROI,:) = mean (A,1.,'omitnan');
    end
end

% raw velocity plot, heatmap  sorted

f1= figure;
% %     f1.WindowState='Maximized';
f1=tiledlayout(4,1);%,size(idxLightsOn,2)/5); % Requires R2019b or later
% title(f1,['raw velocity, mean response per fish, S heatmap, 2.43 Hz ',...
%     fish_name])
% ylabel(f1,'Mean velocity (mm/s)')
f1.Padding = 'compact';
f1.TileSpacing = 'compact';

% subTitle={'0 mM','1 mM','5 mM','15 mM'};

% for k=2%:size(idxLightsOn,2)/5
%     for m=2:3
        nexttile
        imagesc(tempCell_V_2_43Hz{2,2}(([groups{1,3}]),:))
        set(gca,'xtick',[],'ytick',[])
%         ylabel(subTitle{m})
        colormap(flipud(hot))
        caxis([0 2])%ceil(max(max(limitMat)))])
            xlim([0 146])
         nexttile
        imagesc(tempCell_V_2_43Hz{2,2}(([groups{1,2}]),:))
        set(gca,'xtick',[],'ytick',[])
%         ylabel(subTitle{m})
        colormap(flipud(hot))
        caxis([0 2])%ceil(max(max(limitMat)))])
            xlim([0 146])
 
%     end
% end
% 
% colorbar
% col_han_pos  = [0.96 0.54 0.02 0.4];
% col_cod = 'dF/F';
% col_han = colorbar;
% col_han.Position = col_han_pos;
% col_han.Label.String = col_cod;

for k=2%:size(idxLightsOn,2)/5
    nexttile(3,[2,1])
%     draw=[0 30 13 36];
area([11 11 35 35],[0 30 30 0],'FaceColor',[.8 .8 .8],'FaceAlpha',0.5,'LineStyle','none')
hold on
boundedline(1:size(tempCell_V_2_43Hz{k,2},2),...
        mean(tempCell_V_2_43Hz{k,2}(group2,:),'omitnan'),...
        std((tempCell_V_2_43Hz{k,2}(group2,:)),[],1,'omitnan')...
        ./sqrt(length(group2)),'alpha',...
        1:size(tempCell_V_2_43Hz{k,2},2),...
        mean(tempCell_V_2_43Hz{k,2}(group1,:),'omitnan'),...
        std((tempCell_V_2_43Hz{k,2}(group1,:)),[],1,'omitnan')...
        ./sqrt(length(group1)),'alpha',...
        'cmap',C2);
    
    %         legend('','','','', name_groups{1,1:4})
    box off;
    xlim([1 146])
    ylim([-.1 2])
%     ylabel('Per group')
%     xlabel('time (min)')
    xticks([])
        yticks([0 2]);
end
set(gca,'FontSize',12);
% set(gca,'Ycolor','none','FontSize',12)

% for f=1%:length(formats)
%     if strcmp (fish_name, 'PTZ')
%         saveas(f1,['\\forskning.it.ntnu.no\ntnu\mh-kin\yaksi\Ahmed\Behaviour',...
%             '\Larvae\figures\PTZ\for_Fig2\' 'Fig2_heatmap&linePlot' formats{1,f}])
%     elseif strcmp (fish_name, 'PTZ_short')
%         saveas(f1,['\\forskning.it.ntnu.no\ntnu\mh-kin\yaksi\Ahmed\Behaviour',...
%             '\Larvae\figures\PTZ_s\for_Fig2\' 'Fig2_heatmap&linePlot' formats{1,f}])
%     elseif strcmp (fish_name, 'eaat2a')
%         saveas(f1,['\\forskning.it.ntnu.no\ntnu\mh-kin\yaksi\Ahmed\Behaviour',...
%             '\Larvae\figures\Eaat2a\for_Fig2\' 'Fig2_heatmap&linePlot' formats{1,f}])
%     elseif strcmp (fish_name, 'gabra1')
%         saveas(f1,['\\forskning.it.ntnu.no\ntnu\mh-kin\yaksi\Ahmed\Behaviour',...
%             '\Larvae\figures\gabra1\for_Fig2\' 'Fig2_heatmap&linePlot' formats{1,f}])
%     elseif strcmp (fish_name, 'scn1lab')
%         saveas(f1,['\\forskning.it.ntnu.no\ntnu\mh-kin\yaksi\Ahmed\Behaviour',...
%             '\Larvae\figures\Scn1lab\for_Fig2\' 'Fig2_heatmap&linePlot' formats{1,f}])
%     elseif strcmp (fish_name, 'S280F')
%         saveas(f1,['\\forskning.it.ntnu.no\ntnu\mh-kin\yaksi\Ahmed\Behaviour',...
%             '\Larvae\figures\s280f\for_Fig2\' 'Fig2_heatmap&linePlot' formats{1,f}])
%     end
% end
