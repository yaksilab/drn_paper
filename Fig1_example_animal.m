% Fig1_example_animal - Example-animal panels for Figure 1
%   Generates example-animal panels used in Figure 1 of the manuscript.
%   This script loads the data for a single example recording/animal and
%   produces illustrative panels of ongoing neural activity.
%
%   Output:
%       - Example-animal panels saved to disk.

%   Author: Kadir Mutlu
%   Address: Olav Kyrres gate 9, 7030 Trondheim, Norway
%   email: kadir.a.mutlu@ntnu.no
%   Website: https://www.ntnu.edu/kavli
%   Copyright (c) 2019, Kadir Mutlu

%%% Generate the object used throughout the analysis pipeline.
tap = rec_fun.esp247();
%%% Save figures
sav_fig_neu_sin(tap)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
sav_fig_ong_cel(tap)
