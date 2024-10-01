function [cro, n_sam] = ext_cro(ind_sam)
n_sam = length(ind_sam);
ind_sam_ori = 1:n_sam;
[~, loc_sam] = ismember(ind_sam_ori, ind_sam);
cro = com_cro(loc_sam);
end
