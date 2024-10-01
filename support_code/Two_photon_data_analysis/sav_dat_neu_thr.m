function sav_dat_neu_thr(fil_pat_dat, fil_pat_exp, bas_dur, res_dur, ref_dur, fil_pat_met, fil_pat_sav)
%SAV_DAT_NEU - One line description of what the function or script performs (H1 line)
%   Optional file header info (to give more details about the function than in the H1 line)
%   Optional file header info (to give more details about the function than in the H1 line)
%   Optional file header info (to give more details about the function than in the H1 line)
%
%   Syntax:
%       output = SAV_DAT_NEU(input1, input2)
%       output = SAV_DAT_NEU(input1, input2, input3)
%
%   Description:
%       SAV_DAT_NEU() - description
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
%   Date: 26-Jun-2019; Last revision: 26-Jun-2019
%
%   Copyright (c) 2019, Kadir Mutlu
%   All rights reserved.
load(fil_pat_exp)
load(fil_pat_met)
obj = matfile(fil_pat_dat);

fra_rat = round(1/metadata.timeStep);
n_fra_ref = round(fra_rat*ref_dur);
n_fra_bas = round(fra_rat*bas_dur);
n_fra_res = round(fra_rat*res_dur);
n_tri = length(sti_ons);
dff_row_col_tri = nan(metadata.dim(1), metadata.dim(2), n_tri);
for i = 1:n_tri
    sti_ons_i = sti_ons(i);
    sti_ons_i_fra = round(fra_rat*sti_ons_i);
    fra_num_bas_i = sti_ons_i_fra - n_fra_bas:sti_ons_i_fra;
    fra_num_res_i = sti_ons_i_fra:sti_ons_i_fra + n_fra_res;
    fra_bas_i = obj.im(:, :, fra_num_bas_i);
    fra_res_i = obj.im(:, :, fra_num_res_i);
    ima_bas_i = mean(fra_bas_i, 3);
    ima_res_i = mean(fra_res_i, 3);
    
    if i == 1
        fra_num_ref = sti_ons_i_fra - n_fra_ref:sti_ons_i_fra;
        fra_ref = obj.im(:, :, fra_num_ref);
        ima_ref = mean(fra_ref, 3);
    end

    dff_i = ((ima_res_i - ima_bas_i)./ima_bas_i)*100;
    dff_i = gaussian_filt(dff_i, 5, 1);
    dff_row_col_tri(:, :, i) = dff_i;
end

ima_fir_one = dff_row_col_tri(:, :, 1);
ima_ave_one = mean(dff_row_col_tri(:, :, 1:6), 3);
ima_fir_two = dff_row_col_tri(:, :, 7);
ima_ave_two = mean(dff_row_col_tri(:, :, 7:12), 3);
ima_fir_thr = dff_row_col_tri(:, :, 13);
ima_ave_thr = mean(dff_row_col_tri(:, :, 13:18), 3);

ima_fir = cat(3, ima_fir_one, ima_fir_two, ima_fir_thr);
ima_ave = cat(3, ima_ave_one, ima_ave_two, ima_ave_thr);

save(fil_pat_sav, 'ima_ref', 'dff_row_col_tri', 'ima_fir', 'ima_ave')
end
