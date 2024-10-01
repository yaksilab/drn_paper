function [all_fish] = aj_loadFiles_20210320 (source,timebin,folder_path_save,fish_name,conversion_factor,date_exp)

stk_files   = dir(fullfile(source, 'Cag*'));                   % NB! remember to change the name of file


tic
k = 1;
all_fish={};
for i = 1:length(stk_files)
    
    file = dir(fullfile([source,'\', stk_files(i).name],'*.csv'));
    
    parfor j = 1:length(file)
        name_file = [file(j).folder, '\', file(j).name];
        Exp{j,1}=aj_loaddata_20200202(conversion_factor,timebin,name_file,fish_name,folder_path_save);
%         [all_fish((j-1)*24+1:j*24,1)]=aj_loaddata_20200202(conversion_factor,timebin,name_file,fish_name,folder_path_save);
        
    end
    all_fish_temp{k,1} = Exp;
    k = k+1;
end

for m=1:length(all_fish_temp{1,1})
    all_fish((m-1)*24+1:m*24,1) = all_fish_temp{1,1}{m,1};
end 

save([folder_path_save,filesep,fish_name,date_exp '_data.mat'],'all_fish','-v7.3');
toc   

clearvars i j k file stk_files name_file k
