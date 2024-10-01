function [groups, name_CPA_groups,group_category] = CPA_groups(name_CPA)
if strcmp(name_CPA,'CPA1')
%% CPA1 groupings
group1 = [[1 7 13 19] 24*1+ [1 7 13 19]...
    24*2+[1 7 13 19] 24*3+[1 7 13 19]];
group2 = [[2 8 14 20] 24+[2 8 14 20]...
    24*2+[2 8 14 20] 24*3+[2 8 14 20]];
group3= [[3 9 15 21] 24*1+[3 9 15 21]...
    24*2+[3 9 15 21] 24*3+[3 9 15 21]];
group4 = [[4 10 16 22] 24*1+[4 10 16 22]...
    24*2+[4 10 16 22] 24*3+[4 10 16 22]];
group5 = [[5 11 17 23] 24 + [5 11 17 23]...
    24*2+[5 11 17 23] 24*3+[5 11 17 23]];
group6 = [[6 12 18 24] 24+ [6 12 18 24]...
    24*2+[6 12 18 24] 24*3 + [6 12 18 24]];
group7 = [];

name_CPA_group1 = 'DMSO';
name_CPA_group2 = 'D-PTZ';
name_CPA_group3 = 'D-P-CPA_0.1';
name_CPA_group4 = 'D-P-CPA_1.0';
name_CPA_group5 = 'D-P-CPA_10';
name_CPA_group6 = 'D-P-CPA_100';
name_CPA_group7 = 'Excluded';

allgroups = sort([group1, group2, group3, group4, group5, group6, group7]);

% categorical grouping varibles
group_category         = categorical(1:size(96,1)).';
group_category(group1) = name_CPA_group1;
group_category(group2) = name_CPA_group2;
group_category(group3) = name_CPA_group3;
group_category(group4) = name_CPA_group4;
group_category(group5) = name_CPA_group5;
group_category(group6) = name_CPA_group6;
group_category(group7) = name_CPA_group7;

groups = {group1 group2 group3 group4 group5, group6, group7};
name_CPA_groups = {name_CPA_group1 name_CPA_group2 name_CPA_group3 name_CPA_group4 name_CPA_group5 name_CPA_group6 name_CPA_group7};
elseif strcmp(name_CPA,'CPA2')
% CPA2 groupings

group1 = [[1 7 13 19 4 10 16 22] 24+[6 12 18 24] 24*2+[1 7 13 19] 24*3+[1 7 13 19] 24*4+[1 7 13 19]];           % DMSO
group2 = [[2 8 14 20 5 11 17 23] 24+[5 11 17 23] 24*2+[2 8 14 20] 24*3+[2 8 14 20] 24*4+[2 8 14 20]];          % CPA alone
group3 = [[3 9 15 21 6 12 18 24] 24+[4 10 16 22] 24*2+[3 9 15 21] 24*3+[3 9 15 21] 24*4+[3 9 15 21]];          % DPCPX alone
group4 = [24+[3 9 15 21] 24*2+[4 10 16 22] 24*3+[4 10 16 22] 24*4+[4 10 16 22]];       % PTZ
group5 = [24+[2 8 14 20] 24*2+[5 11 17 23] 24*3+[5 11 17 23] 24*4+[5 11 17 23]];     % PTZ + CPA
group6 = [24+[1 7 13 19] 24*2+[6 12 18 24] 24*3+[6 12 18 24] 24*4+[6 12 18 24]];     % PTZ +DPCPX
group7 = [25 37 69];

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


name_CPA_group1 = 'DMSO';
name_CPA_group2 = 'CPA';
name_CPA_group3 = 'DPCPX';
name_CPA_group4 = 'PTZ75';
name_CPA_group5 = 'PTZ75_CPA10';
name_CPA_group6 = 'PTZ75_DPCPX20';
name_CPA_group7 = 'Excluded';

