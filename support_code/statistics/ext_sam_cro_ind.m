function [sam_cro_ind, n_cro, gro_xsa_ind] = ext_sam_cro_ind(n_sam)
sam_cro_ind = nchoosek(1:n_sam, 2);
n_cro = size(sam_cro_ind, 1);
gro_xsa_ind = mat2cell(sam_cro_ind, ones(1, n_cro));
end
