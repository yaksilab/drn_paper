function amp_poi = fil_yak(amp_poi)
%FIL_YAK - One line description of what the function or script performs (H1 line)
%   Optional file header info (to give more details about the function than in the H1 line)
%   Optional file header info (to give more details about the function than in the H1 line)
%   Optional file header info (to give more details about the function than in the H1 line)
%
%   Syntax:
%       output = FIL_YAK(input1, input2)
%       output = FIL_YAK(input1, input2, input3)
%
%   Description:
%       FIL_YAK() - description
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
%   Date: 08-Dec-2022; Last revision: 08-Dec-2022
%
%   Copyright (c) 2022, Aytac Kadir Mutlu
%   All rights reserved.
butterfilt = 0.1;
[B, A] = butter(4, butterfilt);
amp_poi = filtfilt(B, A, amp_poi);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
changed = 1;
count = 1;
lastpk = 0;
maxcount = 200;
n_poi = length(amp_poi);
StrongSm = 0;
thrup = 30;
while changed==1 && count < maxcount
    [pospeaks, negpeaks] = peakdetect(amp_poi);
    posindex = ones(size(pospeaks));
    negindex = ones(size(negpeaks));
    negindex = negindex*(-1);
    allindex = [posindex; negindex];
    allpeaks = [pospeaks; negpeaks];
    if isempty(allpeaks)
        allpeaks = [1; allpeaks];
        if amp_poi(2) < amp_poi(1)
            allindex = [1; allindex];
        else
            allindex = [-1; allindex];
        end
    end
    if allpeaks(1) > 1
        allpeaks = [1; allpeaks];
        if amp_poi(2) < amp_poi(1)
            allindex = [1; allindex];
        else
            allindex = [-1; allindex];
        end
    end
    if allpeaks(length(allpeaks)) < n_poi
        allpeaks = [allpeaks; n_poi];
        if amp_poi(end) > amp_poi(end - 1)
            allindex = [allindex; 1];
        else
            allindex = [allindex; -1];
        end
    end
    sort(allpeaks, 1);
    allamps = zeros(size(allpeaks));
    for b1 = 2:length(allamps) - 1
        allamps(b1) = (abs(amp_poi(allpeaks(b1)) - amp_poi(allpeaks(b1 - 1))) + ...
            abs(amp_poi(allpeaks(b1)) - amp_poi(allpeaks(b1 + 1))))/2;
    end
    allamps(1) = abs(amp_poi(1) - amp_poi(allpeaks(2)));
    allamps(length(allpeaks)) = abs(amp_poi(end) - amp_poi(allpeaks(end - 1)));
    allamps2 = allamps;
    [Y, allamps2ind] = sort(allamps2);
    allamps2 = Y;
    count2 = 1;
    take = 0;
    while count2 < length(allamps2) && take == 0
        help4 = allamps2ind(count2);
        if StrongSm == 0
            if allamps(help4) < thrup && lastpk ~= allpeaks(help4) && allamps(help4) ~= 0
                take = 1;
            end
        else
            if allamps(help4) < thrup && lastpk ~= allpeaks(help4) && allindex(help4) == 1
                take = 1;
            elseif allindex(help4) == -1
                take = 1;
            end
        end
        count2 = count2 + 1;
    end %2nd while loop
    if take == 1
        if help4 > 1
            if help4 > length(allpeaks)
                stretch = amp_poi(allpeaks(help4 - 1):allpeaks(help4 + 1));
            else
                stretch = amp_poi(allpeaks(help4 - 1):allpeaks(help4));
            end
        else
            stretch = amp_poi(allpeaks(help4):allpeaks(help4 + 1));
        end
        if ~isempty(stretch)
            stretch = itersmooth2(stretch, 3);
        end
        if help4 > 1
            if help4 > length(allpeaks)
                amp_poi(allpeaks(help4 - 1):allpeaks(help4 + 1)) = stretch;
            else
                amp_poi(allpeaks(help4 - 1):allpeaks(help4)) = stretch;
            end
        else
            amp_poi(allpeaks(help4):allpeaks(help4 + 1)) = stretch;
        end
        lastpk = allpeaks(help4);
        changed = 1;
    else
        changed = 0;
    end
    count = count + 1;
end % 1st while loop
pfilt = 100;
if pfilt > 0
    amp_poi = itersmooth2(amp_poi, pfilt);
end
end
