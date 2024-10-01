function cro = com_cro(ind_sam)
n_sam = length(ind_sam);
n_cro = nchoosek(n_sam, 2);
cro = cell(n_cro, 1);
ind_cro_sam = nchoosek(ind_sam, 2);
for i = 1:n_cro
    cro{i} = ind_cro_sam(i, :);
end
end
