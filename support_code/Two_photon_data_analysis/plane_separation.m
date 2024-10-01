% plane_separation for volumetric imaging using scientifica resonant scanner
% ewelina.bartoszek@ntnu.no
% last edited 2015_05_21

% this program will separate volumetric recording into single planes 
%
% Output: raw data from a single plane, which can be opened in imageJ for
% inspection and further used in the alignment / cell detection algorithms


function plane_separation (folder_path, file_name)

info=ini2struct([folder_path, '\', file_name, '.ini']) %reading parameters from ini file saved together with recording
DimensionTime =str2num(info.x_.no0x2e0x2eof0x2eframes0x2eto0x2eacquire); %n_frames
DimensionX = str2num(info.x_.x0x2epixels); %pixelX
DimensionY = str2num(info.x_.y0x2epixels); %pixelY
n_planes= str2num(info.x_.frames0x2eper0x2ez0x2ecycle); % number of planes
total_number_of_frames = DimensionTime;  % can be changed if you do not want to separate the whole scan but just a part of it


  for plane =  1:n_planes
filename=[folder_path,'\',file_name, '.raw'];
framestoload=floor(total_number_of_frames/n_planes);

fid=fopen(filename, 'r', 'ieee-be');  % open file
fseek(fid,(plane-1)*2*DimensionX*DimensionY, 'bof');  % looks for a first plane to read
   
data=(zeros(DimensionX*DimensionY,framestoload, 'uint16'));

    for fr=1:framestoload
       data(:,fr)=fread(fid,DimensionX*DimensionY,[num2str(DimensionX*DimensionY) '*uint16=>uint16' ],(n_planes-1)*2*DimensionX*DimensionY);   % reads a frame and then skips specified number of frames in order to pick only frames from specific plane
    end


data=reshape(data,[DimensionX DimensionY fr]);  




data= imrotate (data, 90);
display ('saving data...')
multibandwrite(data,[folder_path,'\data_plane',  num2str(plane), '.raw'], 'bsq', 'MACHFMT', 'ieee-be');
display ('data saved...')
clear fid
clear data
  end