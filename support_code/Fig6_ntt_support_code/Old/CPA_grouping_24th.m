
    %% >3rd experiments
    group1 = [[1 7 13 19 4 10 16 22] 24+[6 12 18 24] 24*2+[1 7 13 19] 24*3+[1 7 13 19] 24*4+[1 7 13 19]];           % DMSO
    group2 = [[2 8 14 20 5 11 17 23] 24+[5 11 17 23] 24*2+[2 8 14 20] 24*3+[2 8 14 20] 24*4+[2 8 14 20]];          % CPA alone
    group3 = [[3 9 15 21 6 12 18 24] 24+[4 10 16 22] 24*2+[3 9 15 21] 24*3+[3 9 15 21] 24*4+[3 9 15 21]];          % DPCPX alone
    group4 = [24+[3 9 15 21] 24*2+[4 10 16 22] 24*3+[4 10 16 22] 24*4+[4 10 16 22]];       % PTZ
    group5 = [24+[2 8 14 20] 24*2+[5 11 17 23] 24*3+[5 11 17 23] 24*4+[5 11 17 23]];     % PTZ + CPA
    group6 = [24+[1 7 13 19] 24*2+[6 12 18 24] 24*3+[6 12 18 24] 24*4+[6 12 18 24]];     % PTZ +DPCPX
    
    name_group1 = 'DMSO';
    name_group2 = 'CPA';
    name_group3 = 'DPCPX';
    name_group4 = 'PTZ75';
    name_group5 = 'PTZ75_CPA10';
    name_group6 = 'PTZ75_DPCPX20';
    
    allgroups = sort([group1, group2, group3, group4, group5, group6]);
    % categorical grouping varibles
    group_category         = categorical(1:size(161,1)).';
    group_category(group1) = name_group1;
    group_category(group2) = name_group2;
    group_category(group3) = name_group3;
    group_category(group4) = name_group4;
    group_category(group5) = name_group5;
    group_category(group6) = name_group6;
    
    groups = {group1 group2 group3 group4 group5, group6};
    name_groups = {name_group1 name_group2 name_group3 name_group4 name_group5 name_group6};

    nROIs = length (all_fish);

    
    