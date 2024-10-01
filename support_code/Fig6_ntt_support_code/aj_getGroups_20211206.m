function [group1,group2,group3,group4,group5,allgroups,...
 name_group1,name_group2,name_group3,name_group4,name_group5,...
 group_category, groups, name_groups, nROIs] = aj_getGroups_20211206 (fish_name,all_fish, ~)

% Here change the group names etc 
%This function just basically checks which fish belongs to which but it is
%also hard coded so maybe it can be changed if bram always uses the same
%way of naming things
if strcmp(fish_name, 'TrialDetection')
    A = 6;
    %% eaat2a line
    group3  =   [1 3 5 8 10 12 13 15 17 26 28 33 35 38 40 42 43 45 47 50 52 54]; % [1:size(all_fish,1)]; % mutant
    
    group2  =   [2 4 6 7 9 11 14 16 18 25 27 29 32 34 36 37 39 41 44 46 48 49 53];%[4 6 8 10 18]; % control
    
    group1  =   [19 21 23 20 22 24 30 31 51]; %excluded
    
    group4  =   []; % 1-24 excluded because of unknown genotype
    group5  =   [];
    
    
else
    error ('fish_name mismatch, make sure you have written this right')
end



%%


% names of the groups

if strcmp (fish_name,'TrialDetection')
    A = 6;
    name_group1 = 'Het';
    name_group2 = 'ctrl';
    name_group3 = 'Mut';
    name_group4 = 'Excluded';
    name_group5 = 'trackingError';
end

if strcmp (fish_name,'TrialDetection')
    allgroups = sort([group1, group2, group3, group4, group5]);
    % categorical grouping varibles
    group_category         = categorical(1:size(161,1)).';
    group_category(group1) = name_group1;
    group_category(group2) = name_group2;
    group_category(group3) = name_group3;
    group_category(group4) = name_group4;
    group_category(group5) = name_group5;
    
    
    groups = {group1 group2 group3 group4 group5};
    name_groups = {name_group1 name_group2 name_group3 name_group4 name_group5};
end
% number of fish in total
nROIs = length(allgroups);




