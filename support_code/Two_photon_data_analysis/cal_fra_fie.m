classdef cal_fra_fie
    %CAL_FRA_FIE - One line description of what the class performs (H1 line)
    %   Optional file header info (to give more details about the function than in the H1 line)
    %   Optional file header info (to give more details about the function than in the H1 line)
    %   Optional file header info (to give more details about the function than in the H1 line)
    %
    %   CAL_FRA_FIE constructor syntax:
    %       CAL_FRA_FIE_OBJ = CAL_FRA_FIE()
    %
    %   CAL_FRA_FIE properties/attributes:
    %       Property 1 - description
    %       Property 2 - description
    %
    %   CAL_FRA_FIE methods/functions:
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
    %   Date: 24-Apr-2024; Last revision: 24-Apr-2024
    %
    %   Copyright (c) 2024, Aytac Kadir Mutlu
    %   All rights reserved.


    properties
    end
    
    methods(Static)
        function fra_fie = mod(log_uni)
            fra_fie.bou_all = cal_fra_fie.reg(log_uni, 'bou_all');
            fra_fie.lig = cal_fra_fie.reg(log_uni, 'lig');
            fra_fie.sho = cal_fra_fie.reg(log_uni, 'sho');
            fra_fie.tap = cal_fra_fie.reg(log_uni, 'tap');
        end

        function fra_fie = reg(log_uni, sti)
            fra_fie.gab = cal_fra_fie.pop(log_uni, 'gab', sti);
            fra_fie.non = cal_fra_fie.pop(log_uni, 'non', sti);
        end

        function fra_fie = pop(log_uni, typ, sti)
            n_uni = sum(log_uni.(typ).all);
            fra_fie.srt.exc = (sum(log_uni.(typ).all & log_uni.(sti).srt.exc)/n_uni)*100;
            fra_fie.srt.inh = (sum(log_uni.(typ).all & log_uni.(sti).srt.inh)/n_uni)*100;
            fra_fie.srt.non = (sum(log_uni.(typ).all & log_uni.(sti).srt.non)/n_uni)*100;
        end

        function fra_fie = gen(log_fie_fie_uni)
            n_uni = length(log_fie_fie_uni.srt.exc);
            fra_fie.srt.exc = (sum(log_fie_fie_uni.srt.exc)/n_uni)*100;
            fra_fie.srt.inh = (sum(log_fie_fie_uni.srt.inh)/n_uni)*100;
            fra_fie.srt.non = (sum(log_fie_fie_uni.srt.non)/n_uni)*100;
        end
    end

end
