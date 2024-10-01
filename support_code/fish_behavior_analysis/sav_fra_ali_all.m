%SAV_HEA_RAT - One line description of what the script performs (H1 line)
%   Optional file header info (to give more details about the function than in the H1 line)
%   Optional file header info (to give more details about the function than in the H1 line)
%   Optional file header info (to give more details about the function than in the H1 line)
%
%   Description:
%       SAV_HEA_RAT description
%
%   Output:
%       SAV_HEA_RAT output
%
%   Other m-files required: none
%   MAT-files required: none
%
%   See also: OTHER_SCRIPT_NAME,  OTHER_FUNCTION_NAME

%   Author: Kadir Mutlu
%   Address: Olav Kyrres gate 9, 7030 Trondheim, Norway
%   email: kadir.a.mutlu@ntnu.no
%   Website: https://www.ntnu.edu/kavli
%   Date: 15-Apr-2019; Last revision: 15-Apr-2019
%
%   Copyright (c) 2019, Kadir Mutlu

dat_dir = '\\forskning.it.ntnu.no\ntnu\mh-kin\yaksi4\kadiram\Data\Processed\Chris_data\';
fis_fol = {'Fish156\', 'Fish182\', 'Fish183\', 'Fish184\', 'Fish187\', 'Fish188\', 'Fish190\', 'Fish191\', 'Fish192\', 'Fish193\', ...
    'Fish194\', 'Fish210\', 'Fish211\', 'Fish213\', 'Fish224\', 'Fish233\', 'Fish234\'}; % removed: , 'Fish189\''Fish209\', ---  'Fish185\',
pat = '';
car = '*.mat';
sav_dir = '\\forskning.it.ntnu.no\ntnu\mh-kin\yaksi4\kadiram\Data\Processed\Chris_data\';
fil_nam = 'cro_ali';

n_fis = length(fis_fol);
fil_pat = cell(n_fis, 1);
for i = 1:n_fis
    fis_fol_i = fis_fol{i};
    pat_i = [dat_dir fis_fol_i pat];
    pat_car_i = [pat_i car];
    con_i = dir(pat_car_i);
    fil_pat_i = [pat_i con_i(1).name];
    fil_pat{i} = fil_pat_i;
end

parfor i = 1:n_fis
    fis_fol_i = fis_fol{i};
    fil_pat_i = fil_pat{i};
    
    sav_dir_i = [sav_dir fis_fol_i];
    sav_pat_i = [sav_dir_i fil_nam];
    sav_fra_ali(fil_pat_i, sav_pat_i)
end