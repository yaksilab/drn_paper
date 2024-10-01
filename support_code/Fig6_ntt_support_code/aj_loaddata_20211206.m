function all_fish = aj_loaddata_20211206(conversion_factor, name_file, fish_name, ...
    folder_path_save, n_row_unn)% for one experiment with 6 tanks
all_fish = cell(6,1); %Create cell array to store data
%% Recover the XY position from datascript with perframe and 1sec time bin LIGHTON, LIGHTOFF
delimiter = ',';
formatSpec = '%q%*q%q%q%*q%q%q%*q%q%*q%q%*q%q%*[^\n\r]';
% Read columns of data as text: 17.01.22 AO switched coloumn 2 and 3
%% Open the text file
fileID = fopen(name_file, 'r');
%remember to change from name_file to [folder_path,filesep,filename] when using it for one csv file only
%% Read columns of data according to the format.
% This call is based on the structure of the file used to generate this
% code. If an error occurs for a different file, try regenerating the code
% from the Import Tool.
dataArray = textscan(fileID, formatSpec, 'Delimiter', delimiter, 'TextType', 'string', ...
    'ReturnOnError', false);
%% Close the text file.
fclose(fileID);
%% Recover the data from the dataArray. The first 4 rows are unnecessary
arena1          = str2double(dataArray{1, 3}(n_row_unn:end));       % array telling ID of wells
arena1          = single(arena1);                           % reduce size
arena           = arena1(~isnan(arena1));
time            = double(dataArray{1, 1}(n_row_unn:end));      % time array for x,y position
time1           = time(~isnan(arena1));                     % remove timestamps for stimulus
timeStim        = time(isnan(arena1));                      % extract timestamps for stimulus
timeStim        = timeStim(1:end-1);
posx_temp       = double(dataArray{1, 4}(n_row_unn:end));           % array with X position
if size(posx_temp,1) ~= size(arena1,1)                      % had to add a Nan because the last value was not recorded ... AO April 2022
    posx_temp(end+1,:)       = NaN;
    posx_temp       = posx_temp(~isnan(arena1)); 
else
    posx_temp       = posx_temp(~isnan(arena1));                % remove nan values 
end
posy_temp       = double(dataArray{1, 5}(n_row_unn:end));           % array with Y position
if size(posy_temp,1) ~= size(arena1,1)                      % had to add a Nan because the last value was not recorded ... AO April 2022
    posy_temp(end+1,:)       = NaN;
    posy_temp       = posy_temp(~isnan(arena1));  
else
    posy_temp       = posy_temp(~isnan(arena1));                % remove nan values 
end
%            
deltaDistance   = double(dataArray{1, 7}(n_row_unn:end));
% array with the distance moved since last timestamp

% had to add a Nan because the last value was not recorded ... AO April 2022
if size(deltaDistance,1) ~= size(arena1,1)
    deltaDistance(end+1,:)       = 0;
    deltaDistance   = deltaDistance(~isnan(arena1));    
else
    deltaDistance   = deltaDistance(~isnan(arena1));                  % remove nan values 
end
%
zone            = double(dataArray{1, 6}(n_row_unn:end));           % zone of the arena that the fish is in
if size(zone,1) ~= size(arena1,1)                      % had to add a Nan because the last value was not recorded ... AO April 2022
    zone(end+1,:)       = 0;
    zone            = zone(~isnan(arena1));                     % remove nans
else
    zone            = zone(~isnan(arena1));                     % remove nans
end
segments        = double(dataArray{1, 8}(n_row_unn:end));           % segment of the arena that the fish is in 
if size(segments,1) ~= size(arena1,1)                      % had to add a Nan because the last value was not recorded ... AO April 2022
    segments(end+1,:)       = NaN;
    segments        = segments(~isnan(arena1));                 % remove nans
else
    segments        = segments(~isnan(arena1));                 % remove nans
end
StimInfo        = dataArray{1,2}(n_row_unn:end);                    % extract stimul sinfo
StimInfo        = StimInfo(isnan(arena1));                  % remove nans 
StimInfo(1,1)   = 'VIB_0'; StimInfo = StimInfo(1:end-1);
%% Make array for time
  time1( ~any(time1,2), : )   = [];
  time1                      = unique(time1);
%% organize the data in a matrix
% cell array with posx{:,i} being the x position for arena i, same for y
for i=1:6
    posx{:,i} = posx_temp(arena==i);
    posy{:,i} = posy_temp(arena==i);
    
    for j=1:length(posx{:,i})
        if posx{:,i}(j)==0 && posy{:,i}(j)==0 % do not know if this is correct way to do it, but it removes every (0,0) coordinate. 
           posx{:,i}(j) = nan;
           posy{:,i}(j) = nan;
        end  
    end 
    posx{:,i} = fillmissing(posx{:,i},'previous'); % exchange Nan to previous value
    posy{:,i} = fillmissing(posy{:,i},'previous'); % exchange Nan to previous value
    
    distance{:,i} = deltaDistance(arena==i);
end
%
for i=1:6
    posx{:,i} = fillmissing(posx{:,i},'next'); % exchange Nan to next value
    posy{:,i} = fillmissing(posy{:,i},'next'); % exchange Nan to next value
end
%
clear posx_temp
clear posy_temp
%% cell array where data is stored separately for each fish
for i=1:6
    all_fish{i,1}.name              = fish_name;
    all_fish{i,1}.folder            = folder_path_save;
    all_fish{i,1}.fishNum           = i;
    all_fish{i,1}.x                 = posx{:, i};
    all_fish{i,1}.y                 = posy{:, i};
    all_fish{i,1}.distance          = distance{:, i}.*conversion_factor;%% mm to frame- conversion rate 
    all_fish{i,1}.stimInfo          = StimInfo;
    all_fish{i,1}.t                 = time1;
    all_fish{i,1}.dt                = diff(time1);
    all_fish{i,1}.timeStampStim     = timeStim;
    all_fish{i,1}.zone              = zone;
    all_fish{i,1}.segments          = segments;
end
end
