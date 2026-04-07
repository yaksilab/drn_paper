% Fig4_example_animal - Example-animal analysis and panels for Figure 4
%   Runs the analysis pipeline and generates example-animal panels used
%   in Figure 4 of the manuscript. This script processes one example
%   recording/animal and produces illustrative panels of axonal pixels and
%   tail responses.
%
%   Output:
%       - Example-animal panels saved to disk.

%   Author: Kadir Mutlu
%   Address: Olav Kyrres gate 9, 7030 Trondheim, Norway
%   email: kadir.a.mutlu@ntnu.no
%   Website: https://www.ntnu.edu/kavli
%   Copyright (c) 2019, Kadir Mutlu

%%% Generate the object used throughout the analysis pipeline.
tap = rec_fun.esp228();
%%% Save figure
sav_fig_axo_sin_pix(tap)
