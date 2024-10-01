function sav_pla(fil_pat_hab, fil_pat_tel, fil_pat_sav)
%SAV_PLA - One line description of what the function or script performs (H1 line)
%   Optional file header info (to give more details about the function than in the H1 line)
%   Optional file header info (to give more details about the function than in the H1 line)
%   Optional file header info (to give more details about the function than in the H1 line)
%
%   Syntax:
%       output = SAV_PLA(input1, input2)
%       output = SAV_PLA(input1, input2, input3)
%
%   Description:
%       SAV_PLA() - description
%    
%   Inputs:
%       input1 - Description
%       input2 - Description
%       input3 - Description
%
%   Outputs:
%       output1 - Description
%       output2 - Description
%
%   Examples: 
%       Line 1 of example
%       Line 2 of example
%       Line 3 of example
%
%   Other m-files required: none
%   Subfunctions: none
%   MAT-files required: none
%
%   See also: OTHER_FUNCTION_NAME1,  OTHER_FUNCTION_NAME2

%   Author: Kadir Mutlu
%   Address: Olav Kyrres gate 9, 7030 Trondheim, Norway
%   email: kadir.a.mutlu@ntnu.no
%   Website: https://www.ntnu.edu/kavli
%   Date: 18-Jun-2019; Last revision: 18-Jun-2019
%
%   Copyright (c) 2019, Kadir Mutlu
%   All rights reserved.
addpath \\home.ansatt.ntnu.no\kadiram\Documents\MATLAB\Signal_processing

load(fil_pat_hab)
neu_lab_hab = roi_t.neuronLabels;
dff_hab = roi_t.DFF;
fra_rat_two_pho = roi_t.fps;
n_neu_hab = size(dff_hab, 1);

load(fil_pat_tel)
neu_lab_tel = roi_t.neuronLabels;
dff_tel = roi_t.DFF;
log_tel = neu_lab_tel > 0;
hab_mas = n_neu_hab*log_tel;
neu_lab_tel = hab_mas + neu_lab_tel;

lab = neu_lab_hab + neu_lab_tel;
dff = [dff_hab; dff_tel];
tim = com_sam_tim(fra_rat_two_pho, dff(1, :));

save(fil_pat_sav, 'lab', 'dff', 'tim')
end
