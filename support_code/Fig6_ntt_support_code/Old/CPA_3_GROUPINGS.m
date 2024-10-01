% CPA 3 GROUPINGS
group1 = [1 7 13 19 24*1+[1 7 13 19] 24*2+[1 7]];
group2 = group1+ones(1,length(group1));
group3 = group2+ones(1,length(group2));
group4 = group3+ones(1,length(group3));
group5 = group4+ones(1,length(group4));
group6 = group5+ones(1,length(group5));

group7 = [24*2+[13:1:24] 23 12 18 24 30 ];

[~,pos1]=intersect(group1,group7);
group1(pos1)=[];
[~,pos2]=intersect(group2,group7);
group2(pos2)=[];
[~,pos3]=intersect(group3,group7);
group3(pos3)=[];
[~,pos4]=intersect(group4,group7);
group4(pos4)=[];
[~,pos5]=intersect(group5,group7);
group5(pos5)=[];
[~,pos6]=intersect(group6,group7);
group6(pos6)=[];

name_group1 ='DMSO';
name_group2 ='CPA-100uM';
name_group3 ='VA-1mM';
name_group4 ='PTZ-15mM';
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