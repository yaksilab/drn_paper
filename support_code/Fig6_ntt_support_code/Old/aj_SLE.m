%% Plot seizurebarcode


% Load variables
fish_names = {'PTZ_short', 'PTZ', 'gabra1', 'eaat2a',...
    'scn1lab', 's280f'};

load(['\\forskning.it.ntnu.no\ntnu\mh-kin\yaksi\Ahmed\',...
    'Behaviour\Larvae\results.mat'])

timebin =1/2.433846153846;

% Get fields

flds= fields(results);

%% calculate anlges

% [results]= aj_angles(results,flds);

% [results]= aj_binnedAngles(results,flds);
[results]= aj_binnedAngles_1Hz(results,flds);
%% detect seizure like events
[results] = EventDetectionScript(results,flds,fish_names);                  % takes the mean of angular change
[results] = EventDetectionScript_dvv(results,flds,fish_names);

%% plot seizure-barcode based on velocity 
flds2 = fields(results.SL_Events);

    f1=figure;
    f1=tiledlayout(3,6,'TileSpacing','tight','Padding','none');
    title (f1,['numSeizure - all fish - whole recording'])
    
for j=1:length(flds2)  
    if strcmp (fish_names{1,j}, 'PTZ') || strcmp(fish_names{1,j}, 'PTZ_short')
    C1 = {[0 0 0];[[253,190,133]/255]; [[253,141,60]/255]; [[217,71,1]/255]};
    elseif strcmp (fish_names{1,j}, 'gabra1')
    C1 = {[0 0 0];[[161,217,155]/255];[[49,163,84]/255]};
    elseif strcmp (fish_names{1,j}, 'eaat2a')
    C1 = {[0 0 0];[[158,202,225]/255];[[49,130,189]/255]};
    elseif strcmp (fish_names{1,j}, 'scn1lab')
    C1 = {[0 0 0]; [[188,189,220]/255];[[117,107,177]/255]};
    elseif strcmp (fish_names{1,j}, 's280f')
    C1 = {[0 0 0];[[197,27,138]/255]};
    end
    
    [group1,group2,group3,group4,group5,allgroups,...
        name_group1,name_group2,name_group3,name_group4,name_group5,...
        group_category, groups, name_groups, nROIs]...
        = AJ_getGroups (fish_names{1,j});
    
    
    for i=1:3
    nexttile
    if j==1
    b= boxchart(cell2mat(results.SL_Events.(flds2{j,1}){i}([groups{1,1:4}],2)),...
    'GroupByColor',group_category([groups{1,1:4}],:));

    legend
    set(b,{'BoxFaceColor'},C1)
    
    rankP = cell(3,1);
    for m=2:4
        rankP{m-1}=ranksum(cell2mat(results.SL_Events.(flds2{j,1}){i,1}([groups{1,1}],2)),....
            cell2mat(results.SL_Events.(flds2{j,1}){i,1}([groups{1,m}],2)));
    end
    
    text(1,15,num2str(vertcat(rankP{:,1})))
        
    elseif j==2
    b= boxchart(cell2mat(results.SL_Events.(flds2{j,1}){i}([groups{1,1:4}],2))/3,...
        'GroupByColor',group_category([groups{1,1:4}],:));

    legend
    set(b,{'BoxFaceColor'},C1)
    
    rankP = cell(3,1);
    for m=2:4
        rankP{m-1}=ranksum(cell2mat(results.SL_Events.(flds2{j,1}){i,1}([groups{1,1}],2)),....
            cell2mat(results.SL_Events.(flds2{j,1}){i,1}([groups{1,m}],2)));
    end
    
    text(1,15,num2str(vertcat(rankP{:,1})))
    
    elseif j>=3 && j<=5 
    b= boxchart(cell2mat(results.SL_Events.(flds2{j,1}){i}([groups{1,1:3}],2))/3,...
        'GroupByColor',group_category([groups{1,1:3}],:));    
    legend
    set(b,{'BoxFaceColor'},C1) 
    
    rankP = cell(3,1);
    for m=2:3
        rankP{m-1}=ranksum(cell2mat(results.SL_Events.(flds2{j,1}){i,1}([groups{1,1}],2)),....
            cell2mat(results.SL_Events.(flds2{j,1}){i,1}([groups{1,m}],2)));
    end
    
    text(1,15,num2str(vertcat(rankP{:,1})))
    
    else 
    b= boxchart(cell2mat(results.SL_Events.(flds2{j,1}){i}([groups{1,1:2}],2))/3,...
        'GroupByColor',group_category([groups{1,1:2}],:));
    legend
    set(b,{'BoxFaceColor'},C1) 
    
    rankP = cell(3,1);
    for m=2
        rankP{m-1}=ranksum(cell2mat(results.SL_Events.(flds2{j,1}){i,1}([groups{1,1}],2)),....
            cell2mat(results.SL_Events.(flds2{j,1}){i,1}([groups{1,m}],2)));
    end
    
    text(1,15,num2str(vertcat(rankP{:,1})))
    
    end
    ylim([-1 80])
    end
    
