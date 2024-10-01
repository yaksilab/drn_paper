% CPA_5 Grouping

group1 = [1 7 13 19 24*1+[1 7 13 19] 24*2+[1 7 13] 24*3+[1 7 13 19]...
    24*4+[1 7 13 19]];
group2 = group1+ones(1,length(group1));
group3 = group2+ones(1,length(group2));
group4 = group3+ones(1,length(group3));
group5 = group4+ones(1,length(group4));
group6 = group5+ones(1,length(group5));

group7 = [24*2+[19 20 21 22 23 24] 65 111];

name_group1 ='DMSO';
name_group2 ='CPA-100uM';
name_group3 ='VA-1mM';
name_group4 ='PTZ-5mM';
name_group5 ='PTZ-CPA';
name_group6 ='PTZ-VA';
name_group7 ='Excluded';

allgroups = sort([group1, group2, group3, group4, group5, group6, group7]);
% categorical grouping varibles
group_category         = categorical(1:size(161,1)).';
group_category(group1) = name_group1;
group_category(group2) = name_group2;
group_category(group3) = name_group3;
group_category(group4) = name_group4;
group_category(group5) = name_group5;
group_category(group6) = name_group6;
group_category(group7) = name_group7;

groups = {group1 group2 group3 group4 group5, group6, group7};
name_groups = {name_group1 name_group2 name_group3 name_group4 name_group5 name_group6, name_group7};

nROIs = length (all_fish);

% [~,pos]=intersect(group6,group7);
%         group5(pos)=[];