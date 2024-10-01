%SAV_MAS_ALL - One line description of what the script performs (H1 line)
%   Optional file header info (to give more details about the function than in the H1 line)
%   Optional file header info (to give more details about the function than in the H1 line)
%   Optional file header info (to give more details about the function than in the H1 line)
%
%   Description:
%       SAV_MAS_ALL description
%
%   Output:
%       SAV_MAS_ALL output
%
%   Other m-files required: none
%   MAT-files required: none
%
%   See also: OTHER_SCRIPT_NAME,  OTHER_FUNCTION_NAME

%   Author: Kadir Mutlu
%   Address: Olav Kyrres gate 9, 7030 Trondheim, Norway
%   email: kadir.a.mutlu@ntnu.no
%   Website: https://www.ntnu.edu/kavli
%   Date: 22-Apr-2019; Last revision: 22-Apr-2019
%
%   Copyright (c) 2019, Kadir Mutlu

dat_dir = '\\forskning.it.ntnu.no\ntnu\mh-kin\yaksi4\kadiram\Data\Processed\Chris_data\';
fis_fol = {'Fish194\', 'Fish210\', 'Fish211\', 'Fish213\', 'Fish224\', 'Fish233\', 'Fish234\'}; % removed: , 'Fish189\''Fish209\', ---  'Fish185\',
% done: 'Fish156\', 'Fish183\', 'Fish184\', 'Fish187\', 'Fish188\', 'Fish190\', 'Fish191\', 'Fish192\'
% aligned size too small: 'Fish182\', 'Fish193\'
sav_dir = '\\forskning.it.ntnu.no\ntnu\mh-kin\yaksi4\kadiram\Data\Processed\Chris_data\';
fil_nam = 'cro_ali';
fil_nam_mas = 'mas';
ali = 1;

n_fis = length(fis_fol);
%fil_pat = cell(n_fis, 1);
%fil_pat_mas = cell(n_fis, 1);
for i = 1:n_fis
    fis_fol_i = fis_fol{i};
    pat_i = [dat_dir fis_fol_i];
    fil_pat_i = [pat_i fil_nam];
    fil_pat_mas_i = [pat_i fil_nam_mas];
    %fil_pat{i} = fil_pat_i;
    %fil_pat_mas{i} = fil_pat_mas_i;
    
    sav_mas(fil_pat_i, fil_pat_mas_i, ali)
end