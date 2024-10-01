function results = PositionsandRemoveDoubles(folder_path, iniStruct, ploting, remove, minDist, keyword, ...
    sensory, metadata)
%ADAPTED CODE FROM FLO TO CALCULATE THE POSITIONS OF THE NEURONS IN 3D
% Careful: the scripts of max ends up with a 3D mask of how the planes are
% scanned in the microscope (plane 1 is not actually [plane 1) - also the
% indexes will start from one and continue counting in the next plane

%roi_t : containing your traces
%info : all the information in the ini file
%valveDelay : the delay of your onset response in frames
%duration_resp : the duration of your response in frames
%ploting : 'yes'in case you wanna plot the removed neurons
%remove: 'yes' in case you wanna remove them from the matrix
%minDist : minimum distance you want between your neurons
%alignment_method : roi_t.metadata.Alignment

% folder_path='Z:\Stephanie\volumetric exp scientifica\smh-experiments_NATHALIE\sf20160122\2016_01_22...
% \aligned\fish1_heterozyg\20160122_15_32_41_fish1_heterozyg_AA1'
%put folderpath to the inifile of the raw experiment 

% load('Z:\Stephanie\volumetric exp
% scientifica\smh-experiments_NATHALIE\roi_t\20160122_heterozyg_alltrials.mat'); %name of the results
% info=ini2struct([folder_path, '/20160408_13_58_16_XYT.ini']) %name of the inifile
% keyword = 'zigzag'

filename=dir ([folder_path filesep '*.mat'])
load ([folder_path filesep filename.name])
%
nb_planes = 8; % number of planes in the recording
factor_meter = metadata.voxelSize(1);
dist_z = str2num(iniStruct.total_z_distance_); %in micrometers
nb_oblique_planes=(nb_planes-1);
step_z = dist_z/nb_oblique_planes;

% km: based on n_columns
maxY = size(results.neuronLabels, 2)*factor_meter;  % size of field of view y in micrometers

alpha=asin(step_z/maxY); % angle in radians between horizontal and oblique planes
horiz_plane=sqrt((maxY.^2)+(step_z.^2));
returning_plane=sqrt((horiz_plane.^2)+((7*step_z).^2));
fact=(returning_plane/maxY);
factor_meter_returning_pl=(factor_meter*fact);
maxY_returning_pl=size(results.neuronLabels,2)*factor_meter_returning_pl;
beta=asin((7*step_z)/maxY_returning_pl); % angle in radians between horizontal and returning planes
    
initial_depth = [0 step_z 2*step_z 3*step_z 4*step_z 5*step_z 6*step_z 7*step_z];
final_depth = [step_z 2*step_z 3*step_z 4*step_z 5*step_z 6*step_z 7*step_z 0];
alpha_values=[alpha alpha alpha alpha alpha alpha alpha beta];

maxY_values =[maxY maxY maxY maxY maxY maxY maxY maxY_returning_pl];

factor_meter_values= [factor_meter factor_meter factor_meter factor_meter factor_meter ...
    factor_meter factor_meter factor_meter_returning_pl];
%% calculate positions per plane results.perplane.positions(x,y,z,indexinthemask, planeindex)
for j= 1:size(results.neuronLabels,3)
    if results.planePresent(j)==1;
        planeIndex(j)=j;
    else planeIndex(j)=0;
    end 
end 
planeIndex(planeIndex==0)=[];
nb_planes=planeIndex;
for jj=nb_planes % for each plane
    [x]=[];
    [y]=[];
    z_new=[];
    y_new=[]; 
    index=[];
    pos_index=[];
    if  results.planePresent(1,jj)>0; % is there neurins detected??
        [y,x]=neuron_center(results.neuronLabels(:,:,jj));
        x(isnan(x))=[];
        y(isnan(y))=[];
        x=x*factor_meter; y=y*factor_meter_values(jj); % in micrometers
        
        % km: because sawtooth:
        % taking ratio of depth the same as you are in ypos
        z_new = (y/maxY_values(jj)*(final_depth(jj) - initial_depth(jj))) + initial_depth(jj);
        
        y_new=y*cos(alpha_values(jj));
        index=unique(results.neuronLabels(:,:,jj));
        pos_index=[x' y_new' z_new' index(2:end)];
        plane_nb=jj*ones(size(x'));
        results.perplane(jj).positions=cat(2,pos_index,plane_nb);
    else
        display (['skipplane' num2str(jj)])
    end
end
end
