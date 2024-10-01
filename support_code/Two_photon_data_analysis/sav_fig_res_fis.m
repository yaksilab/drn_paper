%SAV_FIG_RES_FIS - One line description of what the script performs (H1 line)
%   Optional file header info (to give more details about the function than in the H1 line)
%   Optional file header info (to give more details about the function than in the H1 line)
%   Optional file header info (to give more details about the function than in the H1 line)
%
%   Description:
%       SAV_FIG_RES_FIS description
%
%   Output:
%       SAV_FIG_RES_FIS output
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
fil_pat_exp = 'X:\kadiram\Data\Raw\KM017\loo\loo.mat';
fil_pat_roi_t = 'X:\kadiram\Data\Processed\KM017\loo\roi_t.mat';
sti = 'all';
fil_pat_fig = 'X:\kadiram\Data\Processed\KM017\loo\neu_res.png';
tit = 'KM017 looming stimulus';
sav_fig_res(fil_pat_exp, fil_pat_roi_t, sti, fil_pat_fig, tit)