group1 = [1:6 24+(1:6) 24*2+(1:6) 24*3+(1:6)];
group2 = group1+6*ones(1,length(group1));
group3 = group2+6*ones(1,length(group2));
group4 = group3+6*ones(1,length(group3));


group5 = [];

name_group1 ='DMSO';
name_group2 ='DMSO_PTZ';
name_group3 ='DMSO_PTZ_ucVPA';
name_group4 ='DMSO_PTZ_cVPA';
name_group5 ='Excluded';


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

nROIs = length (all_fish);

% [~,pos]=intersect(group6,group7);
%         group5(pos)=[];