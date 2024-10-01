function [off_non, sep, mou, ext_hei] = adj_sig(y_lim_pre, hax, off_non, sep, mou, ext_hei)
y_lim = hax.YLim;
y_ran = range(y_lim);
y_ran_pre = range(y_lim_pre);
y_rat = y_ran_pre/y_ran;
off_non = y_rat*off_non;
sep = y_rat*sep;
mou = y_rat*mou;
ext_hei = y_rat*ext_hei;
end