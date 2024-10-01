function map = gen_asy_col
%GEN_ASY_COL - One line description of what the script performs (H1 line)
%   Optional file header info (to give more details about the function than in the H1 line)
%   Optional file header info (to give more details about the function than in the H1 line)
%   Optional file header info (to give more details about the function than in the H1 line)
%
%   Description:
%       GEN_ASY_COL description
%
%   Output:
%       GEN_ASY_COL output
%
%   Other m-files required: none
%   MAT-files required: none
%
%   See also: OTHER_SCRIPT_NAME,  OTHER_FUNCTION_NAME

%   Author: Aytac Kadir Mutlu
%   Address: Olav Kyrres gate 9, 7030 Trondheim, Norway
%   email: kadir.a.mutlu@ntnu.no
%   Website: https://www.ntnu.edu/kavli
%   Date: 03-Apr-2024; Last revision: 03-Apr-2024
%
%   Copyright (c) 2024, Aytac Kadir Mutlu
n_neg = 85;
n_pos = 2*n_neg;
[map.neg, num,typ, scheme] = brewermap(2*n_neg, "-RdBu");
map.neg = map.neg(1:n_neg, :);
[map.pos, num,typ, scheme] = brewermap(2*n_pos, "-RdBu");
map.pos = map.pos(n_pos + 1:end, :);
map.all = [map.neg; [1 1 1]; map.pos];
map = map.all;
end