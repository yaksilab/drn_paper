function sav_roi_t(fil_pat_exp, fil_pat_roi_t)
%SAV_ROI_T - One line description of what the function or script performs (H1 line)
%   Optional file header info (to give more details about the function than in the H1 line)
%   Optional file header info (to give more details about the function than in the H1 line)
%   Optional file header info (to give more details about the function than in the H1 line)
%
%   Syntax:
%       output = SAV_ROI_T(input1, input2)
%       output = SAV_ROI_T(input1, input2, input3)
%
%   Description:
%       SAV_ROI_T() - description
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
addpath \\home.ansatt.ntnu.no\kadiram\Documents\MATLAB\From_Laetitia\step3_baselineComputation
load(fil_pat_exp, 'fis_num', 'fra_rat_two_pho')
load(fil_pat_roi_t)
roi_t.fishNb = fis_num;
roi_t.fps = fra_rat_two_pho; % frame rate of the 2 photon
% compute F0
cfg=[];
cfg.fps=roi_t.fps;
traces=roi_t.traces;
% Sumbre way
cfg.F0method='sumbre'; % 'sumbre' or 'trad' (in small letters)
cfg.tauDecay=2; % seconds, for GCamp6s
F0 = computationF0_LL(traces, cfg);
roi_t.sumbreF0=F0;
roi_t.F0method=cfg.F0method;
%
% 'Traditional' way
% cfg.F0method='trad'; % 'sumbre' or 'trad' (in small letters)
% cfg.F0_start=XXXX; % in frames !
% cfg.F0_end=XXXX; % in frames !
% F0 = computationF0_LL(traces, cfg);
% roi_t.tradF0=F0;
% compute DFF
DFF = ((traces(:,:)-F0)./F0)*100 ;
roi_t.DFF= DFF;
% Save new roi_t
save(fil_pat_roi_t, 'roi_t', '-v7.3')
end
