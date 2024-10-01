%SAV_PLA_FIS - One line description of what the script performs (H1 line)
%   Optional file header info (to give more details about the function than in the H1 line)
%   Optional file header info (to give more details about the function than in the H1 line)
%   Optional file header info (to give more details about the function than in the H1 line)
%
%   Description:
%       SAV_PLA_FIS description
%
%   Output:
%       SAV_PLA_FIS output
%
%   Other m-files required: none
%   MAT-files required: none
%
%   See also: OTHER_SCRIPT_NAME,  OTHER_FUNCTION_NAME

%   Author: Kadir Mutlu
%   Address: Olav Kyrres gate 9, 7030 Trondheim, Norway
%   email: kadir.a.mutlu@ntnu.no
%   Website: https://www.ntnu.edu/kavli
%   Date: 19-Jun-2019; Last revision: 19-Jun-2019
%
%   Copyright (c) 2019, Kadir Mutlu
fil_pat_hab = 'X:\kadiram\Data\Raw\KM017\loo\2019_06_12\20190612_12_34_30_KM017_loo_2\aligned\celldetection_hab\celldetection_plane1\roi_t.mat';
fil_pat_tel = 'X:\kadiram\Data\Raw\KM017\loo\2019_06_12\20190612_12_34_30_KM017_loo_2\aligned\celldetection_tel\celldetection_plane1\roi_t.mat';
fil_pat_sav = 'X:\kadiram\Data\Processed\KM017\loo\roi_t.mat';
sav_pla(fil_pat_hab, fil_pat_tel, fil_pat_sav)