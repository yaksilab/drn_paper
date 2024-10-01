classdef cal_dff_fra_pix
    %CAL_DFF_FRA_PIX - One line description of what the class performs (H1 line)
    %   Optional file header info (to give more details about the function than in the H1 line)
    %   Optional file header info (to give more details about the function than in the H1 line)
    %   Optional file header info (to give more details about the function than in the H1 line)
    %
    %   CAL_DFF_FRA_PIX constructor syntax:
    %       CAL_DFF_FRA_PIX_OBJ = CAL_DFF_FRA_PIX()
    %
    %   CAL_DFF_FRA_PIX properties/attributes:
    %       Property 1 - description
    %       Property 2 - description
    %
    %   CAL_DFF_FRA_PIX methods/functions:
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
    %   Date: 20-Jul-2023; Last revision: 20-Jul-2023
    %
    %   Copyright (c) 2023, Aytac Kadir Mutlu
    %   All rights reserved.


    properties
    end
    
    methods(Static)
        function [dff_fra_pix, dis_pix_pix] = som(piv_pla_fra_pix, log_pla_pix, dow_fac, x_pla_pix, ...
                y_pla_pix, z_pla_pix)
            [~, ~, ~, dis_pix_pix] = ext_xyz_mic(x_pla_pix, y_pla_pix, z_pla_pix, dow_fac);
            con_fil = matfile('\\home.ansatt.ntnu.no\kadiram\Documents\MATLAB\con_esp.mat');
            fun_pla = con_fil.fun_pla;
            fra_rat = con_fil.fra_rat;
            win_len = con_fil.win_len;
            dff_fra_pix = [];
            for pla = fun_pla.raw
                disp(pla)
                piv_fra_pix = piv_pla_fra_pix{pla}(:, log_pla_pix{pla});
                piv_fra_pix = downsample(piv_fra_pix', dow_fac)';
                dff_fra_pix_tem = com_dff_fra_uni(piv_fra_pix, fra_rat.cal.eig, win_len.sli.axo);
                dff_fra_pix = [dff_fra_pix dff_fra_pix_tem];
            end
        end
        %
        function [dff_fra_pix, dis_pix_pix] = axo(piv_pla_fra_pix, dow_fac, x_pla_pix, y_pla_pix, ...
                z_pla_pix)
            [~, ~, ~, dis_pix_pix] = ext_xyz_mic(x_pla_pix, y_pla_pix, z_pla_pix, dow_fac);
            con_fil = matfile('\\home.ansatt.ntnu.no\kadiram\Documents\MATLAB\con_esp.mat');
            fun_pla = con_fil.fun_pla;
            fra_rat = con_fil.fra_rat;
            win_len = con_fil.win_len;
            n_fra = con_fil.n_fra;
            dff_fra_pix = [];
            for pla = fun_pla.raw
                disp(pla)
                piv_fra_pix = piv_pla_fra_pix{pla};
                piv_fra_pix = piv_fra_pix(1:n_fra.cal.ses.eig, :);
                piv_fra_pix = downsample(piv_fra_pix', dow_fac)';
                dff_fra_pix_tem = com_dff_fra_uni(piv_fra_pix, fra_rat.cal.eig, win_len.sli.axo);
                dff_fra_pix = [dff_fra_pix dff_fra_pix_tem];
            end
        end
    end

end
