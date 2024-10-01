% tempMat7 = cell (5,3);
% for i=1:size(idxLightsOn,2)/5 
%     tempMat7{i,1} = tempMat6{i,1};
%     tempMat7{i,2} = tempMat6{i,2}([group1, group2, group3, group4, group5],:); % x
%     tempMat7{i,3} = tempMat6{i,3}([group1, group2, group3, group4, group5],:); % y
% end 
% 
% smooth out the noise, moving average of 5 datapoints = 1/6th of a second 
% tempMat8 = cell (5,3);
% for i=1:size(idxLightsOn,2)/5 
%     tempMat8{i,1} = tempMat7{i,1};
%     tempMat8{i,2} = smooth (tempMat7{i,2}([group1, group2, group3, group4, group5],:),5); % x
%     tempMat8{i,3} = smooth (tempMat7{i,3}([group1, group2, group3, group4, group5],:),5); % y
% end

% plot

% f16 = figure;
% f16.WindowState= 'Maximized';
% sgtitle ('Effect of smoothening process')
% subplot (1,2,1),plot (tempMat7{1,2}(1,:),tempMat7{1,3}(1,:),'k', 'LineWidth', 1.5)
% subplot (1,2,2),plot (smooth (tempMat7{1,2}(1,:),10),smooth(tempMat7{1,3}(1,:),10),'r', 'LineWidth', 1.5)
% tempMat7 = cell (5,3);
% for i=1:size(idxLightsOn,2)/5 
%     tempMat7{i,1} = tempMat6{i,1};
%     tempMat7{i,2} = tempMat6{i,2}([group1, group2, group3, group4, group5],:); % x
%     tempMat7{i,3} = tempMat6{i,3}([group1, group2, group3, group4, group5],:); % y
% end 
% 
% smooth out the noise, moving average of 5 datapoints = 1/6th of a second 
% tempMat8 = cell (5,3);
% for i=1:size(idxLightsOn,2)/5 
%     tempMat8{i,1} = tempMat7{i,1};
%     tempMat8{i,2} = smooth (tempMat7{i,2}([group1, group2, group3, group4, group5],:),5); % x
%     tempMat8{i,3} = smooth (tempMat7{i,3}([group1, group2, group3, group4, group5],:),5); % y
% end

% plot

% f16 = figure;
% f16.WindowState= 'Maximized';
% sgtitle ('Effect of smoothening process')
% subplot (1,2,1),plot (tempMat7{1,2}(1,:),tempMat7{1,3}(1,:),'k', 'LineWidth', 1.5)
% subplot (1,2,2),plot (smooth (tempMat7{1,2}(1,:),10),smooth(tempMat7{1,3}(1,:),10),'r', 'LineWidth', 1.5)
