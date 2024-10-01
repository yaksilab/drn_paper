function all_dir = ext_dir(roo_dir)
%EXT_DIR - One line description of what the function or script performs (H1 line)
%   Optional file header info (to give more details about the function than in the H1 line)
%   Optional file header info (to give more details about the function than in the H1 line)
%   Optional file header info (to give more details about the function than in the H1 line)
%
%   Syntax:
%       output = EXT_DIR(input1, input2)
%       output = EXT_DIR(input1, input2, input3)
%
%   Description:
%       EXT_DIR() - description
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
%   Date: 21-May-2019; Last revision: 21-May-2019
%
%   Copyright (c) 2019, Kadir Mutlu
%   All rights reserved.
% String Adoption
if nargin > 0
    roo_dir = convertStringsToChars(roo_dir);
end

% initialise variables
classsep = '@';  % qualifier for overloaded class directories
packagesep = '+';  % qualifier for overloaded package directories
all_dir = {};           % path to be returned

% Generate path based on given root directory
files = dir(roo_dir);
if isempty(files)
  return
end

% Add d to the path even if it is empty.
all_dir = [all_dir; {roo_dir}];

% set logical vector for subdirectory entries in d
isdir = logical(cat(1,files.isdir));
%
% Recursively descend through directories which are neither
% private nor "class" directories.
%
dirs = files(isdir); % select only directory entries from the current listing

for i=1:length(dirs)
   dirname = dirs(i).name;
   if    ~strcmp( dirname,'.')          && ...
         ~strcmp( dirname,'..')         && ...
         ~strncmp( dirname,classsep,1) && ...
         ~strncmp( dirname,packagesep,1) && ...
         ~strcmp( dirname,'private')
      all_dir = [all_dir; ext_dir(fullfile(roo_dir,dirname))]; % recursive calling of this function.
   end
end

%------------------------------------------------------------------------------

end
