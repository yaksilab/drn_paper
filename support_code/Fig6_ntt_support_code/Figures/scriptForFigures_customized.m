%% for figures

% write the fishname here;
fish_names = {'PTZ_short', 'PTZ', 'gabra1', 'eaat2a',...
    'scn1lab', 's280f'};


%NB!For fig1 (mean speed) use 'PTZ', for evoked use 'PTZ_short'!

fish_name='eaat2a';
%Change line 88 also (all_fish->results...)

load(['\\forskning.it.ntnu.no\ntnu\mh-kin\yaksi\Ahmed\',...
    'Behaviour\Larvae\results.mat'])

% load(['\\forskning.it.ntnu.no\ntnu\mh-kin\yaksi\Ahmed\',...
%     'Behaviour\Larvae\tempMats.mat'])

timebin =1/2.433846153846;

%% calculate temMat
% results = orderfields(results,[4 1 6 5 8 7 2 3 9]); 
% results = rmfield(results,'tempMat');

%  tempMatsForFig

%% for figure 1 - sponatnious behaviour - mean velocity

% color array 
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
    C1 = {[0 0 0];[[197,27,138]/255]};
    all_fish = results.S280F;
    load(['\\forskning.it.ntnu.no\ntnu\mh-kin\yaksi\Ahmed\',...
        'Behaviour\Larvae\idxlights1.mat'])
         load('\\forskning.it.ntnu.no\ntnu\mh-kin\yaksi\Ahmed\Behaviour\Larvae\tempMat6_s280f.mat')
        tempMat6 = tempMat6_s280f;   
%     tempMat6 = load(['\\forskning.it.ntnu.no\ntnu\mh-kin\yaksi\Ahmed\'...
%         'Behaviour\Larvae\tempMat6Eaat2a.mat'])
%         ikke med enda
    
end 
end

transitionTime = 3600; 
for ROI=1:size(all_fish,1)
    all_fish{ROI,1}.SponBehaviour.meanVelocity =...                             
        all_fish{ROI,1}.bV_E4sd(1:floor(transitionTime));                  % change all_fish to the results field you are using/ model 
end 
% data array 
matMeanVelTemp=nan(size(all_fish,1),floor(transitionTime));
for ROI=1:size(all_fish)
    matMeanVelTemp(ROI,:)=vertcat(all_fish{ROI,1}.SponBehaviour.meanVelocity);
end

bV_E4sd_spontanious = mean(matMeanVelTemp,2,'omitnan');



[group1,group2,group3,group4,group5,allgroups,...
    name_group1,name_group2,name_group3,name_group4,name_group5,...
    group_category, groups, name_groups, nROIs]...
    = AJ_getGroups_customized (fish_name);

    
% plot

f17= figure;
% f17.WindowState = 'maximized';

% subplot(4,6,[1:2,7:8,13:14,19:20])

b = boxchart(mean(matMeanVelTemp([group1 group2 group3 group4],:),...
    2,'omitnan'),'BoxFaceAlpha',0.5,'LineWidth',.5,'MarkerStyle','none','GroupByColor',group_category([group1 group2...
    group3 group4]));  %boxplot of median velocity for the groups
set(b,{'BoxFaceColor'},C1) 
ylim ([-.5 8])
% xlim([0 4]);
xticks([]);
yticks([0 4 8]);
% title(['Mean velocity per subgroup_ ' fish_name])
% box('off')
% h=text(1,5,num2str([ranksum(bV_E4sd_spontanious(group2),...                    
% bV_E4sd_spontanious(group1));...
% ranksum(bV_E4sd_spontanious(group3),...
% bV_E4sd_spontanious(group1))])); ... %    
% ranksum(bV_E4sd_spontanious(group1),bV_E4sd_spontanious(group4))]));            % Warning - change for PTZ-exps
%    text(4.5,max(bV_E4sd_spontanious(group1))+1,['ranksum p-value = ',...
%    num2str(ranksum(bV_E4sd_spontanious(group4),bV_E4sd_spontanious(group5)))],'Color','r')};
% set(h,'Rotation',90);
% if strcmp (fish_name, 'PTZ')
% else
% set(gca,'Ycolor','none');
% end


% save 
formats = {'.fig', '.jpg', '.svg'};
for f=1:length(formats)
    if strcmp (fish_name, 'PTZ')
