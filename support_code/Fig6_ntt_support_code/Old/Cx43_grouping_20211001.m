Cx43behaviourgenotype.Genotype = cellstr(Cx43behaviourgenotype.Genotype);
Cx43behaviourgenotype.BathApplication = cellstr(Cx43behaviourgenotype.BathApplication);


group1 =  table2array(Cx43behaviourgenotype(strcmp(Cx43behaviourgenotype.Genotype, 'wt')....
    & strcmp(Cx43behaviourgenotype.BathApplication, 'Ctrl'), 1))';
group2 =  table2array(Cx43behaviourgenotype(strcmp(Cx43behaviourgenotype.Genotype, 'wt')....
    & strcmp(Cx43behaviourgenotype.BathApplication, '1 mM PTZ'), 1))';
group3 =  table2array(Cx43behaviourgenotype(strcmp(Cx43behaviourgenotype.Genotype, 'wt')....
    & strcmp(Cx43behaviourgenotype.BathApplication, '15 mM PTZ'), 1))';

group4 =  table2array(Cx43behaviourgenotype(strcmp(Cx43behaviourgenotype.Genotype, 'het')....
    & strcmp(Cx43behaviourgenotype.BathApplication, 'Ctrl'), 1))';
group5 =  table2array(Cx43behaviourgenotype(strcmp(Cx43behaviourgenotype.Genotype, 'het')....
    & strcmp(Cx43behaviourgenotype.BathApplication, '1 mM PTZ'), 1))';
group6 =  table2array(Cx43behaviourgenotype(strcmp(Cx43behaviourgenotype.Genotype, 'het')....
    & strcmp(Cx43behaviourgenotype.BathApplication, '15 mM PTZ'), 1))';

group7 =  table2array(Cx43behaviourgenotype(strcmp(Cx43behaviourgenotype.Genotype, 'homo')....
    & strcmp(Cx43behaviourgenotype.BathApplication, 'Ctrl'), 1))';
group8 =  table2array(Cx43behaviourgenotype(strcmp(Cx43behaviourgenotype.Genotype, 'homo')....
    & strcmp(Cx43behaviourgenotype.BathApplication, '1 mM PTZ'), 1))';
group9 =  table2array(Cx43behaviourgenotype(strcmp(Cx43behaviourgenotype.Genotype,'homo')....
    & strcmp(Cx43behaviourgenotype.BathApplication, '15 mM PTZ'), 1))';

group10 = sort([71,169,176,39,54,40,63,36]); 

[~,pos1]=intersect(group1,group10);
group1(pos1)=[];
[~,pos2]=intersect(group2,group10);
group2(pos2)=[];
[~,pos3]=intersect(group3,group10);
group3(pos3)=[];
[~,pos4]=intersect(group4,group10);
group4(pos4)=[];
[~,pos5]=intersect(group5,group10);
group5(pos5)=[];
[~,pos6]=intersect(group6,group10);
group6(pos6)=[];
[~,pos6]=intersect(group6,group10);
group7(pos6)=[];
[~,pos6]=intersect(group6,group10);
group8(pos6)=[];
[~,pos6]=intersect(group6,group10);
group9(pos6)=[];




%% name of groups

name_group1 = 'wt_ctrl';
name_group2 = 'wt_1mM';
name_group3 = 'wt_15mM';
name_group4 = 'het_ctrl';
name_group5 = 'het_1mM';
name_group6 = 'het_15mM';
name_group7 = 'hom_ctrl';
name_group8 = 'hom_1mM';
name_group9 = 'hom_15mM';

name_group10 = 'Excluded';

%% all variables


allgroups = sort([group1, group2, group3, group4, group5, group6, group7,...
    group8, group9, group10]);
% categorical grouping varibles
group_category         = categorical(1:size(161,1)).';
group_category(group1) = name_group1;
group_category(group2) = name_group2;
group_category(group3) = name_group3;
group_category(group4) = name_group4;
group_category(group5) = name_group5;
group_category(group6) = name_group6;
group_category(group7) = name_group7;
group_category(group8) = name_group8;
group_category(group9) = name_group9;
group_category(group10) = name_group10;

groups = {group1 group2 group3 group4 group5, group6, group7,...
    group8, group9, group10};
name_groups = {name_group1 name_group2 name_group3 name_group4 name_group5,...
    name_group6 name_group7 name_group8 name_group9 name_group10};

nROIs = length(all_fish);