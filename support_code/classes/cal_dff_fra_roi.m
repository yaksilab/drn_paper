classdef cal_dff_fra_roi
    %CAL_DFF_FRA_ROI - One line description of what the class performs (H1 line)
    %   Optional file header info (to give more details about the function than in the H1 line)
    %   Optional file header info (to give more details about the function than in the H1 line)
    %   Optional file header info (to give more details about the function than in the H1 line)
    %
    %   CAL_DFF_FRA_ROI constructor syntax:
    %       CAL_DFF_FRA_ROI_OBJ = CAL_DFF_FRA_ROI()
    %
    %   CAL_DFF_FRA_ROI properties/attributes:
    %       Property 1 - description
    %       Property 2 - description
    %
    %   CAL_DFF_FRA_ROI methods/functions:
    %       Method 1 - description
    %       Method 2 - description
    %
    %   Examples: 
    %       Line 1 of example
    %       Line 2 of example
    %       Line 3 of example
    %
    %   Other m-files required: none
    %   MAT-files required: none
    %
    %   See also: OTHER_CLASS_NAME1,  OTHER_CLASS_NAME2

    %   Author: Aytac Kadir Mutlu
    %   Address: Olav Kyrres gate 9, 7030 Trondheim, Norway
    %   email: kadir.a.mutlu@ntnu.no
    %   Website: https://www.ntnu.edu/kavli
    %   Date: 06-Dec-2022; Last revision: 06-Dec-2022
    %
    %   Copyright (c) 2022, Aytac Kadir Mutlu
    %   All rights reserved.


    properties
    end
    
    methods(Static)
        function dff_fra_roi = sli(fra_rat, piv_fra_roi)
        MovingWdw = 80;% s
        wdw = round(fra_rat*MovingWdw);
        [n_fra, n_cel] = size(piv_fra_roi);
        bas_fra_cel = nan(n_fra, n_cel);
        las_fra_com = n_fra - wdw;
        parfor i = 1:n_cel
            bas_sli_fra_i = bas_fra_cel(:, i);
            f_fra_i = piv_fra_roi(:, i);
            for j = wdw + 1:las_fra_com % sliding wdw. Start at i = wdw + 1 and compute before.
                bas_sli_fra_i(j) = mean(f_fra_i(j - wdw:j + wdw), 'omitnan');% 160 s!
            end
            % beginning and end
            bas_sli_fra_i(1:wdw) = bas_sli_fra_i(wdw + 1);
            bas_sli_fra_i(las_fra_com + 1:n_fra) = bas_sli_fra_i(las_fra_com);
            % fill up
            % the gap left by removing the 2 windows, with first and last elements
            bas_fra_cel(:, i) = runline(bas_sli_fra_i, wdw, 1); % linear regression
            % to smooth
        end
        dff_fra_roi = ((piv_fra_roi - bas_fra_cel)./bas_fra_cel)*100;
        %
        dff_fra_roi(isnan(dff_fra_roi)) = 0;
        end
    end

end
