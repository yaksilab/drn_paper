function hax = adj_hax(hax, fon_siz, mar_siz, log_lin_wid)
%ADJ_HAX - One line description of what the function or script performs (H1 line)
%   Optional file header info (to give more details about the function than in the H1 line)
%   Optional file header info (to give more details about the function than in the H1 line)
%   Optional file header info (to give more details about the function than in the H1 line)
%
%   Syntax:
%       output = ADJ_HAX(input1, input2)
%       output = ADJ_HAX(input1, input2, input3)
%
%   Description:
%       ADJ_HAX() - description
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

%   Author: Aytac Kadir Mutlu
%   Address: Olav Kyrres gate 9, 7030 Trondheim, Norway
%   email: kadir.a.mutlu@ntnu.no
%   Website: https://www.ntnu.edu/kavli
%   Date: 07-Dec-2022; Last revision: 07-Dec-2022
%
%   Copyright (c) 2022, Aytac Kadir Mutlu
%   All rights reserved.
con_fil = matfile('\\home.ansatt.ntnu.no\kadiram\Documents\MATLAB\con_esp.mat');

% fon_siz = con_fil.fon_siz;
% fon_siz = fon_siz.pub;
%fon_siz = fon_siz.pre;

mar_siz_con = con_fil.mar_siz;
%mar_siz = mar_siz_con.pub;

hax.FontSize = fon_siz;
lin_wid = con_fil.lin_wid;
hax.LineWidth = lin_wid.one;
n_chi = length(hax.Children);
for i = 1:n_chi
    if isprop(hax.Children(i), 'LineWidth') && log_lin_wid
        hax.Children(i).LineWidth = lin_wid.one;
    end
    
    if isprop(hax.Children(i), 'FontSize')
        hax.Children(i).FontSize = fon_siz;
    end

    if isprop(hax.Children(i), 'MarkerSize')
        hax.Children(i).MarkerSize = mar_siz_con.pub;
    end

    if isprop(hax.Children(i), 'SizeData')
        hax.Children(i).SizeData = mar_siz;
    end
end
end
