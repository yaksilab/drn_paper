%% quantify erratic behaviour as the sum of angles for the 5 min ISIs

% need to change the codes here, not finished, saved as angles_tryout_light

ang = cell (5,1);
% ang2 = ang;

for i=1:5
    for ROI =1:nROIs
    A =[tempMat6{i, 2}(ROI,1:600)',...
        tempMat6{i, 3}(ROI,1:600)'];
    B = [tempMat6{i, 2}(ROI,1:601)',...
        tempMat6{i, 3}(ROI,1:601)'];
    C = [tempMat6{i, 2}(ROI,1:602)',...
        tempMat6{i, 3}(ROI,1:602)'];
    
% If A, B, and C are three points in two-dimensional space defined by
% 1 x 2 coordinate row vectors, the angle
% ABC - that is, the angle between line segments AB and CB:

% Do not change 
    
    
    for j=1:length(A)
    AB = A(j,:)-B(j+1,:);
    CB = C(j+2,:)-B(j+1,:);
    if atan2((det([AB;CB])),dot(AB,CB))<0 % Angle in radians
    ang{i,1}(ROI,j) = pi+ atan2((det([AB;CB])),dot(AB,CB)); % left turns 
    elseif atan2((det([AB;CB])),dot(AB,CB))>0 
    ang{i,1}(ROI,j) = -pi+ atan2((det([AB;CB])),dot(AB,CB)); % right turns
    else 
    ang{i,1}(ROI,j) = atan2((det([AB;CB])),dot(AB,CB)); % no-changes
    end 
    end
     
    end
    ang{i,1}(ROI,:) = abs((ang{i,1}(ROI,:)));                             % smoothed, 2.43 Hz moving filter
%     ang2{i,1}(ROI,:)= (ang{i,1}(ROI,:)-mean(ang{i,1}(ROI,1:149),'omitnan'));
 
end

 
A = nan(5,600);                                                           
MuAng = nan(nROIs,600);                                                          
                                                                                 
for ROI=1:nROIs                                                                  
for i=1:5                                                                        
A(i,:) = (ang{i, 1}(ROI,:));                                                 
end                                                                              
MuAng(ROI,:) = mean(abs(A),1,'omitnan');                                                    
end        

% f1= figure;
% f23.WindowState = 'Maximized';
% f23=tiledlayout(2,3);
% 
% for i=1:5
%     nexttile
%     boundedline(1:size(ang{i,1},2),...
%             mean(abs(ang{i,1}(group1,:)),'omitnan'),...
%             std(abs(ang{i,1}(group1,:)),[],1,'omitnan')./...
%             sqrt(length(group1)),'alpha',...
%             1:size(ang{i,1},2),...
%             mean(abs(ang{i,1}(group2,:)),'omitnan'),...
%             std(abs(ang{i,1}(group2,:)),[],1,'omitnan')./...
%             sqrt(length(group2)),'alpha',...
%             1:size(ang{i,1},2),...
%             mean(abs(ang{i,1}(group3,:)),'omitnan'),...
%             std(abs(ang{i,1}(group3,:)),[],1,'omitnan')./...
%             sqrt(length(group3)),'alpha',...
%             1:size(ang{i,1},2),...
%             mean(abs(ang{i,1}(group4,:)),'omitnan'),...
%             std(abs(ang{i,1}(group4,:)),[],1,'omitnan')./...
%             sqrt(length(group4)),'alpha','cmap',C2) 
%     hold on 
% 
% %     ylim([-.4 .4])
%     hold off
% end 

f24 = figure;
% f24.WindowState = 'Maximized';
f24=tiledlayout(1,1);
% plot (tempMat6{1,2}(17,140:160),tempMat6{1,3}(17,140:160))
% xlim([35 70]), ylim([30 65])
nexttile
for i=1
area([120 120 420 420],[0 30 30 0],'FaceColor',[.8 .8 .8],'FaceAlpha',0.5,'LineStyle','none')
hold on

boundedline(1:size(MuAng,2),...
        mean(MuAng(group3,:),'omitnan'),...
        std(MuAng(group3,:),[],1,'omitnan')./...
        sqrt(length(group3)),'alpha',...
        1:size(MuAng,2),...
        mean(MuAng(group2,:),'omitnan'),...
        std(MuAng(group2,:),[],1,'omitnan')./...
        sqrt(length(group2)),'alpha',...
        1:size(MuAng,2),...
        mean(MuAng(group1,:),'omitnan'),...
        std(MuAng(group1,:),[],1,'omitnan')./...
        sqrt(length(group1)),'alpha',...
        1:size(MuAng,2),...
        mean(MuAng(group4,:),'omitnan'),...
        std(MuAng(group4,:),[],1,'omitnan')./...
        sqrt(length(group4)),'alpha','cmap',C2)        
end
ylim([-.1 .7]);
yticks([0 .5]);
box off

%     
% for f=1:length(formats)
%     if strcmp (fish_name, 'PTZ')
%         saveas(f23,['\\forskning.it.ntnu.no\ntnu\mh-kin\yaksi\Ahmed\Behaviour',...
%             '\Larvae\figures\PTZ\for_Fig2\' 'Fig2_angles_erraticness_raw' formats{1,f}])
%     elseif strcmp (fish_name, 'PTZ_short')
%         saveas(f23,['\\forskning.it.ntnu.no\ntnu\mh-kin\yaksi\Ahmed\Behaviour',...
%             '\Larvae\figures\PTZ_s\for_Fig2\' 'Fig2_angles_erraticness_raw' formats{1,f}])
%     elseif strcmp (fish_name, 'eaat2a')
%         saveas(f23,['\\forskning.it.ntnu.no\ntnu\mh-kin\yaksi\Ahmed\Behaviour',...
%             '\Larvae\figures\Eaat2a\for_Fig2\' 'Fig2_angles_erraticness_raw' formats{1,f}])
%     elseif strcmp (fish_name, 'gabra1')
%         saveas(f23,['\\forskning.it.ntnu.no\ntnu\mh-kin\yaksi\Ahmed\Behaviour',...
%             '\Larvae\figures\gabra1\for_Fig2\' 'Fig2_angles_erraticness_raw' formats{1,f}])
%     elseif strcmp (fish_name, 'scn1lab')
%         saveas(f23,['\\forskning.it.ntnu.no\ntnu\mh-kin\yaksi\Ahmed\Behaviour',...
%             '\Larvae\figures\Scn1lab\for_Fig2\' 'Fig2_angles_erraticness_raw' formats{1,f}])
%     elseif strcmp (fish_name, 'S280F')
%         saveas(f23,['\\forskning.it.ntnu.no\ntnu\mh-kin\yaksi\Ahmed\Behaviour',...
%             '\Larvae\figures\s280f\for_Fig2\' 'Fig2_angles_erraticness_raw' formats{1,f}])
%     end
% end
% 
%     
% for f=1:length(formats)
%     if strcmp (fish_name, 'PTZ')
%         saveas(f24,['\\forskning.it.ntnu.no\ntnu\mh-kin\yaksi\Ahmed\Behaviour',...
%             '\Larvae\figures\PTZ\for_Fig2\' 'Fig2_angles_change' formats{1,f}])
%     elseif strcmp (fish_name, 'PTZ_short')
%         saveas(f24,['\\forskning.it.ntnu.no\ntnu\mh-kin\yaksi\Ahmed\Behaviour',...
%             '\Larvae\figures\PTZ_s\for_Fig2\' 'Fig2_angles_change' formats{1,f}])
%     elseif strcmp (fish_name, 'eaat2a')
%         saveas(f24,['\\forskning.it.ntnu.no\ntnu\mh-kin\yaksi\Ahmed\Behaviour',...
%             '\Larvae\figures\Eaat2a\for_Fig2\' 'Fig2_angles_change' formats{1,f}])
%     elseif strcmp (fish_name, 'gabra1')
%         saveas(f24,['\\forskning.it.ntnu.no\ntnu\mh-kin\yaksi\Ahmed\Behaviour',...
%             '\Larvae\figures\gabra1\for_Fig2\' 'Fig2_angles_change' formats{1,f}])
%     elseif strcmp (fish_name, 'scn1lab')
%         saveas(f24,['\\forskning.it.ntnu.no\ntnu\mh-kin\yaksi\Ahmed\Behaviour',...
%             '\Larvae\figures\Scn1lab\for_Fig2\' 'Fig2_angles_change' formats{1,f}])
%     elseif strcmp (fish_name, 'S280F')
%         saveas(f24,['\\forskning.it.ntnu.no\ntnu\mh-kin\yaksi\Ahmed\Behaviour',...
%             '\Larvae\figures\s280f\for_Fig2\' 'Fig2_angles_change' formats{1,f}])
%     end
% end
