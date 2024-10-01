%% for group1 --> mat 21, for group2 --> mat22

mat21 = nan(20,4);
for i=1:20
    mat21 (i,:) = nanmean(velBinnedFive_temp{i,1}(group1,2:5),1);
end

mat22 = nan(20,4);
for i=1:20
    mat22 (i,:) = nanmean(velBinnedFive_temp{i,1}(group2,2:5),1);
end

%% plot of figure with test: row 1-figures are for G1 and row 2- figures are for G2
f40=figure();
f40.WindowState='maximized';
for i=1:8
    subplot (2,4,i)
    rectangle ('Position', [2 0 1 3], 'FaceColor', [1 1 0 .3], 'EdgeColor', 'none'), hold on
    
    if i<=4
        beeswarm (vertcat(ones(5,1), ones(5,1)*2, ones(5,1)*3, ones(5,1)*4), vertcat(mat21((i-1)*5+1:i*5,1), ...
            (mat21((i-1)*5+1:i*5,2)), (mat21((i-1)*5+1:i*5,3)), ...
            (mat21((i-1)*5+1:i*5,4))),'sort_style', 'nosort', 'overlay_style', 'sd', 'dot_size', 1), hold off
    else
        beeswarm (vertcat(ones(5,1), ones(5,1)*2, ones(5,1)*3, ones(5,1)*4), vertcat(mat22((i-1)*5-19:i*5-20,1), ...
            (mat22((i-1)*5-19:i*5-20,2)), (mat22((i-1)*5-19:i*5-20,3)), ...
            (mat22((i-1)*5-19:i*5-20,4))), 'sort_style', 'nosort', 'overlay_style', 'sd','dot_size',1), hold off
    end
    
    
    if i==1 || i==5
        title ('10 min inter Stim interval')
        ylabel ('Velocity (mm/s), G1')
    else
        if i==2
            title ('5 min inter Stim interval')
        elseif i==3
            title ('2 min inter Stim interval')
        else
            title ('1 min inter Stim interval')
        end
    end
    
    if i>4
        xticks (1:4)
        xticklabels ({'Before', 'First', 'Second', 'After'})
    else
        xticks([])
    end
    
    xlim ([0 5])
    ylim ([.5 3])
    box off
    
end

%% this one test whether the binned velocity data I do statistics on are normally distributed
for i=1:8
    for j=1:4
        if i<=4
            a(i,j) = (jbtest (mat21((i-1)*5+1:i*5,j)));
        else
            a(i,j) = (jbtest (mat22((i-1)*5-19:i*5-20,j)));
        end
    end
end 
%% tests row 1:4 are for G1 and 5:8 are for G2
p = nan (8,3);
for i=1:8
    for j=1:3
        if i<=4
            [~,p(i,j)] = (ttest (mat21((i-1)*5+1:i*5,j),mat21((i-1)*5+1:i*5,j+1)));
        else
            [~,p(i,j)] = (ttest (mat22((i-1)*5-19:i*5-20,j),(mat22((i-1)*5-19:i*5-20,j+1))));
        end
    end
end
%% alpha corrected for multiple testing
P = nan (1,(size(p,1)*size(p,2)));
for k=1:(size(p,1)*size(p,2))
P(k) = .05/(24+1-k);
end 

Q = reshape (P,3,8);
Q = transpose (Q);


%% between group comparison

beta = nan (4,4);
for i=1:4
    for j=1:4
        [~,beta(i,j)] = ttest2(mat21((i-1)*5+1:i*5,j), mat22((i-1)*5+1:i*5,j));
    end 
end 

%% correct for multiple testing

P2 = nan (1,(size(beta,1)*size(beta,2)));
for k=1:(size(beta,1)*size(beta,2))
P2(k) = .05/(24+1-k);
end 

Q1 = reshape (P2,4,4);
Q1 = transpose (Q1);


%% check if mean velocity data is normal distributed
% 
% a=jbtest (velBinnedFive_temp{1, 1}(group1,1));
% 
% %% do signrank test for the 5 sconds binned velocity data according to light stimulation
% 
% pG1 = nan(20,3);
% pG2 = nan(20,3);
% 
% for i= 1:20
%     for j= 1:3
%         pG1(i,j) = signrank (velBinnedFive_temp {i,1} (group1,j+1), velBinnedFive_temp {i,1} (group1,j+2));
%         pG2(i,j) = signrank (velBinnedFive_temp {i,1} (group2,j+1), velBinnedFive_temp {i,1} (group2,j+2));
%     end
% end
% 
% 
% %% Holm's step-down procedure (1979)- to find the appropriate significans level for multiple testing 
% 
% pG1_transformed = reshape (pG1,60,1);
% pG1_transformed = sort (pG1_transformed,1);
% pG2_transformed = reshape (pG2,60,1);
% pG2_transformed = sort (pG2_transformed,1);
% 
% for k=1:size(pG1_transformed,1)
%     alfa(k,:)=(0.05/(size(pG1_transformed,1)+1-k));    
% end
% 
% a=find (pG1_transformed>alfa)
% 
