function all_fish = aj_pdfPosition_AO(all_fish, duration)
%% for the first hour spontaneous activity
nROIs = size(all_fish, 1);
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
            x(t>0 & t<=floor(max(t))),...
            (-y(t>0 & t<=floor(max(t)))),...
            ROI,...
            nROIs);
        all_fish{ROI,1}.positionPD_overall = pdf;
    end
end
%% For novel tank
con_fil = matfile('\\home.ansatt.ntnu.no\kadiram\Documents\MATLAB\con_esp.mat');
len_win = con_fil.len_win;
for ROI=1:nROIs
    t = all_fish{ROI,1}.t;
    x = all_fish{ROI,1}.x;
    y = all_fish{ROI,1}.y;
    stim_times = all_fish{ROI, 1}.timeStampStim(find(~contains(all_fish{ROI, 1}.stimInfo, "VIB_0")));    
    if sum(diff(all_fish{ROI, 1}.y))==0 && sum(diff(all_fish{ROI, 1}.x))==0
        pdf1 = ('No movement - no fish?');
        all_fish{ROI,1}.positionPD1 = pdf1;
    elseif isnan(mean(all_fish{ROI, 1}.y,'omitnan'))...
            && isnan(mean(all_fish{ROI, 1}.x,'omitnan'))
        pdf1 = ('Not detected - no fish?');
        all_fish{ROI,1}.positionPD1 = pdf1;
    else
        novel_pdf = nan([size(all_fish{ROI,1}.positionPD_overall),2]);
        curr_stim_ons = stim_times(1); %%% CHECK IF 20 MIN !!!!!! - not!
        pdf_early = aj_getPDF_20211206(...
            (x(t>60 & t< 60 + floor(len_win.ntt.sec(1)))),...%kadir
            (-y(t>60 & t< 60 + floor(len_win.ntt.sec(1)))),...%kadir
            110,...
            ROI,...
            nROIs);
        close
        pdf_late = aj_getPDF_20211206(...
            (x(t>floor(curr_stim_ons-len_win.ntt.sec(2)) & t<=floor(curr_stim_ons))),...
            (-y(t>floor(curr_stim_ons-len_win.ntt.sec(2)) & t<=floor(curr_stim_ons))),...
            110,...
            ROI,...
            nROIs);
        close; 
        novel_pdf(:,:,1) = pdf_early;
        novel_pdf(:,:,2) = pdf_late;
        
        all_fish{ROI,1}.novelPDF = novel_pdf;
    end
end
%% for each stimulus
for ROI = 1:nROIs
    t = all_fish{ROI,1}.t;
    x = all_fish{ROI,1}.x;
    y = all_fish{ROI,1}.y;
    
    % kadir - fish 117, etc. - not stable - removing last 't'
    if ROI == 117 || ROI == 118 || ROI == 119 || ROI == 120
        t(end) = [];
    end
    
    stim_times = ...
        all_fish{ROI, 1}.timeStampStim(find(~contains(all_fish{ROI, 1}.stimInfo, "VIB_0"))); 
    if sum(diff(all_fish{ROI, 1}.y))==0 && sum(diff(all_fish{ROI, 1}.x))==0
        pdf1 = ('No movement - no fish?');
        all_fish{ROI,1}.positionPD1 = pdf1;
    elseif isnan(mean(all_fish{ROI, 1}.y,'omitnan'))...
            && isnan(mean(all_fish{ROI, 1}.x,'omitnan'))
        pdf1 = ('Not detected - no fish?');
        all_fish{ROI,1}.positionPD1 = pdf1;
    else
        stim_pdf = nan([size(all_fish{ROI,1}.positionPD_overall),2, length(stim_times)]);
        for stim = 1:length(stim_times)
            curr_stim_ons = stim_times(stim);
            pdf_before = aj_getPDF_20211206(...
                (x(t > floor(curr_stim_ons) - duration & t < floor(curr_stim_ons))), ...
                (-y(t >floor(curr_stim_ons) - duration & t < floor(curr_stim_ons))), ...
                110, ROI, nROIs);
            close
            pdf_after = aj_getPDF_20211206(...
                (x(t > floor(curr_stim_ons) & t <= floor(curr_stim_ons) + duration)), ...
                (-y(t> floor(curr_stim_ons) & t <= floor(curr_stim_ons) + duration)), ...
                110, ROI, nROIs);
            close
            stim_pdf(:, :, 1, stim) = pdf_before;
            stim_pdf(:, :, 2, stim) = pdf_after;
        end
        all_fish{ROI, 1}.stimPDF = stim_pdf;
    end
end
%% avg over the stim time compared to base
try
for ROI = 1:nROIs
    if all_fish{ROI, 1}.selected
        t = all_fish{ROI,1}.t;
        x = all_fish{ROI,1}.x;
        y = all_fish{ROI,1}.y;
        
        % kadir - fish 117, etc. - not stable - removing last 't'
        if ROI == 117 || ROI == 118 || ROI == 119 || ROI == 120
            t(end) = [];
        end
        
        stim_times = ...
            all_fish{ROI, 1}.timeStampStim(find(~contains(all_fish{ROI, 1}.stimInfo, "VIB_0"))); 
        stim_types = unique(all_fish{ROI, 1}.stimInfo);
        stim_types = stim_types(2:end); % we are taking out the VIB 0 one 
        stim_types_indice = ...
            all_fish{ROI, 1}.stimInfo(find(~contains(all_fish{ROI, 1}.stimInfo, "VIB_0")));
        % this is now the stimuli times for the specific stimulus 
        if sum(diff(all_fish{ROI, 1}.y))==0 && sum(diff(all_fish{ROI, 1}.x))==0
            pdf1 = ('No movement - no fish?');
            all_fish{ROI,1}.positionPD1 = pdf1;
        elseif isnan(mean(all_fish{ROI, 1}.y,'omitnan'))...
                && isnan(mean(all_fish{ROI, 1}.x,'omitnan'))
            pdf1 = ('Not detected - no fish?');
            all_fish{ROI,1}.positionPD1 = pdf1;
        else
            stim_pdf = nan([size(all_fish{ROI,1}.positionPD_overall),2, length(stim_times)]);
            for stim = 1:length(stim_types)% kadir types!
                curr_stim_type = stim_types_indice == stim_types(stim); 
                curr_stim_ons = stim_times(curr_stim_type);
                bef_duration = 4*60; % 4 min. kadir -entire!
                % now we average over the 4min before the onset
                pdf_before = aj_getPDF_20211206(...
                    (x(t>floor(curr_stim_ons(1))-bef_duration & t<floor(curr_stim_ons(1)))), ...
                    (-y(t>floor(curr_stim_ons(1))-bef_duration & t<floor(curr_stim_ons(1)))), ...
                    110,...
                    ROI,...
                    nROIs);
                after_duration = 11*60; % because we look at each stim plus 1 min extra. kadir -entire!
                pdf_after = aj_getPDF_20211206((x(t>floor(curr_stim_ons(1)) & ...
                    t<=floor(curr_stim_ons(1))+after_duration)), ...
                    (-y(t>floor(curr_stim_ons(1)) & ...
                    t<=floor(curr_stim_ons(1))+after_duration)), ...
                    110,...
                    ROI,...
                    nROIs);
                stim_pdf(:, :, 1, stim) = pdf_before;
                stim_pdf(:, :, 2, stim) = pdf_after;
            end
            all_fish{ROI, 1}.avgstimPDF = stim_pdf;
        end
    else 
        continue
    end
end
catch
end
end
