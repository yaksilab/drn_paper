function [nor_amp_sam_uni, ave_amp_bas_uni] = com_nor_amp_sam_uni(tim_sam, amp_sam_uni, tim_lim)
%COM_NOR_AMP_SAM - One line description of what the function or script performs (H1 line)
%   Optional file header info (to give more details about the function than in the H1 line)
%   Optional file header info (to give more details about the function than in the H1 line)
%   Optional file header info (to give more details about the function than in the H1 line)
%
%   Syntax:
%       output = COM_NOR_AMP_SAM(input1, input2)
%       output = COM_NOR_AMP_SAM(input1, input2, input3)
%
%   Description:
%       COM_NOR_AMP_SAM() - description
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
%   Date: 04-Jun-2021; Last revision: 04-Jun-2021
%
%   Copyright (c) 2021, Kadir Mutlu
%   All rights reserved.
ave_amp_bas_uni = mean(amp_sam_uni(tim_sam > tim_lim(1) & tim_sam < tim_lim(2), :));
nor_amp_sam_uni = amp_sam_uni - ave_amp_bas_uni;
end
