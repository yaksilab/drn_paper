function [all_fish]=aj_loaddata_20200202(conversion_factor,timebin,name_file,fish_name,folder_path_save,exp_nr)

all_fish = cell(24,1); %Create cell array to store data

%% Recover the XY position from datascript with perframe and 1sec time bin LIGHTON, LIGHTOFF
delimiter = ',';
formatSpec = '%q%q%q%q%*q%q%q%*q%*q%*q%q%*q%*q%*q%*q%*q%*q%*q%*q%*q%*q%*q%*q%*q%*q%*q%*q%*q%[^\n\r]'; %% Read columns of data as text: 

%% Open the text file.
fileID = fopen([name_file],'r'); %remember to change from name_file to [folder_path,filesep,filename] when using it for one csv file only

%% Read columns of data according to the format.
% This call is based on the structure of the file used to generate this
% code. If an error occurs for a different file, try regenerating the code
% from the Import Tool.
dataArray = textscan(fileID, formatSpec, 'Delimiter', delimiter, 'TextType', 'string',  'ReturnOnError', false);

%% Close the text file.
fclose(fileID);

%% Recover the data from the dataArray. The first 4 rows are unnecessary

time            = double(dataArray{1, 1}(5:end-1));         % time array for x,y position
time2           = dataArray{1, 2}(5:end);                   % timestamp for lights information
date_exp        = dataArray{1,3}(1);                        % date and time of experiment
lightsInfo1     = dataArray{1, 3}(5:end);                   % array telling light on or off
well            = str2double(dataArray{1, 4}(5:end));       % array telling ID of wells
well            = single(well);                             % reduce size
posx_temp       = double(dataArray{1, 5}(5:end));           % array with X position
posy_temp       = double(dataArray{1, 6}(5:end));           % array with Y position
deltaDistance   = double(dataArray{1,7}(5:end));            % array with the distance moved since last timestamp

%% Remove Nan. if the tracking fails it drops to -1, -1
% here i transform -1,-1 into Nan and replace it to the previous value that
% made sense
posx_temp(posx_temp==-1)    = nan;
posy_temp(posy_temp==-1)    = nan;

%% Make array for time
  time( ~any(time,2), : )   = [];
  time                      = unique(time);

%% organize the data in a matrix
% cell array with posx{:,i} being the x position for well i, same for y
for i=1:24
    posx{:,i} = posx_temp(well==i);
    posx{:,i} = fillmissing(posx{:,i},'previous'); % exchange Nan to previous value

    posy{:,i} = posy_temp(well==i);
    posy{:,i} = fillmissing(posy{:,i},'previous'); % exchange Nan to previous value
    
    distance{:,i} = deltaDistance(well==i);
    
end

for i=1:24
    posx{:,i} = fillmissing(posx{:,i},'next'); % exchange Nan to next value
    posy{:,i} = fillmissing(posy{:,i},'next'); % exchange Nan to next value
end

clear posx_temp
clear posy_temp

%% Organize the data in a matrix
% cell array where data is stored separately for each fish

lightsInfo_temp         = horzcat(time2,lightsInfo1);             % makes matrix for the lightsinformation         
lightsInfo_temp(:,1)    = double(lightsInfo_temp(:,1));
lightsInfo_temp         = rmmissing(lightsInfo_temp);

mat = zeros(size(lightsInfo_temp,1),1);
for ii=1:size(lightsInfo_temp,1)
    mat(ii)=strcmp(lightsInfo_temp{ii,2},'LIGHT_ON');%(lightsInfo_temp{ii,2});
end



%% cell array where data is stored separately for each fish

for i=1:24
    all_fish{i,1}.name              = fish_name;
    all_fish{i,1}.date              = date_exp;
    all_fish{i,1}.folder            = folder_path_save;
    all_fish{i,1}.fishNum           = i;
    all_fish{i,1}.x                 = posx{:,i};
    all_fish{i,1}.y                 = posy{:,i};
    all_fish{i,1}.distance          = distance{:,i}.*conversion_factor;
    all_fish{i,1}.timestampLight    = double(lightsInfo_temp(:,1));
    all_fish{i,1}.lightsInfo        = (mat);
    all_fish{i,1}.t                 = time;
    all_fish{i,1}.dt                = diff(time);
end

%% Remove all values outside of well
% [X_fixed,Y_fixed] = eline_correction_arena_20191125_2(posx,posy);
% 
% for i=1:24
%     fish.x_fixed = X_fixed{:,i};
%     fish.y_fixed = Y_fixed{:,i};
%     all_fish{i,1} = fish;
% end

%% save output 
% 
% save([folder_path_save,filesep,fish_name,date_exp '_data.mat'],'all_fish','-v7.3');