allgroups = sort([group1, group2, group3, group4, group5, group6, group7]);
% categorical grouping varibles
group_category         = categorical(1:size(161,1)).';
group_category(group1) = name_CPA_group1;
group_category(group2) = name_CPA_group2;
group_category(group3) = name_CPA_group3;
group_category(group4) = name_CPA_group4;
group_category(group5) = name_CPA_group5;
group_category(group6) = name_CPA_group6;
group_category(group7) = name_CPA_group7;

groups = {group1 group2 group3 group4 group5, group6};
name_CPA_groups = {name_CPA_group1 name_CPA_group2 name_CPA_group3 name_CPA_group4 name_CPA_group5 name_CPA_group6};

% nROIs = length (all_fish);

%%
elseif strcmp(name_CPA,'CPA4')
% CPA4 groupings
group1 = [1 7 13 19 24*1+[1 7 13 19] 24*2+[1 7 13 19] 24*3+[1 7 13 19]...
    24*4+[1 7 13 19] 24*5+[1 7 13 19] 24*6+[1 7 13 19] 24*7+[1 7 13 19]];
group2 = group1+ones(1,length(group1));
group3 = group2+ones(1,length(group2));
group4 = group3+ones(1,length(group3));
group5 = group4+ones(1,length(group4));
group6 = group5+ones(1,length(group5));
group7 = [14,20,29,62,73,79,85,133,134,140,146,187,158];


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


name_CPA_group1 ='DMSO';
name_CPA_group2 ='CHA-100uM';
name_CPA_group3 ='DPCPX-20uM';
name_CPA_group4 ='PTZ-5mM';
name_CPA_group5 ='PTZ-CHA';
name_CPA_group6 ='PTZ-DPCPX';
name_CPA_group7 ='Excluded';

allgroups = sort([group1, group2, group3, group4, group5, group6, group7]);
% categorical grouping varibles
group_category         = categorical(1:size(161,1)).';
group_category(group1) = name_CPA_group1;
group_category(group2) = name_CPA_group2;
group_category(group3) = name_CPA_group3;
group_category(group4) = name_CPA_group4;
group_category(group5) = name_CPA_group5;
group_category(group6) = name_CPA_group6;
group_category(group7) = name_CPA_group7;

groups = {group1 group2 group3 group4 group5, group6, group7};
name_CPA_groups = {name_CPA_group1 name_CPA_group2 name_CPA_group3 name_CPA_group4 name_CPA_group5 name_CPA_group6, name_CPA_group7};

% nROIs = length (all_fish);

elseif strcmp(name_CPA,'CPA5')

% CPA5 groupings
group1 = [1 7 13 19 24*1+[1 7 13 19] 24*2+[1 7 13] 24*3+[1 7 13 19]...
    24*4+[1 7 13 19]];
group2 = group1+ones(1,length(group1));
group3 = group2+ones(1,length(group2));
group4 = group3+ones(1,length(group3));
group5 = group4+ones(1,length(group4));
group6 = group5+ones(1,length(group5));

group7 = [24*2+[19 20 21 22 23 24] 65 111];

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

name_CPA_group1 ='DMSO';
name_CPA_group2 ='CPA-100uM';
name_CPA_group3 ='VA-1mM';
name_CPA_group4 ='PTZ-5mM';
name_CPA_group5 ='PTZ-CPA';
name_CPA_group6 ='PTZ-VA';
name_CPA_group7 ='Excluded';

allgroups = sort([group1, group2, group3, group4, group5, group6, group7]);
% categorical grouping varibles
group_category         = categorical(1:size(161,1)).';
group_category(group1) = name_CPA_group1;
group_category(group2) = name_CPA_group2;
group_category(group3) = name_CPA_group3;
group_category(group4) = name_CPA_group4;
group_category(group5) = name_CPA_group5;
group_category(group6) = name_CPA_group6;
group_category(group7) = name_CPA_group7;

groups = {group1 group2 group3 group4 group5, group6, group7};
name_CPA_groups = {name_CPA_group1 name_CPA_group2 name_CPA_group3 name_CPA_group4 name_CPA_group5 name_CPA_group6, name_CPA_group7};

% nROIs = length (all_fish);

% [~,pos]=intersect(group6,group7);
%         group5(pos)=[];

end 