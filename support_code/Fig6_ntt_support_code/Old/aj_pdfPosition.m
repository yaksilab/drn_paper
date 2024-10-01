
function [all_fish] = aj_pdfPosition (all_fish,nROIs,idxStimulus,folder_path_save,fish_name,date_exp,figures_subfolder,group1,group2,name_group1,name_group2)


%% for the first hour spontanious activity
for ROI=1:nROIs
    
    t = all_fish{ROI,1}.t;
    x = all_fish{ROI,1}.x;
    y = all_fish{ROI,1}.y;
    
    if sum(diff(all_fish{ROI, 1}.y))==0 && sum(diff(all_fish{ROI, 1}.x))==0
        pdf1 = ('No movement - no fish?');
        all_fish{ROI,1}.positionPD1 = pdf1;
    elseif isnan(mean(all_fish{ROI, 1}.y,'omitnan'))...
            && isnan(mean(all_fish{ROI, 1}.x,'omitnan'))
        pdf1 = ('Not detected - no fish?');
        all_fish{ROI,1}.positionPD1 = pdf1;
    else
        pdf = aj_getPDF_20211206(...
            (x(t>0 & t<=floor(max(t)))),... %-min(all_fish{ROI,1}.x)
            (-y(t>0 & t<=floor(max(t)))),...% -min(all_fish{ROI,1}.y)
            110,...
            ROI,...
            nROIs);
        all_fish{ROI,1}.positionPD_overall = pdf;
    end
end

%% For the stimulus
% for i=1:length(idxStimulus)
%     for ROI=1:nROIs
%         t = all_fish{ROI,1}.t;
%         timeStim = all_fish{ROI,1}.stimulusTime;
%         
%         if sum(diff(all_fish{ROI, 1}.y))==0 &&...
%                 sum(diff(all_fish{ROI, 1}.x))==0
%             pdf1 = ('No movement - no fish?');
%             all_fish{ROI,1}.positionPD1 = pdf1;
%         elseif isnan(mean(all_fish{ROI, 1}.y,'omitnan'))...
%                 && isnan(mean(all_fish{ROI, 1}.x,'omitnan'))
%             pdf1 = ('Not detected - no fish?');
%             all_fish{ROI,1}.positionPD1 = pdf1;
%         else
%             pdf = aj_getPDF_20211206(...
%                 (all_fish{ROI,1}.x(t>=idxStimulus(ROI,i)*timeStim &...
%                 t<idxStimulus(ROI,i)*timeStim)),... %-min(all_fish{ROI,1}.x)
%                 (all_fish{ROI,1}.y(t>=idxStimulus(ROI,i)*timeStim &...
%                 t<idxStimulus(ROI,i)*timeStim)),...% -min(all_fish{ROI,1}.y)
%                 110,...
%                 ROI,...
%                 nROIs);
%             all_fish{ROI,1}.positionPD_overall = pdf;
%         end
%     end
%     
% end
% 



