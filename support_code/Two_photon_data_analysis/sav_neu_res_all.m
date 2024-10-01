%SAV_NEU_RES_FIS - One line description of what the script performs (H1 line)
%   Optional file header info (to give more details about the function than in the H1 line)
%   Optional file header info (to give more details about the function than in the H1 line)
%   Optional file header info (to give more details about the function than in the H1 line)
%
%   Description:
%       SAV_NEU_RES_FIS description
%
%   Output:
%       SAV_NEU_RES_FIS output
%
%   Other m-files required: none
%   MAT-files required: none
%
%   See also: OTHER_SCRIPT_NAME,  OTHER_FUNCTION_NAME

%   Author: Kadir Mutlu
%   Address: Olav Kyrres gate 9, 7030 Trondheim, Norway
%   email: kadir.a.mutlu@ntnu.no
%   Website: https://www.ntnu.edu/kavli
%   Date: 22-May-2019; Last revision: 22-May-2019
%
%   Copyright (c) 2019, Kadir Mutlu
ani = 'KM013';
sti_ons = [1.5 4.5 7.5 10.5 13.5 16.5]' + 5/60;
sti_dur = [5 1.65 3.3 4.9 6.5 8 11.39]';
bas_dur = 3;
pos_sti_dur = 0;
sti = {'Light', 'Looming 1.65 s', 'Looming 3.3 s', 'Looming 4.9 s', 'Looming 6.5 s', 'Looming 8 s', 'Sound'};
sav_neu_res_fis(ani, sti_ons, sti_dur, bas_dur, pos_sti_dur, sti)

ani = 'KM014';
sti_ons = [1.5 4.5 7.5 10.5 13.5 16.5]' + 5/60;
sti_dur = [5 1.65 3.3 4.9 6.5 8 11.39]';
bas_dur = 3;
pos_sti_dur = 0;
sti = {'Light', 'Looming 1.65 s', 'Looming 3.3 s', 'Looming 4.9 s', 'Looming 6.5 s', 'Looming 8 s', 'Sound'};
sav_neu_res_fis(ani, sti_ons, sti_dur, bas_dur, pos_sti_dur, sti)