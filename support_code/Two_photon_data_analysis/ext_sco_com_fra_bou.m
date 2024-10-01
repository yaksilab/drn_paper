function [sco_com_fra_bou, sco_com_fra] = ext_sco_com_fra_bou(bou_ons_bou, sco_fra_com)
con_fil = matfile('\\home.ansatt.ntnu.no\kadiram\Documents\MATLAB\con_esp.mat');
n_com = size(sco_fra_com, 2);
n_fra = con_fil.n_fra;
fra_rat = con_fil.fra_rat;
sco_com_fra_bou = cell(n_com, 1);
sco_com_fra = nan(n_com, n_fra.bou.win);
n_bou = length(bou_ons_bou);
for com_num = 1:n_com
    sco_com_fra_bou{com_num} = nan(n_fra.bou.win, n_bou);
    for bou_num = 1:n_bou
        bou_ons.fra = round(fra_rat.cal.eig*bou_ons_bou(bou_num));
        sco_com_fra_bou{com_num}(:, bou_num) = sco_fra_com(bou_ons.fra - n_fra.hal_bou:bou_ons.fra ...
            + n_fra.hal_bou, com_num);
    end
    sco_com_fra(com_num, :) = mean(sco_com_fra_bou{com_num}, 2, "omitnan");% not smoothed !!!
end
end
