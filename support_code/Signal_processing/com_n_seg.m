function [n_seg, log_sam_seg] = com_n_seg(amp_sam)
%COM_N_SEG - One line description of what the function or script performs (H1 line)
%   Optional file header info (to give more details about the function than in the H1 line)
%   Optional file header info (to give more details about the function than in the H1 line)
%   Optional file header info (to give more details about the function than in the H1 line)
%
%   Syntax:
%       output = COM_N_SEG(input1, input2)
%       output = COM_N_SEG(input1, input2, input3)
%
%   Description:
%       COM_N_SEG() - description
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
%   Date: 30-Aug-2022; Last revision: 30-Aug-2022
%
%   Copyright (c) 2022, Kadir Mutlu
%   All rights reserved.
log_sam = ~isnan(amp_sam);
ind_num = find(log_sam);
dif_int = diff(ind_num);
log_int = dif_int > 1;
log_sta_num = [true; log_int];
sta_ind_seg = ind_num(log_sta_num);
log_end_num = [log_int; true];
end_ind_seg = ind_num(log_end_num);
n_seg = sum(log_sta_num);
%
n_sam = length(amp_sam);
log_sam_seg = false(n_sam, n_seg);
for i = 1:n_seg
    log_sam_seg(sta_ind_seg(i):end_ind_seg(i), i) = true;
end
end
