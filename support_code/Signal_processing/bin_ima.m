function piv_row_col = bin_ima(piv_row_col, bin_siz)
%BIN_IMA - One line description of what the function or script performs (H1 line)
%   Optional file header info (to give more details about the function than in the H1 line)
%   Optional file header info (to give more details about the function than in the H1 line)
%   Optional file header info (to give more details about the function than in the H1 line)
%
%   Syntax:
%       output = BIN_IMA(input1, input2)
%       output = BIN_IMA(input1, input2, input3)
%
%   Description:
%       BIN_IMA() - description
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
%   Date: 26-Mar-2024; Last revision: 26-Mar-2024
%
%   Copyright (c) 2024, Aytac Kadir Mutlu
%   All rights reserved.
% Get the size of the original image
[rows, cols] = size(piv_row_col);

% Calculate the new size after binning
newRows = floor(rows / bin_siz);
newCols = floor(cols / bin_siz);

% Perform image binning
binnedImage = zeros(newRows, newCols);

for i = 1:newRows
    for j = 1:newCols
        % Average the pixel values within each bin
        binAvg = mean(mean(piv_row_col((i-1)*bin_siz+1:i*bin_siz, (j-1)*bin_siz+1:j*bin_siz), 1), 2);
        binnedImage(i, j) = binAvg;
    end
end
piv_row_col = binnedImage;
end