end



%% plot seizure barcode based on DVV

flds2 = fields(results.SL_Events_DVV  );

    f2=figure;
    f2=tiledlayout(3,6,'TileSpacing','tight','Padding','none');
    title (f2,['numSeizure - all fish - whole recording - DVV-based'])
    
for j=1:length(flds2)  
    if strcmp (fish_names{1,j}, 'PTZ') || strcmp(fish_names{1,j}, 'PTZ_short')
    C1 = {[0 0 0];[[253,190,133]/255]; [[253,141,60]/255]; [[217,71,1]/255]};
    elseif strcmp (fish_names{1,j}, 'gabra1')
    C1 = {[0 0 0];[[161,217,155]/255];[[49,163,84]/255]};
    elseif strcmp (fish_names{1,j}, 'eaat2a')
    C1 = {[0 0 0];[[158,202,225]/255];[[49,130,189]/255]};
    elseif strcmp (fish_names{1,j}, 'scn1lab')
    C1 = {[0 0 0]; [[188,189,220]/255];[[117,107,177]/255]};
    elseif strcmp (fish_names{1,j}, 's280f')
    C1 = {[0 0 0];[[197,27,138]/255]};
    end
    
    [group1,group2,group3,group4,group5,allgroups,...
        name_group1,name_group2,name_group3,name_group4,name_group5,...
        group_category, groups, name_groups, nROIs]...
        = AJ_getGroups (fish_names{1,j});
    
    
    for i=1:3
    nexttile
    if j==1
    b= boxchart(cell2mat(results.SL_Events_DVV.(flds2{j,1}){i,1}([groups{1,1:4}],2)),...
    'GroupByColor',group_category([groups{1,1:4}],:));

    legend
    set(b,{'BoxFaceColor'},C1)
    
    rankP = cell(3,1);
    for m=2:4
        rankP{m-1}=ranksum(cell2mat(results.SL_Events_DVV.(flds2{j,1}){i,1}([groups{1,1}],2)),....
            cell2mat(results.SL_Events_DVV.(flds2{j,1}){i,1}([groups{1,m}],2)));
    end
    
    text(1,15,num2str(vertcat(rankP{:,1})))
    
    elseif j==2
    b= boxchart(cell2mat(results.SL_Events_DVV.(flds2{j,1}){i,1}([groups{1,1:4}],2))/3,...
        'GroupByColor',group_category([groups{1,1:4}],:));

    legend
    set(b,{'BoxFaceColor'},C1)
    
    rankP = cell(3,1);
    for m=2:4
        rankP{m-1}=ranksum(cell2mat(results.SL_Events_DVV.(flds2{j,1}){i,1}([groups{1,1}],2))/3,....
            cell2mat(results.SL_Events_DVV.(flds2{j,1}){i,1}([groups{1,m}],2)));
    end
    
    text(1,15,num2str(vertcat(rankP{:,1})))
    
    elseif j>=3 && j<=5 
    b= boxchart(cell2mat(results.SL_Events_DVV.(flds2{j,1}){i,1}([groups{1,1:3}],2))/3,...
        'GroupByColor',group_category([groups{1,1:3}],:));    
    legend
    set(b,{'BoxFaceColor'},C1) 
    
    rankP = cell(2,1);
    for m=2:3
        rankP{m-1}=ranksum(cell2mat(results.SL_Events_DVV.(flds2{j,1}){i,1}([groups{1,1}],2))/3,....
            cell2mat(results.SL_Events_DVV.(flds2{j,1}){i,1}([groups{1,m}],2)));
    end
    
    text(1,15,num2str(vertcat(rankP{:,1})))
    
    else 
    b= boxchart(cell2mat(results.SL_Events_DVV.(flds2{j,1}){i,1}([groups{1,1:2}],2))/3,...
        'GroupByColor',group_category([groups{1,1:2}],:));
    legend
    set(b,{'BoxFaceColor'},C1) 
    
    rankP = cell(3,1);
    for m=2
        rankP{m-1}=ranksum(cell2mat(results.SL_Events_DVV.(flds2{j,1}){i,1}([groups{1,1}],2))/3,....
            cell2mat(results.SL_Events_DVV.(flds2{j,1}){i,1}([groups{1,m}],2)));
    end
    
    text(1,15,num2str(vertcat(rankP{:,1})))
    
    end
    ylim([-1 25])
    end
    
end