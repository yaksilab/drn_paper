function [all_fish]=aj_seizurePoints(nROIs,all_fish,allgroups,fish_name,date_exp,folder_path,folder_path_save)

%% Initialize variables

for ROI=1:size(all_fish,1)
    mat=vertcat(all_fish{ROI, 1}.Turns, all_fish{ROI, 1}.barCodeTresholdSeizure);
    mat1=sum(mat,1);
    
    mat1=mat1>=2;
    mat1=double(mat1);
    nSeizure=sum(mat1);
    index = find([mat1(:,:)] == 1);
    
    %% save in structure
    all_fish{ROI,1}.SeizureBar=mat1;
    all_fish{ROI,1}.nSeizures=nSeizure;
    all_fish{ROI,1}.nBinWSeizure=index;
    
end 

    %% Make plots/ heatmaps of the seizure 
    
    for ROI=1:size(all_fish,1)
    mat2(ROI,:)=(all_fish{ROI,1}.SeizureBar);
    end
    mat2=mat2;
    
%   figure 
%   imagesc(imdilate(mat2,ones(1,40)))    % the data points are smaller than the resolution of the screen, and therefore they wont show up 
                                        % will have to find alternative
                                        % ways of showing the data
  figure();
  for bin=1:size(mat2,1)
      if bin==1
          plot(mat2(bin,:)), hold on
      else 
          plot((mat2(bin,:)+1*(bin-1))), hold on
      end

      box('off')
      yticks([0:23])
      yticklabels({'1','2','3','4','5','6','7','8','9','10','11','12','13','14','15','16','17','18','19','20','21','22','23','24'})
      xticks([])
      xlim([0 size(mat2,2)])
      ylim([0 24])
     
  end 
  
  clear mat2
  %% Plot trajctory of bin and bins adjacent to it for each fish
  %  Animated plot versiion 2020-05-02
  
%     startAnimate=[];
%     endAnimate=[];
%     x_temp=[];
%     y_temp=[];
%   
% for ROI=1:nROIs
%         
%     filenameSeizurePlot = [folder_path_save,'\Animated_line\PTZ5mM_Fish',num2str(ROI),'_binsWSeizure_800.gif'];
%     bins=all_fish{ROI,1}.nBinWSeizure;
%     
%     figure();
% 
%     if isempty(all_fish{ROI,1}.nBinWSeizure)
%         text(0.2,1,'NO TIME BIN FUFILLES THE SEIZURE CRITERIA','Color','r')
%         axis([0 2 0 2])
%     else
%         subplot_size_cols=size(bins,2);
%         
%         for bin=1:size(bins,2)
%             subplot(1,ceil(subplot_size_cols),bin,'align')
% 
%             startAnimate=30*(800-1)+1;
%             endAnimate=30*(800+1);
%     %         numpoints = endAnimate-startAnimate;
%             x_temp =(all_fish{ROI,1}.x(startAnimate:endAnimate));
%             y_temp =(-all_fish{ROI,1}.y(startAnimate:endAnimate));
% 
%             for n = 1:length(x_temp)
%                 plot (x_temp(1:n),y_temp(1:n),'Color','r','LineWidth',1.5)
%                 axis ([min(all_fish{ROI,1}.x) max(all_fish{ROI,1}.x) min(-all_fish{ROI,1}.y) max(-all_fish{ROI,1}.y)])
% %                 title(num2str(bins(bin)))
%                 axis ('square')
%                 yticks([])
%                 xticks([])
%                 drawnow
% 
%                 frame = getframe(figure(ROI));
%                 im = frame2im(frame);
%                 [imind,cm] = rgb2ind(im,256);
% 
%                     if n == 1
%                     imwrite(imind,cm,filenameSeizurePlot,'gif', 'Loopcount',inf);
%                     else
%                     imwrite(imind,cm,filenameSeizurePlot,'gif','WriteMode','append');
%                     end
%                 hold off 
%             end
%         end 
%     end
%     hold off
% end 



  
  
  
  
  
  
  
  
    