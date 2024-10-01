function [tim, rat, rat_bin] = com_rat_two_std(sta_tim, end_tim, tra, bin_siz, sta_dev, fra_tim)
%COM_RAT - One line description of what the function or script performs (H1 line)
%   Optional file header info (to give more details about the function than in the H1 line)
%   Optional file header info (to give more details about the function than in the H1 line)
%   Optional file header info (to give more details about the function than in the H1 line)
%
%   Syntax:
%       output = COM_RAT(input1, input2)
%       output = COM_RAT(input1, input2, input3)
%
%   Description:
%       COM_RAT() - description
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
%   Date: 13-Mar-2019; Last revision: 13-Mar-2019
%
%   Copyright (c) 2019, Kadir Mutlu
%   All rights reserved.
buf_dur = 10;

[tim, rat_bin] = com_rat_bin(sta_tim, end_tim, tra, bin_siz);
gau_ker = gen_gau_ker_two_std(sta_dev);
rat = conv(rat_bin, gau_ker, 'same');

%
sta_tim = fra_tim(1);
end_tim = fra_tim(end);
ind_int = tim >= sta_tim + buf_dur & tim < end_tim - buf_dur;
tim = tim(ind_int);
rat = rat(ind_int);
rat_bin = rat_bin(ind_int);
end

function gau_ker = gen_gau_ker_two_std(sta_dev)
x = -2*sta_dev:2*sta_dev;
gau_ker = exp(-(x.^2/(2*sta_dev^2))); % y (function) values
gau_ker = gau_ker./sum(gau_ker);
end
