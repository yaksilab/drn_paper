% Fig2_example_animal - Example-animal analysis and panels for Figure 2
%   Runs the analysis pipeline and generates example-animal panels used
%   in Figure 2 of the manuscript. This script processes two example
%   recordings/animals and produces the illustrative panels.
%
%   Output:
%       - Example-animal panels saved to disk.

%   Author: Kadir Mutlu
%   Address: Olav Kyrres gate 9, 7030 Trondheim, Norway
%   email: kadir.a.mutlu@ntnu.no
%   Website: https://www.ntnu.edu/kavli
%   Copyright (c) 2019, Kadir Mutlu

%%% Generate the object used throughout the analysis pipeline.
tap = rec_fun.esp246();
%%% Save figure
sav_fig_tai_dff_drn(tap)



%%% Generate the object used throughout the analysis pipeline.
tap = rec_fun.esp249();
%%% Save figure
sav_fig_roi_con_sin(tap)