saveas(f17,['\\forskning.it.ntnu.no\ntnu\mh-kin\yaksi\Ahmed\Behaviour',...
    '\Larvae\figures\PTZ\for_Fig1\' 'for_Fig1_sponBehaviour_meanVel_test' formats{1,f}])
    elseif strcmp (fish_name, 'PTZ_short')
    saveas(f17,['\\forskning.it.ntnu.no\ntnu\mh-kin\yaksi\Ahmed\Behaviour',...
    '\Larvae\figures\PTZ_s\for_Fig1\' 'for_Fig1_sponBehaviour_meanVel_test' formats{1,f}])
    elseif strcmp (fish_name, 'eaat2a')
    saveas(f17,['\\forskning.it.ntnu.no\ntnu\mh-kin\yaksi\Ahmed\Behaviour',...
    '\Larvae\figures\Eaat2a\for_Fig1\' 'for_Fig1_sponBehaviour_meanVel_test' formats{1,f}])    
    elseif strcmp (fish_name, 'gabra1')
    saveas(f17,['\\forskning.it.ntnu.no\ntnu\mh-kin\yaksi\Ahmed\Behaviour',...
    '\Larvae\figures\gabra1\for_Fig1\' 'for_Fig1_sponBehaviour_meanVel_test' formats{1,f}])
    elseif strcmp (fish_name, 'scn1lab')
    saveas(f17,['\\forskning.it.ntnu.no\ntnu\mh-kin\yaksi\Ahmed\Behaviour',...
    '\Larvae\figures\Scn1lab\for_Fig1\' 'for_Fig1_sponBehaviour_meanVel_test' formats{1,f}])
    elseif strcmp (fish_name, 's280f') 
    saveas(f17,['\\forskning.it.ntnu.no\ntnu\mh-kin\yaksi\Ahmed\Behaviour',...
    '\Larvae\figures\s280f\for_Fig1\' 'for_Fig1_sponBehaviour_meanVel_test' formats{1,f}])
    end       
end 

%% for figure 2

% load temporary matrices 
% load(['\\forskning.it.ntnu.no\ntnu\mh-kin\yaksi\Ahmed\',...
%     'Behaviour\Larvae\tempMats.mat']);
% load('\\forskning.it.ntnu.no\ntnu\mh-kin\yaksi\Ahmed\Behaviour\Larvae\tempMat_eaat2a.mat')

% color matrix
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
    C2 = [[0 0 0];[[158,202,225]/255];[[49,130,189]/255]];
    tempMat = results.tempMat.eaat2a;
elseif strcmp (fish_name, 'scn1lab')
    C2 = [[0 0 0]; [[188,189,220]/255];[[117,107,177]/255]; [1 1 1]];
    tempMat = results.tempMat.scn1lab;
    elseif strcmp (fish_name, 's280f')
        C2 = [[0 0 0];[[197,27,138]/255]];
        tempMat = results.tempMat.s280f ;
        load('\\forskning.it.ntnu.no\ntnu\mh-kin\yaksi\Ahmed\Behaviour\Larvae\tempMat6_s280f.mat')
        tempMat6 = tempMat6_s280f;
end 

if strcmp (fish_name, 'PTZ_short')
    idxLightsOn =  idxLightsOn2;
    idxLightsOff = idxLightsOff2;
forFigure2_heatmapEvoked_PTZshort_customized 
    findMaxForFiguresG4L20_PTZshort_customized_v2 
%     plotAngles_PTZ
%     respondersForFigures_PTZshort_customized   
%     forFig2_angles_PTZshort_customized   
elseif strcmp (fish_name, 'scn1lab')
    idxLightsOn =  idxLightsOn1;
    idxLightsOff = idxLightsOff1;
% forFigure2_heatmapEvoked_scn1lab_customized
    findMaxForFiguresG4L20_scn1lab_customized_v2 
%     respondersForFigures_othermodels_customized
%     forFig2_angles_othermodels_customized      
elseif strcmp (fish_name, 's280f')
    idxLightsOn =  idxLightsOn1;
    idxLightsOff = idxLightsOff1;
% forFigure2_heatmapEvoked_chrna4_customized
%     findMaxForFiguresG4L20_chrna4_customized
%     respondersForFigures_othermodels_customized
    forFig2_angles_chrna4_customized      
else 
    idxLightsOn =  idxLightsOn1;
    idxLightsOff = idxLightsOff1;
forFigure2_heatmapEvoked_othermodels_customized
%     findMaxForFiguresG4L20_othermodels_customized_v2 
%     respondersForFigures_othermodels_customized
%     forFig2_angles_othermodels_customized      
end 

end


%%
% plot 
for i=1
if strcmp (fish_name, 'PTZ_short') || strcmp (fish_name, 'gabra1') ||...
        strcmp (fish_name, 'eaat2a') || strcmp (fish_name, 'scn1lab') ||...
            strcmp (fish_name, 's280f')
    
    
    % find max
    
    findMaxForFiguresG4L20_customized                                               % Change group number for plots etc 
    
    % responders 
    
    respondersForFigures_customized
    
    % swim angle
    
    forFig2_angles_customized
    
    
%     
% elseif strcmp(fish_name, 'PTZ_short')
%     
%     % find max
%     
%     findMaxForFiguresG4L20                                                      % Change group number for plots etc
%     
%     % responders 
%     
%     respondersForFigures
%     
%     % swim angle
%     
%     forFig2_angles
    
elseif strcmp (fish_name, 's280F')
    
end
end 

%%

%%

%%
